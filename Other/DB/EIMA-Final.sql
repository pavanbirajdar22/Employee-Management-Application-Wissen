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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,0,'C101','IGate','Bangalore','Karnataka','India',600045,1),(2,1,'A309','Highway Town','Bangalore','Karnataka','India',600056,2),(3,1,'D804','Marthalli','Bangalore','Karnataka','India',600124,3),(4,0,'A302','Lower Parel','Mumbai','Maharashtra','India',400034,4),(5,0,'T501','Dadar','Mumbai','Maharashtra','India',400032,5),(6,0,'D-204','Ulhasnagar','Mumbai','Maharashtra','India',400019,6),(7,0,'A302','Lower Parel','Mumbai','Maharashtra','India',400034,7),(8,0,'A302','Lower Parel','Mumbai','Maharashtra','India',400034,8),(9,1,'A309','Highway Town','Bangalore','Karnataka','India',600056,9),(10,1,'A309','Highway Town','Bangalore','Karnataka','India',600056,10),(12,0,'Street 1','Mahadevpura','Bangalore','Karnataka','India',560016,175),(13,0,'Street 26','Sterling Brookside','Bangalore','Karnataka','India',400067,176),(14,0,'C-55, VJTI Boys Hostel, Near 5 Gardens','Matunga East','Mumbai','Maharashtra','India',400019,177);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `location` varchar(45) DEFAULT NULL,
  `addedOnDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Morgan Stanley','Mumbai','2016-02-23 00:00:00','leading global financial services firm providing investment banking, securities, wealth management and investment'),(2,'Credit Suisse','Pune','2016-11-11 00:00:00','Credit Suisse Group is a Swiss multinational financial services holding company'),(3,'J.P.Morgan','Pune','2016-02-21 00:00:00','leading global financial services firm providing investment banking, securities, wealth management and investment'),(5,'Apple','California US','2016-02-01 00:00:00','American multinational technology company headquartered in Cupertino, California that designs, develops, and sells consumer electronics, computer software, and online services'),(6,'Morgan Stanley','Bangalore','2016-02-12 00:00:00','leading global financial services firm providing investment banking, securities, wealth management and investment');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `EIMA`.`client_AFTER_INSERT` AFTER INSERT ON `client` FOR EACH ROW
BEGIN
	INSERT INTO History (field_changed, new_val) VALUES('New Client', NEW.name);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Banking & Finance ','Trade Management, Broker Administration, Portfolio Accounting, Performance Reporting, Risk Management, Compliance, Prime Brokerage and Treasury'),(2,'Telecom','Payment Gateway, PCA, Credit Check, BBAC, SMS , Email and Reporting Platform, Fraud Detection Systems'),(3,'HealthCare','Healthcare industry is going through a disruptive phase, with technology creeping into several aspects of the entire practice');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `EIMA`.`department_AFTER_INSERT` AFTER INSERT ON `department` FOR EACH ROW
BEGIN
	INSERT INTO History (field_changed, new_val) VALUES('New Department', NEW.dept_name);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `designation` varchar(45) DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `salary` double NOT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `mgr_eid` int(11) DEFAULT NULL,
  `joining_date` datetime DEFAULT NULL,
  `leaving_date` datetime DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `KEY_EMP_EMP_idx` (`mgr_eid`),
  KEY `KEY_EMP_DEPT_idx` (`dept_id`),
  CONSTRAINT `KEY_EMP_DEPT` FOREIGN KEY (`dept_id`) REFERENCES `Department` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `KEY_EMP_EMP` FOREIGN KEY (`mgr_eid`) REFERENCES `Employee` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'John','A','Watson','CEO',0,3000000,'1234567890','1981-02-23 00:00:00',1,NULL,'2000-02-11 00:00:00',NULL),(2,'Mark','K','Thoms','Trainee Analyst',1,12340,'9876543212','1983-02-23 00:00:00',1,1,'2017-07-26 19:58:41',NULL),(3,'Harry','D','Wilson','Employee',0,800000,'6789054321','1981-02-23 00:00:00',1,2,'2002-03-24 00:00:00',NULL),(4,'Serina','P','Walker','Manager',1,2200000,'1234509876','1985-02-23 00:00:00',2,1,'2001-01-22 00:00:00',NULL),(5,'Miley','T','Henry','Employee',1,1000000,'8907653214','1985-02-23 00:00:00',2,4,'2009-04-08 00:00:00',NULL),(6,'Adam','N','Zuck','Administrator',0,876567,'8765456782','1985-02-23 00:00:00',1,2,'2009-02-23 00:00:00',NULL),(7,'James','T','Josephine','Manager',0,987652,'9876546789','1985-02-23 00:00:00',2,2,'2009-02-23 00:00:00',NULL),(8,'Pavan','B','Birajdar','Trainee Analyst',0,987652,'9876542343','1985-02-23 00:00:00',1,2,'2009-02-23 00:00:00',NULL),(9,'Somdev','T','Mehta','Trainee Analyst',0,987652,'9873265125','1985-02-23 00:00:00',2,4,'2009-02-23 00:00:00',NULL),(10,'Prashant','M','Babel','Trainee Analyst',0,987652,'1232123273','1985-02-23 00:00:00',1,2,'2009-02-23 00:00:00',NULL),(175,'Bob','','Marley','Trainee Analyst',0,12345,'86919149191','2000-01-01 05:30:00',2,4,'2016-02-02 05:30:00',NULL),(176,'Shane','M','Long','Developer',0,123456,'12345678','1990-06-13 05:30:00',1,4,'2017-01-13 05:30:00',NULL),(177,'James','','Anderson','Analyst',0,9876543,'876545678','2000-07-01 05:30:00',3,4,'2017-07-01 05:30:00',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `EIMA`.`employee_AFTER_INSERT` AFTER INSERT ON `employee` FOR EACH ROW
BEGIN
	INSERT INTO History (field_changed, new_val) VALUES('New Employee', concat_ws(' ',NEW.first_name,NEW.middle_name,NEW.last_name));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `EIMA`.`employee_AFTER_UPDATE` AFTER UPDATE ON `employee` FOR EACH ROW
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
-- Table structure for table `employee_client`
--

DROP TABLE IF EXISTS `employee_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_client` (
  `cid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `start_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cid`,`eid`),
  KEY `KEY_SER_EMP_idx` (`eid`),
  CONSTRAINT `KEY_SER_CLI` FOREIGN KEY (`cid`) REFERENCES `Client` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `KEY_SER_EMP` FOREIGN KEY (`eid`) REFERENCES `Employee` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_client`
--

LOCK TABLES `employee_client` WRITE;
/*!40000 ALTER TABLE `employee_client` DISABLE KEYS */;
INSERT INTO `employee_client` VALUES (1,3,'2017-05-23 00:00:00',NULL,NULL),(1,4,'2017-05-23 00:00:00',NULL,NULL),(1,5,'2017-05-23 00:00:00',NULL,NULL),(1,176,'2017-07-28 11:37:00',NULL,NULL),(2,7,'2017-03-01 00:00:00',NULL,NULL),(2,8,'2017-05-13 00:00:00',NULL,NULL),(3,9,'2017-01-21 00:00:00',NULL,NULL),(3,10,'2017-01-22 00:00:00',NULL,NULL),(3,175,'2017-07-28 11:25:27',NULL,NULL),(3,177,'2017-07-28 11:50:03',NULL,NULL);
/*!40000 ALTER TABLE `employee_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_project`
--

DROP TABLE IF EXISTS `employee_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_project` (
  `eid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `start_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`eid`,`pid`),
  KEY `KEY_WOP_PRO_idx` (`pid`),
  CONSTRAINT `KEY_WOP_EMP` FOREIGN KEY (`eid`) REFERENCES `Employee` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `KEY_WOP_PRO` FOREIGN KEY (`pid`) REFERENCES `Project` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_project`
--

LOCK TABLES `employee_project` WRITE;
/*!40000 ALTER TABLE `employee_project` DISABLE KEYS */;
INSERT INTO `employee_project` VALUES (2,2,'2017-07-28 11:08:16',NULL,'Manager'),(3,1,'2017-05-23 00:00:00',NULL,'Consultant'),(4,1,'2017-05-23 00:00:00',NULL,'Manager'),(5,1,'2017-01-01 00:00:00',NULL,'Consultant'),(7,2,'2017-02-02 00:00:00',NULL,'Analyst'),(8,2,'2017-01-01 00:00:00',NULL,'Analyst'),(9,3,'2017-01-11 00:00:00',NULL,'Consultant'),(10,3,'2017-01-12 00:00:00',NULL,'Consultant'),(175,1,'2017-07-28 11:25:27',NULL,NULL),(176,2,'2017-07-28 11:37:00',NULL,NULL),(177,3,'2017-07-28 11:50:03',NULL,NULL);
/*!40000 ALTER TABLE `employee_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `field_changed` varchar(45) DEFAULT NULL,
  `old_val` varchar(45) DEFAULT NULL,
  `new_val` varchar(45) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  PRIMARY KEY (`hid`),
  KEY `KEY_HIST_EMP_idx` (`eid`),
  CONSTRAINT `KEY_HIST_EMP` FOREIGN KEY (`eid`) REFERENCES `Employee` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,'2017-07-27 23:51:46','New Employee',NULL,'James T Josephine',NULL),(2,'2017-07-27 23:51:46','first_name','12340','12340',2),(3,'2017-07-27 23:51:46','last_name','jhbds','Thoms',2),(4,'2017-07-27 23:51:46','middle_name','Kumar','K',2),(5,'2017-07-27 23:51:46','phone_number','987654321','9876543212',2),(6,'2017-07-27 23:51:46','first_name','12340','12340',2),(7,'2017-07-27 23:51:46','last_name','jhbds','Thoms',2),(8,'2017-07-27 23:51:46','middle_name','Kumar','K',2),(9,'2017-07-27 23:51:46','phone_number','987654321','9876543212',2),(10,'2017-07-27 23:51:46','designation','Manger','Manager',4),(11,'2017-07-27 23:51:46','designation','Manger','Manager',4),(12,'2017-07-28 00:03:34','New Department',NULL,'Healthcare',NULL),(13,'2017-07-28 00:04:53','New Department',NULL,'HealthCare',NULL),(14,'2017-07-28 00:08:48','New Employee',NULL,'James T Josephine',NULL),(15,'2017-07-28 00:09:33','New Employee',NULL,'Mark T Josephine',NULL),(16,'2017-07-28 00:11:10','first_name','987652','987652',8),(17,'2017-07-28 00:11:10','last_name','Josephine','Birajdar',8),(18,'2017-07-28 00:11:10','phone_number','9876546789','9876542343',8),(19,'2017-07-28 00:11:10','first_name','987652','987652',8),(20,'2017-07-28 00:11:10','last_name','Josephine','Birajdar',8),(21,'2017-07-28 00:11:10','phone_number','9876546789','9876542343',8),(22,'2017-07-28 00:11:10','first_name','987652','987652',9),(23,'2017-07-28 00:11:10','last_name','Josephine','Mehta',9),(24,'2017-07-28 00:11:10','phone_number','9876546789','1234123273',9),(25,'2017-07-28 00:11:10','first_name','987652','987652',9),(26,'2017-07-28 00:11:10','last_name','Josephine','Mehta',9),(27,'2017-07-28 00:11:10','phone_number','9876546789','1234123273',9),(28,'2017-07-28 00:13:55','New Employee',NULL,'Prashant M Babel',NULL),(29,'2017-07-28 00:13:55','middle_name','T','B',8),(30,'2017-07-28 00:13:55','middle_name','T','B',8),(31,'2017-07-28 00:27:05','New Project',NULL,'NLU',NULL),(32,'2017-07-28 00:53:08','New Employee',NULL,'Jackie L Vaswani',NULL),(33,'2017-07-28 10:26:29','phone_number','1234123273','9873265125',9),(34,'2017-07-28 10:26:29','phone_number','1234123273','9873265125',9),(35,'2017-07-28 11:23:56','New Employee',NULL,'Bob  Marley',NULL),(36,'2017-07-28 11:25:27','New Employee',NULL,'Bob  Marley',NULL),(37,'2017-07-28 11:37:00','New Employee',NULL,'Shane M Long',NULL),(38,'2017-07-28 11:50:03','New Employee',NULL,'James  Anderson',NULL),(39,'2017-07-28 11:52:19','middle_name','P','N',6),(40,'2017-07-28 11:52:19','salary','765232','876567',6),(41,'2017-07-28 11:52:19','middle_name','P','N',6),(42,'2017-07-28 11:52:19','salary','765232','876567',6),(43,'2017-07-28 12:00:29','phone_number','9876567897','8765456782',6),(44,'2017-07-28 12:00:29','phone_number','9876567897','8765456782',6);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `eid` int(11) NOT NULL,
  `add_employee` int(11) DEFAULT '0',
  `edit_employee` int(11) DEFAULT '0',
  `edit_other_employee` int(11) DEFAULT '0',
  `delete_user` int(11) DEFAULT '0',
  `add_project` int(11) DEFAULT '0',
  `edit_project` int(11) DEFAULT '0',
  `add_department` int(11) DEFAULT '0',
  `edit_department` int(11) DEFAULT '0',
  `add_client` int(11) DEFAULT '0',
  `edit_client` int(11) DEFAULT '0',
  `generate_report` int(11) DEFAULT '0',
  PRIMARY KEY (`eid`),
  CONSTRAINT `KEY_PER_USER` FOREIGN KEY (`eid`) REFERENCES `User` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,0,0,0,0,0,0,0,0,0,0,0),(2,1,0,0,0,0,0,0,0,0,0,0),(3,1,0,0,0,0,0,0,0,1,0,0),(4,0,0,0,0,0,0,0,0,0,0,0),(5,0,0,0,0,0,0,0,0,0,0,0),(6,1,1,1,1,1,1,1,1,1,1,1),(7,0,1,0,0,0,0,0,0,0,0,0),(8,1,1,1,1,1,1,1,1,1,1,0),(9,0,0,0,0,0,0,0,0,0,0,0),(10,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `KEY_PRO_CLI_idx` (`cid`),
  KEY `KEY_PRO_DEPT_idx` (`dept_id`),
  CONSTRAINT `KEY_PRO_CLI` FOREIGN KEY (`cid`) REFERENCES `Client` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `KEY_PRO_DEPT` FOREIGN KEY (`dept_id`) REFERENCES `Department` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Compliance Tools','2017-01-01 05:30:00',NULL,1,1,'Built tools for fraud detection and prevention using analytics'),(2,'Wealth Management','2017-01-01 00:00:00',NULL,2,1,'Delivered automated order entry for many stock markets for an Order Management System in a leading investment bank'),(3,'NLU','2017-01-01 00:00:00',NULL,3,1,'Data Management (using tools like Redshift, Hana, Google Bigquery, Vertica, Greenplum, MongoDB (NoSQL), SQL Azure, Hadoop, Apache Spark)');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `EIMA`.`project_AFTER_INSERT` AFTER INSERT ON `project` FOR EACH ROW
BEGIN
	INSERT INTO History (field_changed, new_val) VALUES('New Project', NEW.title);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `eid` int(11) NOT NULL,
  `email_id` varchar(200) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `address_visible` int(11) DEFAULT '0',
  `dob_visible` int(11) DEFAULT '0',
  `gender_visible` int(11) DEFAULT '0',
  `phone_visible` int(11) DEFAULT '0',
  PRIMARY KEY (`eid`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`),
  KEY `KEY_USER_EMP_idx` (`eid`),
  CONSTRAINT `KEY_USER_EMP` FOREIGN KEY (`eid`) REFERENCES `Employee` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'john@wissen.com','john','2017-03-28 00:00:00',1,1,1,1),(2,'mark@wissen.com','mark','2017-05-22 00:00:00',1,1,1,1),(3,'harry@wissen.com','harry','2017-05-02 00:00:00',1,0,1,1),(4,'serina@wissen.com','serina','2017-04-08 00:00:00',0,0,1,1),(5,'miley@wissen.com','miley','2017-01-04 00:00:00',0,0,0,1),(6,'admin@wissen.com','admin','2017-07-28 14:42:23',1,1,1,1),(7,'james@wissen.com','james','2017-04-02 00:00:00',0,0,0,0),(8,'pavan@wissen.com','pavan','2017-07-28 00:49:27',0,0,0,0),(9,'somdev@wissen.com','somdev','2017-07-28 14:38:23',1,0,0,1),(10,'prashant@wissen.com','prashant','2017-04-02 00:00:00',0,0,0,0),(175,'bob.marley@wissen.com','Bob@Marley',NULL,0,0,0,0),(176,'shane@wissen.com','Shane@Long',NULL,0,0,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-30 11:03:40
