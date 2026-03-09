SET SERVEROUTPUT ON;
DECLARE
    mes_articles t_result;
BEGIN
    mes_articles := rapport_article_fournisseur_sub('F2');

    FOR i IN 1..mes_articles.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Article: ' || mes_articles(i).v_num_a ||', Qantité vendue: ' || mes_articles(i).v_qte_vendue);
    END LOOP;
END;
/