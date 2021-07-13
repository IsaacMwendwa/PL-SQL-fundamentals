SET SERVEROUTPUT ON;

-- Create view returning sales revenues by customers
CREATE VIEW sales AS
    SELECT customer_id, SUM(unit_price * quantity) total,
        ROUND(SUM(unit_price * quantity) * 0.05) credit
    FROM order_items INNER JOIN orders USING (order_id)
    WHERE status = 'Shipped'
    GROUP BY customer_id;

SELECT * FROM SALES;

/* create anonymous block that
-- resets credit limits of all customers to zero
-- fetches customers sorted by sales in descending ordern & gives them new credit limits from a budget of 1million
*/

DECLARE
    l_budget NUMBER := 1000000;
    
    --cursor
    CURSOR c_sales IS SELECT * FROM sales ORDER BY total DESC;
    
    --record
    r_sales c_sales%ROWTYPE;
BEGIN 
    -- reset all credit limits
    UPDATE customers SET credit_limit = 0;
    
    OPEN c_sales;
    LOOP
        FETCH  c_sales INTO r_sales;
        EXIT WHEN c_sales%NOTFOUND; --no rows remaining
        
        --update credit for current customer
        UPDATE customers SET credit_limit =
            CASE WHEN l_budget > r_sales.credit THEN r_sales.credit 
                ELSE l_budget
            END
            WHERE customer_id = r_sales.customer_id;
            
        -- reduce the budget for credit limit
        l_budget := l_budget - r_sales.credit;
        
        DBMS_OUTPUT.PUT_LINE('Custommer id: ' || r_sales.customer_id || ' Credit: ' || r_sales.credit ||
            ' Remaining budget: ' || l_budget);
        
        -- check the budget
        EXIT WHEN l_budget <=0;
    END LOOP;
    CLOSE c_sales;
END;

--Verify update
SELECT customer_id, name, credit_limit FROM customers ORDER BY credit_limit DESC;
SELECT SUM(CREDIT_LIMIT) FROM customers;