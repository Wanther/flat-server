-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: flat
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `cloud_storage_configs`
--

DROP TABLE IF EXISTS `cloud_storage_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_storage_configs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `user_uuid` varchar(40) NOT NULL,
  `total_usage` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'total cloud storage of a user (bytes)',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cloud_storage_configs_user_uuid_uindex` (`user_uuid`),
  KEY `cloud_storage_configs_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cloud_storage_files`
--

DROP TABLE IF EXISTS `cloud_storage_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_storage_files` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `file_uuid` varchar(40) NOT NULL,
  `file_name` varchar(128) NOT NULL COMMENT 'file name',
  `file_size` int unsigned NOT NULL COMMENT 'file size (bytes)',
  `file_url` varchar(256) NOT NULL COMMENT 'file url',
  `directory_path` varchar(300) NOT NULL DEFAULT '/' COMMENT 'directory path',
  `payload` json NOT NULL DEFAULT (_utf8mb4'{}'),
  `resource_type` varchar(20) NOT NULL,
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cloud_storage_files_file_uuid_uindex` (`file_uuid`),
  KEY `cloud_storage_files_resource_type_index` (`resource_type`),
  KEY `cloud_storage_files_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cloud_storage_user_files`
--

DROP TABLE IF EXISTS `cloud_storage_user_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_storage_user_files` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `file_uuid` varchar(40) NOT NULL,
  `user_uuid` varchar(40) NOT NULL,
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cloud_storage_user_files_file_uuid_user_uuid_uindex` (`file_uuid`,`user_uuid`),
  KEY `cloud_storage_user_files_file_uuid_index` (`file_uuid`),
  KEY `cloud_storage_user_files_user_uuid_index` (`user_uuid`),
  KEY `cloud_storage_user_files_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_infos`
--

DROP TABLE IF EXISTS `oauth_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_infos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `oauth_uuid` varchar(40) NOT NULL,
  `owner_uuid` varchar(40) NOT NULL,
  `app_name` varchar(30) NOT NULL COMMENT 'application name',
  `app_desc` varchar(300) NOT NULL COMMENT 'application description',
  `client_id` varchar(40) NOT NULL,
  `homepage_url` varchar(100) NOT NULL COMMENT 'application homepage url',
  `logo_url` varchar(300) NOT NULL COMMENT 'application logo url',
  `scopes` varchar(300) NOT NULL,
  `callbacks_url` varchar(2005) NOT NULL,
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_infos_oauth_uuid_uindex` (`oauth_uuid`),
  UNIQUE KEY `oauth_infos_client_id_uindex` (`client_id`),
  KEY `oauth_infos_owner_uuid_index` (`owner_uuid`),
  KEY `oauth_infos_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_secrets`
--

DROP TABLE IF EXISTS `oauth_secrets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_secrets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `oauth_uuid` varchar(40) NOT NULL,
  `secret_uuid` varchar(40) NOT NULL,
  `client_id` varchar(40) NOT NULL COMMENT 'application client id',
  `client_secret` varchar(40) NOT NULL COMMENT 'application client secret',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_secrets_secret_uuid_uindex` (`secret_uuid`),
  UNIQUE KEY `oauth_secrets_client_id_client_secret_uindex` (`client_id`,`client_secret`),
  KEY `oauth_secrets_oauth_uuid_index` (`oauth_uuid`),
  KEY `oauth_secrets_client_id_index` (`client_id`),
  KEY `oauth_secrets_client_secret_index` (`client_secret`),
  KEY `oauth_secrets_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_users`
--

DROP TABLE IF EXISTS `oauth_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `oauth_uuid` varchar(40) NOT NULL,
  `user_uuid` varchar(40) NOT NULL COMMENT 'user id',
  `scopes` varchar(300) NOT NULL,
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_users_oauth_uuid_user_uuid_uindex` (`oauth_uuid`,`user_uuid`),
  KEY `oauth_users_oauth_uuid_index` (`oauth_uuid`),
  KEY `oauth_users_user_uuid_index` (`user_uuid`),
  KEY `oauth_users_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room_periodic`
--

DROP TABLE IF EXISTS `room_periodic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_periodic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `periodic_uuid` varchar(40) NOT NULL,
  `fake_room_uuid` varchar(40) NOT NULL,
  `begin_time` datetime(3) NOT NULL COMMENT 'room begin time',
  `end_time` datetime(3) NOT NULL COMMENT 'room end time',
  `room_status` enum('Idle','Started','Paused','Stopped') NOT NULL COMMENT 'current room status',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_periodic_fake_room_uuid_uindex` (`fake_room_uuid`),
  KEY `room_periodic_begin_time_index` (`begin_time`),
  KEY `room_periodic_room_status_index` (`room_status`),
  KEY `room_periodic_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room_periodic_configs`
--

DROP TABLE IF EXISTS `room_periodic_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_periodic_configs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `periodic_uuid` varchar(40) NOT NULL,
  `owner_uuid` varchar(40) NOT NULL,
  `title` varchar(150) NOT NULL COMMENT 'room title',
  `room_origin_begin_time` datetime(3) NOT NULL COMMENT 'room origin begin time',
  `room_origin_end_time` datetime(3) NOT NULL COMMENT 'room origin end time',
  `weeks` varchar(13) NOT NULL COMMENT 'periodic week',
  `rate` tinyint NOT NULL COMMENT 'periodic rate (max 50)',
  `end_time` datetime(3) NOT NULL COMMENT 'periodic end time',
  `room_type` enum('OneToOne','BigClass','SmallClass') NOT NULL COMMENT 'room type',
  `periodic_status` enum('Idle','Started','Stopped') NOT NULL COMMENT 'current periodic status',
  `region` enum('cn-hz','us-sv','sg','in-mum','gb-lon') NOT NULL,
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `periodic_configs_periodic_uuid_uindex` (`periodic_uuid`),
  KEY `periodic_configs_owner_uuid_index` (`owner_uuid`),
  KEY `room_periodic_configs_type_index` (`room_type`),
  KEY `rooms_periodic_status_index` (`periodic_status`),
  KEY `periodic_configs_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room_periodic_users`
--

DROP TABLE IF EXISTS `room_periodic_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_periodic_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `periodic_uuid` varchar(40) NOT NULL,
  `user_uuid` varchar(40) NOT NULL,
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_periodic_periodic_uuid_user_uuid_uindex` (`periodic_uuid`,`user_uuid`),
  KEY `room_periodic_users_room_uuid_index` (`periodic_uuid`),
  KEY `room_periodic_users_user_uuid_index` (`user_uuid`),
  KEY `room_periodic_users_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room_records`
--

DROP TABLE IF EXISTS `room_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_records` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `room_uuid` varchar(40) NOT NULL,
  `begin_time` datetime(3) NOT NULL COMMENT 'room record begin time',
  `end_time` datetime(3) NOT NULL COMMENT 'room record end time',
  `agora_sid` varchar(40) NOT NULL DEFAULT '' COMMENT 'agora record id',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `room_records_room_uuid_index` (`room_uuid`),
  KEY `room_records_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room_users`
--

DROP TABLE IF EXISTS `room_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `room_uuid` varchar(40) NOT NULL,
  `user_uuid` varchar(40) NOT NULL,
  `rtc_uid` varchar(6) NOT NULL COMMENT 'front-end needs this field to set rtc',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_users_room_uuid_rtc_uid_uindex` (`room_uuid`,`rtc_uid`),
  UNIQUE KEY `room_users_room_uuid_user_uuid_uindex` (`room_uuid`,`user_uuid`),
  KEY `room_users_room_uuid_index` (`room_uuid`),
  KEY `room_users_user_uuid_index` (`user_uuid`),
  KEY `room_users_is_delete_index` (`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `room_uuid` varchar(40) NOT NULL,
  `periodic_uuid` varchar(40) NOT NULL COMMENT 'periodic uuid',
  `owner_uuid` varchar(40) NOT NULL,
  `title` varchar(150) NOT NULL COMMENT 'room title',
  `room_type` enum('OneToOne','BigClass','SmallClass') NOT NULL COMMENT 'room type',
  `room_status` enum('Idle','Started','Paused','Stopped') NOT NULL COMMENT 'current room status',
  `begin_time` datetime(3) NOT NULL COMMENT 'room begin time',
  `end_time` datetime(3) NOT NULL COMMENT 'room end time',
  `region` enum('cn-hz','us-sv','sg','in-mum','gb-lon') NOT NULL,
  `whiteboard_room_uuid` varchar(40) NOT NULL,
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rooms_room_uuid_uindex` (`room_uuid`),
  UNIQUE KEY `rooms_whiteboard_room_uuid_uindex` (`whiteboard_room_uuid`),
  KEY `rooms_periodic_uuid_index` (`periodic_uuid`),
  KEY `rooms_owner_uuid_index` (`owner_uuid`),
  KEY `rooms_room_type_index` (`room_type`),
  KEY `rooms_room_status_index` (`room_status`),
  KEY `rooms_begin_time_index` (`begin_time`),
  KEY `rooms_is_delete_index` (`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_agora`
--

DROP TABLE IF EXISTS `user_agora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_agora` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `user_uuid` varchar(40) NOT NULL,
  `user_name` varchar(40) NOT NULL COMMENT 'agora nickname',
  `union_uuid` varchar(32) NOT NULL COMMENT 'agora id',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_agora_user_uuid_uindex` (`user_uuid`),
  KEY `user_agora_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_apple`
--

DROP TABLE IF EXISTS `user_apple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_apple` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `user_uuid` varchar(40) NOT NULL,
  `user_name` varchar(40) NOT NULL COMMENT 'apple nickname',
  `union_uuid` varchar(50) NOT NULL COMMENT 'apple id',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_apple_user_uuid_uindex` (`user_uuid`),
  KEY `user_apple_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_email`
--

DROP TABLE IF EXISTS `user_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_email` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `user_uuid` varchar(40) NOT NULL,
  `user_email` varchar(100) NOT NULL COMMENT 'email address',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email_user_uuid_uindex` (`user_uuid`),
  UNIQUE KEY `user_email_user_email_uindex` (`user_email`),
  KEY `user_email_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_github`
--

DROP TABLE IF EXISTS `user_github`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_github` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `user_uuid` varchar(40) NOT NULL,
  `user_name` varchar(40) NOT NULL COMMENT 'github nickname',
  `union_uuid` varchar(32) NOT NULL COMMENT 'github id',
  `access_token` varchar(255) NOT NULL DEFAULT '' COMMENT '[deprecated]: github access token',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_github_user_uuid_uindex` (`user_uuid`),
  KEY `user_github_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_google`
--

DROP TABLE IF EXISTS `user_google`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_google` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `user_uuid` varchar(40) NOT NULL,
  `user_name` varchar(40) NOT NULL COMMENT 'google nickname',
  `union_uuid` varchar(32) NOT NULL COMMENT 'google id',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_google_user_uuid_uindex` (`user_uuid`),
  KEY `user_google_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_phone`
--

DROP TABLE IF EXISTS `user_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_phone` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `user_uuid` varchar(40) NOT NULL,
  `user_name` varchar(40) NOT NULL COMMENT 'phone nickname',
  `phone_number` varchar(50) NOT NULL COMMENT 'phone number',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_phone_user_uuid_uindex` (`user_uuid`),
  UNIQUE KEY `user_phone_phone_number_uindex` (`phone_number`),
  KEY `user_phone_is_delete_index` (`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_pmi`
--

DROP TABLE IF EXISTS `user_pmi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_pmi` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `user_uuid` varchar(40) NOT NULL,
  `pmi` varchar(20) NOT NULL,
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_pmi_user_uuid_uindex` (`user_uuid`),
  UNIQUE KEY `user_pmi_pmi_uindex` (`pmi`),
  KEY `user_pmi_is_delete_index` (`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_sensitive`
--

DROP TABLE IF EXISTS `user_sensitive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sensitive` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `user_uuid` varchar(40) NOT NULL,
  `type` varchar(128) NOT NULL COMMENT 'sensitive type like ''phone''',
  `content` varchar(2083) NOT NULL COMMENT 'sensitive value like ''123****4''',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_sensitive_user_uuid_index` (`user_uuid`),
  KEY `user_sensitive_type_index` (`type`),
  KEY `user_sensitive_is_delete_index` (`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_wechat`
--

DROP TABLE IF EXISTS `user_wechat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_wechat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `user_uuid` varchar(40) NOT NULL,
  `user_name` varchar(40) NOT NULL COMMENT 'wechat nickname',
  `open_uuid` varchar(40) NOT NULL COMMENT 'wechat open id',
  `union_uuid` varchar(40) NOT NULL COMMENT 'wechat union id',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_wechat_user_uuid_uindex` (`user_uuid`),
  KEY `user_wechat_is_delete_index` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `version` int NOT NULL,
  `user_uuid` varchar(40) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `avatar_url` varchar(2083) NOT NULL,
  `gender` enum('Man','Woman','None') NOT NULL DEFAULT 'None',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_uuid_uindex` (`user_uuid`),
  KEY `users_is_delete_index` (`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-15 16:41:30
