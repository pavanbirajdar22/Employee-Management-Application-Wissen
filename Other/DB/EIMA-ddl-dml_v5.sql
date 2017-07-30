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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,0,'C101','IGate','Bangalore','Karnataka','India',600045,1),(2,1,'A309','Highway Town','Bangalore','Karnataka','India',600056,2),(3,1,'D804','Marthalli','Bangalore','Karnataka','India',600124,3),(4,0,'A302','Lower Parel','Mumbai','Maharashtra','India',400034,4),(5,0,'T501','Dadar','Mumbai','Maharashtra','India',400032,5),(6,0,'line1','line2',NULL,NULL,'India',0,170),(7,0,'line1','line2',NULL,NULL,'India',0,171),(8,0,'line1','line2',NULL,NULL,'India',0,172);
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
INSERT INTO `client` VALUES (1,'Morgan Stanley','Mumbai',NULL,NULL),(2,'Credit Suisse','Pune',NULL,NULL),(3,'J.P.Morgan','Mumbai',NULL,NULL),(5,'Apple','California',NULL,NULL),(6,'MS','Bangalore',NULL,NULL);
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
INSERT INTO `department` VALUES (1,'Banking & Finance ',NULL),(2,'Telecom',NULL),(3,'Telecom',NULL),(4,'DEPTX',NULL),(5,'HR',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'John','A','Watson','CEO',0,3000000,'1234567890',NULL,1,NULL,'2000-02-11 00:00:00',NULL),(2,'kjdhb','Kumar','jhbds','Trainee Analyst',1,12340,'987654321',NULL,NULL,1,'2017-07-26 19:58:41',NULL),(3,'Harry','D','Wilson','Employee',0,800000,'6789054321',NULL,1,2,'2002-03-24 00:00:00',NULL),(4,'Serina','P','Walker','Manger',1,2200000,'1234509876',NULL,2,1,'2001-01-22 00:00:00',NULL),(5,'Miley','T','Henry','Employee',1,1000000,'8907653214',NULL,2,4,'2009-04-08 00:00:00',NULL),(6,'Adam','P','Zuck','Administrator',0,765232,'9876567897',NULL,1,2,'2009-02-23 00:00:00',NULL),(7,'Prashant','','Babel','Trainee Analyst',0,10000,'9008697001',NULL,NULL,NULL,'2017-06-01 05:30:00',NULL),(8,'Pavan','','Birajdar','Trainee Analyst',0,10000,'123456789',NULL,NULL,NULL,'2017-07-01 05:30:00',NULL),(9,'zdsa','ADSAZ','sd','',0,0,'',NULL,NULL,NULL,NULL,NULL),(10,'zdsa','ADSAZ','sd','',0,0,'',NULL,NULL,NULL,NULL,NULL),(11,'zdsa','ADSAZ','sd','',0,0,'',NULL,NULL,NULL,NULL,NULL),(12,'kjdhb','Kumar','jhbds','Trainee Analyst',1,12340,'987654321',NULL,NULL,NULL,NULL,NULL),(13,'Somdev',NULL,'Mehta','Trainee Analyst',0,10000,'123456',NULL,NULL,NULL,'2017-01-01 05:30:00',NULL),(14,'Prashant','','Babel','Trainee Analyst',0,12349,'123456',NULL,NULL,NULL,'2017-07-01 05:30:00','2017-07-08 05:30:00'),(15,'okijhb','koijhug','dsafsa','Trainee',0,9876,NULL,NULL,NULL,NULL,NULL,NULL),(123,'kjdhb','Kumar','jhbds','Trainee Analyst',1,12340,'987654321',NULL,NULL,NULL,NULL,NULL),(124,'Test','Kumar','Singh','Trainee Analyst',1,12340,'987654321',NULL,NULL,NULL,NULL,NULL),(125,'Test','Kumar','Singh','Trainee Analyst',1,12340,'987654321',NULL,NULL,NULL,NULL,NULL),(126,'Test','Kumar','Singh','Trainee Analyst',1,12340,'987654321',NULL,NULL,NULL,NULL,NULL),(127,'Test','Kumar','Singh','Trainee Analyst',1,12340,'987654321',NULL,2,NULL,NULL,NULL),(128,'Test2','Kumar','Singh','Trainee Analyst',1,12340,'987654321',NULL,2,NULL,NULL,NULL),(129,'Test2','Kumar','Singh','Trainee Analyst',1,12340,'987654321',NULL,NULL,NULL,NULL,NULL),(130,'eee','ee','ee','ee',1,111,'1111','2017-07-15 05:30:00',2,NULL,'2017-07-15 05:30:00','2017-07-21 05:30:00'),(131,'Test2345','Kumar','Singh','Trainee Analyst',1,12340,'987654321',NULL,NULL,NULL,NULL,NULL),(133,'Test2345','Kumar','Singh','Trainee Analyst',1,12340,'987654321',NULL,3,NULL,NULL,NULL),(134,'Test2345','Kumar','Singh','Trainee Analyst',1,12340,'987654321',NULL,3,NULL,NULL,NULL),(135,'Test2345','Kumar','Singh','Trainee Analyst',1,12340,'987654321',NULL,3,NULL,NULL,NULL),(136,'Test2345','Kumar','Singh','Trainee Analyst',1,12340,'987654321',NULL,3,NULL,NULL,NULL),(137,'Test2345','Kumar','Singh','Trainee Analyst',1,12340,'987654321',NULL,3,NULL,NULL,NULL),(138,'A',NULL,'B',NULL,0,19876,NULL,NULL,NULL,NULL,NULL,NULL),(139,'A',NULL,'B',NULL,0,19876,NULL,NULL,NULL,NULL,NULL,NULL),(140,'Prashant','','Babel','assd',0,12345,'asfd','2014-01-27 05:30:00',3,NULL,'2017-07-14 05:30:00','2017-07-14 05:30:00'),(141,'A',NULL,'B',NULL,0,19876,NULL,NULL,NULL,NULL,NULL,NULL),(142,'A',NULL,'B',NULL,0,19876,NULL,NULL,NULL,NULL,NULL,NULL),(143,'A',NULL,'B',NULL,0,19876,NULL,NULL,NULL,NULL,NULL,NULL),(144,'A',NULL,'B',NULL,0,19876,NULL,NULL,NULL,NULL,NULL,NULL),(145,'A',NULL,'B',NULL,0,19876,NULL,NULL,NULL,NULL,NULL,NULL),(146,'A',NULL,'B',NULL,0,19876,NULL,NULL,NULL,NULL,NULL,NULL),(147,'A',NULL,'B',NULL,0,19876,NULL,NULL,NULL,NULL,NULL,NULL),(148,'A',NULL,'B',NULL,0,19876,NULL,NULL,NULL,NULL,NULL,NULL),(149,'A',NULL,'B',NULL,0,19876,NULL,NULL,NULL,NULL,NULL,NULL),(150,'A',NULL,'B',NULL,0,19876,NULL,NULL,NULL,NULL,NULL,NULL),(151,'A','fd','B',NULL,0,19876,NULL,'0002-02-22 05:30:00',NULL,NULL,NULL,NULL),(152,'A','qq','B',NULL,0,19876,NULL,'0002-02-22 05:30:00',NULL,NULL,NULL,NULL),(153,'qwe','qwe','qwe',NULL,0,123,NULL,'0222-02-22 05:30:00',NULL,NULL,NULL,NULL),(154,'sd','','sdf',NULL,0,234,NULL,NULL,NULL,NULL,NULL,NULL),(155,'jids',NULL,'dsds',NULL,0,87654,NULL,NULL,NULL,NULL,NULL,NULL),(156,'jids',NULL,'dsds',NULL,0,87654,NULL,NULL,NULL,NULL,NULL,NULL),(159,'jids',NULL,'dsds',NULL,0,87654,NULL,NULL,1,NULL,'2000-05-22 05:30:00','2000-05-22 05:30:00'),(160,'jids',NULL,'dsds',NULL,0,87654,NULL,NULL,1,NULL,'2000-05-22 05:30:00','2000-05-22 05:30:00'),(161,'jids',NULL,'dsds',NULL,0,87654,NULL,NULL,1,NULL,'2000-05-22 05:30:00','2000-05-22 05:30:00'),(162,'jids',NULL,'dsds',NULL,0,87654,NULL,NULL,1,NULL,'2000-05-22 05:30:00','2000-05-22 05:30:00'),(163,'jids',NULL,'dsds',NULL,0,87654,NULL,NULL,1,NULL,'2000-05-22 05:30:00','2000-05-22 05:30:00'),(165,'jids',NULL,'dsds',NULL,0,87654,NULL,NULL,1,NULL,'2000-05-22 05:30:00','2000-05-22 05:30:00'),(166,'jids',NULL,'dsds',NULL,0,87654,NULL,NULL,1,NULL,'2000-05-22 05:30:00','2000-05-22 05:30:00'),(167,'ijuhg',NULL,'kmnjbh',NULL,0,87654,NULL,NULL,1,NULL,'2000-05-22 05:30:00','2000-05-22 05:30:00'),(168,'ijuhg',NULL,'kmnjbh',NULL,0,87654,NULL,NULL,1,NULL,'2000-05-22 05:30:00','2000-05-22 05:30:00'),(169,'ijuhg',NULL,'kmnjbh',NULL,0,87654,NULL,NULL,1,NULL,'2000-05-22 05:30:00','2000-05-22 05:30:00'),(170,'ijuhg',NULL,'kmnjbh',NULL,0,87654,NULL,NULL,1,NULL,'2000-05-22 05:30:00','2000-05-22 05:30:00'),(171,'ijuhg',NULL,'kmnjbh',NULL,0,87654,NULL,NULL,1,NULL,'2000-05-22 05:30:00','2000-05-22 05:30:00'),(172,'ijuhg',NULL,'kmnjbh',NULL,0,87654,NULL,NULL,1,NULL,'2000-05-22 05:30:00','2000-05-22 05:30:00');
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
  `start_date` datetime DEFAULT NULL,
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
INSERT INTO `employee_client` VALUES (1,3,'2017-05-23 00:00:00',NULL,NULL),(1,166,NULL,NULL,NULL),(1,168,NULL,NULL,NULL),(1,169,NULL,NULL,NULL),(1,170,NULL,NULL,NULL),(1,171,NULL,NULL,NULL),(1,172,NULL,NULL,NULL),(2,5,'2017-01-01 00:00:00',NULL,NULL);
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
-- Dumping data for table `employee_project`
--

LOCK TABLES `employee_project` WRITE;
/*!40000 ALTER TABLE `employee_project` DISABLE KEYS */;
INSERT INTO `employee_project` VALUES (3,1,'2017-05-23 00:00:00',NULL,'Consultant'),(4,1,'2017-05-23 00:00:00',NULL,'Manager'),(5,2,'2017-01-01 00:00:00',NULL,'Consultant'),(166,1,NULL,NULL,NULL),(168,1,NULL,NULL,NULL),(169,1,NULL,NULL,NULL),(170,1,NULL,NULL,NULL),(171,1,NULL,NULL,NULL),(172,1,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (7,'2017-07-18 17:07:21','salary','9876523','765232',6),(8,'2017-07-18 17:07:21','phone_number','0987654212','9876567897',6),(9,'2017-07-18 17:07:21','dept_id','2','1',6),(10,'2017-07-18 17:07:21','mgr_eid','4','2',6),(11,'2017-07-18 17:07:21','joining_date','2009-02-22 00:00:00','2009-02-23 00:00:00',6),(12,'2017-07-26 11:27:08','middle_name','ADSAZ','oiuhgv',12),(13,'2017-07-26 13:10:54','last_name','sd','jhbds',12),(14,'2017-07-26 13:11:14','first_name','0','0',12),(15,'2017-07-26 13:11:14','gender','0','1',12),(16,'2017-07-26 15:33:27','middle_name','oiuhgv','Kumar',12),(17,'2017-07-26 15:33:27','designation','','Trainee Analyst',12),(18,'2017-07-26 15:33:27','salary','0','12340',12),(19,'2017-07-26 15:33:27','phone_number','','987654321',12),(20,'2017-07-26 19:58:41','first_name','2000000','12340',2),(21,'2017-07-26 19:58:41','last_name','Potter','jhbds',2),(22,'2017-07-26 19:58:41','middle_name','B','Kumar',2),(23,'2017-07-26 19:58:41','designation','Manager','Trainee Analyst',2),(24,'2017-07-26 19:58:41','gender','0','1',2),(25,'2017-07-26 19:58:41','salary','2000000','12340',2),(26,'2017-07-26 19:58:41','phone_number','0987654321','987654321',2),(27,'2017-07-26 20:18:27','first_name','12340','12340',2),(28,'2017-07-26 20:22:59','first_name','12340','12340',2),(29,'2017-07-27 10:46:19','New Employee',NULL,'okijhbdsafsa',NULL),(30,'2017-07-27 11:53:03','New Employee',NULL,'Test Kumar Singh',NULL),(31,'2017-07-27 11:55:24','New Employee',NULL,'Test Kumar Singh',NULL),(32,'2017-07-27 12:04:04','New Employee',NULL,'Test Kumar Singh',NULL),(33,'2017-07-27 12:08:43','New Employee',NULL,'Test Kumar Singh',NULL),(34,'2017-07-27 12:26:06','New Employee',NULL,'Test2 Kumar Singh',NULL),(35,'2017-07-27 12:26:51','New Employee',NULL,'Test2 Kumar Singh',NULL),(36,'2017-07-27 12:28:19','New Employee',NULL,'eee ee ee',NULL),(37,'2017-07-27 12:35:22','New Employee',NULL,'Test2345 Kumar Singh',NULL),(39,'2017-07-27 12:42:14','New Employee',NULL,'Test2345 Kumar Singh',NULL),(40,'2017-07-27 12:42:38','New Employee',NULL,'Test2345 Kumar Singh',NULL),(41,'2017-07-27 12:43:15','New Employee',NULL,'Test2345 Kumar Singh',NULL),(42,'2017-07-27 12:44:04','New Employee',NULL,'Test2345 Kumar Singh',NULL),(43,'2017-07-27 12:45:28','New Employee',NULL,'Test2345 Kumar Singh',NULL),(44,'2017-07-27 13:08:03','New Employee',NULL,'A B',NULL),(45,'2017-07-27 13:14:17','New Employee',NULL,'A B',NULL),(46,'2017-07-27 13:35:31','New Employee',NULL,'Prashant  Babel',NULL),(47,'2017-07-27 15:13:48','New Employee',NULL,'A B',NULL),(48,'2017-07-27 15:17:48','New Employee',NULL,'A B',NULL),(49,'2017-07-27 15:17:54','New Employee',NULL,'A B',NULL),(50,'2017-07-27 15:17:56','New Employee',NULL,'A B',NULL),(51,'2017-07-27 15:17:58','New Employee',NULL,'A B',NULL),(52,'2017-07-27 15:22:37','New Employee',NULL,'A B',NULL),(53,'2017-07-27 15:23:49','New Employee',NULL,'A B',NULL),(54,'2017-07-27 15:25:27','New Employee',NULL,'A B',NULL),(55,'2017-07-27 15:26:56','New Employee',NULL,'A B',NULL),(56,'2017-07-27 15:29:06','New Employee',NULL,'A B',NULL),(57,'2017-07-27 15:41:04','New Employee',NULL,'A fd B',NULL),(58,'2017-07-27 15:43:40','New Employee',NULL,'A qq B',NULL),(59,'2017-07-27 15:57:31','New Employee',NULL,'qwe qwe qwe',NULL),(60,'2017-07-27 16:03:40','New Employee',NULL,'sd  sdf',NULL),(61,'2017-07-27 16:10:49','New Employee',NULL,'jids dsds',NULL),(62,'2017-07-27 16:12:19','New Employee',NULL,'jids dsds',NULL),(65,'2017-07-27 17:53:07','New Employee',NULL,'jids dsds',NULL),(66,'2017-07-27 18:20:22','New Employee',NULL,'jids dsds',NULL),(67,'2017-07-27 18:21:50','New Employee',NULL,'jids dsds',NULL),(68,'2017-07-27 18:22:55','New Employee',NULL,'jids dsds',NULL),(69,'2017-07-27 18:28:36','New Employee',NULL,'jids dsds',NULL),(71,'2017-07-27 18:30:00','New Employee',NULL,'jids dsds',NULL),(72,'2017-07-27 18:30:59','New Employee',NULL,'jids dsds',NULL),(73,'2017-07-27 18:32:09','New Employee',NULL,'ijuhg kmnjbh',NULL),(74,'2017-07-27 20:16:55','New Employee',NULL,'ijuhg kmnjbh',NULL),(75,'2017-07-27 20:17:40','New Employee',NULL,'ijuhg kmnjbh',NULL),(76,'2017-07-27 20:19:13','New Employee',NULL,'ijuhg kmnjbh',NULL),(77,'2017-07-27 20:36:51','New Employee',NULL,'ijuhg kmnjbh',NULL),(78,'2017-07-27 20:37:18','New Employee',NULL,'ijuhg kmnjbh',NULL);
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
  `generate_report` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  CONSTRAINT `KEY_PER_USER` FOREIGN KEY (`eid`) REFERENCES `User` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,0,0,0,0,0,0,0,0,0,0,0),(2,1,0,0,0,0,0,0,0,0,0,0),(3,1,0,0,0,0,0,0,0,1,0,0),(4,0,0,0,0,0,0,0,0,0,0,0),(5,0,0,0,0,0,0,0,0,0,0,0),(6,1,1,1,1,1,1,1,1,1,1,1);
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
INSERT INTO `project` VALUES (1,'Compliance Tools','2017-05-22 00:00:00',NULL,1,1,NULL),(2,'Wealth Management','2017-01-01 00:00:00',NULL,2,1,NULL),(3,'Portfolio Attribution','2017-01-01 05:30:00','2017-03-01 05:30:00',NULL,NULL,NULL),(4,'Portfolio Attribution','2017-07-01 05:30:00','2017-07-20 05:30:00',NULL,NULL,NULL),(5,'Portfolio Attribution','2017-01-01 05:30:00','2017-04-28 05:30:00',NULL,NULL,NULL),(6,'Portfolio Attribution','2017-01-01 05:30:00','2017-04-28 05:30:00',NULL,NULL,NULL),(7,'Portfolio Attribution','2017-07-01 05:30:00','2017-07-20 05:30:00',NULL,NULL,NULL),(8,'Portfolio Attribution','2017-07-01 05:30:00','2017-07-20 05:30:00',NULL,NULL,NULL),(9,'Portfolio Attribution','2017-07-01 05:30:00','2017-07-20 05:30:00',1,1,NULL),(10,'Portfolio Attribution','2017-07-01 05:30:00','2017-07-20 05:30:00',NULL,NULL,NULL),(11,'Employee Management','2017-07-01 05:30:00','2017-07-08 05:30:00',5,1,NULL);
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
  `email_id` varchar(20) DEFAULT NULL,
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
INSERT INTO `user` VALUES (1,'john@wissen.com','watson','2017-03-28 00:00:00',1,1,1,1),(2,'peter@wissen.com','potter','2017-05-22 00:00:00',1,1,1,1),(3,'harry@wissen.com','wilson','2017-05-02 00:00:00',1,0,1,1),(4,'serina@wissen.com','walker','2017-04-08 00:00:00',0,0,1,1),(5,'miley@wissen.com','henry','2017-01-04 00:00:00',0,0,0,1),(6,'admin@wissen.com','admin','2017-04-02 00:00:00',1,1,1,1),(170,'pavan@wis.com','gvbdscs',NULL,0,0,0,0),(172,'som@wis.com','ijuhg@kmnjbh',NULL,0,0,0,0);
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

-- Dump completed on 2017-07-27 23:32:14
