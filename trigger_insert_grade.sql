DROP TRIGGER IF EXISTS average_grade;
DELIMITER \\
CREATE TRIGGER average_grade
AFTER INSERT ON ocena
FOR EACH ROW
BEGIN
	calculate_average_grade(NEW.id_produkt);
END \\
DELIMITER ;
