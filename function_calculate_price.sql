DROP FUNCTION IF EXISTS calculate_price;

DELIMITER \\

CREATE FUNCTION calculate_price (invoice_id INT)
RETURNS DECIMAL(8,2)
BEGIN
	RETURN (
		SELECT SUM(p.cena)
		FROM postavka p
		WHERE p.id_racun = invoice_id);
END; \\

DELIMITER ;