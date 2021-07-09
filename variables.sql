SET SERVEROUTPUT ON;

-- Declaration of Vars
DECLARE 
    l_business_partner VARCHAR2(200) := 'Distributor';
    l_leader VARCHAR2(100);
BEGIN
    l_leader := l_business_partner;
    DBMS_OUTPUT.PUT_LINE(l_leader);
END;

-- Anchor Vars
DECLARE 
    l_customer_name customers.name%TYPE;
    l_credit_limit customers.credit_limit%TYPE;
BEGIN
    SELECT name, credit_limit INTO l_customer_name, l_credit_limit FROM customers WHERE customer_id=38;
    DBMS_OUTPUT.PUT_LINE(l_customer_name || ':'  || l_credit_limit);
END;


