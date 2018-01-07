DROP FUNCTION IF EXISTS calculate_average_grade;

DELIMITER \\

CREATE FUNCTION calculate_average_grade (product_id INT)
RETURNS DECIMAL(3,1)
BEGIN
	RETURN (
		SELECT AVG(o.ocena)
		FROM ocena o
		WHERE o.id_produkt = product_id);
END \\

DELIMITER ;
