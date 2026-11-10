-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: grabfood_mini
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `admin_logs`
--

DROP TABLE IF EXISTS `admin_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_logs` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `admin_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `action` enum('USER_STATUS_CHANGE','USER_ROLE_ASSIGN','VENDOR_STATUS_CHANGE','PRODUCT_HARD_DELETE','PRODUCT_VISIBILITY_TOGGLE','ORDER_STATUS_OVERRIDE','SYSTEM_CONFIG_UPDATE','SYSTEM_CONFIG_BATCH_UPDATE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `admin_logs_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_logs`
--

LOCK TABLES `admin_logs` WRITE;
/*!40000 ALTER TABLE `admin_logs` DISABLE KEYS */;
INSERT INTO `admin_logs` VALUES ('0a3292a2-9613-45e2-9729-a7c889be7a9f','00000000-0000-0000-0000-000000000001','USER_ROLE_ASSIGN','user','ad3379fa-9798-40ee-8f10-68f76aea4e15','Gán role \"shipper\" cho \"Nguyen Van A\" (trước đó: user)','{\"oldRole\":\"user\",\"newRole\":\"shipper\",\"userName\":\"Nguyen Van A\",\"userEmail\":\"belake6808@adsprite.com\"}',NULL,'2026-06-29 02:12:49'),('1229a589-6aed-40a9-9a1f-f05d7ace02f7','00000000-0000-0000-0000-000000000001','USER_STATUS_CHANGE','user','ad3379fa-9798-40ee-8f10-68f76aea4e15','Khóa tài khoản \"Nguyen Van A\" (belake6808@adsprite.com) - Lý do: Lâu ngày không dùng','{\"oldStatus\":\"active\",\"newStatus\":\"banned\",\"userName\":\"Nguyen Van A\",\"userEmail\":\"belake6808@adsprite.com\",\"banReason\":\"Lâu ngày không dùng\"}',NULL,'2026-06-29 01:57:56'),('156ae99d-67ed-4b42-8cd8-afa05bbba4d7','00000000-0000-0000-0000-000000000001','USER_STATUS_CHANGE','user','ad3379fa-9798-40ee-8f10-68f76aea4e15','Khóa tài khoản \"Nguyen Van A\" (belake6808@adsprite.com) - Lý do: Hành vi bất thường / Nghi ngờ xâm nhập','{\"oldStatus\":\"active\",\"newStatus\":\"banned\",\"userName\":\"Nguyen Van A\",\"userEmail\":\"belake6808@adsprite.com\",\"banReason\":\"Hành vi bất thường / Nghi ngờ xâm nhập\"}',NULL,'2026-06-29 02:11:28'),('5d10e202-ea26-46ff-93db-a8ed1885d519','00000000-0000-0000-0000-000000000001','USER_STATUS_CHANGE','user','ad3379fa-9798-40ee-8f10-68f76aea4e15','Khóa tài khoản \"Nguyen Van A\" (belake6808@adsprite.com) - Lý do: Vi phạm tiêu chuẩn cộng đồng / Ngôn từ quấy rối','{\"oldStatus\":\"active\",\"newStatus\":\"banned\",\"userName\":\"Nguyen Van A\",\"userEmail\":\"belake6808@adsprite.com\",\"banReason\":\"Vi phạm tiêu chuẩn cộng đồng / Ngôn từ quấy rối\"}',NULL,'2026-06-29 02:12:39'),('5e890499-f1de-4c62-9fef-c9e337d4fca2','00000000-0000-0000-0000-000000000001','USER_ROLE_ASSIGN','user','00000000-0000-0000-0000-000000000002','Gán role \"manager\" cho \"Platform Manager\" (trước đó: manager)','{\"oldRole\":\"manager\",\"newRole\":\"manager\",\"userName\":\"Platform Manager\",\"userEmail\":\"manager@grabfood.com\"}',NULL,'2026-06-28 08:32:25'),('b7d85541-6ca1-49b9-b31c-efcff05b04af','00000000-0000-0000-0000-000000000001','USER_STATUS_CHANGE','user','ad3379fa-9798-40ee-8f10-68f76aea4e15','Mở khóa tài khoản \"Nguyen Van A\" (belake6808@adsprite.com)','{\"oldStatus\":\"banned\",\"newStatus\":\"active\",\"userName\":\"Nguyen Van A\",\"userEmail\":\"belake6808@adsprite.com\",\"banReason\":null}',NULL,'2026-06-29 02:00:47'),('c682a7c2-7e68-46ee-81c4-059f2f6f2e9d','00000000-0000-0000-0000-000000000001','USER_STATUS_CHANGE','user','ad3379fa-9798-40ee-8f10-68f76aea4e15','Mở khóa tài khoản \"Nguyen Van A\" (belake6808@adsprite.com)','{\"oldStatus\":\"banned\",\"newStatus\":\"active\",\"userName\":\"Nguyen Van A\",\"userEmail\":\"belake6808@adsprite.com\",\"banReason\":null}',NULL,'2026-06-29 02:11:33'),('e887b78c-1bbb-4bec-9fdb-2288af4a7d27','00000000-0000-0000-0000-000000000001','USER_STATUS_CHANGE','user','ad3379fa-9798-40ee-8f10-68f76aea4e15','Khóa tài khoản \"Nguyen Van A\" (belake6808@adsprite.com) - Lý do: Vi phạm tiêu chuẩn cộng đồng / Ngôn từ quấy rối','{\"oldStatus\":\"active\",\"newStatus\":\"banned\",\"userName\":\"Nguyen Van A\",\"userEmail\":\"belake6808@adsprite.com\",\"banReason\":\"Vi phạm tiêu chuẩn cộng đồng / Ngôn từ quấy rối\"}',NULL,'2026-06-29 02:05:13');
/*!40000 ALTER TABLE `admin_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_conversations`
--

DROP TABLE IF EXISTS `ai_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_conversations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `restaurant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_message_at` datetime DEFAULT NULL,
  `business_memory` json DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `ai_conversations_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_conversations`
--

LOCK TABLES `ai_conversations` WRITE;
/*!40000 ALTER TABLE `ai_conversations` DISABLE KEYS */;
INSERT INTO `ai_conversations` VALUES ('0ad17f68-e9b7-4443-a007-9a7b2557734c','rest-1','2026-07-01 17:15:20',NULL,'2026-07-01 12:28:55','2026-07-01 17:15:20'),('bc9628bb-65d3-4422-ba8c-9c65ec7366f0','rest-2',NULL,NULL,'2026-06-28 08:22:57','2026-06-28 08:23:00');
/*!40000 ALTER TABLE `ai_conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ai_messages`
--

DROP TABLE IF EXISTS `ai_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_messages` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ai_conversation_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role` enum('user','assistant','system','tool') COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `tool_calls` json DEFAULT NULL,
  `tool_call_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ai_conversation_id` (`ai_conversation_id`),
  CONSTRAINT `ai_messages_ibfk_1` FOREIGN KEY (`ai_conversation_id`) REFERENCES `ai_conversations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_messages`
--

LOCK TABLES `ai_messages` WRITE;
/*!40000 ALTER TABLE `ai_messages` DISABLE KEYS */;
INSERT INTO `ai_messages` VALUES ('6c833790-1f87-4f07-aea7-92e38bf6ceb0','0ad17f68-e9b7-4443-a007-9a7b2557734c','user','Đánh giá hiệu quả kinh doanh tuần qua',NULL,NULL,'2026-07-01 17:15:20','2026-07-01 17:15:20'),('cd75e847-b88e-4dec-81b8-5898e533a1bc','0ad17f68-e9b7-4443-a007-9a7b2557734c','assistant','{\"insight\":\"Quán ăn ghi nhận tổng doanh thu trong tuần qua là 195000 VND với 1 đơn hàng.\",\"actionable_advice\":[\"Sử dụng chiến lược khuyến mãi để tăng số lượng đơn hàng.\"],\"chart_type\":\"bar\",\"chart_title\":\"Doanh Thu Theo Ngày Trong Tuần Qua\",\"chart_data\":[{\"name\":\"Thứ 2, 29/06\",\"value\":195000},{\"name\":\"\\\"Thứ 3, 30/06\",\"value\":\"Chưa có dữ liệu\"},{\"name\":\"\\\"Thứ 4, 01/07\",\"value\":\"Chưa có dữ liệu\"},{\"name\":\"\\\"Thứ 5, 02/07\",\"value\":\"Chưa có dữ liệu\"},{\"name\":\"\\\"Thứ 6, 03/07\",\"value\":\"Chưa có dữ liệu\"},{\"name\":\"\\\"Thứ 7, 04/07\",\"value\":\"Chưa có dữ liệu\"},{\"name\":\"Chủ nhật, 05/07\",\"value\":\"Chưa có dữ liệu\"}]}',NULL,NULL,'2026-07-01 17:15:21','2026-07-01 17:15:21');
/*!40000 ALTER TABLE `ai_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `menu_item_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `quantity` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`),
  KEY `menu_item_id` (`menu_item_id`),
  CONSTRAINT `cart_items_ibfk_131` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_items_ibfk_132` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (2,'426945ac-b773-4a5d-9680-bee5dbb4edc0','menu-1',1,'2026-06-10 18:16:16','2026-06-10 18:16:16'),(3,'426945ac-b773-4a5d-9680-bee5dbb4edc0','menu-3',1,'2026-06-10 18:16:16','2026-06-10 18:16:16'),(43,'c147a262-dfd5-4156-b5b5-ebafbb82f839','menu-central-3',1,'2026-07-01 15:56:19','2026-07-01 15:56:19');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `restaurant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `carts_ibfk_131` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_132` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES ('27f33bdd-67a3-4069-b0d4-d121e5bee5cf','33333333-3333-3333-3333-333333333303',NULL,'2026-06-23 03:07:05','2026-06-23 03:07:05'),('426945ac-b773-4a5d-9680-bee5dbb4edc0','11111111-1111-1111-1111-111111111111','rest-1','2026-06-10 18:16:16','2026-06-10 18:16:16'),('556fcbab-73fb-4e41-bb9c-dd22a9f53aca','ad3379fa-9798-40ee-8f10-68f76aea4e15',NULL,'2026-06-29 01:13:11','2026-06-29 01:38:56'),('58ac4e2b-6d81-4315-ab8c-c6e54821b07a','8b7e9d58-76a6-42a1-ae3f-819adb12ab35',NULL,'2026-06-24 02:02:13','2026-06-24 02:02:13'),('5bb7a6cd-3b42-49b4-bd70-05ce57907a96','b68efa52-eb3d-406f-9f9a-d618a35bc61e',NULL,'2026-06-24 02:28:23','2026-06-24 02:28:23'),('5e3e070a-279e-4061-a862-ea846fdcb7ac','bd1dde06-017b-41f8-9bbe-48d671f9555d',NULL,'2026-07-01 17:08:42','2026-07-01 17:10:16'),('79b65928-80c9-4f5c-abb6-df640372042c','11111111-1111-1111-1111-111111111112',NULL,'2026-06-11 22:11:11','2026-06-11 22:11:11'),('8166238b-12e8-4fe6-ae70-87a1fbb8c517','11111111-1111-1111-1111-111111111114',NULL,'2026-07-01 13:28:26','2026-07-01 13:28:26'),('8c88f143-05a2-4aa9-a5ca-7f16dbe9908a','33333333-3333-3333-3333-333333333301',NULL,'2026-06-12 21:37:52','2026-06-12 21:37:52'),('c147a262-dfd5-4156-b5b5-ebafbb82f839','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-central','2026-06-10 17:14:35','2026-07-01 15:56:19'),('cec510b5-8f78-40d8-af70-81288720d285','00000000-0000-0000-0000-000000000001',NULL,'2026-06-15 12:16:01','2026-06-15 12:16:01');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `restaurant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_message_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `conversations_ibfk_7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `conversations_ibfk_8` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES ('3a80ffa8-6379-4721-910c-6a95149712d5','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-1','2026-07-01 11:29:15','2026-06-11 15:48:29','2026-07-01 11:29:15'),('4ba82c09-f2da-42b4-9a47-83261a085ce8','33333333-3333-3333-3333-333333333302','rest-2','2026-06-14 16:29:54','2026-06-14 16:29:50','2026-06-14 16:29:54'),('5c0ee96e-ef10-464a-9532-e438f4b02d3b','8b7e9d58-76a6-42a1-ae3f-819adb12ab35','rest-1','2026-07-01 12:28:54','2026-07-01 12:27:39','2026-07-01 12:28:54'),('6104162f-adb8-40ae-97f5-675797b860ab','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-2','2026-07-01 11:29:30','2026-06-11 16:02:21','2026-07-01 11:29:30'),('7297d8fb-1a89-40bf-a371-5824c2f11b13','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-4','2026-07-01 11:31:09','2026-07-01 11:31:05','2026-07-01 11:31:09'),('885fe654-857a-41f1-ab9c-b9a30f79cc30','33333333-3333-3333-3333-333333333302','rest-1','2026-06-14 16:26:14','2026-06-14 16:26:12','2026-06-14 16:26:14'),('895936ff-583b-4560-b4f1-0fd7f58d5a3b','33333333-3333-3333-3333-333333333301','rest-2','2026-06-14 16:29:32','2026-06-11 22:07:26','2026-06-14 16:29:32'),('90f082a1-d4c2-475c-b8ca-0c1553fba221','bd1dde06-017b-41f8-9bbe-48d671f9555d','rest-2','2026-07-01 17:09:23','2026-07-01 17:09:12','2026-07-01 17:09:23'),('fdf6c139-bdd6-4473-9e20-261dcdb89aa5','33333333-3333-3333-3333-333333333301','rest-1','2026-06-14 16:22:30','2026-06-14 16:21:37','2026-06-14 16:22:30');
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_ai_conversations`
--

DROP TABLE IF EXISTS `customer_ai_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_ai_conversations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_message_at` datetime DEFAULT NULL,
  `business_memory` json DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `customer_ai_conversations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_ai_conversations`
--

LOCK TABLES `customer_ai_conversations` WRITE;
/*!40000 ALTER TABLE `customer_ai_conversations` DISABLE KEYS */;
INSERT INTO `customer_ai_conversations` VALUES ('1b2dcc36-7b51-409c-9d6a-8f14a3a82991','00000000-0000-0000-0000-000000000003','2026-06-19 11:53:59',NULL,'2026-06-19 11:53:59','2026-06-19 11:53:59'),('ca774c99-44b7-4215-9570-cc3203fa3f5f','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','2026-07-01 15:42:52',NULL,'2026-06-19 11:31:20','2026-07-01 15:42:52');
/*!40000 ALTER TABLE `customer_ai_conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_ai_messages`
--

DROP TABLE IF EXISTS `customer_ai_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_ai_messages` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `customer_ai_conversation_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role` enum('system','user','assistant') COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_calls` json DEFAULT NULL,
  `tool_call_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_ai_conversation_id` (`customer_ai_conversation_id`),
  CONSTRAINT `customer_ai_messages_ibfk_1` FOREIGN KEY (`customer_ai_conversation_id`) REFERENCES `customer_ai_conversations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_ai_messages`
--

LOCK TABLES `customer_ai_messages` WRITE;
/*!40000 ALTER TABLE `customer_ai_messages` DISABLE KEYS */;
INSERT INTO `customer_ai_messages` VALUES ('2634ec0d-83bf-4918-b0ae-b96cb8be448c','ca774c99-44b7-4215-9570-cc3203fa3f5f','assistant','{\"message\":\"Hôm nay, tôi đề xuất 2 Combo khác nhau cho bạn!\",\"recommended_items\":[{\"id\":\"menu-central-3\",\"restaurantId\":\"rest-central\",\"name\":\"Bánh Bèo Chén Miền Trung\",\"price\":35000,\"reason\":\"Gợi ý 4 phần Bánh Bèo Chén Miền Trung để giảm chi phí tối đa.\"},{\"id\":\"menu-central-4\",\"restaurantId\":\"rest-central\",\"name\":\"Bún Lòng Nghệ Xào Hẹ\",\"price\":40000,\"reason\":\"Gợi ý 2 phần Bún Lòng Nghệ Xào Hẹ để đa dạng hóa bữa ăn.\"}]}',NULL,NULL,'2026-07-01 15:42:53','2026-07-01 15:42:53'),('3d204d01-13e0-412b-a39e-61d64914ec6c','1b2dcc36-7b51-409c-9d6a-8f14a3a82991','user','Lên kế hoạch cho tôi, tôi là một người miền trung có khẩu vị khá mặn và cay',NULL,NULL,'2026-06-19 11:53:59','2026-06-19 11:53:59'),('8f6e6f92-6dd1-42aa-9733-d5f4278c8155','1b2dcc36-7b51-409c-9d6a-8f14a3a82991','assistant','{\"message\":\"Chào bạn, Smart Cart đã nhận được yêu cầu lên kế hoạch ăn uống của bạn. Tôi hiểu bạn là người miền Trung, yêu thích các món có vị mặn và cay. Tuy nhiên, hiện tại tôi không tìm thấy bất kỳ món ăn nào trong dữ liệu để có thể lên thực đơn cụ thể và tính toán chi phí. Để tôi có thể giúp bạn tốt nhất, bạn vui lòng cho tôi biết bạn muốn tìm kiếm những loại thực phẩm hay món ăn nào, hoặc bạn có thể bắt đầu bằng cách duyệt qua các mặt hàng đang có sẵn nhé!\",\"recommended_items\":[]}',NULL,NULL,'2026-06-19 11:54:08','2026-06-19 11:54:08'),('be667ae0-e6ab-4f7a-a5f4-7563b6e97774','ca774c99-44b7-4215-9570-cc3203fa3f5f','user','Lên thực đơn bữa trưa cho 4 người dưới 300k',NULL,NULL,'2026-07-01 15:42:52','2026-07-01 15:42:52');
/*!40000 ALTER TABLE `customer_ai_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `menu_item_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `menu_item_id` (`menu_item_id`),
  CONSTRAINT `favorites_ibfk_61` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `favorites_ibfk_62` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES ('13e66367-ebd9-4d32-8f48-b4fb1a4f1563','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','menu-7','2026-06-10 17:58:06','2026-06-10 17:58:06'),('398601ac-ff99-403b-ad40-580ca64e1989','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','menu-19','2026-06-10 18:01:17','2026-06-10 18:01:17'),('f7267aff-3ac9-4e37-a6cc-07c77ba7d41a','11111111-1111-1111-1111-111111111111','menu-19','2026-06-10 17:58:02','2026-06-10 17:58:02');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `restaurant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `images` json DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `sold_count` int NOT NULL DEFAULT '0',
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `view_count` int NOT NULL DEFAULT '0',
  `ban_reason` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES ('437f0c01-65db-4633-be37-136bf78fdcea','rest-2','Cơm Tấm Sà Bì Chưởng','Cơm nóng hổi vừa thổi vừa ăn',50000.00,'https://i.pinimg.com/736x/cb/7d/ba/cb7dba9f46946ba781e7bccb04317b12.jpg',1,0,'2026-06-14 16:54:12','2026-06-14 17:00:03',NULL,10,0,'Món chính',0,NULL),('menu-1','rest-1','Hủ Tiếu Mì Sườn Heo Đặc Biệt','Sợi hủ tiếu dai ngon kết hợp cùng mì tươi, sườn non ninh mềm ngọt nước dùng xương ống ninh 8 tiếng chuẩn vị Sài Gòn xưa.',45000.00,'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-10 03:53:55','2026-07-01 17:09:01','[\"https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=800&q=80\"]',16,342,'pho',1277,NULL),('menu-10','rest-6','Mâm Chè 16 Món Khánh Vy','Mâm chè khổng lồ mang thương hiệu chè chung cư Sư Vạn Hạnh bao gồm 16 loại chè khác nhau.',150000.00,'https://images.unsplash.com/photo-1497534446932-c925b458314e?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-10 03:53:55','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1497534446932-c925b458314e?auto=format&fit=crop&w=800&q=80\"]',15,388,'dessert',893,NULL),('menu-11','rest-3','Bánh Hẹ Chiên Giòn Độc Đáo','Lớp vỏ bánh dai dẻo làm từ bột nếp, nhân hẹ tươi thơm ngọt, chiên giòn rụm xém cạnh.',25000.00,'https://images.unsplash.com/photo-1563245372-f21724e3856d?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-10 03:53:55','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1563245372-f21724e3856d?auto=format&fit=crop&w=800&q=80\"]',20,142,'snack',320,NULL),('menu-12','rest-5','Bánh Mì Pa-tê Xá Xíu Bơ Vàng','Phiên bản gọn gàng hơn của bánh mì Huỳnh Hoa với lát thịt xá xíu thơm phức, pa-tê gan siêu béo đặc trưng.',50000.00,'https://images.unsplash.com/photo-1509722747041-616f39b57569?auto=format&fit=crop&w=800&q=78',1,0,'2026-06-10 03:53:55','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1509722747041-616f39b57569?auto=format&fit=crop&w=800&q=78\"]',35,420,'bread',982,NULL),('menu-13','rest-6','Chè Thái Sầu Riêng Đệ Nhất','Hương vị chè Thái mát lạnh với thạch dừa giòn giòn, mít chín ngọt lịm, nhãn tươi và sầu riêng cơm vàng béo ngậy.',35000.00,'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-10 03:53:55','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?auto=format&fit=crop&w=800&q=80\"]',45,612,'dessert',1454,NULL),('menu-14','rest-7','Phở Tái Gầu Nạm Bò Viên','Sự kết hợp hoàn hảo từ nước dùng phở bò Hòa trứ danh ninh 12 tiếng cùng thịt gầu bò giòn sần sật, thịt tái mềm mọng.',75000.00,'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-10 03:53:55','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?auto=format&fit=crop&w=800&q=80\"]',60,840,'pho',2205,NULL),('menu-15','rest-7','Phở Gà Xé Lá Chanh Thơm Nồng','Thịt gà ta thả vườn dai ngọt xé phay giòn giòn, da gà vàng óng bóng bẩy quyện cùng lá chanh cắt sợi mỏng.',65000.00,'https://images.unsplash.com/photo-1603105037880-880cd4edfb0d?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-10 03:53:55','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1603105037880-880cd4edfb0d?auto=format&fit=crop&w=800&q=80\"]',25,310,'pho',751,NULL),('menu-16','rest-8','Bánh Mì Thịt Nướng Bơ Tỏi','Ổ bánh mì nóng giòn rụm kẹp thịt nướng xiên que thơm nức mũi, sốt bơ tỏi nhà làm béo ngậy.',30000.00,'https://images.unsplash.com/photo-1509722747041-616f39b57569?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-10 03:53:55','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1509722747041-616f39b57569?auto=format&fit=crop&w=800&q=80\"]',80,720,'bread',1650,NULL),('menu-17','rest-9','Sữa Tươi Trân Châu Đường Đen Thượng Hạng','Dòng sữa tươi nguyên chất thanh trùng hòa quyện cùng trân châu thủ công dẻo dai nấu trong sốt mật mía đường đen.',65000.00,'https://images.unsplash.com/photo-1541658016709-82535e94bc69?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-10 03:53:55','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1541658016709-82535e94bc69?auto=format&fit=crop&w=800&q=80\"]',150,2450,'coffee',5216,NULL),('menu-18','rest-10','Bún Chả Nem Cua Bể Đặc Biệt','Bún tươi mềm mại ăn kèm chả nướng than hoa thơm lừng và nem cua bể giòn tan ngon miệng ngọt ngào.',55000.00,'https://images.unsplash.com/photo-1585238342024-78d387f4a707?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-10 03:53:55','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1585238342024-78d387f4a707?auto=format&fit=crop&w=800&q=80\"]',30,412,'pho',980,NULL),('menu-19','rest-11','Trà Sữa Trân Châu Hoàng Gia Size L','Trà sữa ô long béo ngậy chuẩn Gong Cha với lớp bọt béo thơm ngon cùng trân châu đen ngâm mật ong.',52000.00,'https://images.unsplash.com/photo-1541658016709-82535e94bc69?auto=format&fit=crop&w=800&q=79',1,0,'2026-06-10 03:53:55','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1541658016709-82535e94bc69?auto=format&fit=crop&w=800&q=79\"]',119,1650,'coffee',2938,NULL),('menu-2','rest-1','Hủ Tiếu Mì Hoành Thánh','Hoành thánh nhân thịt heo và tôm xay nhuyễn gói trong lớp vỏ bột vàng dai, nước dùng hẹ xanh thanh mát ngọt thanh.',40000.00,'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?auto=format&fit=crop&w=800&q=80',0,0,'2026-06-10 03:53:55','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?auto=format&fit=crop&w=800&q=80\"]',0,189,'pho',96,NULL),('menu-3','rest-1','Xí Quách Tô Đặc Biệt','Xương ống tủy béo ngậy ninh ngọt lịm chấm cùng tương đen pha sa tế cay nồng ấm bụng.',30000.00,'https://images.unsplash.com/photo-1607532941433-304659e8198a?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-10 03:53:55','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1607532941433-304659e8198a?auto=format&fit=crop&w=800&q=80\"]',5,88,'snack',420,NULL),('menu-4','rest-2','Cơm Tấm Sườn Bì Chả Đặc Biệt','Sườn cốt lết dày dặn ướp mật ong nướng than hồng thơm phức, ăn kèm chả trứng chưng truyền thống, bì heo dai giòn trộn thính thơm.',65000.00,'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-10 03:53:55','2026-07-01 17:20:32','[\"https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=800&q=80\"]',38,512,'com',1896,NULL),('menu-5','rest-2','Cơm Tấm Ba Chỉ Nướng Lu','Thịt ba chỉ thái bản dày nướng trong lu đất giữ nguyên độ ngọt thơm của thịt, lớp da giòn bóng bẩy.',55000.00,'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-10 03:53:55','2026-07-01 17:10:16','[\"https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=800&q=80\"]',13,204,'com',780,NULL),('menu-6','rest-3','Bột Chiên Trứng Đôi Giòn Rụm','Từng viên bột chiên bên ngoài giòn tan, bên trong mềm dẻo quyện cùng 2 quả trứng gà béo ngậy, hành lá thơm lừng.',35000.00,'https://images.unsplash.com/photo-1626804475315-9644b37a2fe4?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-10 03:53:55','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1626804475315-9644b37a2fe4?auto=format&fit=crop&w=800&q=80\"]',30,415,'snack',1102,NULL),('menu-7','rest-4','Cà Phê Vợt Sữa Đá Sài Gòn','Ly cà phê vợt nóng hổi được pha chế qua chiếc vợt vải truyền thống tại khu Chợ Lớn hơn 70 năm tuổi, pha sữa đặc béo ngọt.',22000.00,'https://images.unsplash.com/photo-1541167760496-1628856ab772?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-10 03:53:55','2026-07-01 17:10:51','[\"https://images.unsplash.com/photo-1541167760496-1628856ab772?auto=format&fit=crop&w=800&q=80\"]',97,999,'coffee',3121,NULL),('menu-8','rest-4','Cà Phê Đen Vợt Đậm Đà','Hương vị cà phê đen truyền thống ngậy béo chưng cất bằng lò than, hậu vị đắng thanh dễ chịu chuẩn người Hoa Sài Gòn.',18000.00,'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-10 03:53:55','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?auto=format&fit=crop&w=800&q=80\"]',120,650,'coffee',1542,NULL),('menu-9','rest-5','Bánh Mì Huỳnh Hoa Đặc Biệt (Ổ 0.5kg)','Ổ bánh mì đắt sắt ra miếng với 5 lớp nhân chả lụa, chả bò, giò thủ, chà bông heo hảo hạng cùng lớp bơ thơm béo ngậy.',62000.00,'https://images.unsplash.com/photo-1509722747041-616f39b57569?auto=format&fit=crop&w=800&q=79',1,0,'2026-06-10 03:53:55','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1509722747041-616f39b57569?auto=format&fit=crop&w=800&q=79\"]',50,1540,'bread',4510,NULL),('menu-central-1','rest-central','Bún Bò Huế Đặc Biệt','Sợi bún to, thịt bò nạm, chả cua Huế thơm nồng, nước dùng đậm đà, cay xè đặc trưng vị Huế.',50000.00,'https://images.unsplash.com/photo-1625398407796-82650a8c135f?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-19 11:50:45','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1625398407796-82650a8c135f?auto=format&fit=crop&w=800&q=80\"]',50,142,'pho',320,NULL),('menu-central-2','rest-central','Mì Quảng Gà Ta','Sợi mì Quảng vàng dai ngon kết hợp thịt gà ta dai ngọt, nước lèo xâm xấp đậm đà ăn kèm bánh đa giòn rụm và rau sống ngon chuẩn vị miền Trung.',45000.00,'https://images.unsplash.com/photo-1552611052-33e04de081de?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-19 11:50:45','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1552611052-33e04de081de?auto=format&fit=crop&w=800&q=80\"]',40,98,'pho',212,NULL),('menu-central-3','rest-central','Bánh Bèo Chén Miền Trung','Mâm bánh bèo chén nhân tôm chấy, mỡ hành beo béo ăn kèm nước mắm ớt tỏi Lý Sơn cay mặn đậm đà.',35000.00,'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-19 11:50:45','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?auto=format&fit=crop&w=800&q=80\"]',30,180,'snack',424,NULL),('menu-central-4','rest-central','Bún Lòng Nghệ Xào Hẹ','Bún xào lòng heo tươi giòn quyện với bột nghệ vàng tươi, hẹ lá thơm nồng nàn cay ấm bụng đúng vị miền Trung mặn mà.',40000.00,'https://images.unsplash.com/photo-1585032226651-759b368d7246?auto=format&fit=crop&w=800&q=80',1,0,'2026-06-19 11:50:45','2026-07-01 15:56:44','[\"https://images.unsplash.com/photo-1585032226651-759b368d7246?auto=format&fit=crop&w=800&q=80\"]',25,65,'pho',182,NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `conversation_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sender_type` enum('USER','VENDOR') COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `conversation_id` (`conversation_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES ('0a2e4d03-83e2-44a8-9060-bf33994be28c','3a80ffa8-6379-4721-910c-6a95149712d5','USER','hello',NULL,'2026-06-11 15:59:08','2026-06-11 15:59:08'),('10ab0dc2-66ef-475d-9ae6-bc72b97a5366','5c0ee96e-ef10-464a-9532-e438f4b02d3b','VENDOR','Xin chào',NULL,'2026-07-01 12:28:54','2026-07-01 12:28:54'),('17c53ee8-73b8-46c5-b593-77435e24d8e6','4ba82c09-f2da-42b4-9a47-83261a085ce8','USER','Hello cu',NULL,'2026-06-14 16:29:54','2026-06-14 16:29:54'),('20d1f34e-fcee-4a1f-99ac-727c66c8918e','3a80ffa8-6379-4721-910c-6a95149712d5','USER','Hello',NULL,'2026-07-01 11:28:05','2026-07-01 11:28:05'),('25315719-8d1c-457c-a2d3-be7f500aef86','6104162f-adb8-40ae-97f5-675797b860ab','VENDOR','Chào bạn, chúng tôi đã nhận được tin nhắn và sẽ phản hồi trong ít phút nhé nhé.',NULL,'2026-07-01 11:29:30','2026-07-01 11:29:30'),('41329303-24f4-44a9-a016-1c83a59fcc9b','90f082a1-d4c2-475c-b8ca-0c1553fba221','VENDOR','Chào bạn, chúng tôi đã nhận được tin nhắn và sẽ phản hồi trong ít phút nhé.',NULL,'2026-07-01 17:09:12','2026-07-01 17:09:12'),('43087bac-1251-4181-b1eb-cbc33adad367','6104162f-adb8-40ae-97f5-675797b860ab','USER','HÚ',NULL,'2026-06-11 16:02:25','2026-06-11 16:02:25'),('47ef5816-629f-44bc-8ee0-4fa9fd9ec0ec','7297d8fb-1a89-40bf-a371-5824c2f11b13','VENDOR','Chào bạn, chúng tôi đã nhận được tin nhắn và sẽ phản hồi trong ít phút nhé.',NULL,'2026-07-01 11:31:05','2026-07-01 11:31:05'),('53fad4c2-7473-4ebf-87a9-2949e174d41f','7297d8fb-1a89-40bf-a371-5824c2f11b13','USER','Xin chào',NULL,'2026-07-01 11:31:09','2026-07-01 11:31:09'),('55edb9ac-7278-43b8-b6ea-7c17423d95be','3a80ffa8-6379-4721-910c-6a95149712d5','USER','hello',NULL,'2026-07-01 11:29:00','2026-07-01 11:29:00'),('56d7216b-61f5-4c9f-aa0b-cbcdb9cb25e9','fdf6c139-bdd6-4473-9e20-261dcdb89aa5','USER','Hello',NULL,'2026-06-14 16:22:30','2026-06-14 16:22:30'),('65534426-2943-4b3d-a7ec-16c317249043','3a80ffa8-6379-4721-910c-6a95149712d5','VENDOR','Chào bạn, chúng tôi đã nhận được tin nhắn và sẽ phản hồi trong ngày hôm nay nhé.',NULL,'2026-07-01 11:28:05','2026-07-01 11:28:05'),('72af3919-1cb9-465f-bdda-53d739bbc0c2','885fe654-857a-41f1-ab9c-b9a30f79cc30','VENDOR','Chào bạn, chúng tôi đã nhận được tin nhắn và sẽ phản hồi trong ngày hôm nay nhé.',NULL,'2026-06-14 16:26:12','2026-06-14 16:26:12'),('835dcf49-4218-4c89-aca8-68a364355df4','6104162f-adb8-40ae-97f5-675797b860ab','USER','Hello',NULL,'2026-07-01 11:29:30','2026-07-01 11:29:30'),('a09714fc-b45c-45a6-9950-3e6f31ab602f','3a80ffa8-6379-4721-910c-6a95149712d5','VENDOR','Chào bạn, chúng tôi đã nhận được tin nhắn và sẽ phản hồi trong ngày hôm nay nhé.',NULL,'2026-06-11 15:48:29','2026-06-11 15:48:29'),('a4a7e96d-d145-4448-a6ff-a3e925f41406','3a80ffa8-6379-4721-910c-6a95149712d5','VENDOR','Gì mày',NULL,'2026-06-11 16:00:43','2026-06-11 16:00:43'),('a6160d05-9aa5-4960-b34a-b44e9739f0f1','6104162f-adb8-40ae-97f5-675797b860ab','VENDOR','Chào bạn, chúng tôi đã nhận được tin nhắn và sẽ phản hồi trong ngày hôm nay nhé.',NULL,'2026-06-11 16:02:21','2026-06-11 16:02:21'),('aeabe6ff-8461-4813-b1d3-c03712a21964','90f082a1-d4c2-475c-b8ca-0c1553fba221','USER','Xin chào giờ này bạn còn bán không?',NULL,'2026-07-01 17:09:23','2026-07-01 17:09:23'),('b00862d9-ddaa-44ed-a76e-3a2a114fdf0f','5c0ee96e-ef10-464a-9532-e438f4b02d3b','USER','Xin chào',NULL,'2026-07-01 12:27:44','2026-07-01 12:27:44'),('b22f76b4-8c27-4a47-bf3c-deba796a945d','895936ff-583b-4560-b4f1-0fd7f58d5a3b','VENDOR','Chào bạn, chúng tôi đã nhận được tin nhắn và sẽ phản hồi trong ngày hôm nay nhé.',NULL,'2026-06-11 22:07:26','2026-06-11 22:07:26'),('b38fabbb-4021-4bac-b10d-4f99c53e1934','4ba82c09-f2da-42b4-9a47-83261a085ce8','VENDOR','Chào bạn, chúng tôi đã nhận được tin nhắn và sẽ phản hồi trong ngày hôm nay nhé.',NULL,'2026-06-14 16:29:50','2026-06-14 16:29:50'),('c7bb0e6b-f4db-49aa-b3fe-711ba2f66ca7','5c0ee96e-ef10-464a-9532-e438f4b02d3b','VENDOR','Chào bạn, chúng tôi đã nhận được tin nhắn và sẽ phản hồi trong ít phút nhé.',NULL,'2026-07-01 12:27:39','2026-07-01 12:27:39'),('ca0fa2e7-7b47-460e-9805-5ae5ad27d7de','885fe654-857a-41f1-ab9c-b9a30f79cc30','USER','Hello',NULL,'2026-06-14 16:26:14','2026-06-14 16:26:14'),('cdffb744-4efc-44ab-b758-c7fac7cda38e','6104162f-adb8-40ae-97f5-675797b860ab','USER','Hello',NULL,'2026-06-11 22:05:21','2026-06-11 22:05:21'),('d4441700-00f4-4161-b030-355e5dccd127','895936ff-583b-4560-b4f1-0fd7f58d5a3b','USER','Hello',NULL,'2026-06-14 16:29:32','2026-06-14 16:29:32'),('e08c0e76-c51e-4f71-8e3b-d79056d03849','895936ff-583b-4560-b4f1-0fd7f58d5a3b','USER','Hello',NULL,'2026-06-11 22:07:29','2026-06-11 22:07:29'),('f290db3e-769d-4340-9b53-6a9abca373ce','3a80ffa8-6379-4721-910c-6a95149712d5','USER','Hello',NULL,'2026-07-01 11:29:15','2026-07-01 11:29:15'),('fb0e1f58-99c8-4013-909b-dc9b697d9981','fdf6c139-bdd6-4473-9e20-261dcdb89aa5','VENDOR','Chào bạn, chúng tôi đã nhận được tin nhắn và sẽ phản hồi trong ngày hôm nay nhé.',NULL,'2026-06-14 16:21:37','2026-06-14 16:21:37');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `restaurant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `delivery_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `payment_method` enum('COD','WALLET','POINTS','VIETQR') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'COD',
  `status` enum('pending','confirmed','preparing','ready','delivering','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `items` json NOT NULL,
  `shipper_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `shipping_fee` decimal(12,2) NOT NULL DEFAULT '15000.00',
  `pickup_photo_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_photo_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipper_rating` int DEFAULT NULL,
  `payos_order_code` bigint DEFAULT NULL,
  `payos_checkout_url` text COLLATE utf8mb4_unicode_ci,
  `platform_fee` decimal(12,2) NOT NULL DEFAULT '0.00',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `shipper_id` (`shipper_id`),
  CONSTRAINT `orders_ibfk_133` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_134` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_135` FOREIGN KEY (`shipper_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('076a6adf-eab8-4730-96d8-b51c74e1697e','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-1','1/18 đường số 4, KPho 2, phường Bình Thọ, TP. Thủ Đức, TP.HCM ',60000.00,'VIETQR','cancelled','2026-07-01 13:17:30','2026-07-01 13:17:51','[{\"name\": \"Hủ Tiếu Mì Sườn Heo Đặc Biệt\", \"price\": 45000, \"quantity\": 1, \"menuItemId\": \"menu-1\"}]',NULL,15000.00,NULL,NULL,NULL,911850871,'http://localhost:3000/checkout?status=pending&payment=vietqr&orderId=076a6adf-eab8-4730-96d8-b51c74e1697e&amount=60000&code=911850871',0.00,1,'3653'),('22a25a9d-8079-41ac-b265-d0a4efa27ccc','ad3379fa-9798-40ee-8f10-68f76aea4e15','rest-1','Lò 3 beach',60000.00,'COD','pending','2026-06-29 01:38:56','2026-06-29 01:38:56','[{\"name\": \"Hủ Tiếu Mì Sườn Heo Đặc Biệt\", \"price\": \"45000.000\", \"quantity\": 1, \"menuItemId\": \"menu-1\"}]',NULL,15000.00,NULL,NULL,NULL,NULL,NULL,0.00,0,NULL),('22e15cd0-9c06-4081-a907-8d021ed25973','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-1','1/18, đường số 4 Khu Phố 2, Bình Thọ, Thủ Đức',195000.00,'COD','completed','2026-06-29 08:15:48','2026-07-01 13:08:51','[{\"name\": \"Hủ Tiếu Mì Sườn Heo Đặc Biệt\", \"price\": 45000, \"quantity\": 4, \"menuItemId\": \"menu-1\"}]','33333333-3333-3333-3333-333333333303',15000.00,NULL,'/uploads/delivery-photos/delivery_22e15cd0-9c06-4081-a907-8d021ed25973_1782911197639.jpeg',5,NULL,NULL,0.00,0,'9414'),('23390cfb-f7e4-4fab-a09d-db0325f67fb4','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-1','1/18 đường số 4, Khu phố 2, phường Bình Thọ, Tp. Thủ Đức, Tp. HCM',60000.00,'VIETQR','pending','2026-06-27 03:44:03','2026-06-27 03:44:03','[{\"name\": \"Hủ Tiếu Mì Sườn Heo Đặc Biệt\", \"price\": \"45000.00\", \"quantity\": 1, \"menuItemId\": \"menu-1\"}]',NULL,15000.00,NULL,NULL,NULL,531844435,'http://localhost:3000/checkout?status=pending&payment=vietqr&orderId=23390cfb-f7e4-4fab-a09d-db0325f67fb4&amount=60000&code=531844435',0.00,0,NULL),('41ac68e5-de39-405f-8d43-3ce7f08b66cb','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-2','1/18, đường số 4 Khu Phố 2, Bình Thọ, Thủ Đức',70000.00,'COD','pending','2026-06-29 08:15:48','2026-06-29 08:15:48','[{\"name\": \"Cơm Tấm Ba Chỉ Nướng Lu\", \"price\": 55000, \"quantity\": 1, \"menuItemId\": \"menu-5\"}]',NULL,15000.00,NULL,NULL,NULL,NULL,NULL,0.00,0,'2359'),('44b36521-b77e-4e7a-a665-a7d64c06f28b','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-2','1/18 đường số 4, KPho 2, phường Bình Thọ, TP. Thủ Đức, TP.HCM ',30000.00,'COD','completed','2026-07-01 11:59:16','2026-07-01 17:20:06','[{\"name\": \"Cơm Tấm Sườn Bì Chả Đặc Biệt\", \"price\": 65000, \"quantity\": 1, \"menuItemId\": \"menu-4\"}]','33333333-3333-3333-3333-333333333303',15000.00,'/uploads/delivery-photos/pickup_44b36521-b77e-4e7a-a665-a7d64c06f28b_1782912650493.jpeg','/uploads/delivery-photos/delivery_44b36521-b77e-4e7a-a665-a7d64c06f28b_1782912708379.jpeg',4,NULL,NULL,0.00,0,'9596'),('572b44cf-37f1-4097-a07c-84b4d6331364','bd1dde06-017b-41f8-9bbe-48d671f9555d','rest-2','1/18 đường số4, KP.2, phường Bình Thọ, TP. HCM',135000.00,'COD','pending','2026-07-01 17:10:16','2026-07-01 17:10:16','[{\"name\": \"Cơm Tấm Sườn Bì Chả Đặc Biệt\", \"price\": 65000, \"quantity\": 1, \"menuItemId\": \"menu-4\"}, {\"name\": \"Cơm Tấm Ba Chỉ Nướng Lu\", \"price\": 55000, \"quantity\": 1, \"menuItemId\": \"menu-5\"}]',NULL,15000.00,NULL,NULL,NULL,NULL,NULL,0.00,0,'7392'),('579d40a4-fbdf-47bb-8805-33263e6a2fe7','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-1','1/18 đường số 4, KPho 2, phường Bình Thọ, TP. Thủ Đức, TP.HCM ',60000.00,'COD','completed','2026-07-01 11:59:16','2026-07-01 17:19:31','[{\"name\": \"Hủ Tiếu Mì Sườn Heo Đặc Biệt\", \"price\": 45000, \"quantity\": 1, \"menuItemId\": \"menu-1\"}]','33333333-3333-3333-3333-333333333303',15000.00,'/uploads/delivery-photos/pickup_579d40a4-fbdf-47bb-8805-33263e6a2fe7_1782926324260.jpeg','/uploads/delivery-photos/delivery_579d40a4-fbdf-47bb-8805-33263e6a2fe7_1782926371249.jpeg',NULL,NULL,NULL,0.00,0,'2253'),('58779396-54ef-4904-931d-3450b25f0669','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-2','1/18 đường số 4, Khu phố 2, phường Bình Thọ, Tp. Thủ Đức, Tp. HCM',135000.00,'COD','pending','2026-06-28 08:07:48','2026-06-28 08:07:48','[{\"name\": \"Cơm Tấm Sườn Bì Chả Đặc Biệt\", \"price\": \"65000.00\", \"quantity\": 1, \"menuItemId\": \"menu-4\"}, {\"name\": \"Cơm Tấm Ba Chỉ Nướng Lu\", \"price\": \"55000.00\", \"quantity\": 1, \"menuItemId\": \"menu-5\"}]',NULL,15000.00,NULL,NULL,NULL,NULL,NULL,0.00,0,NULL),('5b33dbbb-7b40-49b0-b0fc-a17e4177de55','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-9','1/18 đường số 4, Khu phố 2, phường Bình Thọ, Tp. Thủ Đức, Tp. HCM',80000.00,'COD','pending','2026-06-24 00:49:03','2026-06-24 00:49:03','[{\"name\": \"Sữa Tươi Trân Châu Đường Đen Thượng Hạng\", \"price\": \"65000.000\", \"quantity\": 1, \"menuItemId\": \"menu-17\"}]',NULL,15000.00,NULL,NULL,NULL,NULL,NULL,0.00,0,NULL),('6254d886-e598-4010-a37e-66d8df1b9070','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-7','1/18 đường số 4, Khu phố 2, phường Bình Thọ, Tp. Thủ Đức, Tp. HCM',75000.00,'VIETQR','confirmed','2026-06-22 14:34:56','2026-06-22 14:34:59','[{\"name\": \"Phở Tái Gầu Nạm Bò Viên\", \"price\": 75000, \"quantity\": 1, \"menuItemId\": \"menu-14\"}]',NULL,15000.00,NULL,NULL,NULL,138896153,'http://localhost:3000/checkout?status=pending&payment=vietqr&orderId=6254d886-e598-4010-a37e-66d8df1b9070&amount=75000&code=138896153',0.00,0,NULL),('6382fc00-1fa1-42bd-bcf8-b25bfd6b3e90','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-6','1/18 đường số 4, Khu phố 2, phường Bình Thọ, Tp. Thủ Đức, Tp. HCM',35000.00,'COD','pending','2026-06-11 10:03:54','2026-06-11 10:03:54','[{\"name\": \"Chè Thái Sầu Riêng Đệ Nhất\", \"price\": 35000, \"quantity\": 1, \"menuItemId\": \"menu-13\"}]',NULL,15000.00,NULL,NULL,NULL,NULL,NULL,0.00,0,NULL),('83a01a51-2ac4-456c-ba8e-ddd28a90e9a4','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-4','1/18 đường số 4, KPho 2, phường Bình Thọ, TP. Thủ Đức, TP.HCM ',37000.00,'COD','pending','2026-07-01 11:59:16','2026-07-01 11:59:16','[{\"name\": \"Cà Phê Vợt Sữa Đá Sài Gòn\", \"price\": 22000, \"quantity\": 1, \"menuItemId\": \"menu-7\"}]',NULL,15000.00,NULL,NULL,NULL,NULL,NULL,0.00,0,'6384'),('8569a01e-cfca-4226-892a-01c963769ef6','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-4','1/18 đường số 4, Khu phố 2, phường Bình Thọ, Tp. Thủ Đức, Tp. HCM',37000.00,'COD','pending','2026-06-24 00:47:30','2026-06-24 00:47:30','[{\"name\": \"Cà Phê Vợt Sữa Đá Sài Gòn\", \"price\": \"22000.00\", \"quantity\": 1, \"menuItemId\": \"menu-7\"}]',NULL,15000.00,NULL,NULL,NULL,NULL,NULL,0.00,0,NULL),('95931b74-5d03-4d2d-a2e2-2645f36dd4e5','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-1','1/18 đường số 4, Khu phố 2, phường Bình Thọ, Tp. Thủ Đức, Tp. HCM',45000.00,'VIETQR','confirmed','2026-06-21 12:57:25','2026-06-21 12:57:25','[{\"name\": \"Hủ Tiếu Mì Sườn Heo Đặc Biệt\", \"price\": 45000, \"quantity\": 1, \"menuItemId\": \"menu-1\"}]',NULL,15000.00,NULL,NULL,NULL,46646484,'http://localhost:3000/checkout?status=success&orderId=95931b74-5d03-4d2d-a2e2-2645f36dd4e5',0.00,0,NULL),('9dac5c3b-c580-44c5-802c-bf6457a40450','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-5','123 Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP. Hồ Chí Minh',62000.00,'COD','pending','2026-06-10 18:06:49','2026-06-10 18:06:49','[{\"name\": \"Bánh Mì Huỳnh Hoa Đặc Biệt (Ổ 0.5kg)\", \"price\": 62000, \"quantity\": 1, \"menuItemId\": \"menu-9\"}]',NULL,15000.00,NULL,NULL,NULL,NULL,NULL,0.00,0,NULL),('aa774e29-77c0-4c85-a890-7d35a2bbfe87','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-11','1/18 đường số 4, Khu phố 2, phường Bình Thọ, Tp. Thủ Đức, Tp. HCM',171000.00,'VIETQR','confirmed','2026-06-27 04:21:00','2026-06-27 04:21:05','[{\"name\": \"Trà Sữa Trân Châu Hoàng Gia Size L\", \"price\": \"52000.000\", \"quantity\": 3, \"menuItemId\": \"menu-19\"}]',NULL,15000.00,NULL,NULL,NULL,534061276,'http://localhost:3000/checkout?status=pending&payment=vietqr&orderId=aa774e29-77c0-4c85-a890-7d35a2bbfe87&amount=171000&code=534061276',0.00,0,NULL),('b25aec89-ee5a-4e64-859f-73e808c6cda5','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-1','1/18 đường số 4, Khu phố 2, phường Bình Thọ, Tp. Thủ Đức, Tp. HCM',60000.00,'VIETQR','pending','2026-06-27 03:46:54','2026-06-27 03:46:54','[{\"name\": \"Hủ Tiếu Mì Sườn Heo Đặc Biệt\", \"price\": \"45000.00\", \"quantity\": 1, \"menuItemId\": \"menu-1\"}]',NULL,15000.00,NULL,NULL,NULL,532014863,'http://localhost:3000/checkout?status=pending&payment=vietqr&orderId=b25aec89-ee5a-4e64-859f-73e808c6cda5&amount=60000&code=532014863',0.00,0,NULL),('b9c80f56-724a-4725-90e1-11709a3c760a','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-11','1/18, đường số 4 Khu Phố 2, Bình Thọ, Thủ Đức',67000.00,'COD','pending','2026-06-29 08:15:48','2026-06-29 08:15:48','[{\"name\": \"Trà Sữa Trân Châu Hoàng Gia Size L\", \"price\": 52000, \"quantity\": 1, \"menuItemId\": \"menu-19\"}]',NULL,15000.00,NULL,NULL,NULL,NULL,NULL,0.00,0,'5497'),('c1ac75ac-8a63-401b-88fe-51dc8ebf39c1','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-6','123 Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP. Hồ Chí Minh',185000.00,'COD','pending','2026-06-10 18:17:13','2026-06-10 18:17:13','[{\"name\": \"Mâm Chè 16 Món Khánh Vy\", \"price\": 150000, \"quantity\": 1, \"menuItemId\": \"menu-10\"}, {\"name\": \"Chè Thái Sầu Riêng Đệ Nhất\", \"price\": 35000, \"quantity\": 1, \"menuItemId\": \"menu-13\"}]',NULL,15000.00,NULL,NULL,NULL,NULL,NULL,0.00,0,NULL),('c84aa7b3-8f33-457c-b730-3101894806c0','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-1','1/18 đường số 4, Khu phố 2, phường Bình Thọ, Tp. Thủ Đức, Tp. HCM',60000.00,'COD','pending','2026-06-24 00:53:42','2026-06-24 00:53:42','[{\"name\": \"Hủ Tiếu Mì Sườn Heo Đặc Biệt\", \"price\": \"45000.00\", \"quantity\": 1, \"menuItemId\": \"menu-1\"}]',NULL,15000.00,NULL,NULL,NULL,NULL,NULL,0.00,0,NULL),('f39cbfe4-ff41-4457-bc7b-40b8641907a1','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-2','1/18 đường số 4, Khu phố 2, phường Bình Thọ, Tp. Thủ Đức, Tp. HCM',50000.00,'COD','completed','2026-06-14 17:03:00','2026-06-14 17:03:20','[{\"name\": \"Cơm Tấm Sà Bì Chưởng\", \"price\": \"50000.00\", \"quantity\": 1, \"menuItemId\": \"437f0c01-65db-4633-be37-136bf78fdcea\"}]',NULL,15000.00,NULL,NULL,NULL,NULL,NULL,0.00,0,NULL),('f3ac4deb-f01e-4429-8d80-e1f4314cf781','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','rest-2','1/18 đường số 4, Khu phố 2, phường Bình Thọ, Tp. Thủ Đức, Tp. HCM',80000.00,'COD','completed','2026-06-23 02:56:08','2026-06-23 03:40:18','[{\"name\": \"Cơm Tấm Sườn Bì Chả Đặc Biệt\", \"price\": 65000, \"quantity\": 1, \"menuItemId\": \"menu-4\"}]','33333333-3333-3333-3333-333333333303',15000.00,'/uploads/delivery-photos/pickup_f3ac4deb-f01e-4429-8d80-e1f4314cf781_1782185381958.jpeg',NULL,4,NULL,NULL,0.00,0,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `reporter_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `target_type` enum('review','product','vendor') COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','resolved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `manager_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reporter_id` (`reporter_id`),
  CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `owner_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operating_hours` json DEFAULT NULL,
  `delivery_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `min_order_value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','open','closed','banned','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `rating_avg` decimal(2,1) NOT NULL DEFAULT '0.0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `region` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rejection_reason` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `restaurants_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES ('rest-1','11111111-1111-1111-1111-111111111111','Hủ Tiếu Gõ Chợ Bàn Cờ','Hẻm 174 Nguyễn Thiện Thuật, Quận 3','https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=500&q=80','https://images.unsplash.com/photo-1552611052-33e04de081de?auto=format&fit=crop&w=1200&q=80','{\"open\": \"06:00\", \"close\": \"22:00\"}',15000.00,20000.00,'open',5.0,'2026-06-10 03:53:55','2026-07-01 15:56:44',NULL,NULL),('rest-10','11111111-1111-1111-1111-111111111112','Bún Chả Sinh Từ','18 Hàng Vải, Quận 1, TP.HCM','https://images.unsplash.com/photo-1585238342024-78d387f4a707?auto=format&fit=crop&w=500&q=80','https://images.unsplash.com/photo-1585238342024-78d387f4a707?auto=format&fit=crop&w=1200&q=80',NULL,12000.00,20000.00,'open',4.6,'2026-06-10 03:53:55','2026-07-01 15:56:44',NULL,NULL),('rest-11','11111111-1111-1111-1111-111111111113','Trà Sữa Gong Cha','78 Nguyễn Huệ, Quận 1','https://images.unsplash.com/photo-1558857563-b3719d367e5e?auto=format&fit=crop&w=500&q=80','https://images.unsplash.com/photo-1558857563-b3719d367e5e?auto=format&fit=crop&w=1200&q=80',NULL,10000.00,20000.00,'open',4.7,'2026-06-10 03:53:55','2026-07-01 15:56:44',NULL,NULL),('rest-2','11111111-1111-1111-1111-111111111114','Cơm Tấm Bãi Rác Quận 4','73 Lê Văn Linh, Quận 4, Sài Gòn','https://images.unsplash.com/photo-1555396273-367ea4eb4db5?auto=format&fit=crop&w=500&q=80','https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&w=1200&q=80',NULL,18000.00,20000.00,'open',5.0,'2026-06-10 03:53:55','2026-07-01 17:20:21',NULL,NULL),('rest-3','11111111-1111-1111-1111-111111111115','Bột Chiên Trấn Giang Phùng Hưng','Đầu hẻm Phùng Hưng, Quận 5','https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?auto=format&fit=crop&w=500&q=80','https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=1200&q=80',NULL,12000.00,20000.00,'closed',4.5,'2026-06-10 03:53:55','2026-07-01 15:56:44',NULL,NULL),('rest-4','11111111-1111-1111-1111-111111111116','Cà Phê Vợt Ba Lù Chợ Phùng Hưng','Hẻm 192 Phùng Hưng, Quận 5','https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?auto=format&fit=crop&w=500&q=80','https://images.unsplash.com/photo-1509722747041-616f39b57569?auto=format&fit=crop&w=1200&q=80',NULL,10000.00,20000.00,'open',4.9,'2026-06-10 03:53:55','2026-07-01 15:56:44',NULL,NULL),('rest-5','11111111-1111-1111-1111-111111111117','Bánh Mì Huỳnh Hoa Sài Gòn','26 Lê Thị Riêng, Quận 1','https://images.unsplash.com/photo-1509722747041-616f39b57569?auto=format&fit=crop&w=500&q=80','https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=1200&q=80',NULL,22000.00,20000.00,'open',4.7,'2026-06-10 03:53:55','2026-07-01 15:56:44',NULL,NULL),('rest-6','11111111-1111-1111-1111-111111111118','Chè Mâm Khánh Vy Sư Vạn Hạnh','Chung cư Ngô Gia Tự, Quận 10','https://images.unsplash.com/photo-1497534446932-c925b458314e?auto=format&fit=crop&w=500&q=80','https://images.unsplash.com/photo-1625398407796-82650a8c135f?auto=format&fit=crop&w=1200&q=80',NULL,15000.00,20000.00,'open',4.4,'2026-06-10 03:53:55','2026-07-01 15:56:44',NULL,NULL),('rest-7','11111111-1111-1111-1111-111111111119','Phở Hòa Pasteur','260C Pasteur, Quận 3','https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?auto=format&fit=crop&w=500&q=80','https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?auto=format&fit=crop&w=1200&q=80',NULL,20000.00,20000.00,'open',4.7,'2026-06-10 03:53:55','2026-07-01 15:56:44',NULL,NULL),('rest-8','11111111-1111-1111-1111-11111111111a','Bánh Mì Hồng Hoa','54 Nguyễn Văn Tráng, Quận 1','https://images.unsplash.com/photo-1541532713592-79a0317b6b77?auto=format&fit=crop&w=500&q=80','https://images.unsplash.com/photo-1541532713592-79a0317b6b77?auto=format&fit=crop&w=1200&q=80',NULL,12000.00,20000.00,'open',4.8,'2026-06-10 03:53:55','2026-07-01 15:56:44',NULL,NULL),('rest-9','11111111-1111-1111-1111-11111111111b','Sữa Tươi Trân Châu The Alley','114 Hồ Tùng Mậu, Quận 1','https://images.unsplash.com/photo-1541658016709-82535e94bc69?auto=format&fit=crop&w=500&q=80','https://images.unsplash.com/photo-1541658016709-82535e94bc69?auto=format&fit=crop&w=1200&q=80',NULL,8000.00,20000.00,'open',4.5,'2026-06-10 03:53:55','2026-07-01 15:56:44',NULL,NULL),('rest-central','11111111-1111-1111-1111-11111111111c','Quán Ăn Miền Trung O Nở','145 Bành Văn Trân, Tân Bình, TP.HCM','https://images.unsplash.com/photo-1625398407796-82650a8c135f?auto=format&fit=crop&w=500&q=80','https://images.unsplash.com/photo-1625398407796-82650a8c135f?auto=format&fit=crop&w=1200&q=80',NULL,15000.00,20000.00,'open',4.8,'2026-06-19 11:50:45','2026-07-01 15:56:44','Hồ Chí Minh',NULL);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `reward_points` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `menu_item_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `vendor_reply` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `menu_item_id` (`menu_item_id`),
  CONSTRAINT `reviews_ibfk_162` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `reviews_ibfk_163` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `reviews_ibfk_164` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('aa21c0e8-ebd7-4379-af13-d873c4e1c516','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','44b36521-b77e-4e7a-a665-a7d64c06f28b',5,'Món ăn ngon',50,'2026-07-01 17:20:21','2026-07-01 17:20:21','menu-4',NULL),('dc1844c5-8666-48c9-b24b-75c969ba9e7a','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','f3ac4deb-f01e-4429-8d80-e1f4314cf781',5,'Tuyệt ',50,'2026-06-23 03:40:10','2026-06-23 03:40:10','menu-4',NULL),('f428ab3a-675e-4676-8ae5-9464d35f192b','50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','22e15cd0-9c06-4081-a907-8d021ed25973',5,'Ngon vãi cứt ',50,'2026-07-01 13:12:19','2026-07-01 13:15:57','menu-1','Cảm ơn bạn vì đã trải nghiệm dịch vụ bên mình');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_configs`
--

DROP TABLE IF EXISTS `system_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_configs` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'system',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_configs`
--

LOCK TABLES `system_configs` WRITE;
/*!40000 ALTER TABLE `system_configs` DISABLE KEYS */;
INSERT INTO `system_configs` VALUES ('free_delivery_threshold','150000','fee','Đơn hàng từ giá trị này sẽ được miễn phí giao hàng (VNĐ)','2026-06-15 12:14:18','2026-06-15 12:14:18'),('homepage_banner','{\"title\":\"GrabFood Mini\",\"subtitle\":\"Đặt đồ ăn ngon, giao tận nơi\",\"imageUrl\":\"\",\"linkUrl\":\"\",\"isActive\":true}','banner','Cấu hình banner trang chủ','2026-06-15 12:14:18','2026-06-15 12:14:18'),('min_order_amount','20000','fee','Giá trị đơn hàng tối thiểu (VNĐ)','2026-06-15 12:14:18','2026-06-15 12:14:18'),('payment_methods','{\"COD\":true,\"WALLET\":true,\"POINTS\":true,\"VIETQR\":true}','payment','Các phương thức thanh toán được kích hoạt','2026-06-15 12:14:18','2026-06-15 12:14:18'),('platform_fee','5','fee','Phí nền tảng tính trên tổng đơn hàng (%)','2026-06-15 12:14:18','2026-06-15 12:14:18'),('system_notice','[{\"id\":\"notice_auto_1782926538977\",\"message\":\"Mã giảm giá mới: GIAM30K! Giảm ngay 30.000 VNĐ cho đơn từ 50.000 VNĐ. Hạn dùng đến 4/7/2026. Thu thập ngay!\",\"type\":\"success\",\"isActive\":true,\"createdAt\":\"2026-07-01T17:22:18.977Z\"},{\"id\":\"notice_auto_1782907460231\",\"message\":\"Mã giảm giá mới: SALE50%! Giảm 20% (tối đa 20.000 VNĐ) cho đơn từ 50.000 VNĐ. Hạn dùng đến 5/7/2026. Thu thập ngay!\",\"type\":\"success\",\"isActive\":false,\"createdAt\":\"2026-07-01T12:04:20.231Z\"},{\"id\":\"notice_auto_1782907103320\",\"message\":\"Mã giảm giá mới: GIAM30K! Giảm ngay 50.000 VNĐ cho đơn từ 10.000 VNĐ. Hạn dùng đến 10/7/2026. Thu thập ngay!\",\"type\":\"success\",\"isActive\":false,\"createdAt\":\"2026-07-01T11:58:23.320Z\"},{\"id\":\"notice_auto_1782905588062\",\"message\":\"Mã giảm giá mới: GIAM20K! Giảm ngay 20.000 VNĐ cho đơn từ 50.000 VNĐ. Hạn dùng đến 5/7/2026. Thu thập ngay!\",\"type\":\"success\",\"isActive\":false,\"createdAt\":\"2026-07-01T11:33:08.062Z\"}]','notice','Thông báo hệ thống hiển thị cho toàn bộ người dùng','2026-06-15 12:14:18','2026-07-01 17:22:18');
/*!40000 ALTER TABLE `system_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unban_appeals`
--

DROP TABLE IF EXISTS `unban_appeals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unban_appeals` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `appeal_reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `admin_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `admin_response` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `unban_appeals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `unban_appeals_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unban_appeals`
--

LOCK TABLES `unban_appeals` WRITE;
/*!40000 ALTER TABLE `unban_appeals` DISABLE KEYS */;
INSERT INTO `unban_appeals` VALUES ('329d6251-6fd2-4293-a168-20735a88f15c','ad3379fa-9798-40ee-8f10-68f76aea4e15','TÔi k có xin hãy xem xét lại','approved','00000000-0000-0000-0000-000000000001','Yêu cầu mở khóa được chấp nhận.','2026-06-29 02:05:33','2026-06-29 02:10:27');
/*!40000 ALTER TABLE `unban_appeals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_vouchers`
--

DROP TABLE IF EXISTS `user_vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_vouchers` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `voucher_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT '0',
  `used_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `voucher_id` (`voucher_id`),
  CONSTRAINT `user_vouchers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_vouchers_ibfk_2` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_vouchers`
--

LOCK TABLES `user_vouchers` WRITE;
/*!40000 ALTER TABLE `user_vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('guest','user','vendor','shipper','manager','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `status` enum('pending','active','banned') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `otp_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expires_at` datetime DEFAULT NULL,
  `points` int NOT NULL DEFAULT '0',
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_online` tinyint(1) NOT NULL DEFAULT '0',
  `shipper_rating` float DEFAULT NULL,
  `managed_region` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ban_reason` text COLLATE utf8mb4_unicode_ci,
  `google_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `email_2` (`email`),
  UNIQUE KEY `email_3` (`email`),
  UNIQUE KEY `email_4` (`email`),
  UNIQUE KEY `email_5` (`email`),
  UNIQUE KEY `email_6` (`email`),
  UNIQUE KEY `email_7` (`email`),
  UNIQUE KEY `email_8` (`email`),
  UNIQUE KEY `email_9` (`email`),
  UNIQUE KEY `email_10` (`email`),
  UNIQUE KEY `email_11` (`email`),
  UNIQUE KEY `email_12` (`email`),
  UNIQUE KEY `google_id` (`google_id`),
  UNIQUE KEY `facebook_id` (`facebook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('00000000-0000-0000-0000-000000000001','Super Admin','admin@grabfood.com','Admin@123456','0900000001',NULL,'admin','active','2026-06-15 12:14:18','2026-06-15 12:14:18',NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),('00000000-0000-0000-0000-000000000002','Platform Manager','manager@grabfood.com','Manager@123456','0900000002',NULL,'manager','active','2026-06-15 12:14:18','2026-06-15 12:14:18',NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),('00000000-0000-0000-0000-000000000003','Nguyễn Văn User','user@grabfood.com','User@123456','0900000003',NULL,'user','active','2026-06-15 12:14:18','2026-06-15 12:14:18',NULL,NULL,0,'123 Nguyễn Huệ, Quận 1, TP.HCM',0,NULL,NULL,NULL,NULL,NULL,NULL),('11111111-1111-1111-1111-111111111111','Chủ Quán Hủ Tiếu Gõ Chợ Bàn Cờ','vendor1@saigon.com','Vendor@123456','0900000001',NULL,'vendor','active','2026-06-29 15:48:36','2026-06-29 15:48:36',NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),('11111111-1111-1111-1111-111111111112','Chủ Quán Bún Chả Sinh Từ','vendor2@saigon.com','Vendor@123456','0900000002',NULL,'vendor','active','2026-06-12 05:04:10','2026-06-12 05:04:10',NULL,NULL,0,'Q4, HCM',0,NULL,NULL,NULL,NULL,NULL,NULL),('11111111-1111-1111-1111-111111111113','Chủ Quán Trà Sữa Gong Cha','vendor3@saigon.com','Vendor@123456','0900000003',NULL,'vendor','active','2026-06-29 15:48:36','2026-06-29 15:48:36',NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),('11111111-1111-1111-1111-111111111114','Chủ Quán Cơm Tấm Bãi Rác Quận 4','vendor4@saigon.com','Vendor@123456','0900000004',NULL,'vendor','active','2026-06-29 15:48:36','2026-06-29 15:48:36',NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),('11111111-1111-1111-1111-111111111115','Chủ Quán Bột Chiên Trấn Giang Phùng Hưng','vendor5@saigon.com','Vendor@123456','0900000005',NULL,'vendor','active','2026-06-29 15:48:36','2026-06-29 15:48:36',NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),('11111111-1111-1111-1111-111111111116','Chủ Quán Cà Phê Vợt Ba Lù Chợ Phùng Hưng','vendor6@saigon.com','Vendor@123456','0900000006',NULL,'vendor','active','2026-06-29 15:48:36','2026-06-29 15:48:36',NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),('11111111-1111-1111-1111-111111111117','Chủ Quán Bánh Mì Huỳnh Hoa Sài Gòn','vendor7@saigon.com','Vendor@123456','0900000007',NULL,'vendor','active','2026-06-29 15:48:36','2026-06-29 15:48:36',NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),('11111111-1111-1111-1111-111111111118','Chủ Quán Chè Mâm Khánh Vy Sư Vạn Hạnh','vendor8@saigon.com','Vendor@123456','0900000008',NULL,'vendor','active','2026-06-29 15:48:36','2026-06-29 15:48:36',NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),('11111111-1111-1111-1111-111111111119','Chủ Quán Phở Hòa Pasteur','vendor9@saigon.com','Vendor@123456','0900000009',NULL,'vendor','active','2026-06-29 15:48:36','2026-06-29 15:48:36',NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),('11111111-1111-1111-1111-11111111111a','Chủ Quán Bánh Mì Hồng Hoa','vendor10@saigon.com','Vendor@123456','0900000010',NULL,'vendor','active','2026-06-29 15:48:36','2026-06-29 15:48:36',NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),('11111111-1111-1111-1111-11111111111b','Chủ Quán Sữa Tươi Trân Châu The Alley','vendor11@saigon.com','Vendor@123456','0900000011',NULL,'vendor','active','2026-06-29 15:48:36','2026-06-29 15:48:36',NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),('11111111-1111-1111-1111-11111111111c','Chủ Quán Quán Ăn Miền Trung O Nở','vendor12@saigon.com','Vendor@123456','0900000012',NULL,'vendor','active','2026-06-29 15:48:36','2026-06-29 15:48:36',NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),('33333333-3333-3333-3333-333333333301','Khách Hàng 1','khachhang1@gmail.com','password','0900000001',NULL,'user','active','2026-06-12 05:06:58','2026-06-15 12:16:47',NULL,NULL,0,'Quận 1, HCM',0,NULL,NULL,NULL,NULL,NULL,NULL),('33333333-3333-3333-3333-333333333302','Khách Hàng 2','khachhang2@gmail.com','password','0900000002',NULL,'user','active','2026-06-12 05:06:58','2026-06-12 05:06:58',NULL,NULL,0,'Quận 2, HCM',0,NULL,NULL,NULL,NULL,NULL,NULL),('33333333-3333-3333-3333-333333333303','Khách Hàng 3','khachhang3@gmail.com','password','0900000003',NULL,'shipper','active','2026-06-12 05:06:58','2026-07-01 17:20:06',NULL,NULL,0,'Quận 3, HCM',1,4.3,NULL,NULL,NULL,NULL,NULL),('33333333-3333-3333-3333-333333333304','Khách Hàng 4','khachhang4@gmail.com','password','0900000004',NULL,'user','active','2026-06-12 05:06:58','2026-06-12 05:06:58',NULL,NULL,0,'Quận 4, HCM',0,NULL,NULL,NULL,NULL,NULL,NULL),('33333333-3333-3333-3333-333333333305','Khách Hàng 5','khachhang5@gmail.com','password','0900000005',NULL,'user','active','2026-06-12 05:06:58','2026-06-12 05:06:58',NULL,NULL,0,'Quận 5, HCM',0,NULL,NULL,NULL,NULL,NULL,NULL),('50374ed4-d668-4fa2-914a-4d6c7b4d5fbc','Thế Vinh','23110364@student.hcmute.edu.vn','123456','0978621161','/uploads/avatars/avatar_50374ed4-d668-4fa2-914a-4d6c7b4d5fbc_1781113020867.jpeg','user','active','2026-06-09 16:52:01','2026-07-01 17:20:21',NULL,NULL,150,'1/18 đường số 4, KPho 2, phường Bình Thọ, TP. Thủ Đức',0,NULL,NULL,NULL,NULL,NULL,NULL),('8b7e9d58-76a6-42a1-ae3f-819adb12ab35','Thế Vinh','dtvinh.a1.20.21@gmail.com',NULL,'0978621161','https://lh3.googleusercontent.com/a/ACg8ocJ3fisfRZUs-ozD98SWB6HTwcsPb-HbUHcQ6QVaV1frZ-p_yF8P=s96-c','user','active','2026-06-24 02:02:12','2026-07-01 12:17:48',NULL,NULL,0,'1/18 đường số 4, khu phố 2, phường Bình Thọ, TP. Thủ Đức, TP.HCM',0,NULL,NULL,NULL,NULL,'103466498742312114875',NULL),('ad3379fa-9798-40ee-8f10-68f76aea4e15','Nguyen Van A','belake6808@adsprite.com','password','0978621161','/uploads/avatars/avatar_ad3379fa-9798-40ee-8f10-68f76aea4e15_1782695663907.png','shipper','banned','2026-06-29 01:09:23','2026-06-29 02:12:45',NULL,NULL,0,'Lò 2 beach',0,NULL,NULL,NULL,'Vi phạm tiêu chuẩn cộng đồng / Ngôn từ quấy rối',NULL,NULL),('b68efa52-eb3d-406f-9f9a-d618a35bc61e','Thế Vinh','1792215682153107@facebook.com',NULL,NULL,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1792215682153107&height=200&width=200&ext=1784860064&hash=Afu7KloP2u4f9cQrUhmXDAjY','user','active','2026-06-24 02:28:23','2026-06-24 02:28:23',NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,'1792215682153107'),('bd1dde06-017b-41f8-9bbe-48d671f9555d','Nguyen Van B','jamag57127@doefy.com','123456','0929292929292',NULL,'user','active','2026-07-01 17:08:28','2026-07-01 17:10:06',NULL,NULL,0,'1/18 đường số4, KP.2, phường Bình Thọ, TP. HCM',0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vouchers` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` enum('percentage','fixed_amount') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed_amount',
  `discount_value` decimal(10,2) NOT NULL,
  `max_discount_amount` decimal(10,2) DEFAULT NULL,
  `min_order_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `max_uses` int DEFAULT NULL,
  `used_count` int NOT NULL DEFAULT '0',
  `restaurant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `vouchers_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `vouchers_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` VALUES ('11264999-1b6f-486f-914c-35d3a541c34b','GIAM30K','fixed_amount',30000.00,NULL,50000.00,'2026-07-01 00:00:00','2026-07-04 00:00:00',1,10,0,NULL,'00000000-0000-0000-0000-000000000001','2026-07-01 17:22:18','2026-07-01 17:22:18');
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `balance` decimal(12,2) NOT NULL DEFAULT '0.00',
  `pending_balance` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` VALUES (1,'50374ed4-d668-4fa2-914a-4d6c7b4d5fbc',0.00,0.00,'2026-06-22 14:16:03','2026-06-22 14:16:03'),(2,'11111111-1111-1111-1111-111111111112',100000.00,0.00,'2026-06-23 02:56:57','2026-06-28 08:38:58'),(3,'ad3379fa-9798-40ee-8f10-68f76aea4e15',0.00,0.00,'2026-06-29 01:32:48','2026-06-29 01:32:48'),(4,'11111111-1111-1111-1111-111111111111',4225000.00,0.00,'2026-07-01 12:28:40','2026-07-01 17:19:31'),(5,'33333333-3333-3333-3333-333333333303',-195000.00,0.00,'2026-07-01 13:06:37','2026-07-01 17:19:31'),(6,'11111111-1111-1111-1111-111111111114',15000.00,0.00,'2026-07-01 13:28:39','2026-07-01 13:31:48'),(7,'bd1dde06-017b-41f8-9bbe-48d671f9555d',0.00,0.00,'2026-07-01 17:09:39','2026-07-01 17:09:39');
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdrawal_requests`
--

DROP TABLE IF EXISTS `withdrawal_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawal_requests` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `vendor_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `bank_info` json NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`),
  CONSTRAINT `withdrawal_requests_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawal_requests`
--

LOCK TABLES `withdrawal_requests` WRITE;
/*!40000 ALTER TABLE `withdrawal_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdrawal_requests` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-02  0:47:10
