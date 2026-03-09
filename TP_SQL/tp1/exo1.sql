SET SERVEROUTPUT ON;

DECLARE
    v_num_c client.Num_c%TYPE;
    v_montant_total FLOAT;

BEGIN
  
  FOR v_num_c IN (SELECT num_c FROM client) LOOP
    SELECT sum(vente.qte*vente.prix_vente) into v_montant_total
    FROM vente
    WHERE vente.num_c = v_num_c.num_c;
    EXIT WHEN SQL%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Dépense du client '|| v_num_c.num_c ||' : '||v_montant_total||'DH');
  END LOOP;


END;
/
