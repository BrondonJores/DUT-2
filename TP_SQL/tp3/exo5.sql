SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION chiffre_affaires_fournisseur (
    p_num_f IN frs.num_f%TYPE
    ) return FLOAT
    IS
        v_montant FLOAT :=0;
        v_chiffre_affaire FLOAT :=0;
        CURSOR cursor_ventes(p_num_a article.num_a%TYPE) IS
            SELECT NVL(SUM(qte*prix_vente),0)
            FROM vente
            WHERE vente.num_a = p_num_a;
    BEGIN
    
    FOR artc IN ( SELECT num_a FROM article WHERE num_f = p_num_f) LOOP
        OPEN cursor_ventes(artc.num_a);
        FETCH cursor_ventes INTO v_montant;
        v_chiffre_affaire:= v_chiffre_affaire + v_montant;
        CLOSE cursor_ventes;
    END LOOP;
    
    if(v_chiffre_affaire = 0) OR (v_chiffre_affaire is NULL) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Ce fournisseur n a vendu aucun article pour le moment');
    ELSE
        RETURN v_chiffre_affaire;
    END IF;

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END chiffre_affaires_fournisseur;


/