-- Handling other exceptions using SQLCODE and SQLERRM
-- Example 1
SET SERVEROUTPUT ON;
DECLARE
    l_msg VARCHAR2(255);
    r_customer customers%rowtype;
BEGIN
    SELECT * INTO r_customer FROM customers;
    
    EXCEPTION 
        WHEN OTHERS THEN
        l_msg := SQLERRM;  
        dbms_output.put_line(l_msg);
END;

-- Example 2
DECLARE
    l_first_name  contacts.first_name%TYPE := 'Flor';
    l_last_name   contacts.last_name%TYPE := 'Stone';
    l_email       contacts.email%TYPE := 'flor.stone@raytheon.com';
    l_phone       contacts.phone%TYPE := '+1 317 123 4105';
    l_customer_id contacts.customer_id%TYPE := -1;
BEGIN
    -- insert a new contact
    INSERT INTO contacts(first_name, last_name, email, phone, customer_id)
    VALUES(l_first_name, l_last_name, l_email, l_phone, l_customer_id);
    
    EXCEPTION 
        WHEN OTHERS THEN
            DECLARE
                l_error PLS_INTEGER := SQLCODE;
                l_msg VARCHAR2(255) := SQLERRM;
            BEGIN
                CASE l_error 
                WHEN -1 THEN
                    -- duplicate email
                    dbms_output.put_line('duplicate email found ' || l_email);
                    dbms_output.put_line(l_msg);
                    
                WHEN -2291 THEN
                    -- parent key not found
                    dbms_output.put_line('Invalid customer id ' || l_customer_id);
                    dbms_output.put_line(l_msg);
                END CASE;
                -- reraise the current exception
                RAISE;
            END;
            
END;

