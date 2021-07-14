-- Pl/SQL functions

-- function to calculate total sales by year
CREATE OR REPLACE FUNCTION get_total_sales (in_year PLS_INTEGER)
RETURN NUMBER 
IS
    l_total_sales NUMBER := 0;
BEGIN
    --get total sales
    SELECT SUM(unit_price * quantity) INTO l_total_sales FROM order_items
        INNER JOIN orders USING (order_id)
        WHERE status='Shipped'
        GROUP BY EXTRACT(YEAR FROM order_date) 
        HAVING EXTRACT(YEAR FROM order_date) = in_year;
    
    --return total sales
    RETURN l_total_sales;
END;