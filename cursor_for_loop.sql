SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_product IS
        SELECT product_name, list_price FROM products ORDER BY list_price DESC;
BEGIN
    FOR r_product IN c_product
        LOOP
            DBMS_OUTPUT.PUT_LINE(r_product.product_name || ': $' || r_product.list_price);
        END LOOP;
END;