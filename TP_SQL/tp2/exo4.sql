SET SERVEROUTPUT ON;
ACCEPT a_num_c PROMPT 'Numéro de client';
DECLARE
    CURSOR Depense_client(p_num_c client.Num_c%TYPE) IS
        SELECT prix_vente*qte 
        FROM vente
        WHERE vente.Num_c = p_num_c;

    v_depense_c FLOAT := 0;
    v_depense_t FLOAT := 0;
    v_num_c client.Num_c%TYPE := '&a_num_c';
BEGIN
    OPEN Depense_client(v_num_c);
    LOOP 
        FETCH Depense_client into v_depense_c;
        EXIT WHEN Depense_client%NOTFOUND;

        v_depense_t := v_depense_t+v_depense_c;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Les dépenses du client '|| v_num_c ||' sont de '|| v_depense_t ||'DH' );

EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('Le client '||v_num_c||' n a effectué aucune vente');
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Division par zéro impossible ');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : ' || SQLERRM);
END;
/