-- MySQL dump 10.19  Distrib 10.3.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: prueba
-- ------------------------------------------------------
-- Server version	10.3.34-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Fighters`
--

DROP TABLE IF EXISTS `Fighters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fighters` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Gender` char(1) NOT NULL,
  `FightingStyle` varchar(255) NOT NULL,
  `Ability` varchar(50) NOT NULL,
  `Created` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Active` char(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fighters`
--

LOCK TABLES `Fighters` WRITE;
/*!40000 ALTER TABLE `Fighters` DISABLE KEYS */;
INSERT INTO `Fighters` VALUES (1,'Iori Yagami','M','Estilo Yagami de las artes marciales antiguas, combinado con el instinto puro','Pirokinesis, Rasguño','2022-11-17 15:17:56','2022-11-17 09:27:57','S'),(2,'Kyo Kusanagi','M','Estilo Kusanagi + Kenpo','Pirokinesis','2022-11-17 15:43:34','2022-11-17 09:43:34','S'),(3,'Rugal Bernstein','M','Un Gesamtkunst obra de arte total compuesto de todas las artes marciales conocidas','Copiar ataques','2022-11-17 15:47:26','2022-11-17 09:47:26','S'),(4,'King','F','Muay Thai','Crear cocteles','2022-11-17 15:49:47','2022-11-17 09:49:47','S'),(5,'Whip Seirah','F','Manejo del latigo + estilo Heidern de artes de asesinato','Manejo del latigo','2022-11-17 15:54:54','2022-11-17 09:54:54','S'),(6,'Shermie','F','Ataques de lanzamiento','Estilo de lucha basado en tecnica de proyeccion','2022-11-17 15:57:28','2022-11-17 09:57:28','S');
/*!40000 ALTER TABLE `Fighters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuarios` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Apellidos` varchar(255) NOT NULL,
  `Edad` int(3) NOT NULL,
  `Genero` char(1) DEFAULT NULL,
  `Usuario` varchar(255) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `Actualizado` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Activo` char(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES (1,'Vianey','Sebastián Reyes',22,'F','ISC18350337@gmail.com','vianey123','2026-01-22','2022-11-17 16:17:40','2022-11-17 10:17:40','S'),(2,'Maria','Sebastián Reyes',23,'F','maria44@gmail.com','maria123','1999-01-22','2022-11-17 16:31:33','2022-11-17 10:31:33','S'),(3,'Ántonia','Sebastián Reyes',21,'F','antonia88@gmail.com','antonia123','2001-04-12','2022-11-17 16:38:41','2022-11-17 10:38:41','S'),(4,'William','Sebastián Reyes',12,'M','william55@gmail.com','william123','2010-04-06','2022-11-17 16:42:50','2022-11-17 10:42:50','S'),(5,'José','Sebastián Reyes',13,'M','jose66@gmail.com','jose123','2009-05-16','2022-11-17 16:47:15','2022-11-17 10:47:15','S'),(6,'Sebastián','Sebastián Reyes',15,'M','sebastian33@gmail.com','sebastian123','2007-08-19','2022-11-17 16:49:11','2022-11-17 10:49:11','S');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-17 18:48:28
