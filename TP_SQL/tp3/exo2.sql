SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE inserer_client (
  p_num_client IN Client.num_c%TYPE,
  p_nom IN Client.nom%TYPE,
  p_pays IN Client.pays%TYPE,
  p_ville IN Client.ville%TYPE
) IS
  v_existe NUMBER;
BEGIN
  -- Vérifier si le client existe déjà
  SELECT COUNT(*) INTO v_existe
  FROM Client
  WHERE num_c = p_num_client;

  IF v_existe > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Erreur : Ce client existe déjà.');
  ELSE
    -- Insertion du nouveau client
    INSERT INTO Client (num_c, nom, pays, ville)
    VALUES (p_num_client, p_nom, p_pays, p_ville);
    DBMS_OUTPUT.PUT_LINE('Client inséré avec succès.');
  END IF;
END inserer_client;

/