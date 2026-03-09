SET SERVEROUTPUT ON;

DECLARE
    
    CURSOR ventes_cursor IS
        SELECT vente.num_c, sum(vente.qte)
        FROM vente
        GROUP BY vente.num_c;

    v_nom client.nom%TYPE;
    v_num_c vente.Num_c%TYPE;
    v_qte vente.qte%TYPE;

BEGIN
  OPEN ventes_cursor;
  LOOP
    FETCH ventes_cursor INTO v_num_c, v_qte;
    EXIT WHEN ventes_cursor%NOTFOUND;
    SELECT nom into v_nom
    FROM client
    WHERE client.num_c = v_num_c;
    DBMS_OUTPUT.PUT_LINE('Num_c : ' || v_num_c || ', Nom: ' || v_nom || ', Quantité totale d achat :'|| v_qte);
    
  END LOOP;
  CLOSE ventes_cursor;
END;
/
