DROP SCHEMA IF EXISTS Taller_ceramica_Neirotti;

CREATE SCHEMA Taller_ceramica_Neirotti;
USE Taller_Ceramica_Neirotti;

CREATE TABLE grupo (
    id_grupo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nivel VARCHAR(25) NOT NULL,
    horario VARCHAR(25) NOT NULL,
    cupo_disponible INT NOT NULL
   );

CREATE TABLE artista (
    id_artista INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    mail VARCHAR(100),
    fecha_inicio DATE NOT NULL,
    Id_grupo INT NOT NULL,
    FOREIGN KEY (Id_grupo) REFERENCES grupo(Id_grupo)
);

CREATE TABLE asistencia (
    id_asistencia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_artista INT NOT NULL,
    id_grupo INT NOT NULL,
    fecha DATE NOT NULL,
    estado ENUM('presente', 'falta') NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista),
    FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo)
);


CREATE TABLE mensualidad (
    id_mensualidad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_artista INT NOT NULL,
    id_grupo INT NOT NULL,
    estado ENUM('pago', 'no pago') NOT NULL,
    fecha_pago DATE,
    monto DECIMAL(10, 2),
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista),
    FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo)
);

CREATE TABLE proveedor (
    id_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE material (
    id_material INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    material VARCHAR(100) NOT NULL,
    unidad_medida VARCHAR(20) NOT NULL,
    stock DECIMAL(10,3) NOT NULL
);

CREATE TABLE material_faltante (
    id_faltante INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_material INT NOT NULL,
    id_grupo INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_material) REFERENCES material(id_material),
    FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo)
);

CREATE TABLE compra (
    id_compra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT NOT NULL,
    id_material INT NOT NULL,
	id_faltante INT NOT NULL,
    fecha_compra DATE NOT NULL,
    unidad_medida VARCHAR(20) NOT NULL,
    costo_unitario DECIMAL(10, 2) NOT NULL,
    cantidad DECIMAL(10,3) NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor),
    FOREIGN KEY (id_material) REFERENCES material(id_material),
    FOREIGN KEY (id_faltante) REFERENCES material_faltante(id_faltante)
);
