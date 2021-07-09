SET SERVEROUTPUT ON;
BEGIN
    dbms_output.put_line('Hello World!');
END;

DECLARE
    l_message VARCHAR2(255) := 'Hello World 2!';
BEGIN 
    DBMS_OUTPUT.PUT_LINE(l_message);
END;

DECLARE 
    v_result NUMBER;
BEGIN 
    v_result :=  1 / 0;
    EXCEPTION 
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
    