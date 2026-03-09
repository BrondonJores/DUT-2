SET SERVEROUTPUT ON;

DECLARE
    CURSOR chiffre_affaire(p_num_m magasin.num_m%TYPE) IS
        SELECT sum(qte*prix_vente)
        FROM vente
        WHERE vente.num_m = p_num_m;
    
    v_num_m magasin.num_m%TYPE:= 'M2';
    v_montant FLOAT;

BEGIN
    OPEN chiffre_affaire(v_num_m);
    FETCH chiffre_affaire INTO v_montant;
    DBMS_OUTPUT.PUT_LINE('Le chiffre d affaire du magasin n: '||v_num_m||' est '|| v_montant||'DH');
END;
/