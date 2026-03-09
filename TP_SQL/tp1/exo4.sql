set SERVEROUTPUT ON;
ACCEPT code_frs PROMPT 'Entrer le code du fournisseur :';
DECLARE
  v_num_f frs.Num_f%TYPE := '&code_frs';
BEGIN

  UPDATE article 
  SET article.prix_achat = article.prix_achat - (article.prix_achat*0.10) 
  WHERE article.num_f = v_num_f;

  if(SQL%FOUND) THEN
    DBMS_OUTPUT.PUT_LINE( SQL%ROWCOUNT || 'article(s) modifié avec une réduction de 10%');
  else 
    DBMS_OUTPUT.PUT_LINE('Aucun produit modifié fournisseur inconnu ');
  end if;
END;
/