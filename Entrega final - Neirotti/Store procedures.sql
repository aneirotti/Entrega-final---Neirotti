-- Store procedures--

DELIMITER //
CREATE PROCEDURE sp_registrar_pago(
    IN id_artista INT,
    IN id_grupo INT,
    IN fecha_pago DATE,
    IN monto DECIMAL(10,2)
)
BEGIN
	INSERT INTO mensualidad (id_artista, id_grupo, estado, fecha_pago, monto) 
	VALUES (id_artista, id_grupo, 'pago', fecha_pago, monto);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_inscribir_artista(
    IN nombre VARCHAR(100),
    IN telefono VARCHAR(15),
    IN mail VARCHAR(100),
    IN fecha_inicio DATE,
    IN id_grupo INT
)
BEGIN
DECLARE cupo_actual INT;
    SELECT cupo_disponible INTO cupo_actual 
    FROM grupo 
    WHERE grupo.id_grupo = id_grupo;   
IF cupo_actual > 0 THEN
	INSERT INTO artista (nombre, telefono, mail, fecha_inicio, id_grupo) 
	VALUES (nombre, telefono, mail, fecha_inicio, id_grupo);       
UPDATE grupo 
SET cupo_disponible = cupo_disponible - 1 
WHERE grupo.id_grupo = id_grupo;
ELSE
	SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'No hay cupos disponibles en este grupo';
END IF;
END //
DELIMITER ;
