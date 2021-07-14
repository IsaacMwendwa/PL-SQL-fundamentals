-- procedure to print customer's contact info

CREATE OR REPLACE PROCEDURE print_contact( p_customer_id NUMBER)
IS r_contact contacts%ROWTYPE;

BEGIN
    -- get contaact based on customer id
    SELECT * INTO r_contact FROM contacts WHERE customer_id = p_customer_id;
    
    -- print contacts info
    DBMS_OUTPUT.PUT_LINE( r_contact.first_name || ' ' || r_contact.last_name || '<' || r_contact.email || '>' );
    
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE( SQLERRM);
END;