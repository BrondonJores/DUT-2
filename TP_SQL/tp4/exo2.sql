 CREATE OR REPLACE TRIGGER trg_before_vente
BEFORE INSERT OR UPDATE ON Vente  
FOR EACH ROW
DECLARE
  v_prix_achat Article.prix_achat%TYPE;
BEGIN
  -- Vérifier que la quantité est supérieure à 0
  IF :NEW.qte <= 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'La quantité doit être supérieure à 0.');
  END IF;
  -- Récupérer le prix d'achat de l'article
  SELECT prix_achat INTO v_prix_achat
  FROM Article
  WHERE num_a = :NEW.num_a;
  -- Vérifier que le prix de vente n'est pas inférieur au prix d'achat
  IF :NEW.prix_vente < v_prix_achat THEN
    RAISE_APPLICATION_ERROR(-20002, 'Le prix de vente ne peut pas être inférieur au prix d''achat.');
  END IF;
END;