SET SERVEROUTPUT ON;

DECLARE
    CURSOR stock_article(p_num_a Article.num_a%TYPE) IS
        SELECT stock 
        FROM article 
        WHERE article.num_a = p_num_a;

    v_stock Article.stock%TYPE;
    v_qte vente.qte%TYPE := 30;
    v_num_a article.NUM_A%TYPE := 'A1';

BEGIN
    OPEN stock_article(v_num_a);
    FETCH stock_article INTO v_stock;
    if(v_qte>v_stock) THEN
        DBMS_OUTPUT.PUT_LINE('Erreur vente impossible :'||v_qte||'>'||v_stock);
    ELSE
        INSERT INTO Vente values ('C1', v_num_a, 'M3', v_qte, 15, TO_DATE('25/10/2023'));
        UPDATE article set stock = (v_stock - v_qte) WHERE NUM_A = v_num_a;
        if(SQL%FOUND) THEN 
            DBMS_OUTPUT.PUT_LINE('Vente effectuée avec succès');
        END IF;
        COMMIT;
    END IF;
END;
/