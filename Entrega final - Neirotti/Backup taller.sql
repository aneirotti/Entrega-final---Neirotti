-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: taller_ceramica_neirotti
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `id_artista` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `Id_grupo` int NOT NULL,
  PRIMARY KEY (`id_artista`),
  KEY `Id_grupo` (`Id_grupo`),
  CONSTRAINT `artista_ibfk_1` FOREIGN KEY (`Id_grupo`) REFERENCES `grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (1,'Martin Perez','99467082','martin.perez@hotmail.com','2024-08-13',1),(2,'Mateo Gomez','96406732','mateo.gomez@gmail.com','2024-04-28',2),(3,'Valentina Diaz','99494794','valentina.diaz@gmail.com','2024-07-06',2),(4,'Valentina Navarro','96544259','valentina.navarro@gmail.com','2024-12-18',3),(5,'Lucia Bermudez','98181684','lucia.bermudez@hotmail.com','2024-05-25',3),(6,'Laura Vega','96347951','laura.vega@hotmail.com','2024-10-15',3),(7,'Santiago Rodriguez','99234567','santiago.rodriguez@gmail.com','2024-06-20',4),(8,'Camila Fernandez','96123456','camila.fernandez@hotmail.com','2024-09-10',4),(9,'Facundo Mendez','97456321','facundo.mendez@gmail.com','2024-03-15',5),(10,'Julieta Castro','98234567','julieta.castro@yahoo.com','2024-11-05',6),(11,'Diego Suarez','99345678','diego.suarez@gmail.com','2024-02-10',7),(12,'Agustina Morales','96111222','agustina.morales@hotmail.com','2024-01-25',8),(13,'Renata Lopez','97567890','renata.lopez@yahoo.com','2024-06-30',9),(14,'Bruno Cabrera','98333444','bruno.cabrera@gmail.com','2024-08-05',10),(15,'Isabela Ramos','96222333','isabela.ramos@hotmail.com','2024-03-22',11);
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `id_asistencia` int NOT NULL AUTO_INCREMENT,
  `id_artista` int NOT NULL,
  `id_grupo` int NOT NULL,
  `fecha` date NOT NULL,
  `estado` enum('presente','falta') NOT NULL,
  PRIMARY KEY (`id_asistencia`),
  KEY `id_artista` (`id_artista`),
  KEY `id_grupo` (`id_grupo`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id_artista`),
  CONSTRAINT `asistencia_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
INSERT INTO `asistencia` VALUES (1,1,1,'2024-03-05','presente'),(2,2,2,'2024-03-07','presente'),(3,3,2,'2024-03-07','falta'),(4,4,3,'2024-03-12','presente'),(5,5,3,'2024-03-12','presente'),(6,6,3,'2024-03-12','falta'),(7,7,4,'2024-03-14','presente'),(8,8,4,'2024-03-14','presente'),(9,9,5,'2024-03-18','falta'),(10,10,6,'2024-03-19','presente'),(11,11,7,'2024-03-20','presente'),(12,12,8,'2024-03-22','presente'),(13,13,9,'2024-03-23','falta'),(14,14,10,'2024-03-26','presente'),(15,15,11,'2024-03-27','presente');
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `id_material` int NOT NULL,
  `id_faltante` int NOT NULL,
  `fecha_compra` date NOT NULL,
  `unidad_medida` varchar(20) NOT NULL,
  `costo_unitario` decimal(10,2) NOT NULL,
  `cantidad` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_material` (`id_material`),
  KEY `id_faltante` (`id_faltante`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_material`) REFERENCES `material` (`id_material`),
  CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`id_faltante`) REFERENCES `material_faltante` (`id_faltante`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,1,1,'2024-03-01','kg',120.50,10.000),(2,2,2,2,'2024-03-05','L',50.75,5.000),(3,3,3,3,'2024-03-10','kg',200.00,7.000),(4,4,4,4,'2024-03-15','unidades',15.00,20.000),(5,5,5,5,'2024-03-20','L',70.00,6.000),(6,6,6,6,'2024-03-25','unidades',45.00,15.000),(7,1,7,7,'2024-04-01','L',80.00,10.000),(8,2,8,8,'2024-04-05','unidad',250.00,2.000),(9,3,9,9,'2024-04-10','unidad',60.00,5.000),(10,4,10,10,'2024-04-15','unidad',30.00,8.000),(11,5,11,11,'2024-04-20','kg',95.50,4.500),(12,6,12,12,'2024-04-25','L',110.25,3.750),(13,7,13,13,'2024-05-01','unidad',25.00,12.000),(14,8,14,14,'2024-05-05','unidad',150.00,10.000),(15,9,15,15,'2024-05-10','unidad',40.00,7.000),(16,2,5,3,'2025-03-01','kg',12.50,10.000);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `id_grupo` int NOT NULL AUTO_INCREMENT,
  `nivel` varchar(25) NOT NULL,
  `horario` varchar(25) NOT NULL,
  `cupo_disponible` int NOT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'Principiante','Martes matutino',1),(2,'Principiante','Jueves Tarde',2),(3,'Intermedio','Martes Tarde',3),(4,'Intermedio','Jueves matutino',2),(5,'Avanzado','Lunes matutino',1),(6,'Principiante','Lunes Tarde',2),(7,'Intermedio','Miercoles matutino',3),(8,'Avanzado','Viernes Tarde',2),(9,'Principiante','Sabado matutino',4),(10,'Intermedio','Miercoles Tarde',3),(11,'Avanzado','Sabado Tarde',2),(12,'Principiante','Viernes matutino',3),(13,'Intermedio','Lunes Tarde',2),(14,'Avanzado','Martes matutino',1),(15,'Principiante','Miercoles Tarde',2);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `id_material` int NOT NULL AUTO_INCREMENT,
  `material` varchar(100) NOT NULL,
  `unidad_medida` varchar(20) NOT NULL,
  `stock` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id_material`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'Barro','kg',50.000),(2,'Esmalte','L',30.500),(3,'Arcilla','kg',50.000),(4,'Pinceles','unidad',100.000),(5,'Utensilios de modelado','unidad',95.000),(6,'Lijas','unidad',30.000),(7,'Engobe','L',20.000),(8,'Tornetas','unidad',15.000),(9,'Rodillos','unidad',25.000),(10,'Esponjas','unidad',40.000),(11,'Pigmentos','kg',10.500),(12,'Barniz','L',18.750),(13,'Cortadores de arcilla','unidad',50.000),(14,'Placas de yeso','unidad',20.000),(15,'Hilo de corte','unidad',35.000);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_faltante`
--

DROP TABLE IF EXISTS `material_faltante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_faltante` (
  `id_faltante` int NOT NULL AUTO_INCREMENT,
  `id_material` int NOT NULL,
  `id_grupo` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_faltante`),
  KEY `id_material` (`id_material`),
  KEY `id_grupo` (`id_grupo`),
  CONSTRAINT `material_faltante_ibfk_1` FOREIGN KEY (`id_material`) REFERENCES `material` (`id_material`),
  CONSTRAINT `material_faltante_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_faltante`
--

LOCK TABLES `material_faltante` WRITE;
/*!40000 ALTER TABLE `material_faltante` DISABLE KEYS */;
INSERT INTO `material_faltante` VALUES (1,1,1,'2024-03-01'),(2,2,1,'2024-03-05'),(3,3,2,'2024-03-10'),(4,4,2,'2024-03-15'),(5,5,3,'2024-03-20'),(6,6,3,'2024-03-25'),(7,7,4,'2024-04-01'),(8,8,4,'2024-04-05'),(9,9,5,'2024-04-10'),(10,10,5,'2024-04-15'),(11,11,6,'2024-04-20'),(12,12,6,'2024-04-25'),(13,13,7,'2024-05-01'),(14,14,7,'2024-05-05'),(15,15,8,'2024-05-10');
/*!40000 ALTER TABLE `material_faltante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensualidad`
--

DROP TABLE IF EXISTS `mensualidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensualidad` (
  `id_mensualidad` int NOT NULL AUTO_INCREMENT,
  `id_artista` int NOT NULL,
  `id_grupo` int NOT NULL,
  `estado` enum('pago','no pago') NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_mensualidad`),
  KEY `id_artista` (`id_artista`),
  KEY `id_grupo` (`id_grupo`),
  CONSTRAINT `mensualidad_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id_artista`),
  CONSTRAINT `mensualidad_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensualidad`
--

LOCK TABLES `mensualidad` WRITE;
/*!40000 ALTER TABLE `mensualidad` DISABLE KEYS */;
INSERT INTO `mensualidad` VALUES (1,3,2,'pago','2024-03-10',4000.00),(2,5,3,'pago','2024-03-12',4000.00),(3,2,2,'pago','2024-07-25',4000.00),(4,4,3,'pago','2024-08-07',4000.00),(5,6,3,'no pago',NULL,NULL),(6,1,1,'no pago',NULL,NULL),(7,7,4,'pago','2024-02-01',50.00),(8,8,4,'pago','2024-06-20',4500.00),(9,9,5,'no pago',NULL,NULL),(10,10,6,'pago','2024-07-01',3800.00),(11,11,7,'pago','2024-07-15',4500.00),(12,12,8,'no pago',NULL,NULL),(13,13,9,'pago','2024-07-20',4000.00),(14,14,10,'pago','2024-08-05',4000.00),(15,15,11,'no pago',NULL,NULL);
/*!40000 ALTER TABLE `mensualidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Barro y Arte','1234567890','barroyarte@gmail.com'),(2,'Ceramica Creativa','2345678901','ceramicacreativa@hotmail.com'),(3,'Esmalte Perfecto','3456789012','esmalteperfecto@gmail.com'),(4,'Ladrillos de Fuego','4567890123','ladrillosdefuego@hotmail.com'),(5,'Arcilla Pura','5678901234','arcillapura@gmail.com'),(6,'Terracota Pura','7890123456','terracotapura@gmail.com'),(7,'Vidriados Excelentes','7890123456','vidriadosexcelentes@yahoo.com'),(8,'Hornos y Mas','8901234567','hornosymas@gmail.com'),(9,'Tierra y Fuego','9012345678','tierrayfuego@hotmail.com'),(10,'Ceramica del Sur','9123456789','ceramicadelsur@gmail.com'),(11,'Arte en Arcilla','9234567890','arteenarcilla@gmail.com'),(12,'Formas de Barro','9345678901','formasdebarro@hotmail.com'),(13,'Color y Fuego','9456789012','coloryfuego@gmail.com'),(14,'Taller Esmaltes','9567890123','talleresmaltes@yahoo.com'),(15,'Ceramica Moderna','9678901234','ceramicamoderna@gmail.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_artista_grupo_mensualidad`
--

DROP TABLE IF EXISTS `vista_artista_grupo_mensualidad`;
/*!50001 DROP VIEW IF EXISTS `vista_artista_grupo_mensualidad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_artista_grupo_mensualidad` AS SELECT 
 1 AS `id_artista`,
 1 AS `artista_nombre`,
 1 AS `grupo_nivel`,
 1 AS `grupo_horario`,
 1 AS `mensualidad_estado`,
 1 AS `fecha_pago`,
 1 AS `monto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_asistencia_mensual`
--

DROP TABLE IF EXISTS `vista_asistencia_mensual`;
/*!50001 DROP VIEW IF EXISTS `vista_asistencia_mensual`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_asistencia_mensual` AS SELECT 
 1 AS `id_artista`,
 1 AS `artista_nombre`,
 1 AS `grupo_nivel`,
 1 AS `grupo_horario`,
 1 AS `mes`,
 1 AS `total_asistencia`,
 1 AS `total_falta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_grupo_disponibilidad`
--

DROP TABLE IF EXISTS `vista_grupo_disponibilidad`;
/*!50001 DROP VIEW IF EXISTS `vista_grupo_disponibilidad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_grupo_disponibilidad` AS SELECT 
 1 AS `id_grupo`,
 1 AS `grupo_nivel`,
 1 AS `grupo_horario`,
 1 AS `artistas_inscritos`,
 1 AS `cupos_disponibles`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_historial_compras`
--

DROP TABLE IF EXISTS `vista_historial_compras`;
/*!50001 DROP VIEW IF EXISTS `vista_historial_compras`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_historial_compras` AS SELECT 
 1 AS `id_compra`,
 1 AS `fecha_compra`,
 1 AS `proveedor`,
 1 AS `material`,
 1 AS `cantidad`,
 1 AS `unidad_medida`,
 1 AS `costo_unitario`,
 1 AS `costo_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_proveedores_materiales_compras`
--

DROP TABLE IF EXISTS `vista_proveedores_materiales_compras`;
/*!50001 DROP VIEW IF EXISTS `vista_proveedores_materiales_compras`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_proveedores_materiales_compras` AS SELECT 
 1 AS `proveedor_nombre`,
 1 AS `material_nombre`,
 1 AS `fecha_faltante`,
 1 AS `fecha_compra`,
 1 AS `unidad_medida`,
 1 AS `costo_unitario`,
 1 AS `cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_artista_grupo_mensualidad`
--

/*!50001 DROP VIEW IF EXISTS `vista_artista_grupo_mensualidad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_artista_grupo_mensualidad` AS select `a`.`id_artista` AS `id_artista`,`a`.`nombre` AS `artista_nombre`,`g`.`nivel` AS `grupo_nivel`,`g`.`horario` AS `grupo_horario`,`m`.`estado` AS `mensualidad_estado`,`m`.`fecha_pago` AS `fecha_pago`,`m`.`monto` AS `monto` from ((`artista` `a` left join `grupo` `g` on((`a`.`Id_grupo` = `g`.`id_grupo`))) left join `mensualidad` `m` on((`a`.`id_artista` = `m`.`id_artista`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_asistencia_mensual`
--

/*!50001 DROP VIEW IF EXISTS `vista_asistencia_mensual`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_asistencia_mensual` AS select `a`.`id_artista` AS `id_artista`,`a`.`nombre` AS `artista_nombre`,`g`.`nivel` AS `grupo_nivel`,`g`.`horario` AS `grupo_horario`,date_format(`ass`.`fecha`,'%Y-%m') AS `mes`,sum((case when (`ass`.`estado` = 'presente') then 1 else 0 end)) AS `total_asistencia`,sum((case when (`ass`.`estado` = 'falta') then 1 else 0 end)) AS `total_falta` from ((`artista` `a` left join `grupo` `g` on((`a`.`Id_grupo` = `g`.`id_grupo`))) left join `asistencia` `ass` on(((`a`.`id_artista` = `ass`.`id_artista`) and (`g`.`id_grupo` = `ass`.`id_grupo`)))) group by `a`.`id_artista`,`g`.`id_grupo`,`mes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_grupo_disponibilidad`
--

/*!50001 DROP VIEW IF EXISTS `vista_grupo_disponibilidad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_grupo_disponibilidad` AS select `g`.`id_grupo` AS `id_grupo`,`g`.`nivel` AS `grupo_nivel`,`g`.`horario` AS `grupo_horario`,count(`a`.`id_artista`) AS `artistas_inscritos`,(`g`.`cupo_disponible` - count(`a`.`id_artista`)) AS `cupos_disponibles` from (`grupo` `g` left join `artista` `a` on((`g`.`id_grupo` = `a`.`Id_grupo`))) group by `g`.`id_grupo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_historial_compras`
--

/*!50001 DROP VIEW IF EXISTS `vista_historial_compras`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_historial_compras` AS select `c`.`id_compra` AS `id_compra`,`c`.`fecha_compra` AS `fecha_compra`,`p`.`nombre` AS `proveedor`,`m`.`material` AS `material`,`c`.`cantidad` AS `cantidad`,`c`.`unidad_medida` AS `unidad_medida`,`c`.`costo_unitario` AS `costo_unitario`,(`c`.`cantidad` * `c`.`costo_unitario`) AS `costo_total` from ((`compra` `c` left join `proveedor` `p` on((`c`.`id_proveedor` = `p`.`id_proveedor`))) left join `material` `m` on((`c`.`id_material` = `m`.`id_material`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_proveedores_materiales_compras`
--

/*!50001 DROP VIEW IF EXISTS `vista_proveedores_materiales_compras`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_proveedores_materiales_compras` AS select `p`.`nombre` AS `proveedor_nombre`,`m`.`material` AS `material_nombre`,`mf`.`fecha` AS `fecha_faltante`,`c`.`fecha_compra` AS `fecha_compra`,`c`.`unidad_medida` AS `unidad_medida`,`c`.`costo_unitario` AS `costo_unitario`,`c`.`cantidad` AS `cantidad` from (((`proveedor` `p` left join `compra` `c` on((`p`.`id_proveedor` = `c`.`id_proveedor`))) left join `material` `m` on((`c`.`id_material` = `m`.`id_material`))) left join `material_faltante` `mf` on((`c`.`id_faltante` = `mf`.`id_faltante`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-26 22:27:05
