-- Selecting one column
DECLARE
    l_customer_name customers.name%TYPE;
BEGIN
    SELECT name INTO l_customer_name
    FROM customers
    WHERE customer_id = 100;
    DBMS_OUTPUT.PUT_LINE(l_customer_name);
END;

-- Selecting complete row
DECLARE
    r_customer customers%ROWTYPE;
BEGIN
    SELECT * INTO r_customer
    FROM customers
    WHERE customer_id = 100;
    DBMS_OUTPUT.PUT_LINE('Customer name: ' || r_customer.name || ' Website: ' || r_customer.website);
END;

-- Selecting into multiple vars
