/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 80015
Source Host           : 127.0.0.1:3306
Source Database       : ro2

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2020-08-03 09:30:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auction
-- ----------------------------
DROP TABLE IF EXISTS `auction`;
CREATE TABLE `auction` (
  `AuctionId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Categorie` tinyint(3) unsigned NOT NULL,
  `Grade` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CharId` int(10) unsigned NOT NULL DEFAULT '0',
  `CharName` varchar(20) NOT NULL,
  `ItemName` varchar(50) NOT NULL,
  `ReqClvl` tinyint(3) unsigned NOT NULL,
  `Price` int(10) unsigned NOT NULL,
  `ItemContent` tinyblob NOT NULL,
  `Expires` datetime NOT NULL,
  PRIMARY KEY (`AuctionId`),
  KEY `Categorie` (`Categorie`),
  KEY `ItemName` (`ItemName`),
  KEY `ReqClvl` (`ReqClvl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auction
-- ----------------------------

-- ----------------------------
-- Table structure for auction_comment
-- ----------------------------
DROP TABLE IF EXISTS `auction_comment`;
CREATE TABLE `auction_comment` (
  `CharId` int(10) unsigned NOT NULL,
  `Comment` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`CharId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auction_comment
-- ----------------------------

-- ----------------------------
-- Table structure for characters
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `CharId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CharName` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CharFace` varbinary(11) DEFAULT NULL,
  `UserId` int(10) unsigned NOT NULL DEFAULT '0',
  `Cexp` int(10) unsigned NOT NULL DEFAULT '1',
  `Jexp` int(10) unsigned NOT NULL DEFAULT '1',
  `Job` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Map` tinyint(3) unsigned NOT NULL DEFAULT '11',
  `Gender` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `HP` mediumint(8) unsigned NOT NULL DEFAULT '200',
  `SP` mediumint(8) unsigned NOT NULL DEFAULT '210',
  `LP` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `LC` tinyint(3) unsigned NOT NULL DEFAULT '45',
  `Position.x` float NOT NULL DEFAULT '-17208',
  `Position.y` float NOT NULL DEFAULT '9944',
  `Position.z` float NOT NULL DEFAULT '109',
  `Saveposition.x` float NOT NULL DEFAULT '-6558.26',
  `Saveposition.y` float NOT NULL DEFAULT '14842.2',
  `Saveposition.z` float NOT NULL DEFAULT '4322.33',
  `Saveposition.map` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `Stats.Str` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Stats.Dex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Stats.Int` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Stats.Con` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Stats.Luc` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Stats.Pending` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Rufi` int(10) unsigned NOT NULL DEFAULT '0',
  `UppercasedCharName` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`CharId`,`UserId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of characters
-- ----------------------------

-- ----------------------------
-- Table structure for list_acl
-- ----------------------------
DROP TABLE IF EXISTS `list_acl`;
CREATE TABLE `list_acl` (
  `RuleId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique id used for delete statements',
  `FilterIp` bigint(20) unsigned NOT NULL COMMENT 'Adress to match',
  `Mask` bigint(20) unsigned NOT NULL COMMENT 'Mask of bits to check',
  `Operation` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 For deny and 1 for allow',
  PRIMARY KEY (`RuleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_acl
-- ----------------------------

-- ----------------------------
-- Table structure for list_additions
-- ----------------------------
DROP TABLE IF EXISTS `list_additions`;
CREATE TABLE `list_additions` (
  `CharId` int(10) unsigned NOT NULL,
  `Additions` mediumblob,
  PRIMARY KEY (`CharId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_additions
-- ----------------------------

-- ----------------------------
-- Table structure for list_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `list_blacklist`;
CREATE TABLE `list_blacklist` (
  `CharId` int(10) unsigned NOT NULL DEFAULT '0',
  `FriendName` varchar(32) NOT NULL,
  `Reason` tinyint(3) unsigned NOT NULL,
  KEY `CharId` (`CharId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for list_discoveredmaps
-- ----------------------------
DROP TABLE IF EXISTS `list_discoveredmaps`;
CREATE TABLE `list_discoveredmaps` (
  `CharId` int(10) unsigned NOT NULL,
  `MapId` tinyint(3) unsigned NOT NULL,
  `Value` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`CharId`,`MapId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_discoveredmaps
-- ----------------------------

-- ----------------------------
-- Table structure for list_equipment
-- ----------------------------
DROP TABLE IF EXISTS `list_equipment`;
CREATE TABLE `list_equipment` (
  `CharId` int(10) unsigned NOT NULL,
  `Equipement` blob,
  UNIQUE KEY `CharId` (`CharId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_equipment
-- ----------------------------

-- ----------------------------
-- Table structure for list_eventparticipants
-- ----------------------------
DROP TABLE IF EXISTS `list_eventparticipants`;
CREATE TABLE `list_eventparticipants` (
  `EventId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CharId` int(10) unsigned DEFAULT NULL,
  `CharName` varchar(128) NOT NULL,
  PRIMARY KEY (`EventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_eventparticipants
-- ----------------------------

-- ----------------------------
-- Table structure for list_eventrewards
-- ----------------------------
DROP TABLE IF EXISTS `list_eventrewards`;
CREATE TABLE `list_eventrewards` (
  `RewardId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CharId` int(10) unsigned NOT NULL,
  `ItemId` int(10) unsigned NOT NULL,
  `ItemCount` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`RewardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_eventrewards
-- ----------------------------

-- ----------------------------
-- Table structure for list_friends
-- ----------------------------
DROP TABLE IF EXISTS `list_friends`;
CREATE TABLE `list_friends` (
  `CharId` int(10) unsigned NOT NULL DEFAULT '0',
  `FriendName` varchar(32) NOT NULL,
  KEY `CharId` (`CharId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_friends
-- ----------------------------

-- ----------------------------
-- Table structure for list_inventory
-- ----------------------------
DROP TABLE IF EXISTS `list_inventory`;
CREATE TABLE `list_inventory` (
  `CharId` int(10) unsigned NOT NULL,
  `ContainerMaxStorage` tinyint(3) unsigned NOT NULL,
  `Container` blob,
  PRIMARY KEY (`CharId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_inventory
-- ----------------------------

-- ----------------------------
-- Table structure for list_joblinformation
-- ----------------------------
DROP TABLE IF EXISTS `list_joblinformation`;
CREATE TABLE `list_joblinformation` (
  `CharId` int(10) unsigned NOT NULL DEFAULT '0',
  `JobInformation` tinyblob,
  PRIMARY KEY (`CharId`),
  KEY `CharId` (`CharId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_joblinformation
-- ----------------------------

-- ----------------------------
-- Table structure for list_learnedskills
-- ----------------------------
DROP TABLE IF EXISTS `list_learnedskills`;
CREATE TABLE `list_learnedskills` (
  `CharId` int(10) unsigned NOT NULL DEFAULT '0',
  `SkillId` int(10) unsigned NOT NULL DEFAULT '0',
  `SkillExp` int(10) unsigned NOT NULL DEFAULT '0',
  `Job` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `CharId` (`CharId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_learnedskills
-- ----------------------------

-- ----------------------------
-- Table structure for list_maildata
-- ----------------------------
DROP TABLE IF EXISTS `list_maildata`;
CREATE TABLE `list_maildata` (
  `MailId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Sender` varchar(32) NOT NULL,
  `Receiptent` varchar(32) NOT NULL,
  `Date` datetime NOT NULL,
  `IsRead` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `IsChecked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Topic` varchar(128) DEFAULT NULL,
  `Message` text,
  `Attachment` tinyblob,
  `Zeny` int(10) unsigned NOT NULL DEFAULT '0',
  `DateRead` datetime DEFAULT '0000-00-00 00:00:00',
  `IsOutbox` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `IsInbox` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `IsPending` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`MailId`),
  KEY `Sender` (`Sender`),
  KEY `Reciever` (`Receiptent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_maildata
-- ----------------------------

-- ----------------------------
-- Table structure for list_questhistory
-- ----------------------------
DROP TABLE IF EXISTS `list_questhistory`;
CREATE TABLE `list_questhistory` (
  `CharId` int(10) unsigned NOT NULL,
  `QuestId` int(10) unsigned NOT NULL,
  KEY `CharId` (`CharId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_questhistory
-- ----------------------------

-- ----------------------------
-- Table structure for list_quests
-- ----------------------------
DROP TABLE IF EXISTS `list_quests`;
CREATE TABLE `list_quests` (
  `QuestId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Region` tinyint(3) unsigned NOT NULL,
  `Req_Clvl` tinyint(3) unsigned NOT NULL,
  `Req_Jlvl` tinyint(3) unsigned NOT NULL,
  `Req_Quest` int(10) unsigned NOT NULL,
  `QuestType` tinyint(3) unsigned NOT NULL,
  `NPC` int(10) unsigned NOT NULL,
  PRIMARY KEY (`QuestId`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_quests
-- ----------------------------
INSERT INTO `list_quests` VALUES ('1', '2', '2', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('2', '2', '4', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('3', '2', '11', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('4', '2', '14', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('5', '2', '2', '0', '0', '2', '1003');
INSERT INTO `list_quests` VALUES ('6', '2', '6', '0', '0', '2', '1003');
INSERT INTO `list_quests` VALUES ('8', '2', '8', '0', '0', '2', '1003');
INSERT INTO `list_quests` VALUES ('9', '2', '6', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('10', '2', '6', '0', '0', '2', '1003');
INSERT INTO `list_quests` VALUES ('11', '2', '7', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('12', '2', '3', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('13', '2', '5', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('14', '2', '8', '0', '0', '2', '1004');
INSERT INTO `list_quests` VALUES ('15', '2', '11', '0', '0', '2', '1004');
INSERT INTO `list_quests` VALUES ('16', '2', '11', '0', '16', '1', '1125');
INSERT INTO `list_quests` VALUES ('17', '2', '12', '0', '0', '2', '1004');
INSERT INTO `list_quests` VALUES ('19', '2', '8', '0', '0', '2', '1002');
INSERT INTO `list_quests` VALUES ('20', '2', '5', '0', '0', '2', '1002');
INSERT INTO `list_quests` VALUES ('22', '2', '11', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('23', '2', '9', '0', '0', '2', '1002');
INSERT INTO `list_quests` VALUES ('24', '2', '3', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('25', '2', '4', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('26', '2', '5', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('27', '2', '7', '0', '0', '2', '1005');
INSERT INTO `list_quests` VALUES ('28', '2', '12', '0', '0', '2', '1005');
INSERT INTO `list_quests` VALUES ('29', '2', '3', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('30', '2', '4', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('31', '2', '4', '0', '0', '2', '1001');
INSERT INTO `list_quests` VALUES ('32', '2', '11', '0', '0', '2', '1001');
INSERT INTO `list_quests` VALUES ('34', '2', '12', '0', '0', '2', '1001');
INSERT INTO `list_quests` VALUES ('35', '2', '4', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('36', '2', '7', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('38', '2', '9', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('39', '2', '8', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('40', '2', '10', '0', '0', '2', '1003');
INSERT INTO `list_quests` VALUES ('42', '2', '10', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('44', '2', '13', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('46', '2', '13', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('47', '2', '14', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('123', '0', '7', '0', '0', '2', '1001');
INSERT INTO `list_quests` VALUES ('124', '0', '8', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('125', '0', '8', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('126', '0', '9', '0', '0', '2', '1143');
INSERT INTO `list_quests` VALUES ('127', '0', '9', '0', '0', '2', '1143');
INSERT INTO `list_quests` VALUES ('128', '0', '9', '0', '0', '2', '1143');
INSERT INTO `list_quests` VALUES ('129', '0', '9', '0', '0', '2', '1003');
INSERT INTO `list_quests` VALUES ('130', '0', '10', '0', '0', '2', '1003');
INSERT INTO `list_quests` VALUES ('131', '0', '11', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('132', '0', '6', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('133', '0', '12', '0', '0', '2', '1066');
INSERT INTO `list_quests` VALUES ('134', '0', '9', '0', '0', '2', '1001');
INSERT INTO `list_quests` VALUES ('135', '0', '10', '0', '0', '2', '1143');
INSERT INTO `list_quests` VALUES ('136', '0', '13', '0', '0', '2', '1004');
INSERT INTO `list_quests` VALUES ('137', '0', '13', '0', '137', '2', '1004');
INSERT INTO `list_quests` VALUES ('138', '0', '14', '0', '0', '2', '1004');
INSERT INTO `list_quests` VALUES ('139', '0', '2', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('140', '0', '9', '0', '0', '2', '1002');
INSERT INTO `list_quests` VALUES ('141', '0', '7', '0', '0', '2', '1001');
INSERT INTO `list_quests` VALUES ('142', '0', '7', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('143', '0', '8', '0', '0', '2', '1000');
INSERT INTO `list_quests` VALUES ('144', '0', '8', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('145', '0', '8', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('146', '0', '9', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('147', '0', '8', '0', '147', '1', '1125');
INSERT INTO `list_quests` VALUES ('148', '0', '7', '0', '148', '1', '1125');
INSERT INTO `list_quests` VALUES ('149', '0', '7', '0', '149', '1', '1125');
INSERT INTO `list_quests` VALUES ('150', '0', '10', '0', '150', '1', '1125');
INSERT INTO `list_quests` VALUES ('151', '0', '9', '0', '151', '1', '1125');
INSERT INTO `list_quests` VALUES ('156', '0', '12', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('157', '0', '12', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('158', '0', '12', '0', '158', '1', '1127');
INSERT INTO `list_quests` VALUES ('159', '0', '12', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('160', '0', '12', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('161', '0', '12', '0', '0', '2', '1011');
INSERT INTO `list_quests` VALUES ('162', '0', '13', '0', '0', '2', '1068');
INSERT INTO `list_quests` VALUES ('163', '0', '13', '0', '163', '1', '1127');
INSERT INTO `list_quests` VALUES ('164', '0', '13', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('165', '0', '12', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('166', '0', '12', '0', '166', '1', '1127');
INSERT INTO `list_quests` VALUES ('167', '0', '12', '0', '167', '1', '1127');
INSERT INTO `list_quests` VALUES ('168', '0', '13', '0', '0', '2', '1011');
INSERT INTO `list_quests` VALUES ('169', '0', '13', '0', '169', '1', '1127');
INSERT INTO `list_quests` VALUES ('170', '0', '13', '0', '170', '1', '1127');
INSERT INTO `list_quests` VALUES ('171', '0', '13', '0', '171', '1', '1127');
INSERT INTO `list_quests` VALUES ('172', '0', '13', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('173', '0', '16', '0', '179', '1', '1127');
INSERT INTO `list_quests` VALUES ('174', '0', '16', '0', '174', '1', '1127');
INSERT INTO `list_quests` VALUES ('175', '0', '16', '0', '175', '1', '1127');
INSERT INTO `list_quests` VALUES ('176', '0', '17', '0', '176', '1', '1127');
INSERT INTO `list_quests` VALUES ('177', '0', '17', '0', '177', '1', '1127');
INSERT INTO `list_quests` VALUES ('178', '0', '17', '0', '178', '1', '1127');
INSERT INTO `list_quests` VALUES ('180', '0', '12', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('181', '0', '12', '0', '181', '1', '1127');
INSERT INTO `list_quests` VALUES ('182', '0', '13', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('183', '0', '13', '0', '183', '1', '1127');
INSERT INTO `list_quests` VALUES ('191', '0', '13', '0', '0', '2', '1010');
INSERT INTO `list_quests` VALUES ('192', '0', '13', '0', '192', '1', '1127');
INSERT INTO `list_quests` VALUES ('193', '0', '13', '0', '193', '1', '1127');
INSERT INTO `list_quests` VALUES ('194', '0', '13', '0', '194', '1', '1127');
INSERT INTO `list_quests` VALUES ('195', '0', '14', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('196', '0', '14', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('197', '0', '16', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('198', '0', '16', '0', '198', '1', '1127');
INSERT INTO `list_quests` VALUES ('199', '0', '16', '0', '199', '1', '1127');
INSERT INTO `list_quests` VALUES ('200', '0', '16', '0', '200', '1', '1127');
INSERT INTO `list_quests` VALUES ('201', '0', '16', '0', '201', '1', '1127');
INSERT INTO `list_quests` VALUES ('202', '0', '16', '0', '202', '1', '1127');
INSERT INTO `list_quests` VALUES ('203', '0', '17', '0', '203', '1', '1127');
INSERT INTO `list_quests` VALUES ('204', '0', '17', '0', '204', '1', '1127');
INSERT INTO `list_quests` VALUES ('205', '0', '17', '0', '205', '1', '1127');
INSERT INTO `list_quests` VALUES ('206', '0', '18', '0', '206', '1', '1127');
INSERT INTO `list_quests` VALUES ('207', '0', '18', '0', '207', '1', '1127');
INSERT INTO `list_quests` VALUES ('208', '0', '18', '0', '208', '1', '1127');
INSERT INTO `list_quests` VALUES ('209', '0', '14', '0', '0', '2', '1011');
INSERT INTO `list_quests` VALUES ('210', '0', '14', '0', '210', '1', '1127');
INSERT INTO `list_quests` VALUES ('211', '0', '14', '0', '211', '1', '1127');
INSERT INTO `list_quests` VALUES ('212', '0', '14', '0', '212', '1', '1127');
INSERT INTO `list_quests` VALUES ('213', '0', '14', '0', '213', '1', '1127');
INSERT INTO `list_quests` VALUES ('214', '0', '14', '0', '214', '1', '1127');
INSERT INTO `list_quests` VALUES ('215', '0', '14', '0', '215', '1', '1127');
INSERT INTO `list_quests` VALUES ('216', '0', '14', '0', '216', '1', '1127');
INSERT INTO `list_quests` VALUES ('217', '0', '14', '0', '217', '1', '1127');
INSERT INTO `list_quests` VALUES ('218', '0', '14', '0', '218', '1', '1127');
INSERT INTO `list_quests` VALUES ('219', '0', '14', '0', '219', '1', '1127');
INSERT INTO `list_quests` VALUES ('220', '0', '14', '0', '220', '1', '1127');
INSERT INTO `list_quests` VALUES ('221', '0', '14', '0', '221', '1', '1127');
INSERT INTO `list_quests` VALUES ('222', '0', '14', '0', '222', '1', '1127');
INSERT INTO `list_quests` VALUES ('223', '0', '14', '0', '223', '1', '1127');
INSERT INTO `list_quests` VALUES ('224', '0', '14', '0', '224', '1', '1127');
INSERT INTO `list_quests` VALUES ('225', '0', '14', '0', '225', '1', '1127');
INSERT INTO `list_quests` VALUES ('226', '0', '14', '0', '226', '1', '1127');
INSERT INTO `list_quests` VALUES ('227', '0', '13', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('228', '0', '13', '0', '228', '1', '1127');
INSERT INTO `list_quests` VALUES ('229', '0', '13', '0', '229', '1', '1127');
INSERT INTO `list_quests` VALUES ('230', '0', '15', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('231', '0', '15', '0', '231', '1', '1127');
INSERT INTO `list_quests` VALUES ('232', '0', '15', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('233', '0', '15', '0', '233', '1', '1127');
INSERT INTO `list_quests` VALUES ('234', '0', '15', '0', '234', '1', '1127');
INSERT INTO `list_quests` VALUES ('235', '0', '20', '0', '0', '2', '1006');
INSERT INTO `list_quests` VALUES ('236', '0', '20', '0', '236', '1', '1127');
INSERT INTO `list_quests` VALUES ('237', '0', '20', '0', '237', '1', '1127');
INSERT INTO `list_quests` VALUES ('238', '0', '20', '0', '238', '1', '1127');
INSERT INTO `list_quests` VALUES ('239', '0', '20', '0', '239', '1', '1127');
INSERT INTO `list_quests` VALUES ('240', '0', '20', '0', '240', '1', '1127');
INSERT INTO `list_quests` VALUES ('241', '0', '17', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('242', '0', '17', '0', '0', '1', '4027');
INSERT INTO `list_quests` VALUES ('243', '0', '17', '0', '243', '1', '1127');
INSERT INTO `list_quests` VALUES ('244', '0', '17', '0', '244', '1', '1127');
INSERT INTO `list_quests` VALUES ('245', '0', '18', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('246', '0', '18', '0', '246', '1', '1127');
INSERT INTO `list_quests` VALUES ('247', '0', '18', '0', '247', '1', '1127');
INSERT INTO `list_quests` VALUES ('248', '0', '19', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('249', '0', '19', '0', '249', '1', '1127');
INSERT INTO `list_quests` VALUES ('250', '0', '20', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('251', '0', '20', '0', '251', '1', '1127');
INSERT INTO `list_quests` VALUES ('252', '0', '20', '0', '252', '1', '1127');
INSERT INTO `list_quests` VALUES ('253', '0', '18', '0', '0', '2', '1007');
INSERT INTO `list_quests` VALUES ('254', '0', '18', '0', '254', '1', '1127');
INSERT INTO `list_quests` VALUES ('255', '0', '19', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('256', '0', '19', '0', '256', '1', '1127');
INSERT INTO `list_quests` VALUES ('257', '0', '19', '0', '0', '2', '1007');
INSERT INTO `list_quests` VALUES ('258', '0', '19', '0', '258', '1', '1127');
INSERT INTO `list_quests` VALUES ('259', '0', '19', '0', '259', '1', '1127');
INSERT INTO `list_quests` VALUES ('260', '0', '20', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('261', '0', '20', '0', '261', '1', '1127');
INSERT INTO `list_quests` VALUES ('262', '0', '20', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('263', '0', '20', '0', '263', '1', '1127');
INSERT INTO `list_quests` VALUES ('264', '0', '17', '0', '0', '2', '1007');
INSERT INTO `list_quests` VALUES ('265', '0', '17', '0', '265', '1', '1127');
INSERT INTO `list_quests` VALUES ('266', '0', '17', '0', '266', '1', '1127');
INSERT INTO `list_quests` VALUES ('267', '0', '17', '0', '267', '1', '1127');
INSERT INTO `list_quests` VALUES ('268', '0', '17', '0', '268', '1', '1127');
INSERT INTO `list_quests` VALUES ('269', '0', '18', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('270', '0', '18', '0', '0', '2', '1008');
INSERT INTO `list_quests` VALUES ('271', '0', '18', '0', '271', '1', '1127');
INSERT INTO `list_quests` VALUES ('272', '0', '18', '0', '272', '1', '1127');
INSERT INTO `list_quests` VALUES ('273', '0', '18', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('274', '0', '18', '0', '274', '1', '1127');
INSERT INTO `list_quests` VALUES ('275', '0', '18', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('276', '0', '19', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('277', '0', '19', '0', '277', '1', '1127');
INSERT INTO `list_quests` VALUES ('278', '0', '20', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('279', '0', '17', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('280', '0', '19', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('281', '0', '19', '0', '281', '1', '1127');
INSERT INTO `list_quests` VALUES ('282', '0', '20', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('283', '0', '20', '0', '283', '1', '1127');
INSERT INTO `list_quests` VALUES ('284', '0', '20', '0', '284', '1', '1127');
INSERT INTO `list_quests` VALUES ('285', '0', '20', '0', '0', '2', '1006');
INSERT INTO `list_quests` VALUES ('286', '0', '20', '0', '286', '1', '1127');
INSERT INTO `list_quests` VALUES ('287', '0', '20', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('288', '0', '21', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('289', '0', '21', '0', '289', '1', '1127');
INSERT INTO `list_quests` VALUES ('290', '0', '21', '0', '290', '1', '1127');
INSERT INTO `list_quests` VALUES ('291', '0', '21', '0', '291', '1', '1127');
INSERT INTO `list_quests` VALUES ('292', '0', '22', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('293', '0', '22', '0', '293', '1', '1127');
INSERT INTO `list_quests` VALUES ('294', '0', '22', '0', '294', '1', '1127');
INSERT INTO `list_quests` VALUES ('295', '0', '22', '0', '295', '1', '1127');
INSERT INTO `list_quests` VALUES ('296', '0', '23', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('297', '0', '24', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('298', '0', '19', '0', '0', '2', '1010');
INSERT INTO `list_quests` VALUES ('299', '0', '19', '0', '299', '1', '1127');
INSERT INTO `list_quests` VALUES ('300', '0', '20', '0', '301', '1', '1127');
INSERT INTO `list_quests` VALUES ('302', '0', '21', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('303', '0', '21', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('304', '0', '21', '0', '304', '1', '1127');
INSERT INTO `list_quests` VALUES ('305', '0', '21', '0', '305', '1', '1127');
INSERT INTO `list_quests` VALUES ('306', '0', '21', '0', '306', '1', '1127');
INSERT INTO `list_quests` VALUES ('307', '0', '20', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('308', '0', '20', '0', '308', '1', '1127');
INSERT INTO `list_quests` VALUES ('309', '0', '20', '0', '309', '1', '1127');
INSERT INTO `list_quests` VALUES ('310', '0', '20', '0', '310', '1', '1127');
INSERT INTO `list_quests` VALUES ('311', '0', '20', '0', '311', '1', '1127');
INSERT INTO `list_quests` VALUES ('312', '0', '24', '0', '0', '2', '1011');
INSERT INTO `list_quests` VALUES ('313', '0', '24', '0', '313', '1', '1127');
INSERT INTO `list_quests` VALUES ('314', '0', '24', '0', '314', '1', '1127');
INSERT INTO `list_quests` VALUES ('315', '0', '20', '0', '0', '2', '1013');
INSERT INTO `list_quests` VALUES ('316', '0', '20', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('317', '0', '21', '0', '0', '2', '1011');
INSERT INTO `list_quests` VALUES ('318', '0', '22', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('319', '0', '22', '0', '319', '1', '1127');
INSERT INTO `list_quests` VALUES ('320', '0', '20', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('321', '0', '20', '0', '321', '1', '1127');
INSERT INTO `list_quests` VALUES ('322', '0', '21', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('323', '0', '4', '0', '323', '1', '1125');
INSERT INTO `list_quests` VALUES ('325', '0', '7', '0', '0', '0', '0');
INSERT INTO `list_quests` VALUES ('326', '0', '8', '0', '0', '2', '1059');
INSERT INTO `list_quests` VALUES ('327', '0', '6', '0', '327', '1', '1125');
INSERT INTO `list_quests` VALUES ('328', '0', '6', '0', '328', '1', '1125');
INSERT INTO `list_quests` VALUES ('330', '0', '5', '0', '330', '1', '1125');
INSERT INTO `list_quests` VALUES ('331', '0', '5', '0', '331', '1', '1125');
INSERT INTO `list_quests` VALUES ('332', '0', '11', '0', '332', '1', '1125');
INSERT INTO `list_quests` VALUES ('333', '0', '3', '0', '333', '1', '1125');
INSERT INTO `list_quests` VALUES ('334', '0', '4', '0', '334', '1', '1125');
INSERT INTO `list_quests` VALUES ('335', '0', '12', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('336', '0', '7', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('337', '0', '9', '0', '337', '1', '1125');
INSERT INTO `list_quests` VALUES ('338', '0', '8', '0', '338', '1', '1125');
INSERT INTO `list_quests` VALUES ('339', '0', '10', '0', '339', '1', '1125');
INSERT INTO `list_quests` VALUES ('341', '0', '14', '0', '341', '1', '1125');
INSERT INTO `list_quests` VALUES ('342', '0', '7', '0', '342', '1', '1125');
INSERT INTO `list_quests` VALUES ('343', '0', '9', '0', '343', '1', '1125');
INSERT INTO `list_quests` VALUES ('344', '0', '9', '0', '344', '1', '1125');
INSERT INTO `list_quests` VALUES ('345', '0', '9', '0', '345', '1', '1125');
INSERT INTO `list_quests` VALUES ('346', '0', '12', '0', '346', '1', '1125');
INSERT INTO `list_quests` VALUES ('347', '0', '12', '0', '347', '1', '1125');
INSERT INTO `list_quests` VALUES ('348', '0', '7', '0', '348', '1', '1125');
INSERT INTO `list_quests` VALUES ('349', '0', '7', '0', '349', '1', '1125');
INSERT INTO `list_quests` VALUES ('350', '0', '8', '0', '350', '1', '1125');
INSERT INTO `list_quests` VALUES ('351', '0', '8', '0', '351', '1', '1125');
INSERT INTO `list_quests` VALUES ('352', '0', '8', '0', '352', '1', '1125');
INSERT INTO `list_quests` VALUES ('353', '0', '25', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('354', '0', '31', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('355', '0', '26', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('356', '0', '27', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('357', '0', '27', '0', '357', '1', '1131');
INSERT INTO `list_quests` VALUES ('358', '0', '29', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('359', '0', '29', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('360', '0', '29', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('361', '0', '29', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('362', '0', '30', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('363', '0', '33', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('365', '0', '27', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('366', '0', '29', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('367', '0', '28', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('368', '0', '25', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('369', '0', '25', '0', '369', '1', '1131');
INSERT INTO `list_quests` VALUES ('370', '0', '25', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('374', '0', '25', '0', '0', '2', '1135');
INSERT INTO `list_quests` VALUES ('375', '0', '29', '0', '0', '2', '1022');
INSERT INTO `list_quests` VALUES ('376', '0', '29', '0', '0', '2', '1022');
INSERT INTO `list_quests` VALUES ('377', '0', '31', '0', '0', '2', '1026');
INSERT INTO `list_quests` VALUES ('378', '0', '25', '0', '0', '2', '1188');
INSERT INTO `list_quests` VALUES ('379', '0', '25', '0', '379', '1', '1131');
INSERT INTO `list_quests` VALUES ('380', '0', '18', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('381', '0', '18', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('382', '0', '19', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('383', '0', '19', '0', '383', '1', '1127');
INSERT INTO `list_quests` VALUES ('384', '0', '19', '0', '384', '1', '1127');
INSERT INTO `list_quests` VALUES ('385', '0', '19', '0', '0', '2', '1223');
INSERT INTO `list_quests` VALUES ('386', '0', '20', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('387', '0', '20', '0', '387', '1', '1127');
INSERT INTO `list_quests` VALUES ('388', '0', '20', '0', '388', '1', '1127');
INSERT INTO `list_quests` VALUES ('389', '0', '21', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('390', '0', '21', '0', '0', '2', '1010');
INSERT INTO `list_quests` VALUES ('391', '0', '22', '0', '391', '1', '1127');
INSERT INTO `list_quests` VALUES ('392', '0', '23', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('393', '0', '23', '0', '0', '2', '1223');
INSERT INTO `list_quests` VALUES ('394', '0', '24', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('395', '0', '25', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('396', '4', '1', '0', '0', '1', '1143');
INSERT INTO `list_quests` VALUES ('397', '1', '1', '0', '0', '2', '1139');
INSERT INTO `list_quests` VALUES ('398', '1', '1', '0', '0', '1', '1142');
INSERT INTO `list_quests` VALUES ('399', '1', '1', '0', '399', '1', '1142');
INSERT INTO `list_quests` VALUES ('400', '1', '1', '0', '399', '1', '1142');
INSERT INTO `list_quests` VALUES ('401', '1', '1', '0', '401', '1', '1142');
INSERT INTO `list_quests` VALUES ('402', '1', '1', '0', '401', '1', '1142');
INSERT INTO `list_quests` VALUES ('403', '1', '1', '0', '0', '2', '1149');
INSERT INTO `list_quests` VALUES ('404', '0', '14', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('405', '0', '10', '0', '0', '2', '1066');
INSERT INTO `list_quests` VALUES ('406', '0', '1', '0', '406', '1', '1142');
INSERT INTO `list_quests` VALUES ('407', '0', '4', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('408', '0', '6', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('409', '0', '5', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('410', '0', '7', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('411', '0', '8', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('412', '0', '7', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('413', '0', '9', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('414', '0', '10', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('415', '0', '10', '0', '0', '2', '1125');
INSERT INTO `list_quests` VALUES ('416', '0', '11', '0', '0', '1', '1125');
INSERT INTO `list_quests` VALUES ('417', '0', '25', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('418', '0', '26', '0', '0', '2', '1182');
INSERT INTO `list_quests` VALUES ('419', '0', '26', '0', '419', '1', '1131');
INSERT INTO `list_quests` VALUES ('420', '0', '27', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('421', '0', '30', '0', '0', '2', '1121');
INSERT INTO `list_quests` VALUES ('422', '0', '30', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('423', '0', '30', '0', '423', '1', '1131');
INSERT INTO `list_quests` VALUES ('424', '0', '30', '0', '0', '2', '1053');
INSERT INTO `list_quests` VALUES ('425', '0', '30', '0', '0', '2', '1053');
INSERT INTO `list_quests` VALUES ('426', '0', '31', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('427', '0', '31', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('428', '0', '31', '0', '428', '1', '1131');
INSERT INTO `list_quests` VALUES ('429', '0', '31', '0', '0', '2', '1123');
INSERT INTO `list_quests` VALUES ('430', '0', '31', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('431', '0', '31', '0', '0', '2', '1024');
INSERT INTO `list_quests` VALUES ('432', '0', '32', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('433', '0', '32', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('434', '0', '32', '0', '434', '1', '1131');
INSERT INTO `list_quests` VALUES ('435', '0', '33', '0', '0', '2', '1024');
INSERT INTO `list_quests` VALUES ('436', '0', '34', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('437', '0', '15', '0', '0', '2', '1070');
INSERT INTO `list_quests` VALUES ('438', '0', '15', '0', '0', '2', '1070');
INSERT INTO `list_quests` VALUES ('439', '0', '22', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('440', '0', '25', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('441', '0', '25', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('442', '0', '18', '0', '0', '2', '1158');
INSERT INTO `list_quests` VALUES ('443', '0', '19', '0', '0', '2', '1161');
INSERT INTO `list_quests` VALUES ('444', '0', '21', '0', '0', '1', '1127');
INSERT INTO `list_quests` VALUES ('445', '0', '20', '0', '0', '2', '1073');
INSERT INTO `list_quests` VALUES ('446', '0', '20', '0', '446', '1', '1127');
INSERT INTO `list_quests` VALUES ('447', '0', '26', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('448', '0', '26', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('449', '0', '26', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('450', '0', '25', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('451', '0', '25', '0', '451', '1', '1131');
INSERT INTO `list_quests` VALUES ('452', '0', '25', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('453', '0', '26', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('454', '0', '26', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('455', '0', '26', '0', '455', '1', '1131');
INSERT INTO `list_quests` VALUES ('456', '0', '30', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('457', '0', '30', '0', '457', '1', '1131');
INSERT INTO `list_quests` VALUES ('458', '0', '25', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('459', '0', '25', '0', '459', '1', '1131');
INSERT INTO `list_quests` VALUES ('460', '0', '28', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('461', '0', '28', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('462', '0', '28', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('463', '0', '26', '0', '464', '2', '1182');
INSERT INTO `list_quests` VALUES ('464', '0', '26', '0', '464', '1', '1131');
INSERT INTO `list_quests` VALUES ('465', '0', '27', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('466', '0', '28', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('467', '0', '28', '0', '0', '2', '1022');
INSERT INTO `list_quests` VALUES ('468', '0', '28', '0', '468', '1', '1131');
INSERT INTO `list_quests` VALUES ('469', '0', '29', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('470', '0', '29', '0', '470', '1', '1131');
INSERT INTO `list_quests` VALUES ('471', '0', '30', '0', '0', '2', '1187');
INSERT INTO `list_quests` VALUES ('472', '0', '30', '0', '472', '1', '1131');
INSERT INTO `list_quests` VALUES ('473', '0', '30', '0', '473', '1', '1131');
INSERT INTO `list_quests` VALUES ('474', '0', '30', '0', '474', '1', '1131');
INSERT INTO `list_quests` VALUES ('475', '0', '32', '0', '0', '2', '1135');
INSERT INTO `list_quests` VALUES ('476', '0', '25', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('477', '0', '25', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('478', '0', '25', '0', '478', '1', '1131');
INSERT INTO `list_quests` VALUES ('479', '0', '33', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('480', '0', '33', '0', '480', '1', '1131');
INSERT INTO `list_quests` VALUES ('481', '0', '35', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('482', '0', '35', '0', '482', '1', '1131');
INSERT INTO `list_quests` VALUES ('483', '0', '35', '0', '483', '1', '1131');
INSERT INTO `list_quests` VALUES ('484', '0', '35', '0', '484', '1', '1131');
INSERT INTO `list_quests` VALUES ('485', '0', '35', '0', '485', '1', '1131');
INSERT INTO `list_quests` VALUES ('486', '0', '36', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('487', '0', '36', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('488', '0', '26', '0', '0', '2', '1025');
INSERT INTO `list_quests` VALUES ('489', '0', '26', '0', '489', '1', '1131');
INSERT INTO `list_quests` VALUES ('491', '0', '31', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('492', '0', '29', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('493', '0', '29', '0', '493', '1', '1131');
INSERT INTO `list_quests` VALUES ('494', '0', '30', '0', '0', '1', '1131');
INSERT INTO `list_quests` VALUES ('495', '0', '30', '0', '495', '1', '1131');
INSERT INTO `list_quests` VALUES ('496', '0', '32', '0', '0', '2', '1190');
INSERT INTO `list_quests` VALUES ('497', '0', '32', '0', '497', '1', '1131');
INSERT INTO `list_quests` VALUES ('498', '0', '32', '0', '498', '1', '1131');
INSERT INTO `list_quests` VALUES ('499', '0', '32', '0', '499', '1', '1131');
INSERT INTO `list_quests` VALUES ('500', '0', '32', '0', '500', '1', '1131');
INSERT INTO `list_quests` VALUES ('501', '0', '32', '0', '0', '1', '1131');

-- ----------------------------
-- Table structure for list_queststates
-- ----------------------------
DROP TABLE IF EXISTS `list_queststates`;
CREATE TABLE `list_queststates` (
  `CharID` int(10) unsigned NOT NULL,
  `State` blob,
  PRIMARY KEY (`CharID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_queststates
-- ----------------------------

-- ----------------------------
-- Table structure for list_specialskills
-- ----------------------------
DROP TABLE IF EXISTS `list_specialskills`;
CREATE TABLE `list_specialskills` (
  `CharId` int(10) unsigned NOT NULL,
  `Skills` tinyblob,
  PRIMARY KEY (`CharId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_specialskills
-- ----------------------------

-- ----------------------------
-- Table structure for list_storage
-- ----------------------------
DROP TABLE IF EXISTS `list_storage`;
CREATE TABLE `list_storage` (
  `CharId` int(10) unsigned NOT NULL,
  `ContainerMaxStorage` tinyint(3) unsigned NOT NULL,
  `Container` blob,
  PRIMARY KEY (`CharId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_storage
-- ----------------------------

-- ----------------------------
-- Table structure for list_weaponary
-- ----------------------------
DROP TABLE IF EXISTS `list_weaponary`;
CREATE TABLE `list_weaponary` (
  `CharId` int(10) unsigned NOT NULL,
  `Weaponary` mediumblob NOT NULL,
  `UnlockedWeaponCount` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `PrimairyWeapon` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SecondaryWeapoin` tinyint(1) unsigned NOT NULL DEFAULT '255',
  `ActiveWeaponIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CharId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_weaponary
-- ----------------------------

-- ----------------------------
-- Table structure for list_worldcharacters
-- ----------------------------
DROP TABLE IF EXISTS `list_worldcharacters`;
CREATE TABLE `list_worldcharacters` (
  `UserId` tinyint(3) unsigned NOT NULL,
  `WorldId` tinyint(3) unsigned NOT NULL,
  `CharacterCount` tinyint(3) unsigned NOT NULL,
  KEY `Index_1` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_worldcharacters
-- ----------------------------

-- ----------------------------
-- Table structure for list_worlds
-- ----------------------------
DROP TABLE IF EXISTS `list_worlds`;
CREATE TABLE `list_worlds` (
  `Id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(128) NOT NULL,
  `Proof` varchar(128) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_worlds
-- ----------------------------

-- ----------------------------
-- Table structure for list_zoneinformation
-- ----------------------------
DROP TABLE IF EXISTS `list_zoneinformation`;
CREATE TABLE `list_zoneinformation` (
  `CharId` int(10) unsigned NOT NULL DEFAULT '0',
  `ZoneState` blob,
  PRIMARY KEY (`CharId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of list_zoneinformation
-- ----------------------------

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `UserId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Username` varchar(32) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Gender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LastUserIP` bigint(20) unsigned NOT NULL DEFAULT '0',
  `LastSession` int(10) unsigned NOT NULL DEFAULT '0',
  `ActiveSession` int(10) unsigned NOT NULL DEFAULT '0',
  `LastLoginDate` datetime DEFAULT NULL,
  `IsActivated` tinyint(1) NOT NULL DEFAULT '0',
  `IsBanned` tinyint(1) NOT NULL DEFAULT '0',
  `HasAgreed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `DateOfBirth` date NOT NULL,
  `DateOfRegistration` date NOT NULL,
  `IsTestAccount` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `LastPlayedWorld` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `GmLevel` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `GameTime` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserId`,`Username`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of login
-- ----------------------------
