CREATE DATABASE  IF NOT EXISTS `demo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `demo`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: demo
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `attendence`
--

DROP TABLE IF EXISTS `attendence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendence` (
  `roll` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `tl` int(11) DEFAULT NULL,
  `la` int(11) DEFAULT NULL,
  `waivers` varchar(45) DEFAULT NULL,
  `uid` varchar(45) NOT NULL,
  PRIMARY KEY (`roll`,`sid`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendence`
--

LOCK TABLES `attendence` WRITE;
/*!40000 ALTER TABLE `attendence` DISABLE KEYS */;
INSERT INTO `attendence` VALUES (1,1,6,NULL,'1(3-5),2','1'),(1,2,NULL,NULL,'1(3-5),2','4'),(1,8,NULL,NULL,'1(3-5),2','1'),(2,1,NULL,NULL,NULL,'4'),(2,2,10,NULL,NULL,'1'),(3,1,NULL,NULL,NULL,'4'),(3,2,10,NULL,NULL,'1'),(4,1,NULL,NULL,'5','4'),(4,8,NULL,NULL,'5','1'),(5,1,NULL,NULL,NULL,'4'),(5,2,10,NULL,NULL,'1'),(6,1,NULL,NULL,NULL,'4'),(6,2,10,NULL,NULL,'1'),(7,1,NULL,NULL,'6','4'),(7,8,NULL,NULL,'6','1'),(8,1,NULL,NULL,NULL,'4'),(8,2,10,NULL,NULL,'1'),(9,1,NULL,NULL,'4','4'),(9,8,NULL,NULL,'4','1'),(10,1,NULL,NULL,NULL,'4'),(10,2,10,NULL,NULL,'1'),(11,3,NULL,NULL,NULL,'2'),(11,4,NULL,1,NULL,'2'),(12,3,NULL,NULL,NULL,'2'),(12,4,NULL,6,NULL,'2'),(13,3,NULL,NULL,NULL,'2'),(13,4,NULL,0,NULL,'2'),(14,3,NULL,NULL,NULL,'2'),(14,4,NULL,0,NULL,'2'),(15,3,NULL,NULL,NULL,'2'),(15,4,NULL,0,NULL,'2'),(16,3,NULL,NULL,NULL,'2'),(16,4,NULL,0,NULL,'2'),(17,3,NULL,NULL,NULL,'2'),(17,4,NULL,0,NULL,'2'),(18,3,NULL,NULL,NULL,'2'),(18,4,NULL,0,NULL,'2'),(19,3,NULL,NULL,NULL,'2'),(19,4,NULL,0,NULL,'2'),(20,3,NULL,NULL,NULL,'2'),(20,4,NULL,0,NULL,'2'),(21,5,34,7,NULL,'3'),(21,7,NULL,NULL,NULL,'5'),(22,5,34,2,NULL,'3'),(22,7,NULL,NULL,NULL,'5'),(23,5,34,8,NULL,'3'),(23,7,NULL,NULL,NULL,'5'),(24,5,34,9,NULL,'3'),(24,7,NULL,NULL,NULL,'5'),(25,5,34,9,NULL,'3'),(25,7,NULL,NULL,NULL,'5'),(26,5,34,7,NULL,'3'),(26,7,NULL,NULL,NULL,'5'),(27,5,34,6,NULL,'3'),(27,7,NULL,NULL,NULL,'5'),(28,5,34,4,NULL,'3'),(28,7,NULL,NULL,NULL,'5'),(29,5,34,4,NULL,'3'),(29,7,NULL,NULL,NULL,'5'),(30,5,34,6,NULL,'3'),(30,7,NULL,NULL,NULL,'5'),(31,6,NULL,NULL,'5','3'),(31,8,NULL,NULL,'5','1'),(32,1,6,NULL,NULL,'1'),(32,6,NULL,NULL,NULL,'3'),(33,1,6,NULL,NULL,'1'),(33,6,NULL,NULL,NULL,'3'),(34,1,6,NULL,NULL,'1'),(34,6,NULL,NULL,NULL,'3'),(35,1,6,NULL,NULL,'1'),(35,6,NULL,NULL,NULL,'3'),(36,1,6,NULL,NULL,'1'),(36,6,NULL,NULL,NULL,'3'),(37,1,6,NULL,NULL,'1'),(37,6,NULL,NULL,NULL,'3'),(38,1,6,NULL,NULL,'1'),(38,6,NULL,NULL,NULL,'3'),(39,1,6,NULL,NULL,'1'),(39,6,NULL,NULL,NULL,'3'),(40,1,NULL,NULL,NULL,'3'),(40,6,NULL,NULL,NULL,'1');
/*!40000 ALTER TABLE `attendence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `society`
--

DROP TABLE IF EXISTS `society`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `society` (
  `Society` varchar(20) NOT NULL,
  `soc_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`soc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `society`
--

LOCK TABLES `society` WRITE;
/*!40000 ALTER TABLE `society` DISABLE KEYS */;
INSERT INTO `society` VALUES ('fashion',8,1),('dance',9,5);
/*!40000 ALTER TABLE `society` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `roll` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `branch` varchar(20) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`roll`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'AA','cs',3),(2,'AB','cs',3),(3,'AC','cs',3),(4,'AD','cs',3),(5,'AE','cs',3),(6,'AF','cs',3),(7,'AG','cs',3),(8,'AH','cs',3),(9,'AI','cs',3),(10,'AJ','cs',3),(11,'BQ','cs',4),(12,'BH','cs',4),(13,'BF','cs',4),(14,'BN','cs',4),(15,'NH','cs',4),(16,'MJ','cs',4),(17,'KJ','cs',4),(18,'DE','cs',4),(19,'GH','cs',4),(20,'TU','cs',4),(21,'IO','elc',3),(22,'LO','elc',3),(23,'PO','elc',3),(24,'WE','elc',3),(25,'QW','elc',3),(26,'RT','elc',3),(27,'RT','elc',3),(28,'YU','elc',3),(29,'BV','elc',3),(30,'CV','elc',3),(31,'XZ','elc',4),(32,'SA','elc',4),(33,'QA','elc',4),(34,'WS','elc',4),(35,'ED','elc',4),(36,'RF','elc',4),(37,'TG','elc',4),(38,'YH','elc',4),(39,'UJ','elc',4),(40,'IK','elc',4);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `sid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `sname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sid`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,1,'network'),(1,4,'network'),(2,1,'dbms'),(3,2,'toc'),(4,2,'compiler'),(5,3,'micro'),(6,3,'dld'),(7,5,'prob'),(8,1,'fashion'),(9,5,'dance');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `uid` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'asha','asha1'),(2,'sumit','sumit2'),(3,'venika','venika3'),(4,'seema','seema4'),(5,'punita','punita4');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-29 17:21:14
