-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: EIMA
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `address_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `line1` varchar(45) DEFAULT NULL,
  `line2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) NOT NULL,
  `pincode` int(11) NOT NULL,
  `eid` int(11) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `KEY_AD_EMP_idx` (`eid`),
  CONSTRAINT `KEY_AD_EMP` FOREIGN KEY (`eid`) REFERENCES `Employee` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(45) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `gender` int(11) NOT NULL,
  `salary` double NOT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `mgr_eid` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `KEY_EMP_EMP_idx` (`mgr_eid`),
  KEY `KEY_EMP_DEPT_idx` (`dept_id`),
  CONSTRAINT `KEY_EMP_DEPT` FOREIGN KEY (`dept_id`) REFERENCES `Department` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `KEY_EMP_EMP` FOREIGN KEY (`mgr_eid`) REFERENCES `Employee` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group`
--

DROP TABLE IF EXISTS `Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Group` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group`
--

LOCK TABLES `Group` WRITE;
/*!40000 ALTER TABLE `Group` DISABLE KEYS */;
/*!40000 ALTER TABLE `Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group_Permissions`
--

DROP TABLE IF EXISTS `Group_Permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Group_Permissions` (
  `gid` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `addedOnDate` datetime DEFAULT NULL,
  PRIMARY KEY (`gid`,`permission_id`),
  KEY `KEY_GP_PER_idx` (`permission_id`),
  CONSTRAINT `KEY_GP_GRP` FOREIGN KEY (`gid`) REFERENCES `Group` (`gid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `KEY_GP_PER` FOREIGN KEY (`permission_id`) REFERENCES `Permission` (`permission_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group_Permissions`
--

LOCK TABLES `Group_Permissions` WRITE;
/*!40000 ALTER TABLE `Group_Permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Group_Permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `History`
--

DROP TABLE IF EXISTS `History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `History` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT NULL,
  `field_changed` varchar(45) DEFAULT NULL,
  `old_val` varchar(45) DEFAULT NULL,
  `new_val` varchar(45) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  PRIMARY KEY (`hid`),
  KEY `KEY_HIST_EMP_idx` (`eid`),
  CONSTRAINT `KEY_HIST_EMP` FOREIGN KEY (`eid`) REFERENCES `Employee` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `History`
--

LOCK TABLES `History` WRITE;
/*!40000 ALTER TABLE `History` DISABLE KEYS */;
/*!40000 ALTER TABLE `History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permission`
--

DROP TABLE IF EXISTS `Permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permission`
--

LOCK TABLES `Permission` WRITE;
/*!40000 ALTER TABLE `Permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `Permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `KEY_PRO_CLI_idx` (`cid`),
  KEY `KEY_PRO_DEPT_idx` (`dept_id`),
  CONSTRAINT `KEY_PRO_CLI` FOREIGN KEY (`cid`) REFERENCES `Client` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `KEY_PRO_DEPT` FOREIGN KEY (`dept_id`) REFERENCES `Department` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Serves_Client`
--

DROP TABLE IF EXISTS `Serves_Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Serves_Client` (
  `cid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cid`,`eid`),
  KEY `KEY_SER_EMP_idx` (`eid`),
  CONSTRAINT `KEY_SER_CLI` FOREIGN KEY (`cid`) REFERENCES `Client` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `KEY_SER_EMP` FOREIGN KEY (`eid`) REFERENCES `Employee` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Serves_Client`
--

LOCK TABLES `Serves_Client` WRITE;
/*!40000 ALTER TABLE `Serves_Client` DISABLE KEYS */;
/*!40000 ALTER TABLE `Serves_Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `email_id` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `KEY_USER_EMP_idx` (`eid`),
  KEY `KEY_USER_GRP_idx` (`gid`),
  CONSTRAINT `KEY_USER_EMP` FOREIGN KEY (`eid`) REFERENCES `Employee` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `KEY_USER_GRP` FOREIGN KEY (`gid`) REFERENCES `Group` (`gid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visibilty`
--

DROP TABLE IF EXISTS `Visibilty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Visibilty` (
  `email_id` varchar(20) NOT NULL,
  `address` int(11) DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  CONSTRAINT `KEY_VIS_USER` FOREIGN KEY (`email_id`) REFERENCES `User` (`email_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visibilty`
--

LOCK TABLES `Visibilty` WRITE;
/*!40000 ALTER TABLE `Visibilty` DISABLE KEYS */;
/*!40000 ALTER TABLE `Visibilty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Works_On_Project`
--

DROP TABLE IF EXISTS `Works_On_Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Works_On_Project` (
  `eid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`eid`,`pid`),
  KEY `KEY_WOP_PRO_idx` (`pid`),
  CONSTRAINT `KEY_WOP_EMP` FOREIGN KEY (`eid`) REFERENCES `Employee` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `KEY_WOP_PRO` FOREIGN KEY (`pid`) REFERENCES `Project` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Works_On_Project`
--

LOCK TABLES `Works_On_Project` WRITE;
/*!40000 ALTER TABLE `Works_On_Project` DISABLE KEYS */;
/*!40000 ALTER TABLE `Works_On_Project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-12  0:18:42
