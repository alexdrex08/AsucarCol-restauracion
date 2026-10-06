CREATE DATABASE  IF NOT EXISTS `asuras_restauraciones` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `asuras_restauraciones`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: asuras_restauraciones
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
-- Table structure for table `alerta_inv`
--

DROP TABLE IF EXISTS `alerta_inv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerta_inv` (
  `id_alerta` bigint NOT NULL AUTO_INCREMENT,
  `descripcion_alerta` varchar(1000) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_resolucion` datetime(6) DEFAULT NULL,
  `is_resuelta` bit(1) DEFAULT NULL,
  `tipo_alerta` varchar(255) DEFAULT NULL,
  `id_producto` bigint DEFAULT NULL,
  PRIMARY KEY (`id_alerta`),
  KEY `FK9gawm12joc57kfp6bcfavvd3l` (`id_producto`),
  CONSTRAINT `FK9gawm12joc57kfp6bcfavvd3l` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerta_inv`
--

LOCK TABLES `alerta_inv` WRITE;
/*!40000 ALTER TABLE `alerta_inv` DISABLE KEYS */;
INSERT INTO `alerta_inv` VALUES (1,'El producto Acetaminofén Jarabe 120mg/5ml , venció en la fecha: 2026-08-31T00:00. Stock actual: 80','2026-10-02 00:00:00.165788',NULL,_binary '\0','PRODUCTO_VENCIDO',69),(2,'El producto Ibuprofeno 400mg Tab x10 , venció en la fecha: 2026-09-30T00:00. Stock actual: 550','2026-10-02 00:00:00.198393',NULL,_binary '\0','PRODUCTO_VENCIDO',72),(3,'El productoIbuprofeno 600mg Tab x10 , tiene stock bajo. Stock actual:0, stock minimo: 350','2026-10-02 00:00:00.222543',NULL,_binary '\0','STOCK_BAJO',73),(4,'El productoAmoxicilina 500mg Cap x10 , tiene stock bajo. Stock actual:0, stock minimo: 200','2026-10-02 00:00:00.255145',NULL,_binary '\0','STOCK_BAJO',77),(5,'El productoAmoxicilina 250mg/5ml Susp , tiene stock bajo. Stock actual:0, stock minimo: 100','2026-10-02 00:00:00.270695',NULL,_binary '\0','STOCK_BAJO',78),(6,'El producto Metronidazol 500mg Tab x10 , venció en la fecha: 2026-08-31T00:00. Stock actual: 70','2026-10-02 00:00:00.302103',NULL,_binary '\0','PRODUCTO_VENCIDO',81),(7,'El producto Loratadina Jarabe 5mg/5ml , venció en la fecha: 2026-09-30T00:00. Stock actual: 60','2026-10-02 00:00:00.326768',NULL,_binary '\0','PRODUCTO_VENCIDO',84),(8,'El productoRanitidina 150mg Tab x10 , tiene stock bajo. Stock actual:0, stock minimo: 240','2026-10-02 00:00:00.360178',NULL,_binary '\0','STOCK_BAJO',90),(9,'El productoTetracilina 500mg Cap x10 , tiene stock bajo. Stock actual:0, stock minimo: 100','2026-10-02 00:00:00.506248',NULL,_binary '\0','STOCK_BAJO',117),(10,'El productoEritromicina 500mg Tab x10 , tiene stock bajo. Stock actual:0, stock minimo: 100','2026-10-02 00:00:00.520047',NULL,_binary '\0','STOCK_BAJO',118),(11,'El productoperromol , tiene stock bajo. Stock actual:0, stock minimo: 100','2026-10-02 00:00:00.534614',NULL,_binary '\0','STOCK_BAJO',120),(12,'El productoperromol , tiene stock bajo. Stock actual:0, stock minimo: 100','2026-10-02 00:00:00.548741',NULL,_binary '\0','STOCK_BAJO',122);
/*!40000 ALTER TABLE `alerta_inv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barrio_direccion`
--

DROP TABLE IF EXISTS `barrio_direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barrio_direccion` (
  `id_barrio` bigint NOT NULL AUTO_INCREMENT,
  `nombre_barrio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_barrio`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrio_direccion`
--

LOCK TABLES `barrio_direccion` WRITE;
/*!40000 ALTER TABLE `barrio_direccion` DISABLE KEYS */;
INSERT INTO `barrio_direccion` VALUES (1,'El Prado (Barranquilla)'),(2,'Alto Prado (Barranquilla)'),(3,'Riomar (Barranquilla)'),(4,'Ciudad Jardín (Barranquilla)'),(5,'Boston (Barranquilla)'),(6,'Recreo (Barranquilla)'),(7,'Barrio Abajo (Barranquilla)'),(8,'El Rosario (Barranquilla)'),(9,'Centro (Barranquilla)'),(10,'San Roque (Barranquilla)'),(11,'Chiquinquirá (Barranquilla)'),(12,'San Felipe (Barranquilla)'),(13,'Olaya (Barranquilla)'),(14,'La Victoria (Barranquilla)'),(15,'San José (Barranquilla)'),(16,'Cevillar (Barranquilla)'),(17,'La Unión (Barranquilla)'),(18,'Las Nieves (Barranquilla)'),(19,'Simón Bolívar (Barranquilla)'),(20,'Miramar (Barranquilla)'),(21,'Tabor (Barranquilla)'),(22,'Villa Santos (Barranquilla)'),(23,'Las Flores (Barranquilla)'),(24,'Siape (Barranquilla)'),(25,'La Playa (Barranquilla)'),(26,'El Centenario (Soledad)'),(27,'Hipódromo (Soledad)'),(28,'Costa Hermosa (Soledad)'),(29,'Los Cusules (Soledad)'),(30,'Villa Katanga (Soledad)'),(31,'Ciudadela Metropolitana (Soledad)'),(32,'Los Almendros (Soledad)'),(33,'Las Trinitarias (Soledad)'),(34,'Soledad 2000 (Soledad)'),(35,'Manuela Beltrán (Soledad)'),(36,'Las Gaviotas (Soledad)'),(37,'Villa Muvdi (Soledad)'),(38,'La Central (Soledad)'),(39,'El Parque (Soledad)'),(40,'Juan Domínguez Romero (Soledad)');
/*!40000 ALTER TABLE `barrio_direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nombre_cat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (2,'Sustancias para combatir infecciones bacterianas.','Antibióticos'),(3,'Reducen la inflamación y el dolor asociado.','Antiinflamatorios'),(4,'Utilizados para reducir la fiebre.','Antipiréticos'),(5,'Tratamiento para reacciones alérgicas.','Antihistamínicos'),(6,'Neutralizan la acidez estomacal.','Antiácidos'),(7,'Controlan y detienen la diarrea.','Antidiarréicos'),(8,'Facilitan la evacuación intestinal.','Laxantes'),(9,'Medicamentos para calmar la tos seca.','Antitusivos'),(10,'Ayudan a eliminar el exceso de moco en vías respiratorias.','Mucolíticos'),(11,'Facilitan la expulsión de secreciones bronquiales.','Expectorantes'),(12,'Sustancias para prevenir infecciones en heridas superficiales.','Antisépticos'),(13,'Tratamiento contra infecciones causadas por hongos.','Antifúngicos'),(14,'Medicamentos para combatir infecciones por virus.','Antivirales'),(15,'Reducen la ansiedad y estados de nerviosismo.','Ansiolíticos'),(16,'Tratamiento para trastornos de la depresión.','Antidepresivos'),(17,'Controlan la presión arterial alta.','Antihipertensivos'),(18,'Regulan los niveles de azúcar en la sangre.','Antidiabéticos'),(19,'Previenen la formación de coágulos sanguíneos.','Anticoagulantes'),(20,'Abren las vías respiratorias en pacientes con asma o EPOC.','Broncodilatadores'),(21,'Potentes antiinflamatorios hormonales.','Corticosteroides'),(22,'Ayudan a eliminar el exceso de líquido del cuerpo.','Diuréticos'),(23,'Complementos para cubrir deficiencias nutricionales.','Vitaminas y Suplementos'),(24,'Suplementos como calcio, hierro y magnesio.','Minerales'),(25,'Cremas y ungüentos para afecciones de la piel.','Dermatológicos'),(26,'Gotas y pomadas para el cuidado de los ojos.','Oftalmológicos'),(27,'Gotas para el tratamiento de afecciones del oído.','Óticos'),(28,'Medicamentos específicos para la salud femenina.','Ginecológicos'),(29,'Tratamientos para el sistema urinario.','Urológicos'),(30,'Relajan los espasmos musculares internos.','Antiespasmódicos'),(31,'Protegen la mucosa del estómago.','Protectores Gástricos'),(32,'Reducen los niveles de colesterol y triglicéridos.','Hipolipemiantes'),(33,'Tratan contracturas y dolores musculares intensos.','Relajantes Musculares'),(34,'Bloquean el dolor en una zona específica.','Anestésicos Locales'),(35,'Previenen o detienen las náuseas y el vómito.','Antieméticos'),(36,'Tratamientos para desequilibrios del sistema endocrino.','Hormonales'),(37,'Reducen la actividad del sistema inmunitario.','Inmunosupresores'),(38,'Medicamentos que inducen el sueño o calma profunda.','Sedantes'),(39,'Medicamentos generales para la salud del corazón.','Cardiovasculares'),(40,'Métodos hormonales para prevenir el embarazo.','Anticonceptivos'),(41,'Medicamentos con dosis y fórmulas para niños.','Pediatricos'),(42,'Medicamentos especializados para adultos mayores.','Geriatricos'),(43,'Productos de medicina alternativa.','Homeopáticos'),(44,'Medicamentos a base de extractos de plantas.','Fitoterapéuticos'),(45,'Combinaciones de varias vitaminas en un solo producto.','Multivitamínicos'),(46,'Soluciones para recuperar electrolitos.','Sueros Rehidratantes'),(47,'Eliminan parásitos internos o externos.','Antiparasitarios'),(48,'Tratamientos específicos para candidiasis y otros.','Antimicóticos Vaginales'),(49,'Estimulantes del sistema nervioso central.','Analépticos'),(50,'Medicamentos que actúan sobre el estado mental (Controlados).','Psicotrópicos'),(51,'Medicamentos para el alivio del dolor leve a moderado.','Analgésicos'),(52,'Materiales de curación y elementos médicos.','Insumos médicos');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` bigint NOT NULL AUTO_INCREMENT,
  `identificacion_cliente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_cliente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `UKhtnbqlgdilc7014pc62haikj2` (`identificacion_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'1140123456','Stiven Daniel Robles',NULL),(3,'1048223513','Byron Lubo',NULL),(4,'1193643784','Stiven Robles',NULL),(5,'11404432873','Estaban Ortiz Gomez',_binary ''),(6,'11404432812','Carolina Gomez',_binary '');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion_sistema`
--

DROP TABLE IF EXISTS `configuracion_sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracion_sistema` (
  `id_configuracion` bigint NOT NULL AUTO_INCREMENT,
  `clave` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `valor` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `categoria` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_configuracion`),
  UNIQUE KEY `clave` (`clave`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion_sistema`
--

LOCK TABLES `configuracion_sistema` WRITE;
/*!40000 ALTER TABLE `configuracion_sistema` DISABLE KEYS */;
INSERT INTO `configuracion_sistema` VALUES (1,'nombre_empresa','Cueros Vélez','Nombre comercial mostrado en la interfaz y documentos','SISTEMA'),(2,'nombre_sistema','Asuras Col','Nombre técnico del sistema','SISTEMA'),(3,'slogan_empresa','Control y confianza en cada registro','Eslogan mostrado en footer, facturas y reportes','SISTEMA'),(4,'version_sistema','Beta 2.1','Versión actual del sistema','SISTEMA'),(5,'dias_alerta_vencimiento','7','Días de anticipación para generar alerta de vencimiento próximo','INVENTARIO'),(6,'dias_proximo_vencer','30','Días para considerar un producto como próximo a vencer en reportes','INVENTARIO'),(7,'stock_minimo_default','10','Stock mínimo sugerido al registrar un nuevo producto','INVENTARIO'),(8,'stock_maximo_default','100','Stock máximo sugerido al registrar un nuevo producto','INVENTARIO'),(9,'porcentaje_estimacion_pedidos','20','Porcentaje de incremento aplicado al histórico para estimar pedidos en proyecciones','INVENTARIO'),(10,'moneda','COP','Código de moneda usado en facturas y reportes','FACTURACION'),(11,'iva_porcentaje','0','Porcentaje de IVA aplicado en ventas (0 = exento)','FACTURACION'),(12,'items_por_pagina','6','Cantidad de filas por página en todas las tablas','INTERFAZ'),(13,'filas_dashboard','5','Cantidad de movimientos mostrados en el dashboard','INTERFAZ'),(14,'sesion_timeout_minutos','30','Tiempo de inactividad antes de cerrar sesión (referencia visual)','SEGURIDAD'),(15,'intentos_login_max','3','Máximo de intentos fallidos de inicio de sesión (referencia visual)','SEGURIDAD'),(16,'TIENDA_CODIGO','5394','Código numérico de la tienda (4 dígitos máx.). Se usa como prefijo del SPV.','TIENDA'),(17,'TIENDA_REGION','COSTA NORTE','Región o zona geográfica de la tienda.','TIENDA');
/*!40000 ALTER TABLE `configuracion_sistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion_usuario`
--

DROP TABLE IF EXISTS `configuracion_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracion_usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `clave` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `valor` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_usuario_clave` (`usuario_id`,`clave`),
  CONSTRAINT `fk_conf_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion_usuario`
--

LOCK TABLES `configuracion_usuario` WRITE;
/*!40000 ALTER TABLE `configuracion_usuario` DISABLE KEYS */;
INSERT INTO `configuracion_usuario` VALUES (1,1,'tema','oscuro'),(2,1,'idioma','es'),(3,1,'filas_por_pagina','10'),(4,1,'notificaciones','true'),(5,16,'notificaciones','false'),(6,16,'tema','oscuro'),(7,16,'idioma','es'),(8,16,'filas_por_pagina','10'),(9,18,'filas_por_pagina','10'),(10,18,'idioma','es'),(11,18,'tema','oscuro'),(12,18,'notificaciones','false'),(13,20,'tema','oscuro'),(14,20,'idioma','es'),(15,20,'filas_por_pagina','10'),(16,20,'notificaciones','false');
/*!40000 ALTER TABLE `configuracion_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correo`
--

DROP TABLE IF EXISTS `correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `correo` (
  `id_correo` bigint NOT NULL AUTO_INCREMENT,
  `correo_electronico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cliente_id` bigint DEFAULT NULL,
  `proveedor_id` bigint DEFAULT NULL,
  `tipo_correo_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_correo`),
  KEY `FKmvmebo8gjep9se5sc1jfp6tds` (`cliente_id`),
  KEY `FKdmm1icxdt1joafrtjm6agsytb` (`proveedor_id`),
  KEY `FKdpjsl5268o9k38jucbshunbo3` (`tipo_correo_id`),
  CONSTRAINT `FKdmm1icxdt1joafrtjm6agsytb` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `FKdpjsl5268o9k38jucbshunbo3` FOREIGN KEY (`tipo_correo_id`) REFERENCES `tipo_correo` (`id_tipo_correo`),
  CONSTRAINT `FKmvmebo8gjep9se5sc1jfp6tds` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correo`
--

LOCK TABLES `correo` WRITE;
/*!40000 ALTER TABLE `correo` DISABLE KEYS */;
INSERT INTO `correo` VALUES (1,'ventas@pharmacolombia.co',NULL,2,1),(2,'stiven.robles@gmail.com',1,NULL,2),(3,'byronluma96@gmail.com',3,NULL,2),(4,'ejemplo@gmail.com',1,NULL,1),(5,'ejemplo@gmail.com',NULL,2,3),(6,'ayuda.eduardo12@hotmail.com',NULL,2,2),(7,'estebanort12@gmail.com',5,NULL,2),(8,'carogloka12@gmail.com',6,NULL,2);
/*!40000 ALTER TABLE `correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_filtro`
--

DROP TABLE IF EXISTS `detalle_filtro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_filtro` (
  `id_detalle_filtro` bigint NOT NULL AUTO_INCREMENT,
  `campo_filtro` varchar(255) DEFAULT NULL,
  `tipo_dato` varchar(255) DEFAULT NULL,
  `valor_filtro` varchar(255) DEFAULT NULL,
  `filtro_busqueda_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_detalle_filtro`),
  KEY `FK5jh79sbqxlvyygjsq3i5m0pyi` (`filtro_busqueda_id`),
  CONSTRAINT `FK5jh79sbqxlvyygjsq3i5m0pyi` FOREIGN KEY (`filtro_busqueda_id`) REFERENCES `filtro_busqueda` (`id_filtro_busqueda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_filtro`
--

LOCK TABLES `detalle_filtro` WRITE;
/*!40000 ALTER TABLE `detalle_filtro` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_filtro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id_detalle_pedido` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` decimal(38,2) DEFAULT NULL,
  `subtotal` decimal(38,2) DEFAULT NULL,
  `pedido_compra_id` bigint DEFAULT NULL,
  `producto_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `FKb1ps53lprs733qd5loi358nar` (`pedido_compra_id`),
  KEY `FK2yc3nts8mdyqf6dw6ndosk67a` (`producto_id`),
  CONSTRAINT `FK2yc3nts8mdyqf6dw6ndosk67a` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `FKb1ps53lprs733qd5loi358nar` FOREIGN KEY (`pedido_compra_id`) REFERENCES `pedido_compra` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_proveedor_producto`
--

DROP TABLE IF EXISTS `detalle_proveedor_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_proveedor_producto` (
  `precio_unitario` decimal(38,2) DEFAULT NULL,
  `producto_id` bigint NOT NULL,
  `proveedor_id` bigint NOT NULL,
  PRIMARY KEY (`producto_id`,`proveedor_id`),
  KEY `FKqnw6r5s211rw5gi73ap2doq4h` (`proveedor_id`),
  CONSTRAINT `FKnwfrhlko0vcfpil2fyp3ji9x4` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `FKqnw6r5s211rw5gi73ap2doq4h` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_proveedor_producto`
--

LOCK TABLES `detalle_proveedor_producto` WRITE;
/*!40000 ALTER TABLE `detalle_proveedor_producto` DISABLE KEYS */;
INSERT INTO `detalle_proveedor_producto` VALUES (440.00,67,3),(420.00,67,4),(710.00,68,3),(690.00,68,4),(3100.00,69,7),(2950.00,69,9),(610.00,70,3),(590.00,70,4),(1580.00,71,10),(1620.00,71,11),(730.00,72,3),(760.00,72,4),(980.00,73,3),(950.00,73,4),(690.00,74,3),(720.00,74,6),(810.00,75,4),(830.00,75,6),(1180.00,76,6),(1160.00,76,10),(1520.00,77,3),(1550.00,77,4),(6200.00,78,4),(2680.00,79,10),(2740.00,79,11),(2180.00,80,4),(2140.00,80,10),(1360.00,81,4),(1980.00,82,3),(1930.00,82,4),(590.00,83,3),(620.00,83,4),(2850.00,84,7),(720.00,85,3),(710.00,85,4),(1650.00,86,10),(920.00,87,3),(880.00,87,4),(720.00,88,3),(690.00,88,4),(1010.00,89,3),(980.00,89,4),(520.00,90,3),(2400.00,91,7),(1980.00,92,4),(910.00,93,3),(880.00,93,4),(640.00,94,4),(770.00,95,6),(980.00,96,6),(700.00,97,2),(430.00,97,7),(820.00,98,7),(790.00,98,8),(650.00,99,8),(930.00,100,8),(410.00,101,8),(780.00,102,8),(750.00,103,3),(720.00,103,4),(960.00,104,4),(540.00,105,4),(1450.00,106,10),(2600.00,107,10),(4200.00,108,10),(3850.00,109,10),(2800.00,110,12),(3300.00,111,9),(3400.00,111,12),(1900.00,112,9),(1850.00,112,12),(620.00,113,12),(1450.00,114,12),(1850.00,115,12),(5100.00,116,9),(5200.00,116,12),(1180.00,117,4),(1320.00,118,4),(500.00,120,2),(20.00,122,5);
/*!40000 ALTER TABLE `detalle_proveedor_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id_detalle_venta` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` decimal(38,2) DEFAULT NULL,
  `producto_id` bigint DEFAULT NULL,
  `venta_registro_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  KEY `FKmi06vmeg5th7wdow1mxcqg78e` (`producto_id`),
  KEY `FKj5x6j29av3i39f1oxt6e9bdmn` (`venta_registro_id`),
  CONSTRAINT `FKj5x6j29av3i39f1oxt6e9bdmn` FOREIGN KEY (`venta_registro_id`) REFERENCES `venta_registro` (`id_venta`),
  CONSTRAINT `FKmi06vmeg5th7wdow1mxcqg78e` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` bigint NOT NULL AUTO_INCREMENT,
  `complemento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `barrio_id` bigint DEFAULT NULL,
  `cliente_id` bigint DEFAULT NULL,
  `proveedor_id` bigint DEFAULT NULL,
  `tipo_direccion_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `FKg0fj0k9eyyu6iobu9innt9jxb` (`barrio_id`),
  KEY `FK2t6fhjqxc6ln670rigl9crmmn` (`cliente_id`),
  KEY `FK74ure9i3hpp7lvk3xhctxxkrq` (`proveedor_id`),
  KEY `FK38stbcna0ik41pvi3y1lxhnwq` (`tipo_direccion_id`),
  CONSTRAINT `FK2t6fhjqxc6ln670rigl9crmmn` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `FK38stbcna0ik41pvi3y1lxhnwq` FOREIGN KEY (`tipo_direccion_id`) REFERENCES `tipo_direccion` (`id_tipo_direccion`),
  CONSTRAINT `FK74ure9i3hpp7lvk3xhctxxkrq` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `FKg0fj0k9eyyu6iobu9innt9jxb` FOREIGN KEY (`barrio_id`) REFERENCES `barrio_direccion` (`id_barrio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Frente al parque','Calle 72 # 43-20, Apto 402',2,1,NULL,1),(2,'Edificio Los Rosales','Calle 19A #47-14',11,NULL,2,1);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_pedido`
--

DROP TABLE IF EXISTS `estado_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_pedido` (
  `id_estado_pedido` bigint NOT NULL AUTO_INCREMENT,
  `descripcion_estado` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nombre_estado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_pedido`
--

LOCK TABLES `estado_pedido` WRITE;
/*!40000 ALTER TABLE `estado_pedido` DISABLE KEYS */;
INSERT INTO `estado_pedido` VALUES (1,'El pedido se está armando y aún no ha sido enviado al proveedor.','Borrador'),(2,'El pedido requiere la firma o autorización de la gerencia o área financiera.','Pendiente de Aprobación'),(3,'La orden de compra ya fue emitida formalmente al proveedor.','Enviado / Solicitado'),(4,'El proveedor despachó la mercancía y viene en camino hacia la bodega.','En Tránsito'),(5,'Llegó una parte de los medicamentos, pero faltan ítems por entregar.','Recibido Parcial'),(6,'Toda la mercancía llegó correctamente y se ingresó al inventario.','Completado / Recibido'),(7,'El pedido fue anulado por la administración antes de ser despachado.','Cancelado'),(8,'El proveedor no pudo procesar el pedido (por falta de stock, precios desactualizados, etc.).','Rechazado'),(9,'La mercancía llegó a bodega pero fue devuelta en su totalidad por averías o no cumplir requisitos.','Devuelto');
/*!40000 ALTER TABLE `estado_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_restauracion`
--

DROP TABLE IF EXISTS `estado_restauracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_restauracion` (
  `id_estado_restauracion` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `orden` int NOT NULL,
  `es_final` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_estado_restauracion`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_restauracion`
--

LOCK TABLES `estado_restauracion` WRITE;
/*!40000 ALTER TABLE `estado_restauracion` DISABLE KEYS */;
INSERT INTO `estado_restauracion` VALUES (1,'Borrador','Producto registrado, aún en tienda sin despachar',1,0),(2,'Garantía','Producto despachado al área de restauración',2,0),(3,'Tienda','Producto llegó a tienda, cliente notificado',3,0),(4,'Entregado','Producto entregado al cliente satisfactoriamente',4,0),(5,'Devuelto Taller','Producto rechazado o con defecto, devuelto a taller',5,0),(6,'Finalizado','Proceso cerrado tras 7 días sin reclamación',6,1);
/*!40000 ALTER TABLE `estado_restauracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_usuario`
--

DROP TABLE IF EXISTS `estado_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_usuario` (
  `id_estado_usuario` bigint NOT NULL AUTO_INCREMENT,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `observacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo_estado_id` bigint DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_estado_usuario`),
  KEY `FKnj6ah2qvsmxdqxpu40487cjb1` (`tipo_estado_id`),
  KEY `FKanwoq8y8fbq3ccx6ylxrkpp6m` (`usuario_id`),
  CONSTRAINT `FKanwoq8y8fbq3ccx6ylxrkpp6m` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FKnj6ah2qvsmxdqxpu40487cjb1` FOREIGN KEY (`tipo_estado_id`) REFERENCES `tipo_estado` (`id_tipo_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_usuario`
--

LOCK TABLES `estado_usuario` WRITE;
/*!40000 ALTER TABLE `estado_usuario` DISABLE KEYS */;
INSERT INTO `estado_usuario` VALUES (2,NULL,'2026-07-01 23:52:00.000000',NULL,1,16),(3,NULL,'2026-07-01 23:56:00.000000','pasante',1,17),(4,NULL,'2026-07-03 02:30:00.000000',NULL,1,18),(5,NULL,'2026-07-18 11:03:00.000000','',1,1),(6,NULL,'2026-07-22 08:03:00.000000','DESPIDO',2,17),(7,NULL,'2026-07-22 08:32:00.000000','VACACIONES',5,16),(8,NULL,'2026-08-23 16:00:00.000000',NULL,1,16),(9,NULL,'2026-10-02 01:07:26.266561','Estado inicial al crear el usuario',1,20);
/*!40000 ALTER TABLE `estado_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadorestauracion`
--

DROP TABLE IF EXISTS `estadorestauracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadorestauracion` (
  `id_estado_restauracion` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `orden` int NOT NULL,
  `es_final` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_estado_restauracion`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadorestauracion`
--

LOCK TABLES `estadorestauracion` WRITE;
/*!40000 ALTER TABLE `estadorestauracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadorestauracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filtro_busqueda`
--

DROP TABLE IF EXISTS `filtro_busqueda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filtro_busqueda` (
  `id_filtro_busqueda` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id_filtro_busqueda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtro_busqueda`
--

LOCK TABLES `filtro_busqueda` WRITE;
/*!40000 ALTER TABLE `filtro_busqueda` DISABLE KEYS */;
/*!40000 ALTER TABLE `filtro_busqueda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foto_restauracion`
--

DROP TABLE IF EXISTS `foto_restauracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foto_restauracion` (
  `id_foto_restauracion` bigint NOT NULL AUTO_INCREMENT,
  `historial_id` bigint NOT NULL,
  `url_foto` varchar(255) NOT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_foto_restauracion`),
  KEY `historial_id` (`historial_id`),
  CONSTRAINT `foto_restauracion_ibfk_1` FOREIGN KEY (`historial_id`) REFERENCES `historial_restauracion` (`id_historial_restauracion`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foto_restauracion`
--

LOCK TABLES `foto_restauracion` WRITE;
/*!40000 ALTER TABLE `foto_restauracion` DISABLE KEYS */;
INSERT INTO `foto_restauracion` VALUES (1,1,'/uploads/restauracion/rest_1_1790912232218_0.jpg','ARTICULO','2026-10-01 22:37:12'),(2,2,'/uploads/restauracion/rest_1_1790912340623_0.png','PROCESO','2026-10-01 22:39:01'),(3,4,'/uploads/restauracion/rest_1_1790912457630_0.jpg','PROCESO','2026-10-01 22:40:58'),(4,6,'/uploads/restauracion/rest_1_1790912559780_0.png','PROCESO','2026-10-01 22:42:40'),(5,7,'/uploads/restauracion/rest_2_1790912706329_0.png','ARTICULO','2026-10-01 22:45:06'),(6,9,'/uploads/restauracion/rest_4_1790916657236_0.png','ARTICULO','2026-10-01 23:50:57'),(7,10,'/uploads/restauracion/rest_5_1790916833483_0.png','ARTICULO','2026-10-01 23:53:53'),(8,11,'/uploads/restauracion/rest_6_1790917018498_0.png','ARTICULO','2026-10-01 23:56:59'),(9,12,'/uploads/restauracion/rest_7_1790918003080_0.png','ARTICULO','2026-10-02 00:13:23'),(10,13,'/uploads/restauracion/rest_3_1790918988815_0.png','PROCESO','2026-10-02 00:29:49'),(11,13,'/uploads/restauracion/rest_3_1790918988831_1.png','PROCESO','2026-10-02 00:29:49'),(12,14,'/uploads/restauracion/rest_8_1790919052596_0.png','ARTICULO','2026-10-02 00:30:53'),(13,14,'/uploads/restauracion/rest_8_1790919052606_1.png','ARTICULO','2026-10-02 00:30:53'),(14,15,'/uploads/restauracion/rest_9_1790920407682_0.png','ARTICULO','2026-10-02 00:53:28');
/*!40000 ALTER TABLE `foto_restauracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guia_restauracion`
--

DROP TABLE IF EXISTS `guia_restauracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guia_restauracion` (
  `id_guia_restauracion` bigint NOT NULL AUTO_INCREMENT,
  `numero_guia` varchar(50) NOT NULL,
  `transportadora` varchar(100) DEFAULT NULL,
  `observaciones` text,
  `fecha_creacion` datetime NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id_guia_restauracion`),
  UNIQUE KEY `numero_guia` (`numero_guia`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `guia_restauracion_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guia_restauracion`
--

LOCK TABLES `guia_restauracion` WRITE;
/*!40000 ALTER TABLE `guia_restauracion` DISABLE KEYS */;
INSERT INTO `guia_restauracion` VALUES (1,'97672506776','COORDINADORA',NULL,'2026-10-01 22:39:01',16),(2,'97672507878',NULL,NULL,'2026-10-01 22:41:45',16),(3,'97672507890',NULL,NULL,'2026-10-01 22:47:58',16),(4,'9767250990','COORDINADORA',NULL,'2026-10-02 01:00:11',16),(5,'97672508801','COORDINADORA',NULL,'2026-10-02 01:00:40',16);
/*!40000 ALTER TABLE `guia_restauracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guiarestauracion`
--

DROP TABLE IF EXISTS `guiarestauracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guiarestauracion` (
  `id_guia_restauracion` bigint NOT NULL AUTO_INCREMENT,
  `numero_guia` varchar(50) NOT NULL,
  `transportadora` varchar(100) DEFAULT NULL,
  `observaciones` text,
  `fecha_creacion` datetime NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id_guia_restauracion`),
  UNIQUE KEY `numero_guia` (`numero_guia`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `guiarestauracion_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guiarestauracion`
--

LOCK TABLES `guiarestauracion` WRITE;
/*!40000 ALTER TABLE `guiarestauracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `guiarestauracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_restauracion`
--

DROP TABLE IF EXISTS `historial_restauracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_restauracion` (
  `id_historial_restauracion` bigint NOT NULL AUTO_INCREMENT,
  `restauracion_id` bigint NOT NULL,
  `estado_anterior_id` bigint DEFAULT NULL,
  `estado_nuevo_id` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  `comentario` text,
  `es_automatico` tinyint(1) NOT NULL DEFAULT '0',
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_historial_restauracion`),
  KEY `restauracion_id` (`restauracion_id`),
  KEY `estado_anterior_id` (`estado_anterior_id`),
  KEY `estado_nuevo_id` (`estado_nuevo_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `historial_restauracion_ibfk_1` FOREIGN KEY (`restauracion_id`) REFERENCES `restauracion` (`id_restauracion`) ON DELETE CASCADE,
  CONSTRAINT `historial_restauracion_ibfk_2` FOREIGN KEY (`estado_anterior_id`) REFERENCES `estado_restauracion` (`id_estado_restauracion`),
  CONSTRAINT `historial_restauracion_ibfk_3` FOREIGN KEY (`estado_nuevo_id`) REFERENCES `estado_restauracion` (`id_estado_restauracion`),
  CONSTRAINT `historial_restauracion_ibfk_4` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_restauracion`
--

LOCK TABLES `historial_restauracion` WRITE;
/*!40000 ALTER TABLE `historial_restauracion` DISABLE KEYS */;
INSERT INTO `historial_restauracion` VALUES (1,1,NULL,1,16,'Restauración creada. Producto en tienda con SPV: 5394000002782',0,'2026-10-01 22:37:12'),(2,1,1,2,16,'producto enviado a taller garantias',0,'2026-10-01 22:39:01'),(3,1,2,3,16,'Llego a tienda en perfecto estado',0,'2026-10-01 22:40:13'),(4,1,3,4,16,'el producto fue entregado, pero el cliente lo rechazo, por motivo de peladura (adjunto memo)',0,'2026-10-01 22:40:58'),(5,1,4,5,16,'devolucion taller N° guia 97672507878',0,'2026-10-01 22:41:25'),(6,1,5,4,16,'Producto regreso de taller con mejoras. Cliente recibe feliz',0,'2026-10-01 22:42:40'),(7,2,NULL,1,16,'Restauración creada. Producto en tienda con SPV: 5394000002783',0,'2026-10-01 22:45:06'),(8,3,NULL,1,16,'Restauración creada. Producto en tienda con SPV: 5394000002785',0,'2026-10-01 22:46:24'),(9,4,NULL,1,16,'Restauración creada. Producto en tienda con SPV: 5394000002787',0,'2026-10-01 23:50:57'),(10,5,NULL,1,16,'Restauración creada. Producto en tienda con SPV: 5394000002790',0,'2026-10-01 23:53:53'),(11,6,NULL,1,16,'Restauración creada. Producto en tienda con SPV: 5394000002789',0,'2026-10-01 23:56:58'),(12,7,NULL,1,16,'Restauración creada. Producto en tienda con SPV: 5394000002795',0,'2026-10-02 00:13:23'),(13,3,1,2,16,'se envia producto a restaurar',0,'2026-10-02 00:29:49'),(14,8,NULL,1,16,'Restauración creada. Producto en tienda con SPV: 5394000002801',0,'2026-10-02 00:30:53'),(15,9,NULL,1,16,'Restauración creada. Producto en tienda con SPV: 5394000004034',0,'2026-10-02 00:53:28');
/*!40000 ALTER TABLE `historial_restauracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_proyeccion`
--

DROP TABLE IF EXISTS `metodo_proyeccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_proyeccion` (
  `id_metodo_proyeccion` bigint NOT NULL AUTO_INCREMENT,
  `nombre_metodo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_metodo_proyeccion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_proyeccion`
--

LOCK TABLES `metodo_proyeccion` WRITE;
/*!40000 ALTER TABLE `metodo_proyeccion` DISABLE KEYS */;
INSERT INTO `metodo_proyeccion` VALUES (1,'Promedio Histórico'),(2,'Suma Acumulada'),(3,'Conteo de Ocurrencias');
/*!40000 ALTER TABLE `metodo_proyeccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento_prod`
--

DROP TABLE IF EXISTS `movimiento_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento_prod` (
  `id_movimiento_inv` bigint NOT NULL AUTO_INCREMENT,
  `cantidad_desplazada` int DEFAULT NULL,
  `fecha_movimiento` datetime(6) DEFAULT NULL,
  `motivo_repor` varchar(255) DEFAULT NULL,
  `picker_checker` varchar(255) DEFAULT NULL,
  `producto_id` bigint DEFAULT NULL,
  `tipo_movimiento_id` bigint DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_movimiento_inv`),
  KEY `FKe4x52frf9bfkwv1r3b5c4ssvj` (`producto_id`),
  KEY `FKddpku4stfidlen6u8dah4x8u1` (`tipo_movimiento_id`),
  KEY `FKcdj4kctpo1hgljymu5hsbv9wk` (`usuario_id`),
  CONSTRAINT `FKcdj4kctpo1hgljymu5hsbv9wk` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FKddpku4stfidlen6u8dah4x8u1` FOREIGN KEY (`tipo_movimiento_id`) REFERENCES `tipo_movimiento` (`id_tipo_movimiento`),
  CONSTRAINT `FKe4x52frf9bfkwv1r3b5c4ssvj` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento_prod`
--

LOCK TABLES `movimiento_prod` WRITE;
/*!40000 ALTER TABLE `movimiento_prod` DISABLE KEYS */;
INSERT INTO `movimiento_prod` VALUES (1,80,'2026-10-02 00:00:00.617097','Retiro automático por vencimiento',NULL,69,7,1),(2,550,'2026-10-02 00:00:00.672919','Retiro automático por vencimiento',NULL,72,7,1),(3,70,'2026-10-02 00:00:00.685466','Retiro automático por vencimiento',NULL,81,7,1),(4,60,'2026-10-02 00:00:00.699083','Retiro automático por vencimiento',NULL,84,7,1);
/*!40000 ALTER TABLE `movimiento_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_compra`
--

DROP TABLE IF EXISTS `pedido_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_compra` (
  `id_pedido` bigint NOT NULL AUTO_INCREMENT,
  `fecha_pedido` datetime(6) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `total_pedido` decimal(38,2) DEFAULT NULL,
  `estado_pedido_id` bigint DEFAULT NULL,
  `proveedor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `FKbt6vvu1a7q4aixbsiqcrn3pe3` (`estado_pedido_id`),
  KEY `FKbjix9einfbioq2rftbeufjw1u` (`proveedor_id`),
  CONSTRAINT `FKbjix9einfbioq2rftbeufjw1u` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `FKbt6vvu1a7q4aixbsiqcrn3pe3` FOREIGN KEY (`estado_pedido_id`) REFERENCES `estado_pedido` (`id_estado_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_compra`
--

LOCK TABLES `pedido_compra` WRITE;
/*!40000 ALTER TABLE `pedido_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` bigint NOT NULL AUTO_INCREMENT,
  `fecha_expiracion` datetime(6) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `fecha_modificacion` datetime(6) NOT NULL,
  `lote_producto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_prod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stock` int NOT NULL,
  `stock_maximo` int NOT NULL,
  `stock_minimo` int NOT NULL,
  `categoria_id` bigint DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `precio_venta` decimal(38,2) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `FKodqr7965ok9rwquj1utiamt0m` (`categoria_id`),
  KEY `FK4f8g2yvj0uj7hqxlauy8p8k39` (`usuario_id`),
  CONSTRAINT `FK4f8g2yvj0uj7hqxlauy8p8k39` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FKodqr7965ok9rwquj1utiamt0m` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (67,'2026-12-31 00:00:00.000000','2026-07-01 19:07:56.000000','2026-08-23 13:32:32.247013','L-2025-001','Acetaminofén 500mg Tab x10',379,500,50,51,16,1,NULL),(68,'2026-10-31 00:00:00.000000','2026-07-01 19:07:56.000000','2026-08-23 13:32:32.281626','L-2025-002','Acetaminofén 1g Tab x10',194,400,40,51,16,1,NULL),(69,'2026-08-31 00:00:00.000000','2026-07-01 19:07:56.000000','2026-10-02 00:00:00.730732','L-2025-003','Acetaminofén Jarabe 120mg/5ml',0,150,15,51,16,1,NULL),(70,'2026-11-30 00:00:00.000000','2026-07-01 19:07:56.000000','2026-07-02 00:01:27.622450','L-2025-004','Dipirona 500mg Tab x10',155,300,30,51,16,1,NULL),(71,'2027-01-31 00:00:00.000000','2026-07-01 19:07:56.000000','2026-07-01 19:07:56.000000','L-2025-005','Tramadol 50mg Cap x10',60,100,10,51,16,1,NULL),(72,'2026-09-30 00:00:00.000000','2026-07-01 19:08:49.000000','2026-10-02 00:00:00.747866','L-2025-006','Ibuprofeno 400mg Tab x10',0,500,50,3,16,1,NULL),(73,'2026-07-31 00:00:00.000000','2026-07-01 19:08:49.000000','2026-08-15 00:00:00.489342','L-2025-007','Ibuprofeno 600mg Tab x10',0,350,30,3,16,1,NULL),(74,'2026-11-30 00:00:00.000000','2026-07-01 19:08:49.000000','2026-07-01 19:08:49.000000','L-2025-008','Diclofenaco 50mg Tab x10',120,250,25,3,16,1,NULL),(75,'2027-02-28 00:00:00.000000','2026-07-01 19:08:49.000000','2026-07-17 00:01:32.764619','L-2025-009','Naproxeno 500mg Tab x10',86,200,20,3,16,1,NULL),(76,'2027-03-31 00:00:00.000000','2026-07-01 19:08:49.000000','2026-07-01 19:08:49.000000','L-2025-010','Meloxicam 15mg Tab x10',70,150,15,3,16,1,NULL),(77,'2026-07-07 00:00:00.000000','2026-07-01 19:09:18.000000','2026-07-05 23:15:41.318797','L-2025-011','Amoxicilina 500mg Cap x10',0,200,20,2,16,1,NULL),(78,'2026-05-31 00:00:00.000000','2026-07-01 19:09:18.000000','2026-07-05 21:33:03.650530','L-2025-012','Amoxicilina 250mg/5ml Susp',0,100,10,2,16,1,NULL),(79,'2027-01-31 00:00:00.000000','2026-07-01 19:09:18.000000','2026-07-01 19:09:18.000000','L-2025-013','Azitromicina 500mg Tab x3',80,150,15,2,16,1,NULL),(80,'2026-10-31 00:00:00.000000','2026-07-01 19:09:18.000000','2026-07-01 19:09:18.000000','L-2025-014','Ciprofloxacino 500mg Tab x10',60,120,10,2,16,1,NULL),(81,'2026-08-31 00:00:00.000000','2026-07-01 19:09:18.000000','2026-10-02 00:00:00.748873','L-2025-015','Metronidazol 500mg Tab x10',0,140,15,2,16,1,NULL),(82,'2026-12-31 00:00:00.000000','2026-07-01 19:09:18.000000','2026-07-02 00:01:27.622450','L-2025-016','Cefalexina 500mg Cap x10',61,110,10,2,16,1,NULL),(83,'2027-04-30 00:00:00.000000','2026-07-01 19:09:58.000000','2026-07-01 19:09:58.000000','L-2025-017','Loratadina 10mg Tab x10',200,400,40,5,16,1,NULL),(84,'2026-09-30 00:00:00.000000','2026-07-01 19:09:58.000000','2026-10-02 00:00:00.748873','L-2025-018','Loratadina Jarabe 5mg/5ml',0,120,12,5,16,1,NULL),(85,'2027-02-28 00:00:00.000000','2026-07-01 19:09:58.000000','2026-07-01 19:09:58.000000','L-2025-019','Cetirizina 10mg Tab x10',150,300,30,5,16,1,NULL),(86,'2026-11-30 00:00:00.000000','2026-07-01 19:09:58.000000','2026-07-01 19:09:58.000000','L-2025-020','Difenhidramina 50mg Cap x10',80,150,15,5,16,1,NULL),(87,'2027-05-31 00:00:00.000000','2026-07-01 19:09:58.000000','2026-07-01 19:09:58.000000','L-2025-021','Desloratadina 5mg Tab x10',90,180,20,5,16,1,NULL),(88,'2027-01-31 00:00:00.000000','2026-07-01 19:10:23.000000','2026-07-01 19:10:23.000000','L-2025-022','Omeprazol 20mg Cap x10',180,360,35,6,16,1,NULL),(89,'2027-03-31 00:00:00.000000','2026-07-01 19:10:23.000000','2026-07-01 19:10:23.000000','L-2025-023','Omeprazol 40mg Cap x10',100,200,20,6,16,1,NULL),(90,'2026-07-31 00:00:00.000000','2026-07-01 19:10:23.000000','2026-08-15 00:00:00.520319','L-2025-024','Ranitidina 150mg Tab x10',0,240,25,6,16,1,NULL),(91,'2026-10-31 00:00:00.000000','2026-07-01 19:10:23.000000','2026-07-01 19:10:23.000000','L-2025-025','Hidróxido de Aluminio Susp',70,140,15,6,16,1,NULL),(92,'2027-02-28 00:00:00.000000','2026-07-01 19:10:23.000000','2026-07-01 19:10:23.000000','L-2025-026','Sucralfato 1g Tab x10',50,100,10,6,16,1,NULL),(93,'2027-06-30 00:00:00.000000','2026-07-01 19:11:05.000000','2026-07-01 19:11:05.000000','L-2025-027','Losartán 50mg Tab x30',150,300,30,17,16,1,NULL),(94,'2027-04-30 00:00:00.000000','2026-07-01 19:11:05.000000','2026-07-01 19:11:05.000000','L-2025-028','Enalapril 10mg Tab x30',120,240,25,17,16,1,NULL),(95,'2027-05-31 00:00:00.000000','2026-07-01 19:11:05.000000','2026-07-01 19:11:05.000000','L-2025-029','Amlodipino 5mg Tab x30',100,200,20,17,16,1,NULL),(96,'2027-03-31 00:00:00.000000','2026-07-01 19:11:05.000000','2026-07-01 19:11:05.000000','L-2025-030','Metoprolol 50mg Tab x30',80,160,15,17,16,1,NULL),(97,'2027-08-31 00:00:00.000000','2026-07-01 19:11:31.000000','2026-07-02 21:41:16.977989','L-2025-031','Vitamina C 500mg Tab x10',296,600,50,23,16,1,NULL),(98,'2028-01-31 00:00:00.000000','2026-07-01 19:11:31.000000','2026-07-01 19:11:31.000000','L-2025-032','Vitamina D3 1000 UI Cap x30',150,300,30,23,16,1,NULL),(99,'2027-07-31 00:00:00.000000','2026-07-01 19:11:31.000000','2026-07-01 19:11:31.000000','L-2025-033','Complejo B Tab x30',200,400,40,23,16,1,NULL),(100,'2027-09-30 00:00:00.000000','2026-07-01 19:11:31.000000','2026-07-01 19:11:31.000000','L-2025-034','Calcio + Vitamina D Tab x30',100,200,20,23,16,1,NULL),(101,'2027-06-30 00:00:00.000000','2026-07-01 19:11:31.000000','2026-07-01 19:11:31.000000','L-2025-035','Ácido Fólico 1mg Tab x30',120,240,25,23,16,1,NULL),(102,'2027-05-31 00:00:00.000000','2026-07-01 19:11:31.000000','2026-07-01 19:11:31.000000','L-2025-036','Hierro + Ácido Fólico Tab x30',90,180,20,23,16,1,NULL),(103,'2027-04-30 00:00:00.000000','2026-07-01 19:11:59.000000','2026-07-01 19:11:59.000000','L-2025-037','Metformina 500mg Tab x30',120,240,25,18,16,1,NULL),(104,'2027-03-31 00:00:00.000000','2026-07-01 19:11:59.000000','2026-07-01 19:11:59.000000','L-2025-038','Metformina 850mg Tab x30',100,200,20,18,16,1,NULL),(105,'2027-02-28 00:00:00.000000','2026-07-01 19:11:59.000000','2026-07-01 19:11:59.000000','L-2025-039','Glibenclamida 5mg Tab x30',80,160,15,18,16,1,NULL),(106,'2027-01-31 00:00:00.000000','2026-07-01 19:12:51.000000','2026-07-01 19:12:51.000000','L-2025-040','Fluconazol 150mg Cap x1',60,120,10,13,16,1,NULL),(107,'2027-06-30 00:00:00.000000','2026-07-01 19:12:51.000000','2026-07-01 19:12:51.000000','L-2025-041','Clotrimazol Crema 1% x20g',80,160,15,13,16,1,NULL),(108,'2027-05-31 00:00:00.000000','2026-07-01 19:12:51.000000','2026-07-01 19:12:51.000000','L-2025-042','Ketoconazol Champú 2% x120ml',50,100,10,13,16,1,NULL),(109,'2027-04-30 00:00:00.000000','2026-07-01 19:12:51.000000','2026-07-01 19:12:51.000000','L-2025-043','Terbinafina 250mg Tab x14',40,80,8,13,16,1,NULL),(110,'2027-08-31 00:00:00.000000','2026-07-01 19:15:02.000000','2026-07-01 19:15:02.000000','L-2025-044','Yodo Povidona 10% x120ml',100,200,20,52,16,1,NULL),(111,'2028-01-31 00:00:00.000000','2026-07-01 19:15:02.000000','2026-07-01 19:15:02.000000','L-2025-045','Alcohol Antiséptico 70% x250ml',200,400,40,52,16,1,NULL),(112,'2027-06-30 00:00:00.000000','2026-07-01 19:15:02.000000','2026-07-01 19:15:02.000000','L-2025-046','Suero Fisiológico 0.9% x500ml',80,160,15,52,16,1,NULL),(113,'2028-06-30 00:00:00.000000','2026-07-01 19:15:02.000000','2026-07-01 19:15:02.000000','L-2025-047','Gasas Estériles x10 Sobres',150,300,30,52,16,1,NULL),(114,'2028-12-31 00:00:00.000000','2026-07-01 19:15:02.000000','2026-07-01 19:15:02.000000','L-2025-048','Vendas Elásticas 5cm x4.5m',100,200,20,52,16,1,NULL),(115,'2029-01-31 00:00:00.000000','2026-07-01 19:15:02.000000','2026-07-01 19:15:02.000000','L-2025-049','Jeringas 5ml c/Aguja x10',120,250,25,52,16,1,NULL),(116,'2027-12-31 00:00:00.000000','2026-07-01 19:15:02.000000','2026-07-01 19:15:02.000000','L-2025-050','Tapabocas Quirúrgico x50',80,160,15,52,16,1,NULL),(117,'2026-07-06 19:19:29.000000','2026-07-01 19:19:29.000000','2026-07-09 00:00:00.185779','L-2025-V01','Tetracilina 500mg Cap x10',0,100,10,2,16,1,NULL),(118,'2026-07-04 19:19:29.000000','2026-07-01 19:19:29.000000','2026-07-06 00:00:00.086001','L-2025-V02','Eritromicina 500mg Tab x10',0,100,10,2,16,1,NULL),(120,'2026-07-02 22:03:00.000000','2026-07-01 22:03:12.190979','2026-07-05 23:12:17.408631','L-1212-1212','perromol',0,100,10,10,16,0,NULL),(122,'2026-07-07 11:47:00.000000','2026-07-05 21:45:58.373533','2026-07-09 00:00:00.211018','L-1212-1212','perromol',0,100,10,13,16,0,NULL);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` bigint NOT NULL AUTO_INCREMENT,
  `nit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nombre_prov` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (2,'800.123.456-1','Droguerías Aliadas de la Costa S.A.S.',NULL),(3,'890300279-1','Tecnoquímicas S.A.',NULL),(4,'860005934-2','Laboratorios Genfar S.A.S.',NULL),(5,'890900115-3','Droguerías Cruz Verde S.A.S.',NULL),(6,'860002130-4','Bayer S.A.',NULL),(7,'800254063-5','Copidrogas (Cooperativa Nacional de Droguistas)',NULL),(8,'860010165-6','Laboratorios Procaps S.A.',NULL),(9,'900123456-7','Distribuidora Médica del Caribe S.A.S.',NULL),(10,'890201880-8','Abbott Laboratories de Colombia S.A.',NULL),(11,'860000210-9','Pfizer S.A.S.',NULL),(12,'901456789-0','Suministros Hospitalarios y Medicamentos del Interior',NULL),(14,'12222232','Carmen Alicia',NULL);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecciones`
--

DROP TABLE IF EXISTS `proyecciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyecciones` (
  `id_proyecciones` bigint NOT NULL AUTO_INCREMENT,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `fecha_generacion` datetime(6) NOT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `pedidos_estimados` int DEFAULT NULL,
  `referencia_tipo` varchar(255) DEFAULT NULL,
  `resultado_proyeccion` varchar(255) DEFAULT NULL,
  `unidad_medida` varchar(255) DEFAULT NULL,
  `categoria_id` bigint DEFAULT NULL,
  `metodo_proyeccion_id` bigint DEFAULT NULL,
  `producto_id` bigint DEFAULT NULL,
  `tipo_proyeccion_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_proyecciones`),
  KEY `FK797huv4e980522a03cyhyq6fa` (`categoria_id`),
  KEY `FKkj9js3pyn8n97gyhscd2f2jwq` (`metodo_proyeccion_id`),
  KEY `FKmw4g0jhq595oib8nxxr80io5y` (`producto_id`),
  KEY `FKq8ige04jmwbj9h189rgvum7et` (`tipo_proyeccion_id`),
  CONSTRAINT `FK797huv4e980522a03cyhyq6fa` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `FKkj9js3pyn8n97gyhscd2f2jwq` FOREIGN KEY (`metodo_proyeccion_id`) REFERENCES `metodo_proyeccion` (`id_metodo_proyeccion`),
  CONSTRAINT `FKmw4g0jhq595oib8nxxr80io5y` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `FKq8ige04jmwbj9h189rgvum7et` FOREIGN KEY (`tipo_proyeccion_id`) REFERENCES `tipo_proyeccion` (`id_tipo_proyeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecciones`
--

LOCK TABLES `proyecciones` WRITE;
/*!40000 ALTER TABLE `proyecciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte_inv`
--

DROP TABLE IF EXISTS `reporte_inv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte_inv` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contenido_json` longtext,
  `fecha_generacion` datetime(6) DEFAULT NULL,
  `url_resultado` varchar(255) DEFAULT NULL,
  `tipo_reporte` varchar(255) DEFAULT NULL,
  `tipo_resultado` varchar(255) DEFAULT NULL,
  `alerta_inv_id` bigint DEFAULT NULL,
  `filtro_busqueda_id` bigint DEFAULT NULL,
  `movimiento_prod_id` bigint DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9wuwsjvdrjjjft4lk23p19kda` (`alerta_inv_id`),
  KEY `FKiwvucw5oa5btb45vfk0t1uswi` (`filtro_busqueda_id`),
  KEY `FKq4gsqvedh677mimkbhbkp3mds` (`movimiento_prod_id`),
  KEY `FKnvfb9urag9arquu90or6cgxdy` (`usuario_id`),
  CONSTRAINT `FK9wuwsjvdrjjjft4lk23p19kda` FOREIGN KEY (`alerta_inv_id`) REFERENCES `alerta_inv` (`id_alerta`),
  CONSTRAINT `FKiwvucw5oa5btb45vfk0t1uswi` FOREIGN KEY (`filtro_busqueda_id`) REFERENCES `filtro_busqueda` (`id_filtro_busqueda`),
  CONSTRAINT `FKnvfb9urag9arquu90or6cgxdy` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FKq4gsqvedh677mimkbhbkp3mds` FOREIGN KEY (`movimiento_prod_id`) REFERENCES `movimiento_prod` (`id_movimiento_inv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte_inv`
--

LOCK TABLES `reporte_inv` WRITE;
/*!40000 ALTER TABLE `reporte_inv` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte_inv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restauracion`
--

DROP TABLE IF EXISTS `restauracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restauracion` (
  `id_restauracion` bigint NOT NULL AUTO_INCREMENT,
  `numero_spv` varchar(50) NOT NULL,
  `cliente_id` bigint NOT NULL,
  `usuario_registra_id` bigint NOT NULL,
  `usuario_entrega_id` bigint DEFAULT NULL,
  `tipo_restauracion_id` bigint NOT NULL,
  `estado_actual_id` bigint NOT NULL,
  `articulo` varchar(200) NOT NULL,
  `descripcion` text,
  `telefono_contacto` varchar(30) DEFAULT NULL,
  `correo_contacto` varchar(120) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_llegada_tienda` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `fecha_devolucion` datetime DEFAULT NULL,
  `observaciones` text,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_restauracion`),
  UNIQUE KEY `numero_spv` (`numero_spv`),
  KEY `cliente_id` (`cliente_id`),
  KEY `usuario_registra_id` (`usuario_registra_id`),
  KEY `usuario_entrega_id` (`usuario_entrega_id`),
  KEY `tipo_restauracion_id` (`tipo_restauracion_id`),
  KEY `estado_actual_id` (`estado_actual_id`),
  CONSTRAINT `restauracion_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `restauracion_ibfk_2` FOREIGN KEY (`usuario_registra_id`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `restauracion_ibfk_3` FOREIGN KEY (`usuario_entrega_id`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `restauracion_ibfk_4` FOREIGN KEY (`tipo_restauracion_id`) REFERENCES `tipo_restauracion` (`id_tipo_restauracion`),
  CONSTRAINT `restauracion_ibfk_5` FOREIGN KEY (`estado_actual_id`) REFERENCES `estado_restauracion` (`id_estado_restauracion`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restauracion`
--

LOCK TABLES `restauracion` WRITE;
/*!40000 ALTER TABLE `restauracion` DISABLE KEYS */;
INSERT INTO `restauracion` VALUES (1,'5394000002782',4,16,16,13,4,'Morral de cuero. ','Se recibe morral cuero en mal estado',NULL,NULL,'2026-10-01 22:37:12','2026-10-01 22:40:13','2026-10-01 22:42:40','2026-10-01 22:41:25','Cliente pide arreglo general',1),(2,'5394000002783',5,16,NULL,29,1,'calzado masculino desgastado.','se recibe en muy mal estado.','3127414141','estebanort12@gmail.com','2026-10-01 22:45:06',NULL,NULL,NULL,'cliente solicita restauracion general.',1),(3,'5394000002785',5,16,NULL,13,2,'Morral de cuero. ','sn',NULL,NULL,'2026-10-01 22:46:24',NULL,NULL,NULL,'sn',1),(4,'5394000002787',5,16,NULL,5,1,'Morral de cuero. ','sn',NULL,NULL,'2026-10-01 23:50:57',NULL,NULL,NULL,'sn',1),(5,'5394000002790',6,16,NULL,17,1,'bota desgastada','sn','3204567898','carogloka12@gmail.com','2026-10-01 23:53:53',NULL,NULL,NULL,'sn',1),(6,'5394000002789',6,16,NULL,10,1,'bolso viejo','sn',NULL,NULL,'2026-10-01 23:56:58',NULL,NULL,NULL,'sn',1),(7,'5394000002795',5,16,NULL,10,1,'bolso viejo','sn',NULL,NULL,'2026-10-02 00:13:23',NULL,NULL,NULL,'sn',1),(8,'5394000002801',5,16,NULL,16,1,'calzado femenino desgastado.','sn',NULL,NULL,'2026-10-02 00:30:53',NULL,NULL,NULL,'sn',1),(9,'5394000004034',5,16,NULL,5,1,'Morral de cuero. ','AZ',NULL,NULL,'2026-10-02 00:53:28',NULL,NULL,NULL,'AZ',1);
/*!40000 ALTER TABLE `restauracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restauracion_guia`
--

DROP TABLE IF EXISTS `restauracion_guia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restauracion_guia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `restauracion_id` bigint NOT NULL,
  `guia_id` bigint NOT NULL,
  `fecha_asignacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_rest_guia` (`restauracion_id`,`guia_id`),
  UNIQUE KEY `UKfs7q0lnwnpfq5v40bsp1kih8x` (`restauracion_id`,`guia_id`),
  KEY `guia_id` (`guia_id`),
  CONSTRAINT `restauracion_guia_ibfk_1` FOREIGN KEY (`restauracion_id`) REFERENCES `restauracion` (`id_restauracion`) ON DELETE CASCADE,
  CONSTRAINT `restauracion_guia_ibfk_2` FOREIGN KEY (`guia_id`) REFERENCES `guia_restauracion` (`id_guia_restauracion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restauracion_guia`
--

LOCK TABLES `restauracion_guia` WRITE;
/*!40000 ALTER TABLE `restauracion_guia` DISABLE KEYS */;
INSERT INTO `restauracion_guia` VALUES (1,1,1,'2026-10-01 22:39:01'),(2,1,2,'2026-10-01 22:41:45'),(3,2,3,'2026-10-01 22:47:58'),(4,3,3,'2026-10-01 22:47:58'),(5,4,4,'2026-10-02 01:00:11'),(6,7,4,'2026-10-02 01:00:11'),(7,8,4,'2026-10-02 01:00:11'),(8,5,5,'2026-10-02 01:00:40'),(9,6,5,'2026-10-02 01:00:40'),(10,9,5,'2026-10-02 01:00:41');
/*!40000 ALTER TABLE `restauracion_guia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscriptor`
--

DROP TABLE IF EXISTS `suscriptor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscriptor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `correo` varchar(100) NOT NULL,
  `fecha_suscripcion` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK72ujk5fiqmgnyn6y6yu2daqoo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscriptor`
--

LOCK TABLES `suscriptor` WRITE;
/*!40000 ALTER TABLE `suscriptor` DISABLE KEYS */;
/*!40000 ALTER TABLE `suscriptor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono` (
  `id_telefono` bigint NOT NULL AUTO_INCREMENT,
  `complemento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numero` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cliente_id` bigint DEFAULT NULL,
  `proveedor_id` bigint DEFAULT NULL,
  `tipo_telefono_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_telefono`),
  KEY `FK3cti5jlsdbqd6183co02gwbnv` (`cliente_id`),
  KEY `FK2ujupbhtd9g56f7s7rvn0tyso` (`proveedor_id`),
  KEY `FK40gcx1yiav5t3c1odf80h1tvp` (`tipo_telefono_id`),
  CONSTRAINT `FK2ujupbhtd9g56f7s7rvn0tyso` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `FK3cti5jlsdbqd6183co02gwbnv` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `FK40gcx1yiav5t3c1odf80h1tvp` FOREIGN KEY (`tipo_telefono_id`) REFERENCES `tipo_telefono` (`id_tipo_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES (1,'Llamar despues de las 12PM','3001234567',1,NULL,1),(2,'+57','3043887661',3,NULL,1),(3,'+57','3043887661',NULL,2,1),(4,'+57','3127414141',5,NULL,1),(5,NULL,'3204567898',6,NULL,1);
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_correo`
--

DROP TABLE IF EXISTS `tipo_correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_correo` (
  `id_tipo_correo` bigint NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipo_correo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_correo`
--

LOCK TABLES `tipo_correo` WRITE;
/*!40000 ALTER TABLE `tipo_correo` DISABLE KEYS */;
INSERT INTO `tipo_correo` VALUES (1,'Corporativo'),(2,'Personal'),(3,'Institucional');
/*!40000 ALTER TABLE `tipo_correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_direccion`
--

DROP TABLE IF EXISTS `tipo_direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_direccion` (
  `id_tipo_direccion` bigint NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipo_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_direccion`
--

LOCK TABLES `tipo_direccion` WRITE;
/*!40000 ALTER TABLE `tipo_direccion` DISABLE KEYS */;
INSERT INTO `tipo_direccion` VALUES (1,'Residencial'),(2,'Bodega Principal'),(3,'Consultorio');
/*!40000 ALTER TABLE `tipo_direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_estado`
--

DROP TABLE IF EXISTS `tipo_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_estado` (
  `id_tipo_estado` bigint NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipo_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_estado`
--

LOCK TABLES `tipo_estado` WRITE;
/*!40000 ALTER TABLE `tipo_estado` DISABLE KEYS */;
INSERT INTO `tipo_estado` VALUES (1,'Activo','Usuario con acceso total al sistema y funciones habilitadas.'),(2,'Inactivo','Cuenta deshabilitada. El usuario no puede iniciar sesión.'),(3,'Bloqueado','Acceso restringido por seguridad tras múltiples intentos fallidos.'),(4,'Ausente','El usuario está logueado pero no disponible para asignación de tareas.'),(5,'Vacaciones','Estado temporal para usuarios en periodo de descanso legal.'),(6,'Pendiente','Usuario registrado que aún no ha confirmado su correo electrónico.');
/*!40000 ALTER TABLE `tipo_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_movimiento`
--

DROP TABLE IF EXISTS `tipo_movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_movimiento` (
  `id_tipo_movimiento` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nombre_movimiento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `signo` int DEFAULT NULL,
  PRIMARY KEY (`id_tipo_movimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_movimiento`
--

LOCK TABLES `tipo_movimiento` WRITE;
/*!40000 ALTER TABLE `tipo_movimiento` DISABLE KEYS */;
INSERT INTO `tipo_movimiento` VALUES (1,'Entrada de mercancía por factura de proveedor','Compra',1),(2,'Retorno de producto por parte del comprador','Devolución de Cliente',1),(3,'Ajuste manual al encontrar más stock físico del esperado','Nivelación Positiva',1),(4,'Mercancía que llega desde otra bodega o sucursal','Traslado Recibido',1),(5,'Reingreso de producto por cancelación de factura','Anulación de Venta',1),(6,'Salida de producto por transacción comercial','Venta',-1),(7,'Baja de producto por fecha de caducidad superada','Retiro por Vencimiento',-1),(8,'Retiro de stock por averías, ruptura o mal estado','Mercancía Dañada',-1),(9,'Salida de mercancía hacia otra ubicación o tienda','Traslado Enviado',-1),(10,'Ajuste manual por pérdida, robo o error de conteo','Nivelación Negativa',-1),(11,'Uso de insumos para la operación de la clínica/local','Consumo Interno',-1),(12,'Mercancía devuelta al proveedor de origen','Devolución al proveedor',-1);
/*!40000 ALTER TABLE `tipo_movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_proyeccion`
--

DROP TABLE IF EXISTS `tipo_proyeccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_proyeccion` (
  `id_tipo_proyeccion` bigint NOT NULL AUTO_INCREMENT,
  `nombre_proyeccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipo_proyeccion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_proyeccion`
--

LOCK TABLES `tipo_proyeccion` WRITE;
/*!40000 ALTER TABLE `tipo_proyeccion` DISABLE KEYS */;
INSERT INTO `tipo_proyeccion` VALUES (1,'Productos Más Vendidos'),(2,'Productos Menos Vendidos'),(3,'Retiros por Vencimiento'),(4,'Ventas por Categoría'),(5,'Proveedores Más Fiables'),(6,'Clientes Más Fieles'),(7,'Precios de Mercado');
/*!40000 ALTER TABLE `tipo_proyeccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_restauracion`
--

DROP TABLE IF EXISTS `tipo_restauracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_restauracion` (
  `id_tipo_restauracion` bigint NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_tipo_restauracion`),
  UNIQUE KEY `tipo` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_restauracion`
--

LOCK TABLES `tipo_restauracion` WRITE;
/*!40000 ALTER TABLE `tipo_restauracion` DISABLE KEYS */;
INSERT INTO `tipo_restauracion` VALUES (1,'REST1','BOLSOS - BAGUETTE - FEMENINO'),(2,'REST2','BOLSOS - BANDOLERA Y MANOS LIBRES - FEMENINO'),(3,'REST3','BOLSOS - BOWLING - FEMENINO'),(4,'REST4','BOLSOS - MALETIN PORTATIL - FEMENINO'),(5,'REST5','MORRALES - MORRAL CUERO - FEMENINO'),(6,'REST6','BOLSOS - RIÑONERAS - FEMENINO'),(7,'REST7','BOLSOS - BOWLING - FEMENINO'),(8,'REST8','PRENDAS - TALEGO - FEMENINO'),(9,'REST9','MORRALES - TULA Y MORRAL - FEMENINO'),(10,'REST10','BOLSOS - BANDOLERA Y MANOS LIBRES - MASCULINO'),(11,'REST11','BOLSOS - BOWLING - MASCULINO'),(12,'REST12','BOLSOS - MALETIN PORTATIL - MASCULINO'),(13,'REST13','MORRALES - MORRAL CUERO - MASCULINO'),(14,'REST14','BOLSOS - RIÑONERAS - MASCULINO'),(15,'REST15','MORRALES - TULA Y MORRAL - MASCULINO'),(16,'REST16','CALZADO - ATADURA - FEMENINO'),(17,'REST17','CALZADO - BOTA - FEMENINO'),(18,'REST18','CALZADO - BOTIN - FEMENINO'),(19,'REST19','CALZADO - CERRADO - FEMENINO'),(20,'REST20','CALZADO - MOCASIN - FEMENINO'),(21,'REST21','CALZADO - SANDALIA - FEMENINO'),(22,'REST22','CALZADO - SANDALIA PLANA - FEMENINO'),(23,'REST23','CALZADO - SANDALIA PLATAFORMA - FEMENINO'),(24,'REST24','CALZADO - SANDALIA TACON - FEMENINO'),(25,'REST25','CALZADO - SNEAKER - FEMENINO'),(26,'REST26','CALZADO - VALETA - FEMENINO'),(27,'REST27','CALZADO - ATADURA - MASCULINO'),(28,'REST28','CALZADO - BOTA - FEMENINO'),(29,'REST29','CALZADO - MOCASIN - MASCULINO'),(30,'REST30','CALZADO - SANDALIA - MASCULINO'),(31,'REST31','CALZADO - SNEAKER - MASCULINO'),(32,'REST32','PRENDAS - CHAQUETAS OTRAS MARCAS - UNISEX'),(33,'REST33','PRENDAS - CHAQUETAS PROPIAS - UNISEX'),(34,'REST34','MARROQUINERIA - BILLETERA PORTACHEQUERA - MASCULINO'),(35,'REST35','MARROQUINERIA - BILLETERA PORTACHEQUERA - FEMENINO'),(36,'REST36','CINTURON - REATA - MASCULINO'),(37,'REST37','CINTURON - REATA - FEMENINO'),(38,'REST38','MORRALES - TULA Y MORRAL - UNISEX');
/*!40000 ALTER TABLE `tipo_restauracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_telefono`
--

DROP TABLE IF EXISTS `tipo_telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_telefono` (
  `id_tipo_telefono` bigint NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipo_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_telefono`
--

LOCK TABLES `tipo_telefono` WRITE;
/*!40000 ALTER TABLE `tipo_telefono` DISABLE KEYS */;
INSERT INTO `tipo_telefono` VALUES (1,'Móvil Personal'),(2,'Fijo Oficina'),(3,'Emergencia');
/*!40000 ALTER TABLE `tipo_telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` bigint NOT NULL AUTO_INCREMENT,
  `contrasena` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `correo_usu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_usu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rol_usu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `identificacion_usu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `foto_perfil` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `UKas5mdu7ejl9ytn6gvs9srfcwd` (`correo_usu`),
  UNIQUE KEY `identificacion_usu` (`identificacion_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'1','1','SISTEMA','ADMIN','1',NULL),(16,'$2a$10$xzWWKrEiR8Xb3KsWZqhgMOJnkRLs5D.H9mwgrmdu58F2lxz7Qgw.y','admin@mediccolombia.com','ADMINISTRADOR GENERAL','ADMIN','1192643784','/uploads/perfil/perfil_16_1790921133577.jpg'),(17,'$2a$10$lou3YhhS3Je2thhAp9Aof.EmsVNkdy7uK4HcfTQHQ3XHj2q7FMaSm','sebasUru69@gmail.com','Sebastian Urueta','EMPLEADO','1048223645',NULL),(18,'$2a$10$MEZLA7PkaGhBegO5OJTp7.5pWNb7YZzZuEwsbzCFBRKBGh.jOcBdy','carlos@gmail.com','Carlos ','EMPLEADO','1222222','/uploads/perfil/perfil_18_1787500880757.png'),(20,'$2a$10$dwTNGau/WPutCfqF6wYfkuhsKpTUQYECtAMOvZaZuMi9bFdJMSpuy','stevendrex0710@gmail.com','Stiven Daniel Robles','ARTISTA','1193643784',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_registro`
--

DROP TABLE IF EXISTS `venta_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_registro` (
  `id_venta` bigint NOT NULL AUTO_INCREMENT,
  `fecha_venta` datetime(6) DEFAULT NULL,
  `medio_pago` varchar(255) DEFAULT NULL,
  `total_venta` decimal(38,2) DEFAULT NULL,
  `cliente_id` bigint DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `FKq3d4xwe32kguxl0n1q2cgtwty` (`cliente_id`),
  KEY `FKn0q3d6luva7ri2x2xtf7yq79o` (`usuario_id`),
  CONSTRAINT `FKn0q3d6luva7ri2x2xtf7yq79o` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FKq3d4xwe32kguxl0n1q2cgtwty` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_registro`
--

LOCK TABLES `venta_registro` WRITE;
/*!40000 ALTER TABLE `venta_registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_registro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-02  2:37:55
