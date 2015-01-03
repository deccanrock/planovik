-- MySQL dump 10.13  Distrib 5.6.21, for Win64 (x86_64)
--
-- Host: localhost    Database: verifyed_01_001
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `vrf_db_replication`
--

DROP TABLE IF EXISTS `vrf_db_replication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrf_db_replication` (
  `masterid` int(11) NOT NULL,
  `slave1id` int(11) NOT NULL,
  `slave2id` int(11) NOT NULL,
  PRIMARY KEY (`masterid`),
  UNIQUE KEY `masterid_UNIQUE` (`masterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrf_db_replication`
--

LOCK TABLES `vrf_db_replication` WRITE;
/*!40000 ALTER TABLE `vrf_db_replication` DISABLE KEYS */;
INSERT INTO `vrf_db_replication` VALUES (1,2,3);
/*!40000 ALTER TABLE `vrf_db_replication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrf_org_0`
--

DROP TABLE IF EXISTS `vrf_org_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrf_org_0` (
  `orgid` varchar(15) NOT NULL,
  `name` varchar(120) NOT NULL,
  `shortname` varchar(10) DEFAULT NULL,
  `ip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `regcode` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `regcodeissuingauthority` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `isocountrycode` varchar(3) NOT NULL DEFAULT 'IN',
  `logosealloc` varchar(200) NOT NULL DEFAULT 'To be Generated',
  `addrstreet1` varchar(100) NOT NULL DEFAULT 'To be  Filled',
  `addrstreet2` varchar(100) DEFAULT 'NA',
  `addrcitytown` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `addrdistrict` varchar(60) DEFAULT 'NA',
  `addrstateprovrgn` varchar(80) NOT NULL DEFAULT 'To be Filled',
  `addrpostalcode` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `addrhomeurl` varchar(120) NOT NULL DEFAULT 'To be Filled',
  `contactname` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `contactphoneoffice` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactphonemobile` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactemail` varchar(100) NOT NULL DEFAULT 'To be Filled',
  `contactdesignation` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `contactip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `type` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `subtype` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `status` varchar(15) NOT NULL DEFAULT 'Pending',
  `vrfreqcnt` int(10) unsigned NOT NULL DEFAULT '0',
  `vrfproccnt` int(10) unsigned NOT NULL DEFAULT '0',
  `alrtpendingcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `msgsunrdcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `accntbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payoutbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tzoffset` smallint(6) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orgid`),
  UNIQUE KEY `idx_vrf_org0_name_unq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Base table to hold an Organization detailed information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrf_org_0`
--

LOCK TABLES `vrf_org_0` WRITE;
/*!40000 ALTER TABLE `vrf_org_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrf_org_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrf_org_1`
--

DROP TABLE IF EXISTS `vrf_org_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrf_org_1` (
  `orgid` varchar(15) NOT NULL,
  `name` varchar(120) NOT NULL,
  `shortname` varchar(10) DEFAULT NULL,
  `ip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `regcode` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `regcodeissuingauthority` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `isocountrycode` varchar(3) NOT NULL DEFAULT 'IN',
  `logosealloc` varchar(200) NOT NULL DEFAULT 'To be Generated',
  `addrstreet1` varchar(100) NOT NULL DEFAULT 'To be  Filled',
  `addrstreet2` varchar(100) DEFAULT 'NA',
  `addrcitytown` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `addrdistrict` varchar(60) DEFAULT 'NA',
  `addrstateprovrgn` varchar(80) NOT NULL DEFAULT 'To be Filled',
  `addrpostalcode` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `addrhomeurl` varchar(120) NOT NULL DEFAULT 'To be Filled',
  `contactname` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `contactphoneoffice` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactphonemobile` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactemail` varchar(100) NOT NULL DEFAULT 'To be Filled',
  `contactdesignation` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `contactip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `type` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `subtype` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `status` varchar(15) NOT NULL DEFAULT 'Pending',
  `vrfreqcnt` int(10) unsigned NOT NULL DEFAULT '0',
  `vrfproccnt` int(10) unsigned NOT NULL DEFAULT '0',
  `alrtpendingcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `msgsunrdcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `accntbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payoutbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tzoffset` smallint(6) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orgid`),
  UNIQUE KEY `idx_vrf_org1_name_unq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Base table to hold an Organization detailed information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrf_org_1`
--

LOCK TABLES `vrf_org_1` WRITE;
/*!40000 ALTER TABLE `vrf_org_1` DISABLE KEYS */;
INSERT INTO `vrf_org_1` VALUES ('01-001-00000001','M. S. Ramaiah Institute of Technology',NULL,'127.0.0.1','To be Filled','To be Filled','91','To be Generated','To be  Filled','NA','To be Filled','NA','To be Filled','To be Filled','To be Filled','Srinivas Paruchuri','0123456723','0123456723','sriniv@yahoo.com','CTO','127.0.0.1','To be Filled','To be Filled','Pending',0,0,0,0,0.00,0.00,-330,'2014-10-21 11:06:35','2014-10-21 11:06:35');
/*!40000 ALTER TABLE `vrf_org_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrf_org_2`
--

DROP TABLE IF EXISTS `vrf_org_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrf_org_2` (
  `orgid` varchar(15) NOT NULL,
  `name` varchar(120) NOT NULL,
  `shortname` varchar(10) DEFAULT NULL,
  `ip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `regcode` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `regcodeissuingauthority` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `isocountrycode` varchar(3) NOT NULL DEFAULT 'IN',
  `logosealloc` varchar(200) NOT NULL DEFAULT 'To be Generated',
  `addrstreet1` varchar(100) NOT NULL DEFAULT 'To be  Filled',
  `addrstreet2` varchar(100) DEFAULT 'NA',
  `addrcitytown` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `addrdistrict` varchar(60) DEFAULT 'NA',
  `addrstateprovrgn` varchar(80) NOT NULL DEFAULT 'To be Filled',
  `addrpostalcode` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `addrhomeurl` varchar(120) NOT NULL DEFAULT 'To be Filled',
  `contactname` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `contactphoneoffice` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactphonemobile` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactemail` varchar(100) NOT NULL DEFAULT 'To be Filled',
  `contactdesignation` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `contactip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `type` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `subtype` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `status` varchar(15) NOT NULL DEFAULT 'Pending',
  `vrfreqcnt` int(10) unsigned NOT NULL DEFAULT '0',
  `vrfproccnt` int(10) unsigned NOT NULL DEFAULT '0',
  `alrtpendingcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `msgsunrdcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `accntbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payoutbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tzoffset` smallint(6) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orgid`),
  UNIQUE KEY `idx_vrf_org2_name_unq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Base table to hold an Organization detailed information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrf_org_2`
--

LOCK TABLES `vrf_org_2` WRITE;
/*!40000 ALTER TABLE `vrf_org_2` DISABLE KEYS */;
INSERT INTO `vrf_org_2` VALUES ('01-001-00000002','AB Volvo',NULL,'127.0.0.1','To be Filled','To be Filled','91','To be Generated','To be  Filled','NA','To be Filled','NA','To be Filled','To be Filled','To be Filled','Srinivas Paruchuri','0123456723','0123456723','sriniv@yahoo.com','CTO','127.0.0.1','To be Filled','To be Filled','Pending',0,0,0,0,0.00,0.00,-330,'2014-10-21 12:28:43','2014-10-21 12:28:43');
/*!40000 ALTER TABLE `vrf_org_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrf_org_3`
--

DROP TABLE IF EXISTS `vrf_org_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrf_org_3` (
  `orgid` varchar(15) NOT NULL,
  `name` varchar(120) NOT NULL,
  `shortname` varchar(10) DEFAULT NULL,
  `ip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `regcode` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `regcodeissuingauthority` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `isocountrycode` varchar(3) NOT NULL DEFAULT 'IN',
  `logosealloc` varchar(200) NOT NULL DEFAULT 'To be Generated',
  `addrstreet1` varchar(100) NOT NULL DEFAULT 'To be  Filled',
  `addrstreet2` varchar(100) DEFAULT 'NA',
  `addrcitytown` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `addrdistrict` varchar(60) DEFAULT 'NA',
  `addrstateprovrgn` varchar(80) NOT NULL DEFAULT 'To be Filled',
  `addrpostalcode` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `addrhomeurl` varchar(120) NOT NULL DEFAULT 'To be Filled',
  `contactname` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `contactphoneoffice` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactphonemobile` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactemail` varchar(100) NOT NULL DEFAULT 'To be Filled',
  `contactdesignation` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `contactip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `type` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `subtype` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `status` varchar(15) NOT NULL DEFAULT 'Pending',
  `vrfreqcnt` int(10) unsigned NOT NULL DEFAULT '0',
  `vrfproccnt` int(10) unsigned NOT NULL DEFAULT '0',
  `alrtpendingcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `msgsunrdcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `accntbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payoutbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tzoffset` smallint(6) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orgid`),
  UNIQUE KEY `idx_vrf_org3_name_unq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Base table to hold an Organization detailed information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrf_org_3`
--

LOCK TABLES `vrf_org_3` WRITE;
/*!40000 ALTER TABLE `vrf_org_3` DISABLE KEYS */;
INSERT INTO `vrf_org_3` VALUES ('01-001-00000003','B.M.S. Institute of Technology',NULL,'127.0.0.1','To be Filled','To be Filled','91','To be Generated','To be  Filled','NA','To be Filled','NA','To be Filled','To be Filled','To be Filled','Rakhee Paruchuri','0123456787','0123456787','rakheekumar@gmail.com','Asst Professor','127.0.0.1','To be Filled','To be Filled','Pending',0,0,0,0,0.00,0.00,-330,'2014-10-21 12:59:28','2014-10-21 12:59:28');
/*!40000 ALTER TABLE `vrf_org_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrf_org_4`
--

DROP TABLE IF EXISTS `vrf_org_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrf_org_4` (
  `orgid` varchar(15) NOT NULL,
  `name` varchar(120) NOT NULL,
  `shortname` varchar(10) DEFAULT NULL,
  `ip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `regcode` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `regcodeissuingauthority` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `isocountrycode` varchar(3) NOT NULL DEFAULT 'IN',
  `logosealloc` varchar(200) NOT NULL DEFAULT 'To be Generated',
  `addrstreet1` varchar(100) NOT NULL DEFAULT 'To be  Filled',
  `addrstreet2` varchar(100) DEFAULT 'NA',
  `addrcitytown` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `addrdistrict` varchar(60) DEFAULT 'NA',
  `addrstateprovrgn` varchar(80) NOT NULL DEFAULT 'To be Filled',
  `addrpostalcode` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `addrhomeurl` varchar(120) NOT NULL DEFAULT 'To be Filled',
  `contactname` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `contactphoneoffice` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactphonemobile` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactemail` varchar(100) NOT NULL DEFAULT 'To be Filled',
  `contactdesignation` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `contactip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `type` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `subtype` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `status` varchar(15) NOT NULL DEFAULT 'Pending',
  `vrfreqcnt` int(10) unsigned NOT NULL DEFAULT '0',
  `vrfproccnt` int(10) unsigned NOT NULL DEFAULT '0',
  `alrtpendingcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `msgsunrdcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `accntbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payoutbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tzoffset` smallint(6) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orgid`),
  UNIQUE KEY `idx_vrf_org4_name_unq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Base table to hold an Organization detailed information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrf_org_4`
--

LOCK TABLES `vrf_org_4` WRITE;
/*!40000 ALTER TABLE `vrf_org_4` DISABLE KEYS */;
INSERT INTO `vrf_org_4` VALUES ('01-001-00000004','Rabindranath Tagore Medical College',NULL,'127.0.0.1','To be Filled','To be Filled','91','To be Generated','To be  Filled','NA','To be Filled','NA','To be Filled','To be Filled','To be Filled','Rakhee Paruchuri','0123456787','0123456787','rakheekumar@gmail.com','Asst Professor','127.0.0.1','To be Filled','To be Filled','Pending',0,0,0,0,0.00,0.00,-330,'2014-10-21 13:04:19','2014-10-21 13:04:19');
/*!40000 ALTER TABLE `vrf_org_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrf_org_5`
--

DROP TABLE IF EXISTS `vrf_org_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrf_org_5` (
  `orgid` varchar(15) NOT NULL,
  `name` varchar(120) NOT NULL,
  `shortname` varchar(10) DEFAULT NULL,
  `ip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `regcode` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `regcodeissuingauthority` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `isocountrycode` varchar(3) NOT NULL DEFAULT 'IN',
  `logosealloc` varchar(200) NOT NULL DEFAULT 'To be Generated',
  `addrstreet1` varchar(100) NOT NULL DEFAULT 'To be  Filled',
  `addrstreet2` varchar(100) DEFAULT 'NA',
  `addrcitytown` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `addrdistrict` varchar(60) DEFAULT 'NA',
  `addrstateprovrgn` varchar(80) NOT NULL DEFAULT 'To be Filled',
  `addrpostalcode` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `addrhomeurl` varchar(120) NOT NULL DEFAULT 'To be Filled',
  `contactname` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `contactphoneoffice` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactphonemobile` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactemail` varchar(100) NOT NULL DEFAULT 'To be Filled',
  `contactdesignation` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `contactip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `type` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `subtype` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `status` varchar(15) NOT NULL DEFAULT 'Pending',
  `vrfreqcnt` int(10) unsigned NOT NULL DEFAULT '0',
  `vrfproccnt` int(10) unsigned NOT NULL DEFAULT '0',
  `alrtpendingcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `msgsunrdcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `accntbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payoutbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tzoffset` smallint(6) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orgid`),
  UNIQUE KEY `idx_vrf_org5_name_unq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Base table to hold an Organization detailed information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrf_org_5`
--

LOCK TABLES `vrf_org_5` WRITE;
/*!40000 ALTER TABLE `vrf_org_5` DISABLE KEYS */;
INSERT INTO `vrf_org_5` VALUES ('01-001-00000005','Nims',NULL,'127.0.0.1','To be Filled','To be Filled','91','To be Generated','To be  Filled','NA','To be Filled','NA','To be Filled','To be Filled','To be Filled','Rakhee Paruchuri','0123456787','0123456787','rakheekumar@gmail.com','Asst Professor','127.0.0.1','To be Filled','To be Filled','Pending',0,0,0,0,0.00,0.00,-330,'2014-10-21 13:09:17','2014-10-21 13:09:17');
/*!40000 ALTER TABLE `vrf_org_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrf_org_6`
--

DROP TABLE IF EXISTS `vrf_org_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrf_org_6` (
  `orgid` varchar(15) NOT NULL,
  `name` varchar(120) NOT NULL,
  `shortname` varchar(10) DEFAULT NULL,
  `ip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `regcode` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `regcodeissuingauthority` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `isocountrycode` varchar(3) NOT NULL DEFAULT 'IN',
  `logosealloc` varchar(200) NOT NULL DEFAULT 'To be Generated',
  `addrstreet1` varchar(100) NOT NULL DEFAULT 'To be  Filled',
  `addrstreet2` varchar(100) DEFAULT 'NA',
  `addrcitytown` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `addrdistrict` varchar(60) DEFAULT 'NA',
  `addrstateprovrgn` varchar(80) NOT NULL DEFAULT 'To be Filled',
  `addrpostalcode` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `addrhomeurl` varchar(120) NOT NULL DEFAULT 'To be Filled',
  `contactname` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `contactphoneoffice` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactphonemobile` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactemail` varchar(100) NOT NULL DEFAULT 'To be Filled',
  `contactdesignation` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `contactip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `type` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `subtype` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `status` varchar(15) NOT NULL DEFAULT 'Pending',
  `vrfreqcnt` int(10) unsigned NOT NULL DEFAULT '0',
  `vrfproccnt` int(10) unsigned NOT NULL DEFAULT '0',
  `alrtpendingcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `msgsunrdcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `accntbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payoutbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tzoffset` smallint(6) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orgid`),
  UNIQUE KEY `idx_vrf_org6_name_unq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Base table to hold an Organization detailed information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrf_org_6`
--

LOCK TABLES `vrf_org_6` WRITE;
/*!40000 ALTER TABLE `vrf_org_6` DISABLE KEYS */;
INSERT INTO `vrf_org_6` VALUES ('01-001-00000006','All India Institute of Medical Sciences',NULL,'127.0.0.1','To be Filled','To be Filled','91','To be Generated','To be  Filled','NA','To be Filled','NA','To be Filled','To be Filled','To be Filled','Rakhee Paruchuri','0123456787','0123456787','rakheekumar@gmail.com','Asst Professor','127.0.0.1','To be Filled','To be Filled','Pending',0,0,0,0,0.00,0.00,-330,'2014-10-21 13:41:38','2014-10-21 13:41:38');
/*!40000 ALTER TABLE `vrf_org_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrf_org_7`
--

DROP TABLE IF EXISTS `vrf_org_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrf_org_7` (
  `orgid` varchar(15) NOT NULL,
  `name` varchar(120) NOT NULL,
  `shortname` varchar(10) DEFAULT NULL,
  `ip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `regcode` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `regcodeissuingauthority` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `isocountrycode` varchar(3) NOT NULL DEFAULT 'IN',
  `logosealloc` varchar(200) NOT NULL DEFAULT 'To be Generated',
  `addrstreet1` varchar(100) NOT NULL DEFAULT 'To be  Filled',
  `addrstreet2` varchar(100) DEFAULT 'NA',
  `addrcitytown` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `addrdistrict` varchar(60) DEFAULT 'NA',
  `addrstateprovrgn` varchar(80) NOT NULL DEFAULT 'To be Filled',
  `addrpostalcode` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `addrhomeurl` varchar(120) NOT NULL DEFAULT 'To be Filled',
  `contactname` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `contactphoneoffice` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactphonemobile` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactemail` varchar(100) NOT NULL DEFAULT 'To be Filled',
  `contactdesignation` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `contactip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `type` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `subtype` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `status` varchar(15) NOT NULL DEFAULT 'Pending',
  `vrfreqcnt` int(10) unsigned NOT NULL DEFAULT '0',
  `vrfproccnt` int(10) unsigned NOT NULL DEFAULT '0',
  `alrtpendingcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `msgsunrdcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `accntbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payoutbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tzoffset` smallint(6) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orgid`),
  UNIQUE KEY `idx_vrf_org7_name_unq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Base table to hold an Organization detailed information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrf_org_7`
--

LOCK TABLES `vrf_org_7` WRITE;
/*!40000 ALTER TABLE `vrf_org_7` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrf_org_7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrf_org_8`
--

DROP TABLE IF EXISTS `vrf_org_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrf_org_8` (
  `orgid` varchar(15) NOT NULL,
  `name` varchar(120) NOT NULL,
  `shortname` varchar(10) DEFAULT NULL,
  `ip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `regcode` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `regcodeissuingauthority` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `isocountrycode` varchar(3) NOT NULL DEFAULT 'IN',
  `logosealloc` varchar(200) NOT NULL DEFAULT 'To be Generated',
  `addrstreet1` varchar(100) NOT NULL DEFAULT 'To be  Filled',
  `addrstreet2` varchar(100) DEFAULT 'NA',
  `addrcitytown` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `addrdistrict` varchar(60) DEFAULT 'NA',
  `addrstateprovrgn` varchar(80) NOT NULL DEFAULT 'To be Filled',
  `addrpostalcode` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `addrhomeurl` varchar(120) NOT NULL DEFAULT 'To be Filled',
  `contactname` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `contactphoneoffice` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactphonemobile` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactemail` varchar(100) NOT NULL DEFAULT 'To be Filled',
  `contactdesignation` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `contactip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `type` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `subtype` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `status` varchar(15) NOT NULL DEFAULT 'Pending',
  `vrfreqcnt` int(10) unsigned NOT NULL DEFAULT '0',
  `vrfproccnt` int(10) unsigned NOT NULL DEFAULT '0',
  `alrtpendingcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `msgsunrdcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `accntbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payoutbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tzoffset` smallint(6) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orgid`),
  UNIQUE KEY `idx_vrf_org8_name_unq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Base table to hold an Organization detailed information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrf_org_8`
--

LOCK TABLES `vrf_org_8` WRITE;
/*!40000 ALTER TABLE `vrf_org_8` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrf_org_8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrf_org_9`
--

DROP TABLE IF EXISTS `vrf_org_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrf_org_9` (
  `orgid` varchar(15) NOT NULL,
  `name` varchar(120) NOT NULL,
  `shortname` varchar(10) DEFAULT NULL,
  `ip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `regcode` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `regcodeissuingauthority` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `isocountrycode` varchar(3) NOT NULL DEFAULT 'IN',
  `logosealloc` varchar(200) NOT NULL DEFAULT 'To be Generated',
  `addrstreet1` varchar(100) NOT NULL DEFAULT 'To be  Filled',
  `addrstreet2` varchar(100) DEFAULT 'NA',
  `addrcitytown` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `addrdistrict` varchar(60) DEFAULT 'NA',
  `addrstateprovrgn` varchar(80) NOT NULL DEFAULT 'To be Filled',
  `addrpostalcode` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `addrhomeurl` varchar(120) NOT NULL DEFAULT 'To be Filled',
  `contactname` varchar(60) NOT NULL DEFAULT 'To be Filled',
  `contactphoneoffice` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactphonemobile` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `contactemail` varchar(100) NOT NULL DEFAULT 'To be Filled',
  `contactdesignation` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `contactip` varchar(45) NOT NULL DEFAULT '127.0.0.1',
  `type` varchar(20) NOT NULL DEFAULT 'To be Filled',
  `subtype` varchar(45) NOT NULL DEFAULT 'To be Filled',
  `status` varchar(15) NOT NULL DEFAULT 'Pending',
  `vrfreqcnt` int(10) unsigned NOT NULL DEFAULT '0',
  `vrfproccnt` int(10) unsigned NOT NULL DEFAULT '0',
  `alrtpendingcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `msgsunrdcnt` int(5) unsigned NOT NULL DEFAULT '0',
  `accntbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payoutbal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tzoffset` smallint(6) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orgid`),
  UNIQUE KEY `idx_vrf_org9_name_unq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Base table to hold an Organization detailed information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrf_org_9`
--

LOCK TABLES `vrf_org_9` WRITE;
/*!40000 ALTER TABLE `vrf_org_9` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrf_org_9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrf_org_seq`
--

DROP TABLE IF EXISTS `vrf_org_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrf_org_seq` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orgid` varchar(15) NOT NULL,
  `name` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fk_orgid` (`orgid`),
  KEY `idx_fk_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Id sequence generator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrf_org_seq`
--

LOCK TABLES `vrf_org_seq` WRITE;
/*!40000 ALTER TABLE `vrf_org_seq` DISABLE KEYS */;
INSERT INTO `vrf_org_seq` VALUES (1,'01-001-00000001','M. S. Ramaiah Institute of Technology'),(2,'01-001-00000002','AB Volvo'),(3,'01-001-00000003','B.M.S. Institute of Technology'),(4,'01-001-00000004','Rabindranath Tagore Medical College'),(5,'01-001-00000005','Nims'),(6,'01-001-00000006','All India Institute of Medical Sciences');
/*!40000 ALTER TABLE `vrf_org_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrf_zone_db_map`
--

DROP TABLE IF EXISTS `vrf_zone_db_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrf_zone_db_map` (
  `zoneid` int(11) NOT NULL DEFAULT '1',
  `dbid` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zoneid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrf_zone_db_map`
--

LOCK TABLES `vrf_zone_db_map` WRITE;
/*!40000 ALTER TABLE `vrf_zone_db_map` DISABLE KEYS */;
INSERT INTO `vrf_zone_db_map` VALUES (1,1);
/*!40000 ALTER TABLE `vrf_zone_db_map` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-21 20:11:44
