DROP TRIGGER IF EXISTS insert_price;
DELIMITER \\
CREATE TRIGGER insert_price
BEFORE INSERT ON postavka
FOR EACH ROW
BEGIN
	DECLARE vCena DECIMAL(8,2);
    
	SELECT cena INTO vCena
	FROM cenik
	WHERE NEW.id_produkt = cenik.id_produkt
	ORDER BY cenik.veljavno_do DESC
	LIMIT 1;
    
	SET NEW.cena = vCena;
END \\
DELIMITER ;