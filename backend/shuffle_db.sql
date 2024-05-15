-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: shuffle_db
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `recall_modes`
--

DROP TABLE IF EXISTS `recall_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recall_modes` (
  `recall_mode_ID` int NOT NULL AUTO_INCREMENT,
  `recall_mode_name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`recall_mode_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recall_modes`
--

LOCK TABLES `recall_modes` WRITE;
/*!40000 ALTER TABLE `recall_modes` DISABLE KEYS */;
INSERT INTO `recall_modes` VALUES (1,'simultaneous comparison','Recall the order of your card by guessing each one by one.'),(2,'fill list','As the name says, fill the list to recall the order of your cards.');
/*!40000 ALTER TABLE `recall_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_configs`
--

DROP TABLE IF EXISTS `session_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_configs` (
  `config_ID` int NOT NULL,
  `session_ID` int NOT NULL,
  `user_ID` int NOT NULL,
  `time_mode_ID` int NOT NULL,
  `shuff_mode_ID` int NOT NULL,
  `deck_no` int NOT NULL,
  `card_no` int NOT NULL,
  `session_decks` text,
  `recall_mode_ID` int NOT NULL,
  PRIMARY KEY (`config_ID`),
  KEY `time_mode_ID` (`time_mode_ID`),
  KEY `shuff_mode_ID` (`shuff_mode_ID`),
  KEY `user_ID` (`user_ID`),
  KEY `fk_recall_mode_ID` (`recall_mode_ID`),
  CONSTRAINT `fk_recall_mode_ID` FOREIGN KEY (`recall_mode_ID`) REFERENCES `recall_modes` (`recall_mode_ID`),
  CONSTRAINT `session_configs_ibfk_1` FOREIGN KEY (`time_mode_ID`) REFERENCES `time_modes` (`time_mode_ID`),
  CONSTRAINT `session_configs_ibfk_2` FOREIGN KEY (`shuff_mode_ID`) REFERENCES `shuff_modes` (`shuff_mode_ID`),
  CONSTRAINT `session_configs_ibfk_3` FOREIGN KEY (`user_ID`) REFERENCES `shuffle_users` (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_configs`
--

LOCK TABLES `session_configs` WRITE;
/*!40000 ALTER TABLE `session_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_results`
--

DROP TABLE IF EXISTS `session_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_results` (
  `session_result_ID` int NOT NULL AUTO_INCREMENT,
  `session_ID` int NOT NULL,
  `user_ID` int NOT NULL,
  `mem_spd` decimal(4,2) DEFAULT NULL,
  `rec_spd` decimal(4,2) DEFAULT NULL,
  `acc` decimal(6,3) DEFAULT NULL,
  `sess_card_ac` int DEFAULT NULL,
  `sess_card_2c` int DEFAULT NULL,
  `sess_card_3c` int DEFAULT NULL,
  `sess_card_4c` int DEFAULT NULL,
  `sess_card_5c` int DEFAULT NULL,
  `sess_card_6c` int DEFAULT NULL,
  `sess_card_7c` int DEFAULT NULL,
  `sess_card_8c` int DEFAULT NULL,
  `sess_card_9c` int DEFAULT NULL,
  `sess_card_10c` int DEFAULT NULL,
  `sess_card_jc` int DEFAULT NULL,
  `sess_card_qc` int DEFAULT NULL,
  `sess_card_kc` int DEFAULT NULL,
  `sess_card_ah` int DEFAULT NULL,
  `sess_card_2h` int DEFAULT NULL,
  `sess_card_3h` int DEFAULT NULL,
  `sess_card_4h` int DEFAULT NULL,
  `sess_card_5h` int DEFAULT NULL,
  `sess_card_6h` int DEFAULT NULL,
  `sess_card_7h` int DEFAULT NULL,
  `sess_card_8h` int DEFAULT NULL,
  `sess_card_9h` int DEFAULT NULL,
  `sess_card_10h` int DEFAULT NULL,
  `sess_card_jh` int DEFAULT NULL,
  `sess_card_qh` int DEFAULT NULL,
  `sess_card_kh` int DEFAULT NULL,
  `sess_card_as` int DEFAULT NULL,
  `sess_card_2s` int DEFAULT NULL,
  `sess_card_3s` int DEFAULT NULL,
  `sess_card_4s` int DEFAULT NULL,
  `sess_card_5s` int DEFAULT NULL,
  `sess_card_6s` int DEFAULT NULL,
  `sess_card_7s` int DEFAULT NULL,
  `sess_card_8s` int DEFAULT NULL,
  `sess_card_9s` int DEFAULT NULL,
  `sess_card_10s` int DEFAULT NULL,
  `sess_card_js` int DEFAULT NULL,
  `sess_card_qs` int DEFAULT NULL,
  `sess_card_ks` int DEFAULT NULL,
  `sess_card_ad` int DEFAULT NULL,
  `sess_card_2d` int DEFAULT NULL,
  `sess_card_3d` int DEFAULT NULL,
  `sess_card_4d` int DEFAULT NULL,
  `sess_card_5d` int DEFAULT NULL,
  `sess_card_6d` int DEFAULT NULL,
  `sess_card_7d` int DEFAULT NULL,
  `sess_card_8d` int DEFAULT NULL,
  `sess_card_9d` int DEFAULT NULL,
  `sess_card_10d` int DEFAULT NULL,
  `sess_card_jd` int DEFAULT NULL,
  `sess_card_qd` int DEFAULT NULL,
  `sess_card_kd` int DEFAULT NULL,
  PRIMARY KEY (`session_result_ID`),
  KEY `sess_card_ac` (`sess_card_ac`),
  KEY `sess_card_2c` (`sess_card_2c`),
  KEY `sess_card_3c` (`sess_card_3c`),
  KEY `sess_card_4c` (`sess_card_4c`),
  KEY `sess_card_5c` (`sess_card_5c`),
  KEY `sess_card_6c` (`sess_card_6c`),
  KEY `sess_card_7c` (`sess_card_7c`),
  KEY `sess_card_8c` (`sess_card_8c`),
  KEY `sess_card_9c` (`sess_card_9c`),
  KEY `sess_card_10c` (`sess_card_10c`),
  KEY `sess_card_jc` (`sess_card_jc`),
  KEY `sess_card_qc` (`sess_card_qc`),
  KEY `sess_card_kc` (`sess_card_kc`),
  KEY `sess_card_ah` (`sess_card_ah`),
  KEY `sess_card_2h` (`sess_card_2h`),
  KEY `sess_card_3h` (`sess_card_3h`),
  KEY `sess_card_4h` (`sess_card_4h`),
  KEY `sess_card_5h` (`sess_card_5h`),
  KEY `sess_card_6h` (`sess_card_6h`),
  KEY `sess_card_7h` (`sess_card_7h`),
  KEY `sess_card_8h` (`sess_card_8h`),
  KEY `sess_card_9h` (`sess_card_9h`),
  KEY `sess_card_10h` (`sess_card_10h`),
  KEY `sess_card_jh` (`sess_card_jh`),
  KEY `sess_card_qh` (`sess_card_qh`),
  KEY `sess_card_kh` (`sess_card_kh`),
  KEY `sess_card_as` (`sess_card_as`),
  KEY `sess_card_2s` (`sess_card_2s`),
  KEY `sess_card_3s` (`sess_card_3s`),
  KEY `sess_card_4s` (`sess_card_4s`),
  KEY `sess_card_5s` (`sess_card_5s`),
  KEY `sess_card_6s` (`sess_card_6s`),
  KEY `sess_card_7s` (`sess_card_7s`),
  KEY `sess_card_8s` (`sess_card_8s`),
  KEY `sess_card_9s` (`sess_card_9s`),
  KEY `sess_card_10s` (`sess_card_10s`),
  KEY `sess_card_js` (`sess_card_js`),
  KEY `sess_card_qs` (`sess_card_qs`),
  KEY `sess_card_ks` (`sess_card_ks`),
  KEY `sess_card_ad` (`sess_card_ad`),
  KEY `sess_card_2d` (`sess_card_2d`),
  KEY `sess_card_3d` (`sess_card_3d`),
  KEY `sess_card_4d` (`sess_card_4d`),
  KEY `sess_card_5d` (`sess_card_5d`),
  KEY `sess_card_6d` (`sess_card_6d`),
  KEY `sess_card_7d` (`sess_card_7d`),
  KEY `sess_card_8d` (`sess_card_8d`),
  KEY `sess_card_9d` (`sess_card_9d`),
  KEY `sess_card_10d` (`sess_card_10d`),
  KEY `sess_card_jd` (`sess_card_jd`),
  KEY `sess_card_qd` (`sess_card_qd`),
  KEY `sess_card_kd` (`sess_card_kd`),
  KEY `session_ID` (`session_ID`),
  CONSTRAINT `session_results_ibfk_1` FOREIGN KEY (`sess_card_ac`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_10` FOREIGN KEY (`sess_card_10c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_11` FOREIGN KEY (`sess_card_jc`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_12` FOREIGN KEY (`sess_card_qc`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_13` FOREIGN KEY (`sess_card_kc`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_14` FOREIGN KEY (`sess_card_ah`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_15` FOREIGN KEY (`sess_card_2h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_16` FOREIGN KEY (`sess_card_3h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_17` FOREIGN KEY (`sess_card_4h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_18` FOREIGN KEY (`sess_card_5h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_19` FOREIGN KEY (`sess_card_6h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_2` FOREIGN KEY (`sess_card_2c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_20` FOREIGN KEY (`sess_card_7h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_21` FOREIGN KEY (`sess_card_8h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_22` FOREIGN KEY (`sess_card_9h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_23` FOREIGN KEY (`sess_card_10h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_24` FOREIGN KEY (`sess_card_jh`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_25` FOREIGN KEY (`sess_card_qh`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_26` FOREIGN KEY (`sess_card_kh`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_27` FOREIGN KEY (`sess_card_as`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_28` FOREIGN KEY (`sess_card_2s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_29` FOREIGN KEY (`sess_card_3s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_3` FOREIGN KEY (`sess_card_3c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_30` FOREIGN KEY (`sess_card_4s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_31` FOREIGN KEY (`sess_card_5s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_32` FOREIGN KEY (`sess_card_6s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_33` FOREIGN KEY (`sess_card_7s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_34` FOREIGN KEY (`sess_card_8s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_35` FOREIGN KEY (`sess_card_9s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_36` FOREIGN KEY (`sess_card_10s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_37` FOREIGN KEY (`sess_card_js`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_38` FOREIGN KEY (`sess_card_qs`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_39` FOREIGN KEY (`sess_card_ks`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_4` FOREIGN KEY (`sess_card_4c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_40` FOREIGN KEY (`sess_card_ad`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_41` FOREIGN KEY (`sess_card_2d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_42` FOREIGN KEY (`sess_card_3d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_43` FOREIGN KEY (`sess_card_4d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_44` FOREIGN KEY (`sess_card_5d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_45` FOREIGN KEY (`sess_card_6d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_46` FOREIGN KEY (`sess_card_7d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_47` FOREIGN KEY (`sess_card_8d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_48` FOREIGN KEY (`sess_card_9d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_49` FOREIGN KEY (`sess_card_10d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_5` FOREIGN KEY (`sess_card_5c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_50` FOREIGN KEY (`sess_card_jd`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_51` FOREIGN KEY (`sess_card_qd`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_52` FOREIGN KEY (`sess_card_kd`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_53` FOREIGN KEY (`session_ID`) REFERENCES `training_sessions` (`session_ID`),
  CONSTRAINT `session_results_ibfk_6` FOREIGN KEY (`sess_card_6c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_7` FOREIGN KEY (`sess_card_7c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_8` FOREIGN KEY (`sess_card_8c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `session_results_ibfk_9` FOREIGN KEY (`sess_card_9c`) REFERENCES `user_cards` (`user_card_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_results`
--

LOCK TABLES `session_results` WRITE;
/*!40000 ALTER TABLE `session_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shuff_modes`
--

DROP TABLE IF EXISTS `shuff_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shuff_modes` (
  `shuff_mode_ID` int NOT NULL AUTO_INCREMENT,
  `description` text,
  `shuff_mode_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shuff_mode_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shuff_modes`
--

LOCK TABLES `shuff_modes` WRITE;
/*!40000 ALTER TABLE `shuff_modes` DISABLE KEYS */;
INSERT INTO `shuff_modes` VALUES (1,'Shuffling mode where random shuffling methods, such as *faro shuffle* or *overhand shuffle*, are done for various times, replicating how a normal person in normal circumstances would shuffle a deck of cards.','normal'),(2,'Shuffling mode where *pseudo-random number generator* produces a random sequence of numbers, determining the order in which the cards are shuffled.','standard');
/*!40000 ALTER TABLE `shuff_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shuffle_users`
--

DROP TABLE IF EXISTS `shuffle_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shuffle_users` (
  `user_ID` int NOT NULL AUTO_INCREMENT,
  `password` varchar(8) NOT NULL,
  `progress` int DEFAULT NULL,
  PRIMARY KEY (`user_ID`),
  KEY `progress` (`progress`),
  CONSTRAINT `shuffle_users_ibfk_1` FOREIGN KEY (`progress`) REFERENCES `user_progress` (`progress_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shuffle_users`
--

LOCK TABLES `shuffle_users` WRITE;
/*!40000 ALTER TABLE `shuffle_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `shuffle_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standard_cards`
--

DROP TABLE IF EXISTS `standard_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `standard_cards` (
  `card_ID` varchar(3) NOT NULL,
  `card_value` varchar(6) NOT NULL,
  `card_suite` varchar(8) NOT NULL,
  PRIMARY KEY (`card_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standard_cards`
--

LOCK TABLES `standard_cards` WRITE;
/*!40000 ALTER TABLE `standard_cards` DISABLE KEYS */;
INSERT INTO `standard_cards` VALUES ('10c','Ten','Clubs'),('10d','Ten','Diamonds'),('10h','Ten','Hearts'),('10s','Ten','Spades'),('2c','Two','Clubs'),('2d','Two','Diamonds'),('2h','Two','Hearts'),('2s','Two','Spades'),('3c','Three','Clubs'),('3d','Three','Diamonds'),('3h','Three','Hearts'),('3s','Three','Spades'),('4c','Four','Clubs'),('4d','Four','Diamonds'),('4h','Four','Hearts'),('4s','Four','Spades'),('5c','Five','Clubs'),('5d','Five','Diamonds'),('5h','Five','Hearts'),('5s','Five','Spades'),('6c','Six','Clubs'),('6d','Six','Diamonds'),('6h','Six','Hearts'),('6s','Six','Spades'),('7c','Seven','Clubs'),('7d','Seven','Diamonds'),('7h','Seven','Hearts'),('7s','Seven','Spades'),('8c','Eight','Clubs'),('8d','Eight','Diamonds'),('8h','Eight','Hearts'),('8s','Eight','Spades'),('9c','Nine','Clubs'),('9d','Nine','Diamonds'),('9h','Nine','Hearts'),('9s','Nine','Spades'),('ac','Ace','Clubs'),('ad','Ace','Diamonds'),('ah','Ace','Hearts'),('as','Ace','Spades'),('jc','Jack','Clubs'),('jd','Jack','Diamonds'),('jh','Jack','Hearts'),('js','Jack','Spades'),('kc','King','Clubs'),('kd','King','Diamonds'),('kh','King','Hearts'),('ks','King','Spades'),('qc','Queen','Clubs'),('qd','Queen','Diamonds'),('qh','Queen','Hearts'),('qs','Queen','Spades');
/*!40000 ALTER TABLE `standard_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_modes`
--

DROP TABLE IF EXISTS `time_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_modes` (
  `time_mode_ID` int NOT NULL AUTO_INCREMENT,
  `description` text,
  `time_mode_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`time_mode_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_modes`
--

LOCK TABLES `time_modes` WRITE;
/*!40000 ALTER TABLE `time_modes` DISABLE KEYS */;
INSERT INTO `time_modes` VALUES (1,'Memorize your deck without time pressure! (A timer is displayed).','zen mode'),(2,'A timer is displayed... Time is not a luxury you have!','timed mode');
/*!40000 ALTER TABLE `time_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_sessions`
--

DROP TABLE IF EXISTS `training_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_sessions` (
  `session_ID` int NOT NULL,
  `user_ID` int NOT NULL,
  `config_ID` int NOT NULL,
  `session_result_ID` int NOT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`session_ID`),
  KEY `user_ID` (`user_ID`),
  KEY `config_ID` (`config_ID`),
  KEY `fk_session_result_ID` (`session_result_ID`),
  CONSTRAINT `fk_session_result_ID` FOREIGN KEY (`session_result_ID`) REFERENCES `session_results` (`session_result_ID`),
  CONSTRAINT `training_sessions_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `shuffle_users` (`user_ID`),
  CONSTRAINT `training_sessions_ibfk_2` FOREIGN KEY (`config_ID`) REFERENCES `session_configs` (`config_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_sessions`
--

LOCK TABLES `training_sessions` WRITE;
/*!40000 ALTER TABLE `training_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cards`
--

DROP TABLE IF EXISTS `user_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_cards` (
  `user_card_ID` int NOT NULL AUTO_INCREMENT,
  `card_ID` varchar(3) NOT NULL,
  `card_acc` decimal(6,3) DEFAULT NULL,
  PRIMARY KEY (`user_card_ID`),
  KEY `card_ID` (`card_ID`),
  CONSTRAINT `user_cards_ibfk_1` FOREIGN KEY (`card_ID`) REFERENCES `standard_cards` (`card_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cards`
--

LOCK TABLES `user_cards` WRITE;
/*!40000 ALTER TABLE `user_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_progress`
--

DROP TABLE IF EXISTS `user_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_progress` (
  `progress_ID` int NOT NULL AUTO_INCREMENT,
  `user_ID` int NOT NULL,
  `ave_mem_spd` decimal(4,2) DEFAULT NULL,
  `ave_rec_spd` decimal(4,2) DEFAULT NULL,
  `ave_acc` decimal(6,3) DEFAULT NULL,
  `user_card_ac` int DEFAULT NULL,
  `user_card_2c` int DEFAULT NULL,
  `user_card_3c` int DEFAULT NULL,
  `user_card_4c` int DEFAULT NULL,
  `user_card_5c` int DEFAULT NULL,
  `user_card_6c` int DEFAULT NULL,
  `user_card_7c` int DEFAULT NULL,
  `user_card_8c` int DEFAULT NULL,
  `user_card_9c` int DEFAULT NULL,
  `user_card_10c` int DEFAULT NULL,
  `user_card_jc` int DEFAULT NULL,
  `user_card_qc` int DEFAULT NULL,
  `user_card_kc` int DEFAULT NULL,
  `user_card_ah` int DEFAULT NULL,
  `user_card_2h` int DEFAULT NULL,
  `user_card_3h` int DEFAULT NULL,
  `user_card_4h` int DEFAULT NULL,
  `user_card_5h` int DEFAULT NULL,
  `user_card_6h` int DEFAULT NULL,
  `user_card_7h` int DEFAULT NULL,
  `user_card_8h` int DEFAULT NULL,
  `user_card_9h` int DEFAULT NULL,
  `user_card_10h` int DEFAULT NULL,
  `user_card_jh` int DEFAULT NULL,
  `user_card_qh` int DEFAULT NULL,
  `user_card_kh` int DEFAULT NULL,
  `user_card_as` int DEFAULT NULL,
  `user_card_2s` int DEFAULT NULL,
  `user_card_3s` int DEFAULT NULL,
  `user_card_4s` int DEFAULT NULL,
  `user_card_5s` int DEFAULT NULL,
  `user_card_6s` int DEFAULT NULL,
  `user_card_7s` int DEFAULT NULL,
  `user_card_8s` int DEFAULT NULL,
  `user_card_9s` int DEFAULT NULL,
  `user_card_10s` int DEFAULT NULL,
  `user_card_js` int DEFAULT NULL,
  `user_card_qs` int DEFAULT NULL,
  `user_card_ks` int DEFAULT NULL,
  `user_card_ad` int DEFAULT NULL,
  `user_card_2d` int DEFAULT NULL,
  `user_card_3d` int DEFAULT NULL,
  `user_card_4d` int DEFAULT NULL,
  `user_card_5d` int DEFAULT NULL,
  `user_card_6d` int DEFAULT NULL,
  `user_card_7d` int DEFAULT NULL,
  `user_card_8d` int DEFAULT NULL,
  `user_card_9d` int DEFAULT NULL,
  `user_card_10d` int DEFAULT NULL,
  `user_card_jd` int DEFAULT NULL,
  `user_card_qd` int DEFAULT NULL,
  `user_card_kd` int DEFAULT NULL,
  PRIMARY KEY (`progress_ID`),
  KEY `user_card_ac` (`user_card_ac`),
  KEY `user_card_2c` (`user_card_2c`),
  KEY `user_card_3c` (`user_card_3c`),
  KEY `user_card_4c` (`user_card_4c`),
  KEY `user_card_5c` (`user_card_5c`),
  KEY `user_card_6c` (`user_card_6c`),
  KEY `user_card_7c` (`user_card_7c`),
  KEY `user_card_8c` (`user_card_8c`),
  KEY `user_card_9c` (`user_card_9c`),
  KEY `user_card_10c` (`user_card_10c`),
  KEY `user_card_jc` (`user_card_jc`),
  KEY `user_card_qc` (`user_card_qc`),
  KEY `user_card_kc` (`user_card_kc`),
  KEY `user_card_ah` (`user_card_ah`),
  KEY `user_card_2h` (`user_card_2h`),
  KEY `user_card_3h` (`user_card_3h`),
  KEY `user_card_4h` (`user_card_4h`),
  KEY `user_card_5h` (`user_card_5h`),
  KEY `user_card_6h` (`user_card_6h`),
  KEY `user_card_7h` (`user_card_7h`),
  KEY `user_card_8h` (`user_card_8h`),
  KEY `user_card_9h` (`user_card_9h`),
  KEY `user_card_10h` (`user_card_10h`),
  KEY `user_card_jh` (`user_card_jh`),
  KEY `user_card_qh` (`user_card_qh`),
  KEY `user_card_kh` (`user_card_kh`),
  KEY `user_card_as` (`user_card_as`),
  KEY `user_card_2s` (`user_card_2s`),
  KEY `user_card_3s` (`user_card_3s`),
  KEY `user_card_4s` (`user_card_4s`),
  KEY `user_card_5s` (`user_card_5s`),
  KEY `user_card_6s` (`user_card_6s`),
  KEY `user_card_7s` (`user_card_7s`),
  KEY `user_card_8s` (`user_card_8s`),
  KEY `user_card_9s` (`user_card_9s`),
  KEY `user_card_10s` (`user_card_10s`),
  KEY `user_card_js` (`user_card_js`),
  KEY `user_card_qs` (`user_card_qs`),
  KEY `user_card_ks` (`user_card_ks`),
  KEY `user_card_ad` (`user_card_ad`),
  KEY `user_card_2d` (`user_card_2d`),
  KEY `user_card_3d` (`user_card_3d`),
  KEY `user_card_4d` (`user_card_4d`),
  KEY `user_card_5d` (`user_card_5d`),
  KEY `user_card_6d` (`user_card_6d`),
  KEY `user_card_7d` (`user_card_7d`),
  KEY `user_card_8d` (`user_card_8d`),
  KEY `user_card_9d` (`user_card_9d`),
  KEY `user_card_10d` (`user_card_10d`),
  KEY `user_card_jd` (`user_card_jd`),
  KEY `user_card_qd` (`user_card_qd`),
  KEY `user_card_kd` (`user_card_kd`),
  KEY `fk_user_ID` (`user_ID`),
  CONSTRAINT `fk_user_ID` FOREIGN KEY (`user_ID`) REFERENCES `shuffle_users` (`user_ID`),
  CONSTRAINT `user_progress_ibfk_1` FOREIGN KEY (`user_card_ac`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_10` FOREIGN KEY (`user_card_10c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_11` FOREIGN KEY (`user_card_jc`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_12` FOREIGN KEY (`user_card_qc`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_13` FOREIGN KEY (`user_card_kc`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_14` FOREIGN KEY (`user_card_ah`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_15` FOREIGN KEY (`user_card_2h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_16` FOREIGN KEY (`user_card_3h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_17` FOREIGN KEY (`user_card_4h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_18` FOREIGN KEY (`user_card_5h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_19` FOREIGN KEY (`user_card_6h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_2` FOREIGN KEY (`user_card_2c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_20` FOREIGN KEY (`user_card_7h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_21` FOREIGN KEY (`user_card_8h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_22` FOREIGN KEY (`user_card_9h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_23` FOREIGN KEY (`user_card_10h`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_24` FOREIGN KEY (`user_card_jh`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_25` FOREIGN KEY (`user_card_qh`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_26` FOREIGN KEY (`user_card_kh`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_27` FOREIGN KEY (`user_card_as`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_28` FOREIGN KEY (`user_card_2s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_29` FOREIGN KEY (`user_card_3s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_3` FOREIGN KEY (`user_card_3c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_30` FOREIGN KEY (`user_card_4s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_31` FOREIGN KEY (`user_card_5s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_32` FOREIGN KEY (`user_card_6s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_33` FOREIGN KEY (`user_card_7s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_34` FOREIGN KEY (`user_card_8s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_35` FOREIGN KEY (`user_card_9s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_36` FOREIGN KEY (`user_card_10s`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_37` FOREIGN KEY (`user_card_js`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_38` FOREIGN KEY (`user_card_qs`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_39` FOREIGN KEY (`user_card_ks`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_4` FOREIGN KEY (`user_card_4c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_40` FOREIGN KEY (`user_card_ad`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_41` FOREIGN KEY (`user_card_2d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_42` FOREIGN KEY (`user_card_3d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_43` FOREIGN KEY (`user_card_4d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_44` FOREIGN KEY (`user_card_5d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_45` FOREIGN KEY (`user_card_6d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_46` FOREIGN KEY (`user_card_7d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_47` FOREIGN KEY (`user_card_8d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_48` FOREIGN KEY (`user_card_9d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_49` FOREIGN KEY (`user_card_10d`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_5` FOREIGN KEY (`user_card_5c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_50` FOREIGN KEY (`user_card_jd`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_51` FOREIGN KEY (`user_card_qd`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_52` FOREIGN KEY (`user_card_kd`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_6` FOREIGN KEY (`user_card_6c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_7` FOREIGN KEY (`user_card_7c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_8` FOREIGN KEY (`user_card_8c`) REFERENCES `user_cards` (`user_card_ID`),
  CONSTRAINT `user_progress_ibfk_9` FOREIGN KEY (`user_card_9c`) REFERENCES `user_cards` (`user_card_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_progress`
--

LOCK TABLES `user_progress` WRITE;
/*!40000 ALTER TABLE `user_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_progress` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-29 17:05:25
