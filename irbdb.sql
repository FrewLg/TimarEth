-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: serodb
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `action_audit`
--

DROP TABLE IF EXISTS `action_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action_audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_time` datetime NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `done_by_id` int NOT NULL,
  `application_id` int DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75D633C535AE3EF9` (`done_by_id`),
  KEY `IDX_75D633C53E030ACD` (`application_id`),
  CONSTRAINT `FK_75D633C535AE3EF9` FOREIGN KEY (`done_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_75D633C53E030ACD` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_audit`
--

LOCK TABLES `action_audit` WRITE;
/*!40000 ALTER TABLE `action_audit` DISABLE KEYS */;
INSERT INTO `action_audit` VALUES (1,'feedback given','2024-09-04 09:15:44',NULL,1,9,'success','fax'),(2,'feedback given','2024-09-04 09:29:56','127.0.0.1',1,8,'success','fax'),(3,'feedback given','2024-09-04 09:30:36','127.0.0.1',1,8,'success','fax'),(4,'feedback given','2024-09-04 09:31:02','127.0.0.1',1,8,'success','fax'),(5,'feedback given','2024-09-04 09:39:00','127.0.0.1',1,8,'success','fax'),(6,'feedback given','2024-09-04 09:43:25','127.0.0.1',1,8,'success','fax'),(7,'feedback given','2024-09-04 09:44:00','127.0.0.1',1,8,'success','fax'),(8,'feedback given','2024-09-04 09:44:29','127.0.0.1',1,8,'success','fax'),(9,'feedback given','2024-09-04 09:44:50','127.0.0.1',1,8,'success','fax'),(10,'feedback given','2024-09-04 09:45:35','127.0.0.1',1,8,'success','fax'),(11,'feedback given','2024-09-04 09:47:12','127.0.0.1',1,3,'success','fax'),(12,'View app','2024-09-04 09:47:35','127.0.0.1',1,3,'success','fax'),(13,'View app','2024-09-04 12:23:19','127.0.0.1',1,3,'success','sms'),(14,'View app','2024-09-04 12:23:53','127.0.0.1',1,3,'success','sms'),(15,'View app','2024-09-04 12:26:17','127.0.0.1',1,9,'success','sms'),(16,'View app','2024-09-04 12:26:27','127.0.0.1',1,1,'success','sms'),(17,'View app','2024-09-04 12:26:46','127.0.0.1',1,1,'success','sms'),(18,'Version added','2024-09-04 12:26:46','127.0.0.1',1,1,'success','sms'),(19,'View app','2024-09-04 12:26:46','127.0.0.1',1,1,'success','sms'),(20,'View app','2024-09-04 12:30:23','127.0.0.1',1,1,'success','sms'),(21,'Version added','2024-09-04 12:30:23','127.0.0.1',1,1,'success','sms'),(22,'View app','2024-09-04 12:30:24','127.0.0.1',1,1,'success','sms'),(23,'A New Version Added with \'ICF\'','2024-09-04 12:35:11','127.0.0.1',1,1,'success',NULL),(24,'A New Version Added with \'New version\' attachment type','2024-09-04 12:41:03','127.0.0.1',1,1,'success','layers'),(25,' A new feedback message has been sent  ','2024-09-04 12:46:18','127.0.0.1',1,1,'info','layers'),(26,'A Decision on initial review type has been  made ','2024-09-04 12:51:39','127.0.0.1',1,1,'info','pin'),(27,'A Decision on initial review type has been  made ','2024-09-04 12:51:53','127.0.0.1',1,1,'info','pin'),(28,'Review response has been sent ','2024-09-04 12:57:14','127.0.0.1',1,1,'primary','layers'),(29,'A new feedback message has been sent  ','2024-09-04 13:51:04','127.0.0.1',1,4,'info','paper-plane'),(30,'A New Version Added with \'Full Original Protocol\' attachment type','2024-09-04 13:52:18','127.0.0.1',1,5,'primary','pin'),(31,'A new feedback message has been sent  ','2024-09-04 13:53:01','127.0.0.1',1,5,'info','paper-plane'),(32,'A new feedback message has been sent  ','2024-09-04 13:54:59','127.0.0.1',1,5,'info','paper-plane'),(33,'A review type Decision on initial has been made ','2024-09-04 13:56:14','127.0.0.1',1,7,'warning','pin'),(34,'A New Version Added with \'ICF\' attachment type','2024-09-04 13:56:47','127.0.0.1',1,7,'primary','pin'),(35,'A new feedback message has been sent  ','2024-09-04 13:57:01','127.0.0.1',1,7,'info','paper-plane'),(36,'A new feedback message has been sent  ','2024-09-05 07:20:09','127.0.0.1',1,4,'info','paper-plane'),(37,'Reviewer assigned ','2024-09-05 07:36:26','127.0.0.1',1,4,'warning','user'),(38,'Reviewer from Reviewers\' pool has been assigned ','2024-09-05 07:38:35','127.0.0.1',1,4,'warning','user'),(39,'Application has been withdrawn ','2024-09-05 08:59:41','127.0.0.1',1,8,'danger','trash'),(40,'Application has been withdrawn ','2024-09-05 09:00:06','127.0.0.1',1,4,'danger','trash'),(41,'Application has been withdrawn ','2024-09-05 09:00:33','127.0.0.1',1,3,'danger','trash'),(42,'Application has been withdrawn ','2024-09-05 09:00:48','127.0.0.1',1,2,'danger','trash'),(43,'Application has been withdrawn ','2024-09-05 09:07:00','127.0.0.1',1,7,'danger','trash'),(44,'Application has been withdrawn ','2024-09-05 09:07:09','127.0.0.1',1,6,'danger','trash'),(45,'Application has been withdrawn ','2024-09-05 09:07:19','127.0.0.1',1,5,'danger','trash'),(46,'A New Version Added with \'New version\' attachment type','2024-09-05 09:11:14','127.0.0.1',1,8,'primary','pin'),(47,'A review type Decision on initial has been made ','2024-09-05 09:11:31','127.0.0.1',1,8,'warning','pin'),(48,'Reviewer from Board members has been assigned ','2024-09-05 09:11:47','127.0.0.1',1,8,'warning','user'),(49,'Reviewer from Reviewers\' pool has been assigned ','2024-09-05 09:15:18','127.0.0.1',1,8,'warning','user'),(50,'A new feedback message has been sent  ','2024-09-05 09:18:36','192.168.43.143',2,9,'info','paper-plane'),(51,'Reviewer from Board members has been assigned ','2024-09-05 12:31:33','192.168.43.143',2,9,'warning','user'),(52,'Review response has been sent ','2024-09-05 12:31:46','192.168.43.143',2,9,'primary','layers'),(53,'A new feedback message has been sent  ','2024-09-05 14:19:27','192.168.43.143',2,9,'info','paper-plane'),(54,'Reviewer from Board members has been assigned ','2024-09-23 11:01:02','127.0.0.1',1,1,'warning','user'),(55,'Progress report has been sent ','2024-09-24 08:21:03','127.0.0.1',2,9,'primary','layers'),(56,'Progress report has been sent ','2024-09-24 08:28:22','127.0.0.1',2,9,'primary','layers'),(57,'Progress report has been sent ','2024-09-24 08:30:05','127.0.0.1',2,9,'primary','layers'),(58,'Progress report has been sent ','2024-09-24 08:33:02','127.0.0.1',2,9,'primary','layers'),(59,'Progress report has been sent ','2024-09-24 08:39:06','127.0.0.1',2,8,'primary','layers'),(60,'Application has been sent to  ','2024-09-24 13:24:15','127.0.0.1',1,8,'info','layer'),(61,'Application has been sent to  ','2024-09-24 13:28:02','127.0.0.1',1,8,'info','layer'),(62,'Application has been sent to  ','2024-09-24 13:29:45','127.0.0.1',1,8,'info','layer'),(63,'Application has been sent to  ','2024-09-24 13:30:12','127.0.0.1',1,8,'info','layer'),(64,'Application has been sent to  ','2024-09-24 18:29:56','127.0.0.1',1,8,'info','layer'),(65,'Application has been sent to  ','2024-09-24 18:41:08','127.0.0.1',1,4,'info','layer'),(66,'Application has been sent to  ','2024-09-24 18:41:40','127.0.0.1',1,1,'info','layer'),(67,'Application has been sent to  ','2024-09-25 06:31:16','127.0.0.1',1,9,'info','layer'),(68,'Protocol Added to a meeting schedule ','2024-09-25 06:42:43','127.0.0.1',1,3,'warning','pin'),(69,'Application has been withdrawn ','2024-09-25 06:51:01','127.0.0.1',1,1,'danger','trash'),(70,'Application has been sent to  ','2024-09-25 06:52:24','127.0.0.1',1,1,'info','layers'),(71,'Application has been sent to  ','2024-09-25 06:52:53','127.0.0.1',1,1,'info','layers'),(72,'Application has been sent to  ','2024-09-25 06:53:15','127.0.0.1',1,1,'info','layers'),(73,'Application has been sent to  ','2024-09-25 08:22:26','127.0.0.1',1,9,'info','layers'),(74,'Application has been sent to  ','2024-09-25 08:23:00','127.0.0.1',1,4,'info','layers'),(75,'Application has been sent to  ','2024-09-25 08:25:59','127.0.0.1',1,1,'info','layers'),(76,'Application has been sent to  ','2024-09-25 08:26:44','127.0.0.1',1,6,'info','layers'),(77,'Application has been sent to  ','2024-09-25 08:26:57','127.0.0.1',1,9,'info','layers'),(78,'Application has been sent to  ','2024-09-25 08:27:27','127.0.0.1',1,9,'info','layers'),(79,'A new feedback message has been sent  ','2024-09-25 09:03:20','127.0.0.1',1,9,'info','paper-plane'),(80,'Application has been sent to  ','2024-09-25 09:19:27','127.0.0.1',1,8,'info','layers'),(81,'Application has been added to  meeting agenda test','2024-09-25 09:20:42','127.0.0.1',1,8,'info','layers'),(82,'Reviewer from Board members has been assigned ','2024-09-25 11:42:43','127.0.0.1',1,9,'warning','user'),(83,'A new feedback message has been sent  ','2024-09-25 12:38:20','127.0.0.1',1,8,'info','paper-plane'),(84,'A new feedback message has been sent  ','2024-09-25 12:38:26','127.0.0.1',1,8,'info','paper-plane'),(85,'A new feedback message has been sent  ','2024-09-25 12:38:34','127.0.0.1',1,8,'info','paper-plane'),(86,'A new feedback message has been sent  ','2024-09-25 12:38:48','127.0.0.1',1,8,'info','paper-plane'),(87,'A new feedback message has been sent  ','2024-09-25 12:42:08','127.0.0.1',1,8,'info','paper-plane'),(88,'A new feedback message has been sent  ','2024-09-25 12:47:02','127.0.0.1',2,2,'info','paper-plane'),(89,'A new feedback message has been sent  ','2024-09-25 12:47:13','127.0.0.1',1,2,'info','paper-plane'),(90,'A new feedback message has been sent  ','2024-09-25 12:50:16','127.0.0.1',1,4,'info','paper-plane'),(91,'A new feedback message has been sent  ','2024-09-25 12:50:23','127.0.0.1',1,4,'info','paper-plane'),(92,'A new feedback message has been sent  ','2024-09-25 12:50:48','127.0.0.1',2,4,'info','paper-plane'),(93,'A new feedback message has been sent  ','2024-09-25 12:52:04','127.0.0.1',2,4,'info','paper-plane'),(94,'A new feedback message has been sent  ','2024-09-26 07:30:23','127.0.0.1',1,8,'info','paper-plane'),(95,'A new feedback message has been sent  ','2024-09-26 12:07:21','127.0.0.1',1,4,'info','paper-plane'),(96,'A new feedback message has been sent  ','2024-09-26 12:11:03','127.0.0.1',1,4,'info','paper-plane'),(97,'A new feedback message has been sent  ','2024-09-26 12:13:57','127.0.0.1',1,4,'info','paper-plane'),(98,'Reviewer from Board members has been assigned ','2024-09-27 05:58:39','127.0.0.1',1,4,'warning','user'),(99,'Reviewer from Reviewers\' pool has been assigned ','2024-09-27 05:59:04','127.0.0.1',1,4,'warning','user'),(100,'Reviewer from Reviewers\' pool has been assigned ','2024-09-27 05:59:33','127.0.0.1',1,4,'warning','user'),(101,'Reviewer from Board members has been assigned ','2024-09-27 06:00:20','127.0.0.1',1,4,'warning','user'),(102,'A new feedback message has been sent  ','2024-09-28 09:04:29','127.0.0.1',2,9,'info','paper-plane'),(103,'A new feedback message has been sent  ','2024-09-28 09:22:30','127.0.0.1',2,9,'info','paper-plane'),(104,'Reviewer from Board members has been assigned ','2024-09-28 09:37:22','127.0.0.1',1,7,'warning','user'),(105,'Reviewer from Board members has been assigned ','2024-09-30 08:18:20','127.0.0.1',2,7,'warning','user'),(106,'Reviewer from Board members has been assigned ','2024-09-30 08:45:19','127.0.0.1',2,6,'warning','user'),(107,'Review response has been sent ','2024-09-30 09:00:45','127.0.0.1',1,7,'primary','layers'),(108,'A new feedback message has been sent  ','2024-09-30 09:12:46','127.0.0.1',1,7,'info','paper-plane'),(109,'A new feedback message has been sent  ','2024-09-30 09:12:59','127.0.0.1',1,7,'info','paper-plane'),(110,'A new feedback message has been sent  ','2024-09-30 09:13:33','127.0.0.1',2,7,'info','paper-plane'),(111,'A new feedback message has been sent  ','2024-09-30 09:14:56','127.0.0.1',2,7,'info','paper-plane'),(112,'A new feedback message has been sent  ','2024-09-30 09:15:41','127.0.0.1',1,7,'info','paper-plane'),(113,'Reviewer from Board members has been assigned ','2024-09-30 09:35:13','127.0.0.1',1,9,'warning','user'),(114,'Review response has been sent ','2024-09-30 09:35:44','127.0.0.1',1,9,'primary','layers'),(115,'A new feedback message has been sent  ','2024-09-30 11:23:28','127.0.0.1',1,4,'info','paper-plane'),(116,'A New Version Added with \'ICF\' attachment type','2024-10-01 12:38:27','127.0.0.1',1,10,'primary','pin'),(117,'Reviewer from Board members has been assigned ','2024-10-01 12:40:13','127.0.0.1',1,10,'warning','user'),(118,'Application has been added to  meeting agenda Melanie Faulkner','2024-10-01 12:42:20','127.0.0.1',1,10,'info','layers'),(119,'A new feedback message has been sent  ','2024-10-08 07:32:36','127.0.0.1',1,10,'info','paper-plane'),(120,'Reviewer from Board members has been assigned ','2024-10-08 07:38:16','127.0.0.1',1,5,'warning','user'),(121,'A new feedback message has been sent  ','2024-10-08 07:39:49','127.0.0.1',1,5,'info','paper-plane'),(122,'Application has been added to  meeting agenda Melanie Faulkner','2024-10-09 12:14:45','127.0.0.1',1,1,'info','layers'),(123,'Application has been added to  meeting agenda Melanie Faulkner','2024-10-09 12:17:04','127.0.0.1',1,4,'info','layers'),(124,'Application has been added to  meeting agenda Kimberly Tate','2024-10-09 12:36:36','127.0.0.1',1,7,'info','layers'),(125,'Application has been added to  meeting agenda Kimberly Tate','2024-10-09 12:41:51','127.0.0.1',1,5,'info','layers'),(126,'Application has been added to  meeting agenda Kimberly Tate','2024-10-09 12:42:24','127.0.0.1',1,5,'info','layers'),(127,'Application has been added to  meeting agenda Kimberly Tate','2024-10-09 12:45:38','127.0.0.1',1,1,'info','layers'),(128,'A new feedback message has been sent  ','2024-10-09 12:46:58','127.0.0.1',2,1,'info','paper-plane'),(129,'A new feedback message has been sent  ','2024-10-09 12:47:22','127.0.0.1',2,1,'info','paper-plane');
/*!40000 ALTER TABLE `action_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amendment`
--

DROP TABLE IF EXISTS `amendment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amendment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `purpose` longtext COLLATE utf8mb4_unicode_ci,
  `changes` longtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_id` int DEFAULT NULL,
  `attachment_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4A7B3DDF4BBC2705` (`version_id`),
  KEY `IDX_4A7B3DDFDD9D915` (`attachment_type_id`),
  CONSTRAINT `FK_4A7B3DDF4BBC2705` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`),
  CONSTRAINT `FK_4A7B3DDFDD9D915` FOREIGN KEY (`attachment_type_id`) REFERENCES `attachment_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amendment`
--

LOCK TABLES `amendment` WRITE;
/*!40000 ALTER TABLE `amendment` DISABLE KEYS */;
/*!40000 ALTER TABLE `amendment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ibcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_exclusion_participant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submitted_by_id` int NOT NULL,
  `study_type_id` int DEFAULT NULL,
  `study_population_id` int NOT NULL,
  `participant_character_id` int NOT NULL,
  `ionizing_radiation_use_id` int NOT NULL,
  `investigational_new_drug_id` int NOT NULL,
  `proceedure_use_id` int DEFAULT NULL,
  `multi_site_collaboration_id` int NOT NULL,
  `financial_disclosure_id` int NOT NULL,
  `attachment_type_id` int DEFAULT NULL,
  `review_mode_id` int DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A45BDDC179F7D87D` (`submitted_by_id`),
  KEY `IDX_A45BDDC1F05971F1` (`study_type_id`),
  KEY `IDX_A45BDDC179AA6B8A` (`study_population_id`),
  KEY `IDX_A45BDDC18C1EFA27` (`participant_character_id`),
  KEY `IDX_A45BDDC191DE6045` (`ionizing_radiation_use_id`),
  KEY `IDX_A45BDDC1F449E2E3` (`investigational_new_drug_id`),
  KEY `IDX_A45BDDC1A3719DA7` (`proceedure_use_id`),
  KEY `IDX_A45BDDC14D78B112` (`multi_site_collaboration_id`),
  KEY `IDX_A45BDDC18A5089AE` (`financial_disclosure_id`),
  KEY `IDX_A45BDDC1DD9D915` (`attachment_type_id`),
  KEY `IDX_A45BDDC1EC0B31BD` (`review_mode_id`),
  KEY `IDX_A45BDDC16BF700BD` (`status_id`),
  CONSTRAINT `FK_A45BDDC14D78B112` FOREIGN KEY (`multi_site_collaboration_id`) REFERENCES `multi_site_collaboration` (`id`),
  CONSTRAINT `FK_A45BDDC16BF700BD` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `FK_A45BDDC179AA6B8A` FOREIGN KEY (`study_population_id`) REFERENCES `study_population` (`id`),
  CONSTRAINT `FK_A45BDDC179F7D87D` FOREIGN KEY (`submitted_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_A45BDDC18A5089AE` FOREIGN KEY (`financial_disclosure_id`) REFERENCES `financial_disclosure` (`id`),
  CONSTRAINT `FK_A45BDDC18C1EFA27` FOREIGN KEY (`participant_character_id`) REFERENCES `participant_character` (`id`),
  CONSTRAINT `FK_A45BDDC191DE6045` FOREIGN KEY (`ionizing_radiation_use_id`) REFERENCES `ionizing_radiation_use` (`id`),
  CONSTRAINT `FK_A45BDDC1A3719DA7` FOREIGN KEY (`proceedure_use_id`) REFERENCES `proceedure_use` (`id`),
  CONSTRAINT `FK_A45BDDC1DD9D915` FOREIGN KEY (`attachment_type_id`) REFERENCES `attachment_type` (`id`),
  CONSTRAINT `FK_A45BDDC1EC0B31BD` FOREIGN KEY (`review_mode_id`) REFERENCES `decision_type` (`id`),
  CONSTRAINT `FK_A45BDDC1F05971F1` FOREIGN KEY (`study_type_id`) REFERENCES `study_type` (`id`),
  CONSTRAINT `FK_A45BDDC1F449E2E3` FOREIGN KEY (`investigational_new_drug_id`) REFERENCES `investigational_new_drug` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1,'Prevalence and determinants of ccnce and determinants failure a','1976-04-01','1972-12-24','Est sapiente neque i',' One way to start is to report the average amount of time it takes to complete a course. But that doesn\'t tell the whole story because there will be differences in time spent depending on what students knew before beginning the course.Prevalence and determinants of ccnce and determinants failure a','2024-08-21 14:06:31',NULL,'EPHI-SERO-1-24',NULL,'/tmp/phpKwx38i',1,2,1,1,2,1,1,2,1,1,1,'4f32323f123f103f',12),(2,'Totam dolor ullamco','1982-08-30','1978-11-18','Aut accusamus dolore','Ex rerum vero anim s','2024-08-21 17:07:29',NULL,'EPHI-SERO-2-24',NULL,'/tmp/php3KX67R',1,2,2,1,2,1,1,2,1,1,3,'4f32323f123fe03f',7),(3,'Molestiae Nam ut per','2017-11-06','2013-06-21','Qui labore qui illo','Ullamco Nam magnam u','2024-08-21 17:14:36',NULL,'EPHI-SERO-3-24',NULL,'/tmp/php7V6prY',1,2,2,1,2,1,1,1,2,2,3,'4f32343f123fe03f',7),(4,'Special Resource Requirement Est similique conse Multi-site Collaboration','2002-01-09','2021-12-01','Corrupti est facil','Eius in Special Resource Requirement  eaque labore Multi-site Collaboration  Special Resource Requirement','2024-08-22 12:50:40',NULL,'EPHI-SERO-4-24',NULL,'/tmp/phpVxl07j',1,2,1,1,2,1,1,2,1,2,1,'4f3s323f123f103f',9),(5,'Throughout this lesson, you will learn to be critical of the analysis that happens \"under the hood\" and understand what the numbers actually mean.','1980-02-20','1999-03-14','Repellendus Hic aut','n the next lessons, you will learn how to use statistics to describe quantitative data. You\'ll gain insight into the process of how data is collected and how to answer questions using your data. Throughout this lesson, you will learn to be critical of the analysis that happens \"under the hood\" and understand what the numbers actually mean.','2024-08-25 20:34:12',NULL,'EPHI-SERO-5-24',NULL,'/tmp/phpqEscxT',1,1,2,1,2,1,1,2,2,1,2,'5f3s323f123f103f',12),(6,'Test tiltle for progress presentation for SERO','1986-10-23','2010-05-24','Facilis accusamus al','Voluptatem Et quam  Test tiltle for progress presentation for SEROTest tiltle for progress presentation for SEROTest tiltle for progress presentation for SERO','2024-08-26 07:39:59',NULL,'EPHI-SERO-6-24',NULL,'/tmp/phpDaSDLk',1,1,2,1,1,1,1,2,2,3,1,'25f3s323f123f103f',9),(7,'Nulla qui consequatAs an example of the analysis we do here at Udacity, we look at how long st zhljk sh jkhFS J;H','2017-11-08','1994-08-09','Veniam deleniti et','As an example of the analysis we do here at Udacity, we look at how long students take to complete one of our courses or programs. We try to provide an estimate of the number of hours or months that students will spend. One way to start is to report the average amount of time it takes to complete a course. But that doesn\'t tell the whole story because there will be differences in time spent depending on what students knew before beginning the course.As an example of the analysis we do here at Udacity, we look at how long students take to complete one of our courses or programs. We try to provide an estimate of the number of hours or months that students will spend. One way to start is to report the average amount of time it takes to complete a course. But that doesn\'t tell the whole story because there will be differences in time spent depending on what students knew before beginning the course.','2024-08-27 09:10:32',NULL,'EPHI-SERO-7-24',NULL,'/tmp/phpX3ugr3',1,1,2,1,1,1,1,2,2,1,3,'3f126678d62ae270fa89a4f67304a684',9),(8,'But that doesn\'t tell the whole story because there will be differences in time spent depending on what students knew before beginning the course.','1996-01-08','2023-09-27','Ut ex enim ut dicta','As an example of the analysis we do here at Udacity, we look at how long students take to complete one of our courses or programs. We try to provide an estimate of the number of hours or months that students will spend. One way to start is to report the average amount of time it takes to complete a course. But that doesn\'t tell the whole story because there will be differences in time spent depending on what students knew before beginning the course.','2024-08-27 09:13:26',NULL,'EPHI-SERO-8-24',NULL,'/tmp/phpnNlO2C',1,2,2,1,2,1,1,2,1,2,1,'94bbc564897030a5fc96c1fff6a770a7',4),(9,'Dume allan walker But that doesn\'t tell the whole story because there will be differences in time spent depending on what students knew before beginning the course.','2024-08-22','2024-08-29','AA','Dume allan walker But that doesn\'t tell the whole story because there will be differences in time spent depending on what students knew before beginning the course. Dume allan walker But that doesn\'t tell the whole story because there will be differences in time spent depending on what students knew before beginning the course. Dume allan walker But that doesn\'t tell the whole story because there will be differences in time spent depending on what students knew before beginning the course.','2024-08-27 11:33:15',NULL,'EPHI-SERO-9-24',NULL,'/tmp/phpIzqcPA',2,2,1,1,1,1,1,1,1,1,2,'caa8eaf4b0a85df654414e326aa9cb3d',9),(10,'Amet aut voluptate','1978-04-29','2010-09-24','Quam mollit odit sit','Aliquid lorem quaera','2024-10-01 07:58:28',NULL,'EPHI-SERO-10-24',NULL,'/tmp/phpdy1mX6',1,2,2,1,2,1,1,1,2,1,NULL,'93b0f65a566a3e24a28a0c91ffea2682',9);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_feedback`
--

DROP TABLE IF EXISTS `application_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `send_mail` tinyint(1) DEFAULT NULL,
  `allow_write` tinyint(1) DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_from_id` int DEFAULT NULL,
  `application_id` int DEFAULT NULL,
  `feedback_replay_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6D129B4BE997F9A8` (`feedback_from_id`),
  KEY `IDX_6D129B4B3E030ACD` (`application_id`),
  KEY `IDX_6D129B4BA628BD5A` (`feedback_replay_id`),
  CONSTRAINT `FK_6D129B4B3E030ACD` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`),
  CONSTRAINT `FK_6D129B4BA628BD5A` FOREIGN KEY (`feedback_replay_id`) REFERENCES `application_feedback` (`id`),
  CONSTRAINT `FK_6D129B4BE997F9A8` FOREIGN KEY (`feedback_from_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_feedback`
--

LOCK TABLES `application_feedback` WRITE;
/*!40000 ALTER TABLE `application_feedback` DISABLE KEYS */;
INSERT INTO `application_feedback` VALUES (1,'sda','2024-08-27 11:23:18',NULL,NULL,NULL,1,8,NULL),(2,'sda','2024-08-27 11:23:48',NULL,NULL,NULL,1,8,NULL),(3,'adasda','2024-08-27 11:24:04',NULL,NULL,NULL,1,8,NULL),(4,'dsda','2024-08-27 11:34:19',0,NULL,NULL,2,9,NULL),(5,'templates/sero/application/my_application.html.twig:88','2024-08-27 11:34:29',0,NULL,NULL,2,9,NULL),(6,'Manneh eski missing document lak','2024-08-27 11:35:22',0,NULL,NULL,1,9,NULL),(7,'Ere minun lakut hulunim and lay like yel?','2024-08-27 11:36:21',0,NULL,NULL,2,9,NULL),(8,'Denominator Taking burden','2024-08-27 11:59:15',0,NULL,NULL,2,9,NULL),(9,'Frefhvcdtuj','2024-08-27 12:00:31',0,NULL,NULL,2,9,NULL),(10,'Ato backe minew message alderesehim ende?','2024-08-27 12:04:39',NULL,NULL,NULL,2,9,NULL),(11,'Ere dersognal gin yalamualahew attcahment file aleh. silezih tolo asgeba','2024-08-27 12:05:13',NULL,NULL,NULL,1,9,NULL),(12,'dsa\r\ndsada','2024-08-27 12:39:35',NULL,NULL,NULL,1,9,NULL),(13,'dsdadasds','2024-08-27 17:30:02',NULL,NULL,NULL,1,9,NULL),(14,'Hoola','2024-08-30 08:31:11',NULL,NULL,NULL,1,4,NULL),(15,'Maneh sewye .\r\nyegodele file ale asgeba.','2024-08-30 08:35:39',NULL,NULL,NULL,1,3,NULL),(16,'fdjfdjg\'','2024-08-30 17:03:40',NULL,NULL,NULL,1,9,NULL),(17,'Hey','2024-09-04 07:22:05',NULL,NULL,NULL,1,9,NULL),(18,'hHey you , yes you. : You have been there for many times.','2024-09-04 07:32:53',NULL,NULL,NULL,1,9,NULL),(19,'Discuss as much as you need','2024-09-04 12:46:18',NULL,NULL,NULL,1,1,NULL),(20,'actionviz','2024-09-04 13:51:04',NULL,NULL,NULL,1,4,NULL),(21,'ethiojobs logo Find Jobs Find Companies Blog Contact Us Log In Sign up Employers, are you recruiting? Find your dream job Popular Search: Filter Jobs Key Words Key Words or Sorted by relevance Showing 1 to 2 of 2 matching Jobs Plus Easy Apply HEAD of IT 5 days ago by location Office location Deadline : August 30th 2024 Addis Ababa Plus Easy Apply IT Specialist 6 days ago by location Hybrid location Deadline : September 21st 2024 Addis Ababa Sign up Get personalized recommendation and apply for jobs. or Already have a Job Seeker Account ? Level up your job search Benefit icon Unique jobs in niche industries Benefit icon Set email job alerts & get personalized jobs Benefit icon Personalized job filters Benefit icon Showcase skills beyond a resume Benefit icon Let recruiters reach out to you Ethiojobs footer logo FAQ How to register How to apply for a job? How do I reset my password? How do I edit my CV on Ethiojobs? Job Seekers Find Jobs Register Post CVs Job Alerts Employers Login Register Post Jobs Features Contact us Meskel Flower Road Behind Nazra Hotel, Addis Ababa, Ethiopia +251-993-87-22-46 | +251-969-23-90-94 candidates@ethiojobs.net Subscribe to get updates from Ethiojobs ethiojob linkedIn link ethiojob youtube link ethiojob youtube link ethioj','2024-09-04 13:53:01',NULL,NULL,NULL,1,5,NULL),(22,'Test ethiojobs logo Find Jobs Find Companies Blog Contact Us Log In Sign up Employers, are you recruiting? Find your dream job Popular Search: Filter Jobs Key Words Key Words or Sorted by relevance Showing 1 to 2 of 2 matching Jobs Plus Easy Apply HEAD of IT 5 days ago by location Office location Deadline : August 30th 2024 Addis Ababa Plus Easy Apply IT Specialist 6 days ago by location Hybrid location Deadline : September 21st 2024 Addis Ababa Sign up Get personalized recommendation and apply for jobs. or Already have a Job Seeker Account ? Level up your job search Benefit icon Unique jobs in niche industries Benefit icon Set email job alerts & get personalized jobs Benefit icon Personalized job filters Benefit icon Showcase skills beyond a resume Benefit icon Let recruiters reach out to you Ethiojobs footer logo FAQ How to register How to apply for a job? How do I reset my password? How do I edit my CV on Ethiojobs? Job Seekers Find Jobs Register Post CVs Job Alerts Employers Login Register Post Jobs Features Contact us Meskel Flower Road Behind Nazra Hotel, Addis Ababa, Ethiopia +251-993-87-22-46 | +251-969-23-90-94 candidates@ethiojobs.net Subscribe to get updates from Ethiojobs ethiojob linkedIn link ethiojob youtube link ethiojob youtube link ethioj \r\ndsdad\r\n\r\nad\r\nad\r\na\r\nda\r\ndas\r\nda\r\ndethiojobs logo Find Jobs Find Companies Blog Contact Us Log In Sign up Employers, are you recruiting? Find your dream job Popular Search: Filter Jobs Key Words Key Words or Sorted by relevance Showing 1 to 2 of 2 matching Jobs Plus Easy Apply HEAD of IT 5 days ago by location Office location Deadline : August 30th 2024 Addis Ababa Plus Easy Apply IT Specialist 6 days ago by location Hybrid location Deadline : September 21st 2024 Addis Ababa Sign up Get personalized recommendation and apply for jobs. or Already have a Job Seeker Account ? Level up your job search Benefit icon Unique jobs in niche industries Benefit icon Set email job alerts & get personalized jobs Benefit icon Personalized job filters Benefit icon Showcase skills beyond a resume Benefit icon Let recruiters reach out to you Ethiojobs footer logo FAQ How to register How to apply for a job? How do I reset my password? How do I edit my CV on Ethiojobs? Job Seekers Find Jobs Register Post CVs Job Alerts Employers Login Register Post Jobs Features Contact us Meskel Flower Road Behind Nazra Hotel, Addis Ababa, Ethiopia +251-993-87-22-46 | +251-969-23-90-94 candidates@ethiojobs.net Subscribe to get updates from Ethiojobs ethiojob linkedIn link ethiojob youtube link ethiojob youtube link ethioj','2024-09-04 13:54:59',NULL,NULL,NULL,1,5,NULL),(23,'ethiojobs logo Find Jobs Find Companies Blog Contact Us Log In Sign up Employers, are you recruiting? Find your dream job Popular Search: Filter Jobs Key Words Key Words or Sorted by relevance Showing 1 to 2 of 2 matching Jobs Plus Ea','2024-09-04 13:57:01',NULL,NULL,NULL,1,7,NULL),(24,'Test homael and heminatos','2024-09-05 07:20:09',NULL,NULL,NULL,1,4,NULL),(25,'Hello I am here bro','2024-09-05 09:18:36',NULL,NULL,NULL,2,9,NULL),(26,'Feedback','2024-09-05 14:19:27',NULL,NULL,NULL,2,9,NULL),(27,'Review Mode revise yidereg','2024-09-25 09:03:20',NULL,NULL,NULL,1,9,NULL),(28,'dsda','2024-09-25 12:38:20',NULL,NULL,NULL,1,8,NULL),(29,'<script src=\"{{ asset(\'theme/assets/js/pages/custom/chat/chat.js\' ) }}\"></script>','2024-09-25 12:38:26',NULL,NULL,NULL,1,8,NULL),(30,'test','2024-09-25 12:38:34',NULL,NULL,NULL,1,8,NULL),(31,'Excepteur aut ipsam','2024-09-25 12:38:48',NULL,NULL,NULL,1,8,NULL),(32,'dsad','2024-09-25 12:42:08',NULL,NULL,NULL,1,8,NULL),(33,'test','2024-09-25 12:47:02',NULL,NULL,NULL,2,2,NULL),(34,'new test','2024-09-25 12:47:13',NULL,NULL,NULL,1,2,NULL),(35,'dasdas','2024-09-25 12:50:16',NULL,NULL,NULL,1,4,NULL),(36,'testos','2024-09-25 12:50:23',NULL,NULL,NULL,1,4,NULL),(37,'http://127.0.0.1:8008/en/protocol/4f3s323f123f103f/details','2024-09-25 12:50:48',NULL,NULL,NULL,2,4,NULL),(38,'Action Audit/ user actions and history\r\nCompliant management/reply and close\r\nReporting and dashboard\r\nSystem Setting/ Review forms/ and initial system data\r\nError and exception handling\r\nAmmendment request/approval\r\nContinuation request/approval\r\nRefinement\r\nUser feedbacks and compliants management','2024-09-25 12:52:04',NULL,NULL,NULL,2,4,NULL),(39,'sdfsf','2024-09-26 07:30:23',NULL,NULL,NULL,1,8,NULL),(40,'dsa','2024-09-26 12:07:21',NULL,NULL,NULL,1,4,NULL),(41,'Laudantium omnis ex','2024-09-26 12:11:03',NULL,NULL,NULL,1,4,NULL),(42,'Vero velit elit in','2024-09-26 12:13:57',NULL,NULL,NULL,1,4,NULL),(43,'dfs','2024-09-28 09:04:29',NULL,NULL,NULL,2,9,NULL),(44,'dsadasdadasdadasdasdasdas sad asd asd asd asd sd as das das das das das das dasdsdadsadsdad a dDAS DAD','2024-09-28 09:22:30',NULL,NULL,NULL,2,9,NULL),(45,'dsd\r\ndsd','2024-09-30 09:12:46',NULL,NULL,NULL,1,7,NULL),(46,'dsdasdasd									{% if checklist_group.reviewChecklists|filter(checklist => checklist.reviewForm != review_assignment.reviewForm)|length == 0 %}','2024-09-30 09:12:59',NULL,NULL,NULL,1,7,NULL),(47,'http://127.0.0.1:8008/en/protocol/3f126678d62ae270fa89a4f67304a684/details','2024-09-30 09:13:33',NULL,NULL,NULL,2,7,NULL),(48,'asdesach zena alegn.\r\nasdesach zena alegn','2024-09-30 09:14:56',NULL,NULL,NULL,2,7,NULL),(49,'Oh eski enismmawa','2024-09-30 09:15:41',NULL,NULL,NULL,1,7,NULL),(50,'kl\r\ngeegsn\r\nm,m,','2024-09-30 11:23:28',NULL,NULL,NULL,1,4,NULL),(51,'Exercitationem sapie DSdka\r\nasdasdakjasdkjadhK\r\nASD','2024-10-08 07:32:36',NULL,NULL,NULL,1,10,NULL),(52,'SDSJF;LSDK\r\nSDFKLJSD;KLFJAS\r\nASDFSDJLKHJKLDF\r\nASDF','2024-10-08 07:39:49',NULL,NULL,NULL,1,5,NULL),(53,'DIscussion add argilign ebakih.','2024-10-09 12:46:58',NULL,NULL,NULL,2,1,NULL),(54,'fdsf\r\nsad','2024-10-09 12:47:22',NULL,NULL,NULL,2,1,NULL);
/*!40000 ALTER TABLE `application_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_review`
--

DROP TABLE IF EXISTS `application_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `checked` tinyint(1) DEFAULT NULL,
  `application_id` int NOT NULL,
  `review_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C9708D033E030ACD` (`application_id`),
  KEY `IDX_C9708D033E2E969B` (`review_id`),
  CONSTRAINT `FK_C9708D033E030ACD` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`),
  CONSTRAINT `FK_C9708D033E2E969B` FOREIGN KEY (`review_id`) REFERENCES `review_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_review`
--

LOCK TABLES `application_review` WRITE;
/*!40000 ALTER TABLE `application_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_special_res_requirement`
--

DROP TABLE IF EXISTS `application_special_res_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_special_res_requirement` (
  `application_id` int NOT NULL,
  `special_res_requirement_id` int NOT NULL,
  PRIMARY KEY (`application_id`,`special_res_requirement_id`),
  KEY `IDX_847584063E030ACD` (`application_id`),
  KEY `IDX_84758406921B189D` (`special_res_requirement_id`),
  CONSTRAINT `FK_847584063E030ACD` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_84758406921B189D` FOREIGN KEY (`special_res_requirement_id`) REFERENCES `special_res_requirement` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_special_res_requirement`
--

LOCK TABLES `application_special_res_requirement` WRITE;
/*!40000 ALTER TABLE `application_special_res_requirement` DISABLE KEYS */;
INSERT INTO `application_special_res_requirement` VALUES (1,2),(2,2),(3,2),(4,2),(5,2),(6,1),(7,2),(8,2),(9,1),(10,2);
/*!40000 ALTER TABLE `application_special_res_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_type`
--

DROP TABLE IF EXISTS `application_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_type`
--

LOCK TABLES `application_type` WRITE;
/*!40000 ALTER TABLE `application_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `protocol_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_795FD9BBCCD59258` (`protocol_id`),
  CONSTRAINT `FK_795FD9BBCCD59258` FOREIGN KEY (`protocol_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment_type`
--

DROP TABLE IF EXISTS `attachment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachment_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_74AD4316464E68B` (`attachment_id`),
  CONSTRAINT `FK_74AD4316464E68B` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment_type`
--

LOCK TABLES `attachment_type` WRITE;
/*!40000 ALTER TABLE `attachment_type` DISABLE KEYS */;
INSERT INTO `attachment_type` VALUES (1,'Full Original Protocol',NULL),(2,'ICF',NULL),(3,'New version',NULL);
/*!40000 ALTER TABLE `attachment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_member`
--

DROP TABLE IF EXISTS `board_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assigned_at` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `assigned_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DCFABEDFA76ED395` (`user_id`),
  KEY `IDX_DCFABEDF6E6F1246` (`assigned_by_id`),
  CONSTRAINT `FK_DCFABEDF6E6F1246` FOREIGN KEY (`assigned_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_DCFABEDFA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_member`
--

LOCK TABLES `board_member` WRITE;
/*!40000 ALTER TABLE `board_member` DISABLE KEYS */;
INSERT INTO `board_member` VALUES (1,NULL,NULL,'Director General',1,1),(2,NULL,NULL,'ROLE_CHAIR',2,2);
/*!40000 ALTER TABLE `board_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choice`
--

DROP TABLE IF EXISTS `choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `choice_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_list_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C1AB5A927BB2580B` (`check_list_id`),
  CONSTRAINT `FK_C1AB5A927BB2580B` FOREIGN KEY (`check_list_id`) REFERENCES `review_checklist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choice`
--

LOCK TABLES `choice` WRITE;
/*!40000 ALTER TABLE `choice` DISABLE KEYS */;
INSERT INTO `choice` VALUES (1,'Clear',1),(2,'Unclear',1),(3,'Clear',2),(4,'Unclear',2),(5,'Sufficient',3),(6,'Insufficient',3),(7,'Yes',4),(8,'No',4),(9,'Don’t know',4),(10,'Clear',5),(11,'Unclear',5),(12,'Clear',6),(13,'Unclear',6),(14,'Yes',7),(15,'No',7),(16,'Not applicable',7),(17,'Yes',8),(18,'No',8),(19,'Not required',8),(20,'Yes',9),(21,'No',9),(22,'Justified',10),(23,'Not justified',10),(24,'Not Applicable',10),(25,'Yes',11),(26,'No',11),(27,'Not applicable',11),(28,'Appropriate',12),(29,'Inappropriate',12),(30,'Not applicable',12),(31,'Appropriate',13),(32,'Inappropriate',13),(33,'Not applicable',13),(34,'Clear',14),(35,'Unclear',14),(36,'Yes',15),(37,'No',15),(38,'Yes',16),(39,'No',16),(40,'Yes',17),(41,'No',17),(42,'Yes',18),(43,'No',18),(44,'Relevant issues addressed',19),(45,'Relevant issues not addressed',19),(46,'Yes',20),(47,'No',20),(48,'Appropriate',21),(49,'Inappropriate',21),(50,'Appropriate',22),(51,'Inappropriate',22),(52,'Unlikely',23),(53,'Likely',23),(54,'Yes',24),(55,'No',24),(56,'Described',25),(57,'Not Described',25),(58,'Yes',26),(59,'No',26),(60,'Yes',27),(61,'No',27),(62,'Minimal risk',28),(63,'Greater than minimal risk but presenting the prospect of direct benefit to the individual study participant',28),(64,'Greater than minimal risk and no direct benefit to the individual study participant but likely to yield generalizable knowledge about participant’s disorder or condition',28),(65,'Outside those mentioned above',28),(66,'Yes',29),(67,'No',29),(68,'Appropriate',30),(69,'Inappropriate',30),(70,'Appropriate',31),(71,'Inappropriate',31),(72,'Yes',32),(73,'No',32),(74,'Yes',33),(75,'No',33),(76,'Yes',34),(77,'No',34),(78,'Justified',35),(79,'Not justified',35),(80,'Sufficient',36),(81,'Not sufficient',36),(82,'Yes',37),(83,'No',37),(84,'Yes',38),(85,'No',38),(86,'Yes',39),(87,'No',39),(88,'Yes',40),(89,'No',40),(90,'Appropriate',41),(91,'Inappropriate',41),(92,'Yes',42),(93,'No',42),(94,'Yes',43),(95,'No',43),(96,'Yes',44),(97,'No',44),(98,'Not Applicable',44),(99,'Yes',45),(100,'No',45),(101,'Declared',46),(102,'Not Declared',46),(103,'Yes',47),(104,'No',47),(105,'Methodology',48),(106,'Introduction',48),(107,'Results',48),(108,'Findings',48);
/*!40000 ALTER TABLE `choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliant`
--

DROP TABLE IF EXISTS `compliant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compliant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `solved` tinyint(1) DEFAULT NULL,
  `replied_by_id` int DEFAULT NULL,
  `replied_to_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_94804BE2D6FBBEB5` (`replied_by_id`),
  KEY `IDX_94804BE24C29D4D4` (`replied_to_id`),
  CONSTRAINT `FK_94804BE24C29D4D4` FOREIGN KEY (`replied_to_id`) REFERENCES `compliant` (`id`),
  CONSTRAINT `FK_94804BE2D6FBBEB5` FOREIGN KEY (`replied_by_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliant`
--

LOCK TABLES `compliant` WRITE;
/*!40000 ALTER TABLE `compliant` DISABLE KEYS */;
INSERT INTO `compliant` VALUES (2,'Sade Boone','pamuhivyt@mailinator.com','Quia reprehenderit','2024-09-24 08:56:48',NULL,NULL,NULL),(3,'Stewart Bradshaw','myjy@mailinator.com','Eum et fugit recusa','2024-09-24 08:57:04',NULL,NULL,NULL);
/*!40000 ALTER TABLE `compliant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `continuation`
--

DROP TABLE IF EXISTS `continuation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `continuation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `requested_at` datetime NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `approved` tinyint(1) DEFAULT NULL,
  `application_id` int NOT NULL,
  `requested_by_id` int DEFAULT NULL,
  `approved_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_85F00E873E030ACD` (`application_id`),
  KEY `IDX_85F00E874DA1E751` (`requested_by_id`),
  KEY `IDX_85F00E872D234F6A` (`approved_by_id`),
  CONSTRAINT `FK_85F00E872D234F6A` FOREIGN KEY (`approved_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_85F00E873E030ACD` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`),
  CONSTRAINT `FK_85F00E874DA1E751` FOREIGN KEY (`requested_by_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continuation`
--

LOCK TABLES `continuation` WRITE;
/*!40000 ALTER TABLE `continuation` DISABLE KEYS */;
/*!40000 ALTER TABLE `continuation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decision_type`
--

DROP TABLE IF EXISTS `decision_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decision_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decision_type`
--

LOCK TABLES `decision_type` WRITE;
/*!40000 ALTER TABLE `decision_type` DISABLE KEYS */;
INSERT INTO `decision_type` VALUES (1,'Exempted','exempted','2024-08-21 17:28:44','success','EXEMPTED'),(2,'Expedited',NULL,'2024-08-21 17:30:23','primary','expedited'),(3,'Full board',NULL,'2024-08-21 17:30:34','warning','full-board');
/*!40000 ALTER TABLE `decision_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directorate`
--

DROP TABLE IF EXISTS `directorate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directorate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `acronym` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directorate`
--

LOCK TABLES `directorate` WRITE;
/*!40000 ALTER TABLE `directorate` DISABLE KEYS */;
INSERT INTO `directorate` VALUES (1,'SERO','Scientific and Ethical Review Office','2024-08-21 17:00:04','SERO',NULL),(2,'PHEM',NULL,'2024-08-21 17:00:14','PHEM',NULL);
/*!40000 ALTER TABLE `directorate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadables`
--

DROP TABLE IF EXISTS `downloadables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `uploaded_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2BC1506FA2B28FE8` (`uploaded_by_id`),
  CONSTRAINT `FK_2BC1506FA2B28FE8` FOREIGN KEY (`uploaded_by_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadables`
--

LOCK TABLES `downloadables` WRITE;
/*!40000 ALTER TABLE `downloadables` DISABLE KEYS */;
INSERT INTO `downloadables` VALUES (1,'Final Report Writing Form','Final Report Writing Form6e0d9aa7fc7aed29f12c8e7d573fa5b6.docx','Ethiopian Public Health Institute\r\nInstitutional Review Board (EPHI-IRB)\r\n\r\nFinal Report Writing Form','2024-09-25 09:49:34',1);
/*!40000 ALTER TABLE `downloadables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_message`
--

DROP TABLE IF EXISTS `email_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_message`
--

LOCK TABLES `email_message` WRITE;
/*!40000 ALTER TABLE `email_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `sent_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D2294458A45BB98C` (`sent_by_id`),
  CONSTRAINT `FK_D2294458A45BB98C` FOREIGN KEY (`sent_by_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_disclosure`
--

DROP TABLE IF EXISTS `financial_disclosure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_disclosure` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_disclosure`
--

LOCK TABLES `financial_disclosure` WRITE;
/*!40000 ALTER TABLE `financial_disclosure` DISABLE KEYS */;
INSERT INTO `financial_disclosure` VALUES (1,'Not funded'),(2,'self funded');
/*!40000 ALTER TABLE `financial_disclosure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icf`
--

DROP TABLE IF EXISTS `icf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `icf` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `version_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `application_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5246D5B43E030ACD` (`application_id`),
  CONSTRAINT `FK_5246D5B43E030ACD` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icf`
--

LOCK TABLES `icf` WRITE;
/*!40000 ALTER TABLE `icf` DISABLE KEYS */;
/*!40000 ALTER TABLE `icf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investigational_new_drug`
--

DROP TABLE IF EXISTS `investigational_new_drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investigational_new_drug` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investigational_new_drug`
--

LOCK TABLES `investigational_new_drug` WRITE;
/*!40000 ALTER TABLE `investigational_new_drug` DISABLE KEYS */;
INSERT INTO `investigational_new_drug` VALUES (1,'Inverstigaed a new');
/*!40000 ALTER TABLE `investigational_new_drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ionizing_radiation_use`
--

DROP TABLE IF EXISTS `ionizing_radiation_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ionizing_radiation_use` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ionizing_radiation_use`
--

LOCK TABLES `ionizing_radiation_use` WRITE;
/*!40000 ALTER TABLE `ionizing_radiation_use` DISABLE KEYS */;
INSERT INTO `ionizing_radiation_use` VALUES (1,'Full'),(2,'None');
/*!40000 ALTER TABLE `ionizing_radiation_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irb_certificate`
--

DROP TABLE IF EXISTS `irb_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `irb_certificate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `approved_at` datetime DEFAULT NULL,
  `certificate_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid_until` date NOT NULL,
  `irb_application_id` int DEFAULT NULL,
  `approved_by_id` int DEFAULT NULL,
  `version_id` int DEFAULT NULL,
  `valid_from` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_82C5E74D4313BD05` (`irb_application_id`),
  KEY `IDX_82C5E74D2D234F6A` (`approved_by_id`),
  KEY `IDX_82C5E74D4BBC2705` (`version_id`),
  CONSTRAINT `FK_82C5E74D2D234F6A` FOREIGN KEY (`approved_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_82C5E74D4313BD05` FOREIGN KEY (`irb_application_id`) REFERENCES `application` (`id`),
  CONSTRAINT `FK_82C5E74D4BBC2705` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irb_certificate`
--

LOCK TABLES `irb_certificate` WRITE;
/*!40000 ALTER TABLE `irb_certificate` DISABLE KEYS */;
INSERT INTO `irb_certificate` VALUES (1,'2024-08-23 09:29:45','SERO-EPHI-1-24','2025-02-23',3,1,3,'2024-08-23'),(2,'2024-08-23 10:03:10','SERO-EPHI-2-24','2025-02-23',3,1,3,'2024-08-23'),(3,'2024-08-23 10:17:16','SERO-EPHI-3-24','2025-02-23',4,1,4,'2024-08-23'),(4,'2024-08-23 10:24:06','SERO-EPHI-4-24','2025-02-23',4,1,4,'2024-08-23'),(5,'2024-08-23 10:27:40','SERO-EPHI-5-24','2025-02-23',4,1,4,'2024-08-23'),(6,'2024-08-23 10:42:45','SERO-EPHI-6-24','2025-02-23',1,1,1,'2024-08-23'),(7,'2024-08-23 10:55:12','SERO-EPHI-7-24','2025-02-23',3,1,3,'2024-08-23'),(8,'2024-08-23 12:39:29','SERO-EPHI-8-24','2025-02-23',3,1,3,'2024-08-23'),(9,'2024-08-24 17:22:47','SERO-EPHI-9-24','2025-02-24',1,NULL,1,'2024-08-24'),(10,'2024-08-25 06:06:44','SERO-EPHI-10-24','2025-02-25',4,1,4,'2024-08-25'),(11,'2024-08-25 18:42:06','SERO-EPHI-11-24','2025-02-25',4,1,4,'2024-08-25'),(12,'2024-08-25 18:42:19','SERO-EPHI-12-24','2025-02-25',4,1,6,'2024-08-25'),(13,'2024-08-26 08:13:36','SERO-EPHI-13-24','2025-02-26',6,1,8,'2024-08-26'),(14,'2024-08-26 08:13:37','SERO-EPHI-14-24','2025-02-26',6,1,8,'2024-08-26'),(15,'2024-10-08 08:09:58','SERO-EPHI-15-24','2025-04-08',9,1,16,'2024-10-08'),(16,'2024-10-08 08:10:42','SERO-EPHI-16-24','2025-04-08',10,1,28,'2024-10-08'),(17,'2024-10-08 08:11:39','SERO-EPHI-17-24','2025-04-08',10,1,28,'2024-10-08'),(18,'2024-10-08 08:17:38','SERO-EPHI-18-24','2025-04-08',10,1,28,'2024-10-08'),(19,'2024-10-08 08:17:59','SERO-EPHI-19-24','2025-04-08',10,1,28,'2024-10-08'),(20,'2024-10-08 08:18:27','SERO-EPHI-20-24','2025-04-08',10,1,28,'2024-10-08'),(21,'2024-10-08 08:18:39','SERO-EPHI-21-24','2025-04-08',10,1,28,'2024-10-08'),(22,'2024-10-08 08:19:10','SERO-EPHI-22-24','2025-04-08',10,1,28,'2024-10-08'),(23,'2024-10-08 08:20:19','SERO-EPHI-23-24','2025-04-08',10,1,28,'2024-10-08'),(24,'2024-10-08 08:20:34','SERO-EPHI-24-24','2025-04-08',10,1,28,'2024-10-08'),(25,'2024-10-08 08:20:49','SERO-EPHI-25-24','2025-04-08',10,1,28,'2024-10-08'),(26,'2024-10-08 08:22:11','SERO-EPHI-26-24','2025-04-08',10,1,28,'2024-10-08'),(27,'2024-10-08 08:22:20','SERO-EPHI-27-24','2025-04-08',10,1,28,'2024-10-08'),(28,'2024-10-08 08:22:27','SERO-EPHI-28-24','2025-04-08',10,1,28,'2024-10-08'),(29,'2024-10-08 08:22:51','SERO-EPHI-29-24','2025-04-08',10,1,28,'2024-10-08'),(30,'2024-10-08 08:23:10','SERO-EPHI-30-24','2025-04-08',10,1,28,'2024-10-08'),(31,'2024-10-08 08:23:19','SERO-EPHI-31-24','2025-04-08',10,1,28,'2024-10-08'),(32,'2024-10-08 08:23:24','SERO-EPHI-32-24','2025-04-08',10,1,28,'2024-10-08'),(33,'2024-10-08 08:23:36','SERO-EPHI-33-24','2025-04-08',10,1,28,'2024-10-08'),(34,'2024-10-08 08:23:48','SERO-EPHI-34-24','2025-04-08',10,1,28,'2024-10-08'),(35,'2024-10-08 08:24:16','SERO-EPHI-35-24','2025-04-08',10,1,28,'2024-10-08'),(36,'2024-10-08 08:24:38','SERO-EPHI-36-24','2025-04-08',10,1,28,'2024-10-08'),(37,'2024-10-08 08:24:47','SERO-EPHI-37-24','2025-04-08',10,1,28,'2024-10-08'),(38,'2024-10-08 08:24:53','SERO-EPHI-38-24','2025-04-08',10,1,28,'2024-10-08'),(39,'2024-10-08 08:24:57','SERO-EPHI-39-24','2025-04-08',10,1,28,'2024-10-08'),(40,'2024-10-08 08:25:03','SERO-EPHI-40-24','2025-04-08',10,1,28,'2024-10-08'),(41,'2024-10-08 08:25:09','SERO-EPHI-41-24','2025-04-08',10,1,28,'2024-10-08'),(42,'2024-10-08 08:25:16','SERO-EPHI-42-24','2025-04-08',10,1,28,'2024-10-08'),(43,'2024-10-08 08:25:22','SERO-EPHI-43-24','2025-04-08',10,1,28,'2024-10-08'),(44,'2024-10-08 08:25:29','SERO-EPHI-44-24','2025-04-08',10,1,28,'2024-10-08'),(45,'2024-10-08 08:25:33','SERO-EPHI-45-24','2025-04-08',10,1,28,'2024-10-08'),(46,'2024-10-08 08:25:54','SERO-EPHI-46-24','2025-04-08',10,1,28,'2024-10-08'),(47,'2024-10-08 08:27:00','SERO-EPHI-47-24','2025-04-08',10,1,28,'2024-10-08'),(48,'2024-10-08 08:27:32','SERO-EPHI-48-24','2025-04-08',10,1,28,'2024-10-08'),(49,'2024-10-08 08:27:40','SERO-EPHI-49-24','2025-04-08',10,1,28,'2024-10-08'),(50,'2024-10-08 08:28:12','SERO-EPHI-50-24','2025-04-08',10,1,28,'2024-10-08'),(51,'2024-10-08 08:28:56','SERO-EPHI-51-24','2025-04-08',10,1,28,'2024-10-08'),(52,'2024-10-08 08:29:06','SERO-EPHI-52-24','2025-04-08',10,1,28,'2024-10-08'),(53,'2024-10-08 08:29:24','SERO-EPHI-53-24','2025-04-08',10,1,28,'2024-10-08'),(54,'2024-10-08 08:29:51','SERO-EPHI-54-24','2025-04-08',10,1,28,'2024-10-08'),(55,'2024-10-08 08:51:35','SERO-EPHI-55-24','2025-04-08',5,1,24,'2024-10-08'),(56,'2024-10-08 08:54:49','SERO-EPHI-56-24','2025-04-08',5,1,24,'2024-10-08'),(57,'2024-10-08 08:55:22','SERO-EPHI-57-24','2025-04-08',5,1,24,'2024-10-08'),(58,'2024-10-08 09:07:26','SERO-EPHI-58-24','2025-04-08',10,1,28,'2024-10-08'),(59,'2024-10-08 09:07:52','SERO-EPHI-59-24','2025-04-08',10,1,28,'2024-10-08'),(60,'2024-10-08 09:07:54','SERO-EPHI-60-24','2025-04-08',10,1,28,'2024-10-08'),(61,'2024-10-08 11:34:50','SERO-EPHI-61-24','2025-04-08',9,1,17,'2024-10-08'),(62,'2024-10-08 11:35:01','SERO-EPHI-62-24','2025-04-08',8,1,26,'2024-10-08'),(63,'2024-10-08 11:51:16','SERO-EPHI-63-24','2025-04-08',1,1,23,'2024-10-08'),(64,'2024-10-08 11:51:26','SERO-EPHI-64-24','2025-04-08',1,1,23,'2024-10-08'),(65,'2024-10-08 12:19:41','SERO-EPHI-65-24','2025-04-08',8,1,26,'2024-10-08'),(66,'2024-10-08 12:36:34','SERO-EPHI-66-24','2025-04-08',7,1,25,'2024-10-08'),(67,'2024-10-08 13:25:26','SERO-EPHI-67-24','2025-04-08',9,1,17,'2024-10-08'),(68,'2024-10-08 13:25:38','SERO-EPHI-68-24','2025-04-08',5,1,24,'2024-10-08'),(69,'2024-10-09 06:38:01','SERO-EPHI-69-24','2025-04-09',1,NULL,23,'2024-10-09'),(70,'2024-10-09 06:44:17','SERO-EPHI-70-24','2025-04-09',9,1,17,'2024-10-09'),(71,'2024-10-09 06:44:27','SERO-EPHI-71-24','2025-04-09',10,1,28,'2024-10-09'),(72,'2024-10-09 06:45:32','SERO-EPHI-72-24','2025-04-09',10,1,28,'2024-10-09'),(73,'2024-10-09 06:50:54','SERO-EPHI-73-24','2025-04-09',10,2,28,'2024-10-09'),(74,'2024-10-09 06:54:18','SERO-EPHI-74-24','2025-04-09',9,1,17,'2024-10-09'),(75,'2024-10-09 06:54:32','SERO-EPHI-75-24','2025-04-09',10,1,28,'2024-10-09'),(76,'2024-10-09 07:08:45','SERO-EPHI-76-24','2025-04-09',10,1,28,'2024-10-09'),(77,'2024-10-09 07:12:16','SERO-EPHI-77-24','2025-04-09',10,2,28,'2024-10-09'),(78,'2024-10-09 07:12:27','SERO-EPHI-78-24','2025-04-09',9,2,17,'2024-10-09'),(79,'2024-10-09 07:13:10','SERO-EPHI-79-24','2025-04-09',10,1,28,'2024-10-09'),(80,'2024-10-09 07:16:35','SERO-EPHI-80-24','2025-04-09',9,1,17,'2024-10-09'),(81,'2024-10-09 07:16:57','SERO-EPHI-81-24','2025-04-09',9,2,17,'2024-10-09'),(82,'2024-10-09 11:24:47','SERO-EPHI-82-24','2025-04-09',10,1,28,'2024-10-09'),(83,'2024-10-09 16:32:10','SERO-EPHI-83-24','2025-04-09',9,2,17,'2024-10-09');
/*!40000 ALTER TABLE `irb_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `held_at` datetime DEFAULT NULL,
  `status` int NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `minute_taken_at` datetime DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `minute_taken_by_id` int DEFAULT NULL,
  `meeting_schedule_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F515E139B03A8386` (`created_by_id`),
  KEY `IDX_F515E1399FB7315A` (`minute_taken_by_id`),
  KEY `IDX_F515E139886BCCA0` (`meeting_schedule_id`),
  CONSTRAINT `FK_F515E139886BCCA0` FOREIGN KEY (`meeting_schedule_id`) REFERENCES `meeting_schedule` (`id`),
  CONSTRAINT `FK_F515E1399FB7315A` FOREIGN KEY (`minute_taken_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_F515E139B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting`
--

LOCK TABLES `meeting` WRITE;
/*!40000 ALTER TABLE `meeting` DISABLE KEYS */;
INSERT INTO `meeting` VALUES (1,'601','2000-01-08 19:47:00',1,'Error deserunt saepe','2024-10-09 12:13:03',1,1,6),(2,'743','2015-02-04 20:02:00',1,'Molestiae sunt aute','2024-09-25 08:53:05',1,1,7);
/*!40000 ALTER TABLE `meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_board_member`
--

DROP TABLE IF EXISTS `meeting_board_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_board_member` (
  `meeting_id` int NOT NULL,
  `board_member_id` int NOT NULL,
  PRIMARY KEY (`meeting_id`,`board_member_id`),
  KEY `IDX_FCB95B6267433D9C` (`meeting_id`),
  KEY `IDX_FCB95B62C7BA2FD5` (`board_member_id`),
  CONSTRAINT `FK_FCB95B6267433D9C` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_FCB95B62C7BA2FD5` FOREIGN KEY (`board_member_id`) REFERENCES `board_member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_board_member`
--

LOCK TABLES `meeting_board_member` WRITE;
/*!40000 ALTER TABLE `meeting_board_member` DISABLE KEYS */;
INSERT INTO `meeting_board_member` VALUES (1,1),(1,2),(2,2);
/*!40000 ALTER TABLE `meeting_board_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_schedule`
--

DROP TABLE IF EXISTS `meeting_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C9A93C2EB03A8386` (`created_by_id`),
  CONSTRAINT `FK_C9A93C2EB03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_schedule`
--

LOCK TABLES `meeting_schedule` WRITE;
/*!40000 ALTER TABLE `meeting_schedule` DISABLE KEYS */;
INSERT INTO `meeting_schedule` VALUES (1,'Annual meeting first half of September','2024-09-07 00:00:00','2024-09-07 00:00:00',NULL),(2,'Augst second round meeting','2024-08-24 00:00:00','2024-08-24 00:00:00',NULL),(3,'September 21  meeting schedule','2024-09-21 00:00:00','2024-09-21 00:00:00',NULL),(4,'Kimberly Tate','2024-10-10 00:00:00','2024-10-10 00:00:00',NULL),(5,'Melanie Faulkner','2024-10-17 00:00:00','2024-10-17 00:00:00',NULL),(6,'System Setting/ Review forms/ and initial system data System Setting/ Review forms/ and initial system data','2024-11-01 00:00:00','2024-11-01 00:00:00',NULL),(7,'test','2024-10-31 00:00:00','2024-10-31 00:00:00',NULL);
/*!40000 ALTER TABLE `meeting_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_schedule_application`
--

DROP TABLE IF EXISTS `meeting_schedule_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_schedule_application` (
  `meeting_schedule_id` int NOT NULL,
  `application_id` int NOT NULL,
  PRIMARY KEY (`meeting_schedule_id`,`application_id`),
  KEY `IDX_68BF2A0A886BCCA0` (`meeting_schedule_id`),
  KEY `IDX_68BF2A0A3E030ACD` (`application_id`),
  CONSTRAINT `FK_68BF2A0A3E030ACD` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_68BF2A0A886BCCA0` FOREIGN KEY (`meeting_schedule_id`) REFERENCES `meeting_schedule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_schedule_application`
--

LOCK TABLES `meeting_schedule_application` WRITE;
/*!40000 ALTER TABLE `meeting_schedule_application` DISABLE KEYS */;
INSERT INTO `meeting_schedule_application` VALUES (4,1),(4,5),(4,7),(5,1),(5,4),(5,10),(6,1),(6,6),(6,9),(7,8),(7,9);
/*!40000 ALTER TABLE `meeting_schedule_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_version`
--

DROP TABLE IF EXISTS `meeting_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_version` (
  `meeting_id` int NOT NULL,
  `version_id` int NOT NULL,
  PRIMARY KEY (`meeting_id`,`version_id`),
  KEY `IDX_27CE9B4E67433D9C` (`meeting_id`),
  KEY `IDX_27CE9B4E4BBC2705` (`version_id`),
  CONSTRAINT `FK_27CE9B4E4BBC2705` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_27CE9B4E67433D9C` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_version`
--

LOCK TABLES `meeting_version` WRITE;
/*!40000 ALTER TABLE `meeting_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multi_site_collaboration`
--

DROP TABLE IF EXISTS `multi_site_collaboration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multi_site_collaboration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multi_site_collaboration`
--

LOCK TABLES `multi_site_collaboration` WRITE;
/*!40000 ALTER TABLE `multi_site_collaboration` DISABLE KEYS */;
INSERT INTO `multi_site_collaboration` VALUES (1,'Used'),(2,'Partial');
/*!40000 ALTER TABLE `multi_site_collaboration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant_character`
--

DROP TABLE IF EXISTS `participant_character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participant_character` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_character`
--

LOCK TABLES `participant_character` WRITE;
/*!40000 ALTER TABLE `participant_character` DISABLE KEYS */;
INSERT INTO `participant_character` VALUES (1,'Normal');
/*!40000 ALTER TABLE `participant_character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participating_investigator`
--

DROP TABLE IF EXISTS `participating_investigator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participating_investigator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `licence_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institution` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B8C6A3423E030ACD` (`application_id`),
  CONSTRAINT `FK_B8C6A3423E030ACD` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participating_investigator`
--

LOCK TABLES `participating_investigator` WRITE;
/*!40000 ALTER TABLE `participating_investigator` DISABLE KEYS */;
INSERT INTO `participating_investigator` VALUES (1,'Flynn Todd','312','Pariatur Cumque par','+1 (533) 396-9315','gyqosot@mailinator.com',1),(2,'Yoshio Castro','138','Quis sapiente ullam','+1 (209) 668-6451','mehy@mailinator.com',1),(3,'Russell Cervantes','49','Veritatis non volupt','+1 (447) 686-4356','toseq@mailinator.com',1),(4,'Neville Holder','178','Mollit nulla libero','+1 (859) 745-2778','sipema@mailinator.com',1),(5,'Harriet Gillespie','885','A sint labore commod','+1 (992) 622-8606','segymuwu@mailinator.com',2),(6,'Fritz Simmons','567','Labore commodi persp','+1 (402) 117-2922','pawucy@mailinator.com',2),(7,'Damon Strong','508','Vel hic in porro rer','+1 (568) 832-2611','puxunol@mailinator.com',2),(8,'Sacha Fitzpatrick','961','Quia numquam ratione','+1 (526) 847-5267','jycowedave@mailinator.com',2),(9,'Kasper Prince','492','Asperiores reiciendi','+1 (768) 287-3898','bywykoloci@mailinator.com',3),(10,'Sharon Hansen','207','Ducimus ipsum sed','+1 (193) 314-4178','zuqemuzim@mailinator.com',3),(11,'Lawrence Boyd','950','Qui incidunt dolori','+1 (604) 548-9151','coxefi@mailinator.com',3),(12,'Mercedes Hicks','43','Suscipit dolorum fug','+1 (576) 824-2263','ranefeqyxe@mailinator.com',4),(13,'Ocean Coleman','714','Quia sunt sint mini','+1 (494) 895-2294','neqo@mailinator.com',4),(14,'Kiayada Chang','466','Nihil rem dolorem po','+1 (497) 221-1101','caquzuce@mailinator.com',4),(15,'Nadine Rodriguez','373','Quos quia non nemo q','+1 (468) 531-5928','riqapywor@mailinator.com',5),(16,'Erin Norman','301','Omnis quisquam sint','+1 (356) 482-3089','judy@mailinator.com',5),(17,'Patience Jimenez','303','A ad ut illo sed vol','+1 (506) 585-8441','myviloc@mailinator.com',5),(18,'Grant Potts','432','Tenetur esse eligend','+1 (294) 515-5408','tidifa@mailinator.com',5),(19,'Noelani Horne','710','Sunt neque molestiae','+1 (251) 185-1425','rekilutuv@mailinator.com',5),(20,'Donovan Reilly','778','Voluptatem Deserunt','+1 (803) 778-4125','sutyrymas@mailinator.com',6),(21,'Latifah Combs','430','Dolore culpa nihil d','+1 (604) 142-8871','fyjytubyl@mailinator.com',6),(22,'Ora Hutchinson','692','Ex veritatis aute at','+1 (896) 154-6524','huronexu@mailinator.com',6),(23,'Chaney Sosa','102','Inventore exercitati','+1 (877) 181-7296','topode@mailinator.com',6),(24,'Keely Flynn','468','Beatae dolore duis a','+1 (153) 169-8387','xutucigym@mailinator.com',6),(25,'Ramona Levy','636','Non deserunt nemo oc','+1 (295) 196-5284','bytubaxi@mailinator.com',6),(26,'Connor Cox','287','Magnam anim facilis','+1 (853) 541-3923','gixivuri@mailinator.com',7),(27,'John Bass','792','Sed unde aliquid tem','+1 (555) 789-8253','tigeh@mailinator.com',7),(28,'Merrill Graves','471','Rerum qui ut libero','+1 (903) 814-9498','mavuxy@mailinator.com',7),(29,'Uriah Talley','790','Dolor enim sapiente','+1 (248) 587-2287','nonazoqa@mailinator.com',7),(30,'Amelia Velazquez','553','Incidunt et excepte','+1 (426) 799-7581','fupahyfu@mailinator.com',8),(31,'Wyatt Estrada','668','Laborum occaecat id','+1 (852) 866-3746','wezavyho@mailinator.com',8),(32,'Justina Middleton','578','Rerum ea beatae aspe','+1 (225) 872-4871','cudygoqam@mailinator.com',8),(33,'Xavier Tillman','955','Mollitia sint pariat','+1 (458) 117-4831','ryzabo@mailinator.com',8),(34,'Dadda Escross','708970897','7097','989789709','dasd.sdas@dmas.s',9),(35,'Emblem Orekagones','7897','08979','0987970897','Esds@fd.fa',9),(36,'Zachery Deleon','201','Qui quia anim lorem','+1 (203) 777-1142','wubus@mailinator.com',10),(37,'Norman Stanton','109','Qui facere aliquam q','+1 (353) 507-8539','loxozico@mailinator.com',10);
/*!40000 ALTER TABLE `participating_investigator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'ROLE_VICE_CHAIR',NULL,'ROLE_VICE_CHAIR');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceedure_use`
--

DROP TABLE IF EXISTS `proceedure_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proceedure_use` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceedure_use`
--

LOCK TABLES `proceedure_use` WRITE;
/*!40000 ALTER TABLE `proceedure_use` DISABLE KEYS */;
INSERT INTO `proceedure_use` VALUES (1,'Hybrid');
/*!40000 ALTER TABLE `proceedure_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `dirctorate_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8157AA0FA76ED395` (`user_id`),
  KEY `IDX_8157AA0F6D2A94BD` (`dirctorate_id`),
  CONSTRAINT `FK_8157AA0F6D2A94BD` FOREIGN KEY (`dirctorate_id`) REFERENCES `directorate` (`id`),
  CONSTRAINT `FK_8157AA0FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'Solomon','Tingtagu','vybomyfoz@mailinator.com',NULL,'+1 (574) 114-7051','2024-10-10 00:00:00','Do non hic anim aut',NULL,'67062cbaac126.png','670667d7cc739.jpg',NULL,NULL,1,1),(2,'Bacca','Debele','fashe@gom.ac',NULL,'0978897','2024-09-15 00:00:00','Mr.',NULL,'67062cc96f75b.png','67067b790a8a2.jpg',NULL,NULL,2,1);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progress_report`
--

DROP TABLE IF EXISTS `progress_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progress_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `submitted_at` datetime NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci,
  `key_results_of_research` longtext COLLATE utf8mb4_unicode_ci,
  `challenges` longtext COLLATE utf8mb4_unicode_ci,
  `protocol_id` int DEFAULT NULL,
  `submitted_by_id` int NOT NULL,
  `approved_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75C62653CCD59258` (`protocol_id`),
  KEY `IDX_75C6265379F7D87D` (`submitted_by_id`),
  KEY `IDX_75C626532D234F6A` (`approved_by_id`),
  CONSTRAINT `FK_75C626532D234F6A` FOREIGN KEY (`approved_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_75C6265379F7D87D` FOREIGN KEY (`submitted_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_75C62653CCD59258` FOREIGN KEY (`protocol_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress_report`
--

LOCK TABLES `progress_report` WRITE;
/*!40000 ALTER TABLE `progress_report` DISABLE KEYS */;
INSERT INTO `progress_report` VALUES (1,'2024-09-24 08:08:30','dsdadsadsa','dsda','sda','dasda',9,2,NULL),(2,'2024-09-24 08:09:27','dsdadsadsa','dsda','sda','dasda',9,2,NULL),(3,'2024-09-24 08:12:33','Quibusdam magni neque autem excepteur rem reprehenderit','Itaque quis commodi','Beatae commodi labor','Quo voluptatibus dig',9,2,NULL),(4,'2024-09-24 08:21:03','Dignissimos veritatis dolores ex aspernatur est sunt amet autem exercitationem commodi est suscipit fugiat animi dolorem quo','Omnis laudantium in','Quia dolores nihil i','Doloremque atque nes',9,2,NULL),(5,'2024-09-24 08:28:22','EPHI-SERO-9-24-Progress Reportdocx','sdas','sdasdas','dada',9,2,NULL),(6,'2024-09-24 08:30:05','EPHI-SERO-9-24-Progress Report.docx','Senior Business Analysis Officer for Addis Ababa\r\nSenior Business Analysis Officer for Addis Ababa\r\nRequired\r\n1.Senior Business Analysis Officer for Addis Ababa\r\n2.DB/ Vacancy-0291/24\r\n3.9/18/2024\r\n\r\nNever give out your password.Report abuse\r\nMicrosoft 365\r\nThis content is created by the owner of the form. The data you submit will be sent to the form owner. Microsoft is not responsible for the privacy or security practices of its customers, including those of this form owner. Never give out your password.\r\n| AI-Powered surveys, quizzes and pollsCreate my own form\r\nThe owner of this form has not provided a privacy statement as to how they will use your response data. Do not provide personal or sensitive information. | Terms of use','Praesentium commodi','Exercitation necessi',9,2,NULL),(7,'2024-09-24 08:33:02','EPHI-SERO-9-24-Progress_Report.docx','Qui doloribus quo ip','Hic aut rerum elit','Id natus sapiente eu',9,2,NULL),(8,'2024-09-24 08:39:06','EPHI-SERO-8-24-Progress_Report.docx','Velit doloremque ill','Deserunt velit ex f','Veritatis fuga Alia',8,2,NULL);
/*!40000 ALTER TABLE `progress_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reset_password_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`),
  CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reset_password_request`
--

LOCK TABLES `reset_password_request` WRITE;
/*!40000 ALTER TABLE `reset_password_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `reset_password_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignment`
--

DROP TABLE IF EXISTS `review_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_assignment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `closed` tinyint(1) DEFAULT NULL,
  `allow_to_view` tinyint(1) DEFAULT NULL,
  `invitation_sent_at` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `reviewer_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` int DEFAULT NULL,
  `irbreviewer_id` int DEFAULT NULL,
  `review_form_id` int NOT NULL,
  `sec_reviewer_id` int DEFAULT NULL,
  `recommendation_id` int DEFAULT NULL,
  `invitation_response_due_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_475585B73E030ACD` (`application_id`),
  KEY `IDX_475585B7F621C50C` (`irbreviewer_id`),
  KEY `IDX_475585B7C4182F8A` (`review_form_id`),
  KEY `IDX_475585B72E8AD661` (`sec_reviewer_id`),
  KEY `IDX_475585B7D173940B` (`recommendation_id`),
  CONSTRAINT `FK_475585B72E8AD661` FOREIGN KEY (`sec_reviewer_id`) REFERENCES `reviewers_pool` (`id`),
  CONSTRAINT `FK_475585B73E030ACD` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`),
  CONSTRAINT `FK_475585B7C4182F8A` FOREIGN KEY (`review_form_id`) REFERENCES `review_form` (`id`),
  CONSTRAINT `FK_475585B7D173940B` FOREIGN KEY (`recommendation_id`) REFERENCES `reviewer_recommendation` (`id`),
  CONSTRAINT `FK_475585B7F621C50C` FOREIGN KEY (`irbreviewer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignment`
--

LOCK TABLES `review_assignment` WRITE;
/*!40000 ALTER TABLE `review_assignment` DISABLE KEYS */;
INSERT INTO `review_assignment` VALUES (1,1,NULL,'2024-08-22 06:51:24','2024-09-01 00:00:00',1,'2024-08-22 09:29:09','1',3,1,1,NULL,1,NULL),(2,1,NULL,'2024-08-22 13:44:41','2024-09-01 00:00:00',1,'2024-08-22 14:14:06','1',4,1,1,NULL,1,NULL),(3,NULL,NULL,'2024-08-22 13:45:07','2024-09-01 00:00:00',1,NULL,'2',4,NULL,1,1,3,NULL),(4,1,NULL,'2024-08-25 18:33:28','2024-09-04 00:00:00',1,'2024-08-25 20:05:15','1',4,1,1,NULL,2,NULL),(5,1,NULL,'2024-08-26 07:54:49','2024-09-05 00:00:00',1,'2024-08-26 08:06:54','1',6,1,1,NULL,2,NULL),(6,1,NULL,'2024-08-29 12:25:48','2024-09-08 00:00:00',1,'2024-08-30 08:38:30','1',9,1,1,NULL,2,NULL),(7,1,NULL,'2024-08-30 15:08:56','2024-09-09 00:00:00',1,'2024-08-30 15:37:25','1',8,1,1,NULL,3,NULL),(8,1,NULL,'2024-08-30 15:38:20','2024-09-09 00:00:00',1,'2024-08-30 15:39:27','1',9,1,1,NULL,1,NULL),(9,1,NULL,'2024-08-30 15:51:29','2024-09-09 00:00:00',1,'2024-08-30 15:51:56','1',8,1,1,NULL,1,NULL),(10,1,NULL,'2024-09-04 07:49:55','2024-09-14 00:00:00',1,'2024-09-04 07:55:00','1',1,1,1,NULL,2,NULL),(11,1,NULL,'2024-09-04 12:56:56','2024-09-14 00:00:00',1,'2024-09-04 12:57:14','1',1,1,1,NULL,4,NULL),(14,NULL,NULL,'2024-09-05 09:11:47','2024-09-15 00:00:00',1,NULL,'1',8,1,1,NULL,NULL,NULL),(15,NULL,NULL,'2024-09-05 09:15:18','2024-09-15 00:00:00',1,NULL,'2',8,NULL,1,1,NULL,NULL),(16,1,NULL,'2024-09-05 12:31:33','2024-09-15 00:00:00',1,'2024-09-05 12:31:46','1',9,2,1,NULL,1,NULL),(17,NULL,NULL,'2024-09-23 11:01:02','2024-10-03 00:00:00',1,NULL,'1',1,1,1,NULL,NULL,NULL),(18,NULL,NULL,'2024-09-25 11:42:43','2024-10-05 00:00:00',1,NULL,'1',9,1,1,NULL,NULL,'2024-09-29 00:00:00'),(23,1,NULL,'2024-09-28 09:37:22','2024-10-08 00:00:00',1,'2024-09-30 09:00:45','1',7,1,2,NULL,3,'2024-10-02 00:00:00'),(24,NULL,NULL,'2024-09-30 08:18:20','2024-10-10 00:00:00',1,NULL,'1',7,2,2,NULL,NULL,'2024-10-04 00:00:00'),(25,NULL,NULL,'2024-09-30 08:45:19','2024-10-10 00:00:00',1,NULL,'1',6,2,1,NULL,NULL,'2024-10-04 00:00:00'),(26,1,NULL,'2024-09-30 09:35:13','2024-10-10 00:00:00',1,'2024-09-30 09:35:44','1',9,1,2,NULL,1,'2024-10-04 00:00:00'),(27,NULL,NULL,'2024-10-01 12:40:13','2024-10-11 00:00:00',1,NULL,'1',10,1,2,NULL,NULL,'2024-10-05 00:00:00'),(28,NULL,NULL,'2024-10-08 07:38:16','2024-10-18 00:00:00',1,NULL,'1',5,1,1,NULL,NULL,'2024-10-12 00:00:00');
/*!40000 ALTER TABLE `review_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_checklist`
--

DROP TABLE IF EXISTS `review_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_checklist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_type` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `checklist_group_id` int NOT NULL,
  `review_form_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CB98F62E727ACA70` (`parent_id`),
  KEY `IDX_CB98F62EA350A585` (`checklist_group_id`),
  KEY `IDX_CB98F62EC4182F8A` (`review_form_id`),
  CONSTRAINT `FK_CB98F62E727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `review_checklist` (`id`),
  CONSTRAINT `FK_CB98F62EA350A585` FOREIGN KEY (`checklist_group_id`) REFERENCES `review_checklist_group` (`id`),
  CONSTRAINT `FK_CB98F62EC4182F8A` FOREIGN KEY (`review_form_id`) REFERENCES `review_form` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_checklist`
--

LOCK TABLES `review_checklist` WRITE;
/*!40000 ALTER TABLE `review_checklist` DISABLE KEYS */;
INSERT INTO `review_checklist` VALUES (1,'Title of the protocol',1,NULL,1,1),(2,'Summary',1,NULL,1,1),(3,'Background and justification',1,NULL,1,1),(4,'Availability of similar Study / Results',1,NULL,1,1),(5,'Objectives of the Study',1,NULL,1,1),(6,'Methodology',1,NULL,1,1),(7,'Study tools are annexed?',1,NULL,1,1),(8,'Study tools are translated to local language?',1,NULL,1,1),(9,'Need for Human Study Participants',1,NULL,1,1),(10,'Use of Placebo or less effective intervention',1,NULL,1,1),(11,'Sufficient number of participants?',1,NULL,1,1),(12,'Inclusion criteria',1,NULL,1,1),(13,'Exclusion criteria',1,NULL,1,1),(14,'Benefits of the study',1,NULL,1,1),(15,'Ethical consideration well described in the protocol',1,NULL,2,1),(16,'Equitable/Justified selection of study participants',1,NULL,2,1),(17,'Equitable/Justified selection of study sites',1,NULL,2,1),(18,'Are procedures for obtaining Informed Consent appropriate?',1,NULL,2,1),(19,'Contents of the Informed Consent Document',1,NULL,2,1),(20,'Assent and parental/guardian consent required and obtained?',1,NULL,2,1),(21,'Language of the Informed Consent Document',1,NULL,2,1),(22,'Provision for Compensation',1,NULL,2,1),(23,'Voluntary, no undue influence for Participation',1,NULL,2,1),(24,'Voluntary, non-coercive recruitment of participants',1,NULL,2,1),(25,'Withdrawal Criteria',1,NULL,2,1),(26,'Privacy & Confidentiality maintained',1,NULL,2,1),(27,'Risks',1,NULL,2,1),(28,'Category of risk/benefit',1,NULL,2,1),(29,'Risks are minimized?',1,NULL,2,1),(30,'Provision for Medical / Psychosocial Support',1,NULL,2,1),(31,'Provision for Treatment of Study-Related Injuries',1,NULL,2,1),(32,'Benefits?',1,NULL,2,1),(33,'Is there benefit to the individual?',1,NULL,2,1),(34,'Benefit to local communities',1,NULL,2,1),(35,'Use of vulnerable participants',1,NULL,2,1),(36,'Measures to protect vulnerable participants',1,NULL,2,1),(37,'Community Consultation',1,NULL,2,1),(38,'Contact Persons for Participants',1,NULL,2,1),(39,'Are Qualification and experiences of the Participating Investigators appropriate?',1,NULL,3,1),(40,'Involvement of local researchers and institution in the protocol design, analysis and publication of results',1,NULL,3,1),(41,'Facilities and infrastructure of Participating Sites',1,NULL,3,1),(42,'Contribution to Development of Local Capacity for Research and Treatment',1,NULL,3,1),(43,'If more than one institution executes the project, Memorandum of Understanding attached?',1,NULL,3,1),(44,'Are human blood/tissue or other biological materials exported abroad?',1,NULL,3,1),(45,'If biological material exported abroad, Material Transfer Agreement attached?',1,NULL,3,1),(46,'Disclosure or Declaration of Potential Conflicts of Interest',1,NULL,3,1),(47,'Are there any issues that are not clear &need clarification from the principal investigator?',1,NULL,3,1),(48,'What sort of changes has been made on the newer version?',2,NULL,4,2);
/*!40000 ALTER TABLE `review_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_checklist_group`
--

DROP TABLE IF EXISTS `review_checklist_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_checklist_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_checklist_group`
--

LOCK TABLES `review_checklist_group` WRITE;
/*!40000 ALTER TABLE `review_checklist_group` DISABLE KEYS */;
INSERT INTO `review_checklist_group` VALUES (1,'Scientific Issues'),(2,'Ethical and Informed Consent Issues'),(3,'Enablers & other issues'),(4,'Resubmission form section');
/*!40000 ALTER TABLE `review_checklist_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form`
--

DROP TABLE IF EXISTS `review_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `instruction_for_reviewer` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form`
--

LOCK TABLES `review_form` WRITE;
/*!40000 ALTER TABLE `review_form` DISABLE KEYS */;
INSERT INTO `review_form` VALUES (1,'Assessment form','A protocol review assessment form 2024',NULL,NULL,1,'When you fill the form \"A protocol review assessment form 2024\", You need to follow the following mmethods. ...'),(2,'Resubmitted Protocol Review Form','Resubmitted Protocol Review Form',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `review_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_recommendation`
--

DROP TABLE IF EXISTS `review_recommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_recommendation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_recommendation`
--

LOCK TABLES `review_recommendation` WRITE;
/*!40000 ALTER TABLE `review_recommendation` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_recommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_status`
--

DROP TABLE IF EXISTS `review_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `review_group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F17622DCDD16504C` (`review_group_id`),
  CONSTRAINT `FK_F17622DCDD16504C` FOREIGN KEY (`review_group_id`) REFERENCES `review_status_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_status`
--

LOCK TABLES `review_status` WRITE;
/*!40000 ALTER TABLE `review_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_status_group`
--

DROP TABLE IF EXISTS `review_status_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_status_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_status_group`
--

LOCK TABLES `review_status_group` WRITE;
/*!40000 ALTER TABLE `review_status_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_status_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_type`
--

DROP TABLE IF EXISTS `review_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_type`
--

LOCK TABLES `review_type` WRITE;
/*!40000 ALTER TABLE `review_type` DISABLE KEYS */;
INSERT INTO `review_type` VALUES (1,'Full board','Full board'),(2,'EXPEDITED','EXPEDITED');
/*!40000 ALTER TABLE `review_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_recommendation`
--

DROP TABLE IF EXISTS `reviewer_recommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewer_recommendation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hexcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_recommendation`
--

LOCK TABLES `reviewer_recommendation` WRITE;
/*!40000 ALTER TABLE `reviewer_recommendation` DISABLE KEYS */;
INSERT INTO `reviewer_recommendation` VALUES (1,'Approved','APPROVED','success','green'),(2,'Approved with minor changes','APPRROVED_WITH_MINOR_CHANGES','warning','yellow'),(3,'Resubmission','RESUBMISSION','danger','red'),(4,'Rejected','REJECTED','danger','red');
/*!40000 ALTER TABLE `reviewer_recommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_response`
--

DROP TABLE IF EXISTS `reviewer_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewer_response` (
  `id` int NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `reviewed_at` datetime DEFAULT NULL,
  `checklist_id` int NOT NULL,
  `review_assignment_id` int DEFAULT NULL,
  `reviewed_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5AD1B573B16D08A7` (`checklist_id`),
  KEY `IDX_5AD1B573FBA5E497` (`review_assignment_id`),
  KEY `IDX_5AD1B573FC6B21F1` (`reviewed_by_id`),
  CONSTRAINT `FK_5AD1B573B16D08A7` FOREIGN KEY (`checklist_id`) REFERENCES `review_checklist` (`id`),
  CONSTRAINT `FK_5AD1B573FBA5E497` FOREIGN KEY (`review_assignment_id`) REFERENCES `review_assignment` (`id`),
  CONSTRAINT `FK_5AD1B573FC6B21F1` FOREIGN KEY (`reviewed_by_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=520 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_response`
--

LOCK TABLES `reviewer_response` WRITE;
/*!40000 ALTER TABLE `reviewer_response` DISABLE KEYS */;
INSERT INTO `reviewer_response` VALUES (1,'Clear','Ullam reprehenderit ',NULL,1,1,1),(2,'Clear','Nulla irure quam cum',NULL,2,1,1),(3,'Insufficient','Tempora voluptatem e',NULL,3,1,1),(4,'Don’t know','Ut libero occaecat r',NULL,4,1,1),(5,'Unclear','Magni harum temporib',NULL,5,1,1),(6,'Clear','Quos in mollitia in ',NULL,6,1,1),(7,'Not applicable','Asperiores dolor fug',NULL,7,1,1),(8,'Yes','Est exercitation ut',NULL,8,1,1),(9,'Yes','Assumenda officia se',NULL,9,1,1),(10,'Not justified','Aut aut nobis quis r',NULL,10,1,1),(11,'No','Pariatur Aut harum ',NULL,11,1,1),(12,'Inappropriate','Molestias et qui fac',NULL,12,1,1),(13,'Not applicable','Aliquid velit et eo',NULL,13,1,1),(14,'Unclear','Quia nihil enim repr',NULL,14,1,1),(15,'No','Ea magni consequuntu',NULL,15,1,1),(16,'No','Quis animi aut anim',NULL,16,1,1),(17,'No','Maxime dolor a quide',NULL,17,1,1),(18,'No','Veritatis nemo maior',NULL,18,1,1),(19,'Relevant issues addressed','Rerum neque et solut',NULL,19,1,1),(20,'No','Incidunt sint in si',NULL,20,1,1),(21,'Inappropriate','Non voluptate sequi ',NULL,21,1,1),(22,'Inappropriate','In qui officiis sed ',NULL,22,1,1),(23,'Unlikely','Magnam lorem dolorem',NULL,23,1,1),(24,'Yes','Mollit minima tempor',NULL,24,1,1),(25,'Described','Sint non aliquam mi',NULL,25,1,1),(26,'Yes','Labore amet eligend',NULL,26,1,1),(27,'No','Unde explicabo Prov',NULL,27,1,1),(28,'Greater than minimal risk and no direct benefit to the individual study participant but likely to yield generalizable knowledge about participant’s disorder or condition','Rerum ullamco ad ea ',NULL,28,1,1),(29,'Yes','Irure nobis perspici',NULL,29,1,1),(30,'Appropriate','Qui ea quia voluptat',NULL,30,1,1),(31,'Inappropriate','Cillum eius quo nobi',NULL,31,1,1),(32,'Yes','Totam consequat Qua',NULL,32,1,1),(33,'No','Et quia numquam at i',NULL,33,1,1),(34,'No','Elit rerum repellen',NULL,34,1,1),(35,'Justified','Similique voluptate ',NULL,35,1,1),(36,'Sufficient','Expedita dolores fac',NULL,36,1,1),(37,'Yes','Occaecat do quia del',NULL,37,1,1),(38,'No','Eiusmod dolore ipsam',NULL,38,1,1),(39,'Yes','Ea id distinctio Ul',NULL,39,1,1),(40,'Yes','Necessitatibus iste ',NULL,40,1,1),(41,'Inappropriate','Est expedita accusan',NULL,41,1,1),(42,'No','Aliquip est sint bl',NULL,42,1,1),(43,'Yes','Sunt esse qui offic',NULL,43,1,1),(44,'No','Nisi ut beatae eos ',NULL,44,1,1),(45,'No','Officia et voluptate',NULL,45,1,1),(46,'Declared','Laboris minima sapie',NULL,46,1,1),(47,'No','Eos ea Nam id cupid',NULL,47,1,1),(48,'Unclear','Commodo reiciendis v',NULL,1,2,1),(49,'Clear','Mollitia dolor debit',NULL,2,2,1),(50,'Sufficient','Iure irure proident',NULL,3,2,1),(51,'Don’t know','Quia eius laboris ve',NULL,4,2,1),(52,'Clear','Quasi molestiae temp',NULL,5,2,1),(53,'Unclear','Commodi qui sed enim',NULL,6,2,1),(54,'Yes','Lorem velit id repud',NULL,7,2,1),(55,'Yes','Recusandae Exceptur',NULL,8,2,1),(56,'Yes','Sit voluptas in ips',NULL,9,2,1),(57,'Not justified','Dolor omnis maiores ',NULL,10,2,1),(58,'Yes','Accusamus ratione ha',NULL,11,2,1),(59,'Appropriate','Dignissimos laboris ',NULL,12,2,1),(60,'Not applicable','Sit amet ut tempor',NULL,13,2,1),(61,'Clear','Adipisicing consequa',NULL,14,2,1),(62,'Yes','Aliqua Aspernatur i',NULL,15,2,1),(63,'Yes','Ad aut vero dolores ',NULL,16,2,1),(64,'No','Eos sit cupiditate',NULL,17,2,1),(65,'Yes','Nulla non non labori',NULL,18,2,1),(66,'Relevant issues not addressed','Aliquam dolorem adip',NULL,19,2,1),(67,'Yes','Cum qui ut explicabo',NULL,20,2,1),(68,'Appropriate','Ut tenetur reprehend',NULL,21,2,1),(69,'Inappropriate','Do ipsum ducimus qu',NULL,22,2,1),(70,'Likely','Magnam eaque esse re',NULL,23,2,1),(71,'Yes','Officiis nisi id omn',NULL,24,2,1),(72,'Described','Autem dolores cupida',NULL,25,2,1),(73,'No','Non velit accusamus ',NULL,26,2,1),(74,'Yes','Aut quod laborum Pr',NULL,27,2,1),(75,'Greater than minimal risk but presenting the prospect of direct benefit to the individual study participant','Corrupti dignissimo',NULL,28,2,1),(76,'Yes','Et facere alias est ',NULL,29,2,1),(77,'Inappropriate','Rerum laborum sit n',NULL,30,2,1),(78,'Inappropriate','Tempora ut et odit a',NULL,31,2,1),(79,'No','Placeat nisi enim v',NULL,32,2,1),(80,'No','In veritatis illum ',NULL,33,2,1),(81,'No','Laborum Beatae corp',NULL,34,2,1),(82,'Not justified','Rerum reiciendis pla',NULL,35,2,1),(83,'Not sufficient','Odit amet ut optio',NULL,36,2,1),(84,'No','Voluptate cumque fac',NULL,37,2,1),(85,'Yes','Iste minima aut est',NULL,38,2,1),(86,'Yes','Ab culpa odio et qu',NULL,39,2,1),(87,'No','Dolores voluptas non',NULL,40,2,1),(88,'Appropriate','Deleniti dolorem non',NULL,41,2,1),(89,'Yes','Sunt accusantium re',NULL,42,2,1),(90,'No','Odit maxime ducimus',NULL,43,2,1),(91,'Yes','Reprehenderit conseq',NULL,44,2,1),(92,'Yes','Aliquid est aut nisi',NULL,45,2,1),(93,'Declared','Id dolor et proiden',NULL,46,2,1),(94,'Yes','Enim rerum neque nat',NULL,47,2,1),(95,'Clear','Irure do ea consequu',NULL,1,4,1),(96,'Unclear','Sint cupidatat perfe',NULL,2,4,1),(97,'Insufficient','Officiis beatae labo',NULL,3,4,1),(98,'No','Nihil duis autem exp',NULL,4,4,1),(99,'Clear','Voluptate qui dicta ',NULL,5,4,1),(100,'Unclear','Ut reiciendis ea inc',NULL,6,4,1),(101,'Not applicable','Voluptate consequatu',NULL,7,4,1),(102,'No','Esse natus rerum vo',NULL,8,4,1),(103,'No','Voluptatem voluptas',NULL,9,4,1),(104,'Not justified','Aut magna quod labor',NULL,10,4,1),(105,'No','Quis voluptatem eum ',NULL,11,4,1),(106,'Inappropriate','A debitis mollitia a',NULL,12,4,1),(107,'Inappropriate','Proident odit sunt',NULL,13,4,1),(108,'Clear','Saepe excepteur occa',NULL,14,4,1),(109,'No','Et dolore quisquam e',NULL,15,4,1),(110,'Yes','Voluptas esse pariat',NULL,16,4,1),(111,'No','Dolor accusamus nequ',NULL,17,4,1),(112,'Yes','Enim Nam veritatis n',NULL,18,4,1),(113,'Relevant issues not addressed','Tempora non facilis ',NULL,19,4,1),(114,'Yes','Labore laboriosam p',NULL,20,4,1),(115,'Inappropriate','Temporibus sed sint',NULL,21,4,1),(116,'Inappropriate','Sapiente perferendis',NULL,22,4,1),(117,'Unlikely','Rerum deserunt dolor',NULL,23,4,1),(118,'Yes','Et iusto beatae est ',NULL,24,4,1),(119,'Described','Magnam nostrum repel',NULL,25,4,1),(120,'No','Ea ut sint sit repel',NULL,26,4,1),(121,'No','Quia ut debitis Nam ',NULL,27,4,1),(122,'Outside those mentioned above','Eaque est esse pari',NULL,28,4,1),(123,'Yes','Natus id ipsa inci',NULL,29,4,1),(124,'Appropriate','Nisi sapiente facili',NULL,30,4,1),(125,'Inappropriate','Fugit sequi nobis p',NULL,31,4,1),(126,'No','Sit debitis autem au',NULL,32,4,1),(127,'Yes','Facilis alias neque ',NULL,33,4,1),(128,'Yes','Et amet hic exceptu',NULL,34,4,1),(129,'Justified','Ut est ipsam sint eo',NULL,35,4,1),(130,'Not sufficient','Sit sit nihil velit',NULL,36,4,1),(131,'No','Placeat blanditiis ',NULL,37,4,1),(132,'No','Distinctio Omnis do',NULL,38,4,1),(133,'Yes','Ut exercitation labo',NULL,39,4,1),(134,'Yes','Rerum laboriosam sa',NULL,40,4,1),(135,'Appropriate','Sit ut illo tempora',NULL,41,4,1),(136,'Yes','Nostrud quasi est co',NULL,42,4,1),(137,'No','Nulla quia deserunt ',NULL,43,4,1),(138,'Not Applicable','Et fugiat ad maxime',NULL,44,4,1),(139,'No','Sunt sunt aliquip re',NULL,45,4,1),(140,'Declared','Fugiat excepturi ab ',NULL,46,4,1),(141,'Yes','Asperiores et dolor ',NULL,47,4,1),(142,'Unclear','Molestias dolor labo',NULL,1,5,1),(143,'Unclear','Adipisicing minus ip',NULL,2,5,1),(144,'Insufficient','Voluptatum aute prov',NULL,3,5,1),(145,'Yes','Fugiat praesentium t',NULL,4,5,1),(146,'Unclear','Blanditiis debitis q',NULL,5,5,1),(147,'Unclear','Error rerum laudanti',NULL,6,5,1),(148,'Yes','Ea cum at enim do',NULL,7,5,1),(149,'Not required','Aliquid enim dolore ',NULL,8,5,1),(150,'No','Ullamco est nulla qu',NULL,9,5,1),(151,'Justified','Sunt sit aut deser',NULL,10,5,1),(152,'Yes','Optio officia archi',NULL,11,5,1),(153,'Inappropriate','Corporis in expedita',NULL,12,5,1),(154,'Not applicable','Sit velit aliquid mo',NULL,13,5,1),(155,'Clear','Necessitatibus et qu',NULL,14,5,1),(156,'No','Maxime aliquid volup',NULL,15,5,1),(157,'No','Facilis tempor volup',NULL,16,5,1),(158,'Yes','Voluptatem voluptas ',NULL,17,5,1),(159,'No','Et est in accusamus ',NULL,18,5,1),(160,'Relevant issues not addressed','Nam eum quibusdam qu',NULL,19,5,1),(161,'Yes','n the next lessons, you will learn how to use statistics to describe quantitative data. You\'ll gain insight into the process of how data is collected and how to answer questions using your data. Throughout this lesson, you will learn to be critical of the analysis that happens \"under the hood\" and understand what the numbers actually mean. ',NULL,20,5,1),(162,'Inappropriate','Earum quaerat dolor ',NULL,21,5,1),(163,'Inappropriate','Iusto quod ut magni ',NULL,22,5,1),(164,'Likely','Praesentium eum veni',NULL,23,5,1),(165,'Yes','Omnis qui repellendu',NULL,24,5,1),(166,'Not Described','Recusandae Qui esse',NULL,25,5,1),(167,'Yes','Unde excepturi labor',NULL,26,5,1),(168,'Yes','Minus impedit dolor',NULL,27,5,1),(169,'Greater than minimal risk but presenting the prospect of direct benefit to the individual study participant','Rerum et provident ',NULL,28,5,1),(170,'Yes','Itaque architecto vo',NULL,29,5,1),(171,'Inappropriate','Illo corporis neque ',NULL,30,5,1),(172,'Inappropriate','Perspiciatis in et ',NULL,31,5,1),(173,'No','A voluptates nostrum',NULL,32,5,1),(174,'Yes','Ut ea elit voluptat',NULL,33,5,1),(175,'No','Amet nulla commodo ',NULL,34,5,1),(176,'Justified','Temporibus vero fugi',NULL,35,5,1),(177,'Not sufficient','Perferendis nisi aut',NULL,36,5,1),(178,'Yes','Unde illum est mole',NULL,37,5,1),(179,'Yes','Consequuntur molliti',NULL,38,5,1),(180,'No','Lorem fugiat aut vol',NULL,39,5,1),(181,'No','Officia corporis et ',NULL,40,5,1),(182,'Appropriate','Praesentium qui maio',NULL,41,5,1),(183,'No','Error quas id Nam op',NULL,42,5,1),(184,'No','Et excepteur ut enim',NULL,43,5,1),(185,'Yes','Enim quia eius paria',NULL,44,5,1),(186,'No','Esse incididunt mol',NULL,45,5,1),(187,'Declared','Culpa lorem ad corp',NULL,46,5,1),(188,'No','Distinctio Et in im',NULL,47,5,1),(189,'Clear','Consequuntur ex et e',NULL,1,6,1),(190,'Unclear','Ullam quo unde persp',NULL,2,6,1),(191,'Sufficient','Qui quo voluptate re',NULL,3,6,1),(192,'Don’t know','Iste sint eiusmod de',NULL,4,6,1),(193,'Clear','Sint minim officiis',NULL,5,6,1),(194,'Clear','Minim doloremque exe',NULL,6,6,1),(195,'Yes','Lorem reiciendis qua',NULL,7,6,1),(196,'Yes','Ad adipisci sunt sa',NULL,8,6,1),(197,'Yes','Qui similique corrup',NULL,9,6,1),(198,'Not justified','Id fugit non dolor ',NULL,10,6,1),(199,'Not applicable','Omnis iusto officiis',NULL,11,6,1),(200,'Inappropriate','Delectus assumenda ',NULL,12,6,1),(201,'Appropriate','Ex enim modi nihil a',NULL,13,6,1),(202,'Clear','Obcaecati reprehende',NULL,14,6,1),(203,'No','Aut dignissimos volu',NULL,15,6,1),(204,'Yes','Nam sunt ex est ut d',NULL,16,6,1),(205,'No','Dolorem est asperior',NULL,17,6,1),(206,'No','Aliqua Assumenda in',NULL,18,6,1),(207,'Relevant issues addressed','Consequuntur vero du',NULL,19,6,1),(208,'Yes','Eum voluptatem natu',NULL,20,6,1),(209,'Appropriate','Tenetur aut et elige',NULL,21,6,1),(210,'Inappropriate','In ipsum vel eos e',NULL,22,6,1),(211,'Unlikely','Eveniet laboris nul',NULL,23,6,1),(212,'Yes','Enim aut ab quam nec',NULL,24,6,1),(213,'Described','Fugiat molestias nih',NULL,25,6,1),(214,'Yes','Id dolore fugit est',NULL,26,6,1),(215,'No','Aperiam commodi iure',NULL,27,6,1),(216,'Greater than minimal risk and no direct benefit to the individual study participant but likely to yield generalizable knowledge about participant’s disorder or condition','Omnis laboris et est',NULL,28,6,1),(217,'No','Aliqua Nobis velit ',NULL,29,6,1),(218,'Inappropriate','Velit ut suscipit al',NULL,30,6,1),(219,'Appropriate','Adipisci odio rerum ',NULL,31,6,1),(220,'Yes','Nulla qui mollit quo',NULL,32,6,1),(221,'No','Non dicta earum moll',NULL,33,6,1),(222,'No','Amet sit sit minus',NULL,34,6,1),(223,'Not justified','Ut magna eiusmod cor',NULL,35,6,1),(224,'Sufficient','Unde repellendus Au',NULL,36,6,1),(225,'No','Vel voluptas delectu',NULL,37,6,1),(226,'No','Consequat Delectus',NULL,38,6,1),(227,'No','Aut ad neque laborio',NULL,39,6,1),(228,'No','Impedit atque magna',NULL,40,6,1),(229,'Inappropriate','Ea soluta rerum itaq',NULL,41,6,1),(230,'No','Aperiam accusantium ',NULL,42,6,1),(231,'Yes','Omnis inventore inci',NULL,43,6,1),(232,'Yes','Velit illo laborum ',NULL,44,6,1),(233,'Yes','Impedit eum volupta',NULL,45,6,1),(234,'Declared','Voluptatem debitis a',NULL,46,6,1),(235,'Yes','Et voluptas necessit',NULL,47,6,1),(236,'Clear','Praesentium dolorum ',NULL,1,7,1),(237,'Unclear','In vel aliquam esse',NULL,2,7,1),(238,'Insufficient','Aut quis irure conse',NULL,3,7,1),(239,'No','At dolore magni cons',NULL,4,7,1),(240,'Clear','Porro veniam in qui',NULL,5,7,1),(241,'Unclear','A illum animi et q',NULL,6,7,1),(242,'Not applicable','Dolores delectus as',NULL,7,7,1),(243,'No','Qui necessitatibus u',NULL,8,7,1),(244,'No','Quibusdam sapiente i',NULL,9,7,1),(245,'Not Applicable','Maxime nisi aut nihi',NULL,10,7,1),(246,'No','Architecto quibusdam',NULL,11,7,1),(247,'Appropriate','Commodo et libero es',NULL,12,7,1),(248,'Inappropriate','Sequi esse dignissim',NULL,13,7,1),(249,'Clear','Atque quod ex maxime',NULL,14,7,1),(250,'Yes','Minim aliquid rem ma',NULL,15,7,1),(251,'Yes','Dolore tempore veni',NULL,16,7,1),(252,'No','Doloribus explicabo',NULL,17,7,1),(253,'No','Recusandae Maiores ',NULL,18,7,1),(254,'Relevant issues not addressed','Voluptatem ea except',NULL,19,7,1),(255,'Yes','Laboris ut quaerat s',NULL,20,7,1),(256,'Appropriate','Ullam ex amet omnis',NULL,21,7,1),(257,'Inappropriate','Et velit laboris del',NULL,22,7,1),(258,'Unlikely','Eveniet in ea volup',NULL,23,7,1),(259,'Yes','Modi in magna consec',NULL,24,7,1),(260,'Not Described','Voluptate ut quia ut',NULL,25,7,1),(261,'No','Veritatis aut sint ',NULL,26,7,1),(262,'Yes','Eos explicabo Quisq',NULL,27,7,1),(263,'Greater than minimal risk but presenting the prospect of direct benefit to the individual study participant','Mollit omnis animi ',NULL,28,7,1),(264,'No','Quidem eum tenetur p',NULL,29,7,1),(265,'Appropriate','Fuga Laborum non in',NULL,30,7,1),(266,'Appropriate','Enim dolore elit ac',NULL,31,7,1),(267,'Yes','Itaque non autem fac',NULL,32,7,1),(268,'Yes','Et rerum nemo qui co',NULL,33,7,1),(269,'No','Officia tenetur sequ',NULL,34,7,1),(270,'Justified','Nihil exercitationem',NULL,35,7,1),(271,'Not sufficient','Eos quis doloremque ',NULL,36,7,1),(272,'Yes','Architecto odit vel ',NULL,37,7,1),(273,'No','Id beatae cupidatat ',NULL,38,7,1),(274,'Yes','Sapiente soluta nemo',NULL,39,7,1),(275,'Yes','Dolor dolore sunt qu',NULL,40,7,1),(276,'Appropriate','Consectetur possimu',NULL,41,7,1),(277,'No','Suscipit est except',NULL,42,7,1),(278,'Yes','Dolorem enim consequ',NULL,43,7,1),(279,'No','Enim distinctio Ab ',NULL,44,7,1),(280,'Yes','Aliquip dolore place',NULL,45,7,1),(281,'Not Declared','Temporibus error con',NULL,46,7,1),(282,'Yes','Voluptatibus modi vi',NULL,47,7,1),(283,'Unclear','Maiores dolore labor',NULL,1,8,1),(284,'Clear','Voluptas aliquip nes',NULL,2,8,1),(285,'Insufficient','Corrupti est ea ea',NULL,3,8,1),(286,'Yes','Ipsum consequatur s',NULL,4,8,1),(287,'Unclear','Voluptas enim odio l',NULL,5,8,1),(288,'Clear','Illo deserunt rerum ',NULL,6,8,1),(289,'No','Quaerat ut ipsa ven',NULL,7,8,1),(290,'Yes','Reprehenderit ducimu',NULL,8,8,1),(291,'No','Quia iure occaecat m',NULL,9,8,1),(292,'Not justified','Voluptate quam dolor',NULL,10,8,1),(293,'Yes','Culpa voluptate qui ',NULL,11,8,1),(294,'Inappropriate','Enim non ea anim mol',NULL,12,8,1),(295,'Appropriate','Unde sit dignissimo',NULL,13,8,1),(296,'Unclear','Ea delectus volupta',NULL,14,8,1),(297,'No','Explicabo Quasi rec',NULL,15,8,1),(298,'No','Qui labore laboriosa',NULL,16,8,1),(299,'Yes','Vero esse totam aut',NULL,17,8,1),(300,'Yes','Voluptas lorem praes',NULL,18,8,1),(301,'Relevant issues addressed','Deleniti qui accusan',NULL,19,8,1),(302,'No','Facere doloremque cu',NULL,20,8,1),(303,'Appropriate','Vel voluptate irure ',NULL,21,8,1),(304,'Inappropriate','Irure dolorem maiore',NULL,22,8,1),(305,'Unlikely','In magna libero cons',NULL,23,8,1),(306,'Yes','Saepe natus laborios',NULL,24,8,1),(307,'Described','Voluptate ex explica',NULL,25,8,1),(308,'No','Voluptatem Quos sin',NULL,26,8,1),(309,'Yes','Nam irure qui in del',NULL,27,8,1),(310,'Greater than minimal risk but presenting the prospect of direct benefit to the individual study participant','Sed necessitatibus e',NULL,28,8,1),(311,'Yes','Veniam beatae quia ',NULL,29,8,1),(312,'Appropriate','Fugiat aperiam iust',NULL,30,8,1),(313,'Inappropriate','Voluptatem Veritati',NULL,31,8,1),(314,'Yes','Reprehenderit delec',NULL,32,8,1),(315,'No','Qui id ad necessita',NULL,33,8,1),(316,'No','Iste aut omnis esse ',NULL,34,8,1),(317,'Justified','Deleniti cupidatat e',NULL,35,8,1),(318,'Sufficient','Alias expedita elit',NULL,36,8,1),(319,'No','Doloribus reprehende',NULL,37,8,1),(320,'Yes','Illo et veniam offi',NULL,38,8,1),(321,'Yes','Aliquam ullamco labo',NULL,39,8,1),(322,'No','Id nostrum eiusmod ',NULL,40,8,1),(323,'Inappropriate','Mollit reprehenderit',NULL,41,8,1),(324,'No','Amet sunt deserunt ',NULL,42,8,1),(325,'No','Fugiat maxime nihil ',NULL,43,8,1),(326,'Yes','Unde possimus sunt',NULL,44,8,1),(327,'No','Modi ducimus tenetu',NULL,45,8,1),(328,'Declared','Est itaque reprehen',NULL,46,8,1),(329,'No','Dignissimos velit ut',NULL,47,8,1),(330,'Unclear','Nulla minus sunt ni',NULL,1,9,1),(331,'Clear','Ducimus cupiditate ',NULL,2,9,1),(332,'Sufficient','Laborum sint magni ',NULL,3,9,1),(333,'Don’t know','Porro atque ducimus',NULL,4,9,1),(334,'Clear','Ipsum elit voluptat',NULL,5,9,1),(335,'Unclear','Qui distinctio Modi',NULL,6,9,1),(336,'Not applicable','Non beatae qui sint ',NULL,7,9,1),(337,'Not required','Dolore ratione autem',NULL,8,9,1),(338,'No','Dolor consequat Mag',NULL,9,9,1),(339,'Justified','Dicta velit explicab',NULL,10,9,1),(340,'No','Quibusdam voluptatum',NULL,11,9,1),(341,'Inappropriate','Necessitatibus excep',NULL,12,9,1),(342,'Appropriate','Neque iure amet con',NULL,13,9,1),(343,'Clear','Totam autem dolore o',NULL,14,9,1),(344,'Yes','Velit modi sed quis',NULL,15,9,1),(345,'Yes','Magni id laborum At',NULL,16,9,1),(346,'Yes','Ea atque asperiores ',NULL,17,9,1),(347,'No','Obcaecati quos delen',NULL,18,9,1),(348,'Relevant issues addressed','Dolor tempor et numq',NULL,19,9,1),(349,'Yes','Porro aut consectetu',NULL,20,9,1),(350,'Appropriate','Sint cupiditate quam',NULL,21,9,1),(351,'Inappropriate','Dolore officia labor',NULL,22,9,1),(352,'Likely','Ut autem occaecat qu',NULL,23,9,1),(353,'No','Optio esse culpa ',NULL,24,9,1),(354,'Not Described','Est accusantium rep',NULL,25,9,1),(355,'Yes','Dolore qui nemo offi',NULL,26,9,1),(356,'Yes','Modi ut et eaque omn',NULL,27,9,1),(357,'Greater than minimal risk and no direct benefit to the individual study participant but likely to yield generalizable knowledge about participant’s disorder or condition','Irure nulla assumend',NULL,28,9,1),(358,'No','Dicta autem elit qu',NULL,29,9,1),(359,'Appropriate','Placeat aut sed lab',NULL,30,9,1),(360,'Appropriate','Odit nostrum magnam ',NULL,31,9,1),(361,'No','Atque nulla eaque in',NULL,32,9,1),(362,'No','Voluptate culpa obca',NULL,33,9,1),(363,'Yes','Minus modi voluptate',NULL,34,9,1),(364,'Justified','Repudiandae nulla co',NULL,35,9,1),(365,'Sufficient','Minima eveniet face',NULL,36,9,1),(366,'Yes','In et veniam quas l',NULL,37,9,1),(367,'Yes','Ullamco voluptatum a',NULL,38,9,1),(368,'Yes','Debitis id ex fuga ',NULL,39,9,1),(369,'No','Quae libero veniam ',NULL,40,9,1),(370,'Appropriate','Magna ut numquam dol',NULL,41,9,1),(371,'Yes','Aliquid minus aute e',NULL,42,9,1),(372,'Yes','Deserunt suscipit te',NULL,43,9,1),(373,'Not Applicable','Qui minim nemo facer',NULL,44,9,1),(374,'No','Laudantium sit assu',NULL,45,9,1),(375,'Not Declared','Magni totam qui aspe',NULL,46,9,1),(376,'Yes','Quod consectetur lib',NULL,47,9,1),(377,'Clear','Irure commodo distin',NULL,1,10,1),(378,'Unclear','Ipsam ab in voluptas',NULL,2,10,1),(379,'Sufficient','Adipisci non aliquam',NULL,3,10,1),(380,'Yes','Deleniti cupidatat c',NULL,4,10,1),(381,'Unclear','In quasi facere volu',NULL,5,10,1),(382,'Clear','Veniam illo id est ',NULL,6,10,1),(383,'No','Pariatur Asperiores',NULL,7,10,1),(384,'Yes','Assumenda excepteur ',NULL,8,10,1),(385,'No','Iure dolores enim ip',NULL,9,10,1),(386,'Not justified','Irure provident inc',NULL,10,10,1),(387,'Yes','Sed labore sit totam',NULL,11,10,1),(388,'Not applicable','Ab et tempore eius ',NULL,12,10,1),(389,'Not applicable','Repudiandae itaque l',NULL,13,10,1),(390,'Unclear','In deleniti nostrum ',NULL,14,10,1),(391,'Yes','Dolor culpa officia ',NULL,15,10,1),(392,'Yes','Repudiandae et volup',NULL,16,10,1),(393,'No','Corrupti iure quisq',NULL,17,10,1),(394,'Yes','Excepturi distinctio',NULL,18,10,1),(395,'Relevant issues not addressed','Non optio sit quos ',NULL,19,10,1),(396,'Yes','Debitis aspernatur t',NULL,20,10,1),(397,'Appropriate','Esse ut culpa volup',NULL,21,10,1),(398,'Inappropriate','Quod id quas laborum',NULL,22,10,1),(399,'Unlikely','Minim suscipit a ess',NULL,23,10,1),(400,'No','Accusantium quidem r',NULL,24,10,1),(401,'Described','Adipisci laudantium',NULL,25,10,1),(402,'No','Dolor magna irure do',NULL,26,10,1),(403,'Yes','Tenetur modi aut nih',NULL,27,10,1),(404,'Outside those mentioned above','Voluptas doloremque ',NULL,28,10,1),(405,'Yes','Odio quo aut adipisi',NULL,29,10,1),(406,'Inappropriate','Nobis est sunt vol',NULL,30,10,1),(407,'Appropriate','Consectetur aut ad ',NULL,31,10,1),(408,'No','Duis ut ut nostrud a',NULL,32,10,1),(409,'No','Molestias quia fugia',NULL,33,10,1),(410,'No','Doloribus suscipit e',NULL,34,10,1),(411,'Not justified','Officiis repudiandae',NULL,35,10,1),(412,'Not sufficient','Et incididunt labore',NULL,36,10,1),(413,'No','Proident sunt disti',NULL,37,10,1),(414,'No','Eum amet incidunt ',NULL,38,10,1),(415,'No','Officia nesciunt mi',NULL,39,10,1),(416,'No','Debitis corrupti ev',NULL,40,10,1),(417,'Inappropriate','Quae in aut consequa',NULL,41,10,1),(418,'Yes','Aliquam dolor amet ',NULL,42,10,1),(419,'No','Quis ad maxime dolor',NULL,43,10,1),(420,'Yes','Enim quo dolorem eum',NULL,44,10,1),(421,'No','Repudiandae dolor te',NULL,45,10,1),(422,'Declared','Et maiores delectus',NULL,46,10,1),(423,'No','Nulla praesentium qu',NULL,47,10,1),(424,'Unclear','Iure ipsam ut repudi',NULL,1,11,1),(425,'Unclear','Dolorem explicabo M',NULL,2,11,1),(426,'Insufficient','Tempore officia atq',NULL,3,11,1),(427,'Don’t know','Exercitationem eu qu',NULL,4,11,1),(428,'Unclear','Excepturi rerum eaqu',NULL,5,11,1),(429,'Unclear','Illum odio laborios',NULL,6,11,1),(430,'Not applicable','Commodo unde duis re',NULL,7,11,1),(431,'Not required','Eos impedit iure si',NULL,8,11,1),(432,'Yes','Quis qui duis blandi',NULL,9,11,1),(433,'Not Applicable','In fuga Non sit vo',NULL,10,11,1),(434,'No','Itaque ut quod proid',NULL,11,11,1),(435,'Appropriate','Aperiam et molestiae',NULL,12,11,1),(436,'Not applicable','Molestiae qui ut cul',NULL,13,11,1),(437,'Unclear','Ut dolorum velit vo',NULL,14,11,1),(438,'Yes','Sint eveniet volupt',NULL,15,11,1),(439,'Yes','Tenetur in qui persp',NULL,16,11,1),(440,'No','Quia architecto proi',NULL,17,11,1),(441,'No','Iure velit itaque ne',NULL,18,11,1),(442,'Relevant issues addressed','Mollitia est volupta',NULL,19,11,1),(443,'Yes','Tenetur nostrum labo',NULL,20,11,1),(444,'Appropriate','Consectetur veniam ',NULL,21,11,1),(445,'Appropriate','Ipsum inventore exce',NULL,22,11,1),(446,'Likely','Nostrum consequatur ',NULL,23,11,1),(447,'Yes','Eiusmod quis ut quia',NULL,24,11,1),(448,'Described','Omnis duis labore am',NULL,25,11,1),(449,'No','Mollitia exercitatio',NULL,26,11,1),(450,'No','Ullamco numquam aspe',NULL,27,11,1),(451,'Greater than minimal risk and no direct benefit to the individual study participant but likely to yield generalizable knowledge about participant’s disorder or condition','Expedita at debitis ',NULL,28,11,1),(452,'Yes','Aliquid cumque qui d',NULL,29,11,1),(453,'Appropriate','Deserunt et hic repr',NULL,30,11,1),(454,'Appropriate','Commodo sit esse q',NULL,31,11,1),(455,'No','Recusandae Velit Na',NULL,32,11,1),(456,'No','Ipsum rerum eum dol',NULL,33,11,1),(457,'Yes','Doloremque minima of',NULL,34,11,1),(458,'Justified','Quibusdam commodi fu',NULL,35,11,1),(459,'Not sufficient','Porro ex iusto volup',NULL,36,11,1),(460,'No','Earum cum beatae qua',NULL,37,11,1),(461,'No','Sed quis et molestia',NULL,38,11,1),(462,'No','Dolorem excepturi re',NULL,39,11,1),(463,'No','Itaque minima non co',NULL,40,11,1),(464,'Appropriate','Id dolor repellendus',NULL,41,11,1),(465,'No','Minus iusto quia exp',NULL,42,11,1),(466,'Yes','Eaque culpa nostrum',NULL,43,11,1),(467,'Not Applicable','Illo explicabo Enim',NULL,44,11,1),(468,'Yes','Id cillum maiores f',NULL,45,11,1),(469,'Declared','Sit ullamco pariatur',NULL,46,11,1),(470,'No','Aperiam minim except',NULL,47,11,1),(471,'Clear','Nihil praesentium fu',NULL,1,16,2),(472,'Clear','Fugiat ducimus lab',NULL,2,16,2),(473,'Insufficient','Et ullam placeat si',NULL,3,16,2),(474,'Don’t know','Labore dolorem ex ve',NULL,4,16,2),(475,'Unclear','Distinctio Incididu',NULL,5,16,2),(476,'Unclear','Maxime ut repellendu',NULL,6,16,2),(477,'Not applicable','Corrupti est dolore',NULL,7,16,2),(478,'Yes','Cumque qui porro rer',NULL,8,16,2),(479,'No','Deserunt cum explica',NULL,9,16,2),(480,'Not justified','Eos porro dolorem e',NULL,10,16,2),(481,'No','Iste inventore corpo',NULL,11,16,2),(482,'Inappropriate','Enim in sequi sit at',NULL,12,16,2),(483,'Inappropriate','Quia laboris exercit',NULL,13,16,2),(484,'Unclear','A hic suscipit sed a',NULL,14,16,2),(485,'Yes','Nesciunt ad sint i',NULL,15,16,2),(486,'Yes','Ut commodi officiis ',NULL,16,16,2),(487,'No','Earum nesciunt quia',NULL,17,16,2),(488,'No','Non quibusdam velit ',NULL,18,16,2),(489,'Relevant issues addressed','Placeat dicta beata',NULL,19,16,2),(490,'Yes','Qui dolor facere ape',NULL,20,16,2),(491,'Inappropriate','Quis consequatur no',NULL,21,16,2),(492,'Inappropriate','Exercitationem esse ',NULL,22,16,2),(493,'Likely','Irure voluptates adi',NULL,23,16,2),(494,'Yes','Lorem aliquam qui of',NULL,24,16,2),(495,'Not Described','Dolorem sunt lorem ',NULL,25,16,2),(496,'No','Eum quis atque anim ',NULL,26,16,2),(497,'No','Officiis officia ius',NULL,27,16,2),(498,'Outside those mentioned above','Laborum et aut in si',NULL,28,16,2),(499,'Yes','Harum incidunt elig',NULL,29,16,2),(500,'Appropriate','At odio quo qui plac',NULL,30,16,2),(501,'Appropriate','Omnis voluptas aut a',NULL,31,16,2),(502,'No','Sunt modi sequi unde',NULL,32,16,2),(503,'No','Rerum officia praese',NULL,33,16,2),(504,'No','Neque delectus ipsa',NULL,34,16,2),(505,'Not justified','Consectetur vitae s',NULL,35,16,2),(506,'Not sufficient','Sapiente quasi volup',NULL,36,16,2),(507,'No','Et non voluptas pers',NULL,37,16,2),(508,'Yes','Proident ea amet d',NULL,38,16,2),(509,'No','Consequuntur in proi',NULL,39,16,2),(510,'Yes','Necessitatibus assum',NULL,40,16,2),(511,'Appropriate','In consequatur labor',NULL,41,16,2),(512,'Yes','Non in non est non d',NULL,42,16,2),(513,'Yes','A sed ut consectetur',NULL,43,16,2),(514,'No','Quibusdam minima vel',NULL,44,16,2),(515,'No','Modi tenetur delectu',NULL,45,16,2),(516,'Not Declared','Alias sit veniam qu',NULL,46,16,2),(517,'No','Totam dolore soluta ',NULL,47,16,2),(518,'sdad\r\nsdad\r\nsdsa\r\ndasd\r\ndsad\r\nasdasdasd\r\nsd\r\nsd\r\nasd\r\nasd\r\nasdas\r\ndasd\r\nas\r\ndas\r\nd\r\nasd\r\nas\r\nd\r\nasas\r\nd\r\nasd\r\nas\r\nd\r\nasd\r\nas\r\ndas\r\ndas\r\n\r\n','',NULL,48,23,1),(519,'Libero ut magnam fac','',NULL,48,26,1);
/*!40000 ALTER TABLE `reviewer_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewers_pool`
--

DROP TABLE IF EXISTS `reviewers_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewers_pool` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `affiliation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_registered` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D058B4D1A76ED395` (`user_id`),
  CONSTRAINT `FK_D058B4D1A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewers_pool`
--

LOCK TABLES `reviewers_pool` WRITE;
/*!40000 ALTER TABLE `reviewers_pool` DISABLE KEYS */;
INSERT INTO `reviewers_pool` VALUES (1,'Dani Alves','danialves@gmail.com','EPHI','2024-08-22 09:19:49',1),(2,'Drake Cox','wajir@mailinator.com','Deserunt architecto veniam quia officia voluptas enim sunt dolor delectus porro voluptate officiis pariatur Ut autem minim','2024-09-27 06:03:04',2);
/*!40000 ALTER TABLE `reviewers_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_res_requirement`
--

DROP TABLE IF EXISTS `special_res_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `special_res_requirement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_res_requirement`
--

LOCK TABLES `special_res_requirement` WRITE;
/*!40000 ALTER TABLE `special_res_requirement` DISABLE KEYS */;
INSERT INTO `special_res_requirement` VALUES (1,'Reagents'),(2,'None');
/*!40000 ALTER TABLE `special_res_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Draft','DRAFT','warning'),(2,'Submitted','SUBMITTED','primary'),(3,'Received','RECEIVED','primary'),(4,'Under Review','UNDER_REVIEW','info'),(5,'Certified','CERTIFIED','success'),(6,'Rejected','REJECTED','danger'),(7,'Withdrawn','WITHDRAWN','danger'),(8,'Archived','ARCHIVED','secondary'),(9,'Review Invitation sent','INVITATION_SENT','info'),(10,'Review Invitation Accepted','INVITATION_ACCEPTED','success'),(11,'Review Invitation Declined','INVITATION_DECLINED','danger'),(12,'Sent to Board Meeting','SENT_TO_MEETING','success');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_population`
--

DROP TABLE IF EXISTS `study_population`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_population` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_population`
--

LOCK TABLES `study_population` WRITE;
/*!40000 ALTER TABLE `study_population` DISABLE KEYS */;
INSERT INTO `study_population` VALUES (1,'Child'),(2,'>10');
/*!40000 ALTER TABLE `study_population` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_type`
--

DROP TABLE IF EXISTS `study_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_type`
--

LOCK TABLES `study_type` WRITE;
/*!40000 ALTER TABLE `study_type` DISABLE KEYS */;
INSERT INTO `study_type` VALUES (1,'Full',NULL),(2,'Other',NULL);
/*!40000 ALTER TABLE `study_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_super_admin` tinyint(1) DEFAULT NULL,
  `directorate_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  KEY `IDX_8D93D6499BFF530E` (`directorate_id`),
  CONSTRAINT `FK_8D93D6499BFF530E` FOREIGN KEY (`directorate_id`) REFERENCES `directorate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'frew.legese@gmail.com','[\"ROLE_ADMIN\", \"ROLE_USER\", \"ROLE_BOARD_MEMBER\", \"ROLE_CHAIR\"]','$2y$13$62XQ2S0Nc9TbZ72fib9KZe.yPS7GNdo1iSR7wZcTRaQU13w55P1V2',1,NULL,NULL,NULL),(2,'frew.legese@outlook.com','[\"ROLE_USER\", \"ROLE_BOARD_MEMBER\", \"ROLE_CHAIR\"]','$2y$13$PO4BvdqzyppxJlNvCskFiuPMvmfx5NadAvJrzs3RYw0owGTWkZ0eG',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,'VC',NULL,NULL,'2024-08-21 17:17:32',NULL);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_permission`
--

DROP TABLE IF EXISTS `user_group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_permission` (
  `user_group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`user_group_id`,`permission_id`),
  KEY `IDX_4A91B1C51ED93D47` (`user_group_id`),
  KEY `IDX_4A91B1C5FED90CCA` (`permission_id`),
  CONSTRAINT `FK_4A91B1C51ED93D47` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4A91B1C5FED90CCA` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_permission`
--

LOCK TABLES `user_group_permission` WRITE;
/*!40000 ALTER TABLE `user_group_permission` DISABLE KEYS */;
INSERT INTO `user_group_permission` VALUES (1,1);
/*!40000 ALTER TABLE `user_group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_user`
--

DROP TABLE IF EXISTS `user_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_user` (
  `user_group_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`user_group_id`,`user_id`),
  KEY `IDX_3AE4BD51ED93D47` (`user_group_id`),
  KEY `IDX_3AE4BD5A76ED395` (`user_id`),
  CONSTRAINT `FK_3AE4BD51ED93D47` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3AE4BD5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_user`
--

LOCK TABLES `user_group_user` WRITE;
/*!40000 ALTER TABLE `user_group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permission`
--

DROP TABLE IF EXISTS `user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_permission` (
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `IDX_472E5446A76ED395` (`user_id`),
  KEY `IDX_472E5446FED90CCA` (`permission_id`),
  CONSTRAINT `FK_472E5446A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_472E5446FED90CCA` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permission`
--

LOCK TABLES `user_permission` WRITE;
/*!40000 ALTER TABLE `user_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `version` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `changes_made` longtext COLLATE utf8mb4_unicode_ci,
  `version_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `application_id` int NOT NULL,
  `decision_id` int DEFAULT NULL,
  `attachment_type_id` int DEFAULT NULL,
  `review_type_id` int DEFAULT NULL,
  `report_expectation_period` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BF1CD3C33E030ACD` (`application_id`),
  KEY `IDX_BF1CD3C3BDEE7539` (`decision_id`),
  KEY `IDX_BF1CD3C3DD9D915` (`attachment_type_id`),
  KEY `IDX_BF1CD3C35EA23864` (`review_type_id`),
  CONSTRAINT `FK_BF1CD3C33E030ACD` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`),
  CONSTRAINT `FK_BF1CD3C35EA23864` FOREIGN KEY (`review_type_id`) REFERENCES `review_type` (`id`),
  CONSTRAINT `FK_BF1CD3C3BDEE7539` FOREIGN KEY (`decision_id`) REFERENCES `decision_type` (`id`),
  CONSTRAINT `FK_BF1CD3C3DD9D915` FOREIGN KEY (`attachment_type_id`) REFERENCES `attachment_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,'2024-08-21 14:06:31',NULL,'1','2024-08-21 14:06:31','EPHI-SERO-1-24-1-Original protocol-02-08-24-.txt',NULL,NULL,NULL,1,NULL,1,NULL,'6'),(2,'2024-08-21 17:07:29',NULL,'1','2024-08-21 17:07:29','EPHI-SERO-2-24-1-Original protocol-05-08-24-Tanisha Cox.txt',NULL,NULL,NULL,2,2,1,NULL,NULL),(3,'2024-08-21 17:14:36',NULL,'1','2024-08-21 17:14:36','EPHI-SERO-3-24-1-Original_protocol-05-08-24-frew.legese@gmail.com.txt',NULL,NULL,NULL,3,2,2,NULL,'6'),(4,'2024-08-22 12:50:40',NULL,'1','2024-08-22 12:50:40','EPHI-SERO-4-24-1-Original_protocol-12-08-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,4,1,2,NULL,'6'),(5,'2024-08-25 17:29:18','dasda','2','2024-08-25 17:29:18','EPHI-SERO-2-24-2-Original_protocol-05-08-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,2,NULL,3,NULL,NULL),(6,'2024-08-25 17:58:08','dsda','2','2024-08-25 17:58:08','EPHI-SERO-4-24-2-Original_protocol-05-08-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,4,NULL,3,NULL,'6'),(7,'2024-08-25 20:34:12',NULL,'1','2024-08-25 20:34:12','EPHI-SERO-5-24-1-Original_protocol-08-08-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,5,NULL,1,NULL,NULL),(8,'2024-08-26 07:39:59',NULL,'1','2024-08-26 07:39:59','EPHI-SERO-6-24-1-Original_protocol-07-08-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,6,NULL,3,NULL,'6'),(9,'2024-08-26 08:43:15','Neque recusandae Vo','2','2024-08-26 08:43:15','EPHI-SERO-6-24-2-Original_protocol-08-08-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,6,NULL,3,NULL,NULL),(10,'2024-08-27 08:50:50','trans test','2','2024-08-27 08:50:50','EPHI-SERO-5-24-2-Original_protocol-08-08-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,5,NULL,3,NULL,NULL),(11,'2024-08-27 08:51:34','ethiojobs logo\r\nFind Jobs\r\nFind Companies\r\nBlog\r\nContact Us\r\nLog In\r\nSign up\r\nEmployers, are you recruiting?\r\n\r\nFind your dream job\r\n\r\nPopular Search:\r\n\r\nFilter Jobs\r\nKey Words\r\nKey Words\r\n\r\nor\r\n\r\nSorted by relevance\r\n\r\nShowing 1 to 2 of 2 matching Jobs\r\n\r\nPlus\r\n\r\nEasy Apply\r\n\r\nHEAD of IT\r\n\r\n5 days ago by\r\n\r\nlocation\r\n\r\nOffice\r\nlocation\r\n\r\nDeadline : August 30th 2024\r\n\r\nAddis Ababa\r\n\r\nPlus\r\n\r\nEasy Apply\r\n\r\nIT Specialist\r\n\r\n6 days ago by\r\n\r\nlocation\r\n\r\nHybrid\r\nlocation\r\n\r\nDeadline : September 21st 2024\r\n\r\nAddis Ababa\r\n\r\nSign up\r\n\r\nGet personalized recommendation and apply for jobs.\r\n\r\nor\r\n\r\nAlready have a Job Seeker Account ?\r\n\r\nLevel up your job\r\nsearch\r\nBenefit icon\r\n\r\nUnique jobs in niche industries\r\nBenefit icon\r\n\r\nSet email job alerts & get personalized jobs\r\nBenefit icon\r\n\r\nPersonalized job filters\r\nBenefit icon\r\n\r\nShowcase skills beyond a resume\r\nBenefit icon\r\n\r\nLet recruiters reach out to you\r\nEthiojobs footer logo\r\nFAQ\r\n\r\nHow to register\r\n\r\nHow to apply for a job?\r\n\r\nHow do I reset my password?\r\n\r\nHow do I edit my CV on Ethiojobs?\r\nJob Seekers\r\n\r\nFind Jobs\r\n\r\nRegister\r\n\r\nPost CVs\r\n\r\nJob Alerts\r\nEmployers\r\n\r\nLogin\r\n\r\nRegister\r\n\r\nPost Jobs\r\n\r\nFeatures\r\nContact us\r\n\r\nMeskel Flower Road\r\nBehind Nazra Hotel, Addis Ababa, Ethiopia\r\n\r\n+251-993-87-22-46 | +251-969-23-90-94\r\n\r\ncandidates@ethiojobs.net\r\n\r\nSubscribe to get updates from Ethiojobs\r\nethiojob linkedIn link\r\nethiojob youtube link\r\nethiojob youtube link\r\nethiojob twitter link\r\nethiojob facebook link\r\nethiojob telegram link\r\n\r\nAbout Us\r\n\r\nContact Us\r\n\r\nFAQs','3','2024-08-27 08:51:34','EPHI-SERO-5-24-3-Original_protocol-08-08-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,5,NULL,3,NULL,NULL),(12,'2024-08-27 09:10:32',NULL,'1','2024-08-27 09:10:32','EPHI-SERO-7-24-1-Original_protocol-09-08-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,7,NULL,1,NULL,NULL),(13,'2024-08-27 09:13:26',NULL,'1','2024-08-27 09:13:26','EPHI-SERO-8-24-1-Original_protocol-09-08-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,8,NULL,2,NULL,NULL),(14,'2024-08-27 09:24:49','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.','2','2024-08-27 09:24:49','EPHI-SERO-8-24-2-Original_protocol-09-08-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,8,NULL,2,NULL,NULL),(15,'2024-08-27 09:26:16','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.','3','2024-08-27 09:26:16','EPHI-SERO-8-24-3-Original_protocol-09-08-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,8,NULL,2,NULL,NULL),(16,'2024-08-27 11:33:15',NULL,'1','2024-08-27 11:33:15','EPHI-SERO-9-24-1-Original_protocol-11-08-24-frew.legese@outlook.com.docx',NULL,NULL,NULL,9,NULL,1,NULL,'6'),(17,'2024-08-28 12:44:58','Mobile twst for new version','2','2024-08-28 12:44:58','EPHI-SERO-9-24-2-Original_protocol-12-08-24-frew.legese@outlook.com.docx',NULL,NULL,NULL,9,NULL,2,NULL,'6'),(18,'2024-09-02 07:25:44','flask run --host=127.0.0.1:2002','4','2024-09-02 07:25:44','EPHI-SERO-8-24-4-Original_protocol-07-09-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,8,NULL,2,NULL,NULL),(19,'2024-09-04 12:26:46','Test version changes made','2','2024-09-04 12:26:46','EPHI-SERO-1-24-2-Original_protocol-12-09-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,1,NULL,2,NULL,NULL),(20,'2024-09-04 12:30:23','test changes','3','2024-09-04 12:30:23','EPHI-SERO-1-24-3-Original_protocol-12-09-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,1,NULL,3,NULL,NULL),(21,'2024-09-04 12:34:54','running wate shortage','4','2024-09-04 12:34:54','EPHI-SERO-1-24-4-Original_protocol-12-09-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,1,NULL,2,NULL,NULL),(22,'2024-09-04 12:35:11','running wate shortage','5','2024-09-04 12:35:11','EPHI-SERO-1-24-5-Original_protocol-12-09-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,1,NULL,2,NULL,NULL),(23,'2024-09-04 12:41:03','ddsd','6','2024-09-04 12:41:03','EPHI-SERO-1-24-6-Original_protocol-12-09-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,1,NULL,3,NULL,'6'),(24,'2024-09-04 13:52:18','Test actionviz actionviz actionviz Changes made on a new version','4','2024-09-04 13:52:18','EPHI-SERO-5-24-4-Original_protocol-01-09-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,5,NULL,1,NULL,'6'),(25,'2024-09-04 13:56:47','ethiojobs logo Find Jobs Find Companies Blog Contact Us Log In Sign up Employers, are you recruiting? Find your dream job Popular Search: Filter Jobs Key Words Key Words or Sorted by relevance Showing 1 to 2 of 2 matching Jobs Plus Easy Apply HEAD of IT 5 days ago by location Office location Deadline : August 30th 2024 Addis Ababa Plus Easy Apply IT Specialist 6 days ago by location Hybrid location Deadline : September 21st 2024 Addis Ababa Sign up Get personalized recommendation and apply for jobs. or Already have a Job Seeker Account ? Level up your job search Benefit icon Unique jobs in niche industries Benefit icon Set email job alerts & get personalized jobs Benefit icon Personalized job filters Benefit icon Showcase skills beyond a resume Benefit icon Let recruiters reach out to you Ethiojobs footer logo FAQ How to register How to apply for a job? How do I reset my password? How do I edit my CV on Ethiojobs? Job Seekers Find Jobs Register Post CVs Job Alerts Employers Login Register Post Jobs Features Contact us Meskel Flower Road Behind Nazra Hotel, Addis Ababa, Ethiopia +251-993-87-22-46 | +251-969-23-90-94 candidates@ethiojobs.net Subscribe to get updates from Ethiojobs ethiojob linkedIn link ethiojob youtube link ethiojob youtube link ethioj','2','2024-09-04 13:56:47','EPHI-SERO-7-24-2-Original_protocol-01-09-24-frew.legese@gmail.com.pdf',NULL,NULL,NULL,7,NULL,2,NULL,'6'),(26,'2024-09-05 09:11:14','dsd','5','2024-09-05 09:11:14','EPHI-SERO-8-24-5-Original_protocol-09-09-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,8,NULL,3,NULL,'6'),(27,'2024-10-01 07:58:28',NULL,'1','2024-10-01 07:58:28',NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL),(28,'2024-10-01 12:38:27','nmmbmbmmnmnxcvbxcbvxcbvxcvbfgfghasdasdfasdfewweqwtweterteryretruytrutyrutrutyrutyadsffsdafdsdfgdfsfdfgdhfdhfgdhfgdhgfzvcxzvxczvxczvxczvxzcvzvczvxzvcxzvcxzvxczvcxzvcxzvcxzvxczvcxzvcxzvczvcxzvxczczvczvcxzyr','2','2024-10-01 12:38:27','EPHI-SERO-10-24-2-Original_protocol-12-10-24-frew.legese@gmail.com.docx',NULL,NULL,NULL,10,NULL,2,NULL,'6');
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_experience`
--

DROP TABLE IF EXISTS `work_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_started` date DEFAULT NULL,
  `date_left` date DEFAULT NULL,
  `responsibilities` longtext COLLATE utf8mb4_unicode_ci,
  `profile_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1EF36CD0CCFA12B8` (`profile_id`),
  CONSTRAINT `FK_1EF36CD0CCFA12B8` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_experience`
--

LOCK TABLES `work_experience` WRITE;
/*!40000 ALTER TABLE `work_experience` DISABLE KEYS */;
INSERT INTO `work_experience` VALUES (1,'Walton Woodard Trading','Quisquam laboris min','2020-12-28','1991-10-01','Neque ut inventore v',1),(2,'Herman Raymond Trading','Hic ut sit beatae lo','2021-03-10','1971-03-17','Dolor in in dolor se',1),(3,'Nash and Hahn Inc','Ea est numquam molli','1987-05-19','1995-10-14','Anim velit voluptas',1),(6,'EPHI','DA','2023-07-24','2022-06-25','JSa',2);
/*!40000 ALTER TABLE `work_experience` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-10 12:36:56
