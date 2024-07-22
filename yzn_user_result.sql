/*
 Navicat Premium Data Transfer

 Source Server         : yzncms
 Source Server Type    : MySQL
 Source Server Version : 50742
 Source Host           : 127.0.0.1
 Source Database       : yzncms

 Target Server Type    : MySQL
 Target Server Version : 50742
 File Encoding         : utf-8

 Date: 07/22/2024 20:43:38 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `yzn_user_result`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_user_result`;
CREATE TABLE `yzn_user_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `score` int(11) DEFAULT '0' COMMENT '量表总分',
  `result` text COMMENT '量表结论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
