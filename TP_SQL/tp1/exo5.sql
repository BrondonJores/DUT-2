SET SERVEROUTPUT ON;
ACCEPT num_a_attendu PROMPT 'Entrer la date :';

DECLARE
  CURSOR article_cursor(v_Num_a article.Num_a%TYPE) IS
    SELECT num_f,des, num_a
    FROM article
    WHERE article.num_a = v_Num_a; 

  v_res article.NUM_A%TYPE := '&num_a_attendu';
  v_num_a article.Num_a%TYPE;
  v_des article.des%TYPE;
  v_num_f frs.Num_f%TYPE;
  v_nom_f frs.Nom%TYPE;
BEGIN
  OPEN article_cursor(v_res);
  LOOP
    FETCH article_cursor into v_num_f, v_des, v_num_a;
    EXIT WHEN article_cursor%NOTFOUND;
   
    SELECT nom into v_nom_f
    FROM frs 
    WHERE num_f = v_num_f;

    DBMS_OUTPUT.PUT_LINE('Numero article : '|| v_num_a ||', Designation : '|| v_des ||', Fournisseur : '|| v_nom_f);
  END LOOP;

  CLOSE article_cursor;
END;
/