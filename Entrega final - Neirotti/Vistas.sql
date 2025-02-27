-- Creacion de vistas --

CREATE OR REPLACE VIEW vista_artista_grupo_mensualidad AS
SELECT
a.id_artista,
a.nombre AS artista_nombre,
g.nivel AS grupo_nivel,
g.horario AS grupo_horario,
m.estado AS mensualidad_estado,
m.fecha_pago,
m.monto
FROM artista AS a
LEFT JOIN grupo AS g ON a.Id_grupo = g.id_grupo
LEFT JOIN mensualidad AS m ON a.id_artista = m.id_artista;


CREATE OR REPLACE VIEW vista_proveedores_materiales_compras AS
SELECT 
p.nombre AS proveedor_nombre,
m.material AS material_nombre,
mf.fecha AS fecha_faltante,
c.fecha_compra,
c.unidad_medida,
c.costo_unitario,
c.cantidad
FROM proveedor AS p
LEFT JOIN compra AS c ON p.id_proveedor = c.id_proveedor
LEFT JOIN material AS m ON c.id_material = m.id_material
LEFT JOIN material_faltante AS mf ON c.id_faltante = mf.id_faltante;


CREATE VIEW vista_Historial_Compras AS
SELECT 
c.id_compra,
c.fecha_compra,
p.nombre AS proveedor,
m.material,
c.cantidad,
c.unidad_medida,
c.costo_unitario,
(c.cantidad * c.costo_unitario) AS costo_total
FROM compra c
LEFT JOIN proveedor AS p ON c.id_proveedor = p.id_proveedor
LEFT JOIN material AS m ON c.id_material = m.id_material;


CREATE OR REPLACE VIEW vista_asistencia_mensual AS
SELECT 
    a.id_artista,
    a.nombre AS artista_nombre,
    g.nivel AS grupo_nivel,
    g.horario AS grupo_horario,
    DATE_FORMAT(ass.fecha, '%Y-%m') AS mes,
    SUM(CASE WHEN ass.estado = 'presente' THEN 1 ELSE 0 END) AS total_asistencia,
    SUM(CASE WHEN ass.estado = 'falta' THEN 1 ELSE 0 END) AS total_falta
FROM artista AS a
LEFT JOIN grupo AS g ON a.Id_grupo = g.id_grupo
LEFT JOIN asistencia AS ass ON a.id_artista = ass.id_artista AND g.id_grupo = ass.id_grupo
GROUP BY a.id_artista, g.id_grupo, mes;

CREATE OR REPLACE VIEW vista_grupo_disponibilidad AS
SELECT 
    g.id_grupo,
    g.nivel AS grupo_nivel,
    g.horario AS grupo_horario,
    COUNT(a.id_artista) AS artistas_inscritos,
    g.cupo_disponible - COUNT(a.id_artista) AS cupos_disponibles
FROM grupo AS g
LEFT JOIN artista AS a ON g.id_grupo = a.Id_grupo
GROUP BY g.id_grupo;
