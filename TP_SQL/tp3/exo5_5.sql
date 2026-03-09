SET SERVEROUTPUT ON;
DECLARE
    v_chiffre FLOAT;
BEGIN
    v_chiffre := chiffre_affaires_fournisseur('F4');
    DBMS_OUTPUT.PUT_LINE('RAPPORT  Fournisseur F4');
    DBMS_OUTPUT.PUT_LINE('Revenue total : '||v_chiffre||'DH');
END;
/