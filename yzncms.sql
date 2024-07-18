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

 Date: 07/18/2024 11:38:08 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `yzn_admin`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_admin`;
CREATE TABLE `yzn_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理账号',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理密码',
  `roleid` tinyint(3) unsigned DEFAULT '0' COMMENT '规则ID',
  `encrypt` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '加密因子',
  `nickname` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '昵称',
  `last_login_time` int(10) unsigned DEFAULT NULL COMMENT '最后登录时间',
  `login_failure` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `last_login_ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电子邮箱',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号码',
  `token` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';

-- ----------------------------
--  Records of `yzn_admin`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_admin` VALUES ('1', 'admin', '464f2f1f6c5f2cf22ad28496f2e47c81', '1', 'dec270', 'conn', '1721224825', '0', '1546940765', '1721224825', '172.18.0.1', 'admin@admin.com', '', '3d14bb6a-26bd-4232-a0ed-9148905f241b', '1'), ('2', 'test', '2e070442f36490d1708cceb56f1d671e', '2', 'CY4Wqv', 'test', '1721209020', '0', '1721208443', '1721209020', '172.20.0.1', 'test@test.com', '15734069790', 'ae05633d-39aa-4ba2-b395-34e2be7cb05c', '1');
COMMIT;

-- ----------------------------
--  Table structure for `yzn_adminlog`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_adminlog`;
CREATE TABLE `yzn_adminlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '日志标题',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志';

-- ----------------------------
--  Records of `yzn_adminlog`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_adminlog` VALUES ('1', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"verify\":\"Xx5r\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721207599'), ('2', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"verify\":\"BKvs\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721208320'), ('3', '1', 'admin', '/admin/auth.manager/add.html?dialog=1', '管理员管理-新增', '{\"dialog\":\"1\",\"__token__\":\"***\",\"username\":\"test\",\"password\":\"***\",\"password_confirm\":\"***\",\"email\":\"test@test.com\",\"mobile\":\"test\",\"nickname\":\"test\",\"roleid\":\"2\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721208435'), ('4', '1', 'admin', '/admin/auth.manager/add.html?dialog=1', '管理员管理-新增', '{\"dialog\":\"1\",\"__token__\":\"***\",\"username\":\"test\",\"password\":\"***\",\"password_confirm\":\"***\",\"email\":\"test@test.com\",\"mobile\":\"15734069790\",\"nickname\":\"test\",\"roleid\":\"2\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721208443'), ('5', '0', '未知', '/admin/index/login.html', '登录', '{\"__token__\":\"***\",\"username\":\"test\",\"password\":\"***\",\"verify\":\"tDm8\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721208552'), ('6', '0', '未知', '/admin/index/login.html', '登录', '{\"__token__\":\"***\",\"username\":\"test\",\"password\":\"***\",\"verify\":\"tDm8\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721208558'), ('7', '0', '未知', '/admin/index/login.html', '登录', '{\"__token__\":\"***\",\"username\":\"test\",\"password\":\"***\",\"verify\":\"W5CV\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721208567'), ('8', '2', 'test', '/admin/index/login.html', '登录', '{\"__token__\":\"***\",\"username\":\"test\",\"password\":\"***\",\"verify\":\"zwWT\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721208585'), ('9', '1', 'admin', '/admin/auth.group/access.html?id=2&pid=1&dialog=1', '角色管理-访问授权', '{\"id\":\"2\",\"pid\":\"1\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"rules\":\"1,10,23,24,25,26,27\",\"id\":\"2\",\"parentid\":\"1\"}}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721208995'), ('10', '2', 'test', '/admin/index/login.html', '登录', '{\"__token__\":\"***\",\"username\":\"test\",\"password\":\"***\",\"verify\":\"iXVR\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721209020'), ('11', '1', 'admin', '/admin/general.config/add/groupType/base.html?dialog=1', '配置管理-新增', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"group\":\"upload\",\"type\":\"image\",\"title\":\"LOGO\",\"name\":\"web_logo\",\"value\":\"\",\"visible\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"100\",\"status\":\"1\"},\"groupType\":\"base\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721209954'), ('12', '1', 'admin', '/admin/ajax/upload/dir/images.html', '附件上传', '{\"category\":\"\",\"dir\":\"images\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721210150'), ('13', '1', 'admin', '/admin/ajax/upload/dir/images.html', '附件上传', '{\"category\":\"\",\"dir\":\"images\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721210160'), ('14', '1', 'admin', '/admin/ajax/upload/dir/images.html', '附件上传', '{\"category\":\"\",\"dir\":\"images\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721210170'), ('15', '1', 'admin', '/admin/ajax/upload/dir/images.html', '附件上传', '{\"category\":\"\",\"dir\":\"images\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721210230'), ('16', '1', 'admin', '/admin/general.config/setting/group/upload.html', '配置管理-网站设置', '{\"__token__\":\"***\",\"row\":{\"upload_image_ext\":\"gif,jpg,jpeg,bmp,png\",\"upload_image_size\":\"0\",\"upload_file_size\":\"0\",\"upload_file_ext\":\"doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z\",\"upload_thumb_water_pic\":\"\",\"upload_thumb_water_position\":\"9\",\"upload_thumb_water_alpha\":\"50\",\"upload_driver\":\"local\",\"web_logo\":\"\\/uploads\\/images\\/20240717\\/5e4bbd3844866f74473cfaa3e3d1163c.png\"},\"group\":\"upload\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721210233'), ('17', '1', 'admin', '/admin/general.profile/update.html', '个人资料-资料更新', '{\"__token__\":\"***\",\"password\":\"***\",\"email\":\"admin@admin.com\",\"mobile\":\"\",\"nickname\":\"conn\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721210410'), ('18', '0', '未知', '/admin/index/login.html', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721224399'), ('19', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"verify\":\"CLtV\",\"keeplogin\":\"on\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721224825'), ('20', '1', 'admin', '/admin/addons/install.html', '插件安装', '{\"name\":\"command\",\"force\":\"0\",\"uid\":\"1115\",\"token\":\"***\",\"version\":\"1.1.0\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225174'), ('21', '1', 'admin', '/admin/addons/install.html', '插件安装', '{\"name\":\"cms\",\"force\":\"0\",\"uid\":\"1115\",\"token\":\"***\",\"version\":\"1.1.7\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225193'), ('22', '1', 'admin', '/admin/addons/install.html', '插件安装', '{\"name\":\"member\",\"force\":\"0\",\"uid\":\"1115\",\"token\":\"***\",\"version\":\"1.1.6\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225213'), ('23', '1', 'admin', '/admin/addons/install.html', '插件安装', '{\"name\":\"formguide\",\"force\":\"0\",\"uid\":\"1115\",\"token\":\"***\",\"version\":\"1.1.2\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225230'), ('24', '1', 'admin', '/admin/addons/install.html', '插件安装', '{\"name\":\"cms\",\"force\":\"0\",\"uid\":\"1115\",\"token\":\"***\",\"version\":\"1.1.7\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225239'), ('25', '1', 'admin', '/admin/addons/testdata.html', '插件导入测试数据', '{\"name\":\"cms\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225246'), ('26', '1', 'admin', '/admin/addons/install.html', '插件安装', '{\"name\":\"formguide\",\"force\":\"0\",\"uid\":\"1115\",\"token\":\"***\",\"version\":\"1.1.2\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225256'), ('27', '1', 'admin', '/admin/addons/install.html', '插件安装', '{\"name\":\"dataoutput\",\"force\":\"0\",\"uid\":\"1115\",\"token\":\"***\",\"version\":\"1.1.0\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225285'), ('28', '1', 'admin', '/admin/addons/isbuy.html', '插件管理-未知(isbuy)', '{\"name\":\"dataoutput\",\"force\":\"0\",\"uid\":\"1115\",\"token\":\"***\",\"version\":\"1.1.0\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225288'), ('29', '1', 'admin', '/admin/addons/state.html', '插件管理-禁用启用', '{\"name\":\"member\",\"action\":\"disable\",\"force\":\"0\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225682'), ('30', '1', 'admin', '/admin/addons/get_table_list.html', '插件管理-未知(get_table_list)', '{\"name\":\"member\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225686'), ('31', '1', 'admin', '/admin/addons/uninstall.html', '插件卸载', '{\"name\":\"member\",\"force\":\"0\",\"droptables\":\"1\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225689'), ('32', '1', 'admin', '/admin/addons/state.html', '插件管理-禁用启用', '{\"name\":\"formguide\",\"action\":\"disable\",\"force\":\"0\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225693'), ('33', '1', 'admin', '/admin/addons/get_table_list.html', '插件管理-未知(get_table_list)', '{\"name\":\"formguide\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225695'), ('34', '1', 'admin', '/admin/addons/uninstall.html', '插件卸载', '{\"name\":\"formguide\",\"force\":\"0\",\"droptables\":\"1\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225697'), ('35', '1', 'admin', '/admin/addons/state.html', '插件管理-禁用启用', '{\"name\":\"cms\",\"action\":\"disable\",\"force\":\"0\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225701'), ('36', '1', 'admin', '/admin/addons/uninstall.html', '插件卸载', '{\"name\":\"cms\",\"force\":\"0\",\"droptables\":\"0\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225749'), ('37', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225773'), ('38', '1', 'admin', '/admin/command/get_controller_list.html', '在线命令管理-未知(get_controller_list)', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721225783'), ('39', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226654'), ('40', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226658'), ('41', '1', 'admin', '/admin/command/command.html?action=command', '在线命令管理-生成并执行命令', '{\"action\":\"command\",\"commandtype\":\"crud\",\"menu\":\"1\",\"table\":\"yzn_category\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226679'), ('42', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226699'), ('43', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226700'), ('44', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category_score\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226709'), ('45', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category_score\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226709'), ('46', '1', 'admin', '/admin/command/command.html?action=command', '在线命令管理-生成并执行命令', '{\"action\":\"command\",\"commandtype\":\"crud\",\"menu\":\"1\",\"isrelation\":\"1\",\"table\":\"yzn_category\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"relation\":{\"2\":{\"relation\":\"yzn_category_score\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"id\",\"relationprimarykey\":\"cid\",\"relationfields\":[\"score_end,score_start,result\"]}},\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226728'), ('47', '1', 'admin', '/admin/command/command.html?action=execute', '在线命令管理-生成并执行命令', '{\"action\":\"execute\",\"commandtype\":\"crud\",\"menu\":\"1\",\"isrelation\":\"1\",\"table\":\"yzn_category\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"relation\":{\"2\":{\"relation\":\"yzn_category_score\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"id\",\"relationprimarykey\":\"cid\",\"relationfields\":[\"score_end,score_start,result\"]}},\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226731'), ('48', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226776'), ('49', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226788'), ('50', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226792'), ('51', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226792'), ('52', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category_score\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226794'), ('53', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category_score\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226794'), ('54', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category_score\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226797'), ('55', '1', 'admin', '/admin/command/command.html?action=command', '在线命令管理-生成并执行命令', '{\"action\":\"command\",\"commandtype\":\"crud\",\"menu\":\"1\",\"isrelation\":\"1\",\"force\":\"1\",\"table\":\"yzn_category\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"relation\":{\"2\":{\"relation\":\"yzn_category_score\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"id\",\"relationprimarykey\":\"cid\",\"relationfields\":[\"score_end,score_start,result\"]}},\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226830'), ('56', '1', 'admin', '/admin/auth.rule/add.html?parentid=142&dialog=1', '菜单管理-新增', '{\"parentid\":\"142\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"parentid\":\"142\",\"name\":\"category\",\"title\":\"量表分类\",\"url\":\"category\",\"icon\":\"\",\"condition\":\"\",\"menutype\":\"_iframe\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226922'), ('57', '1', 'admin', '/admin/auth.rule/add.html?parentid=142&dialog=1', '菜单管理-新增', '{\"parentid\":\"142\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"parentid\":\"142\",\"name\":\"category\\/index\",\"title\":\"量表分类\",\"url\":\"category\\/index\",\"icon\":\"\",\"condition\":\"\",\"menutype\":\"_iframe\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226962'), ('58', '1', 'admin', '/admin/auth.rule/add.html?parentid=142&dialog=1', '菜单管理-新增', '{\"parentid\":\"142\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"parentid\":\"142\",\"name\":\"category.index\",\"title\":\"量表分类\",\"url\":\"category\\/index\",\"icon\":\"\",\"condition\":\"\",\"menutype\":\"_iframe\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226973'), ('59', '1', 'admin', '/admin/auth.rule/del.html?id=148', '菜单管理-删除', '{\"id\":\"148\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721226990'), ('60', '1', 'admin', '/admin/category/add.html?dialog=1', 'Category-添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"test\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227027'), ('61', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227249'), ('62', '1', 'admin', '/admin/auth.rule/add.html?dialog=1', '菜单管理-新增', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"parentid\":\"0\",\"name\":\"category\",\"title\":\"量表分类管理\",\"url\":\"category\",\"icon\":\"icon-table-alt-fill\",\"condition\":\"\",\"menutype\":\"_iframe\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227359'), ('63', '1', 'admin', '/admin/auth.rule/del.html?id=142', '菜单管理-删除', '{\"id\":\"142\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227366'), ('64', '1', 'admin', '/admin/auth.rule/add.html?dialog=1', '菜单管理-新增', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"parentid\":\"0\",\"name\":\"category\",\"title\":\"量表分类管理\",\"url\":\"category\",\"icon\":\"icon-map-2-line\",\"condition\":\"\",\"menutype\":\"_iframe\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227403'), ('65', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227423'), ('66', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category_score\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227426'), ('67', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227436'), ('68', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227436'), ('69', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227440'), ('70', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227440'), ('71', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227442'), ('72', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227450'), ('73', '1', 'admin', '/admin/command/command.html?action=command', '在线命令管理-生成并执行命令', '{\"action\":\"command\",\"commandtype\":\"crud\",\"isrelation\":\"1\",\"table\":\"yzn_category_score\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"relation\":{\"2\":{\"relation\":\"yzn_category\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"cid\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227462'), ('74', '1', 'admin', '/admin/command/command.html?action=execute', '在线命令管理-生成并执行命令', '{\"action\":\"execute\",\"commandtype\":\"crud\",\"isrelation\":\"1\",\"table\":\"yzn_category_score\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"relation\":{\"2\":{\"relation\":\"yzn_category\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"cid\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227467'), ('75', '1', 'admin', '/admin/command/command.html?action=command', '在线命令管理-生成并执行命令', '{\"action\":\"command\",\"commandtype\":\"crud\",\"menu\":\"1\",\"isrelation\":\"1\",\"force\":\"1\",\"table\":\"yzn_category_score\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"relation\":{\"2\":{\"relation\":\"yzn_category\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"cid\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227503'), ('76', '1', 'admin', '/admin/command/command.html?action=execute', '在线命令管理-生成并执行命令', '{\"action\":\"execute\",\"commandtype\":\"crud\",\"menu\":\"1\",\"isrelation\":\"1\",\"force\":\"1\",\"table\":\"yzn_category_score\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"relation\":{\"2\":{\"relation\":\"yzn_category\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"cid\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227504'), ('77', '1', 'admin', '/admin/command/execute.html?ids=1', '在线命令管理-再次执行命令', '{\"ids\":\"1\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227520'), ('78', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227538'), ('79', '1', 'admin', '/admin/command/command.html?action=command', '在线命令管理-生成并执行命令', '{\"action\":\"command\",\"commandtype\":\"crud\",\"table\":\"yzn_admin\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227543'), ('80', '1', 'admin', '/admin/command/get_controller_list.html', '在线命令管理-未知(get_controller_list)', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227560'), ('81', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227574'), ('82', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227581'), ('83', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227583'), ('84', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227583'), ('85', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category_score\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227585'), ('86', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category_score\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227585'), ('87', '1', 'admin', '/admin/command/command.html?action=command', '在线命令管理-生成并执行命令', '{\"action\":\"command\",\"commandtype\":\"crud\",\"isrelation\":\"1\",\"table\":\"yzn_category\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227605'), ('88', '1', 'admin', '/admin/command/command.html?action=execute', '在线命令管理-生成并执行命令', '{\"action\":\"execute\",\"commandtype\":\"crud\",\"isrelation\":\"1\",\"table\":\"yzn_category\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227606'), ('89', '1', 'admin', '/admin/command/get_controller_list.html', '在线命令管理-未知(get_controller_list)', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227613'), ('90', '1', 'admin', '/admin/command/get_controller_list.html', '在线命令管理-未知(get_controller_list)', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227616'), ('91', '1', 'admin', '/admin/command/get_controller_list.html', '在线命令管理-未知(get_controller_list)', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227624'), ('92', '1', 'admin', '/admin/command/get_controller_list.html', '在线命令管理-未知(get_controller_list)', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227627'), ('93', '1', 'admin', '/admin/command/command.html?action=command', '在线命令管理-生成并执行命令', '{\"action\":\"command\",\"commandtype\":\"menu\",\"controllerfile_text\":\"\",\"controllerfile\":\"Category.php,category\\/Score.php\",\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227632'), ('94', '1', 'admin', '/admin/command/command.html?action=execute', '在线命令管理-生成并执行命令', '{\"action\":\"execute\",\"commandtype\":\"menu\",\"controllerfile_text\":\"\",\"controllerfile\":\"Category.php,category\\/Score.php\",\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227636'), ('95', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227659'), ('96', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_category\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227663'), ('97', '1', 'admin', '/admin/command/command.html?action=command', '在线命令管理-生成并执行命令', '{\"action\":\"command\",\"commandtype\":\"crud\",\"force\":\"1\",\"table\":\"yzn_category\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227669'), ('98', '1', 'admin', '/admin/command/command.html?action=execute', '在线命令管理-生成并执行命令', '{\"action\":\"execute\",\"commandtype\":\"crud\",\"force\":\"1\",\"table\":\"yzn_category\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227671'), ('99', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227903'), ('100', '1', 'admin', '/admin/command/get_controller_list.html', '在线命令管理-未知(get_controller_list)', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227906'), ('101', '1', 'admin', '/admin/command/get_controller_list.html', '在线命令管理-未知(get_controller_list)', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227907'), ('102', '1', 'admin', '/admin/command/command.html?action=command', '在线命令管理-生成并执行命令', '{\"action\":\"command\",\"commandtype\":\"menu\",\"controllerfile_text\":\"\",\"controllerfile\":\"Category.php\",\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227912'), ('103', '1', 'admin', '/admin/command/command.html?action=execute', '在线命令管理-生成并执行命令', '{\"action\":\"execute\",\"commandtype\":\"menu\",\"controllerfile_text\":\"\",\"controllerfile\":\"Category.php\",\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721227914'), ('104', '1', 'admin', '/admin/auth.rule/add.html?dialog=1', '菜单管理-新增', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"parentid\":\"0\",\"name\":\"category.index\",\"title\":\"分类管理\",\"url\":\"category.index\",\"icon\":\"icon-donut-chart-line\",\"condition\":\"\",\"menutype\":\"_iframe\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228018'), ('105', '1', 'admin', '/admin/auth.rule/edit.html?id=150&dialog=1', '菜单管理-编辑', '{\"id\":\"150\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"0\",\"parentid\":\"161\",\"name\":\"category\\/index\",\"title\":\"查看\",\"url\":\"\",\"icon\":\"iconfont icon-circle-line\",\"condition\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\",\"id\":\"150\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228042'), ('106', '1', 'admin', '/admin/auth.rule/edit.html?id=161&dialog=1', '菜单管理-编辑', '{\"id\":\"161\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"parentid\":\"149\",\"name\":\"category.index\",\"title\":\"分类管理\",\"url\":\"category.index\",\"icon\":\"iconfont icon-donut-chart-line\",\"condition\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\",\"id\":\"161\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228062'), ('107', '1', 'admin', '/admin/auth.rule/edit.html?id=149&dialog=1', '菜单管理-编辑', '{\"id\":\"149\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"parentid\":\"0\",\"name\":\"category\",\"title\":\"量表分类管理\",\"url\":\"category.manager\",\"icon\":\"iconfont icon-map-2-line\",\"condition\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\",\"id\":\"149\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228125'), ('108', '1', 'admin', '/admin/auth.rule/edit.html?id=161&dialog=1', '菜单管理-编辑', '{\"id\":\"161\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"parentid\":\"149\",\"name\":\"category\",\"title\":\"分类管理\",\"url\":\"category.index\",\"icon\":\"iconfont iconfont icon-donut-chart-line\",\"condition\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\",\"id\":\"161\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228139'), ('109', '1', 'admin', '/admin/auth.rule/edit.html?id=149&dialog=1', '菜单管理-编辑', '{\"id\":\"149\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"parentid\":\"0\",\"name\":\"category.manager\",\"title\":\"量表分类管理\",\"url\":\"category.manager\",\"icon\":\"iconfont iconfont icon-map-2-line\",\"condition\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\",\"id\":\"149\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228153'), ('110', '1', 'admin', '/admin/auth.rule/edit.html?id=161&dialog=1', '菜单管理-编辑', '{\"id\":\"161\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"parentid\":\"149\",\"name\":\"category\",\"title\":\"分类管理\",\"url\":\"category\",\"icon\":\"iconfont iconfont icon-donut-chart-line\",\"condition\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\",\"id\":\"161\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228164'), ('111', '1', 'admin', '/admin/auth.rule/edit.html?id=151&dialog=1', '菜单管理-编辑', '{\"id\":\"151\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"0\",\"parentid\":\"161\",\"name\":\"category\\/add\",\"title\":\"添加\",\"url\":\"\",\"icon\":\"iconfont icon-circle-line\",\"condition\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\",\"id\":\"151\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228175'), ('112', '1', 'admin', '/admin/auth.rule/edit.html?id=152&dialog=1', '菜单管理-编辑', '{\"id\":\"152\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"0\",\"parentid\":\"161\",\"name\":\"category\\/edit\",\"title\":\"编辑\",\"url\":\"\",\"icon\":\"iconfont icon-circle-line\",\"condition\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\",\"id\":\"152\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228183'), ('113', '1', 'admin', '/admin/auth.rule/edit.html?id=153&dialog=1', '菜单管理-编辑', '{\"id\":\"153\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"0\",\"parentid\":\"161\",\"name\":\"category\\/del\",\"title\":\"删除\",\"url\":\"\",\"icon\":\"iconfont icon-circle-line\",\"condition\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\",\"id\":\"153\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228194'), ('114', '1', 'admin', '/admin/auth.rule/edit.html?id=154&dialog=1', '菜单管理-编辑', '{\"id\":\"154\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"0\",\"parentid\":\"161\",\"name\":\"category\\/multi\",\"title\":\"批量更新\",\"url\":\"\",\"icon\":\"iconfont icon-circle-line\",\"condition\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\",\"id\":\"154\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228206'), ('115', '1', 'admin', '/admin/auth.rule/del.html?id=161', '菜单管理-删除', '{\"id\":\"161\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228338'), ('116', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228358'), ('117', '1', 'admin', '/admin/command/get_controller_list.html', '在线命令管理-未知(get_controller_list)', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228361'), ('118', '1', 'admin', '/admin/command/get_controller_list.html', '在线命令管理-未知(get_controller_list)', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228362'), ('119', '1', 'admin', '/admin/command/command.html?action=command', '在线命令管理-生成并执行命令', '{\"action\":\"command\",\"commandtype\":\"menu\",\"controllerfile_text\":\"\",\"controllerfile\":\"Category.php\",\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228370'), ('120', '1', 'admin', '/admin/command/command.html?action=execute', '在线命令管理-生成并执行命令', '{\"action\":\"execute\",\"commandtype\":\"menu\",\"controllerfile_text\":\"\",\"controllerfile\":\"Category.php\",\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228371'), ('121', '1', 'admin', '/admin/auth.rule/edit.html?id=162&dialog=1', '菜单管理-编辑', '{\"id\":\"162\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"parentid\":\"149\",\"name\":\"category\",\"title\":\"量表分类\",\"url\":\"\",\"icon\":\"iconfont icon-other\",\"condition\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\",\"id\":\"162\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228414'), ('122', '1', 'admin', '/admin/auth.rule/edit.html?id=155&dialog=1', '菜单管理-编辑', '{\"id\":\"155\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"parentid\":\"149\",\"name\":\"category.score\",\"title\":\"分数结论管理\",\"url\":\"\",\"icon\":\"iconfont icon-other\",\"condition\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\",\"id\":\"155\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228459'), ('123', '1', 'admin', '/admin/category.score/add.html?dialog=1', '分数结论管理-添加', '{\"dialog\":\"1\",\"row\":{\"cid\":\"1\",\"score_start\":\"0\",\"score_end\":\"20\",\"result\":\"aaaaaa\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228489'), ('124', '1', 'admin', '/admin/category/edit.html?id=1&dialog=1', '量表分类-编辑', '{\"id\":\"1\",\"dialog\":\"1\",\"row\":{\"name\":\"匹兹堡睡眠质量指数（PSQI）\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721228799'), ('125', '1', 'admin', '/admin/category.score/add.html?dialog=1', '分数结论管理-添加', '{\"dialog\":\"1\",\"cid\":\"1\",\"row\":{\"score_start\":\"60\",\"score_end\":\"70\",\"result\":\"bbbb\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721229666'), ('126', '1', 'admin', '/admin/category.score/add.html?dialog=1', '分数结论管理-添加', '{\"dialog\":\"1\",\"cid\":\"1\",\"row\":{\"score_start\":\"60\",\"score_end\":\"70\",\"result\":\"bbbb\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721229695'), ('127', '1', 'admin', '/admin/category.score/add.html?dialog=1', '分数结论管理-添加', '{\"dialog\":\"1\",\"row\":{\"cid\":\"1\",\"score_start\":\"70\",\"score_end\":\"80\",\"result\":\"dddd\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721229740'), ('128', '1', 'admin', '/admin/category.score/del.html?id=2', '分数结论管理-删除', '{\"id\":\"2\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721229777'), ('129', '1', 'admin', '/admin/category.score/del.html?id=3', '分数结论管理-删除', '{\"id\":\"3\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721229780');
COMMIT;

-- ----------------------------
--  Table structure for `yzn_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_attachment`;
CREATE TABLE `yzn_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '类别',
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件链接',
  `mime` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `ext` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '上传驱动',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '上传时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `listorders` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='附件表';

-- ----------------------------
--  Records of `yzn_attachment`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_attachment` VALUES ('1', '', '1', '0', 'logo.png', '/uploads/images/20240717/5e4bbd3844866f74473cfaa3e3d1163c.png', '', '', 'image/png', 'png', '7904', '5e4bbd3844866f74473cfaa3e3d1163c', '08cad4a31b13874e24428c9f07d8c878fb9a976c', 'local', '1721210230', '1721210230', '100', '1');
COMMIT;

-- ----------------------------
--  Table structure for `yzn_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_auth_group`;
CREATE TABLE `yzn_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `parentid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `title` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述信息',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限组表';

-- ----------------------------
--  Records of `yzn_auth_group`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_auth_group` VALUES ('1', '0', '超级管理员', '拥有所有权限', '*', '1'), ('2', '1', '编辑', '编辑', '1,10,23,24,25,26,27', '1');
COMMIT;

-- ----------------------------
--  Table structure for `yzn_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_auth_rule`;
CREATE TABLE `yzn_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图标',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则URL',
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '条件',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `menutype` enum('_iframe','_blank','_layer') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单类型',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '扩展属性',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `parentid` (`parentid`),
  KEY `listorder` (`listorder`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='节点表';

-- ----------------------------
--  Records of `yzn_auth_rule`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_auth_rule` VALUES ('1', '0', 'general', '常规管理', 'iconfont icon-setup', '', '', '', '1', null, '', '1691377129', '1691377129', '999', '1'), ('2', '0', 'addons', '插件管理', 'iconfont icon-equalizer-line', '', '', '', '1', null, '', '1691377129', '1691377129', '777', '1'), ('4', '1', 'general.profile', '个人资料', 'iconfont icon-user-line', '', '', '', '1', null, '', '1691377129', '1691377129', '0', '1'), ('5', '4', 'general.profile/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('6', '4', 'general.profile/update', '资料更新', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('10', '1', 'general.config', '配置管理', 'iconfont icon-apartment', '', '', '', '1', null, '', '1691377129', '1691377129', '999', '1'), ('11', '1', 'general.config/setting', '网站设置', 'iconfont icon-setup', '', '', '', '1', null, '', '1691377129', '1691377129', '888', '1'), ('12', '28', 'auth.rule', '菜单管理', 'iconfont icon-other', '', '', '', '1', null, '', '1691377129', '1691377129', '666', '1'), ('13', '1', 'general.attachments', '附件管理', 'iconfont icon-accessory', '', '', '', '1', null, '', '1691377129', '1691377129', '666', '1'), ('14', '13', 'general.attachments/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('15', '13', 'general.attachments/del', '删除', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('16', '13', 'general.attachments/getUrlFile', '图片本地化', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('17', '13', 'general.attachments/select', '图片选择', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('18', '12', 'auth.rule/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('19', '12', 'auth.rule/add', '新增', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('20', '12', 'auth.rule/edit', '编辑', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('21', '12', 'auth.rule/del', '删除', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('22', '12', 'auth.rule/multi', '批量更新', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('23', '10', 'general.config/add', '新增', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('24', '10', 'general.config/edit', '编辑', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('25', '10', 'general.config/del', '删除', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('26', '10', 'general.config/multi', '批量更新', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('27', '10', 'general.config/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('28', '0', 'auth', '权限管理', 'iconfont icon-user-settings-line', '', '', '', '1', null, '', '1691377129', '1691377129', '888', '1'), ('29', '28', 'auth.manager', '管理员管理', 'iconfont icon-user-settings-line', '', '', '', '1', null, '', '1691377129', '1691377129', '999', '1'), ('30', '29', 'auth.manager/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('31', '29', 'auth.manager/edit', '编辑', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('32', '29', 'auth.manager/del', '删除', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('33', '29', 'auth.manager/add', '新增', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('34', '28', 'auth.adminlog', '管理日志', 'iconfont icon-history', '', '', '', '1', null, '', '1691377129', '1691377129', '888', '1'), ('35', '34', 'auth.adminlog/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('36', '34', 'auth.adminlog/deletelog', '删除', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('37', '28', 'auth.group', '角色管理', 'iconfont icon-user-shared-2-line', '', '', '', '1', null, '', '1691377129', '1691377129', '777', '1'), ('38', '37', 'auth.group/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('39', '37', 'auth.group/add', '新增', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('40', '37', 'auth.group/edit', '编辑', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('41', '37', 'auth.group/del', '删除', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('42', '37', 'auth.group/access', '访问授权', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('45', '2', 'addons/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('46', '2', 'addons/config', '配置', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('49', '2', 'addons/state', '禁用启用', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('50', '0', 'command', '在线命令管理', 'iconfont icon-code-s-slash-fill', '', '', '', '1', null, '', '1721225174', '1721225174', '0', '1'), ('51', '50', 'command/index', '查看', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721225174', '1721225174', '0', '1'), ('52', '50', 'command/add', '添加', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721225174', '1721225174', '0', '1'), ('53', '50', 'command/detail', '详情', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721225174', '1721225174', '0', '1'), ('54', '50', 'command/command', '生成并执行命令', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721225174', '1721225174', '0', '1'), ('55', '50', 'command/execute', '再次执行命令', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721225174', '1721225174', '0', '1'), ('56', '50', 'command/del', '删除', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721225174', '1721225174', '0', '1'), ('57', '50', 'command/multi', '批量更新', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721225174', '1721225174', '0', '1'), ('149', '0', 'category.manager', '量表分类管理', 'iconfont iconfont iconfont icon-map-2-line', 'category.manager', '', '', '1', '_iframe', '', '1721227403', '1721228153', '0', '1'), ('155', '149', 'category.score', '分数结论管理', 'iconfont iconfont icon-other', '', '', '', '1', null, '', '1721227636', '1721228459', '0', '1'), ('156', '155', 'category.score/index', '查看', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721227636', '1721227636', '0', '1'), ('157', '155', 'category.score/add', '添加', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721227636', '1721227636', '0', '1'), ('158', '155', 'category.score/edit', '编辑', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721227636', '1721227636', '0', '1'), ('159', '155', 'category.score/del', '删除', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721227636', '1721227636', '0', '1'), ('160', '155', 'category.score/multi', '批量更新', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721227636', '1721227636', '0', '1'), ('162', '149', 'category', '量表分类', 'iconfont iconfont icon-other', '', '', '', '1', null, '', '1721228371', '1721228414', '0', '1'), ('163', '162', 'category/index', '查看', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721228371', '1721228371', '0', '1'), ('164', '162', 'category/add', '添加', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721228371', '1721228371', '0', '1'), ('165', '162', 'category/edit', '编辑', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721228371', '1721228371', '0', '1'), ('166', '162', 'category/del', '删除', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721228371', '1721228371', '0', '1'), ('167', '162', 'category/multi', '批量更新', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721228371', '1721228371', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `yzn_cache`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_cache`;
CREATE TABLE `yzn_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '缓存KEY值',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `module` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模块名称',
  `model` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模型名称',
  `action` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '方法名',
  `system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否系统',
  PRIMARY KEY (`id`),
  KEY `ckey` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='缓存列队表';

-- ----------------------------
--  Records of `yzn_cache`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_cache` VALUES ('1', 'Model', '模型列表', 'admin', 'Models', 'model_cache', '1'), ('2', 'ModelField', '模型字段', 'admin', 'ModelField', 'model_field_cache', '1');
COMMIT;

-- ----------------------------
--  Table structure for `yzn_category`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_category`;
CREATE TABLE `yzn_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `yzn_category`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_category` VALUES ('1', '匹兹堡睡眠质量指数（PSQI）');
COMMIT;

-- ----------------------------
--  Table structure for `yzn_category_score`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_category_score`;
CREATE TABLE `yzn_category_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `score_start` int(11) NOT NULL COMMENT '分段边界值起始',
  `score_end` int(11) NOT NULL COMMENT '分段边界值结束',
  `result` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `yzn_category_score`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_category_score` VALUES ('1', '1', '0', '20', 'aaaaaa'), ('4', '1', '70', '80', 'dddd');
COMMIT;

-- ----------------------------
--  Table structure for `yzn_command`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_command`;
CREATE TABLE `yzn_command` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '命令',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '返回结果',
  `execute_time` int(10) unsigned DEFAULT NULL COMMENT '执行时间',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0失败,1正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='在线命令表';

-- ----------------------------
--  Records of `yzn_command`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_command` VALUES ('1', 'crud', '[\"--menu=1\",\"--table=yzn_category\",\"--relation=yzn_category_score\",\"--relationmode=belongsto\",\"--relationforeignkey=id\",\"--relationprimarykey=cid\",\"--relationfields=score_end,score_start,result\"]', 'php think crud --menu=1 --table=yzn_category --relation=yzn_category_score --relationmode=belongsto --relationforeignkey=id --relationprimarykey=cid --relationfields=score_end,score_start,result', 'Build Successed', '1721226731', '1721226731', '1721226731', '1'), ('2', 'crud', '[\"--table=yzn_category_score\",\"--relation=yzn_category\",\"--relationmode=belongsto\",\"--relationforeignkey=cid\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --table=yzn_category_score --relation=yzn_category --relationmode=belongsto --relationforeignkey=cid --relationprimarykey=id --relationfields=name', 'Build Successed', '1721227467', '1721227467', '1721227467', '1'), ('3', 'crud', '[\"--menu=1\",\"--force=1\",\"--table=yzn_category_score\",\"--relation=yzn_category\",\"--relationmode=belongsto\",\"--relationforeignkey=cid\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --menu=1 --force=1 --table=yzn_category_score --relation=yzn_category --relationmode=belongsto --relationforeignkey=cid --relationprimarykey=id --relationfields=name', 'Build Successed', '1721227504', '1721227504', '1721227504', '1'), ('4', 'crud', '[\"--menu=1\",\"--table=yzn_category\",\"--relation=yzn_category_score\",\"--relationmode=belongsto\",\"--relationforeignkey=id\",\"--relationprimarykey=cid\",\"--relationfields=score_end,score_start,result\"]', 'php think crud --menu=1 --table=yzn_category --relation=yzn_category_score --relationmode=belongsto --relationforeignkey=id --relationprimarykey=cid --relationfields=score_end,score_start,result', 'controller already exists!\nIf you need to rebuild again, use the parameter --force=true', '1721227520', '1721227520', '1721227520', '0'), ('5', 'crud', '[\"--table=yzn_category\"]', 'php think crud --table=yzn_category', 'controller already exists!\nIf you need to rebuild again, use the parameter --force=true', '1721227606', '1721227606', '1721227606', '0'), ('6', 'menu', '[\"--controller=Category\",\"--controller=category\\/Score\"]', 'php think menu --controller=Category --controller=category/Score', 'Build Successed!', '1721227636', '1721227636', '1721227636', '1'), ('7', 'crud', '[\"--force=1\",\"--table=yzn_category\"]', 'php think crud --force=1 --table=yzn_category', 'Build Successed', '1721227671', '1721227671', '1721227671', '1'), ('8', 'menu', '[\"--controller=Category\"]', 'php think menu --controller=Category', 'Build Successed!', '1721227914', '1721227914', '1721227914', '1'), ('9', 'menu', '[\"--controller=Category\"]', 'php think menu --controller=Category', 'Build Successed!', '1721228371', '1721228371', '1721228371', '1');
COMMIT;

-- ----------------------------
--  Table structure for `yzn_config`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_config`;
CREATE TABLE `yzn_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置类型',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置分组',
  `options` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置项',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  `visible` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '可见条件',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '扩展属性',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='网站配置';

-- ----------------------------
--  Records of `yzn_config`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_config` VALUES ('1', 'web_site_icp', 'text', '备案信息', 'base', '', '', '1551244923', '1551244971', '1', '', '', '', '1'), ('2', 'web_site_statistics', 'textarea', '站点代码', 'base', '', '', '1551244957', '1551244957', '1', '', '', '', '100'), ('3', 'config_group', 'array', '配置分组', 'system', '', '', '1494408414', '1494408414', '1', '{\"base\":\"基础\",\"system\":\"系统\",\"upload\":\"上传\",\"develop\":\"开发\"}', '', '', '0'), ('4', 'theme', 'text', '主题风格', 'system', '', '', '1541752781', '1541756888', '1', 'default', '', '', '1'), ('5', 'admin_forbid_ip', 'textarea', '后台禁止访问IP', 'system', '', '匹配IP段用\"*\"占位，如192.168.*.*，多个IP地址请用英文逗号\",\"分割', '1551244957', '1551244957', '1', '', '', '', '2'), ('6', 'upload_image_size', 'text', '图片上传大小限制', 'upload', '', '0为不限制大小，单位：kb', '1540457656', '1552436075', '1', '0', '', '', '2'), ('7', 'upload_image_ext', 'text', '允许上传图片后缀', 'upload', '', '多个后缀用逗号隔开，不填写则不限制类型', '1540457657', '1552436074', '1', 'gif,jpg,jpeg,bmp,png', '', '', '1'), ('8', 'upload_file_size', 'text', '文件上传大小限制', 'upload', '', '0为不限制大小，单位：kb', '1540457658', '1552436078', '1', '0', '', '', '3'), ('9', 'upload_file_ext', 'text', '允许上传文件后缀', 'upload', '', '多个后缀用逗号隔开，不填写则不限制类型', '1540457659', '1552436080', '1', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z', '', '', '4'), ('10', 'upload_driver', 'radio', '上传驱动', 'upload', 'local:本地', '图片或文件上传驱动', '1541752781', '1552436085', '1', 'local', '', '', '9'), ('11', 'upload_thumb_water', 'switch', '添加水印', 'upload', '', '', '1552435063', '1552436080', '1', '0', '', '', '5'), ('12', 'upload_thumb_water_pic', 'image', '水印图片', 'upload', '', '只有开启水印功能才生效', '1552435183', '1552436081', '1', '', '', '', '6'), ('13', 'upload_thumb_water_position', 'radio', '水印位置', 'upload', '1:左上角\r\n2:上居中\r\n3:右上角\r\n4:左居中\r\n5:居中\r\n6:右居中\r\n7:左下角\r\n8:下居中\r\n9:右下角', '只有开启水印功能才生效', '1552435257', '1552436082', '1', '9', '', '', '7'), ('14', 'upload_thumb_water_alpha', 'text', '水印透明度', 'upload', '', '请输入0~100之间的数字，数字越小，透明度越高', '1552435299', '1552436083', '1', '50', '', '', '8'), ('15', 'web_logo', 'image', 'LOGO', 'upload', '', '', '1721209954', '1721209954', '1', '/uploads/images/20240717/5e4bbd3844866f74473cfaa3e3d1163c.png', '', '', '100');
COMMIT;

-- ----------------------------
--  Table structure for `yzn_download`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_download`;
CREATE TABLE `yzn_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `flag` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '属性',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'SEO关键词',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'SEO描述',
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Tags标签',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户名',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否后台添加',
  `hits` mediumint(8) unsigned DEFAULT '0' COMMENT '点击量',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`catid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='下载模型模型表';

-- ----------------------------
--  Table structure for `yzn_download_data`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_download_data`;
CREATE TABLE `yzn_download_data` (
  `did` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '内容',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='下载模型模型表';

-- ----------------------------
--  Table structure for `yzn_ems`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_ems`;
CREATE TABLE `yzn_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作IP',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮箱验证码表';

-- ----------------------------
--  Table structure for `yzn_field_type`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_field_type`;
CREATE TABLE `yzn_field_type` (
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段类型',
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '中文类型名',
  `listorder` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `default_define` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '默认定义',
  `ifoption` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要设置选项',
  `ifstring` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否自由字符',
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字段类型表';

-- ----------------------------
--  Records of `yzn_field_type`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_field_type` VALUES ('array', '数组', '7', 'varchar(512) NOT NULL', '0', '0'), ('checkbox', '复选框', '2', 'varchar(32) NOT NULL', '1', '0'), ('city', '城市地区', '22', 'varchar(255) NOT NULL', '0', '0'), ('color', '颜色值', '21', 'varchar(7) NOT NULL', '0', '0'), ('custom', '自定义', '23', 'text NOT NULL', '1', '0'), ('datetime', '日期和时间', '15', 'int(10) UNSIGNED NOT NULL', '0', '0'), ('datetimerange', '日期和时间区间', '16', 'varchar(100) NOT NULL', '0', '0'), ('file', '单文件', '20', 'varchar(255) NOT NULL', '0', '0'), ('files', '多文件', '19', 'text NOT NULL', '0', '0'), ('image', '单张图', '11', 'varchar(255) NOT NULL', '0', '0'), ('images', '多张图', '12', 'text NOT NULL', '0', '0'), ('markdown', 'markdown编辑器', '18', 'mediumtext NOT NULL', '0', '1'), ('number', '数字', '14', 'int(10) UNSIGNED NOT NULL', '0', '0'), ('password', '密码', '4', 'varchar(255) NOT NULL', '0', '1'), ('radio', '单选按钮', '5', 'char(10) NOT NULL', '1', '0'), ('select', '下拉框', '8', 'char(10) NOT NULL', '1', '0'), ('selectpage', '高级下拉框', '10', 'varchar(32) NOT NULL', '1', '0'), ('selects', '下拉框(多选)', '9', 'varchar(32) NOT NULL', '1', '0'), ('switch', '开关', '6', 'tinyint(2) UNSIGNED NOT NULL', '0', '0'), ('tags', '标签', '13', 'varchar(255) NOT NULL', '0', '1'), ('text', '输入框', '1', 'varchar(255) NOT NULL', '0', '1'), ('textarea', '多行文本', '3', 'varchar(255) NOT NULL', '0', '1'), ('Ueditor', '百度编辑器', '17', 'mediumtext NOT NULL', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `yzn_picture`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_picture`;
CREATE TABLE `yzn_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `flag` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '属性',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'SEO关键词',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'SEO描述',
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Tags标签',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户名',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否后台添加',
  `hits` mediumint(8) unsigned DEFAULT '0' COMMENT '点击量',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`catid`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='图片模型模型表';

-- ----------------------------
--  Records of `yzn_picture`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_picture` VALUES ('1', '4', 'ISO9001证书', '', '', '', '', '', '100', '1', 'admin', '1', '0', '1550552511', '1550554247', '', '1'), ('2', '4', 'ISO14001证书', '', '', '', '', '', '100', '1', 'admin', '1', '0', '1550554284', '1550554288', '', '1'), ('3', '4', 'OHSAS18001证书', '', '', '', '', '', '100', '1', 'admin', '1', '0', '1550554298', '1550554301', '', '1'), ('4', '4', '企业信用等级评价', '', '', '', '', '', '100', '1', 'admin', '1', '0', '1550554307', '1550554309', '', '1'), ('5', '4', '企业荣誉证书', '', '', '', '', '', '100', '1', 'admin', '1', '0', '1550554314', '1550554316', '', '1');
COMMIT;

-- ----------------------------
--  Table structure for `yzn_picture_data`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_picture_data`;
CREATE TABLE `yzn_picture_data` (
  `did` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '内容',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='图片模型模型表';

-- ----------------------------
--  Table structure for `yzn_sms`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_sms`;
CREATE TABLE `yzn_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作IP',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信验证码表';

SET FOREIGN_KEY_CHECKS = 1;
