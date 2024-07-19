-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: 172.31.0.1    Database: yzncms
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
-- Table structure for table `yzn_admin`
--

DROP TABLE IF EXISTS `yzn_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_admin` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理账号',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理密码',
  `roleid` tinyint unsigned DEFAULT '0' COMMENT '规则ID',
  `encrypt` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '加密因子',
  `nickname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '昵称',
  `last_login_time` int unsigned DEFAULT NULL COMMENT '最后登录时间',
  `login_failure` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `create_time` int unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int unsigned DEFAULT NULL COMMENT '更新时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号码',
  `token` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_admin`
--

/*!40000 ALTER TABLE `yzn_admin` DISABLE KEYS */;
INSERT INTO `yzn_admin` VALUES (1,'admin','464f2f1f6c5f2cf22ad28496f2e47c81',1,'dec270','conn',1721224825,0,1546940765,1721224825,'172.18.0.1','admin@admin.com','','3d14bb6a-26bd-4232-a0ed-9148905f241b',1);
/*!40000 ALTER TABLE `yzn_admin` ENABLE KEYS */;

--
-- Table structure for table `yzn_adminlog`
--

DROP TABLE IF EXISTS `yzn_adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_adminlog` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '日志标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'User-Agent',
  `create_time` int unsigned DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_adminlog`
--

/*!40000 ALTER TABLE `yzn_adminlog` DISABLE KEYS */;
INSERT INTO `yzn_adminlog` VALUES (1,1,'admin','/admin/general.config/add/groupType/base.html?dialog=1','配置管理-新增','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"group\":\"base\",\"type\":\"switch\",\"title\":\"问卷结论前台显示开关\",\"name\":\"web_site_survey_result_display\",\"value\":\"1\",\"options\":\"\",\"visible\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"100\",\"status\":\"1\"},\"groupType\":\"base\"}','172.20.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',1721382859),(2,1,'admin','/admin/general.config/del.html?id=1','配置管理-删除','{\"id\":\"1\"}','172.20.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',1721382895),(3,1,'admin','/admin/general.config/del.html?id=2','配置管理-删除','{\"id\":\"2\"}','172.20.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',1721382897),(4,1,'admin','/admin/general.config/edit.html?id=17&dialog=1','配置管理-编辑','{\"id\":\"17\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"group\":\"base\",\"type\":\"switch\",\"title\":\"问卷结论显示开关\",\"name\":\"web_site_survey_result_display\",\"value\":\"1\",\"options\":\"\",\"visible\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"100\",\"id\":\"17\"}}','172.20.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',1721382957),(5,1,'admin','/admin/general.config/setting.html','配置管理-网站设置','{\"__token__\":\"***\"}','172.20.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',1721382989),(6,1,'admin','/admin/general.config/edit.html?id=17&dialog=1','配置管理-编辑','{\"id\":\"17\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"group\":\"base\",\"type\":\"switch\",\"title\":\"结论显示开关\",\"name\":\"web_site_survey_result_display\",\"value\":\"0\",\"options\":\"\",\"visible\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"100\",\"id\":\"17\"}}','172.20.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',1721383029),(7,1,'admin','/admin/general.attachments/del.html?id=2','附件管理-删除','{\"id\":\"2\"}','172.20.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',1721383037),(8,1,'admin','/admin/general.attachments/del.html?id=1','附件管理-删除','{\"id\":\"1\"}','172.20.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',1721383040);
/*!40000 ALTER TABLE `yzn_adminlog` ENABLE KEYS */;

--
-- Table structure for table `yzn_attachment`
--

DROP TABLE IF EXISTS `yzn_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_attachment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '类别',
  `admin_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `user_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件链接',
  `mime` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `ext` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '上传驱动',
  `create_time` int unsigned DEFAULT NULL COMMENT '上传时间',
  `update_time` int unsigned DEFAULT NULL COMMENT '更新时间',
  `listorders` int NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_attachment`
--

/*!40000 ALTER TABLE `yzn_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `yzn_attachment` ENABLE KEYS */;

--
-- Table structure for table `yzn_auth_group`
--

DROP TABLE IF EXISTS `yzn_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_auth_group` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `parentid` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述信息',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_auth_group`
--

/*!40000 ALTER TABLE `yzn_auth_group` DISABLE KEYS */;
INSERT INTO `yzn_auth_group` VALUES (1,0,'超级管理员','拥有所有权限','*',1);
/*!40000 ALTER TABLE `yzn_auth_group` ENABLE KEYS */;

--
-- Table structure for table `yzn_auth_rule`
--

DROP TABLE IF EXISTS `yzn_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_auth_rule` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `parentid` int unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图标',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则URL',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `ismenu` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `menutype` enum('_iframe','_blank','_layer') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单类型',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '扩展属性',
  `create_time` int unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int unsigned DEFAULT NULL COMMENT '更新时间',
  `listorder` smallint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `parentid` (`parentid`),
  KEY `listorder` (`listorder`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_auth_rule`
--

/*!40000 ALTER TABLE `yzn_auth_rule` DISABLE KEYS */;
INSERT INTO `yzn_auth_rule` VALUES (1,0,'general','常规管理','iconfont icon-setup','','','',1,NULL,'',1691377129,1691377129,999,1),(2,0,'addons','插件管理','iconfont icon-equalizer-line','','','',1,NULL,'',1691377129,1721357233,777,0),(4,1,'general.profile','个人资料','iconfont icon-user-line','','','',1,NULL,'',1691377129,1691377129,0,1),(5,4,'general.profile/index','查看','','','','',0,NULL,'',1691377129,1691377129,0,1),(6,4,'general.profile/update','资料更新','','','','',0,NULL,'',1691377129,1691377129,0,1),(10,1,'general.config','配置管理','iconfont icon-apartment','','','',1,NULL,'',1691377129,1691377129,999,1),(11,1,'general.config/setting','网站设置','iconfont icon-setup','','','',1,NULL,'',1691377129,1691377129,888,1),(12,28,'auth.rule','菜单管理','iconfont icon-other','','','',1,NULL,'',1691377129,1691377129,666,1),(13,1,'general.attachments','附件管理','iconfont icon-accessory','','','',1,NULL,'',1691377129,1691377129,666,1),(14,13,'general.attachments/index','查看','','','','',0,NULL,'',1691377129,1691377129,0,1),(15,13,'general.attachments/del','删除','','','','',0,NULL,'',1691377129,1691377129,0,1),(16,13,'general.attachments/getUrlFile','图片本地化','','','','',0,NULL,'',1691377129,1691377129,0,1),(17,13,'general.attachments/select','图片选择','','','','',0,NULL,'',1691377129,1691377129,0,1),(18,12,'auth.rule/index','查看','','','','',0,NULL,'',1691377129,1691377129,0,1),(19,12,'auth.rule/add','新增','','','','',0,NULL,'',1691377129,1691377129,0,1),(20,12,'auth.rule/edit','编辑','','','','',0,NULL,'',1691377129,1691377129,0,1),(21,12,'auth.rule/del','删除','','','','',0,NULL,'',1691377129,1691377129,0,1),(22,12,'auth.rule/multi','批量更新','','','','',0,NULL,'',1691377129,1691377129,0,1),(23,10,'general.config/add','新增','','','','',0,NULL,'',1691377129,1691377129,0,1),(24,10,'general.config/edit','编辑','','','','',0,NULL,'',1691377129,1691377129,0,1),(25,10,'general.config/del','删除','','','','',0,NULL,'',1691377129,1691377129,0,1),(26,10,'general.config/multi','批量更新','','','','',0,NULL,'',1691377129,1691377129,0,1),(27,10,'general.config/index','查看','','','','',0,NULL,'',1691377129,1691377129,0,1),(28,0,'auth','权限管理','iconfont icon-user-settings-line','','','',1,NULL,'',1691377129,1691377129,888,1),(29,28,'auth.manager','管理员管理','iconfont icon-user-settings-line','','','',1,NULL,'',1691377129,1691377129,999,1),(30,29,'auth.manager/index','查看','','','','',0,NULL,'',1691377129,1691377129,0,1),(31,29,'auth.manager/edit','编辑','','','','',0,NULL,'',1691377129,1691377129,0,1),(32,29,'auth.manager/del','删除','','','','',0,NULL,'',1691377129,1691377129,0,1),(33,29,'auth.manager/add','新增','','','','',0,NULL,'',1691377129,1691377129,0,1),(34,28,'auth.adminlog','管理日志','iconfont icon-history','','','',1,NULL,'',1691377129,1691377129,888,1),(35,34,'auth.adminlog/index','查看','','','','',0,NULL,'',1691377129,1691377129,0,1),(36,34,'auth.adminlog/deletelog','删除','','','','',0,NULL,'',1691377129,1691377129,0,1),(37,28,'auth.group','角色管理','iconfont icon-user-shared-2-line','','','',1,NULL,'',1691377129,1691377129,777,1),(38,37,'auth.group/index','查看','','','','',0,NULL,'',1691377129,1691377129,0,1),(39,37,'auth.group/add','新增','','','','',0,NULL,'',1691377129,1691377129,0,1),(40,37,'auth.group/edit','编辑','','','','',0,NULL,'',1691377129,1691377129,0,1),(41,37,'auth.group/del','删除','','','','',0,NULL,'',1691377129,1691377129,0,1),(42,37,'auth.group/access','访问授权','','','','',0,NULL,'',1691377129,1691377129,0,1),(45,2,'addons/index','查看','','','','',0,NULL,'',1691377129,1691377129,0,1),(46,2,'addons/config','配置','','','','',0,NULL,'',1691377129,1691377129,0,1),(49,2,'addons/state','禁用启用','','','','',0,NULL,'',1691377129,1691377129,0,1),(50,0,'command','在线命令管理','iconfont icon-code-s-slash-fill','','','',1,NULL,'',1721225174,1721353887,776,1),(51,50,'command/index','查看','iconfont icon-circle-line','','','',0,NULL,'',1721225174,1721225174,0,1),(52,50,'command/add','添加','iconfont icon-circle-line','','','',0,NULL,'',1721225174,1721225174,0,1),(53,50,'command/detail','详情','iconfont icon-circle-line','','','',0,NULL,'',1721225174,1721225174,0,1),(54,50,'command/command','生成并执行命令','iconfont icon-circle-line','','','',0,NULL,'',1721225174,1721225174,0,1),(55,50,'command/execute','再次执行命令','iconfont icon-circle-line','','','',0,NULL,'',1721225174,1721225174,0,1),(56,50,'command/del','删除','iconfont icon-circle-line','','','',0,NULL,'',1721225174,1721225174,0,1),(57,50,'command/multi','批量更新','iconfont icon-circle-line','','','',0,NULL,'',1721225174,1721225174,0,1),(149,0,'category.manager','量表分类管理','iconfont iconfont iconfont icon-map-2-line','category.manager','','',1,'_iframe','',1721227403,1721353899,10,1),(155,149,'category.score','分数结论管理','iconfont iconfont icon-other','','','',1,NULL,'',1721227636,1721228459,0,1),(156,155,'category.score/index','查看','iconfont icon-circle-line','','','',0,NULL,'',1721227636,1721227636,0,1),(157,155,'category.score/add','添加','iconfont icon-circle-line','','','',0,NULL,'',1721227636,1721227636,0,1),(158,155,'category.score/edit','编辑','iconfont icon-circle-line','','','',0,NULL,'',1721227636,1721227636,0,1),(159,155,'category.score/del','删除','iconfont icon-circle-line','','','',0,NULL,'',1721227636,1721227636,0,1),(160,155,'category.score/multi','批量更新','iconfont icon-circle-line','','','',0,NULL,'',1721227636,1721227636,0,1),(162,149,'category','量表分类','iconfont iconfont icon-other','','','',1,NULL,'',1721228371,1721228414,0,1),(163,162,'category/index','查看','iconfont icon-circle-line','','','',0,NULL,'',1721228371,1721289877,0,1),(164,162,'category/add','添加','iconfont icon-circle-line','','','',0,NULL,'',1721228371,1721289877,0,1),(165,162,'category/edit','编辑','iconfont icon-circle-line','','','',0,NULL,'',1721228371,1721289877,0,1),(166,162,'category/del','删除','iconfont icon-circle-line','','','',0,NULL,'',1721228371,1721289877,0,1),(167,162,'category/multi','批量更新','iconfont icon-circle-line','','','',0,NULL,'',1721228371,1721289877,0,1),(168,0,'question.manager','量表试题管理','iconfont iconfont icon-draft-fill','','','',1,'_iframe','',1721289572,1721353905,9,1),(169,174,'question/index','查看','iconfont icon-circle-line','','','',0,NULL,'',1721290008,1721290204,0,1),(170,174,'question/add','添加','iconfont icon-circle-line','','','',0,NULL,'',1721290008,1721290204,0,1),(171,174,'question/edit','编辑','iconfont icon-circle-line','','','',0,NULL,'',1721290008,1721290204,0,1),(172,174,'question/del','删除','iconfont icon-circle-line','','','',0,NULL,'',1721290008,1721290204,0,1),(173,174,'question/multi','批量更新','iconfont icon-circle-line','','','',0,NULL,'',1721290008,1721290204,0,1),(174,168,'question','试题列表','iconfont iconfont iconfont icon-other','','','',1,NULL,'',1721290204,1721355819,0,1),(175,0,'survey.manager','问卷管理','iconfont iconfont icon-file-list-3-line','','','',1,'_iframe','',1721353842,1721353909,8,1),(176,175,'survey','问卷列表','iconfont iconfont icon-other','','','',1,NULL,'',1721355758,1721355806,0,1),(177,176,'survey/index','查看','iconfont icon-circle-line','','','',0,NULL,'',1721355758,1721355758,0,1),(178,176,'survey/add','添加','iconfont icon-circle-line','','','',0,NULL,'',1721355758,1721355758,0,1),(179,176,'survey/edit','编辑','iconfont icon-circle-line','','','',0,NULL,'',1721355758,1721355758,0,1),(180,176,'survey/del','删除','iconfont icon-circle-line','','','',0,NULL,'',1721355758,1721355758,0,1),(181,176,'survey/multi','批量更新','iconfont icon-circle-line','','','',0,NULL,'',1721355758,1721355758,0,1);
/*!40000 ALTER TABLE `yzn_auth_rule` ENABLE KEYS */;

--
-- Table structure for table `yzn_cache`
--

DROP TABLE IF EXISTS `yzn_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_cache` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '缓存KEY值',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模块名称',
  `model` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模型名称',
  `action` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '方法名',
  `system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否系统',
  PRIMARY KEY (`id`),
  KEY `ckey` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='缓存列队表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_cache`
--

/*!40000 ALTER TABLE `yzn_cache` DISABLE KEYS */;
INSERT INTO `yzn_cache` VALUES (1,'Model','模型列表','admin','Models','model_cache',1),(2,'ModelField','模型字段','admin','ModelField','model_field_cache',1);
/*!40000 ALTER TABLE `yzn_cache` ENABLE KEYS */;

--
-- Table structure for table `yzn_category`
--

DROP TABLE IF EXISTS `yzn_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='量表分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_category`
--

/*!40000 ALTER TABLE `yzn_category` DISABLE KEYS */;
INSERT INTO `yzn_category` VALUES (1,'匹兹堡睡眠质量指数（PSQI）'),(5,'失眠严重程度指数量表'),(6,'睡眠个人信念和态度量表（DBAS-30）'),(7,'一般自我效能感量表');
/*!40000 ALTER TABLE `yzn_category` ENABLE KEYS */;

--
-- Table structure for table `yzn_category_score`
--

DROP TABLE IF EXISTS `yzn_category_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_category_score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int DEFAULT NULL,
  `score_start` int NOT NULL COMMENT '分段边界值起始',
  `score_end` int NOT NULL COMMENT '分段边界值结束',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='量表结论分数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_category_score`
--

/*!40000 ALTER TABLE `yzn_category_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `yzn_category_score` ENABLE KEYS */;

--
-- Table structure for table `yzn_command`
--

DROP TABLE IF EXISTS `yzn_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_command` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '命令',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '返回结果',
  `execute_time` int unsigned DEFAULT NULL COMMENT '执行时间',
  `create_time` int unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int unsigned DEFAULT NULL COMMENT '更新时间',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0失败,1正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='在线命令表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_command`
--

/*!40000 ALTER TABLE `yzn_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `yzn_command` ENABLE KEYS */;

--
-- Table structure for table `yzn_config`
--

DROP TABLE IF EXISTS `yzn_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置类型',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置分组',
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置项',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int unsigned DEFAULT NULL COMMENT '更新时间',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  `visible` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '可见条件',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '扩展属性',
  `listorder` smallint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='网站配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_config`
--

/*!40000 ALTER TABLE `yzn_config` DISABLE KEYS */;
INSERT INTO `yzn_config` VALUES (3,'config_group','array','配置分组','system','','',1494408414,1494408414,1,'{\"base\":\"基础\",\"system\":\"系统\",\"upload\":\"上传\",\"develop\":\"开发\"}','','',0),(4,'theme','text','主题风格','system','','',1541752781,1541756888,1,'default','','',1),(5,'admin_forbid_ip','textarea','后台禁止访问IP','system','','匹配IP段用\"*\"占位，如192.168.*.*，多个IP地址请用英文逗号\",\"分割',1551244957,1551244957,1,'','','',2),(6,'upload_image_size','text','图片上传大小限制','upload','','0为不限制大小，单位：kb',1540457656,1552436075,1,'0','','',2),(7,'upload_image_ext','text','允许上传图片后缀','upload','','多个后缀用逗号隔开，不填写则不限制类型',1540457657,1552436074,1,'gif,jpg,jpeg,bmp,png','','',1),(8,'upload_file_size','text','文件上传大小限制','upload','','0为不限制大小，单位：kb',1540457658,1552436078,1,'0','','',3),(9,'upload_file_ext','text','允许上传文件后缀','upload','','多个后缀用逗号隔开，不填写则不限制类型',1540457659,1552436080,1,'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z','','',4),(10,'upload_driver','radio','上传驱动','upload','local:本地','图片或文件上传驱动',1541752781,1552436085,1,'local','','',9),(11,'upload_thumb_water','switch','添加水印','upload','','',1552435063,1552436080,1,'0','','',5),(12,'upload_thumb_water_pic','image','水印图片','upload','','只有开启水印功能才生效',1552435183,1552436081,1,'','','',6),(13,'upload_thumb_water_position','radio','水印位置','upload','1:左上角\r\n2:上居中\r\n3:右上角\r\n4:左居中\r\n5:居中\r\n6:右居中\r\n7:左下角\r\n8:下居中\r\n9:右下角','只有开启水印功能才生效',1552435257,1552436082,1,'9','','',7),(14,'upload_thumb_water_alpha','text','水印透明度','upload','','请输入0~100之间的数字，数字越小，透明度越高',1552435299,1552436083,1,'50','','',8),(15,'web_logo','image','LOGO','upload','','',1721209954,1721209954,1,'/uploads/images/20240717/5e4bbd3844866f74473cfaa3e3d1163c.png','','',100),(17,'web_site_survey_result_display','switch','结论显示开关','base','','',1721382859,1721383029,1,'0','','',100);
/*!40000 ALTER TABLE `yzn_config` ENABLE KEYS */;

--
-- Table structure for table `yzn_download`
--

DROP TABLE IF EXISTS `yzn_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_download` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `catid` smallint unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `flag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '属性',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'SEO关键词',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'SEO描述',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Tags标签',
  `listorder` smallint unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `uid` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户名',
  `sysadd` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否后台添加',
  `hits` mediumint unsigned DEFAULT '0' COMMENT '点击量',
  `create_time` int unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int unsigned DEFAULT NULL COMMENT '更新时间',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`catid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='下载模型模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_download`
--

/*!40000 ALTER TABLE `yzn_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `yzn_download` ENABLE KEYS */;

--
-- Table structure for table `yzn_download_data`
--

DROP TABLE IF EXISTS `yzn_download_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_download_data` (
  `did` mediumint unsigned NOT NULL DEFAULT '0',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='下载模型模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_download_data`
--

/*!40000 ALTER TABLE `yzn_download_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `yzn_download_data` ENABLE KEYS */;

--
-- Table structure for table `yzn_ems`
--

DROP TABLE IF EXISTS `yzn_ems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_ems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作IP',
  `create_time` int unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮箱验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_ems`
--

/*!40000 ALTER TABLE `yzn_ems` DISABLE KEYS */;
/*!40000 ALTER TABLE `yzn_ems` ENABLE KEYS */;

--
-- Table structure for table `yzn_field_type`
--

DROP TABLE IF EXISTS `yzn_field_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_field_type` (
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段类型',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '中文类型名',
  `listorder` int NOT NULL DEFAULT '0' COMMENT '排序',
  `default_define` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '默认定义',
  `ifoption` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否需要设置选项',
  `ifstring` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否自由字符',
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字段类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_field_type`
--

/*!40000 ALTER TABLE `yzn_field_type` DISABLE KEYS */;
INSERT INTO `yzn_field_type` VALUES ('array','数组',7,'varchar(512) NOT NULL',0,0),('checkbox','复选框',2,'varchar(32) NOT NULL',1,0),('city','城市地区',22,'varchar(255) NOT NULL',0,0),('color','颜色值',21,'varchar(7) NOT NULL',0,0),('custom','自定义',23,'text NOT NULL',1,0),('datetime','日期和时间',15,'int(10) UNSIGNED NOT NULL',0,0),('datetimerange','日期和时间区间',16,'varchar(100) NOT NULL',0,0),('file','单文件',20,'varchar(255) NOT NULL',0,0),('files','多文件',19,'text NOT NULL',0,0),('image','单张图',11,'varchar(255) NOT NULL',0,0),('images','多张图',12,'text NOT NULL',0,0),('markdown','markdown编辑器',18,'mediumtext NOT NULL',0,1),('number','数字',14,'int(10) UNSIGNED NOT NULL',0,0),('password','密码',4,'varchar(255) NOT NULL',0,1),('radio','单选按钮',5,'char(10) NOT NULL',1,0),('select','下拉框',8,'char(10) NOT NULL',1,0),('selectpage','高级下拉框',10,'varchar(32) NOT NULL',1,0),('selects','下拉框(多选)',9,'varchar(32) NOT NULL',1,0),('switch','开关',6,'tinyint(2) UNSIGNED NOT NULL',0,0),('tags','标签',13,'varchar(255) NOT NULL',0,1),('text','输入框',1,'varchar(255) NOT NULL',0,1),('textarea','多行文本',3,'varchar(255) NOT NULL',0,1),('Ueditor','百度编辑器',17,'mediumtext NOT NULL',0,1);
/*!40000 ALTER TABLE `yzn_field_type` ENABLE KEYS */;

--
-- Table structure for table `yzn_model`
--

DROP TABLE IF EXISTS `yzn_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_model` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模型名称',
  `tablename` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表名',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `setting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置信息',
  `type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '模型类别：1-独立表，2-主附表',
  `create_time` int unsigned DEFAULT NULL COMMENT '添加时间',
  `update_time` int unsigned DEFAULT NULL COMMENT '更新时间',
  `listorders` tinyint NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='模型列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_model`
--

/*!40000 ALTER TABLE `yzn_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `yzn_model` ENABLE KEYS */;

--
-- Table structure for table `yzn_model_field`
--

DROP TABLE IF EXISTS `yzn_model_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_model_field` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '别名',
  `remark` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '字段提示',
  `pattern` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据校验正则',
  `errortips` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据校验未通过的提示信息',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字段类型',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '扩展信息',
  `setting` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '字段配置',
  `ifsystem` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否主表字段 1 是',
  `iscore` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否内部字段',
  `iffixed` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否固定不可修改',
  `ifrequire` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `ifsearch` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '作为搜索条件',
  `isadd` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '在投稿中显示',
  `create_time` int unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int unsigned DEFAULT NULL COMMENT '更新时间',
  `listorder` smallint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='模型字段列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_model_field`
--

/*!40000 ALTER TABLE `yzn_model_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `yzn_model_field` ENABLE KEYS */;

--
-- Table structure for table `yzn_options`
--

DROP TABLE IF EXISTS `yzn_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_options` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `option_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '选项',
  `score` int NOT NULL COMMENT '分数',
  `qid` int NOT NULL COMMENT '问题ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='选项表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_options`
--

/*!40000 ALTER TABLE `yzn_options` DISABLE KEYS */;
INSERT INTO `yzn_options` VALUES (27,'20:00',1,7),(28,'22:00',2,7),(29,'24:00',3,7),(30,'15分钟之内',2,8),(31,'16~30分钟',3,8),(32,'31~60分钟',4,8),(33,'60分钟以上',5,8),(34,'＞7小时',3,9),(35,'6~7小时',4,9),(36,'5~6小时',5,9),(37,'＜5小时',6,9);
/*!40000 ALTER TABLE `yzn_options` ENABLE KEYS */;

--
-- Table structure for table `yzn_picture`
--

DROP TABLE IF EXISTS `yzn_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_picture` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `catid` smallint unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `flag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '属性',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'SEO关键词',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'SEO描述',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Tags标签',
  `listorder` smallint unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `uid` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户名',
  `sysadd` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否后台添加',
  `hits` mediumint unsigned DEFAULT '0' COMMENT '点击量',
  `create_time` int unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int unsigned DEFAULT NULL COMMENT '更新时间',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`catid`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='图片模型模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_picture`
--

/*!40000 ALTER TABLE `yzn_picture` DISABLE KEYS */;
INSERT INTO `yzn_picture` VALUES (1,4,'ISO9001证书','','','','','',100,1,'admin',1,0,1550552511,1550554247,'',1),(2,4,'ISO14001证书','','','','','',100,1,'admin',1,0,1550554284,1550554288,'',1),(3,4,'OHSAS18001证书','','','','','',100,1,'admin',1,0,1550554298,1550554301,'',1),(4,4,'企业信用等级评价','','','','','',100,1,'admin',1,0,1550554307,1550554309,'',1),(5,4,'企业荣誉证书','','','','','',100,1,'admin',1,0,1550554314,1550554316,'',1);
/*!40000 ALTER TABLE `yzn_picture` ENABLE KEYS */;

--
-- Table structure for table `yzn_picture_data`
--

DROP TABLE IF EXISTS `yzn_picture_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_picture_data` (
  `did` mediumint unsigned NOT NULL DEFAULT '0',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='图片模型模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_picture_data`
--

/*!40000 ALTER TABLE `yzn_picture_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `yzn_picture_data` ENABLE KEYS */;

--
-- Table structure for table `yzn_question`
--

DROP TABLE IF EXISTS `yzn_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_question` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `cid` int NOT NULL COMMENT 'Category ID',
  `type` tinyint NOT NULL COMMENT 'Type 1: Single Choice 2: Multiple Choice 3: Short answer',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='问题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_question`
--

/*!40000 ALTER TABLE `yzn_question` DISABLE KEYS */;
INSERT INTO `yzn_question` VALUES (7,1,1,'近1个月，通常几点钟上床睡觉？（24小时制）'),(8,1,1,'近1个月，从上床到入睡通常需要多少分钟？'),(9,1,1,'近1个月，通常每晚实际睡眠几个小时？(不等于卧床时间)');
/*!40000 ALTER TABLE `yzn_question` ENABLE KEYS */;

--
-- Table structure for table `yzn_sms`
--

DROP TABLE IF EXISTS `yzn_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_sms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作IP',
  `create_time` int unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_sms`
--

/*!40000 ALTER TABLE `yzn_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `yzn_sms` ENABLE KEYS */;

--
-- Table structure for table `yzn_survey`
--

DROP TABLE IF EXISTS `yzn_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_survey` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'QR Code',
  `survey_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Survey Name',
  `survey_description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Survey Description',
  `user_name_required` tinyint(1) NOT NULL COMMENT 'User Name Required (0: No, 1: Yes)',
  `user_name_display` tinyint(1) NOT NULL COMMENT 'User Name Display (0: No, 1: Yes)',
  `user_id_required` tinyint(1) NOT NULL COMMENT 'User id Required (0: No, 1: Yes)',
  `user_id_display` tinyint(1) NOT NULL COMMENT 'User id Display (0: No, 1: Yes)',
  `user_sex_required` tinyint(1) NOT NULL COMMENT 'User sex Required (0: No, 1: Yes)',
  `user_sex_display` tinyint(1) NOT NULL COMMENT 'User Sex Display (0: No, 1: Yes)',
  `user_birth_required` tinyint(1) NOT NULL COMMENT 'User birth Required (0: No, 1: Yes)',
  `user_birth_display` tinyint(1) NOT NULL COMMENT 'User Birth Display (0: No, 1: Yes)',
  `user_department_required` tinyint(1) NOT NULL COMMENT 'User department Required (0: No, 1: Yes)',
  `user_department_display` tinyint(1) NOT NULL COMMENT 'User Department Display (0: No, 1: Yes)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `categories` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '包含量表分类id,逗号分隔',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '唯一码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='问卷表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_survey`
--

/*!40000 ALTER TABLE `yzn_survey` DISABLE KEYS */;
INSERT INTO `yzn_survey` VALUES (7,'/qrcode/b1a6e4bf5040764a.png','test','<p>aaadwad</p>',0,1,0,1,0,1,0,1,0,1,'2024-07-19 08:12:39','1,6','b1a6e4bf5040764a');
/*!40000 ALTER TABLE `yzn_survey` ENABLE KEYS */;

--
-- Table structure for table `yzn_terms`
--

DROP TABLE IF EXISTS `yzn_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yzn_terms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parentid` smallint NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `module` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `setting` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '相关配置信息',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `module` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yzn_terms`
--

/*!40000 ALTER TABLE `yzn_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `yzn_terms` ENABLE KEYS */;

--
-- Dumping routines for database 'yzncms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-19 18:01:44
