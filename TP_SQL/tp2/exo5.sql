SET SERVEROUTPUT ON;

DECLARE
    v_qte NUMBER := 20;
    v_prix_vente NUMBER := 600;
    v_montant_total NUMBER;

BEGIN
    v_montant_total := v_qte * v_prix_vente;
    IF v_montant_total > 10000 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erreur : Montant de la vente dépasse la limite autorisée.');

    ELSE
        DBMS_OUTPUT.PUT_LINE('Vente enregistrée avec succès.');
    END IF;
EXCEPTION

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur détectée : ' || SQLERRM);
END;
/