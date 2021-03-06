# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.11)
# Database: moocshit
# Generation Time: 2016-07-31 11:01:45 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INSERT_DATETIME` datetime DEFAULT NULL,
  `UPDATE_DATETIME` datetime DEFAULT NULL,
  `COMMENT` varchar(255) DEFAULT NULL,
  `COMMENT_USER_ID` int(11) DEFAULT '0',
  `SCORE` int(11) DEFAULT '0',
  `IS_ACTIVE` tinyint(4) DEFAULT '1',
  `COURSE_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;

INSERT INTO `comments` (`ID`, `INSERT_DATETIME`, `UPDATE_DATETIME`, `COMMENT`, `COMMENT_USER_ID`, `SCORE`, `IS_ACTIVE`, `COURSE_ID`)
VALUES
	(1,'2016-04-03 16:29:10','2016-04-03 16:29:10','通过这堂课了解了很多技巧',5,10,1,5);

/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `COMMENTS_INSERT` BEFORE INSERT ON `comments` FOR EACH ROW SET NEW.INSERT_DATETIME = NOW(), NEW.UPDATE_DATETIME = NOW() */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `COMMENTS_UPDATE` BEFORE UPDATE ON `comments` FOR EACH ROW SET NEW.UPDATE_DATETIME = NOW() */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INSERT_DATETIME` datetime DEFAULT NULL,
  `UPDATE_DATETIME` datetime DEFAULT NULL,
  `COURSE_NAME` varchar(255) DEFAULT NULL,
  `COURSE_PLAN_ID` int(11) DEFAULT '0',
  `COURSE_VIDEO_KEY` varchar(255) DEFAULT NULL,
  `COURSE_REMARK` varchar(1000) DEFAULT NULL,
  `UPLOAD_USER_ID` int(11) DEFAULT '0',
  `TOTAL_SCORE` int(11) DEFAULT '0',
  `PLAY_TIMES` int(11) DEFAULT '0',
  `COURSE_INDEX` int(11) DEFAULT '1',
  `IS_ACTIVE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;

INSERT INTO `course` (`ID`, `INSERT_DATETIME`, `UPDATE_DATETIME`, `COURSE_NAME`, `COURSE_PLAN_ID`, `COURSE_VIDEO_KEY`, `COURSE_REMARK`, `UPLOAD_USER_ID`, `TOTAL_SCORE`, `PLAY_TIMES`, `COURSE_INDEX`, `IS_ACTIVE`)
VALUES
	(1,'2016-04-03 15:55:26','2016-07-20 15:55:00','历年真题',6,'o_1afdhrhfo1ic11n5s1p2j1hvs10o09.mp4','听力通常也包括2个section每个里面包含有一篇长对话和两篇长演讲,如果遇到加试,会增加一个和前两个section内容结构一样的section(听力和阅读加试不会同时遇到)每个section的答题时间都为20分钟',1,0,35,1,1),
	(2,'2016-04-03 15:56:45','2016-07-20 16:22:29','听力重点',6,'o_1afdhtvas5n21r6f1neg18crahu9.mp4','听力通常也包括2个section每个里面包含有一篇长对话和两篇长演讲,如果遇到加试,会增加一个和前两个section内容结构一样的section(听力和阅读加试不会同时遇到)每个section的答题时间都为20分钟',1,0,47,2,1),
	(3,'2016-04-03 15:57:58','2016-07-20 15:09:43','常用单词',5,'o_1afdi06josqja3crio5cjbdu9.mp4','听力通常也包括2个section每个里面包含有一篇长对话和两篇长演讲,如果遇到加试,会增加一个和前两个section内容结构一样的section(听力和阅读加试不会同时遇到)每个section的答题时间都为20分钟',1,0,3,1,1),
	(4,'2016-04-03 15:59:24','2016-04-03 15:59:24','重点词汇',4,'o_1afdi2oac1jle15skitrdtl16pa9.mp4','听力通常也包括2个section每个里面包含有一篇长对话和两篇长演讲,如果遇到加试,会增加一个和前两个section内容结构一样的section(听力和阅读加试不会同时遇到)每个section的答题时间都为20分钟',1,0,0,1,1),
	(5,'2016-04-03 16:25:25','2016-04-03 16:29:10','听力详解',7,'o_1afdjihrvdsfodbf7o44i1vso9.mp4','听力试题技巧简介',1,10,3,1,1);

/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `COURSE_INSERT` BEFORE INSERT ON `course` FOR EACH ROW SET NEW.INSERT_DATETIME = NOW(), NEW.UPDATE_DATETIME = NOW() */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `COURSE_UPDATE` BEFORE UPDATE ON `course` FOR EACH ROW SET NEW.UPDATE_DATETIME = NOW() */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table course_chosen
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course_chosen`;

CREATE TABLE `course_chosen` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INSERT_DATETIME` datetime DEFAULT NULL,
  `UPDATE_DATETIME` datetime DEFAULT NULL,
  `COURSE_PLAN_ID` int(11) DEFAULT '0',
  `STUDENT_ID` int(11) DEFAULT '0',
  `IS_START` tinyint(4) DEFAULT '0',
  `STUDY_PROGRESS` int(11) DEFAULT '1',
  `DEAD_LINE_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `course_chosen` WRITE;
/*!40000 ALTER TABLE `course_chosen` DISABLE KEYS */;

INSERT INTO `course_chosen` (`ID`, `INSERT_DATETIME`, `UPDATE_DATETIME`, `COURSE_PLAN_ID`, `STUDENT_ID`, `IS_START`, `STUDY_PROGRESS`, `DEAD_LINE_DATE`)
VALUES
	(1,'2016-04-03 16:18:29','2016-07-20 09:33:32',6,2,1,2,'2016-04-30'),
	(2,'2016-04-03 16:26:41','2016-04-03 16:27:13',7,5,1,1,'2016-04-20'),
	(3,'2016-07-20 15:08:54','2016-07-20 15:09:08',5,1,1,1,'2016-07-31'),
	(4,'2016-07-20 15:10:00','2016-07-20 15:10:36',6,1,1,2,'2016-07-31');

/*!40000 ALTER TABLE `course_chosen` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `COURSE_CHOSEN_INSERT` BEFORE INSERT ON `course_chosen` FOR EACH ROW SET NEW.INSERT_DATETIME = NOW(), NEW.UPDATE_DATETIME = NOW() */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `COURSE_CHOSEN_UPDATE` BEFORE UPDATE ON `course_chosen` FOR EACH ROW SET NEW.UPDATE_DATETIME = NOW() */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table course_exercises
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course_exercises`;

CREATE TABLE `course_exercises` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `INSERT_DATETIME` datetime DEFAULT NULL,
  `UPDATE_DATETIME` datetime DEFAULT NULL,
  `COURSE_ID` int(11) DEFAULT '1',
  `EXERCISES_TEXT` varchar(9999) DEFAULT NULL,
  `SCORE` int(11) DEFAULT '0',
  `IS_DONE` int(11) DEFAULT '0',
  `IS_ACTIVE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `course_exercises` WRITE;
/*!40000 ALTER TABLE `course_exercises` DISABLE KEYS */;

INSERT INTO `course_exercises` (`ID`, `INSERT_DATETIME`, `UPDATE_DATETIME`, `COURSE_ID`, `EXERCISES_TEXT`, `SCORE`, `IS_DONE`, `IS_ACTIVE`)
VALUES
	(1,'2016-07-20 14:53:33','2016-07-20 15:07:48',5,'1.你是谁？\n\n2.你要干什么？\n\n3.Who the fuck&apos;re you?',0,0,1),
	(2,'2016-07-20 15:57:32','2016-07-20 15:57:55',1,'1.Fuck you&apos;!!',0,0,1);

/*!40000 ALTER TABLE `course_exercises` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `COURSE_EXERCISES_INSERT` BEFORE INSERT ON `course_exercises` FOR EACH ROW SET NEW.INSERT_DATETIME = NOW(), NEW.UPDATE_DATETIME = NOW() */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `COURSE_EXERCISES_UPDATE` BEFORE UPDATE ON `course_exercises` FOR EACH ROW SET NEW.UPDATE_DATETIME = NOW() */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table course_exercises_result
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course_exercises_result`;

CREATE TABLE `course_exercises_result` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `INSERT_DATETIME` datetime DEFAULT NULL,
  `UPDATE_DATETIME` datetime DEFAULT NULL,
  `COURSE_PLAN_ID` int(11) DEFAULT NULL,
  `COURSE_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `EXERCISES_TEXT` varchar(9999) DEFAULT NULL,
  `SCORE` int(11) DEFAULT '0',
  `IS_DONE` int(11) DEFAULT '0',
  `IS_ACTIVE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `course_exercises_result` WRITE;
/*!40000 ALTER TABLE `course_exercises_result` DISABLE KEYS */;

INSERT INTO `course_exercises_result` (`ID`, `INSERT_DATETIME`, `UPDATE_DATETIME`, `COURSE_PLAN_ID`, `COURSE_ID`, `USER_ID`, `EXERCISES_TEXT`, `SCORE`, `IS_DONE`, `IS_ACTIVE`)
VALUES
	(2,'2016-07-20 16:22:29','2016-07-31 14:51:54',6,1,1,'1.Fuck you&apos;!!\nAnswer: Fuck you too!!!',60,1,1);

/*!40000 ALTER TABLE `course_exercises_result` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `EXERCISE_RESULT_INSERT` BEFORE INSERT ON `course_exercises_result` FOR EACH ROW SET NEW.INSERT_DATETIME = NOW(), NEW.UPDATE_DATETIME = NOW() */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `EXERCISES_RESULT_UPDATE` BEFORE UPDATE ON `course_exercises_result` FOR EACH ROW SET NEW.UPDATE_DATETIME = NOW() */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table course_masterplan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course_masterplan`;

CREATE TABLE `course_masterplan` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INSERT_DATETIME` datetime DEFAULT NULL,
  `UPDATE_DATETIME` datetime DEFAULT NULL,
  `PLAN_NAME` varchar(255) DEFAULT NULL,
  `PLAN_PIC_KEY` varchar(255) DEFAULT NULL,
  `PLAN_DESCRIPTION` varchar(1000) DEFAULT NULL,
  `PLAN_TYPE` varchar(50) DEFAULT NULL,
  `UPLOADER_ID` int(11) DEFAULT '0',
  `IS_ACTIVE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `course_masterplan` WRITE;
/*!40000 ALTER TABLE `course_masterplan` DISABLE KEYS */;

INSERT INTO `course_masterplan` (`ID`, `INSERT_DATETIME`, `UPDATE_DATETIME`, `PLAN_NAME`, `PLAN_PIC_KEY`, `PLAN_DESCRIPTION`, `PLAN_TYPE`, `UPLOADER_ID`, `IS_ACTIVE`)
VALUES
	(4,'2016-04-03 15:53:08','2016-04-03 16:16:19','大学英语','o_1afdho64u1vlr1n9c1q994i12p89.png','系列教材以《综合教程》为核心，每单元围绕一个反映当代生活实际的主题展开','大学英语',1,1),
	(5,'2016-04-03 15:53:27','2016-04-03 16:16:52','大学英语 大一下','o_1afdhpbj31np81088fa01qsn1ktp9.png','《听说教程》、《阅读教程》及《快速阅读教程》,指导学生深入全面地获取并掌握与各主题有关的语言文化知识。','大学英语',1,1),
	(6,'2016-04-03 15:54:07','2016-04-03 16:17:15','托福考试 - 试题精讲','o_1afdhqjmb1fjc1h8i1i9q1d3k1aj99.png','让学生熟悉CET考试的形式与要求。','考试',1,1),
	(7,'2016-04-03 16:24:19','2016-04-03 16:24:19','四级考试 - 真题讲解','o_1afdjhehp158i8b5ov9kqpsvf9.png','历年四级真题详解','考试',1,1);

/*!40000 ALTER TABLE `course_masterplan` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `MASTERPLAN_INSERT` BEFORE INSERT ON `course_masterplan` FOR EACH ROW SET NEW.INSERT_DATETIME = NOW(), NEW.UPDATE_DATETIME = NOW() */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `MASTERPLAN_UPDATE` BEFORE UPDATE ON `course_masterplan` FOR EACH ROW SET NEW.UPDATE_DATETIME = NOW() */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table course_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course_type`;

CREATE TABLE `course_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COURSE_TYPE_NAME` varchar(255) DEFAULT NULL,
  `PARENT_COURSE_TYPE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`ID`, `ROLE_NAME`)
VALUES
	(1,'STUDENT'),
	(2,'TEACHER'),
	(3,'ADMIN'),
	(4,'S_ADMIN');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INSERT_DATETIME` datetime DEFAULT NULL,
  `UPDATE_DATETIME` datetime DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE` varchar(11) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT '0',
  `ACCOUNT` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`ID`, `INSERT_DATETIME`, `UPDATE_DATETIME`, `USERNAME`, `PASSWORD`, `EMAIL`, `PHONE`, `REMARK`, `ROLE_ID`, `ACCOUNT`, `IS_ACTIVE`)
VALUES
	(1,'2016-04-03 15:20:32','2016-07-20 09:15:49','杨老师','666666','yang@163.com','18758296420','大学英语特级讲师，教授。',2,'teacher001',1),
	(2,'2016-04-03 15:22:17','2016-04-03 15:51:59','张自力','666666','zhangzili@163.com','13588166675',NULL,1,'A07060001',1),
	(3,'2016-04-03 15:23:15','2016-04-03 15:52:02','吴志贞','666666','wuzhizhen@163.com','13588166676',NULL,1,'A07060002',1),
	(4,'2016-04-03 15:23:54','2016-04-03 15:52:05','梁志军','666666','liangzhijun@163.com','13888166675',NULL,1,'A07060003',1),
	(5,'2016-04-03 16:26:25','2016-04-03 16:26:25','林子祥','666666','linzixiang@163.com','13512345678',NULL,1,'A07060005',1);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `USERS_INSERT` BEFORE INSERT ON `users` FOR EACH ROW SET NEW.INSERT_DATETIME = NOW(), NEW.UPDATE_DATETIME = NOW() */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `USERS_UPDATE` BEFORE UPDATE ON `users` FOR EACH ROW SET NEW.UPDATE_DATETIME = NOW() */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
