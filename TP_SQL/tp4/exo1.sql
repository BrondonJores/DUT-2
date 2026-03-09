SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER validation_vente 
    BEFORE INSERT ON vente 
    FOR EACH ROW 
    BEGIN
        IF (:NEW.QTE<=0) THEN
            RAISE_APPLICATION_ERROR('-20002', 'Vente impossible, prix de vente inférieur au prix d achat ou quantité invalide');
        END IF;
    END; 
/