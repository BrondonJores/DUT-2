SET SERVEROUTPUT ON;

DECLARE
    v_stock2 NUMBER;

BEGIN
    inserer_client('C4', 'Test', 'Maroc', 'Sale');
    COMMIT;
END;
/
