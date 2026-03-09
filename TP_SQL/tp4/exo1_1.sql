SET SERVEROUTPUT ON;

    BEGIN
        INSERT INTO vente (Num_c, Num_a, Num_m, qte, prix_vente, dat) values ('C1', 'A1', 'M1', 0, 5, TO_DATE('14/11/25'));
        COMMIT;
    END;
/