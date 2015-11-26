-- MySQL dump 10.13  Distrib 5.6.26, for osx10.8 (x86_64)
--
-- Host: localhost    Database: SJSU_Parking
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
  `spaces` int(11) DEFAULT NULL,
  `updateOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
  `spaces` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parking`
--

LOCK TABLES `Parking` WRITE;
/*!40000 ALTER TABLE `Parking` DISABLE KEYS */;
INSERT INTO `Parking` VALUES ('North',1,20,'2015-11-26 00:31:55'),('North',2,0,'2015-11-26 00:27:00'),('North',3,0,'2015-11-26 00:27:00'),('North',4,0,'2015-11-26 00:27:00'),('North',5,0,'2015-11-26 00:27:00'),('North',6,0,'2015-11-26 00:27:00'),('South',1,0,'2015-11-26 00:27:00'),('South',2,0,'2015-11-26 00:27:00'),('South',3,0,'2015-11-26 00:27:00'),('South',4,0,'2015-11-26 00:27:00'),('South',5,0,'2015-11-26 00:27:00'),('West',1,0,'2015-11-26 00:27:00'),('West',2,0,'2015-11-26 00:27:00'),('West',3,0,'2015-11-26 00:27:00'),('West',4,0,'2015-11-26 00:27:00'),('West',5,0,'2015-11-26 00:27:00');
INSERT INTO `Parking` VALUES ('North',1,0),('North',2,0),('North',3,0),('North',4,0),('North',5,0),('North',6,0),('South',1,0),('South',2,0),('South',3,0),('South',4,0),('South',5,0),('West',1,0),('West',2,0),('West',3,0),('West',4,0),('West',5,0);
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
  `spaces` int(11) DEFAULT NULL,
  `updateOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reportID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Report`
--

LOCK TABLES `Report` WRITE;
/*!40000 ALTER TABLE `Report` DISABLE KEYS */;
INSERT INTO `Report` VALUES (1,1,'North',1,12,'2015-11-26 00:16:14'),(2,1,'North',2,25,'2015-11-26 00:21:12'),(3,1,'North',3,0,'2015-11-26 00:22:22'),(4,1,'North',3,12,'2015-11-26 00:25:48'),(5,1,'North',1,20,'2015-11-26 00:31:55');
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

-- Dump completed on 2015-11-25 16:34:21
-- Dump completed on 2015-11-18 12:13:08
