-- MySQL dump 10.13  Distrib 5.6.26, for osx10.8 (x86_64)
--
-- Host: localhost    Database: sjsu_parking
-- ------------------------------------------------------
-- Server version	5.6.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Parking`
--

DROP TABLE IF EXISTS `Parking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Parking` (
  `garage` varchar(45) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `spaces` varchar(45) DEFAULT NULL,
  `updateOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parking`
--

LOCK TABLES `Parking` WRITE;
/*!40000 ALTER TABLE `Parking` DISABLE KEYS */;
INSERT INTO `Parking` VALUES ('North',1,'Don\'t bother','2015-12-01 00:34:40'),('North',2,'Plenty of parking','2015-11-30 20:40:44'),('North',3,'Give it a shot','2015-11-30 20:15:55'),('North',4,'Give it a shot','2015-11-30 20:21:50'),('North',5,'Give it a shot','2015-12-01 00:35:30'),('North',6,'Plenty of parking','2015-12-01 00:35:18'),('South',1,'Give it a shot','2015-11-30 22:34:07'),('South',2,'Not Reported','2015-11-30 19:24:02'),('South',3,'Don\'t bother','2015-11-30 20:01:20'),('South',4,'Not Reported','2015-11-30 19:24:02'),('South',5,'Not Reported','2015-11-30 19:24:02'),('West',1,'Plenty of parking','2015-11-30 20:56:21'),('West',2,'Don\'t bother','2015-12-01 00:35:50'),('West',3,'Plenty of parking','2015-12-01 00:36:01'),('West',4,'Not Reported','2015-11-30 19:24:02'),('West',5,'Not Reported','2015-11-30 19:24:02');
/*!40000 ALTER TABLE `Parking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Report`
--

DROP TABLE IF EXISTS `Report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Report` (
  `reportID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `garage` varchar(45) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `spaces` varchar(45) DEFAULT NULL,
  `updateOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reportID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Report`
--

LOCK TABLES `Report` WRITE;
/*!40000 ALTER TABLE `Report` DISABLE KEYS */;
INSERT INTO `Report` VALUES (1,1,'North',3,'Don\'t bother','2015-11-30 19:29:56'),(2,1,'',1,'Don\'t bother','2015-11-30 19:55:44'),(3,1,'',1,'Don\'t bother','2015-11-30 19:55:58'),(4,1,'West',1,'Give it a shot','2015-11-30 19:59:04'),(5,1,'South',3,'Plenty of parking','2015-11-30 20:00:45'),(6,1,'South',3,'Plenty of parking','2015-11-30 20:01:03'),(7,1,'South',3,'Don\'t bother','2015-11-30 20:01:20'),(8,1,'North',3,'Give it a shot','2015-11-30 20:15:55'),(9,1,'North',3,'Give it a shot','2015-11-30 20:16:12'),(10,1,'North',3,'Give it a shot','2015-11-30 20:17:38'),(11,1,'North',1,'Give it a shot','2015-11-30 20:17:46'),(12,1,'North',1,'Don\'t bother','2015-11-30 20:18:27'),(13,1,'North',1,'Plenty of parking','2015-11-30 20:20:16'),(14,1,'North',2,'Don\'t bother','2015-11-30 20:21:15'),(15,1,'North',4,'Give it a shot','2015-11-30 20:21:50'),(16,1,'North',1,'Give it a shot','2015-11-30 20:27:27'),(17,1,'North',1,'Don\'t bother','2015-11-30 20:31:29'),(18,1,'North',1,'Plenty of parking','2015-11-30 20:32:10'),(19,1,'North',1,'Don\'t bother','2015-11-30 20:39:17'),(20,1,'North',2,'Plenty of parking','2015-11-30 20:40:44'),(21,1,'North',1,'Give it a shot','2015-11-30 20:42:27'),(22,1,'North',1,'Give it a shot','2015-11-30 20:43:40'),(23,1,'North',1,'Plenty of parking','2015-11-30 20:56:04'),(24,1,'West',1,'Plenty of parking','2015-11-30 20:56:21'),(25,1,'North',1,'Don\'t bother','2015-11-30 20:57:53'),(26,1,'North',1,'Plenty of parking','2015-11-30 20:59:11'),(27,1,'North',1,'Don\'t bother','2015-11-30 21:05:14'),(28,1,'North',1,'Give it a shot','2015-11-30 21:05:28'),(29,1,'North',4,'Give it a shot','2015-11-30 22:19:05'),(30,1,'North',1,'Don\'t bother','2015-11-30 22:23:21'),(31,1,'South',1,'Give it a shot','2015-11-30 22:34:07'),(32,1,'North',1,'Plenty of parking','2015-12-01 00:34:32'),(33,1,'North',1,'Don\'t bother','2015-12-01 00:34:40'),(34,1,'North',6,'Plenty of parking','2015-12-01 00:35:18'),(35,1,'North',5,'Give it a shot','2015-12-01 00:35:30'),(36,1,'West',2,'Don\'t bother','2015-12-01 00:35:50'),(37,1,'West',3,'Plenty of parking','2015-12-01 00:36:01');
/*!40000 ALTER TABLE `Report` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER UpdateParkingAvailableSpaces
AFTER INSERT ON Report
FOR EACH ROW
BEGIN 
	UPDATE Parking
    SET Parking.spaces = NEW.spaces
    WHERE Parking.garage = NEW.garage
    AND Parking.floor = NEW.floor;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'eric.pham@sjsu.edu'),(2,'vinay.patel@sjsu.edu'),(3,'malik.khalil@sjsu.edu');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-30 16:37:54
