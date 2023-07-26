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
-- Table structure for table `Starred`
--

DROP TABLE IF EXISTS `Starred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Starred` (
  `actorID` int NOT NULL,
  `ActorName` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `movieID` int NOT NULL,
  PRIMARY KEY (`actorID`,`ActorName`,`title`,`movieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Starred`
--

LOCK TABLES `Starred` WRITE;
/*!40000 ALTER TABLE `Starred` DISABLE KEYS */;
INSERT INTO `Starred` VALUES (1,'Zoe Saldana','Avatar: The Way of Water',1),(2,'Michael B. Jordan','Creed III',2),(3,'Keanu Reeves','John Wick: Chapter 4',3),(4,'Shameik More','Spider-Man: Across the Spider-Verse',4),(5,'Tom Holland','Spider-Man: No Way Home',5),(6,'Daisy Ridley','Star Wars: The Force Awakens',6),(7,'Chris Pratt','The Super Mario Bros. Movie',7),(8,'Leonardo DiCaprio','Titanic',8),(9,'Tom Cruise','Top Gun: Maverick',9),(10,'Tom Hanks','Toy Story 3',10),(11,'Margot Robbie','Barbie',11);
/*!40000 ALTER TABLE `Starred` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-22 23:55:56
