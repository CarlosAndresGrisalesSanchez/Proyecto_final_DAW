-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: videos
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add videos',7,'add_videos'),(26,'Can change videos',7,'change_videos'),(27,'Can delete videos',7,'delete_videos'),(28,'Can view videos',7,'view_videos'),(29,'Can add series',8,'add_series'),(30,'Can change series',8,'change_series'),(31,'Can delete series',8,'delete_series'),(32,'Can view series',8,'view_series'),(33,'Can add probar',9,'add_probar'),(34,'Can change probar',9,'change_probar'),(35,'Can delete probar',9,'delete_probar'),(36,'Can view probar',9,'view_probar'),(37,'Can add comentarios',10,'add_comentarios'),(38,'Can change comentarios',10,'change_comentarios'),(39,'Can delete comentarios',10,'delete_comentarios'),(40,'Can view comentarios',10,'view_comentarios'),(41,'Can add Token',11,'add_token'),(42,'Can change Token',11,'change_token'),(43,'Can delete Token',11,'delete_token'),(44,'Can view Token',11,'view_token');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$HJAcMcKCmRK4$sHEJE3TgNQJupR6N14b2N/L30bcIjCutlj9aGeZ7xlY=','2020-06-06 15:42:27.768416',1,'carlos','','','carl020297@gmail.com',1,1,'2020-05-27 16:55:43.001163'),(8,'pbkdf2_sha256$260000$CUHNlbtJKMba$FeMOzLXDzheDW+7R7vTW7H6nl6jro1VT2ecMYBdQ91Y=','2020-05-30 17:17:08.116623',0,'patata123','','','',0,1,'2020-05-30 14:08:57.875791'),(9,'pbkdf2_sha256$260000$pRlNASY0UQCC$kUBpTHbNBjCDnXQf4tCrJRdGSb6d/2Kss/UQyq7bYAg=','2020-06-07 16:52:47.220332',0,'patatasaurio','patata12345','patata123','patatasaurio@mailinator.com',0,1,'2020-06-05 15:56:20.932296'),(10,'pbkdf2_sha256$260000$aLj24zbXVmDv$Pa9k36M9iUbZ6fcAw7DMeOqBkf916yXDhu1Emv4sb7E=','2020-06-06 11:09:55.833199',0,'probando','','','probando@mailinator.com',0,1,'2020-06-06 11:09:55.625487'),(11,'pbkdf2_sha256$260000$WSHzEfzzaM8E$FrBccXgHjARmwcu3XTL1EHlHIfryX91TizFMzAgok9o=','2020-06-06 12:12:34.085996',0,'patata456','','','asd@mailinator.com',0,1,'2020-06-06 12:12:33.857511'),(12,'pbkdf2_sha256$260000$EzYk1DsHNmzZ$k3dsxA3WREcuFBB2Ce3Z5tl2htSrtBppKKUfBzk5Ey8=','2020-06-06 12:13:32.791095',0,'mirar','','','mirar@mailinator.com',0,1,'2020-06-06 12:13:32.585182'),(13,'pbkdf2_sha256$260000$FrN8idgtZmlS$I/cqO6VfDx/b3q4QB5ROl9Oi2zZeEXzZ3Z0g33hb+mk=','2020-06-07 05:49:08.508702',0,'registrar1','patata','potato','patata@mailinator.com',0,1,'2020-06-07 05:49:08.300370');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('678fd5c307f1a166757a685289d62daacf58d16e','2020-06-05 17:24:15.583444',9);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-05-27 17:35:18.458833','1','video1',1,'[{\"added\": {}}]',7,1),(2,'2020-05-27 17:59:43.341946','1','video1',3,'',7,1),(3,'2020-05-27 19:49:03.032079','2','Probando',1,'[{\"added\": {}}]',7,1),(4,'2020-05-28 10:35:34.120582','1','serie1',1,'[{\"added\": {}}]',8,1),(5,'2020-05-28 10:35:56.741347','2','Probando',2,'[{\"changed\": {\"fields\": [\"Serie\"]}}]',7,1),(6,'2020-05-28 10:46:28.492720','2','Probando',3,'',7,1),(7,'2020-05-28 10:46:36.864444','1','serie1',3,'',8,1),(8,'2020-05-30 11:05:21.250421','2','patata',3,'',4,1),(9,'2020-05-30 11:05:21.252937','3','patata1',3,'',4,1),(10,'2020-05-30 11:05:21.259515','4','patata123',3,'',4,1),(11,'2020-05-30 11:05:21.262426','5','patata1234',3,'',4,1),(12,'2020-05-30 11:05:21.264660','6','patata12346',3,'',4,1),(13,'2020-05-30 15:52:17.681293','1','serie1',1,'[{\"added\": {}}]',8,1),(14,'2020-05-30 16:01:23.806894','1','video1',1,'[{\"added\": {}}]',7,1),(15,'2020-05-30 16:44:38.326292','10','asd',3,'',4,1),(16,'2020-05-30 16:44:38.330445','7','patata',3,'',4,1),(17,'2020-05-30 16:44:38.332556','9','patata23',3,'',4,1),(18,'2020-06-06 13:53:22.418974','3','asd',1,'[{\"added\": {}}]',7,1),(19,'2020-06-06 14:15:43.258011','2','comentarios object (2)',1,'[{\"added\": {}}]',10,1),(20,'2020-06-06 17:23:15.970022','9','patatasaurio',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(21,'2020-06-06 17:38:32.952510','9','patatasaurio',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(22,'2020-06-06 18:08:09.426018','9','patatasaurio',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(23,'2020-06-07 15:51:49.308869','4','video anime',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'authtoken','token'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(10,'videos','comentarios'),(9,'videos','probar'),(8,'videos','series'),(7,'videos','videos');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-05-27 16:29:06.371052'),(2,'auth','0001_initial','2020-05-27 16:29:06.822463'),(3,'admin','0001_initial','2020-05-27 16:29:08.423444'),(4,'admin','0002_logentry_remove_auto_add','2020-05-27 16:29:08.801058'),(5,'admin','0003_logentry_add_action_flag_choices','2020-05-27 16:29:08.810785'),(6,'contenttypes','0002_remove_content_type_name','2020-05-27 16:29:09.073832'),(7,'auth','0002_alter_permission_name_max_length','2020-05-27 16:29:09.103437'),(8,'auth','0003_alter_user_email_max_length','2020-05-27 16:29:09.132861'),(9,'auth','0004_alter_user_username_opts','2020-05-27 16:29:09.149475'),(10,'auth','0005_alter_user_last_login_null','2020-05-27 16:29:09.287237'),(11,'auth','0006_require_contenttypes_0002','2020-05-27 16:29:09.296683'),(12,'auth','0007_alter_validators_add_error_messages','2020-05-27 16:29:09.313796'),(13,'auth','0008_alter_user_username_max_length','2020-05-27 16:29:09.336849'),(14,'auth','0009_alter_user_last_name_max_length','2020-05-27 16:29:09.368273'),(15,'auth','0010_alter_group_name_max_length','2020-05-27 16:29:09.397758'),(16,'auth','0011_update_proxy_permissions','2020-05-27 16:29:09.414853'),(17,'auth','0012_alter_user_first_name_max_length','2020-05-27 16:29:09.437964'),(18,'sessions','0001_initial','2020-05-27 16:29:09.517481'),(25,'videos','0001_initial','2020-05-28 12:14:18.716704'),(26,'videos','0002_auto_20200530_1411','2020-05-30 14:11:32.094406'),(27,'authtoken','0001_initial','2020-06-05 16:07:08.062922'),(28,'authtoken','0002_auto_20160226_1747','2020-06-05 16:07:08.522139');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('8t3s6ax4bn07gikzwbetc5jflq6jvf7y','.eJxVjMsOwiAQRf-FtSFDeRRcuvcbyDAMUjUlKe3K-O_apAvd3nPOfYmI21rj1nmJUxZnocTpd0tID553kO8435qkNq_LlOSuyIN2eW2Zn5fD_Tuo2Ou3LqhHhoLBYMmOUWviwQ6aSzaBDIfiFLAncGwGsE75RDx6BJ3JQgDx_gALzThd:1jhdEn:TRcHKfFzTOfX6f49nTFIG2YBCGLhyfPm9nvJh46akic','2020-06-20 18:08:09.456922'),('cu2xflifm95om9f7v7jdn34emrfd2pdf','.eJxVjMsOwiAQRf-FtSFDeRRcuvcbyDAMUjUlKe3K-O_apAvd3nPOfYmI21rj1nmJUxZnocTpd0tID553kO8435qkNq_LlOSuyIN2eW2Zn5fD_Tuo2Ou3LqhHhoLBYMmOUWviwQ6aSzaBDIfiFLAncGwGsE75RDx6BJ3JQgDx_gALzThd:1jdzNJ:1Nvsd8zirdkJog5hOYBWjd0kWd4HXeIBLMJsch9IDmE','2020-06-10 16:57:53.961982'),('ly3teajqz65yi6igq0uvda7maxsc9ru1','.eJxVjMEOwiAQRP-FsyEFWQSP3vsNZGG3UjWQlPZk_PcG04POcd6beYuA25rD1ngJM4mrcOL020VMTy4d0APLvcpUy7rMUXZFHrTJsRK_bof7d5Cx5b5WEzFFpQ0mMN4aTwzsUdE3lklpB1aDI8AzOUz6MgEP0XNiVF58dh8NOWE:1jf56a:J14lX3Xor2ooQls7peIaQrPeMq0PzWhACNO2m1unqEs','2020-06-13 17:17:08.123076'),('oqqrezm730gmjh0dozwwfys9ki8bc3lp','.eJxVjDsOwjAQRO_iGlnxlywlPWew1vYuDiBbipMKcXcSKQU0U8x7M28RcF1KWDvNYcriIkCcfruI6Ul1B_mB9d5kanWZpyh3RR60y1vL9Loe7t9BwV62NXk0nAeKySlPzGC2IEYzuOiTZbBGq1HhGUGDQe0MuWhHSJxiZmXF5wscnjkA:1jhcpa:0m-AWlCyc7eJuvDseuZktUABy3UaRkgIhSb41SJQbMg','2020-06-20 17:42:06.631205'),('ws7asskv0g9vbw5exlryu76e0sadnlz0','.eJxVjMEOwiAQRP-FsyEFWQSP3vsNZGG3UjWQlPZk_PcG04POcd6beYuA25rD1ngJM4mrcOL020VMTy4d0APLvcpUy7rMUXZFHrTJsRK_bof7d5Cx5b5WEzFFpQ0mMN4aTwzsUdE3lklpB1aDI8AzOUz6MgEP0XNiVF58dh8NOWE:1jf37w:RZ4UEcsk063ara-dM4TMYZqhDV7pEGFU2rzYkN6UzYY','2020-06-13 15:10:24.545719');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos_comentarios`
--

DROP TABLE IF EXISTS `videos_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos_comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `texto` varchar(300) NOT NULL,
  `autor_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `videos_comentarios_autor_id_11a74494_fk_auth_user_id` (`autor_id`),
  KEY `videos_comentarios_video_id_49886341_fk_videos_videos_id` (`video_id`),
  CONSTRAINT `videos_comentarios_autor_id_11a74494_fk_auth_user_id` FOREIGN KEY (`autor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `videos_comentarios_video_id_49886341_fk_videos_videos_id` FOREIGN KEY (`video_id`) REFERENCES `videos_videos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos_comentarios`
--

LOCK TABLES `videos_comentarios` WRITE;
/*!40000 ALTER TABLE `videos_comentarios` DISABLE KEYS */;
INSERT INTO `videos_comentarios` VALUES (1,'2020-05-30 16:09:25.222844','probandio',8,1),(2,'2020-06-06 14:15:43.257088','asdfghj',12,1),(3,'2020-06-06 14:26:03.897405','asdfghj',1,1),(4,'2020-06-06 14:29:23.444234','asdfghjasd',1,1),(5,'2020-06-06 14:53:23.490849','modificao',9,1),(6,'2020-06-07 05:46:14.542207','asd',9,1);
/*!40000 ALTER TABLE `videos_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos_series`
--

DROP TABLE IF EXISTS `videos_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos_series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `ImagenPortada` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos_series`
--

LOCK TABLES `videos_series` WRITE;
/*!40000 ALTER TABLE `videos_series` DISABLE KEYS */;
INSERT INTO `videos_series` VALUES (1,'serie1','2020-05-30 15:52:17.679924','fondo.png');
/*!40000 ALTER TABLE `videos_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos_videos`
--

DROP TABLE IF EXISTS `videos_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `video` varchar(100) NOT NULL,
  `serie_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `videos_videos_serie_id_2a9ef36f_fk_videos_series_id` (`serie_id`),
  CONSTRAINT `videos_videos_serie_id_2a9ef36f_fk_videos_series_id` FOREIGN KEY (`serie_id`) REFERENCES `videos_series` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos_videos`
--

LOCK TABLES `videos_videos` WRITE;
/*!40000 ALTER TABLE `videos_videos` DISABLE KEYS */;
INSERT INTO `videos_videos` VALUES (1,'video1','2020-05-30 16:01:23.805544','anime1.png','probando.mp4',1),(2,'pruebas','2020-06-04 18:41:53.078649','anime1.png','probando_vWCOsMp.mp4',1),(3,'asd','2020-06-06 13:53:22.417157','anime1.png','probando_mVDZzWo.mp4',1),(4,'video anime','2020-06-07 15:51:49.307211','anime1.png','probando_8OM5rEu.mp4',1);
/*!40000 ALTER TABLE `videos_videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-07 17:09:17
