/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.19-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: database.internal    Database: xv404137j380qrtj
-- ------------------------------------------------------
-- Server version	10.4.34-MariaDB-1:10.4.34+maria~ubu2004

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
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `theater_id` bigint(20) unsigned NOT NULL,
  `movie_id` bigint(20) unsigned NOT NULL,
  `date` date NOT NULL,
  `sales_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_theater_id_foreign` (`theater_id`),
  KEY `sales_movie_id_foreign` (`movie_id`),
  CONSTRAINT `sales_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_theater_id_foreign` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1,1,'2024-05-09',100,'2024-11-21 02:31:05','2024-11-21 02:31:05'),(2,2,1,'2024-05-09',200,'2024-11-21 02:31:05','2024-11-21 02:31:05'),(3,1,2,'2024-05-09',150,'2024-11-21 02:31:05','2024-11-21 02:31:05'),(4,2,2,'2024-05-09',250,'2024-11-21 02:31:05','2024-11-21 02:31:05'),(5,1,1,'2024-05-10',120,'2024-11-21 02:31:05','2024-11-21 02:31:05'),(6,2,1,'2024-05-10',220,'2024-11-21 02:31:05','2024-11-21 02:31:05'),(7,1,2,'2024-05-10',180,'2024-11-21 02:31:05','2024-11-21 02:31:05'),(8,2,2,'2024-05-10',280,'2024-11-21 02:31:05','2024-11-21 02:31:05'),(9,1,1,'2024-05-09',100,'2024-11-21 03:06:32','2024-11-21 03:06:32'),(10,2,1,'2024-05-09',200,'2024-11-21 03:06:32','2024-11-21 03:06:32'),(11,1,2,'2024-05-09',150,'2024-11-21 03:06:32','2024-11-21 03:06:32'),(12,2,2,'2024-05-09',250,'2024-11-21 03:06:32','2024-11-21 03:06:32'),(13,1,1,'2024-05-10',120,'2024-11-21 03:06:32','2024-11-21 03:06:32'),(14,2,1,'2024-05-10',220,'2024-11-21 03:06:32','2024-11-21 03:06:32'),(15,1,2,'2024-05-10',180,'2024-11-21 03:06:32','2024-11-21 03:06:32'),(16,2,2,'2024-05-10',280,'2024-11-21 03:06:32','2024-11-21 03:06:32');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theaters`
--

DROP TABLE IF EXISTS `theaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theaters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theaters`
--

LOCK TABLES `theaters` WRITE;
/*!40000 ALTER TABLE `theaters` DISABLE KEYS */;
INSERT INTO `theaters` VALUES (1,'Theater 1','2024-11-21 02:31:05','2024-11-21 02:31:05'),(2,'Theater 2','2024-11-21 02:31:05','2024-11-21 02:31:05'),(3,'Theater 1','2024-11-21 03:06:32','2024-11-21 03:06:32'),(4,'Theater 2','2024-11-21 03:06:32','2024-11-21 03:06:32'),(5,'Theater 3','2024-11-21 03:06:32','2024-11-21 03:06:32'),(6,'Theater 4','2024-11-21 03:06:32','2024-11-21 03:06:32'),(7,'Theater New','2024-11-21 03:06:32','2024-11-21 03:06:32');
/*!40000 ALTER TABLE `theaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Movie 1','2024-11-21 02:31:05','2024-11-21 02:31:05'),(2,'Movie 2','2024-11-21 02:31:05','2024-11-21 02:31:05'),(3,'Movie 1','2024-11-21 03:06:32','2024-11-21 03:06:32'),(4,'Movie 2','2024-11-21 03:06:32','2024-11-21 03:06:32'),(5,'Movie 3','2024-11-21 03:06:32','2024-11-21 03:06:32'),(6,'Movie 4','2024-11-21 03:06:32','2024-11-21 03:06:32');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-21  4:54:37
