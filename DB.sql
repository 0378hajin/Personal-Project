-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: sys
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `boast_board`
--

DROP TABLE IF EXISTS `boast_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boast_board` (
  `bidx` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(80) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `writeday` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(25) NOT NULL,
  `delyn` varchar(1) DEFAULT 'N',
  `filename` varchar(300) DEFAULT NULL,
  `midx` int NOT NULL,
  PRIMARY KEY (`bidx`),
  KEY `midx_fx_bb` (`midx`),
  CONSTRAINT `midx_fx_bb` FOREIGN KEY (`midx`) REFERENCES `member` (`midx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boast_board`
--

LOCK TABLES `boast_board` WRITE;
/*!40000 ALTER TABLE `boast_board` DISABLE KEYS */;
INSERT INTO `boast_board` VALUES (1,'시스템 감상','시스템 감상','2022-06-21 14:11:55','218.38.137.28','N','c95478ecfc9a29f088cd76fa3b2fd546.jpeg',1);
/*!40000 ALTER TABLE `boast_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boast_board_reply`
--

DROP TABLE IF EXISTS `boast_board_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boast_board_reply` (
  `rbidx` int NOT NULL AUTO_INCREMENT,
  `rcontent` varchar(1000) NOT NULL,
  `writeday` datetime DEFAULT CURRENT_TIMESTAMP,
  `rwriteday` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(25) NOT NULL,
  `delyn` varchar(1) DEFAULT 'N',
  `midx` int NOT NULL,
  `bidx` int NOT NULL,
  PRIMARY KEY (`rbidx`),
  KEY `bidx_fx_bbr` (`bidx`),
  KEY `midx_fx_bbr` (`midx`),
  CONSTRAINT `bidx_fx_bbr` FOREIGN KEY (`bidx`) REFERENCES `boast_board` (`bidx`),
  CONSTRAINT `midx_fx_bbr` FOREIGN KEY (`midx`) REFERENCES `member` (`midx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boast_board_reply`
--

LOCK TABLES `boast_board_reply` WRITE;
/*!40000 ALTER TABLE `boast_board_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `boast_board_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_board`
--

DROP TABLE IF EXISTS `community_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_board` (
  `bidx` int NOT NULL AUTO_INCREMENT,
  `kind` varchar(50) NOT NULL,
  `subject` varchar(80) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `writeday` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(25) NOT NULL,
  `delyn` varchar(1) DEFAULT 'N',
  `filename` varchar(300) DEFAULT NULL,
  `originbidx` int NOT NULL,
  `depth` int NOT NULL,
  `level_` int NOT NULL,
  `midx` int NOT NULL,
  PRIMARY KEY (`bidx`),
  KEY `midx_fx_cb` (`midx`),
  CONSTRAINT `midx_fx_cb` FOREIGN KEY (`midx`) REFERENCES `member` (`midx`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_board`
--

LOCK TABLES `community_board` WRITE;
/*!40000 ALTER TABLE `community_board` DISABLE KEYS */;
INSERT INTO `community_board` VALUES (1,'info','정보 게시판','정보 게시판','2022-06-20 17:08:06','127.0.0.1','N',NULL,1,0,0,1),(2,'answer','질문 게시판','질문 게시판','2022-06-20 17:14:01','127.0.0.1','N',NULL,2,0,0,1),(3,'talk','잡담 게시판','잡담 게시판','2022-06-20 17:44:04','127.0.0.1','N',NULL,3,0,0,1),(4,'reply','답변 게시판','답변 게시판','2022-06-21 14:15:23','192.168.0.48','N',NULL,2,1,1,1);
/*!40000 ALTER TABLE `community_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_board_reply`
--

DROP TABLE IF EXISTS `community_board_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_board_reply` (
  `rbidx` int NOT NULL AUTO_INCREMENT,
  `rcontent` varchar(1000) NOT NULL,
  `writeday` datetime DEFAULT CURRENT_TIMESTAMP,
  `rwriteday` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(25) NOT NULL,
  `delyn` varchar(1) DEFAULT 'N',
  `midx` int NOT NULL,
  `bidx` int NOT NULL,
  PRIMARY KEY (`rbidx`),
  KEY `bidx_fx_cbr` (`bidx`),
  KEY `midx_fx_cbr` (`midx`),
  CONSTRAINT `bidx_fx_cbr` FOREIGN KEY (`bidx`) REFERENCES `community_board` (`bidx`),
  CONSTRAINT `midx_fx_cbr` FOREIGN KEY (`midx`) REFERENCES `member` (`midx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_board_reply`
--

LOCK TABLES `community_board_reply` WRITE;
/*!40000 ALTER TABLE `community_board_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_board_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotdeal_board`
--

DROP TABLE IF EXISTS `hotdeal_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotdeal_board` (
  `bidx` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(80) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `link` varchar(1000) NOT NULL,
  `cost` varchar(100) NOT NULL,
  `del_cost` varchar(100) NOT NULL,
  `writeday` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(25) NOT NULL,
  `delyn` varchar(1) DEFAULT 'N',
  `filename` varchar(300) DEFAULT NULL,
  `midx` int NOT NULL,
  PRIMARY KEY (`bidx`),
  KEY `midx_fx_hb` (`midx`),
  CONSTRAINT `midx_fx_hb` FOREIGN KEY (`midx`) REFERENCES `member` (`midx`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotdeal_board`
--

LOCK TABLES `hotdeal_board` WRITE;
/*!40000 ALTER TABLE `hotdeal_board` DISABLE KEYS */;
INSERT INTO `hotdeal_board` VALUES (1,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:05','123.123.123.123','N',NULL,1),(2,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:06','123.123.123.123','N',NULL,1),(3,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:07','123.123.123.123','N',NULL,1),(4,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:08','123.123.123.123','N',NULL,1),(5,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:08','123.123.123.123','N',NULL,1),(6,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:09','123.123.123.123','N',NULL,1),(7,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:09','123.123.123.123','N',NULL,1),(8,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:10','123.123.123.123','N',NULL,1),(9,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:11','123.123.123.123','N',NULL,1),(10,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:11','123.123.123.123','N',NULL,1),(11,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:12','123.123.123.123','N',NULL,1),(12,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:12','123.123.123.123','N',NULL,1),(13,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:13','123.123.123.123','N',NULL,1),(14,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:14','123.123.123.123','N',NULL,1),(15,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:14','123.123.123.123','N',NULL,1),(16,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:15','123.123.123.123','N',NULL,1),(17,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:15','123.123.123.123','N',NULL,1),(18,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:16','123.123.123.123','N',NULL,1),(19,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:16','123.123.123.123','N',NULL,1),(20,'핫딜','안녕하세요','www.naver.com','5000원','무료배송','2022-06-16 17:31:17','123.123.123.123','N',NULL,1),(21,'핫딜 게시판','핫딜 게시판','www.naver.com','5000원','2500원','2022-06-21 14:10:46','127.0.0.1','N',NULL,1);
/*!40000 ALTER TABLE `hotdeal_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotdeal_board_reply`
--

DROP TABLE IF EXISTS `hotdeal_board_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotdeal_board_reply` (
  `rbidx` int NOT NULL AUTO_INCREMENT,
  `rcontent` varchar(1000) NOT NULL,
  `writeday` datetime DEFAULT CURRENT_TIMESTAMP,
  `rwriteday` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(25) NOT NULL,
  `delyn` varchar(1) DEFAULT 'N',
  `midx` int NOT NULL,
  `bidx` int NOT NULL,
  PRIMARY KEY (`rbidx`),
  KEY `bidx_fx_hbr` (`bidx`),
  KEY `midx_fx_hbr` (`midx`),
  CONSTRAINT `bidx_fx_hbr` FOREIGN KEY (`bidx`) REFERENCES `hotdeal_board` (`bidx`),
  CONSTRAINT `midx_fx_hbr` FOREIGN KEY (`midx`) REFERENCES `member` (`midx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotdeal_board_reply`
--

LOCK TABLES `hotdeal_board_reply` WRITE;
/*!40000 ALTER TABLE `hotdeal_board_reply` DISABLE KEYS */;
INSERT INTO `hotdeal_board_reply` VALUES (1,'하이','2022-06-16 17:31:37','2022-06-16 17:31:37','127.0.0.1','N',1,2);
/*!40000 ALTER TABLE `hotdeal_board_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `midx` int NOT NULL AUTO_INCREMENT,
  `memberid` varchar(50) NOT NULL,
  `memberpwd` varchar(50) NOT NULL,
  `membernickname` varchar(50) NOT NULL,
  `membermail` varchar(50) NOT NULL,
  `memberip` varchar(25) NOT NULL,
  `writeday` datetime DEFAULT CURRENT_TIMESTAMP,
  `delyn` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`midx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'test','test','test','test@test.com','127.0.0.1','2022-06-16 16:13:16','N');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_board`
--

DROP TABLE IF EXISTS `news_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_board` (
  `bidx` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(80) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `writeday` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(25) NOT NULL,
  `filename` varchar(300) DEFAULT NULL,
  `midx` int NOT NULL,
  `delyn` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`bidx`),
  KEY `midx_fx_nb` (`midx`),
  CONSTRAINT `midx_fx_nb` FOREIGN KEY (`midx`) REFERENCES `member` (`midx`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_board`
--

LOCK TABLES `news_board` WRITE;
/*!40000 ALTER TABLE `news_board` DISABLE KEYS */;
INSERT INTO `news_board` VALUES (1,'제목','안녕하세요','2022-06-16 16:38:48','123.123.123.123',NULL,1,'N'),(2,'제목','안녕하세요','2022-06-16 16:38:49','123.123.123.123',NULL,1,'N'),(3,'제목','안녕하세요','2022-06-16 16:38:50','123.123.123.123',NULL,1,'N'),(4,'제목','안녕하세요','2022-06-16 16:38:51','123.123.123.123',NULL,1,'N'),(5,'제목','안녕하세요','2022-06-16 16:38:52','123.123.123.123',NULL,1,'N'),(6,'제목','안녕하세요','2022-06-16 16:38:53','123.123.123.123',NULL,1,'N'),(7,'제목','안녕하세요','2022-06-16 16:38:54','123.123.123.123',NULL,1,'N'),(8,'제목','안녕하세요','2022-06-16 16:38:55','123.123.123.123',NULL,1,'N'),(9,'제목','안녕하세요','2022-06-16 16:38:56','123.123.123.123',NULL,1,'N'),(10,'제목','안녕하세요','2022-06-16 16:38:56','123.123.123.123',NULL,1,'N'),(11,'제목','안녕하세요','2022-06-16 16:38:57','123.123.123.123',NULL,1,'N'),(12,'제목','안녕하세요','2022-06-16 16:38:58','123.123.123.123',NULL,1,'N'),(13,'제목','안녕하세요','2022-06-16 16:38:59','123.123.123.123',NULL,1,'N'),(14,'제목','안녕하세요','2022-06-16 16:38:59','123.123.123.123',NULL,1,'N'),(15,'제목','안녕하세요','2022-06-16 16:39:16','123.123.123.123',NULL,1,'N'),(16,'제목','안녕하세요','2022-06-16 16:39:17','123.123.123.123',NULL,1,'N'),(17,'제목','안녕하세요','2022-06-16 16:39:18','123.123.123.123',NULL,1,'N'),(18,'제목','안녕하세요','2022-06-16 16:39:19','123.123.123.123',NULL,1,'N'),(19,'제목','안녕하세요','2022-06-16 16:39:19','123.123.123.123',NULL,1,'N'),(20,'제목','안녕하세요','2022-06-16 16:39:20','123.123.123.123',NULL,1,'N'),(21,'제목','안녕하세요','2022-06-16 16:39:21','123.123.123.123',NULL,1,'N'),(22,'제목','안녕하세요','2022-06-16 16:39:21','123.123.123.123',NULL,1,'N'),(23,'제목','안녕하세요','2022-06-16 16:39:22','123.123.123.123',NULL,1,'N'),(24,'제목','안녕하세요','2022-06-16 16:39:22','123.123.123.123',NULL,1,'N'),(25,'뉴스','뉴스','2022-06-17 16:21:14','127.0.0.1',NULL,1,'N');
/*!40000 ALTER TABLE `news_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_board_reply`
--

DROP TABLE IF EXISTS `news_board_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_board_reply` (
  `rbidx` int NOT NULL AUTO_INCREMENT,
  `rcontent` varchar(1000) NOT NULL,
  `rwriteday` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(25) NOT NULL,
  `delyn` varchar(1) DEFAULT 'N',
  `midx` int NOT NULL,
  `bidx` int NOT NULL,
  `writeday` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rbidx`),
  KEY `bidx_fx_nbr` (`bidx`),
  KEY `midx_fx_nbr` (`midx`),
  CONSTRAINT `bidx_fx_nbr` FOREIGN KEY (`bidx`) REFERENCES `news_board` (`bidx`),
  CONSTRAINT `midx_fx_nbr` FOREIGN KEY (`midx`) REFERENCES `member` (`midx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_board_reply`
--

LOCK TABLES `news_board_reply` WRITE;
/*!40000 ALTER TABLE `news_board_reply` DISABLE KEYS */;
INSERT INTO `news_board_reply` VALUES (1,'하이','2022-06-16 17:22:23','127.0.0.1','N',1,23,'2022-06-16 17:22:23');
/*!40000 ALTER TABLE `news_board_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_board`
--

DROP TABLE IF EXISTS `review_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_board` (
  `bidx` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(80) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `writeday` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(25) NOT NULL,
  `delyn` varchar(1) DEFAULT 'N',
  `filename` varchar(300) DEFAULT NULL,
  `midx` int NOT NULL,
  PRIMARY KEY (`bidx`),
  KEY `midx_fx_rb` (`midx`),
  CONSTRAINT `midx_fx_rb` FOREIGN KEY (`midx`) REFERENCES `member` (`midx`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_board`
--

LOCK TABLES `review_board` WRITE;
/*!40000 ALTER TABLE `review_board` DISABLE KEYS */;
INSERT INTO `review_board` VALUES (1,'칼럼','안녕하세요','2022-06-16 17:24:14','123.123.123.123','N',NULL,1),(2,'칼럼','안녕하세요','2022-06-16 17:24:15','123.123.123.123','N',NULL,1),(3,'칼럼','안녕하세요','2022-06-16 17:24:16','123.123.123.123','N',NULL,1),(4,'칼럼','안녕하세요','2022-06-16 17:24:17','123.123.123.123','N',NULL,1),(5,'칼럼','안녕하세요','2022-06-16 17:24:17','123.123.123.123','N',NULL,1),(6,'칼럼','안녕하세요','2022-06-16 17:24:18','123.123.123.123','N',NULL,1),(7,'칼럼','안녕하세요','2022-06-16 17:24:19','123.123.123.123','N',NULL,1),(8,'칼럼','안녕하세요','2022-06-16 17:24:19','123.123.123.123','N',NULL,1),(9,'칼럼','안녕하세요','2022-06-16 17:24:20','123.123.123.123','N',NULL,1),(10,'칼럼','안녕하세요','2022-06-16 17:24:21','123.123.123.123','N',NULL,1),(11,'칼럼','안녕하세요','2022-06-16 17:24:21','123.123.123.123','N',NULL,1),(12,'칼럼','안녕하세요','2022-06-16 17:24:22','123.123.123.123','N',NULL,1),(13,'칼럼','안녕하세요','2022-06-16 17:24:23','123.123.123.123','N',NULL,1),(14,'칼럼','안녕하세요','2022-06-16 17:24:23','123.123.123.123','N',NULL,1),(15,'칼럼','안녕하세요','2022-06-16 17:24:24','123.123.123.123','N',NULL,1),(16,'칼럼','안녕하세요','2022-06-16 17:24:24','123.123.123.123','N',NULL,1),(17,'칼럼','안녕하세요','2022-06-16 17:24:25','123.123.123.123','N',NULL,1),(18,'칼럼','안녕하세요','2022-06-16 17:24:26','123.123.123.123','N',NULL,1),(19,'칼럼','안녕하세요','2022-06-16 17:24:26','123.123.123.123','N',NULL,1),(20,'칼럼','안녕하세요','2022-06-16 17:24:27','123.123.123.123','N',NULL,1),(21,'칼럼','안녕하세요','2022-06-16 17:24:28','123.123.123.123','N',NULL,1),(22,'칼럼','안녕하세요','2022-06-16 17:24:28','123.123.123.123','N',NULL,1),(23,'칼럼','안녕하세요','2022-06-16 17:24:29','123.123.123.123','N',NULL,1),(24,'칼럼','안녕하세요','2022-06-16 17:24:30','123.123.123.123','N',NULL,1),(25,'칼럼','안녕하세요','2022-06-16 17:24:30','123.123.123.123','N',NULL,1),(26,'칼럼','안녕하세요','2022-06-16 17:24:31','123.123.123.123','N',NULL,1),(27,'칼럼','안녕하세요','2022-06-16 17:24:31','123.123.123.123','N',NULL,1),(28,'칼럼','안녕하세요','2022-06-16 17:24:32','123.123.123.123','N',NULL,1),(29,'칼럼','안녕하세요','2022-06-16 17:24:33','123.123.123.123','N',NULL,1),(30,'칼럼 게시판','칼럼 게시판','2022-06-21 14:10:10','127.0.0.1','N',NULL,1);
/*!40000 ALTER TABLE `review_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_board_reply`
--

DROP TABLE IF EXISTS `review_board_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_board_reply` (
  `rbidx` int NOT NULL AUTO_INCREMENT,
  `rcontent` varchar(1000) NOT NULL,
  `writeday` datetime DEFAULT CURRENT_TIMESTAMP,
  `rwriteday` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(25) NOT NULL,
  `delyn` varchar(1) DEFAULT 'N',
  `midx` int NOT NULL,
  `bidx` int NOT NULL,
  PRIMARY KEY (`rbidx`),
  KEY `bidx_fx_rbr` (`bidx`),
  KEY `midx_fx_rbr` (`midx`),
  CONSTRAINT `bidx_fx_rbr` FOREIGN KEY (`bidx`) REFERENCES `review_board` (`bidx`),
  CONSTRAINT `midx_fx_rbr` FOREIGN KEY (`midx`) REFERENCES `member` (`midx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_board_reply`
--

LOCK TABLES `review_board_reply` WRITE;
/*!40000 ALTER TABLE `review_board_reply` DISABLE KEYS */;
INSERT INTO `review_board_reply` VALUES (1,'하이','2022-06-16 17:27:08','2022-06-16 17:27:08','127.0.0.1','N',1,2);
/*!40000 ALTER TABLE `review_board_reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-21 15:54:55
