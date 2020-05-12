-- MySQL dump 10.13  Distrib 5.7.28, for macos10.14 (x86_64)
--
-- Host: localhost    Database: manga_review
-- ------------------------------------------------------
-- Server version	5.7.28

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
-- Table structure for table `comics`
--

DROP TABLE IF EXISTS `comics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comics`
--

LOCK TABLES `comics` WRITE;
/*!40000 ALTER TABLE `comics` DISABLE KEYS */;
INSERT INTO `comics` VALUES (1,'鳥山 明','2020-01-18 21:58:28','ドラゴンボール','2020-01-19 00:29:00'),(2,'尾田 栄一郎','2020-01-18 22:01:54','ONE PIECE','2020-01-18 22:01:54'),(3,'井上　雄彦','2020-01-18 22:03:03','SLAM DUNK','2020-01-18 22:03:03'),(4,' 岸本 斉史','2020-01-18 22:03:44','NARUTO -ナルト-','2020-01-18 22:03:44'),(5,' 澤井　啓夫','2020-01-18 22:04:55','ボボボーボ・ボーボボ','2020-01-18 22:04:55'),(6,'諫山　創','2020-01-18 22:05:34','進撃の巨人','2020-01-18 22:05:34'),(7,'原　泰久','2020-01-18 22:06:00','キングダム','2020-01-18 22:06:00'),(8,'冨樫 義博','2020-01-18 22:07:24','HUNTER×HUNTER','2020-01-18 22:07:24'),(9,'荒川　弘','2020-01-18 22:08:07',' 鋼の錬金術師','2020-01-18 22:08:07'),(10,'板垣　恵介','2020-01-18 22:11:11','グラップラー刃牙','2020-01-18 22:11:11'),(11,'岩明 均','2020-01-18 22:12:59','寄生獣','2020-01-18 22:12:59'),(12,'真島 ヒロ','2020-01-18 22:15:27','RAVE','2020-01-18 22:15:27');
/*!40000 ALTER TABLE `comics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posters`
--

DROP TABLE IF EXISTS `posters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(64) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_69mk7uwvpl9w187dnpsb1jubd` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posters`
--

LOCK TABLES `posters` WRITE;
/*!40000 ALTER TABLE `posters` DISABLE KEYS */;
INSERT INTO `posters` VALUES (9,'2020-01-17 18:44:42','クリス','0F87E75ABA4D9688C11FC1AFDC8B8EE496E9E357BB3B8890FF69AF528BB5D131','2020-01-17 18:44:42'),(7,'2020-01-17 18:36:42','アンソニー','2E9C86C595D8FC667AAFC1F001DC8B8ABE72D33D64B2910367CFCD63A82B9941','2020-01-29 20:50:21'),(8,'2020-01-17 18:37:38','ブラウン','5A45AE97C1E37F84D03F5CD7BC30DD91B433E60E41942EF7FAC6D3DFAEF29116','2020-01-17 18:37:38'),(6,'2020-01-17 18:35:52','レオ','04DA95048F9E3D92EC00F9DD4587C7E27CD8A844168AB5F5AC7332442A950ABD','2020-02-05 20:10:04'),(10,'2020-01-17 18:55:48','ダニー','314258CE1F3CFCAECCC842E3C5082DAC6D5EBF6C199589257969C60CA9C7502E','2020-01-17 18:55:48'),(11,'2020-01-17 19:53:07','イーサン','08251FFFC8AF547553A4A1784854C4CF01AA03300823B54F962E1326598CFD60','2020-01-29 22:07:55'),(14,'2020-01-29 22:12:40','フォックス','5EF8F72C2032BBAADB1A4CBB182963978110695A35B4FB48FE6EC95C046EDCC6','2020-01-29 22:55:38'),(16,'2020-02-05 20:10:22','グラン','A814AD9170F13E7637008A2DAF8AB84FB37FDECFB328768E761AE3F1AF3597CA','2020-02-05 20:10:22');
/*!40000 ALTER TABLE `posters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `score` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `comic_id` int(11) NOT NULL,
  `poster_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2hl024hhrksyr2cgmk2yk7dic` (`comic_id`),
  KEY `FK1vnqv9c1f0cximm65btr22cbd` (`poster_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (3,'・キャラクターや試合展開などページ毎の見せかたが上手い。','2020-01-19 18:16:36',5,'魅せ方がうまい!!','2020-01-29 22:11:19',3,6),(4,'一ページ毎にギャグが複数あり面白い。','2020-01-19 18:57:55',4,'面白い','2020-01-21 01:14:57',5,7),(9,'技がかっこよく、印象に残る。','2020-01-20 23:07:08',4,'技が特徴','2020-01-21 01:18:30',1,7),(13,'設定が本当に細かく練られていて、常に驚きがある','2020-01-28 22:33:56',5,'設定が抜群','2020-01-28 22:33:56',2,6),(14,'世界の人気は流石にすごい。','2020-01-29 22:17:56',4,'世界的人気！','2020-01-29 22:18:06',4,14),(15,'キャラの生き様がかっこいい','2020-01-29 22:21:39',4,'大将軍がかっこいい','2020-01-29 22:54:18',7,14);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-09 23:40:57
