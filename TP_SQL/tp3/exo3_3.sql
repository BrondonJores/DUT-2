SET SERVEROUTPUT ON;
DECLARE
    result v_result;
BEGIN
    result := generer_rapport_ventes(TO_DATE('04/02/28'), TO_DATE('12/10/30'));
    DBMS_OUTPUT.PUT_LINE('RAPPORT PERIODE '||TO_DATE('04/02/08')||' - ' ||TO_DATE('12/10/10'));
    DBMS_OUTPUT.PUT_LINE('Revenue total : '||result.v_revenue_total || 'DH - Nombre de ventes :' || result.v_nombre_ventes);
END;
/