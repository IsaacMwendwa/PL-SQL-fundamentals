-- returning one or more result sets from stored procedures using implicit statement results

-- returning a single result set: customers whose creditis above a given credit
CREATE OR REPLACE PROCEDURE get_customer_by_credit (min_credit NUMBER)
AS c_customers SYS_REFCURSOR;
BEGIN
    -- open the cursor
    OPEN c_customers FOR
        SELECT customer_id, credit_limit, name FROM customers WHERE credit_limit > min_credit
        ORDER BY credit_limit;
    --return the result set
    DBMS_SQL.RETURN_RESULT(c_customers);
END;


-- execute procedure
EXEC get_customer_by_credit(4000);


-- Returning multiple result sets

-- procedure that returns customer result set by pages specified by no. and size
-- also returns total rows of customers table
CREATE OR REPLACE PROCEDURE get_customers( page_no NUMBER, page_size NUMBER)
AS
    c_customers SYS_REFCURSOR;
    c_total_row SYS_REFCURSOR;
BEGIN
    -- return the total row of customers
    OPEN c_total_row FOR
        SELECT COUNT(*) FROM CUSTOMERS;
    
    DBMS_SQL.RETURN_RESULT(c_total_row);
    
    -- return the customers
    OPEN c_customers FOR
        SELECT customer_id, name FROM customers ORDER BY name
            OFFSET page_size*(page_no -1) ROWS
            FETCH NEXT page_size ROWS ONLY;
    
    DBMS_SQL.RETURN_RESULT(c_customers);
    
END;

-- execute procedure
EXEC get_customers(1,10);
        