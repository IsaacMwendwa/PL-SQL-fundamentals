SET SERVEROUTPUT ON;

-- User-defined exception
DECLARE
    e_credit_too_high EXCEPTION;
    PRAGMA exception_init( e_credit_too_high, -20001 );
    l_max_credit customers.credit_limit%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
    l_credit customers.credit_limit%TYPE := &credit_limit;
BEGIN
    -- get the meax credit limit
    SELECT MAX(credit_limit) 
    INTO l_max_credit
    FROM customers;
    
    -- check if input credit is greater than the max credit
    IF l_credit > l_max_credit THEN 
        RAISE e_credit_too_high;
    END IF;
    
    -- if not, update credit limit
    UPDATE customers 
    SET credit_limit = l_credit
    WHERE customer_id = l_customer_id;
    
    COMMIT;
END;

-- internally defined exception
DECLARE
    l_cu