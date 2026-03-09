SET SERVEROUTPUT ON;


CREATE OR REPLACE FUNCTION generer_rapport_ventes (
    date_debut IN vente.DAT%TYPE,  date_fin IN vente.DAT%TYPE
    ) return v_result 
    IS
        v_revenue_total FLOAT := 0;
        v_nombre_ventes NUMBER := 0;
    BEGIN

    SELECT COUNT(*) INTO v_nombre_ventes
    FROM vente
    WHERE vente.DAT BETWEEN date_debut AND date_fin;

    SELECT SUM(qte * prix_vente) INTO v_revenue_total
    FROM vente
    WHERE vente.DAT BETWEEN date_debut AND date_fin;

    RETURN v_result(v_revenue_total, v_nombre_ventes);

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN v_result(0,0);
END generer_rapport_ventes;


/