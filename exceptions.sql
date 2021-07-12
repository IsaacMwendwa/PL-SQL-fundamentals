-- NO_DATA_FOUND exception
DECLARE 
    l_name customers.name%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
BEGIN
    -- get customer name by id
    SELECT name INTO l_name FROM customers WHERE customer_id = l_customer_id;
    
    -- display customer name
    DBMS_OUTPUT.PUT_LINE('Customer name is: ' || l_name);
END;

DECLARE
    l_name customers.NAME%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
BEGIN
    -- get the customer name by id
    SELECT name INTO l_name
    FROM customers
    WHERE customer_id = l_customer_id;

    -- show the customer name   
    dbms_output.put_line('Customer name is ' || l_name);
    
END;
/
