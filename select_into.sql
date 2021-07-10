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
DECLARE
  l_customer_name customers.name%TYPE;
  l_contact_first_name contacts.first_name%TYPE;
  l_contact_last_name contacts.last_name%TYPE;
BEGIN
  -- get customer and contact names
  SELECT
    name, 
    first_name, 
    last_name
  INTO
    l_customer_name, 
    l_contact_first_name, 
    l_contact_last_name
  FROM
    customers
  INNER JOIN contacts USING( customer_id )
  WHERE
    customer_id = 100;
  -- show the information  
  dbms_output.put_line( 
    'Customer Name: ' || l_customer_name || ', Contact Person: ' ||
    l_contact_first_name || ' ' || l_contact_last_name );
END;