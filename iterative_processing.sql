SET SERVEROUTPUT ON;

-- Basic Loop
DECLARE 
    l_counter NUMBER := 0;
BEGIN
    LOOP
        l_counter := l_counter + 1;
        IF l_counter > 5 THEN 
            EXIT;
        END IF;
        DBMS_OUTPUT.PUT_LINE(l_counter);
    END LOOP;
END;

-- FOR LOOP
BEGIN
    FOR l_counter IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(l_counter);
    END LOOP;
END;

-- REVERSE FOR LOOP
BEGIN 
    FOR l_counter IN REVERSE 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(l_counter);
    END LOOP;
END;


-- WHILE LOOP
DECLARE
    l_counter NUMBER := 1;
BEGIN
    WHILE l_counter <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE('Counter: ' || l_counter);
        l_counter := l_counter + 1;
        EXIT WHEN l_counter = 3;
    END LOOP;
END;

-- Continue















