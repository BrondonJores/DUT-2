CREATE OR REPLACE TRIGGER trg_verif_stock
BEFORE INSERT ON Vente
FOR EACH ROW
DECLARE
  v_stock_actuel Stock.quantite_disponible%TYPE;      
  v_stock_seuil CONSTANT NUMBER := 5; -- Seuil critique du stock
BEGIN
  -- Récupérer le stock actuel pour l'article vendu
  SELECT quantite_disponible INTO v_stock_actuel
  FROM Stock
  WHERE num_a = :NEW.num_a;
  -- Vérifier si le stock est suffisant et au-dessus du seuil
  IF v_stock_actuel < :NEW.qte THEN
    -- Lever une erreur si la quantité demandée dépasse le stock disponible
    RAISE_APPLICATION_ERROR(-20001, 'Erreur : Stock insuffisant pour l''article ' || :NEW.num_a || '.');
  ELSIF (v_stock_actuel - :NEW.qte) < v_stock_seuil THEN
    -- Lever une erreur si le stock tombe sous le seuil critique
    RAISE_APPLICATION_ERROR(-20002, 'Erreur : Vente non autorisée. Stock critique pour l''article ' || :NEW.num_a || '.');
  ELSE
    -- Mettre à jour le stock si toutes les conditions sont remplies
    UPDATE Stock
    SET quantite_disponible = quantite_disponible - :NEW.qte
    WHERE num_a = :NEW.num_a;
  END IF;
END;
/