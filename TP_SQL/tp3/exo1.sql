SET SERVEROUTPUT ON;


CREATE OR REPLACE FUNCTION calculer_stock_restant (
    p_num_article IN Article.num_a%TYPE
    ) RETURN NUMBER IS
    v_stock NUMBER;
    BEGIN
    -- Requête pour récupérer le stock
    SELECT STOCK INTO v_stock
    FROM Article
    WHERE num_a = p_num_article;

    RETURN v_stock;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Retourne NULL si l'article n'existe pas
        RETURN NULL;
END calculer_stock_restant;


/