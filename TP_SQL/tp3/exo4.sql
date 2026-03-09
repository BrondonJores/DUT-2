SET SERVEROUTPUT ON;


CREATE OR REPLACE FUNCTION rapport_article_fournisseur (
    p_num_f IN frs.num_f%TYPE
    ) return t_result 
    IS
        resultat t_result := t_result();
    BEGIN
    
    FOR artc IN (
        SELECT v.num_a, SUM(v.qte) AS qte_vendue
        FROM vente v, article a
        WHERE (a.num_f = p_num_f) AND ( v.num_a = a.num_a)
        GROUP BY v.num_a
        ORDER BY qte_vendue DESC
        FETCH FIRST 3 ROWS ONLY
    ) LOOP
        resultat.EXTEND;
        resultat(resultat.COUNT) := v_result_article(artc.num_a, artc.qte_vendue);
    END LOOP;
    
 
    RETURN resultat;

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN t_result();
END rapport_article_fournisseur;


/