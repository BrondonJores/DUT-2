SET SERVEROUTPUT ON;

DECLARE
    v_qte_vendue NUMBER := 15;
    v_stock_disponible NUMBER := 10;
BEGIN
    IF v_qte_vendue > v_stock_disponible THEN
        RAISE_APPLICATION_ERROR(-20021, 'Erreur : Quantité vendue dépasse le stock disponible.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Vente effectuée avec succès.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur détectée : ' || SQLERRM);
END;
/