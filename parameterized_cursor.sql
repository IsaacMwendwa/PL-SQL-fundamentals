SET SERVEROUTPUT ON;

--use parameterized cursor to show difference results
DECLARE 
    r_product products%ROWTYPE;
    CURSOR c_product(low_price NUMBER, high_price NUMBER) IS
    SELECT * FROM products WHERE list_price
    BETWEEN low_price and high_price;

BEGIN 
    --show mass products
    dbms_output.put_line('Mass products: ');
    OPEN c_product(50,100);
    LOOP
       FETCH c_product INTO r_product;
       EXIT WHEN c_product%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE(r_product.product_name || ':' || r_product.list_price);
    END LOOP;
    CLOSE c_product;
    
    -- show luxury products
    dbms_output.put_line('Luxury products: ');
    OPEN c_product(800,1000);
    LOOP
        FETCH c_product INTO r_product;
        EXIT WHEN c_product%notfound;
        dbms_output.put_line(r_product.product_name || ': ' ||r_product.list_price);
    END LOOP;
    CLOSE c_product;
END;