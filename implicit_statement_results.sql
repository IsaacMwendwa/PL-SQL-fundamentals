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
