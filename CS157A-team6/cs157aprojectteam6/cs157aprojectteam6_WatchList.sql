-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: localhost    Database: cs157aprojectteam6
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `WatchList`
--

DROP TABLE IF EXISTS `WatchList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WatchList` (
  `listID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `MovieID` int DEFAULT NULL,
  PRIMARY KEY (`title`),
  UNIQUE KEY `listID_UNIQUE` (`listID`),
  KEY `FK_MovieDetail` (`MovieID`),
  CONSTRAINT `FK_MovieDetail` FOREIGN KEY (`MovieID`) REFERENCES `MovieDetail` (`movieID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WatchList`
--

LOCK TABLES `WatchList` WRITE;
/*!40000 ALTER TABLE `WatchList` DISABLE KEYS */;
INSERT INTO `WatchList` VALUES (33,'Avatar: The Way of Water','Planned',1),(23,'Creed III','In Progress',2),(24,'John Wick: Chapter 4','Watched',3),(26,'Spider-Man: Across the Spider-Verse','Planned',4),(32,'Spider-Man: No Way Home','Planned',5),(29,'Star Wars: The Force Awakens','Planned',6),(31,'The Super Mario Bros. Movie','Planned',7),(36,'Top Gun: Maverick','Planned',9),(27,'Toy Story 3','Planned',10);
/*!40000 ALTER TABLE `WatchList` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-10  2:04:21
