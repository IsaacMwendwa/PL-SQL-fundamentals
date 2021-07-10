-- PL/SQL has three records -> table-based, cursor-based, programmer-defined

-- table-based, from contacts table
DECLARE 
    r_contact contacts%ROWTYPE;
BEGIN
    SELECT first_name, last_name, phone
    INTO r_contact
    FROM contacts WHERE contact_id = 100;
    DBMS_OUTPUT.PUT_LINE(r_contact.first);
END;
    
-- Cursor-based
DECLARE
    CURSOR c_contacts IS
        SELECT first_name, last_name, phone FROM contacts;
    r_contact c_contacts%ROWTYPE;
BEGIN
    NULL;
END;
    
-- Programmer-defined
DECLARE
    -- Define record type
    TYPE r_customer_contact_t IS RECORD(
        customer_name customers.name%TYPE,
        first_name contacts.first_name%TYPE,
        last_name contacts.last_name%TYPE
    );
    -- Declare record
    r_customer_contacts r_customer_contact_t;
BEGIN
    NULL;
END;
        