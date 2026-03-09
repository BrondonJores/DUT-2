SET SERVEROUTPUT ON;

DECLARE
    v_stock2 NUMBER;

BEGIN
    v_stock2 := calculer_stock_restant('A0');
    
    IF v_stock2 IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Article inexistant ');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Le stock restant de l article est de '|| v_stock2);
    END IF;

END;
/
