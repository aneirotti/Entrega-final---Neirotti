-- Usuarios --
CREATE USER 'control_material'@'localhost' IDENTIFIED BY 'Stock2025';
GRANT SELECT, INSERT, UPDATE ON taller_ceramica_neirotti.material TO 'control_material'@'localhost';
GRANT SELECT, INSERT, UPDATE ON taller_ceramica_neirotti.compra TO 'control_material'@'localhost';

CREATE USER 'admin_taller'@'localhost' IDENTIFIED BY 'Admin2024';
GRANT ALL PRIVILEGES ON taller_ceramica_neirotti.* TO 'admin_taller'@'localhost';

CREATE USER 'seguimiento_artista'@'localhost' IDENTIFIED BY 'Control2025';
GRANT SELECT, INSERT, UPDATE ON taller_ceramica_neirotti.asistencia TO 'seguimiento_artista'@'localhost';
GRANT SELECT, INSERT, UPDATE ON taller_ceramica_neirotti.mensualidad TO 'seguimiento_artista'@'localhost';