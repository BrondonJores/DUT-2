SET SERVEROUTPUT ON;
DECLARE
    mes_marges t_result_marge;
BEGIN
    mes_marges := marge_beneficaire_article('F3');

    FOR i IN 1..mes_marges.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Article: ' || mes_marges(i).v_num_a ||', Marge: ' || mes_marges(i).v_marge||'DH');
    END LOOP;
END;
/