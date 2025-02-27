-- Funciones personalizadas --

DELIMITER //
CREATE FUNCTION fn_compras_mes(anio INT, mes INT) -- VER LO DE LA ENIE--
RETURNS DECIMAL(10,2) 
READS SQL DATA
BEGIN
DECLARE total_costo DECIMAL(10,2);
	SELECT SUM(costo_unitario * cantidad) 
	INTO total_costo
	FROM compra
	WHERE YEAR(fecha_compra) = anio AND MONTH(fecha_compra) = mes;
RETURN total_costo;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION fn_cantidad_alumnos(id_grupo INT) 
RETURNS INT 
READS SQL DATA
BEGIN
DECLARE cantidad_grupo INT;
    SELECT COUNT(*) INTO cantidad_grupo 
    FROM artista 
    WHERE artista.Id_grupo = id_grupo;
RETURN cantidad_grupo;
END //
DELIMITER ;
