-- Insercion de datos --

INSERT INTO grupo (id_grupo, nivel, horario, cupo_disponible)
VALUES
    (1, 'Principiante', 'Martes matutino', 1),
    (2, 'Principiante', 'Jueves Tarde', 2),
    (3, 'Intermedio', 'Martes Tarde', 3),
    (4, 'Intermedio', 'Jueves matutino', 2),
    (5, 'Avanzado', 'Lunes matutino', 1), 
	(6, 'Principiante','Lunes Tarde', 2),
    (7, 'Intermedio', 'Miercoles matutino', 3),
    (8, 'Avanzado', 'Viernes Tarde', 2),
    (9, 'Principiante', 'Sabado matutino', 4),
    (10, 'Intermedio', 'Miercoles Tarde', 3),
	(11, 'Avanzado', 'Sabado Tarde', 2),
    (12, 'Principiante', 'Viernes matutino', 3),
    (13, 'Intermedio', 'Lunes Tarde', 2),
    (14, 'Avanzado', 'Martes matutino', 1),
    (15, 'Principiante', 'Miercoles Tarde', 2);

INSERT INTO artista (id_artista, nombre, telefono, mail, fecha_inicio, Id_grupo)
VALUES
    (1, 'Martin Perez', '99467082', 'martin.perez@hotmail.com', '2024-08-13', 1),
    (2, 'Mateo Gomez', '96406732', 'mateo.gomez@gmail.com', '2024-04-28', 2),
    (3, 'Valentina Diaz', '99494794', 'valentina.diaz@gmail.com', '2024-07-06', 2),
    (4, 'Valentina Navarro', '96544259', 'valentina.navarro@gmail.com', '2024-12-18', 3),
    (5, 'Lucia Bermudez', '98181684', 'lucia.bermudez@hotmail.com', '2024-05-25', 3),
    (6, 'Laura Vega', '96347951', 'laura.vega@hotmail.com', '2024-10-15', 3),
	(7, 'Santiago Rodriguez', '99234567', 'santiago.rodriguez@gmail.com', '2024-06-20', 4),
    (8, 'Camila Fernandez', '96123456', 'camila.fernandez@hotmail.com', '2024-09-10', 4),
    (9, 'Facundo Mendez', '97456321', 'facundo.mendez@gmail.com', '2024-03-15', 5),
    (10, 'Julieta Castro', '98234567', 'julieta.castro@yahoo.com', '2024-11-05', 6),
    (11, 'Diego Suarez', '99345678', 'diego.suarez@gmail.com', '2024-02-10', 7),
    (12, 'Agustina Morales', '96111222', 'agustina.morales@hotmail.com', '2024-01-25', 8),
    (13, 'Renata Lopez', '97567890', 'renata.lopez@yahoo.com', '2024-06-30', 9),
    (14, 'Bruno Cabrera', '98333444', 'bruno.cabrera@gmail.com', '2024-08-05', 10),
    (15, 'Isabela Ramos', '96222333', 'isabela.ramos@hotmail.com', '2024-03-22', 11);
    
INSERT INTO asistencia (id_asistencia, id_artista, id_grupo, fecha, estado)
VALUES
    (1, 1, 1, '2024-03-05', 'presente'),  
    (2, 2, 2, '2024-03-07', 'presente'),  
    (3, 3, 2, '2024-03-07', 'falta'),  
    (4, 4, 3, '2024-03-12', 'presente'),  
    (5, 5, 3, '2024-03-12', 'presente'),  
    (6, 6, 3, '2024-03-12', 'falta'),  
    (7, 7, 4, '2024-03-14', 'presente'),  
    (8, 8, 4, '2024-03-14', 'presente'),  
    (9, 9, 5, '2024-03-18', 'falta'),  
    (10, 10, 6, '2024-03-19', 'presente'),
    (11, 11, 7, '2024-03-20', 'presente'),
    (12, 12, 8, '2024-03-22', 'presente'),
    (13, 13, 9, '2024-03-23', 'falta'),
    (14, 14, 10, '2024-03-26', 'presente'),
    (15, 15, 11, '2024-03-27', 'presente');  
    
    
    
INSERT INTO mensualidad (id_mensualidad, id_artista, id_grupo, estado, fecha_pago, monto)
VALUES
	(1, 3, 2, 'pago', '2024-03-10', 4000),
    (2, 5, 3, 'pago', '2024-03-12', 4000), 
    (3, 2, 2, 'pago', '2024-07-25', 4000),
    (4, 4, 3, 'pago', '2024-08-07', 4000), 
    (5, 6, 3, 'no pago', NULL, NULL), 
    (6, 1, 1, 'no pago', NULL, NULL), 
    (7, 7, 4, 'pago', '2024-06-18', 4500), 
    (8, 8, 4, 'pago', '2024-06-20', 4500), 
    (9, 9, 5, 'no pago', NULL, NULL), 
    (10, 10, 6, 'pago', '2024-07-01', 3800),
    (11, 11, 7, 'pago', '2024-07-15', 4500),
    (12, 12, 8, 'no pago', NULL, NULL),
    (13, 13, 9, 'pago', '2024-07-20', 4000),
    (14, 14, 10, 'pago', '2024-08-05', 4000),
    (15, 15, 11, 'no pago', NULL, NULL); 

INSERT INTO proveedor (id_proveedor, nombre, telefono, email)
VALUES
    (1, 'Barro y Arte', '1234567890', 'barroyarte@gmail.com'),
    (2, 'Ceramica Creativa', '2345678901', 'ceramicacreativa@hotmail.com'),
    (3, 'Esmalte Perfecto', '3456789012', 'esmalteperfecto@gmail.com'),
    (4, 'Ladrillos de Fuego', '4567890123', 'ladrillosdefuego@hotmail.com'),
    (5, 'Arcilla Pura', '5678901234', 'arcillapura@gmail.com'),
    (6, 'Terracota Pura', '7890123456', 'terracotapura@gmail.com'),
    (7, 'Vidriados Excelentes', '7890123456', 'vidriadosexcelentes@yahoo.com'),
    (8, 'Hornos y Mas', '8901234567', 'hornosymas@gmail.com'),
    (9, 'Tierra y Fuego', '9012345678', 'tierrayfuego@hotmail.com'),
    (10, 'Ceramica del Sur', '9123456789', 'ceramicadelsur@gmail.com'),
     (11, 'Arte en Arcilla', '9234567890', 'arteenarcilla@gmail.com'),
    (12, 'Formas de Barro', '9345678901', 'formasdebarro@hotmail.com'),
    (13, 'Color y Fuego', '9456789012', 'coloryfuego@gmail.com'),
    (14, 'Taller Esmaltes', '9567890123', 'talleresmaltes@yahoo.com'),
    (15, 'Ceramica Moderna', '9678901234', 'ceramicamoderna@gmail.com');

INSERT INTO material (id_material, material, unidad_medida, stock)
VALUES
    (1, 'Barro', 'kg', 50),
    (2, 'Esmalte', 'L', 30.5),
    (3, 'Arcilla', 'kg', 50),
    (4, 'Pinceles', 'unidad', 100),
    (5, 'Utensilios de modelado', 'unidad', 75),
    (6, 'Lijas', 'unidad', 30),
    (7, 'Engobe', 'L', 20),
    (8, 'Tornetas', 'unidad', 15),
    (9, 'Rodillos', 'unidad', 25),
    (10, 'Esponjas', 'unidad', 40),
    (11, 'Pigmentos', 'kg', 10.5),
    (12, 'Barniz', 'L', 18.75),
    (13, 'Cortadores de arcilla', 'unidad', 50),
    (14, 'Placas de yeso', 'unidad', 20),
    (15, 'Hilo de corte', 'unidad', 35);

INSERT INTO material_faltante (id_faltante, id_material, id_grupo, fecha)
VALUES
    (1, 1, 1, '2024-03-01'),
    (2, 2, 1, '2024-03-05'),
    (3, 3, 2, '2024-03-10'),
    (4, 4, 2, '2024-03-15'),
    (5, 5, 3, '2024-03-20'),
    (6, 6, 3, '2024-03-25'),
    (7, 7, 4, '2024-04-01'),  
    (8, 8, 4, '2024-04-05'),  
    (9, 9, 5, '2024-04-10'),  
    (10, 10, 5, '2024-04-15'),
    (11, 11, 6, '2024-04-20'),
    (12, 12, 6, '2024-04-25'),
    (13, 13, 7, '2024-05-01'),
    (14, 14, 7, '2024-05-05'),
    (15, 15, 8, '2024-05-10');
    
INSERT INTO compra (id_compra, id_proveedor, id_material, id_faltante, fecha_compra, unidad_medida, costo_unitario, cantidad)
VALUES
    (1, 1, 1, 1, '2024-03-01', 'kg', 120.5, 10),
    (2, 2, 2, 2, '2024-03-05', 'L', 50.75, 5),
    (3, 3, 3, 3, '2024-03-10', 'kg', 200, 7),
    (4, 4, 4, 4, '2024-03-15', 'unidades', 15, 20),
    (5, 5, 5, 5, '2024-03-20', 'L', 70, 6),
    (6, 6, 6, 6, '2024-03-25', 'unidades', 45, 15),
    (7, 1, 7, 7, '2024-04-01', 'L', 80, 10),      
    (8, 2, 8, 8, '2024-04-05', 'unidad', 250, 2), 
    (9, 3, 9, 9, '2024-04-10', 'unidad', 60, 5),  
    (10, 4, 10, 10, '2024-04-15', 'unidad', 30, 8),
	(11, 5, 11, 11, '2024-04-20', 'kg', 95.5, 4.5),
    (12, 6, 12, 12, '2024-04-25', 'L', 110.25, 3.75),
    (13, 7, 13, 13, '2024-05-01', 'unidad', 25, 12),
    (14, 8, 14, 14, '2024-05-05', 'unidad', 150, 10),
    (15, 9, 15, 15, '2024-05-10', 'unidad', 40, 7);