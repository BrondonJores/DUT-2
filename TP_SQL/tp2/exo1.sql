SET SERVEROUTPUT ON;

ACCEPT p_num_a PROMPT 'Entrer le numéro d article';

DECLARE 
    v_nom_a article.des%TYPE;
    v_num_a article.num_a%TYPE := '&p_num_a';

BEGIN 
    SELECT des into v_nom_a
    FROM article
    WHERE article.num_a = v_num_a;

    DBMS_OUTPUT.PUT_LINE('Article '||v_nom_a||' trouvé');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Aucun article trouvé dans la table');
END;
/