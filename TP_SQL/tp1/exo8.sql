SET SERVEROUTPUT ON;
ACCEPT Dat PROMPT 'Entrer la date :';

DECLARE 
    CURSOR total_ventes(v_Dat vente.Dat%TYPE) IS
        SELECT sum(qte*prix_vente) 
        FROM vente
        WHERE Dat = v_Dat
        GROUP BY vente.NUM_M;
    v_Date vente.Dat%TYPE := '&Dat';
    v_total vente.prix_vente%TYPE;
BEGIN
    OPEN total_ventes(v_Date);
    FETCH total_ventes into v_total;
    DBMS_OUTPUT.PUT_LINE('Le '||v_Date||', le total des ventes étaient de ' || v_total);
END;
/