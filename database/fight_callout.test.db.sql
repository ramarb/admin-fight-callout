-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: fight_callout
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
-- Table structure for table `callouts`
--

DROP TABLE IF EXISTS `callouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fighter_a` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fighter_b` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `match_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details_date` date DEFAULT NULL,
  `details_time` time DEFAULT NULL,
  `details_venue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_comments` smallint(6) NOT NULL,
  `total_views` smallint(6) NOT NULL,
  `total_votes` smallint(6) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `latitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `broadcast_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ticket_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `callouts_user_id_foreign` (`user_id`),
  KEY `callouts_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callouts`
--

LOCK TABLES `callouts` WRITE;
/*!40000 ALTER TABLE `callouts` DISABLE KEYS */;
INSERT INTO `callouts` VALUES (42,29,1,NULL,'Test ','Test ','6 October ','83','84','Fight','2016-11-06','00:00:00','',0,0,0,'A','2016-10-06 01:54:52','2016-10-06 01:54:52',NULL,NULL,'',''),(41,37,1,NULL,'WBC Silver Title ','Shannon O\'connell','Kimika Miyoshi','79','80','Fight','2016-08-13','18:00:00','Melbourne park function centre',0,0,0,'A','2016-08-10 08:46:06','2016-08-17 16:01:58','-37.813629','144.963058','http://',''),(40,29,1,NULL,'Example of a fight call out','Ben Savva ','Example','74','77','Fight','2016-08-08','19:00:00','Melbourne function Centre',4,10,2,'A','2016-08-08 11:44:45','2016-08-25 10:09:47','30.000000','-40.000000','http://epicentre.tv','');
/*!40000 ALTER TABLE `callouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Boxing','A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Karate','A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Kick Boxing','A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'Kung Fu','A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'Judo','A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'Jujutsu','A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'MMA','A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'Taekwondo','A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'Team Warfare','A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'Wrestling','A','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('1ff96b591b7906e0d9a5a006f3482c17e35a95cf','127.0.0.1',1479782363,'__ci_last_regenerate|i:1479782128;'),('b084639fdf55c348ef2b9596d5650033420b23d8','127.0.0.1',1479782775,'__ci_last_regenerate|i:1479782775;'),('06a2981bc9af8814a82c883113a447044774454b','127.0.0.1',1479783678,'__ci_last_regenerate|i:1479783678;'),('cfca75f903ea1a4fe80aa68088e50ceb9593baa8','127.0.0.1',1479783980,'__ci_last_regenerate|i:1479783980;'),('344412a41018b9bc306dd3e660881664062da7be','127.0.0.1',1479784340,'__ci_last_regenerate|i:1479784340;'),('5e97f2ce3171cb62ed805eb1444a46017d217a16','127.0.0.1',1479784647,'__ci_last_regenerate|i:1479784647;'),('c44f7fbc4669b52ffe7e59a98287be21b8c33caa','127.0.0.1',1479784987,'__ci_last_regenerate|i:1479784987;'),('78793f84fb4d8030b3cf54835151d4fe6e5fc523','127.0.0.1',1479785293,'__ci_last_regenerate|i:1479785293;'),('d881c22cfa4c26b4384892a70bac45023c58a70b','127.0.0.1',1479785753,'__ci_last_regenerate|i:1479785753;'),('f2e3f4b2dbf47e1b18364817ac47e37c860fac5a','127.0.0.1',1479786529,'__ci_last_regenerate|i:1479786529;'),('5cfceaa304cef51eb904932dae63fbc955bca140','127.0.0.1',1479787158,'__ci_last_regenerate|i:1479787158;login|O:8:\"stdClass\":19:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"1\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;}alert_type|s:7:\"success\";__ci_vars|a:2:{s:10:\"alert_type\";s:3:\"new\";s:13:\"alert_message\";s:3:\"new\";}alert_message|s:19:\"Login Successful...\";'),('211acb52ad73c5090280d582699b59962a26b63d','127.0.0.1',1479788242,'__ci_last_regenerate|i:1479788242;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}'),('4c071484100628c39148e68a5d6d5bb3ecc52f89','127.0.0.1',1479788782,'__ci_last_regenerate|i:1479788782;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}'),('a04708a3036f36bcd279663389b0973aa4c02341','127.0.0.1',1479789179,'__ci_last_regenerate|i:1479789179;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}'),('6d8c5a9356f962d0945f72fdbaae35261e8e71aa','127.0.0.1',1479789611,'__ci_last_regenerate|i:1479789611;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}'),('a635d48f68c65e9b8f0a4d18d5332ad34546e51b','127.0.0.1',1479791530,'__ci_last_regenerate|i:1479791530;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}'),('f6cdd588497ae5985a3ef709eac6b760367e2fb2','127.0.0.1',1479791967,'__ci_last_regenerate|i:1479791967;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}'),('672d6aca2250499e7af4034279de9c3a737144e5','127.0.0.1',1479792841,'__ci_last_regenerate|i:1479792841;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}'),('8d94b9962dc10b45befcdd1299baa20f1f78ad21','127.0.0.1',1479793301,'__ci_last_regenerate|i:1479793301;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}'),('5837a66c33fd5ea74786853d9c3106bff89a3b40','127.0.0.1',1479794033,'__ci_last_regenerate|i:1479794033;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}'),('42f937c61709c58caf611507803c95f4d5199258','127.0.0.1',1479794587,'__ci_last_regenerate|i:1479794587;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}'),('1b17f31749edb88969133d25f20c2978799e66a6','127.0.0.1',1479795148,'__ci_last_regenerate|i:1479795148;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}alert_type|s:7:\"success\";__ci_vars|a:2:{s:10:\"alert_type\";s:3:\"old\";s:13:\"alert_message\";s:3:\"old\";}alert_message|s:19:\"Login Successful...\";'),('8b189bf4b326527c48a13349f17acfd9f3a59e44','127.0.0.1',1479795611,'__ci_last_regenerate|i:1479795611;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}'),('52cfbc39ff5aeb0eb4b89e7e3c3dee11c9d94794','127.0.0.1',1479795912,'__ci_last_regenerate|i:1479795912;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}'),('e22cdde9fd7a1eb6aae8536228c193868eba8455','127.0.0.1',1479796608,'__ci_last_regenerate|i:1479796608;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}'),('66549dc88f172a641b8dd59afc7c997e20e6fa4e','127.0.0.1',1479797137,'__ci_last_regenerate|i:1479797137;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}'),('bd08f2c928f7faa5089c32da6ceb038b2b4a231b','127.0.0.1',1479797709,'__ci_last_regenerate|i:1479797709;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}'),('1447efc0935c1c49365796491cb9dfc4e855b378','127.0.0.1',1479797713,'__ci_last_regenerate|i:1479797709;login|O:8:\"stdClass\":21:{s:2:\"id\";s:1:\"1\";s:10:\"first_name\";s:4:\"Reva\";s:9:\"last_name\";s:9:\"Schneider\";s:4:\"name\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:13:\"hello@inoc.me\";s:8:\"password\";s:32:\"098f6bcd4621d373cade4e832627b4f6\";s:7:\"role_id\";s:1:\"7\";s:11:\"category_id\";s:1:\"1\";s:5:\"photo\";s:2:\"28\";s:20:\"reset_password_token\";s:0:\"\";s:25:\"reset_password_expiration\";s:1:\"0\";s:10:\"birth_date\";s:10:\"1982-01-08\";s:6:\"gender\";s:4:\"male\";s:6:\"status\";s:1:\"A\";s:14:\"remember_token\";s:60:\"JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV\";s:10:\"created_at\";s:19:\"0000-00-00 00:00:00\";s:10:\"updated_at\";s:19:\"2016-08-30 16:38:49\";s:10:\"country_id\";N;s:9:\"role_name\";s:13:\"Administrator\";s:4:\"role\";s:5:\"admin\";}alert_type|s:7:\"success\";__ci_vars|a:2:{s:10:\"alert_type\";s:3:\"old\";s:13:\"alert_message\";s:3:\"old\";}alert_message|s:19:\"Login Successful...\";');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `callout_id` int(10) unsigned NOT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_callout_id_foreign` (`callout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (30,28,40,'savva is a pussy','A','2016-08-25 10:09:14','2016-08-25 10:09:14'),(29,41,40,'1','A','2016-08-17 16:04:13','2016-08-17 16:04:13'),(28,41,40,'hey','A','2016-08-17 16:03:53','2016-08-17 16:03:53'),(31,28,40,'Example will smash him','A','2016-08-25 10:09:46','2016-08-25 10:09:46');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=226 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'AL','Albania','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'DZ','Algeria','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'AS','American Samoa','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'AD','Andorra','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'AO','Angola','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'AI','Anguilla','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'AQ','Antarctica','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'AR','Argentina','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'AM','Armenia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,'AW','Aruba','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,'AU','Australia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,'AT','Austria','0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,'AZ','Azerbaijan','0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,'BS','Bahamas','0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,'BH','Bahrain','0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,'BD','Bangladesh','0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,'BB','Barbados','0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,'BY','Belarus','0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,'BE','Belgium','0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,'BZ','Belize','0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,'BJ','Benin','0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,'BM','Bermuda','0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,'BT','Bhutan','0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,'BO','Bolivia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,'BA','Bosnia and Herzegovina','0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,'BW','Botswana','0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,'BR','Brazil','0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,'VG','British Virgin Islands','0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,'BN','Brunei','0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,'BG','Bulgaria','0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,'BF','Burkina Faso','0000-00-00 00:00:00','0000-00-00 00:00:00'),(33,'BI','Burundi','0000-00-00 00:00:00','0000-00-00 00:00:00'),(34,'KH','Cambodia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,'CM','Cameroon','0000-00-00 00:00:00','0000-00-00 00:00:00'),(36,'CA','Canada','0000-00-00 00:00:00','0000-00-00 00:00:00'),(37,'CV','Cape Verde','0000-00-00 00:00:00','0000-00-00 00:00:00'),(38,'KY','Cayman Islands','0000-00-00 00:00:00','0000-00-00 00:00:00'),(39,'CF','Central African Republic','0000-00-00 00:00:00','0000-00-00 00:00:00'),(40,'CL','Chile','0000-00-00 00:00:00','0000-00-00 00:00:00'),(41,'CN','China','0000-00-00 00:00:00','0000-00-00 00:00:00'),(42,'CO','Colombia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(43,'KM','Comoros','0000-00-00 00:00:00','0000-00-00 00:00:00'),(44,'CK','Cook Islands','0000-00-00 00:00:00','0000-00-00 00:00:00'),(45,'CR','Costa Rica','0000-00-00 00:00:00','0000-00-00 00:00:00'),(46,'HR','Croatia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(47,'CU','Cuba','0000-00-00 00:00:00','0000-00-00 00:00:00'),(48,'CW','Curacao','0000-00-00 00:00:00','0000-00-00 00:00:00'),(49,'CY','Cyprus','0000-00-00 00:00:00','0000-00-00 00:00:00'),(50,'CZ','Czech Republic','0000-00-00 00:00:00','0000-00-00 00:00:00'),(51,'CD','Democratic Republic of Congo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(52,'DK','Denmark','0000-00-00 00:00:00','0000-00-00 00:00:00'),(53,'DJ','Djibouti','0000-00-00 00:00:00','0000-00-00 00:00:00'),(54,'DM','Dominica','0000-00-00 00:00:00','0000-00-00 00:00:00'),(55,'DO','Dominican Republic','0000-00-00 00:00:00','0000-00-00 00:00:00'),(56,'TL','East Timor','0000-00-00 00:00:00','0000-00-00 00:00:00'),(57,'EC','Ecuador','0000-00-00 00:00:00','0000-00-00 00:00:00'),(58,'EG','Egypt','0000-00-00 00:00:00','0000-00-00 00:00:00'),(59,'SV','El Salvador','0000-00-00 00:00:00','0000-00-00 00:00:00'),(60,'GQ','Equatorial Guinea','0000-00-00 00:00:00','0000-00-00 00:00:00'),(61,'ER','Eritrea','0000-00-00 00:00:00','0000-00-00 00:00:00'),(62,'EE','Estonia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(63,'ET','Ethiopia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(64,'FK','Falkland Islands','0000-00-00 00:00:00','0000-00-00 00:00:00'),(65,'FO','Faroe Islands','0000-00-00 00:00:00','0000-00-00 00:00:00'),(66,'FJ','Fiji','0000-00-00 00:00:00','0000-00-00 00:00:00'),(67,'FI','Finland','0000-00-00 00:00:00','0000-00-00 00:00:00'),(68,'FR','France','0000-00-00 00:00:00','0000-00-00 00:00:00'),(69,'PF','French Polynesia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(70,'GA','Gabon','0000-00-00 00:00:00','0000-00-00 00:00:00'),(71,'GM','Gambia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(72,'GE','Georgia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(73,'DE','Germany','0000-00-00 00:00:00','0000-00-00 00:00:00'),(74,'GH','Ghana','0000-00-00 00:00:00','0000-00-00 00:00:00'),(75,'GI','Gibraltar','0000-00-00 00:00:00','0000-00-00 00:00:00'),(76,'GR','Greece','0000-00-00 00:00:00','0000-00-00 00:00:00'),(77,'GL','Greenland','0000-00-00 00:00:00','0000-00-00 00:00:00'),(78,'GP','Guadeloupe','0000-00-00 00:00:00','0000-00-00 00:00:00'),(79,'GU','Guam','0000-00-00 00:00:00','0000-00-00 00:00:00'),(80,'GT','Guatemala','0000-00-00 00:00:00','0000-00-00 00:00:00'),(81,'GN','Guinea','0000-00-00 00:00:00','0000-00-00 00:00:00'),(82,'GW','Guinea-Bissau','0000-00-00 00:00:00','0000-00-00 00:00:00'),(83,'GY','Guyana','0000-00-00 00:00:00','0000-00-00 00:00:00'),(84,'HT','Haiti','0000-00-00 00:00:00','0000-00-00 00:00:00'),(85,'HN','Honduras','0000-00-00 00:00:00','0000-00-00 00:00:00'),(86,'HK','Hong Kong','0000-00-00 00:00:00','0000-00-00 00:00:00'),(87,'HU','Hungary','0000-00-00 00:00:00','0000-00-00 00:00:00'),(88,'IS','Iceland','0000-00-00 00:00:00','0000-00-00 00:00:00'),(89,'IN','India','0000-00-00 00:00:00','0000-00-00 00:00:00'),(90,'ID','Indonesia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(91,'IR','Iran','0000-00-00 00:00:00','0000-00-00 00:00:00'),(92,'IQ','Iraq','0000-00-00 00:00:00','0000-00-00 00:00:00'),(93,'IE','Ireland','0000-00-00 00:00:00','0000-00-00 00:00:00'),(94,'IM','Isle of Man','0000-00-00 00:00:00','0000-00-00 00:00:00'),(95,'IL','Israel','0000-00-00 00:00:00','0000-00-00 00:00:00'),(96,'IT','Italy','0000-00-00 00:00:00','0000-00-00 00:00:00'),(97,'CI','Ivory Coast','0000-00-00 00:00:00','0000-00-00 00:00:00'),(98,'JM','Jamaica','0000-00-00 00:00:00','0000-00-00 00:00:00'),(99,'JP','Japan','0000-00-00 00:00:00','0000-00-00 00:00:00'),(100,'JO','Jordan','0000-00-00 00:00:00','0000-00-00 00:00:00'),(101,'KZ','Kazakhstan','0000-00-00 00:00:00','0000-00-00 00:00:00'),(102,'KE','Kenya','0000-00-00 00:00:00','0000-00-00 00:00:00'),(103,'KI','Kiribati','0000-00-00 00:00:00','0000-00-00 00:00:00'),(104,'XK','Kosovo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(105,'KW','Kuwait','0000-00-00 00:00:00','0000-00-00 00:00:00'),(106,'KG','Kyrgyzstan','0000-00-00 00:00:00','0000-00-00 00:00:00'),(107,'LA','Laos','0000-00-00 00:00:00','0000-00-00 00:00:00'),(108,'LV','Latvia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(109,'LB','Lebanon','0000-00-00 00:00:00','0000-00-00 00:00:00'),(110,'LS','Lesotho','0000-00-00 00:00:00','0000-00-00 00:00:00'),(111,'LR','Liberia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(112,'LY','Libya','0000-00-00 00:00:00','0000-00-00 00:00:00'),(113,'LI','Liechtenstein','0000-00-00 00:00:00','0000-00-00 00:00:00'),(114,'LT','Lithuania','0000-00-00 00:00:00','0000-00-00 00:00:00'),(115,'LU','Luxembourg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(116,'MO','Macau','0000-00-00 00:00:00','0000-00-00 00:00:00'),(117,'MK','Macedonia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(118,'MG','Madagascar','0000-00-00 00:00:00','0000-00-00 00:00:00'),(119,'MW','Malawi','0000-00-00 00:00:00','0000-00-00 00:00:00'),(120,'MY','Malaysia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(121,'MV','Maldives','0000-00-00 00:00:00','0000-00-00 00:00:00'),(122,'ML','Mali','0000-00-00 00:00:00','0000-00-00 00:00:00'),(123,'MT','Malta','0000-00-00 00:00:00','0000-00-00 00:00:00'),(124,'MH','Marshall Islands','0000-00-00 00:00:00','0000-00-00 00:00:00'),(125,'MR','Mauritania','0000-00-00 00:00:00','0000-00-00 00:00:00'),(126,'MU','Mauritius','0000-00-00 00:00:00','0000-00-00 00:00:00'),(127,'MX','Mexico','0000-00-00 00:00:00','0000-00-00 00:00:00'),(128,'FM','Micronesia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(129,'MD','Moldova','0000-00-00 00:00:00','0000-00-00 00:00:00'),(130,'MC','Monaco','0000-00-00 00:00:00','0000-00-00 00:00:00'),(131,'MN','Mongolia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(132,'ME','Montenegro','0000-00-00 00:00:00','0000-00-00 00:00:00'),(133,'MS','Montserrat','0000-00-00 00:00:00','0000-00-00 00:00:00'),(134,'MA','Morocco','0000-00-00 00:00:00','0000-00-00 00:00:00'),(135,'MZ','Mozambique','0000-00-00 00:00:00','0000-00-00 00:00:00'),(136,'MM','Myanmar [Burma]','0000-00-00 00:00:00','0000-00-00 00:00:00'),(137,'NA','Namibia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(138,'NR','Nauru','0000-00-00 00:00:00','0000-00-00 00:00:00'),(139,'NP','Nepal','0000-00-00 00:00:00','0000-00-00 00:00:00'),(140,'NL','Netherlands','0000-00-00 00:00:00','0000-00-00 00:00:00'),(141,'NC','New Caledonia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(142,'NZ','New Zealand','0000-00-00 00:00:00','0000-00-00 00:00:00'),(143,'NI','Nicaragua','0000-00-00 00:00:00','0000-00-00 00:00:00'),(144,'NE','Niger','0000-00-00 00:00:00','0000-00-00 00:00:00'),(145,'NG','Nigeria','0000-00-00 00:00:00','0000-00-00 00:00:00'),(146,'NU','Niue','0000-00-00 00:00:00','0000-00-00 00:00:00'),(147,'NF','Norfolk Island','0000-00-00 00:00:00','0000-00-00 00:00:00'),(148,'KP','North Korea','0000-00-00 00:00:00','0000-00-00 00:00:00'),(149,'MP','Northern Mariana Islands','0000-00-00 00:00:00','0000-00-00 00:00:00'),(150,'NO','Norway','0000-00-00 00:00:00','0000-00-00 00:00:00'),(151,'OM','Oman','0000-00-00 00:00:00','0000-00-00 00:00:00'),(152,'PK','Pakistan','0000-00-00 00:00:00','0000-00-00 00:00:00'),(153,'PW','Palau','0000-00-00 00:00:00','0000-00-00 00:00:00'),(154,'PA','Panama','0000-00-00 00:00:00','0000-00-00 00:00:00'),(155,'PG','Papua New Guinea','0000-00-00 00:00:00','0000-00-00 00:00:00'),(156,'PY','Paraguay','0000-00-00 00:00:00','0000-00-00 00:00:00'),(157,'PE','Peru','0000-00-00 00:00:00','0000-00-00 00:00:00'),(158,'PH','Philippines','0000-00-00 00:00:00','0000-00-00 00:00:00'),(159,'PN','Pitcairn Islands','0000-00-00 00:00:00','0000-00-00 00:00:00'),(160,'PL','Poland','0000-00-00 00:00:00','0000-00-00 00:00:00'),(161,'PT','Portugal','0000-00-00 00:00:00','0000-00-00 00:00:00'),(162,'PR','Puerto Rico','0000-00-00 00:00:00','0000-00-00 00:00:00'),(163,'QA','Qatar','0000-00-00 00:00:00','0000-00-00 00:00:00'),(164,'CG','Republic of the Congo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(165,'RE','Reunion','0000-00-00 00:00:00','0000-00-00 00:00:00'),(166,'RO','Romania','0000-00-00 00:00:00','0000-00-00 00:00:00'),(167,'RU','Russia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(168,'RW','Rwanda','0000-00-00 00:00:00','0000-00-00 00:00:00'),(169,'BL','Saint Barthélemy','0000-00-00 00:00:00','0000-00-00 00:00:00'),(170,'SH','Saint Helena','0000-00-00 00:00:00','0000-00-00 00:00:00'),(171,'KN','Saint Kitts and Nevis','0000-00-00 00:00:00','0000-00-00 00:00:00'),(172,'LC','Saint Lucia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(173,'MF','Saint Martin','0000-00-00 00:00:00','0000-00-00 00:00:00'),(174,'PM','Saint Pierre and Miquelon','0000-00-00 00:00:00','0000-00-00 00:00:00'),(175,'VC','Saint Vincent and the Grenadines','0000-00-00 00:00:00','0000-00-00 00:00:00'),(176,'WS','Samoa','0000-00-00 00:00:00','0000-00-00 00:00:00'),(177,'SM','San Marino','0000-00-00 00:00:00','0000-00-00 00:00:00'),(178,'ST','Sao Tome and Principe','0000-00-00 00:00:00','0000-00-00 00:00:00'),(179,'SA','Saudi Arabia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(180,'SN','Senegal','0000-00-00 00:00:00','0000-00-00 00:00:00'),(181,'RS','Serbia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(182,'SC','Seychelles','0000-00-00 00:00:00','0000-00-00 00:00:00'),(183,'SL','Sierra Leone','0000-00-00 00:00:00','0000-00-00 00:00:00'),(184,'SG','Singapore','0000-00-00 00:00:00','0000-00-00 00:00:00'),(185,'SK','Slovakia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(186,'SI','Slovenia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(187,'SB','Solomon Islands','0000-00-00 00:00:00','0000-00-00 00:00:00'),(188,'SO','Somalia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(189,'ZA','South Africa','0000-00-00 00:00:00','0000-00-00 00:00:00'),(190,'KR','South Korea','0000-00-00 00:00:00','0000-00-00 00:00:00'),(191,'SS','South Sudan','0000-00-00 00:00:00','0000-00-00 00:00:00'),(192,'ES','Spain','0000-00-00 00:00:00','0000-00-00 00:00:00'),(193,'LK','Sri Lanka','0000-00-00 00:00:00','0000-00-00 00:00:00'),(194,'SD','Sudan','0000-00-00 00:00:00','0000-00-00 00:00:00'),(195,'SR','Suriname','0000-00-00 00:00:00','0000-00-00 00:00:00'),(196,'SZ','Swaziland','0000-00-00 00:00:00','0000-00-00 00:00:00'),(197,'SE','Sweden','0000-00-00 00:00:00','0000-00-00 00:00:00'),(198,'CH','Switzerland','0000-00-00 00:00:00','0000-00-00 00:00:00'),(199,'SY','Syria','0000-00-00 00:00:00','0000-00-00 00:00:00'),(200,'TW','Taiwan','0000-00-00 00:00:00','0000-00-00 00:00:00'),(201,'TJ','Tajikistan','0000-00-00 00:00:00','0000-00-00 00:00:00'),(202,'TZ','Tanzania','0000-00-00 00:00:00','0000-00-00 00:00:00'),(203,'TH','Thailand','0000-00-00 00:00:00','0000-00-00 00:00:00'),(204,'TG','Togo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(205,'TK','Tokelau','0000-00-00 00:00:00','0000-00-00 00:00:00'),(206,'TT','Trinidad and Tobago','0000-00-00 00:00:00','0000-00-00 00:00:00'),(207,'TN','Tunisia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(208,'TR','Turkey','0000-00-00 00:00:00','0000-00-00 00:00:00'),(209,'TM','Turkmenistan','0000-00-00 00:00:00','0000-00-00 00:00:00'),(210,'TV','Tuvalu','0000-00-00 00:00:00','0000-00-00 00:00:00'),(211,'UG','Uganda','0000-00-00 00:00:00','0000-00-00 00:00:00'),(212,'UA','Ukraine','0000-00-00 00:00:00','0000-00-00 00:00:00'),(213,'AE','United Arab Emirates','0000-00-00 00:00:00','0000-00-00 00:00:00'),(214,'GB','United Kingdom','0000-00-00 00:00:00','0000-00-00 00:00:00'),(215,'US','United States','0000-00-00 00:00:00','0000-00-00 00:00:00'),(216,'UY','Uruguay','0000-00-00 00:00:00','0000-00-00 00:00:00'),(217,'UZ','Uzbekistan','0000-00-00 00:00:00','0000-00-00 00:00:00'),(218,'VU','Vanuatu','0000-00-00 00:00:00','0000-00-00 00:00:00'),(219,'VA','Vatican','0000-00-00 00:00:00','0000-00-00 00:00:00'),(220,'VE','Venezuela','0000-00-00 00:00:00','0000-00-00 00:00:00'),(221,'VN','Vietnam','0000-00-00 00:00:00','0000-00-00 00:00:00'),(222,'EH','Western Sahara','0000-00-00 00:00:00','0000-00-00 00:00:00'),(223,'YE','Yemen','0000-00-00 00:00:00','0000-00-00 00:00:00'),(224,'ZM','Zambia','0000-00-00 00:00:00','0000-00-00 00:00:00'),(225,'ZW','Zimbabwe','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_04_09_101926_create_roles_table',1),('2014_04_09_102004_create_categories_table',1),('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2015_04_09_102011_create_callouts_table',1),('2015_04_09_102021_create_comments_table',1),('2015_04_09_102032_create_views_table',1),('2015_04_09_102037_create_votes_table',1),('2015_05_26_072647_create_uploads_table',1),('2015_06_29_095131_add_field_time_to_callouts',1),('2015_07_31_060659_update_foreign_keys',1),('2015_08_27_100917_create_countries_table',1),('2015_08_27_235923_add_field_country_to_users',1),('2015_08_28_053812_add_unique_index_to_votes',1),('2015_09_01_011354_add_field_latlng_to_callouts',1),('2015_10_05_075844_add_field_broadcast_ticket_url',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('adamwatt@me.com','cf96b5fe81ac24c5b310b148896efb90da57c0f45562c3987b67525022d65534','2016-08-11 04:53:58'),('joven@maveninteractivellc.com','8f02838371c7b96d1861bc72be423d3e1310fc3172093c82203fa20faeefabe9','2016-08-11 04:54:14'),('chayana@mierslegal.com.au','5d9738e1f69e4dab48eeb8252ce9d8ce214a66a8fd2d71c81bf862b89836df9f','2016-07-28 01:23:31'),('awpapc@gmail.com','abd8570240012856a45d1cb5ecb21988cfb15a93d69cce9fe7d576d94ffd63fd','2016-08-03 15:49:41');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Fighter','A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Fight Fan','A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Trainer','A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'Promoter','A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'Match Maker','A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'Manager','A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'Administrator','A','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL,
  `file_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumbnail_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
INSERT INTO `uploads` VALUES (84,'callout','video/quicktime','',1,'phpv3Ci0Y.mov','phpv3Ci0Y.mov','A','2016-10-06 01:54:47','2016-10-06 01:54:47'),(83,'callout','image/jpeg','',1,'phpSqf0wW.jpg','phpSqf0wW.jpg','A','2016-10-06 01:54:07','2016-10-06 01:54:07'),(82,'user','image/jpeg','',1,'phpwvXUgf.jpg','phpwvXUgf.jpg','A','2016-08-17 16:09:48','2016-08-17 16:09:48'),(81,'callout','image/jpeg','',1,'phpkKOI8I.jpg','phpkKOI8I.jpg','A','2016-08-10 11:24:42','2016-08-10 11:24:42'),(80,'callout','video/quicktime','',1,'phppeQ5ur.mov','phppeQ5ur.mov','A','2016-08-10 08:46:00','2016-08-10 08:46:00'),(79,'callout','image/jpeg','',1,'phpmHU4Cv.jpg','phpmHU4Cv.jpg','A','2016-08-10 08:45:43','2016-08-10 08:45:43'),(78,'user','image/jpeg','',1,'phpk6qxmk.jpg','phpk6qxmk.jpg','A','2016-08-10 08:44:13','2016-08-10 08:44:13'),(77,'callout','video/quicktime','',1,'phprAuadA.mov','phprAuadA.mov','A','2016-08-08 11:48:12','2016-08-08 11:48:12'),(76,'callout','video/quicktime','',1,'phpPdcB5K.mov','phpPdcB5K.mov','A','2016-08-08 11:46:35','2016-08-08 11:46:35'),(75,'callout','video/quicktime','',1,'phpp5YXza.mov','phpp5YXza.mov','A','2016-08-08 11:44:40','2016-08-08 11:44:40'),(74,'callout','image/jpeg','',1,'phpZiroti.jpg','phpZiroti.jpg','A','2016-08-08 11:43:56','2016-08-08 11:43:56'),(73,'user','image/jpeg','',1,'php2fKuU7.jpg','php2fKuU7.jpg','A','2016-08-08 06:42:58','2016-08-08 06:42:58');
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reset_password_expiration` smallint(6) NOT NULL,
  `birth_date` date NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `country_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  KEY `users_category_id_foreign` (`category_id`),
  KEY `users_country_id_foreign` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Reva','Schneider','','admin','hello@inoc.me','098f6bcd4621d373cade4e832627b4f6',7,1,'28','',0,'1982-01-08','male','A','JEXJZdFA2xGHTajuv8OFv4gzquFciEhUiNw1nnoe6pWVvdBATbWj5rfX31kV','0000-00-00 00:00:00','2016-08-30 08:38:49',NULL),(42,'','','','meghastar','megs.75@hotmail.com','$2y$10$a/xfiEMCK8pg9Wb14WB5CuJ16C4qNXfyNpur756GA3uQCG9sn28Oy',2,1,NULL,'',0,'0000-00-00',NULL,'A',NULL,'2016-10-14 10:01:54','2016-10-14 10:01:54',NULL),(41,'ferdinand','buagas','','paping123','ferdinand.buagas+1+fco@gmail.com','$2y$10$eKf1QNmbnHYZdW0IJo9/S.s6CBniL16BUPfCg1hWM8CA4V.YNxz3y',2,1,'82','',0,'0000-00-00',NULL,'A',NULL,'2016-08-17 15:57:57','2016-08-17 16:10:41',158),(40,'','','','asomatajr','asomatajr@gmail.com','$2y$10$nKpnGmHl7XxGOd./FQK8aOUa1x5H/TazVJW6b.aPP0KTKzJKDB3EG',2,1,NULL,'',0,'0000-00-00',NULL,'A',NULL,'2016-08-16 18:22:01','2016-08-16 18:22:01',NULL),(39,'Michael ','Zerafa ','','zerafa13','zerafa.m@outlook.com','$2y$10$yOtxLrG59sO6Fq6jtO0DiukkJyly.KEgD5rVsNd3Ffa.lU6lGPTSC',1,1,NULL,'',0,'1992-03-25',NULL,'A',NULL,'2016-08-11 03:59:37','2016-08-11 04:03:57',12),(38,'','','','sugarneekz','churrneka@hotmail.com','$2y$10$fUiH2qVWJAnFdKj3poCnc.HzcYcsZn8yXOBzhuEvo9ai3OFtHCukC',2,1,NULL,'',0,'0000-00-00',NULL,'A',NULL,'2016-08-10 10:26:02','2016-08-10 10:26:02',NULL),(37,'','','','Shotgun78','shotgunboxing@gmail.com','$2y$10$8kMjcCCObvnkzX3ImZLKsOQ2R1pFnQr.jGdsMONCGlDyoJLqxLKTW',2,1,NULL,'',0,'0000-00-00',NULL,'A',NULL,'2016-08-10 08:42:06','2016-08-10 08:42:06',NULL),(35,'','','','Adamx22 ','awpapc@gmail.com','$2y$10$PztzlJaBBCqUQHEvFhFBRe4y42xBwZl2enJEy0Je8R4PTtVT3oaSC',2,1,NULL,'',0,'0000-00-00',NULL,'A',NULL,'2016-08-03 15:47:54','2016-08-03 15:47:54',NULL),(34,'','','','Shan Govind','Shan.govind@hotmail.com','$2y$10$/TkY4n3GOaEoVxIhVK85y.sj.F/1BXBAHwyOadJ4tc4lX90kSix1.',2,1,NULL,'',0,'0000-00-00',NULL,'A',NULL,'2016-07-16 16:52:30','2016-07-16 16:52:30',NULL),(33,'','','','kevin123z','kevinxbautista@gmail.com','$2y$10$o5QzBRGoIJt2D4vYsO0upuR0uIsui3O96ut6ImSAcaq1fPIlaaLBS',2,1,NULL,'',0,'0000-00-00',NULL,'A',NULL,'2016-07-10 23:46:11','2016-07-10 23:46:11',NULL),(32,'','','','kevin32x','kevin3342z@gmail.com','$2y$10$z7nI/OQ3GBi.YTl4ET/vMeupGwpX.13FgzUaFI1ck3D2KY6TsknUe',2,1,NULL,'',0,'0000-00-00',NULL,'A',NULL,'2016-07-10 23:45:33','2016-07-10 23:45:33',NULL),(36,'Abdallah ','Abou Hamdan ','','abdallahabouhamdan ','abdallah.abouhamdan@gmail.com','$2y$10$yIDdC6z4f9RQLJy5NJwbL.vf4v6wGvWff0YmmSStZ9Yuz/K3si1Ge',1,7,'78','',0,'1982-01-01',NULL,'A',NULL,'2016-08-10 08:41:00','2016-08-10 08:44:13',12),(31,'Benjo','Quinn','','Benjoben','joven@maveninteractivellc.com','$2y$10$ifE4Y0lIfXOoYAoQSPymbe4u184/.h4tx.XuwEeUdfBzzLSNxYqWi',2,1,'65','',0,'1979-08-31',NULL,'A','rkdTNcriD1HbAjgwxxLUxHR3a8jcaypEUomPQPYmKrrpKCT0WbL5Xxq8synU','2016-07-05 02:52:33','2016-07-10 08:41:16',12),(30,'Chayana ','Miers','','Chayana ','chayana@mierslegal.com.au','$2y$10$5wDAGkXf0eORi6fbTWAoZ.RIYwUfv9UIsnE.b00BbDzebPOpqmoT6',2,6,'58','',0,'1980-05-07',NULL,'A',NULL,'2016-06-25 15:35:19','2016-06-25 15:39:50',12),(29,'Adam ','Watt','','Toughguy ','adamwatt@me.com','$2y$10$AO2BahYGwsazoeapNWgJ1uFtO2gSvgR8WCsVLZish/bUFCbBSdyne',2,1,'73','',0,'0000-00-00',NULL,'A',NULL,'2016-06-24 14:56:45','2016-08-08 06:44:45',12),(28,'Kerry','foley','','Kerry Foley','kerry.foley@yahoo.com','$2y$10$JRVzCPNhX6Rg7E6jZOiznedd6lQP3wGucgRVeFsNUzsyC5HsLGJbW',1,1,NULL,'',0,'1987-12-09',NULL,'A',NULL,'2016-06-22 10:20:21','2016-07-29 13:13:23',12);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `callout_id` int(10) unsigned NOT NULL,
  `count` smallint(6) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `views_user_id_foreign` (`user_id`),
  KEY `views_callout_id_foreign` (`callout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
INSERT INTO `views` VALUES (82,29,40,1,'A','2016-08-25 10:09:15','2016-08-25 10:09:15'),(81,29,40,1,'A','2016-08-25 10:08:47','2016-08-25 10:08:47'),(80,29,40,1,'A','2016-08-17 16:11:09','2016-08-17 16:11:09'),(79,29,40,1,'A','2016-08-17 16:08:16','2016-08-17 16:08:16'),(78,29,40,1,'A','2016-08-17 16:04:14','2016-08-17 16:04:14'),(77,29,40,1,'A','2016-08-17 16:04:02','2016-08-17 16:04:02'),(76,29,40,1,'A','2016-08-17 16:03:54','2016-08-17 16:03:54'),(75,29,40,1,'A','2016-08-17 16:03:50','2016-08-17 16:03:50'),(83,29,40,1,'A','2016-08-25 10:09:30','2016-08-25 10:09:30'),(84,29,40,1,'A','2016-08-25 10:09:47','2016-08-25 10:09:47');
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `callout_id` int(10) unsigned NOT NULL,
  `tally` smallint(6) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `votes_user_id_callout_id_unique` (`user_id`,`callout_id`),
  KEY `votes_callout_id_foreign` (`callout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (30,41,40,1,'A','2016-08-17 16:02:17','2016-08-17 16:02:17'),(29,41,41,1,'A','2016-08-17 16:01:58','2016-08-17 16:01:58'),(28,40,41,-1,'A','2016-08-16 18:24:46','2016-08-16 18:24:46'),(27,40,40,1,'A','2016-08-16 18:24:33','2016-08-16 18:24:33');
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-22 15:33:25
