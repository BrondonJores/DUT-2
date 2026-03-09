SET SERVEROUTPUT ON;


CREATE OR REPLACE FUNCTION marge_beneficaire_article (
    p_num_f IN frs.num_f%TYPE
    ) return t_result_marge 
    IS
        resultat t_result_marge := t_result_marge();
        v_num_a article.num_a%TYPE ;
        v_marge FLOAT := 0.0;
        v_prix_vente vente.prix_vente%TYPE;
        v_prix_achat article.prix_achat%TYPE;
        CURSOR cursor_article IS
            SELECT num_a, prix_achat
            FROM article 
            WHERE article.num_f = p_num_f;
    BEGIN
    OPEN cursor_article;
    LOOP
        FETCH cursor_article INTO v_num_a, v_prix_achat;
        EXIT WHEN cursor_article%NOTFOUND;
        SELECT AVG(prix_vente) into v_prix_vente
        FROM vente
        WHERE vente.num_a = v_num_a; 
        v_marge := v_prix_vente - v_prix_achat;
        resultat.EXTEND;
        resultat(resultat.COUNT) := v_result_marge(v_num_a, v_marge);
    END LOOP;
    RETURN resultat;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Aucun article vendu');
END marge_beneficaire_article;


/