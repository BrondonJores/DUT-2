SET SERVEROUTPUT ON;
ACCEPT p_num_c PROMPT 'Numéro du client';
DECLARE
  CURSOR article_cursor(Num_c client.num_c%TYPE) IS
    SELECT des, vente.qte, vente.dat
    FROM article, vente
    WHERE vente.num_a = article.num_a
      AND vente.num_c = Num_c;

  CURSOR client_cursor IS
    SELECT num_c
    FROM client;

  v_numc client.num_c%TYPE := '&p_num_c';
  v_qte vente.qte%TYPE;
  v_dat vente.dat%TYPE;
  v_des article.des%TYPE;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Liste des achats du client ' || v_numc);

    OPEN article_cursor(v_numc);
    LOOP
      FETCH article_cursor INTO v_des, v_qte, v_dat;
      EXIT WHEN article_cursor%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('Description : ' || v_des || ', Quantité : ' || v_qte || ', Date : ' || v_dat);
    END LOOP;
    CLOSE article_cursor;

END;
/
