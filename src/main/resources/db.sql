DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INSERT_DATETIME` datetime DEFAULT NULL,
  `UPDATE_DATETIME` datetime DEFAULT NULL,
  `COURSE_NAME` varchar(255) DEFAULT NULL,
  `COURSE_TYPE_ID` int(11) DEFAULT 0,
  `COURSE_VIDEO_KEY` varchar(255) DEFAULT NULL,
  `COURSE_REMARK` varchar(1000) DEFAULT NULL,
  `UPLOAD_USER_ID` int(11) DEFAULT 0,
  `TOTAL_SCORE` int(11) DEFAULT 0,
  `PLAY_TIMES` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TRIGGER `COURSE_INSERT` BEFORE INSERT ON `course` FOR EACH ROW SET NEW.INSERT_DATETIME = NOW(), NEW.UPDATE_DATETIME = NOW();
CREATE TRIGGER `COURSE_UPDATE` BEFORE UPDATE ON `course` FOR EACH ROW SET NEW.UPDATE_DATETIME = NOW();

DROP TABLE IF EXISTS `course_type`;
CREATE TABLE `course_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COURSE_TYPE_NAME` varchar(255) DEFAULT NULL,
  `PARENT_COURSE_TYPE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 2016-3-7
-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'STUDENT');
INSERT INTO `roles` VALUES ('2', 'TEACHER');
INSERT INTO `roles` VALUES ('3', 'ADMIN');
INSERT INTO `roles` VALUES ('4', 'S_ADMIN');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
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
  `ROLE_ID` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
CREATE TRIGGER `USERS_INSERT` BEFORE INSERT ON `users` FOR EACH ROW SET NEW.INSERT_DATETIME = NOW(), NEW.UPDATE_DATETIME = NOW();
CREATE TRIGGER `USERS_UPDATE` BEFORE UPDATE ON `users` FOR EACH ROW SET NEW.UPDATE_DATETIME = NOW();

-- 2016-3-8

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INSERT_DATETIME` datetime DEFAULT NULL,
  `UPDATE_DATETIME` datetime DEFAULT NULL,
  `COMMENT` varchar(255) DEFAULT NULL,
  `COMMENT_USER_ID` int(11) DEFAULT 0,
  `SCORE` int(11) DEFAULT 0,
  `IS_ACTIVE` tinyint(4) DEFAULT 1,
  `COURSE_ID` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
CREATE TRIGGER `COMMENTS_INSERT` BEFORE INSERT ON `comments` FOR EACH ROW SET NEW.INSERT_DATETIME = NOW(), NEW.UPDATE_DATETIME = NOW();
CREATE TRIGGER `COMMENTS_UPDATE` BEFORE UPDATE ON `comments` FOR EACH ROW SET NEW.UPDATE_DATETIME = NOW();

-- 2016-3-10
ALTER TABLE `course`
CHANGE COLUMN `COURSE_TYPE_ID` `COURSE_PLAN_ID`  int(11) NULL DEFAULT 0 AFTER `COURSE_NAME`;

ALTER TABLE `course`
ADD COLUMN `COURSE_INDEX` int NULL DEFAULT 1 AFTER `PLAY_TIMES`;

-- ----------------------------
-- Table structure for `course_masterplan`
-- ----------------------------
DROP TABLE IF EXISTS `course_masterplan`;
CREATE TABLE `course_masterplan` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INSERT_DATETIME` datetime DEFAULT NULL,
  `UPDATE_DATETIME` datetime DEFAULT NULL,
  `PLAN_NAME` varchar(255) DEFAULT NULL,
  `PLAN_PIC_KEY` varchar(255) DEFAULT NULL,
  `PLAN_DESCRIPTION` varchar(1000) DEFAULT NULL,
  `PLAN_TYPE` varchar(50) DEFAULT NULL,
  `UPLOADER_ID` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_masterplan
-- ----------------------------
CREATE TRIGGER `MASTERPLAN_INSERT` BEFORE INSERT ON `course_masterplan` FOR EACH ROW SET NEW.INSERT_DATETIME = NOW(), NEW.UPDATE_DATETIME = NOW();
CREATE TRIGGER `MASTERPLAN_UPDATE` BEFORE UPDATE ON `course_masterplan` FOR EACH ROW SET NEW.UPDATE_DATETIME = NOW();

-- 2016-3-15

-- ----------------------------
-- Table structure for `course_chosen`
-- ----------------------------
DROP TABLE IF EXISTS `course_chosen`;
CREATE TABLE `course_chosen` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INSERT_DATETIME` datetime DEFAULT NULL,
  `UPDATE_DATETIME` datetime DEFAULT NULL,
  `COURSE_PLAN_ID` int(11) DEFAULT 0,
  `STUDENT_ID` int(11) DEFAULT 0,
  `IS_START` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_chosen
-- ----------------------------
CREATE TRIGGER `COURSE_CHOSEN_INSERT` BEFORE INSERT ON `course_chosen` FOR EACH ROW SET NEW.INSERT_DATETIME = NOW(), NEW.UPDATE_DATETIME = NOW();
CREATE TRIGGER `COURSE_CHOSEN_UPDATE` BEFORE UPDATE ON `course_chosen` FOR EACH ROW SET NEW.UPDATE_DATETIME = NOW();

-- 2016-3-16
ALTER TABLE `course_chosen` ADD COLUMN `STUDY_PROGRESS` int NULL DEFAULT 1 AFTER `IS_START`;
ALTER TABLE `course_chosen` ADD COLUMN `DEAD_LINE_DATE` date NULL AFTER `STUDY_PROGRESS`;

-- 2016-3-25
ALTER TABLE `users` ADD COLUMN `ACCOUNT` varchar(255) NULL AFTER `ROLE_ID`, ADD COLUMN `IS_ACTIVE`  int NULL DEFAULT 1 AFTER `ACCOUNT`;
