-- Transacciones --

START TRANSACTION;
INSERT INTO compra (id_proveedor, id_material, id_faltante, fecha_compra, unidad_medida, costo_unitario, cantidad) 
VALUES (2, 5, 3, '2025-03-01', 'kg', 12.50, 10);
UPDATE material 
SET stock = stock + 10 
WHERE id_material = 5;
COMMIT;

START TRANSACTION;
UPDATE mensualidad 
SET estado = 'pago', fecha_pago = '2024-02-01', monto = 50.00 
WHERE id_artista = 7 AND id_grupo = 4;
COMMIT;