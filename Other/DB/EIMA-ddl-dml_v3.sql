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
INSERT INTO `Address` VALUES (1,0,'C101','IGate','Bangalore','Karnataka','India',600045,1),(2,1,'A309','Highway Town','Bangalore','Karnataka','India',600056,2),(3,1,'D804','Marthalli','Bangalore','Karnataka','India',600124,3),(4,0,'A302','Lower Parel','Mumbai','Maharashtra','India',400034,4),(5,0,'T501','Dadar','Mumbai','Maharashtra','India',400032,5);
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
  `addedOnDate` datetime DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES (1,'Morgan Stanley','Mumbai',NULL),(2,'Credit Suisse','Pune',NULL),(3,'J.P.Morgan','Mumbai',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,'BFSI'),(2,'Telecom'),(3,'Finance');
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
  `designation` varchar(45) DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `salary` double NOT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `mgr_eid` int(11) DEFAULT NULL,
  `joining_date` datetime DEFAULT NULL,
  `leaving_date` datetime DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `KEY_EMP_EMP_idx` (`mgr_eid`),
  KEY `KEY_EMP_DEPT_idx` (`dept_id`),
  CONSTRAINT `KEY_EMP_DEPT` FOREIGN KEY (`dept_id`) REFERENCES `Department` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `KEY_EMP_EMP` FOREIGN KEY (`mgr_eid`) REFERENCES `Employee` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'John','A','Watson','CEO',0,3000000,'1234567890',1,NULL,'2000-02-11 00:00:00',NULL),(2,'Peter','B','Potter','Manager',0,2000000,'0987654321',1,1,'2000-08-12 00:00:00',NULL),(3,'Harry','D','Wilson','Employee',0,800000,'6789054321',1,2,'2002-03-24 00:00:00',NULL),(4,'Serina','P','Walker','Manger',1,2200000,'1234509876',2,1,'2001-01-22 00:00:00',NULL),(5,'Miley','T','Henry','Employee',1,1000000,'8907653214',2,4,'2009-04-08 00:00:00',NULL),(6,'Adam','P','Zuck','Administrator',0,765232,'9876567897',1,2,'2009-02-23 00:00:00',NULL);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_update_on AFTER UPDATE ON Employee
FOR EACH ROW

BEGIN

	IF NEW.first_name <> OLD.first_name THEN  INSERT INTO History (field_changed, old_val, new_val, eid) VALUES('first_name', OLD.salary,NEW.salary,OLD.eid);
    END IF;
    
    IF NEW.last_name <> OLD.last_name THEN  INSERT INTO History (field_changed, old_val, new_val, eid) VALUES('last_name', OLD.last_name,NEW.last_name,OLD.eid);
    END IF;
    
    IF NEW.middle_name <> OLD.middle_name THEN  INSERT INTO History (field_changed, old_val, new_val, eid) VALUES('middle_name', OLD.middle_name,NEW.middle_name,OLD.eid);
    END IF;
    
    IF NEW.designation <> OLD.designation THEN  INSERT INTO History (field_changed, old_val, new_val, eid) VALUES('designation', OLD.designation,NEW.designation,OLD.eid);
    END IF;
    
    IF NEW.gender <> OLD.gender THEN  INSERT INTO History (field_changed, old_val, new_val, eid) VALUES('gender', OLD.gender,NEW.gender,OLD.eid);
    END IF;
    
    IF NEW.salary <> OLD.salary THEN  INSERT INTO History (field_changed, old_val, new_val, eid) VALUES('salary', OLD.salary,NEW.salary,OLD.eid);
    END IF;
    
    IF NEW.phone_number <> OLD.phone_number THEN  INSERT INTO History (field_changed, old_val, new_val, eid) VALUES('phone_number', OLD.phone_number,NEW.phone_number,OLD.eid);
    END IF;
    
    IF NEW.dept_id <> OLD.dept_id THEN  INSERT INTO History (field_changed, old_val, new_val, eid) VALUES('dept_id', OLD.dept_id,NEW.dept_id,OLD.eid);
    END IF;
    
    IF NEW.mgr_eid <> OLD.mgr_eid THEN  INSERT INTO History (field_changed, old_val, new_val, eid) VALUES('mgr_eid', OLD.mgr_eid,NEW.mgr_eid,OLD.eid);
    END IF;
    
    IF NEW.joining_date <> OLD.joining_date THEN  INSERT INTO History (field_changed, old_val, new_val, eid) VALUES('joining_date', OLD.joining_date,NEW.joining_date,OLD.eid);
    END IF;
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Employee_Client`
--

DROP TABLE IF EXISTS `Employee_Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee_Client` (
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
-- Dumping data for table `Employee_Client`
--

LOCK TABLES `Employee_Client` WRITE;
/*!40000 ALTER TABLE `Employee_Client` DISABLE KEYS */;
INSERT INTO `Employee_Client` VALUES (1,3,'2017-05-23 00:00:00',NULL,NULL),(2,5,'2017-01-01 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `Employee_Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_Project`
--

DROP TABLE IF EXISTS `Employee_Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee_Project` (
  `eid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`eid`,`pid`),
  KEY `KEY_WOP_PRO_idx` (`pid`),
  CONSTRAINT `KEY_WOP_EMP` FOREIGN KEY (`eid`) REFERENCES `Employee` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `KEY_WOP_PRO` FOREIGN KEY (`pid`) REFERENCES `Project` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_Project`
--

LOCK TABLES `Employee_Project` WRITE;
/*!40000 ALTER TABLE `Employee_Project` DISABLE KEYS */;
INSERT INTO `Employee_Project` VALUES (3,1,'2017-05-23 00:00:00',NULL,'Consultant'),(4,1,'2017-05-23 00:00:00',NULL,'Manager'),(5,2,'2017-01-01 00:00:00',NULL,'Consultant');
/*!40000 ALTER TABLE `Employee_Project` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group`
--

LOCK TABLES `Group` WRITE;
/*!40000 ALTER TABLE `Group` DISABLE KEYS */;
INSERT INTO `Group` VALUES (1,'admin'),(2,'hr');
/*!40000 ALTER TABLE `Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group_Permission`
--

DROP TABLE IF EXISTS `Group_Permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Group_Permission` (
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
-- Dumping data for table `Group_Permission`
--

LOCK TABLES `Group_Permission` WRITE;
/*!40000 ALTER TABLE `Group_Permission` DISABLE KEYS */;
INSERT INTO `Group_Permission` VALUES (1,1,'2017-03-01 00:00:00'),(1,2,'2017-03-01 00:00:00'),(1,3,'2017-03-01 00:00:00'),(2,1,'2017-03-02 00:00:00'),(2,2,'2017-03-02 00:00:00');
/*!40000 ALTER TABLE `Group_Permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `History`
--

DROP TABLE IF EXISTS `History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `History` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `field_changed` varchar(45) DEFAULT NULL,
  `old_val` varchar(45) DEFAULT NULL,
  `new_val` varchar(45) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  PRIMARY KEY (`hid`),
  KEY `KEY_HIST_EMP_idx` (`eid`),
  CONSTRAINT `KEY_HIST_EMP` FOREIGN KEY (`eid`) REFERENCES `Employee` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `History`
--

LOCK TABLES `History` WRITE;
/*!40000 ALTER TABLE `History` DISABLE KEYS */;
INSERT INTO `History` VALUES (7,'2017-07-18 17:07:21','salary','9876523','765232',6),(8,'2017-07-18 17:07:21','phone_number','0987654212','9876567897',6),(9,'2017-07-18 17:07:21','dept_id','2','1',6),(10,'2017-07-18 17:07:21','mgr_eid','4','2',6),(11,'2017-07-18 17:07:21','joining_date','2009-02-22 00:00:00','2009-02-23 00:00:00',6);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permission`
--

LOCK TABLES `Permission` WRITE;
/*!40000 ALTER TABLE `Permission` DISABLE KEYS */;
INSERT INTO `Permission` VALUES (1,'add'),(2,'update'),(3,'delete');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES (1,'Compliance Tools','2017-05-22 00:00:00',NULL,1,1),(2,'Wealth Management','2017-01-01 00:00:00',NULL,2,1);
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `eid` int(11) NOT NULL,
  `email_id` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `address_visible` int(11) DEFAULT NULL,
  `dob_visible` int(11) DEFAULT NULL,
  `gender_visible` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`),
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
INSERT INTO `User` VALUES (6,'admin@wissen.com','admin','2017-04-02 00:00:00',1,1,1,NULL);
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

-- Dump completed on 2017-07-19 21:54:05
