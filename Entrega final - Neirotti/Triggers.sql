-- Triggers --

DELIMITER //
CREATE TRIGGER verificar_pago_mensualidad
BEFORE INSERT ON mensualidad
FOR EACH ROW
BEGIN
DECLARE pago_existente INT;

SELECT COUNT(*) INTO pago_existente
FROM mensualidad
WHERE mensualidad.id_artista = id_artista
AND month(fecha_pago) = month(fecha_pago)
AND year(fecha_pago) = year(fecha_pago);

IF pago_existente > 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Este artista tiene un pago registrado para este mes';
END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER actualizar_stock
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
    -- Aumentamos el stock del material en base a la cantidad comprada
    UPDATE material
    SET stock = stock + new.cantidad
    WHERE material.id_material = new.id_material;
END //
DELIMITER ;