CREATE DATABASE  IF NOT EXISTS `Team52` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Team52`;
-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: Team52
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `AdComDetailEmp`
--

DROP TABLE IF EXISTS `AdComDetailEmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdComDetailEmp` (
  `empFirstname` varchar(50) NOT NULL,
  `empLastname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdComDetailEmp`
--

LOCK TABLES `AdComDetailEmp` WRITE;
/*!40000 ALTER TABLE `AdComDetailEmp` DISABLE KEYS */;
INSERT INTO `AdComDetailEmp` VALUES ('Claude','Shannon'),('George P.','Burdell'),('Manager','One'),('Three','Three'),('Four','Four'),('Marie','Curie');
/*!40000 ALTER TABLE `AdComDetailEmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdComDetailTh`
--

DROP TABLE IF EXISTS `AdComDetailTh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdComDetailTh` (
  `thName` varchar(50) NOT NULL,
  `thManagerUsername` varchar(50) NOT NULL,
  `thCity` varchar(50) NOT NULL,
  `thState` char(2) NOT NULL,
  `thCapacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdComDetailTh`
--

LOCK TABLES `AdComDetailTh` WRITE;
/*!40000 ALTER TABLE `AdComDetailTh` DISABLE KEYS */;
INSERT INTO `AdComDetailTh` VALUES ('Cinema Star','entropyRox','San Francisco','CA',4),('Jonathan\'s Movies','georgep','Seattle','WA',2),('Star Movies','radioactivePoRa','Boulder','CA',5);
/*!40000 ALTER TABLE `AdComDetailTh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdFilterCom`
--

DROP TABLE IF EXISTS `AdFilterCom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdFilterCom` (
  `comName` varchar(50) NOT NULL,
  `numCityCover` bigint(11) DEFAULT NULL,
  `numTheater` bigint(11) DEFAULT NULL,
  `numEmployee` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdFilterCom`
--

LOCK TABLES `AdFilterCom` WRITE;
/*!40000 ALTER TABLE `AdFilterCom` DISABLE KEYS */;
INSERT INTO `AdFilterCom` VALUES ('4400 Theater Company',3,3,6);
/*!40000 ALTER TABLE `AdFilterCom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdFilterUser`
--

DROP TABLE IF EXISTS `AdFilterUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdFilterUser` (
  `username` varchar(50) NOT NULL,
  `creditCardCount` varchar(1) DEFAULT NULL,
  `userType` varchar(20) DEFAULT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdFilterUser`
--

LOCK TABLES `AdFilterUser` WRITE;
/*!40000 ALTER TABLE `AdFilterUser` DISABLE KEYS */;
INSERT INTO `AdFilterUser` VALUES ('georgep','5','CustomerManager','Approved'),('ilikemoney$$','3','Customer','Approved'),('isthisthekrustykrab','3','Customer','Approved'),('calcultron2','2','Customer','Approved'),('entropyRox','2','CustomerManager','Approved'),('calcultron','1','CustomerManager','Approved'),('calcwizard','1','Customer','Approved'),('cool_class4400','1','CustomerAdmin','Approved'),('DNAhelix','1','Customer','Approved'),('does2Much','1','Customer','Approved'),('eeqmcsquare','1','Customer','Approved'),('fullMetal','1','Customer','Approved'),('imready','1','Customer','Approved'),('notFullMetal','1','Customer','Approved'),('programerAAL','1','Customer','Approved'),('RitzLover28','1','Customer','Approved'),('thePiGuy3.14','1','Customer','Approved'),('theScienceGuy','1','Customer','Approved'),('fatherAI','0','Manager','Approved'),('ghcghc','0','Manager','Approved'),('imbatman','0','Manager','Approved'),('manager1','0','Manager','Approved'),('manager2','0','Manager','Approved'),('manager3','0','Manager','Approved'),('manager4','0','Manager','Approved'),('radioactivePoRa','0','Manager','Approved');
/*!40000 ALTER TABLE `AdFilterUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `ibfk_3` FOREIGN KEY (`username`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('cool_class4400');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `adminmanagecompany`
--

DROP TABLE IF EXISTS `adminmanagecompany`;
/*!50001 DROP VIEW IF EXISTS `adminmanagecompany`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `adminmanagecompany` AS SELECT 
 1 AS `company_name`,
 1 AS `n_CityCovered`,
 1 AS `n_Theaters`,
 1 AS `n_Employee`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `adminmanageuser`
--

DROP TABLE IF EXISTS `adminmanageuser`;
/*!50001 DROP VIEW IF EXISTS `adminmanageuser`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `adminmanageuser` AS SELECT 
 1 AS `username`,
 1 AS `n_cc`,
 1 AS `user_type`,
 1 AS `user_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `available_managers`
--

DROP TABLE IF EXISTS `available_managers`;
/*!50001 DROP VIEW IF EXISTS `available_managers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `available_managers` AS SELECT 
 1 AS `username`,
 1 AS `zipcode`,
 1 AS `street`,
 1 AS `city`,
 1 AS `state`,
 1 AS `company`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_name` varchar(50) NOT NULL,
  PRIMARY KEY (`company_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('4400 Theater Company'),('AI Theater Company'),('Awesome Theater Company'),('EZ Theater Company');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CosFilterMovie`
--

DROP TABLE IF EXISTS `CosFilterMovie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CosFilterMovie` (
  `movName` varchar(50) NOT NULL,
  `thName` varchar(50) NOT NULL,
  `thStreet` varchar(50) NOT NULL,
  `thCity` varchar(50) NOT NULL,
  `thState` char(2) NOT NULL,
  `thZipcode` char(5) NOT NULL,
  `comName` varchar(50) NOT NULL,
  `movPlayDate` date NOT NULL,
  `movReleaseDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CosFilterMovie`
--

LOCK TABLES `CosFilterMovie` WRITE;
/*!40000 ALTER TABLE `CosFilterMovie` DISABLE KEYS */;
INSERT INTO `CosFilterMovie` VALUES ('4400 The Movie','Cinema Star','100 Cool Place','San Francisco','CA','94016','4400 Theater Company','2019-09-12','2019-08-12'),('4400 The Movie','ABC Theater','880 Color Dr','Austin','TX','73301','Awesome Theater Company','2019-10-12','2019-08-12'),('4400 The Movie','Star Movies','745 GT St','Atlanta','GA','30332','EZ Theater Company','2019-08-12','2019-08-12'),('Calculus Returns: A ML Story','ML Movies','314 Pi St','Pallet Town','KS','31415','AI Theater Company','2019-10-10','2019-09-19'),('Calculus Returns: A ML Story','ML Movies','314 Pi St','Pallet Town','KS','31415','AI Theater Company','2019-12-30','2019-09-19'),('George P Burdell\'s Life Story','Main Movies','123 Main St','New York','NY','10001','EZ Theater Company','2019-07-14','1927-08-12'),('George P Burdell\'s Life Story','Main Movies','123 Main St','New York','NY','10001','EZ Theater Company','2019-10-22','1927-08-12'),('Georgia Tech The Movie','Cinema Star','100 Cool Place','San Francisco','CA','94016','4400 Theater Company','2019-09-30','1985-08-13'),('Spaceballs','ML Movies','314 Pi St','Pallet Town','KS','31415','AI Theater Company','2023-01-23','1987-06-24'),('Spider-Man: Into the Spider-Verse','ML Movies','314 Pi St','Pallet Town','KS','31415','AI Theater Company','2019-09-30','2018-12-01'),('The First Pokemon Movie','ABC Theater','880 Color Dr','Austin','TX','73301','Awesome Theater Company','2018-07-19','1998-07-19'),('The King\'s Speech','Cinema Star','100 Cool Place','San Francisco','CA','94016','4400 Theater Company','2019-12-20','2010-11-26'),('The King\'s Speech','Main Movies','123 Main St','New York','NY','10001','EZ Theater Company','2019-12-20','2010-11-26');
/*!40000 ALTER TABLE `CosFilterMovie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CosViewHistory`
--

DROP TABLE IF EXISTS `CosViewHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CosViewHistory` (
  `movName` varchar(50) NOT NULL,
  `thName` varchar(50) NOT NULL,
  `comName` varchar(50) NOT NULL,
  `creditCardNum` char(16) NOT NULL,
  `movPlayDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CosViewHistory`
--

LOCK TABLES `CosViewHistory` WRITE;
/*!40000 ALTER TABLE `CosViewHistory` DISABLE KEYS */;
INSERT INTO `CosViewHistory` VALUES ('How to Train Your Dragon','Cinema Star','4400 Theater Company','1111111111111111','2010-04-02'),('How to Train Your Dragon','Main Movies','EZ Theater Company','1111111111111111','2010-03-22'),('How to Train Your Dragon','Main Movies','EZ Theater Company','1111111111111111','2010-03-23'),('How to Train Your Dragon','Star Movies','EZ Theater Company','1111111111111100','2010-03-25');
/*!40000 ALTER TABLE `CosViewHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcard` (
  `username` varchar(50) NOT NULL,
  `creditcardnum` char(16) NOT NULL,
  PRIMARY KEY (`creditcardnum`),
  KEY `ibfk_6` (`username`),
  CONSTRAINT `ibfk_6` FOREIGN KEY (`username`) REFERENCES `customer` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard`
--

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
INSERT INTO `creditcard` VALUES ('calcultron','1111111111000000'),('calcultron2','1111111100000000'),('calcultron2','1111111110000000'),('calcwizard','1111111111100000'),('cool_class4400','2222222222000000'),('DNAhelix','2220000000000000'),('does2Much','2222222200000000'),('eeqmcsquare','2222222222222200'),('entropyRox','2222222222200000'),('entropyRox','2222222222220000'),('fullMetal','1100000000000000'),('georgep','1111111111110000'),('georgep','1111111111111000'),('georgep','1111111111111100'),('georgep','1111111111111110'),('georgep','1111111111111111'),('ilikemoney$$','2222222222222220'),('ilikemoney$$','2222222222222222'),('ilikemoney$$','9000000000000000'),('imready','1111110000000000'),('isthisthekrustykrab','1110000000000000'),('isthisthekrustykrab','1111000000000000'),('isthisthekrustykrab','1111100000000000'),('notFullMetal','1000000000000000'),('programerAAL','2222222000000000'),('RitzLover28','3333333333333300'),('thePiGuy3.14','2222222220000000'),('theScienceGuy','2222222222222000');
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('calcultron'),('calcultron2'),('calcwizard'),('clarinetbeast'),('cool_class4400'),('DNAhelix'),('does2Much'),('eeqmcsquare'),('entropyRox'),('fullMetal'),('georgep'),('ilikemoney$$'),('imready'),('isthisthekrustykrab'),('notFullMetal'),('programerAAL'),('RitzLover28'),('thePiGuy3.14'),('theScienceGuy');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('calcultron'),('cool_class4400'),('entropyRox'),('fatherAI'),('georgep'),('ghcghc'),('imbatman'),('manager1'),('manager2'),('manager3'),('manager4'),('radioactivePoRa');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `username` varchar(50) NOT NULL,
  `zipcode` char(5) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` char(2) NOT NULL,
  `company` varchar(50) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `zipcode` (`zipcode`,`street`,`city`,`state`),
  KEY `ibfk_5` (`company`),
  CONSTRAINT `ibfk_4` FOREIGN KEY (`username`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ibfk_5` FOREIGN KEY (`company`) REFERENCES `company` (`company_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('calcultron','30308','123 Peachtree St','Atlanta','GA','EZ Theater Company'),('entropyRox','94016','200 Cool Place','San Francisco','CA','4400 Theater Company'),('fatherAI','10001','456 Main St','New York','NY','EZ Theater Company'),('georgep','98105','10 Pearl Dr','Seattle','WA','4400 Theater Company'),('ghcghc','31415','100 Pi St','Pallet Town','KS','AI Theater Company'),('imbatman','78653','800 Color Dr','Austin','TX','Awesome Theater Company'),('manager1','30332','123 Ferst Drive','Atlanta','GA','4400 Theater Company'),('manager2','30332','456 Ferst Drive','Atlanta','GA','AI Theater Company'),('manager3','30332','789 Ferst Drive','Atlanta','GA','4400 Theater Company'),('manager4','30332','000 Ferst Drive','Atlanta','GA','4400 Theater Company'),('radioactivePoRa','94088','100 Blu St','Sunnyvale','CA','4400 Theater Company');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ManFilterTh`
--

DROP TABLE IF EXISTS `ManFilterTh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ManFilterTh` (
  `movName` varchar(50) NOT NULL,
  `movDuration` int(11) NOT NULL,
  `movReleaseDate` date NOT NULL,
  `movPlayDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ManFilterTh`
--

LOCK TABLES `ManFilterTh` WRITE;
/*!40000 ALTER TABLE `ManFilterTh` DISABLE KEYS */;
INSERT INTO `ManFilterTh` VALUES ('4400 The Movie',130,'2019-08-12',NULL),('Avengers: Endgame',181,'2019-04-26',NULL),('Calculus Returns: A ML Story',314,'2019-09-19',NULL),('Georgia Tech The Movie',100,'1985-08-13',NULL),('Spider-Man: Into the Spider-Verse',117,'2018-12-01',NULL),('The First Pokemon Movie',75,'1998-07-19',NULL);
/*!40000 ALTER TABLE `ManFilterTh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `movie_name` varchar(50) NOT NULL,
  `releasedate` date NOT NULL,
  `duration` int(11) NOT NULL,
  PRIMARY KEY (`movie_name`,`releasedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES ('4400 The Movie','2019-08-12',130),('Avengers: Endgame','2019-04-26',181),('Calculus Returns: A ML Story','2019-09-19',314),('George P Burdell\'s Life Story','1927-08-12',100),('Georgia Tech The Movie','1985-08-13',100),('How to Train Your Dragon','2010-03-21',98),('Spaceballs','1987-06-24',96),('Spider-Man: Into the Spider-Verse','2018-12-01',117),('The First Pokemon Movie','1998-07-19',75),('The King\'s Speech','2010-11-26',119);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movieplay`
--

DROP TABLE IF EXISTS `movieplay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movieplay` (
  `movieplay_compname` varchar(50) NOT NULL,
  `movieplay_theatername` varchar(50) NOT NULL,
  `movieplay_date` date NOT NULL,
  `movieplay_name` varchar(50) NOT NULL,
  `movieplay_releasedate` date NOT NULL,
  PRIMARY KEY (`movieplay_compname`,`movieplay_theatername`,`movieplay_date`,`movieplay_name`,`movieplay_releasedate`),
  KEY `ibfk_10` (`movieplay_name`,`movieplay_releasedate`),
  CONSTRAINT `ibfk_10` FOREIGN KEY (`movieplay_name`, `movieplay_releasedate`) REFERENCES `movie` (`movie_name`, `releasedate`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ibfk_9` FOREIGN KEY (`movieplay_compname`, `movieplay_theatername`) REFERENCES `theater` (`compname`, `theater_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movieplay`
--

LOCK TABLES `movieplay` WRITE;
/*!40000 ALTER TABLE `movieplay` DISABLE KEYS */;
INSERT INTO `movieplay` VALUES ('4400 Theater Company','Cinema Star','2019-09-12','4400 The Movie','2019-08-12'),('Awesome Theater Company','ABC Theater','2019-10-12','4400 The Movie','2019-08-12'),('EZ Theater Company','Star Movies','2019-08-12','4400 The Movie','2019-08-12'),('AI Theater Company','ML Movies','2019-10-10','Calculus Returns: A ML Story','2019-09-19'),('AI Theater Company','ML Movies','2019-12-30','Calculus Returns: A ML Story','2019-09-19'),('4400 Theater Company','Cinema Star','2010-05-20','George P Burdell\'s Life Story','1927-08-12'),('EZ Theater Company','Main Movies','2019-07-14','George P Burdell\'s Life Story','1927-08-12'),('EZ Theater Company','Main Movies','2019-10-22','George P Burdell\'s Life Story','1927-08-12'),('4400 Theater Company','Cinema Star','2019-09-30','Georgia Tech The Movie','1985-08-13'),('Awesome Theater Company','ABC Theater','1985-08-13','Georgia Tech The Movie','1985-08-13'),('4400 Theater Company','Cinema Star','2010-04-02','How to Train Your Dragon','2010-03-21'),('EZ Theater Company','Main Movies','2010-03-22','How to Train Your Dragon','2010-03-21'),('EZ Theater Company','Main Movies','2010-03-23','How to Train Your Dragon','2010-03-21'),('EZ Theater Company','Star Movies','2010-03-25','How to Train Your Dragon','2010-03-21'),('4400 Theater Company','Cinema Star','2000-02-02','Spaceballs','1987-06-24'),('AI Theater Company','ML Movies','2010-04-02','Spaceballs','1987-06-24'),('AI Theater Company','ML Movies','2023-01-23','Spaceballs','1987-06-24'),('EZ Theater Company','Main Movies','1999-06-24','Spaceballs','1987-06-24'),('AI Theater Company','ML Movies','2019-09-30','Spider-Man: Into the Spider-Verse','2018-12-01'),('Awesome Theater Company','ABC Theater','2018-07-19','The First Pokemon Movie','1998-07-19'),('4400 Theater Company','Cinema Star','2019-12-20','The King\'s Speech','2010-11-26'),('EZ Theater Company','Main Movies','2019-12-20','The King\'s Speech','2010-11-26');
/*!40000 ALTER TABLE `movieplay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater` (
  `compname` varchar(50) NOT NULL,
  `theater_name` varchar(50) NOT NULL,
  `zipcode` char(5) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` char(2) NOT NULL,
  `capacity` int(11) NOT NULL,
  `username_mgr` varchar(50) NOT NULL,
  PRIMARY KEY (`compname`,`theater_name`),
  KEY `ibfk_8` (`username_mgr`),
  CONSTRAINT `ibfk_7` FOREIGN KEY (`compname`) REFERENCES `company` (`company_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ibfk_8` FOREIGN KEY (`username_mgr`) REFERENCES `manager` (`username`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES ('4400 Theater Company','Cinema Star','94016','100 Cool Place','San Francisco','CA',4,'entropyRox'),('4400 Theater Company','Jonathan\'s Movies','98101','67 Pearl Dr','Seattle','WA',2,'georgep'),('4400 Theater Company','Star Movies','80301','4400 Rocks Ave','Boulder','CA',5,'radioactivePoRa'),('AI Theater Company','ML Movies','31415','314 Pi St','Pallet Town','KS',3,'ghcghc'),('Awesome Theater Company','ABC Theater','73301','880 Color Dr','Austin','TX',5,'imbatman'),('EZ Theater Company','Main Movies','10001','123 Main St','New York','NY',3,'fatherAI'),('EZ Theater Company','Star Movies','30332','745 GT St','Atlanta','GA',2,'calcultron');
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tobeused`
--

DROP TABLE IF EXISTS `tobeused`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tobeused` (
  `movName` varchar(50) NOT NULL,
  `movDuration` int(11) NOT NULL,
  `movReleaseDate` date NOT NULL,
  `movPlayDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tobeused`
--

LOCK TABLES `tobeused` WRITE;
/*!40000 ALTER TABLE `tobeused` DISABLE KEYS */;
INSERT INTO `tobeused` VALUES ('4400 The Movie',130,'2019-08-12',NULL),('Avengers: Endgame',181,'2019-04-26',NULL),('Calculus Returns: A ML Story',314,'2019-09-19',NULL),('George P Burdell\'s Life Story',100,'1927-08-12','2019-07-14'),('George P Burdell\'s Life Story',100,'1927-08-12','2019-10-22'),('Georgia Tech The Movie',100,'1985-08-13',NULL),('How to Train Your Dragon',98,'2010-03-21','2010-03-22'),('How to Train Your Dragon',98,'2010-03-21','2010-03-23'),('Spaceballs',96,'1987-06-24','1999-06-24'),('Spider-Man: Into the Spider-Verse',117,'2018-12-01',NULL),('The First Pokemon Movie',75,'1998-07-19',NULL),('The King\'s Speech',119,'2010-11-26','2019-12-20');
/*!40000 ALTER TABLE `tobeused` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `used`
--

DROP TABLE IF EXISTS `used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `used` (
  `u_creditcardnum` char(16) NOT NULL,
  `u_compname` varchar(50) NOT NULL,
  `u_theatername` varchar(50) NOT NULL,
  `u_date` date NOT NULL,
  `u_moviename` varchar(50) NOT NULL,
  `u_releasedate` date NOT NULL,
  PRIMARY KEY (`u_creditcardnum`,`u_compname`,`u_theatername`,`u_date`,`u_moviename`,`u_releasedate`),
  KEY `ibfk_12` (`u_compname`,`u_theatername`,`u_date`,`u_moviename`,`u_releasedate`),
  CONSTRAINT `ibfk_11` FOREIGN KEY (`u_creditcardnum`) REFERENCES `creditcard` (`creditcardnum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ibfk_12` FOREIGN KEY (`u_compname`, `u_theatername`, `u_date`, `u_moviename`, `u_releasedate`) REFERENCES `movieplay` (`movieplay_compname`, `movieplay_theatername`, `movieplay_date`, `movieplay_name`, `movieplay_releasedate`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `used`
--

LOCK TABLES `used` WRITE;
/*!40000 ALTER TABLE `used` DISABLE KEYS */;
INSERT INTO `used` VALUES ('1111111111111111','4400 Theater Company','Cinema Star','2010-04-02','How to Train Your Dragon','2010-03-21'),('1111111111111111','EZ Theater Company','Main Movies','2010-03-22','How to Train Your Dragon','2010-03-21'),('1111111111111111','EZ Theater Company','Main Movies','2010-03-23','How to Train Your Dragon','2010-03-21'),('1111111111111100','EZ Theater Company','Star Movies','2010-03-25','How to Train Your Dragon','2010-03-21');
/*!40000 ALTER TABLE `used` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserFilterTh`
--

DROP TABLE IF EXISTS `UserFilterTh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserFilterTh` (
  `thName` varchar(50) NOT NULL,
  `thStreet` varchar(50) NOT NULL,
  `thCity` varchar(50) NOT NULL,
  `thState` char(2) NOT NULL,
  `thZipcode` char(5) NOT NULL,
  `comName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserFilterTh`
--

LOCK TABLES `UserFilterTh` WRITE;
/*!40000 ALTER TABLE `UserFilterTh` DISABLE KEYS */;
INSERT INTO `UserFilterTh` VALUES ('Cinema Star','100 Cool Place','San Francisco','CA','94016','4400 Theater Company'),('Jonathan\'s Movies','67 Pearl Dr','Seattle','WA','98101','4400 Theater Company'),('Star Movies','4400 Rocks Ave','Boulder','CA','80301','4400 Theater Company');
/*!40000 ALTER TABLE `UserFilterTh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserLogin`
--

DROP TABLE IF EXISTS `UserLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserLogin` (
  `username` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `isCustomer` bigint(11) DEFAULT NULL,
  `isAdmin` bigint(11) DEFAULT NULL,
  `isManager` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserLogin`
--

LOCK TABLES `UserLogin` WRITE;
/*!40000 ALTER TABLE `UserLogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserLogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `userlogin_view`
--

DROP TABLE IF EXISTS `userlogin_view`;
/*!50001 DROP VIEW IF EXISTS `userlogin_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `userlogin_view` AS SELECT 
 1 AS `username`,
 1 AS `status`,
 1 AS `isCustomer`,
 1 AS `isAdmin`,
 1 AS `isManager`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `user_status` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `check_status` CHECK ((`user_status` in (_utf8mb4'Pending',_utf8mb4'Approved',_utf8mb4'Declined'))),
  CONSTRAINT `minlength` CHECK ((length(`user_password`) > 7))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('calcultron','Approved','77c9749b451ab8c713c48037ddfbb2c4','Dwight','Schrute'),('calcultron2','Approved','8792b8cf71d27dc96173b2ac79b96e0d','Jim','Halpert'),('calcwizard','Approved','0d777e9e30b918e9034ab610712c90cf','Issac','Newton'),('clarinetbeast','Declined','c8c605999f3d8352d7bb792cf3fdb25b','Squidward','Tentacles'),('cool_class4400','Approved','77c9749b451ab8c713c48037ddfbb2c4','A. TA','Washere'),('DNAhelix','Approved','ca94efe2a58c27168edf3d35102dbb6d','Rosalind','Franklin'),('does2Much','Approved','00cedcf91beffa9ee69f6cfe23a4602d','Carl','Gauss'),('eeqmcsquare','Approved','7c5858f7fcf63ec268f42565be3abb95','Albert','Einstein'),('entropyRox','Approved','c8c605999f3d8352d7bb792cf3fdb25b','Claude','Shannon'),('fatherAI','Approved','0d777e9e30b918e9034ab610712c90cf','Alan','Turing'),('fullMetal','Approved','d009d70ae4164e8989725e828db8c7c2','Edward','Elric'),('gdanger','Declined','3665a76e271ada5a75368b99f774e404','Gary','Danger'),('georgep','Approved','bbb8aae57c104cda40c93843ad5e6db8','George P.','Burdell'),('ghcghc','Approved','9f0863dd5f0256b0f586a7b523f8cfe8','Grace','Hopper'),('ilikemoney$$','Approved','7c5858f7fcf63ec268f42565be3abb95','Eugene','Krabs'),('imbatman','Approved','9f0863dd5f0256b0f586a7b523f8cfe8','Bruce','Wayne'),('imready','Approved','ca94efe2a58c27168edf3d35102dbb6d','Spongebob','Squarepants'),('isthisthekrustykrab','Approved','134fb0bf3bdd54ee9098f4cbc4351b9a','Patrick','Star'),('manager1','Approved','e58cce4fab03d2aea056398750dee16b','Manager','One'),('manager2','Approved','ba9485f02fc98cdbd2edadb0aa8f6390','Manager','Two'),('manager3','Approved','6e4fb18b49aa3219bef65195dac7be8c','Three','Three'),('manager4','Approved','d61dfee83aa2a6f9e32f268d60e789f5','Four','Four'),('notFullMetal','Approved','d009d70ae4164e8989725e828db8c7c2','Alphonse','Elric'),('programerAAL','Approved','ba9485f02fc98cdbd2edadb0aa8f6390','Ada','Lovelace'),('radioactivePoRa','Approved','e5d4b739db1226088177e6f8b70c3a6f','Marie','Curie'),('RitzLover28','Approved','8792b8cf71d27dc96173b2ac79b96e0d','Abby','Normal'),('smith_j','Pending','77c9749b451ab8c713c48037ddfbb2c4','John','Smith'),('texasStarKarate','Declined','7c5858f7fcf63ec268f42565be3abb95','Sandy','Cheeks'),('thePiGuy3.14','Approved','e11170b8cbd2d74102651cb967fa28e5','Archimedes','Syracuse'),('theScienceGuy','Approved','c8c605999f3d8352d7bb792cf3fdb25b','Bill','Nye');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserVisitHistory`
--

DROP TABLE IF EXISTS `UserVisitHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserVisitHistory` (
  `thName` varchar(50) NOT NULL,
  `thStreet` varchar(50) NOT NULL,
  `thCity` varchar(50) NOT NULL,
  `thState` char(2) NOT NULL,
  `thZipcode` char(5) NOT NULL,
  `comName` varchar(50) NOT NULL,
  `visitDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserVisitHistory`
--

LOCK TABLES `UserVisitHistory` WRITE;
/*!40000 ALTER TABLE `UserVisitHistory` DISABLE KEYS */;
INSERT INTO `UserVisitHistory` VALUES ('Main Movies','123 Main St','New York','NY','10001','EZ Theater Company','2010-03-22'),('Star Movies','745 GT St','Atlanta','GA','30332','EZ Theater Company','2010-03-25');
/*!40000 ALTER TABLE `UserVisitHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit` (
  `ID` varchar(50) NOT NULL,
  `v_date` date NOT NULL,
  `v_username` varchar(50) DEFAULT NULL,
  `v_compname` varchar(50) DEFAULT NULL,
  `v_theatername` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ibfk_13` (`v_username`),
  KEY `ibfk_14` (`v_compname`,`v_theatername`),
  CONSTRAINT `ibfk_13` FOREIGN KEY (`v_username`) REFERENCES `users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ibfk_14` FOREIGN KEY (`v_compname`, `v_theatername`) REFERENCES `theater` (`compname`, `theater_name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
INSERT INTO `visit` VALUES ('1','2010-03-22','georgep','EZ Theater Company','Main Movies'),('2','2010-03-22','calcwizard','EZ Theater Company','Main Movies'),('3','2010-03-25','calcwizard','EZ Theater Company','Star Movies'),('4','2010-03-25','imready','EZ Theater Company','Star Movies'),('5','2010-03-20','calcwizard','AI Theater Company','ML Movies');
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Team52'
--

--
-- Dumping routines for database 'Team52'
--
/*!50003 DROP FUNCTION IF EXISTS `city_cov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `city_cov`(i_compname VARCHAR(50)) RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE conteggio INT;
SET conteggio = (select count(distinct city) from theater group by compname having compname = i_compname);
IF conteggio IS NULL THEN SET conteggio = 0; END IF;
RETURN conteggio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fname_lname_mgr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fname_lname_mgr`(i_username VARCHAR(50)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE complete_name VARCHAR(50);
SET complete_name = (select CONCAT(firstname,' ', lastname) from users where username = i_username);
RETURN complete_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isAdmin_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isAdmin_type`(i_username VARCHAR(50)) RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE isAdmin INT DEFAULT 0;
IF i_username in (select username from admin)
	THEN SET isAdmin = 1;
END IF;
RETURN isAdmin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isCustomer_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isCustomer_type`(i_username VARCHAR(50)) RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE isCustomer INT DEFAULT 0;
IF i_username in (select u.username from customer as c join users as u on c.username = u.username)
	THEN SET isCustomer = 1;
END IF;
RETURN isCustomer;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isManager_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isManager_type`(i_username VARCHAR(50)) RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE isManager INT DEFAULT 0;
IF i_username in (select u.username from manager as m join users as u on m.username = u.username )
	THEN SET isManager = 1;
END IF;
RETURN isManager;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `n_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `n_employee`(i_compname VARCHAR(50)) RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE conteggio INT;
SET conteggio = (select count(*) from manager group by company having company = i_compname);
IF conteggio IS NULL THEN SET conteggio = 0; END IF;
RETURN conteggio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `n_theaters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `n_theaters`(i_compname VARCHAR(50)) RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE conteggio INT;
SET conteggio = (select count(theater_name) from theater group by compname having compname = i_compname);
IF conteggio IS NULL THEN SET conteggio = 0; END IF;
RETURN conteggio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `test_ccnum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `test_ccnum`(i_username VARCHAR(50)) RETURNS char(1) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE conteggio INT;
SET conteggio = (select count(*) from users as u join creditcard as c on u.username = c.username group by u.username having u.username = i_username);
IF conteggio IS NULL THEN SET conteggio = 0; END IF;
RETURN conteggio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `test_usertype` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `test_usertype`(i_username VARCHAR(50)) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE user_type VARCHAR(20);
IF i_username IN (select c.username from customer as c join manager as m on c.username = m.username)
	THEN SET user_type = 'CustomerManager';
ELSEIF i_username in (select c.username from customer as c join admin as a on c.username = a.username)
	THEN SET user_type = 'CustomerAdmin';
ELSEIF i_username in (select u.username from manager as m join users as u on m.username = u.username )
	THEN SET user_type = 'Manager';
ELSEIF i_username in (select u.username from customer as c join users as u on c.username = u.username)
	THEN SET  user_type = 'Customer';
ELSEIF i_username in (select * from admin)
	THEN SET user_type = 'Admin';
ELSE 
	SET user_type = 'User';
END IF;
RETURN user_type;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_approve_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_approve_user`(IN i_username VARCHAR(50))
BEGIN 
	UPDATE users SET user_status = 'Approved' WHERE username = i_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_create_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_create_mov`(IN i_movName VARCHAR(50),in i_movDuration INT(10) ,in i_movReleaseDate date )
BEGIN
    insert into movie(movie_name,releasedate,duration) values(i_movName,i_movReleaseDate,i_movDuration);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_create_theater` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_create_theater`(IN i_thName VARCHAR(50),IN i_comName VARCHAR(50), IN i_thStreet VARCHAR(50), IN i_thCity VARCHAR(50), IN i_thState CHAR(2),IN i_thZipcode CHAR(5),IN i_capacity INT(11),IN i_managerUsername VARCHAR(50))
BEGIN
	IF i_managerUsername NOT IN (select username from available_managers) 
		then select('Error: the manager is not available');
    else
		IF i_comName in (select company from available_managers where available_managers.username=i_managerUsername)
			then insert into theater (compname,theater_name,zipcode,street,city,state,capacity,username_mgr)values(i_comName,i_thName, i_thZipcode, i_thStreet, i_thCity, i_thState, i_capacity, i_managerUsername);
		else
        select('error');
        end if;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_decline_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_decline_user`(IN i_username VARCHAR(50))
BEGIN 
IF i_username in (select username from users where user_status = 'Approved') THEN SELECT ('User cannot be declined');
ELSE
	UPDATE users SET user_status = 'Declined' WHERE username = i_username;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_filter_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_filter_company`(i_comName VARCHAR(50), i_minCity INT, i_maxCity INT , i_minTheater INT, i_maxTheater INT, i_minEmployee INT, i_maxEmployee INT, i_sortBy VARCHAR(50), i_sortDirection VARCHAR(50))
BEGIN 
	IF i_minCity IS NULL THEN SET i_minCity = -1; END IF;
    IF i_maxCity IS NULL THEN SET i_maxCity = 1000; END IF;
    IF i_minTheater IS NULL THEN SET i_minTheater = -1; END IF;
    IF i_maxTheater IS NULL THEN SET i_maxTheater = 100000; END IF;
    IF i_minEmployee IS NULL THEN SET i_minEmployee = -1; END IF;
    IF i_maxEmployee IS NULL THEN SET i_maxEmployee = 100000; END IF;
	IF i_sortDirection = '' THEN SET i_sortDirection = 'DESC'; END IF;
    IF i_sortBy = '' THEN SET i_sortby = 'comName'; END IF;
    IF i_sortDirection NOT IN ('ASC', 'DESC') OR i_sortBy NOT IN ('comName', 'numCityCover', 'numTheater', 'numEmployee')
	THEN SELECT ('ERROR'); 
    ELSE 
		IF i_sortDirection = 'DESC' THEN 
			IF (i_comName = 'ALL' OR i_comName = '') THEN
				DROP TABLE IF EXISTS AdFilterCom;
				CREATE TABLE AdFilterCom
				SELECT company_name as 'comName' , n_CityCovered as 'numCityCover' , n_Theaters as 'numTheater' , n_Employee as 'numEmployee'
				FROM adminmanagecompany
				WHERE (n_CityCovered BETWEEN i_minCity AND i_maxCity) AND (n_Theaters BETWEEN i_minTheater AND i_maxTheater) AND (n_Employee BETWEEN i_minEmployee AND i_maxEmployee)
				ORDER BY (CASE i_sortby
				WHEN 'comName' THEN company_name
				WHEN 'numCityCover' THEN n_CityCovered
				WHEN 'numTheater' THEN n_Theaters
				WHEN 'numEmployee' THEN n_Employee END) DESC;
			ELSE
				DROP TABLE IF EXISTS AdFilterCom;
				CREATE TABLE AdFilterCom
				SELECT company_name as 'comName' , n_CityCovered as 'numCityCover' , n_Theaters as 'numTheater' , n_Employee as 'numEmployee'
				FROM adminmanagecompany
				WHERE company_name = i_comName AND (n_CityCovered BETWEEN i_minCity AND i_maxCity) AND (n_Theaters BETWEEN i_minTheater AND i_maxTheater) AND (n_Employee BETWEEN i_minEmployee AND i_maxEmployee)
				ORDER BY (CASE i_sortby
				WHEN 'comName' THEN company_name
				WHEN 'numCityCover' THEN n_CityCovered
				WHEN 'numTheater' THEN n_Theaters
				WHEN 'numEmployee' THEN n_Employee END) DESC;
			END IF;
        ELSE 
			IF (i_comName = 'ALL' OR i_comName = '') THEN
				DROP TABLE IF EXISTS AdFilterCom;
				CREATE TABLE AdFilterCom
				SELECT company_name as 'comName' , n_CityCovered as 'numCityCover' , n_Theaters as 'numTheater' , n_Employee as 'numEmployee'
				FROM adminmanagecompany
				WHERE (n_CityCovered BETWEEN i_minCity AND i_maxCity) AND (n_Theaters BETWEEN i_minTheater AND i_maxTheater) AND (n_Employee BETWEEN i_minEmployee AND i_maxEmployee)
				ORDER BY (CASE i_sortby
				WHEN 'comName' THEN company_name
				WHEN 'numCityCover' THEN n_CityCovered
				WHEN 'numTheater' THEN n_Theaters
				WHEN 'numEmployee' THEN n_Employee END) DESC;
			ELSE
				DROP TABLE IF EXISTS AdFilterCom;
				CREATE TABLE AdFilterCom
				SELECT company_name as 'comName'  , n_CityCovered as 'numCityCover' , n_Theaters as 'numTheater' , n_Employee as 'numEmployee'
				FROM adminmanagecompany
				WHERE company_name = i_comName AND (n_CityCovered BETWEEN i_minCity AND i_maxCity) AND (n_Theaters BETWEEN i_minTheater AND i_maxTheater) AND (n_Employee BETWEEN i_minEmployee AND i_maxEmployee)
				ORDER BY (CASE i_sortby
				WHEN 'comName' THEN company_name
				WHEN 'numCityCover' THEN n_CityCovered
				WHEN 'numTheater' THEN n_Theaters
				WHEN 'numEmployee' THEN n_Employee END) DESC;
			END IF;
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_filter_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_filter_user`(i_username VARCHAR(50), i_status VARCHAR(50), i_sortBy VARCHAR(50), i_sortDirection VARCHAR(50))
BEGIN 
	IF i_sortDirection = '' THEN SET i_sortDirection = 'DESC'; END IF;
    IF i_sortBy = '' THEN SET i_sortby = 'username'; END IF;
    IF i_status NOT IN ('Approved', 'Declined', 'Pending', 'ALL') OR i_sortDirection NOT IN ('ASC', 'DESC') OR i_sortBy NOT IN ('username', 'creditCardCount', 'userType', 'status')
	THEN SELECT ('ERROR'); 
    ELSE 
		IF i_sortDirection = 'DESC' THEN 
        DROP TABLE IF EXISTS AdFilterUser;
        CREATE TABLE AdFilterUser
        SELECT username, n_cc as 'creditCardCount' , user_type as 'userType' , user_status as 'status'
		FROM adminmanageuser 
		WHERE (user_status = i_status OR i_status = 'ALL') AND (username = i_username OR i_username = '')
		ORDER BY (CASE i_sortby
        WHEN 'username' THEN username
        WHEN 'creditCardCount' THEN n_cc
        WHEN 'userType' THEN user_type
        WHEN 'status' THEN user_status END) DESC;
        ELSE 
			DROP TABLE IF EXISTS AdFilterUser;
			CREATE TABLE AdFilterUser
			SELECT username, n_cc as 'creditCardCount' , user_type as 'userType' , user_status as 'status'
			FROM adminmanageuser 
			WHERE (user_status = i_status OR i_status = 'ALL') AND (username = i_username OR i_username = '')
			ORDER BY (CASE i_sortby
			WHEN 'username' THEN username
			WHEN 'creditCardCount' THEN n_cc
			WHEN 'userType' THEN user_type
			WHEN 'status' THEN user_status END) ASC;
            END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_view_comDetail_emp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_view_comDetail_emp`(IN i_comName VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS AdComDetailEmp;
    CREATE TABLE AdComDetailEmp
	select firstname as 'empFirstname',lastname as 'empLastname' from users left join manager using (username)
	where company=i_comName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_view_comDetail_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_view_comDetail_th`(IN i_comName VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS AdComDetailTh;
    CREATE TABLE AdComDetailTh
	SELECT theater_name as 'thName',username_mgr as 'thManagerUsername', city as 'thCity', state as 'thState', capacity as 'thCapacity'
    FROM theater
    WHERE 
		compname=i_comName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_add_creditcard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_add_creditcard`(IN i_username VARCHAR(50) , i_creditCardNum CHAR(16))
BEGIN
	IF (select count(*) from creditcard where username = i_username) = 5 or length(i_creditCardNum) <> 16 THEN SELECT ('Error: Credit cards cannot be more than five or Credit Card length is different than 16');
    ELSE
	INSERT INTO creditcard VALUES (i_username, i_creditCardNum);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_filter_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_filter_mov`(IN i_movName VARCHAR(50), IN i_comName VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(50), IN i_minMovPlayDate DATE, IN i_maxMovPlayDate DATE)
BEGIN 
	IF i_minMovPlayDate IS NULL THEN SET i_minMovPlayDate = '1980-01-01'; END IF;
    IF i_maxMovPlayDate IS NULL THEN SET i_maxMovPlayDate = '2030-01-01'; END IF;
	DROP TABLE IF EXISTS CosFilterMovie;
    CREATE TABLE CosFilterMovie
    SELECT t1.movieplay_name as 'movName', t1.movieplay_theatername as 'thName' , t2.street as 'thStreet', t2.city as 'thCity' ,t2.state as 'thState', t2.zipcode as 'thZipcode', t1.movieplay_compname as 'comName', t1.movieplay_date as 'movPlayDate', 
    t1.movieplay_releasedate as 'movReleaseDate'
	FROM movieplay as t1 JOIN theater as t2 ON (t1.movieplay_theatername = t2.theater_name) AND (t1.movieplay_compname = t2.compname)
    WHERE (t1.movieplay_name = i_movName OR i_movName = 'ALL')
    AND (t2.compname = i_comName OR i_comName = 'ALL' or i_comName = '')
    AND (t2.city = i_city OR i_city = '')
    AND (t2.state = i_state OR i_state = 'ALL' or i_state = '')
    AND (t1.movieplay_date BETWEEN i_minMovPlayDate AND i_maxMovPlayDate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_only_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_only_register`( IN i_username VARCHAR(50) , IN i_password VARCHAR(50) ,IN i_firstname VARCHAR(50) , IN i_lastname VARCHAR(50))
BEGIN
	if length(i_password)<8
	then
	select('password min lenght must be 8');
	else
	INSERT INTO users VALUES (i_username, 'Pending', MD5(i_password), i_firstname, i_lastname);
	INSERT INTO customer VALUES (i_username);
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_view_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_view_history`(IN i_cusUsername VARCHAR(50))
BEGIN 
	DROP TABLE IF EXISTS CosViewHistory;
    CREATE TABLE CosViewHistory
    SELECT u_moviename as 'movName', u_theatername as 'thName', u_compname as 'comName', u_creditcardnum as 'creditCardNum', u_date as 'movPlayDate'
    FROM used JOIN creditcard ON creditcard.creditcardnum = used.u_creditcardnum
    WHERE creditcard.username = i_cusUsername;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_view_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_view_mov`(IN i_creditCardNum CHAR(16), IN i_movName VARCHAR(50), IN i_movReleaseDate DATE, IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_movPlayDate DATE)
BEGIN 
	IF (select count(*) from used join creditcard on u_creditcardnum = creditcardnum where u_date = i_movPlayDate) = 3 THEN SELECT('Users cannot view more than three movies per day');
    ELSE
	INSERT INTO used VALUES (i_creditCardNum, i_comName, i_thName, i_movPlayDate, i_movName, i_movReleaseDate);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `list_employee`(IN i_companyname VARCHAR(50))
BEGIN
select GROUP_CONCAT(`firstname`,' ',`lastname` SEPARATOR ' , ') as 'Employees'
from users where username in (
select username 
from manager 
where company = i_companyname);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_customer_add_creditcard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_customer_add_creditcard`(IN i_username VARCHAR(50), IN i_creditCardNum CHAR(16))
BEGIN 
	if length (i_creditCardNum)<>16
    then select ('error: creadit cards have 16 numbers');
    else
	INSERT INTO creditcard VALUES (i_username, i_creditCardNum);
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_customer_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_customer_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), IN i_comName VARCHAR(50), IN i_empStreet VARCHAR(50), 
IN i_empCity VARCHAR(50), IN i_empState CHAR(2), IN i_empZipcode CHAR(5))
BEGIN 
    IF (i_empZipcode, i_empStreet, i_empCity, i_empState) IN (SELECT zipcode, street, city, state FROM manager) OR i_comName NOT IN (SELECT * FROM company)
    or length(i_password) <8 THEN SELECT ('ERROR');
    ELSE
		INSERT INTO users VALUES (i_username, 'Pending', MD5(i_password), i_firstname, i_lastname);
		INSERT INTO employee VALUES (i_username);
        INSERT INTO customer VALUES (i_username);
		INSERT INTO manager VALUES (i_username, i_empZipcode, i_empStreet, i_empCity, i_empState, i_comName);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_filter_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_filter_th`(IN i_manUsername varchar(50),IN i_movName VARCHAR(50) ,
 IN i_minMovDuration INT , IN i_maxMovduration INT,
IN i_minMovReleaseDate DATE , IN i_maxMovReleaseDate DATE ,  
IN i_minMovPlayDate DATE , IN i_maxMovPlayDate DATE,
IN i_includedNotPlay BOOL)
BEGIN 

call Team52.test_view(i_manUsername);

IF i_manUsername not in (select username_mgr from theater) THEN select ('Manager does not manage a theater');END IF;
IF i_maxMovduration is null THEN SET i_maxMovduration = 1000; END IF;
IF i_minMovduration is null THEN SET i_minMovduration = 0; END IF;

IF (i_includedNotPlay = False or i_includedNotPLay is NULL)
THEN
DROP TABLE IF EXISTS ManFilterTh;
CREATE TABLE ManFilterTh
select movName, movDuration , movReleaseDate, movPlayDate
from tobeused
where ( movName LIKE CONCAT('%', i_movName , '%')
AND (movDuration between i_minMovDuration and i_maxMovduration)
AND (i_minMovReleaseDate is null OR movReleaseDate >= i_minMovReleaseDate)
AND (i_maxMovReleaseDate is null OR movReleaseDate <= i_maxMovReleaseDate)
AND (i_minMovPlayDate is null OR movPlayDate >= i_minMovPlayDate)
AND (i_maxMovPlayDate is null OR  movPlayDate <= i_maxMovPlayDate));
ELSE
DROP TABLE IF EXISTS ManFilterTh;
CREATE TABLE ManFilterTh 
select movName, movDuration , movReleaseDate, movPlayDate
from tobeused
where ( movName LIKE CONCAT('%', i_movName , '%')
AND (movDuration between i_minMovDuration and i_maxMovduration)
AND (i_minMovReleaseDate is null OR movReleaseDate >= i_minMovReleaseDate)
AND (i_maxMovReleaseDate is null OR movReleaseDate <= i_maxMovReleaseDate)
AND (i_minMovPlayDate is null OR movPlayDate >= i_minMovPlayDate)
AND (i_maxMovPlayDate is null OR  movPlayDate <= i_maxMovPlayDate))
AND (movPlayDate is NULL);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_only_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_only_register`(i_username VARCHAR(50) , i_password VARCHAR(50), i_firstname VARCHAR(50), i_lastname VARCHAR(50), i_comName VARCHAR(50), i_empStreet VARCHAR(50), i_empCity VARCHAR(50), i_empState CHAR(2), i_empZipcode CHAR(5))
BEGIN
	IF i_username IN (select * from employee) OR (i_empZipcode, i_empStreet, i_empCity, i_empState) IN (SELECT zipcode, street, city, state FROM manager) OR i_comName NOT IN (SELECT * FROM company)
    or length(i_password)<8
    THEN SELECT ('ERROR');
    ELSE
		INSERT INTO users VALUES (i_username, 'Pending', MD5(i_password), i_firstname, i_lastname);
		INSERT INTO employee VALUES (i_username);
		INSERT INTO manager VALUES (i_username, i_empZipcode, i_empStreet, i_empCity, i_empState, i_comName);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_schedule_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_schedule_mov`(i_manUsername VARCHAR(50), i_movName VARCHAR(50), i_movReleaseDate DATE, i_movPlayDate DATE)
BEGIN 
	IF i_movPlayDate < i_movReleaseDate OR (i_movName, i_movReleaseDate) NOT IN (SELECT movie_name, releasedate FROM movie)
    OR (select capacity from theater where username_mgr = i_manUsername) = (select count(distinct movieplay_name) from movieplay where movieplay_theatername in 
    (select theater_name from theater where username_mgr = i_manUsername) and movieplay_date = i_movPlayDate)
	then select ('error');
    ELSE
    INSERT INTO movieplay VALUES ((SELECT company FROM manager WHERE username = i_manUsername), (SELECT theater_name FROM theater WHERE username_mgr = i_manUsername), i_movPlayDate, i_movName, i_movReleaseDate);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test_view` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_view`(IN i_username VARCHAR(50))
BEGIN
DROP TABLE IF EXISTS tobeused;
CREATE TABLE tobeused
select movie_name as 'movName', duration as 'movDuration' , releasedate as 'movReleaseDate', movieplay_date as 'movPlayDate'
from movie left join (select *
from theater, movieplay 
where compname = movieplay_compname and theater_name = movieplay_theatername
and username_mgr = i_username) as Ale on (movie_name = movieplay_name and movieplay_releasedate = releasedate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_filter_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_filter_th`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(3))
BEGIN    
	DROP TABLE IF EXISTS UserFilterTh;    
	CREATE TABLE UserFilterTh 
	SELECT theater_name as 'thName', street as 'thStreet', city as 'thCity', state as 'thState', zipcode as 'thZipcode' , compname as 'comName' 
	FROM Theater   
	WHERE (theater_name = i_thName OR i_thName = "ALL")
	AND        (compname = i_comName OR i_comName = "ALL") 
	AND        (city = i_city OR i_city = "") 
	AND        (state = i_state OR i_state = "" or i_state = 'ALL');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_filter_visitHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_filter_visitHistory`(IN i_username VARCHAR(50), IN i_minVisitDate DATE, IN i_maxVisitDate DATE)
BEGIN 
	DROP TABLE IF EXISTS UserVisitHistory;
    CREATE TABLE UserVisitHistory
	SELECT t.theater_name as 'thName', t.street as 'thStreet', t.city as 'thCity', t.state 'thState', t.zipcode as 'thZipcode', t.compname as 'comName', v.v_date as 'visitDate'
    FROM visit AS v
		 JOIN
        theater AS t
        on (v_theatername = theater_name and v_compname = compname)
	WHERE
		(v_username = i_username) AND
        (i_minVisitDate IS NULL OR v_date >= i_minVisitDate) AND
        (i_maxVisitDate IS NULL OR v_date <= i_maxVisitDate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_login`(IN i_username VARCHAR(50) , IN i_password VARCHAR(50))
BEGIN
IF i_username not in (select username from users) OR MD5(i_password) not in (select user_password from users where username = i_username) 
or (select user_status from users where username = i_username) not in ('Approved') THEN 
DROP TABLE IF EXISTS UserLogin;
CREATE TABLE UserLogin
SELECT username, status, isCustomer , isAdmin , isManager
from userlogin_view
where 0;
ELSE
DROP TABLE IF EXISTS UserLogin;
CREATE TABLE UserLogin
SELECT username, status, isCustomer , isAdmin , isManager
from userlogin_view
where username = i_username;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_register`(IN i_username VARCHAR(50) , In i_password VARCHAR(50) ,
IN i_firstname VARCHAR(50) , IN i_lastname VARCHAR(50))
BEGIN
if length(i_password)<8
then
select('password min lenght must be 8');
else
INSERT INTO users (username, user_status, user_password , firstname, lastname)
VALUES (i_username, 'Pending' , MD5(i_password) , i_firstname, i_lastname);
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_visit_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_visit_th`(IN i_thName VARCHAR(50),  IN i_comName VARCHAR(50), IN i_visitDate DATE , IN i_username varchar(50))
BEGIN 
	DECLARE a int;
    SET a = (SELECT ID FROM visit ORDER BY ID DESC LIMIT 1) + 1;
	INSERT INTO visit VALUES (a ,i_visitDate, i_username, i_comName, i_thName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `adminmanagecompany`
--

/*!50001 DROP VIEW IF EXISTS `adminmanagecompany`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `adminmanagecompany` AS select `company`.`company_name` AS `company_name`,`CITY_COV`(`company`.`company_name`) AS `n_CityCovered`,`N_THEATERS`(`company`.`company_name`) AS `n_Theaters`,`N_EMPLOYEE`(`company`.`company_name`) AS `n_Employee` from `company` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `adminmanageuser`
--

/*!50001 DROP VIEW IF EXISTS `adminmanageuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `adminmanageuser` AS select `users`.`username` AS `username`,`TEST_CCNUM`(`users`.`username`) AS `n_cc`,`TEST_USERTYPE`(`users`.`username`) AS `user_type`,`users`.`user_status` AS `user_status` from `users` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `available_managers`
--

/*!50001 DROP VIEW IF EXISTS `available_managers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `available_managers` AS select `manager`.`username` AS `username`,`manager`.`zipcode` AS `zipcode`,`manager`.`street` AS `street`,`manager`.`city` AS `city`,`manager`.`state` AS `state`,`manager`.`company` AS `company` from `manager` where `manager`.`username` in (select `manager`.`username` from (`manager` join `theater` on((`manager`.`username` = `theater`.`username_mgr`)))) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userlogin_view`
--

/*!50001 DROP VIEW IF EXISTS `userlogin_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userlogin_view` AS select `users`.`username` AS `username`,`users`.`user_status` AS `status`,`ISCUSTOMER_TYPE`(`users`.`username`) AS `isCustomer`,`ISADMIN_TYPE`(`users`.`username`) AS `isAdmin`,`ISMANAGER_TYPE`(`users`.`username`) AS `isManager` from `users` */;
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

-- Dump completed on 2019-11-29 19:39:14
