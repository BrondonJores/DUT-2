SET SERVEROUTPUT ON;


CREATE OR REPLACE FUNCTION rapport_article_fournisseur_sub (
    p_num_f IN frs.num_f%TYPE
    ) return t_result 
    IS
        resultat t_result := t_result();
    BEGIN
    
    FOR artc IN (
        SELECT *
        FROM (
            SELECT a.num_a, NVL(SUM(v.qte),0) AS qte_vendue
            FROM article a, vente v
            WHERE (a.num_f = p_num_f) AND ( v.num_a = a.num_a)
            GROUP BY a.num_a
            ORDER BY qte_vendue DESC
        ) sub
        WHERE ROWNUM <= 3
    ) LOOP
        resultat.EXTEND;
        resultat(resultat.COUNT) := v_result_article(artc.num_a, artc.qte_vendue);
    END LOOP;

    RETURN resultat;

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN t_result();
END rapport_article_fournisseur_sub;


/