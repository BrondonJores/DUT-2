SET SERVEROUTPUT ON;
ACCEPT p_des_ville PROMPT 'Entrer le nom de la ville ';

DECLARE
    v_nom_f frs.nom%TYPE;
    v_des_ville frs.ville%TYPE := '&p_des_ville';

BEGIN

    SELECT nom into v_nom_f
    FROM frs
    WHERE frs.ville = v_des_ville;
    DBMS_OUTPUT.PUT_LINE('Fournisseur trouvé '||v_nom_f);

EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Trop de fournisseurs trouvé dans la ville de '||v_des_ville);
    
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('Aucun fournisseur trouvé dans la table');
END;

/