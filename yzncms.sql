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

 Date: 07/20/2024 16:52:27 PM
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
INSERT INTO `yzn_admin` VALUES ('1', 'admin', '464f2f1f6c5f2cf22ad28496f2e47c81', '1', 'dec270', 'conn', '1721224825', '0', '1546940765', '1721224825', '172.18.0.1', 'admin@admin.com', '', '3d14bb6a-26bd-4232-a0ed-9148905f241b', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志';

-- ----------------------------
--  Records of `yzn_adminlog`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_adminlog` VALUES ('1', '1', 'admin', '/admin/general.config/add/groupType/base.html?dialog=1', '配置管理-新增', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"group\":\"base\",\"type\":\"switch\",\"title\":\"问卷结论前台显示开关\",\"name\":\"web_site_survey_result_display\",\"value\":\"1\",\"options\":\"\",\"visible\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"100\",\"status\":\"1\"},\"groupType\":\"base\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721382859'), ('2', '1', 'admin', '/admin/general.config/del.html?id=1', '配置管理-删除', '{\"id\":\"1\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721382895'), ('3', '1', 'admin', '/admin/general.config/del.html?id=2', '配置管理-删除', '{\"id\":\"2\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721382897'), ('4', '1', 'admin', '/admin/general.config/edit.html?id=17&dialog=1', '配置管理-编辑', '{\"id\":\"17\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"group\":\"base\",\"type\":\"switch\",\"title\":\"问卷结论显示开关\",\"name\":\"web_site_survey_result_display\",\"value\":\"1\",\"options\":\"\",\"visible\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"100\",\"id\":\"17\"}}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721382957'), ('5', '1', 'admin', '/admin/general.config/setting.html', '配置管理-网站设置', '{\"__token__\":\"***\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721382989'), ('6', '1', 'admin', '/admin/general.config/edit.html?id=17&dialog=1', '配置管理-编辑', '{\"id\":\"17\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"group\":\"base\",\"type\":\"switch\",\"title\":\"结论显示开关\",\"name\":\"web_site_survey_result_display\",\"value\":\"0\",\"options\":\"\",\"visible\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"100\",\"id\":\"17\"}}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721383029'), ('7', '1', 'admin', '/admin/general.attachments/del.html?id=2', '附件管理-删除', '{\"id\":\"2\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721383037'), ('8', '1', 'admin', '/admin/general.attachments/del.html?id=1', '附件管理-删除', '{\"id\":\"1\"}', '172.20.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '1721383040'), ('9', '1', 'admin', '/admin/auth.rule/multi.html', '菜单管理-批量更新', '{\"id\":\"175\",\"param\":\"status\",\"value\":\"0\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721392389'), ('10', '1', 'admin', '/admin/auth.rule/multi.html', '菜单管理-批量更新', '{\"id\":\"175\",\"param\":\"status\",\"value\":\"1\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721392390'), ('11', '1', 'admin', '/admin/question/edit.html?id=9&dialog=1', '试题列表-编辑', '{\"id\":{\"1\":\"34\",\"2\":\"35\",\"3\":\"36\",\"4\":\"37\"},\"dialog\":\"1\",\"qid\":\"9\",\"row\":{\"cid\":\"5\",\"type\":\"1\",\"title\":\"近1个月，通常每晚实际睡眠几个小时？(不等于卧床时间)\"},\"option\":{\"1\":\"＞7小时\",\"2\":\"6~7小时\",\"3\":\"5~6小时\",\"4\":\"＜5小时\"},\"score\":{\"1\":\"3\",\"2\":\"4\",\"3\":\"5\",\"4\":\"6\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721397299'), ('12', '1', 'admin', '/admin/question/edit.html?id=9&dialog=1', '试题列表-编辑', '{\"id\":{\"1\":\"34\",\"2\":\"35\",\"3\":\"36\",\"4\":\"37\"},\"dialog\":\"1\",\"qid\":\"9\",\"row\":{\"cid\":\"5\",\"type\":\"1\",\"title\":\"近1个月，通常每晚实际睡眠几个小时？(不等于卧床时间)\"},\"option\":{\"1\":\"＞7小时\",\"2\":\"6~7小时\",\"3\":\"5~6小时\",\"4\":\"＜5小时\"},\"score\":{\"1\":\"3\",\"2\":\"4\",\"3\":\"5\",\"4\":\"6\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721397377'), ('13', '1', 'admin', '/admin/question/edit.html?id=9&dialog=1', '试题列表-编辑', '{\"id\":{\"1\":\"34\",\"2\":\"35\",\"3\":\"36\",\"4\":\"37\"},\"dialog\":\"1\",\"qid\":\"9\",\"row\":{\"cid\":\"5\",\"type\":\"1\",\"title\":\"近1个月，通常每晚实际睡眠几个小时？(不等于卧床时间)\"},\"option\":{\"1\":\"＞7小时\",\"2\":\"6~7小时\",\"3\":\"5~6小时\",\"4\":\"＜5小时\"},\"score\":{\"1\":\"3\",\"2\":\"4\",\"3\":\"5\",\"4\":\"6\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721397545'), ('14', '1', 'admin', '/admin/question/edit.html?id=9&dialog=1', '试题列表-编辑', '{\"id\":{\"1\":\"34\",\"2\":\"35\",\"3\":\"36\",\"4\":\"37\"},\"dialog\":\"1\",\"qid\":\"9\",\"row\":{\"cid\":\"5\",\"type\":\"1\",\"title\":\"近1个月，通常每晚实际睡眠几个小时？(不等于卧床时间)\"},\"option\":{\"1\":\"＞7小时\",\"2\":\"6~7小时\",\"3\":\"5~6小时\",\"4\":\"＜5小时\"},\"score\":{\"1\":\"3\",\"2\":\"4\",\"3\":\"5\",\"4\":\"6\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721397634'), ('15', '1', 'admin', '/admin/question/edit.html?id=9&dialog=1', '试题列表-编辑', '{\"id\":{\"1\":\"34\",\"2\":\"35\",\"3\":\"36\",\"4\":\"37\"},\"dialog\":\"1\",\"qid\":\"9\",\"row\":{\"cid\":\"6\",\"type\":\"1\",\"title\":\"近1个月，通常每晚实际睡眠几个小时？(不等于卧床时间)\"},\"option\":{\"1\":\"＞7小时\",\"2\":\"6~7小时\",\"3\":\"5~6小时\",\"4\":\"＜5小时\"},\"score\":{\"1\":\"3\",\"2\":\"4\",\"3\":\"5\",\"4\":\"6\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721397643'), ('16', '1', 'admin', '/admin/question/edit.html?id=9&dialog=1', '试题列表-编辑', '{\"id\":{\"1\":\"34\",\"2\":\"35\",\"3\":\"36\",\"4\":\"37\"},\"dialog\":\"1\",\"qid\":\"9\",\"row\":{\"cid\":\"5\",\"type\":\"1\",\"title\":\"近1个月，通常每晚实际睡眠几个小时？(不等于卧床时间)\"},\"option\":{\"1\":\"＞7小时\",\"2\":\"6~7小时\",\"3\":\"5~6小时\",\"4\":\"＜5小时\"},\"score\":{\"1\":\"3\",\"2\":\"4\",\"3\":\"5\",\"4\":\"6\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721397651'), ('17', '1', 'admin', '/admin/general.config/setting.html', '配置管理-网站设置', '{\"__token__\":\"***\",\"row\":{\"web_site_survey_result_display\":\"0\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721398777'), ('18', '1', 'admin', '/admin/general.config/edit.html?id=17&dialog=1', '配置管理-编辑', '{\"id\":\"17\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"group\":\"base\",\"type\":\"switch\",\"title\":\"结论显示开关\",\"name\":\"web_site_survey_result_display\",\"value\":\"{&quot;1&quot;:&quot;开&quot;,&quot;0&quot;:&quot;关&quot;}\",\"options\":\"\",\"visible\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"100\",\"id\":\"17\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721398854'), ('19', '1', 'admin', '/admin/general.config/setting.html', '配置管理-网站设置', '{\"__token__\":\"***\",\"row\":{\"web_site_survey_result_display\":\"0\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721398860'), ('20', '1', 'admin', '/admin/general.config/setting.html', '配置管理-网站设置', '{\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721398863'), ('21', '1', 'admin', '/admin/general.config/setting.html', '配置管理-网站设置', '{\"__token__\":\"***\",\"row\":{\"web_site_survey_result_display\":\"0\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721398867'), ('22', '1', 'admin', '/admin/general.config/setting.html', '配置管理-网站设置', '{\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721398877'), ('23', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721444029'), ('24', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_user\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721444038'), ('25', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721444041'), ('26', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721444041'), ('27', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_survey\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721444044'), ('28', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_survey\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721444045'), ('29', '1', 'admin', '/admin/command/command.html?action=command', '在线命令管理-生成并执行命令', '{\"action\":\"command\",\"commandtype\":\"crud\",\"isrelation\":\"1\",\"table\":\"yzn_user\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"relation\":{\"2\":{\"relation\":\"yzn_survey\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"sid\",\"relationprimarykey\":\"id\",\"relationfields\":[\"survey_name\"]}},\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721444064'), ('30', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721444120'), ('31', '1', 'admin', '/admin/command/get_field_list.html', '在线命令管理-未知(get_field_list)', '{\"table\":\"yzn_admin\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721444120'), ('32', '1', 'admin', '/admin/command/command.html?action=command', '在线命令管理-生成并执行命令', '{\"action\":\"command\",\"commandtype\":\"crud\",\"menu\":\"1\",\"isrelation\":\"1\",\"table\":\"yzn_user\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"relation\":{\"2\":{\"relation\":\"yzn_survey\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"sid\",\"relationprimarykey\":\"id\",\"relationfields\":[\"survey_name\"]}},\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721444231'), ('33', '1', 'admin', '/admin/command/command.html?action=execute', '在线命令管理-生成并执行命令', '{\"action\":\"execute\",\"commandtype\":\"crud\",\"menu\":\"1\",\"isrelation\":\"1\",\"table\":\"yzn_user\",\"controller\":\"\",\"model\":\"\",\"fields\":\"\",\"relation\":{\"2\":{\"relation\":\"yzn_survey\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"sid\",\"relationprimarykey\":\"id\",\"relationfields\":[\"survey_name\"]}},\"__token__\":\"***\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721444239'), ('34', '1', 'admin', '/admin/auth.rule/edit.html?id=182&dialog=1', '菜单管理-编辑', '{\"id\":\"182\",\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"parentid\":\"175\",\"name\":\"user\",\"title\":\"提交记录\",\"url\":\"\",\"icon\":\"iconfont icon-other\",\"condition\":\"\",\"extend\":\"\",\"remark\":\"\",\"listorder\":\"0\",\"status\":\"1\",\"id\":\"182\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721444388'), ('35', '1', 'admin', '/admin/category/edit.html?id=1&dialog=1', '量表分类-编辑', '{\"id\":\"1\",\"dialog\":\"1\",\"row\":{\"name\":\"匹兹堡睡眠质量指数（PSQI）\",\"description\":\"匹兹堡睡眠质量指数（PSQI）\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721455444'), ('36', '1', 'admin', '/admin/category/edit.html?id=5&dialog=1', '量表分类-编辑', '{\"id\":\"5\",\"dialog\":\"1\",\"row\":{\"name\":\"失眠严重程度指数量表\",\"description\":\"失眠严重程度指数量表描述失眠严重程度指数量表描述失眠严重程度指数量表描述失眠严重程度指数量表描述\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721455463'), ('37', '1', 'admin', '/admin/category/edit.html?id=6&dialog=1', '量表分类-编辑', '{\"id\":\"6\",\"dialog\":\"1\",\"row\":{\"name\":\"睡眠个人信念和态度量表（DBAS-30）\",\"description\":\"睡眠个人信念和态度量表（DBAS-30）描述内容\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721455474'), ('38', '1', 'admin', '/admin/category/edit.html?id=7&dialog=1', '量表分类-编辑', '{\"id\":\"7\",\"dialog\":\"1\",\"row\":{\"name\":\"一般自我效能感量表\",\"description\":\"一般自我效能感量表描述内容\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721455485'), ('39', '1', 'admin', '/admin/category.score/add.html?dialog=1', '分数结论管理-添加', '{\"dialog\":\"1\",\"row\":{\"cid\":\"1\",\"score_start\":\"0\",\"score_end\":\"100\",\"result\":\"测试结论\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721462082'), ('40', '1', 'admin', '/admin/category/del.html?id=7', '量表分类-删除', '{\"id\":\"7\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721464779'), ('41', '1', 'admin', '/admin/category/del.html?id=6', '量表分类-删除', '{\"id\":\"6\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721464948'), ('42', '1', 'admin', '/admin/category.score/add.html?dialog=1', '分数结论管理-添加', '{\"dialog\":\"1\",\"row\":{\"cid\":\"5\",\"score_start\":\"0\",\"score_end\":\"100\",\"result\":\"失眠严重\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721464975'), ('43', '1', 'admin', '/admin/category.score/edit.html?id=1&dialog=1', '分数结论管理-编辑', '{\"id\":\"1\",\"dialog\":\"1\",\"row\":{\"cid\":\"1\",\"score_start\":\"0\",\"score_end\":\"100\",\"result\":\"睡眠质量低下\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721464991'), ('44', '1', 'admin', '/admin/question/edit.html?id=9&dialog=1', '试题列表-编辑', '{\"id\":{\"1\":\"34\",\"2\":\"35\",\"3\":\"36\",\"4\":\"37\"},\"dialog\":\"1\",\"qid\":\"9\",\"row\":{\"cid\":\"5\",\"type\":\"1\",\"title\":\"近1个月，通常每晚实际睡眠几个小时？(不等于卧床时间)\"},\"option\":{\"1\":\"＞7小时\",\"2\":\"6~7小时\",\"3\":\"5~6小时\",\"4\":\"＜5小时\"},\"score\":{\"1\":\"3\",\"2\":\"4\",\"3\":\"5\",\"4\":\"6\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721465003'), ('45', '1', 'admin', '/admin/question/edit.html?id=7&dialog=1', '试题列表-编辑', '{\"id\":{\"1\":\"27\",\"2\":\"28\",\"3\":\"29\",\"4\":\"0\",\"5\":\"0\",\"6\":\"0\"},\"dialog\":\"1\",\"qid\":\"7\",\"row\":{\"cid\":\"1\",\"type\":\"2\",\"title\":\"近1个月，通常几点钟上床睡觉？（24小时制）\"},\"option\":{\"1\":\"20:00\",\"2\":\"22:00\",\"3\":\"24:00\",\"4\":\"01:00\",\"5\":\"02:00\",\"6\":\"03:00\"},\"score\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"6\":\"6\"}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721465055'), ('46', '1', 'admin', '/admin/question/add.html?dialog=1', '试题列表-添加', '{\"dialog\":\"1\",\"row\":{\"cid\":\"1\",\"type\":\"3\",\"title\":\"失眠时都在做什么\"},\"num\":\"\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721465089'), ('47', '1', 'admin', '/admin/survey/del.html?id=7', '问卷列表-删除', '{\"id\":\"7\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721465103'), ('48', '1', 'admin', '/admin/survey/add.html?dialog=1', '问卷列表-添加', '{\"dialog\":\"1\",\"row\":{\"survey_name\":\"睡眠质量问卷调查\",\"user_name_display\":\"1\",\"user_name_required\":\"0\",\"user_id_display\":\"1\",\"user_id_required\":\"0\",\"user_sex_display\":\"1\",\"user_sex_required\":\"0\",\"user_birth_display\":\"1\",\"user_birth_required\":\"0\",\"user_department_display\":\"1\",\"user_department_required\":\"0\",\"categories\":[\"1\",\"5\"]}}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721465120'), ('49', '1', 'admin', '/admin/user/del.html?id=2', '提交记录-删除', '{\"id\":\"2\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '1721465145');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='附件表';

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
INSERT INTO `yzn_auth_group` VALUES ('1', '0', '超级管理员', '拥有所有权限', '*', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='节点表';

-- ----------------------------
--  Records of `yzn_auth_rule`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_auth_rule` VALUES ('1', '0', 'general', '常规管理', 'iconfont icon-setup', '', '', '', '1', null, '', '1691377129', '1691377129', '999', '1'), ('2', '0', 'addons', '插件管理', 'iconfont icon-equalizer-line', '', '', '', '1', null, '', '1691377129', '1721357233', '777', '0'), ('4', '1', 'general.profile', '个人资料', 'iconfont icon-user-line', '', '', '', '1', null, '', '1691377129', '1691377129', '0', '1'), ('5', '4', 'general.profile/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('6', '4', 'general.profile/update', '资料更新', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('10', '1', 'general.config', '配置管理', 'iconfont icon-apartment', '', '', '', '1', null, '', '1691377129', '1691377129', '999', '1'), ('11', '1', 'general.config/setting', '网站设置', 'iconfont icon-setup', '', '', '', '1', null, '', '1691377129', '1691377129', '888', '1'), ('12', '28', 'auth.rule', '菜单管理', 'iconfont icon-other', '', '', '', '1', null, '', '1691377129', '1691377129', '666', '1'), ('13', '1', 'general.attachments', '附件管理', 'iconfont icon-accessory', '', '', '', '1', null, '', '1691377129', '1691377129', '666', '1'), ('14', '13', 'general.attachments/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('15', '13', 'general.attachments/del', '删除', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('16', '13', 'general.attachments/getUrlFile', '图片本地化', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('17', '13', 'general.attachments/select', '图片选择', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('18', '12', 'auth.rule/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('19', '12', 'auth.rule/add', '新增', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('20', '12', 'auth.rule/edit', '编辑', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('21', '12', 'auth.rule/del', '删除', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('22', '12', 'auth.rule/multi', '批量更新', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('23', '10', 'general.config/add', '新增', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('24', '10', 'general.config/edit', '编辑', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('25', '10', 'general.config/del', '删除', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('26', '10', 'general.config/multi', '批量更新', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('27', '10', 'general.config/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('28', '0', 'auth', '权限管理', 'iconfont icon-user-settings-line', '', '', '', '1', null, '', '1691377129', '1691377129', '888', '1'), ('29', '28', 'auth.manager', '管理员管理', 'iconfont icon-user-settings-line', '', '', '', '1', null, '', '1691377129', '1691377129', '999', '1'), ('30', '29', 'auth.manager/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('31', '29', 'auth.manager/edit', '编辑', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('32', '29', 'auth.manager/del', '删除', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('33', '29', 'auth.manager/add', '新增', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('34', '28', 'auth.adminlog', '管理日志', 'iconfont icon-history', '', '', '', '1', null, '', '1691377129', '1691377129', '888', '1'), ('35', '34', 'auth.adminlog/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('36', '34', 'auth.adminlog/deletelog', '删除', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('37', '28', 'auth.group', '角色管理', 'iconfont icon-user-shared-2-line', '', '', '', '1', null, '', '1691377129', '1691377129', '777', '1'), ('38', '37', 'auth.group/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('39', '37', 'auth.group/add', '新增', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('40', '37', 'auth.group/edit', '编辑', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('41', '37', 'auth.group/del', '删除', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('42', '37', 'auth.group/access', '访问授权', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('45', '2', 'addons/index', '查看', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('46', '2', 'addons/config', '配置', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('49', '2', 'addons/state', '禁用启用', '', '', '', '', '0', null, '', '1691377129', '1691377129', '0', '1'), ('50', '0', 'command', '在线命令管理', 'iconfont icon-code-s-slash-fill', '', '', '', '1', null, '', '1721225174', '1721353887', '776', '1'), ('51', '50', 'command/index', '查看', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721225174', '1721225174', '0', '1'), ('52', '50', 'command/add', '添加', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721225174', '1721225174', '0', '1'), ('53', '50', 'command/detail', '详情', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721225174', '1721225174', '0', '1'), ('54', '50', 'command/command', '生成并执行命令', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721225174', '1721225174', '0', '1'), ('55', '50', 'command/execute', '再次执行命令', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721225174', '1721225174', '0', '1'), ('56', '50', 'command/del', '删除', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721225174', '1721225174', '0', '1'), ('57', '50', 'command/multi', '批量更新', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721225174', '1721225174', '0', '1'), ('149', '0', 'category.manager', '量表分类管理', 'iconfont iconfont iconfont icon-map-2-line', 'category.manager', '', '', '1', '_iframe', '', '1721227403', '1721353899', '10', '1'), ('155', '149', 'category.score', '分数结论管理', 'iconfont iconfont icon-other', '', '', '', '1', null, '', '1721227636', '1721228459', '0', '1'), ('156', '155', 'category.score/index', '查看', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721227636', '1721227636', '0', '1'), ('157', '155', 'category.score/add', '添加', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721227636', '1721227636', '0', '1'), ('158', '155', 'category.score/edit', '编辑', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721227636', '1721227636', '0', '1'), ('159', '155', 'category.score/del', '删除', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721227636', '1721227636', '0', '1'), ('160', '155', 'category.score/multi', '批量更新', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721227636', '1721227636', '0', '1'), ('162', '149', 'category', '量表分类', 'iconfont iconfont icon-other', '', '', '', '1', null, '', '1721228371', '1721228414', '0', '1'), ('163', '162', 'category/index', '查看', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721228371', '1721289877', '0', '1'), ('164', '162', 'category/add', '添加', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721228371', '1721289877', '0', '1'), ('165', '162', 'category/edit', '编辑', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721228371', '1721289877', '0', '1'), ('166', '162', 'category/del', '删除', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721228371', '1721289877', '0', '1'), ('167', '162', 'category/multi', '批量更新', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721228371', '1721289877', '0', '1'), ('168', '0', 'question.manager', '量表试题管理', 'iconfont iconfont icon-draft-fill', '', '', '', '1', '_iframe', '', '1721289572', '1721353905', '9', '1'), ('169', '174', 'question/index', '查看', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721290008', '1721290204', '0', '1'), ('170', '174', 'question/add', '添加', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721290008', '1721290204', '0', '1'), ('171', '174', 'question/edit', '编辑', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721290008', '1721290204', '0', '1'), ('172', '174', 'question/del', '删除', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721290008', '1721290204', '0', '1'), ('173', '174', 'question/multi', '批量更新', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721290008', '1721290204', '0', '1'), ('174', '168', 'question', '试题列表', 'iconfont iconfont iconfont icon-other', '', '', '', '1', null, '', '1721290204', '1721355819', '0', '1'), ('175', '0', 'survey.manager', '问卷管理', 'iconfont iconfont icon-file-list-3-line', '', '', '', '1', '_iframe', '', '1721353842', '1721392390', '8', '1'), ('176', '175', 'survey', '问卷列表', 'iconfont iconfont icon-other', '', '', '', '1', null, '', '1721355758', '1721355806', '0', '1'), ('177', '176', 'survey/index', '查看', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721355758', '1721355758', '0', '1'), ('178', '176', 'survey/add', '添加', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721355758', '1721355758', '0', '1'), ('179', '176', 'survey/edit', '编辑', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721355758', '1721355758', '0', '1'), ('180', '176', 'survey/del', '删除', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721355758', '1721355758', '0', '1'), ('181', '176', 'survey/multi', '批量更新', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721355758', '1721355758', '0', '1'), ('182', '175', 'user', '提交记录', 'iconfont iconfont icon-other', '', '', '', '1', null, '', '1721444239', '1721444388', '0', '1'), ('183', '182', 'user/index', '查看', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721444239', '1721444239', '0', '1'), ('184', '182', 'user/add', '添加', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721444239', '1721444239', '0', '1'), ('185', '182', 'user/edit', '编辑', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721444239', '1721444239', '0', '1'), ('186', '182', 'user/del', '删除', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721444239', '1721444239', '0', '1'), ('187', '182', 'user/multi', '批量更新', 'iconfont icon-circle-line', '', '', '', '0', null, '', '1721444239', '1721444239', '0', '1');
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
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '量表名称',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '量表描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='量表分类表';

-- ----------------------------
--  Records of `yzn_category`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_category` VALUES ('1', '匹兹堡睡眠质量指数（PSQI）', '<p>匹兹堡睡眠质量指数（PSQI）</p>'), ('5', '失眠严重程度指数量表', '<p>失眠严重程度指数量表描述</p><p><span style=\"text-wrap: wrap;\">失眠严重程度指数量表描述</span></p><p><span style=\"text-wrap: wrap;\"><span style=\"text-wrap: wrap;\">失眠严重程度指数量表描述</span></span></p><p><span style=\"text-wrap: wrap;\"><span style=\"text-wrap: wrap;\"><span style=\"text-wrap: wrap;\">失眠严重程度指数量表描述</span></span></span></p>');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='量表结论分数表';

-- ----------------------------
--  Records of `yzn_category_score`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_category_score` VALUES ('1', '1', '0', '100', '睡眠质量低下'), ('2', '5', '0', '100', '失眠严重');
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
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0失败,1正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='在线命令表';

-- ----------------------------
--  Records of `yzn_command`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_command` VALUES ('1', 'crud', '[\"--menu=1\",\"--table=yzn_user\",\"--relation=yzn_survey\",\"--relationmode=belongsto\",\"--relationforeignkey=sid\",\"--relationprimarykey=id\",\"--relationfields=survey_name\"]', 'php think crud --menu=1 --table=yzn_user --relation=yzn_survey --relationmode=belongsto --relationforeignkey=sid --relationprimarykey=id --relationfields=survey_name', 'Build Successed', '1721444239', '1721444239', '1721444239', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='网站配置';

-- ----------------------------
--  Records of `yzn_config`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_config` VALUES ('3', 'config_group', 'array', '配置分组', 'system', '', '', '1494408414', '1494408414', '1', '{\"base\":\"基础\",\"system\":\"系统\",\"upload\":\"上传\",\"develop\":\"开发\"}', '', '', '0'), ('4', 'theme', 'text', '主题风格', 'system', '', '', '1541752781', '1541756888', '1', 'default', '', '', '1'), ('5', 'admin_forbid_ip', 'textarea', '后台禁止访问IP', 'system', '', '匹配IP段用\"*\"占位，如192.168.*.*，多个IP地址请用英文逗号\",\"分割', '1551244957', '1551244957', '1', '', '', '', '2'), ('6', 'upload_image_size', 'text', '图片上传大小限制', 'upload', '', '0为不限制大小，单位：kb', '1540457656', '1552436075', '1', '0', '', '', '2'), ('7', 'upload_image_ext', 'text', '允许上传图片后缀', 'upload', '', '多个后缀用逗号隔开，不填写则不限制类型', '1540457657', '1552436074', '1', 'gif,jpg,jpeg,bmp,png', '', '', '1'), ('8', 'upload_file_size', 'text', '文件上传大小限制', 'upload', '', '0为不限制大小，单位：kb', '1540457658', '1552436078', '1', '0', '', '', '3'), ('9', 'upload_file_ext', 'text', '允许上传文件后缀', 'upload', '', '多个后缀用逗号隔开，不填写则不限制类型', '1540457659', '1552436080', '1', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z', '', '', '4'), ('10', 'upload_driver', 'radio', '上传驱动', 'upload', 'local:本地', '图片或文件上传驱动', '1541752781', '1552436085', '1', 'local', '', '', '9'), ('11', 'upload_thumb_water', 'switch', '添加水印', 'upload', '', '', '1552435063', '1552436080', '1', '0', '', '', '5'), ('12', 'upload_thumb_water_pic', 'image', '水印图片', 'upload', '', '只有开启水印功能才生效', '1552435183', '1552436081', '1', '', '', '', '6'), ('13', 'upload_thumb_water_position', 'radio', '水印位置', 'upload', '1:左上角\r\n2:上居中\r\n3:右上角\r\n4:左居中\r\n5:居中\r\n6:右居中\r\n7:左下角\r\n8:下居中\r\n9:右下角', '只有开启水印功能才生效', '1552435257', '1552436082', '1', '9', '', '', '7'), ('14', 'upload_thumb_water_alpha', 'text', '水印透明度', 'upload', '', '请输入0~100之间的数字，数字越小，透明度越高', '1552435299', '1552436083', '1', '50', '', '', '8'), ('15', 'web_logo', 'image', 'LOGO', 'upload', '', '', '1721209954', '1721209954', '1', '/uploads/images/20240717/5e4bbd3844866f74473cfaa3e3d1163c.png', '', '', '100'), ('17', 'web_site_survey_result_display', 'switch', '结论显示开关', 'base', '', '', '1721382859', '1721398854', '1', '0', '', '', '100');
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
  `sysadd` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否后台添加',
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
--  Table structure for `yzn_model`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_model`;
CREATE TABLE `yzn_model` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模型名称',
  `tablename` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表名',
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `setting` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置信息',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '模型类别：1-独立表，2-主附表',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `listorders` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='模型列表';

-- ----------------------------
--  Table structure for `yzn_model_field`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_model_field`;
CREATE TABLE `yzn_model_field` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '别名',
  `remark` tinytext COLLATE utf8mb4_unicode_ci COMMENT '字段提示',
  `pattern` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据校验正则',
  `errortips` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据校验未通过的提示信息',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字段类型',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '扩展信息',
  `setting` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '字段配置',
  `ifsystem` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否主表字段 1 是',
  `iscore` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否内部字段',
  `iffixed` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否固定不可修改',
  `ifrequire` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `ifsearch` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '作为搜索条件',
  `isadd` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '在投稿中显示',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='模型字段列表';

-- ----------------------------
--  Table structure for `yzn_options`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_options`;
CREATE TABLE `yzn_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `option_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '选项',
  `score` int(11) NOT NULL COMMENT '分数',
  `qid` int(11) NOT NULL COMMENT '问题ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='选项表';

-- ----------------------------
--  Records of `yzn_options`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_options` VALUES ('27', '20:00', '1', '7'), ('28', '22:00', '2', '7'), ('29', '24:00', '3', '7'), ('30', '15分钟之内', '2', '8'), ('31', '16~30分钟', '3', '8'), ('32', '31~60分钟', '4', '8'), ('33', '60分钟以上', '5', '8'), ('34', '＞7小时', '3', '9'), ('35', '6~7小时', '4', '9'), ('36', '5~6小时', '5', '9'), ('37', '＜5小时', '6', '9'), ('38', '01:00', '4', '7'), ('39', '02:00', '5', '7'), ('40', '03:00', '6', '7');
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
  `sysadd` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否后台添加',
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
--  Table structure for `yzn_question`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_question`;
CREATE TABLE `yzn_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `cid` int(11) NOT NULL COMMENT 'Category ID',
  `type` tinyint(4) NOT NULL COMMENT 'Type 1: Single Choice 2: Multiple Choice 3: Short answer',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='问题表';

-- ----------------------------
--  Records of `yzn_question`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_question` VALUES ('7', '1', '2', '近1个月，通常几点钟上床睡觉？（24小时制）'), ('8', '1', '1', '近1个月，从上床到入睡通常需要多少分钟？'), ('9', '5', '1', '近1个月，通常每晚实际睡眠几个小时？(不等于卧床时间)'), ('10', '1', '3', '失眠时都在做什么');
COMMIT;

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

-- ----------------------------
--  Table structure for `yzn_survey`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_survey`;
CREATE TABLE `yzn_survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='问卷表';

-- ----------------------------
--  Records of `yzn_survey`
-- ----------------------------
BEGIN;
INSERT INTO `yzn_survey` VALUES ('8', '/qrcode/abe6c216fdf7c484.png', '睡眠质量问卷调查', '', '0', '1', '0', '1', '0', '1', '0', '1', '0', '1', '2024-07-20 16:45:20', '1,5', 'abe6c216fdf7c484');
COMMIT;

-- ----------------------------
--  Table structure for `yzn_terms`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_terms`;
CREATE TABLE `yzn_terms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parentid` smallint(6) NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `module` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `setting` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '相关配置信息',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `module` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分类表';

-- ----------------------------
--  Table structure for `yzn_user`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_user`;
CREATE TABLE `yzn_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL COMMENT '问卷id',
  `user_name` varchar(50) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `birth` varchar(50) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `yzn_user_answer`
-- ----------------------------
DROP TABLE IF EXISTS `yzn_user_answer`;
CREATE TABLE `yzn_user_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `answer` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
