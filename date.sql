/*
Navicat MySQL Data Transfer

Source Server         : admin
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : admin

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-03-29 23:24:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `salt` varchar(255) NOT NULL COMMENT '盐',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>显示，0=>不显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', '0', 'admin', 'e4be4cf79617a7b72a0692dc0d05d18c', 'OstSqp7JM5', '0', '0', '1');
INSERT INTO `tb_admin` VALUES ('2', '1', 'test', 'e4be4cf79617a7b72a0692dc0d05d18c', 'OstSqp7JM5', '0', '1584242065', '1');
INSERT INTO `tb_admin` VALUES ('3', '0', 'admin2', 'e4be4cf79617a7b72a0692dc0d05d18c', 'OstSqp7JM5', '0', '0', '1');

-- ----------------------------
-- Table structure for tb_article
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text NOT NULL,
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `copyfrom` varchar(255) NOT NULL DEFAULT 'CLTPHP',
  `fromlink` varchar(255) NOT NULL DEFAULT 'http://www.cltphp.com/',
  PRIMARY KEY (`id`),
  KEY `status` (`id`,`status`,`sort`),
  KEY `catid` (`id`,`catid`,`status`),
  KEY `listorder` (`id`,`catid`,`status`,`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='文章模型';

-- ----------------------------
-- Records of tb_article
-- ----------------------------
INSERT INTO `tb_article` VALUES ('34', '52', '1', 'admin', '中国第17批赴黎维和部队组织首轮应急防卫演练', '', '', '', 'asd', '<p>　　沙漠能长水稻？日前，袁隆平带领技术团队，运用“四维改良”技术，在迪拜热带沙漠种植中国杂交水稻初获成功，让天方夜谭变成现实，作出改善沙漠生态环境、保障全球粮食安全的又一项中国贡献。<br/>　　挑战“不可能”，体现的是勇攀高峰的创新精神。近年来，正如习近平总书记所强调的，我国科技工作者“敢于走前人没走过的路”“勇于攻坚克难、追求卓越、赢得胜利”。从“天眼”探空到复兴号疾驰，从页岩气勘探到“海翼”号深海滑翔，一大批重要科技成果相继问世。依靠自主创新，不断提升产业核心竞争力，中国正走上高质量发展的宽广大道。<br/>　　科技创新永无止境，正如袁隆平所说，常常是“跳过一个高度，又有新的高度在等着你”，“要是不继续跳，早晚要落在别人后面”。敢于挑战“不可能”，矢志不移自主创新，创新主动权、发展主动权就会牢牢掌握在我们自己手中。</p>', '', '0', '1', '0', '', '0', '0', '0', '1529585334', '0', 'CLTPHP', 'http://www.cltphp.com/');

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `catname` varchar(255) NOT NULL DEFAULT '',
  `catdir` varchar(30) NOT NULL DEFAULT '',
  `parentdir` varchar(50) NOT NULL DEFAULT '',
  `p_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `moduleid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `module` char(24) NOT NULL DEFAULT '',
  `arrparentid` varchar(100) NOT NULL DEFAULT '',
  `arrchildid` varchar(100) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `keywords` varchar(200) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `image` varchar(100) NOT NULL DEFAULT '',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` varchar(100) NOT NULL DEFAULT '',
  `template_list` varchar(20) NOT NULL DEFAULT '',
  `template_show` varchar(20) NOT NULL DEFAULT '',
  `pagesize` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `listtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentid` (`p_id`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES ('41', '测试', 'cs', '', '0', '1', 'page', '0', '41', '0', '', '', '', '0', '0', '1', '0', '', '0', '', '', '', '0', '', '0', '0');
INSERT INTO `tb_category` VALUES ('42', '测试文章', 'cswz', '', '0', '2', 'article', '0', '42', '0', '', '', '', '0', '0', '1', '0', '', '0', '', '', '', '0', '', '0', '0');
INSERT INTO `tb_category` VALUES ('52', '测试文章1', 'cswz1', 'cswz/', '42', '2', 'article', '0,42', '52', '0', '', '', '', '0', '0', '1', '0', '', '0', '', '', '', '0', '', '0', '0');

-- ----------------------------
-- Table structure for tb_field
-- ----------------------------
DROP TABLE IF EXISTS `tb_field`;
CREATE TABLE `tb_field` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `tips` varchar(150) NOT NULL DEFAULT '',
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL DEFAULT '',
  `errormsg` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `setup` mediumtext NOT NULL,
  `ispost` varchar(10) NOT NULL DEFAULT '0',
  `unpostgroup` varchar(60) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=328 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_field
-- ----------------------------
INSERT INTO `tb_field` VALUES ('1', '1', 'title', '标题', '', '1', '1', '80', '', '标题必须为1-80个字符', '', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)', '1', '', '2', '1', '1');
INSERT INTO `tb_field` VALUES ('2', '1', 'hits', '点击次数', '', '0', '0', '8', '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', '1', '', '8', '0', '0');
INSERT INTO `tb_field` VALUES ('3', '1', 'createtime', '发布时间', '', '1', '0', '0', 'date', '', '', 'datetime', '', '1', '', '97', '1', '1');
INSERT INTO `tb_field` VALUES ('4', '1', 'template', '模板', '', '0', '0', '0', '', '', '', 'template', '', '1', '', '99', '1', '1');
INSERT INTO `tb_field` VALUES ('5', '1', 'status', '状态', '', '0', '0', '0', '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', '0', '', '98', '1', '1');
INSERT INTO `tb_field` VALUES ('6', '1', 'content', '内容', '', '1', '0', '0', 'defaul', '', 'content', 'editor', 'array (\n  \'edittype\' => \'UEditor\',\n)', '0', '', '4', '1', '0');
INSERT INTO `tb_field` VALUES ('7', '2', 'catid', '栏目', '', '1', '1', '6', 'defaul', '必须选择一个栏目', 'catid', 'catid', 'array (\n  \'multi\' => \'1\',\n)', '1', '', '1', '1', '1');
INSERT INTO `tb_field` VALUES ('8', '2', 'title', '标题', '', '1', '1', '80', 'defaul', '标题必须为1-80个字符', 'title', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'0\',\n)', '1', '', '2', '1', '1');
INSERT INTO `tb_field` VALUES ('9', '2', 'keywords', '关键词', '', '0', '0', '80', '', '', '', 'text', 'array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', '1', '', '3', '0', '1');
INSERT INTO `tb_field` VALUES ('10', '2', 'description', 'SEO简介', '', '0', '0', '0', '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)', '1', '', '4', '0', '1');
INSERT INTO `tb_field` VALUES ('11', '2', 'content', '内容', '', '0', '0', '0', 'defaul', '', 'content', 'editor', 'array (\n  \'edittype\' => \'UEditor\',\n)', '1', '', '9', '1', '1');
INSERT INTO `tb_field` VALUES ('12', '2', 'createtime', '发布时间', '', '1', '0', '0', 'date', '', '', 'datetime', '', '1', '', '9', '1', '1');
INSERT INTO `tb_field` VALUES ('13', '2', 'recommend', '允许评论', '', '0', '0', '1', '', '', '', 'radio', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)', '1', '', '10', '0', '0');
INSERT INTO `tb_field` VALUES ('14', '2', 'readpoint', '阅读收费', '', '0', '0', '5', '', '', '', 'number', 'array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', '1', '', '11', '0', '0');
INSERT INTO `tb_field` VALUES ('15', '2', 'hits', '点击次数', '', '0', '0', '8', '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', '1', '', '9', '1', '0');
INSERT INTO `tb_field` VALUES ('16', '2', 'readgroup', '访问权限', '', '0', '0', '0', '', '', '', 'groupid', 'array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)', '1', '', '13', '1', '1');
INSERT INTO `tb_field` VALUES ('17', '2', 'posid', '推荐位', '', '0', '0', '0', '', '', '', 'posid', '', '1', '', '14', '0', '1');
INSERT INTO `tb_field` VALUES ('18', '2', 'template', '模板', '', '0', '0', '0', '', '', '', 'template', '', '1', '', '15', '0', '1');
INSERT INTO `tb_field` VALUES ('19', '2', 'status', '状态', '', '0', '0', '0', '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', '1', '', '7', '1', '1');
INSERT INTO `tb_field` VALUES ('75', '2', 'copyfrom', '来源', '', '0', '0', '0', 'defaul', '', 'copyfrom', 'text', 'array (\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', '0', '', '8', '1', '0');
INSERT INTO `tb_field` VALUES ('76', '2', 'fromlink', '来源网址', '', '0', '0', '0', 'defaul', '', 'fromlink', 'text', 'array (\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', '0', '', '8', '1', '0');
INSERT INTO `tb_field` VALUES ('158', '2', 'is_comment', '评论', '', '0', '0', '0', 'defaul', '', 'is_comment', 'radio', 'array (\n  \'options\' => \'关闭|0\n开启|1\',\n  \'fieldtype\' => \'varchar\',\n  \'numbertype\' => \'1\',\n  \'default\' => \'1\',\n)', '0', '', '10', '1', '0');
INSERT INTO `tb_field` VALUES ('159', '2', 'is_likes', '点赞', '', '0', '0', '0', 'defaul', '', 'is_likes', 'radio', 'array (\n  \'options\' => \'关闭|0\n开启|1\',\n  \'fieldtype\' => \'varchar\',\n  \'numbertype\' => \'1\',\n  \'default\' => \'1\',\n)', '0', '', '10', '1', '0');
INSERT INTO `tb_field` VALUES ('160', '2', 'author', '作者', '', '1', '0', '0', 'defaul', '', 'author', 'text', 'array (\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', '0', '', '8', '1', '0');
INSERT INTO `tb_field` VALUES ('161', '2', 'isposid', '推荐位', '', '0', '0', '0', 'defaul', '', 'isposid', 'checkbox', 'array (\n  \'options\' => \'首页推荐|1\n要闻推荐|2\n首页头条推荐|3\n首页图片推荐|4\',\n  \'fieldtype\' => \'varchar\',\n  \'numbertype\' => \'1\',\n  \'default\' => \'0\',\n)', '0', '', '14', '1', '0');
INSERT INTO `tb_field` VALUES ('281', '2', 'ytitle', '引标题', '', '0', '0', '0', 'defaul', '', 'ytitle', 'text', 'array (\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', '0', '', '2', '1', '0');
INSERT INTO `tb_field` VALUES ('282', '2', 'ftitle', '副标题', '', '0', '0', '0', 'defaul', '', 'ftitle', 'text', 'array (\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', '0', '', '2', '1', '0');

-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '管理员用户名',
  `aid` int(11) NOT NULL COMMENT '管理员ID',
  `role_id` int(11) NOT NULL COMMENT '管理员角色ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问权限路径',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问权限名称',
  `create_time` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=862 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_log
-- ----------------------------
INSERT INTO `tb_log` VALUES ('184', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584371671', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('183', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584371666', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('182', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584371663', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('181', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584371655', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('180', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584371654', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('179', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584371605', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('178', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584371559', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('177', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584370876', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('176', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584370723', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('175', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584370708', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('174', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584370670', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('173', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584370667', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('172', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584370630', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('171', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584370627', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('170', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584370608', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('169', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584370601', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('168', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584370481', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('167', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584370262', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('166', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584369991', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('165', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584369988', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('164', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584369955', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('163', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584369930', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('162', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584369927', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('161', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584369433', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('160', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584369363', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('159', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584369020', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('158', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584368992', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('157', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584368938', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('156', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584368686', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('155', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584368567', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('154', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584368542', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('153', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584368522', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('152', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584368474', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('151', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584368092', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('150', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584367426', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('149', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584367275', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('148', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584367273', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('145', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584367216', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('146', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584367234', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('147', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584367236', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('185', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584371700', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('186', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584422718', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('187', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584422783', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('188', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584422786', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('189', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584422792', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('190', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584422795', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('191', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584422830', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('192', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584422845', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('193', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584423525', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('194', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584424901', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('195', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584424961', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('196', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584424964', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('197', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584424984', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('198', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584424989', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('199', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584425194', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('200', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584425196', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('201', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584425496', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('202', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584425592', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('203', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584425595', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('204', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584425600', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('205', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584425620', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('206', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584425624', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('207', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584425628', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('208', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584425641', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('209', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584425642', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('210', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584425644', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('211', 'admin', '1', '0', 'admin/system.module/fielddel', '删除', '1584425658', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('212', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584425661', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('213', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584425992', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('214', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584425996', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('215', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584426014', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('216', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584426026', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('217', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584426131', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('218', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584426150', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('219', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584426168', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('220', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584426187', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('221', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584427019', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('222', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584427021', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('223', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584427025', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('224', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584427085', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('225', 'admin', '1', '0', 'admin/system.module/fielddel', '删除', '1584427149', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('226', 'admin', '1', '0', 'admin/system.module/fielddel', '删除', '1584427709', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('227', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584427753', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('228', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584427755', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('229', 'admin', '1', '0', 'admin/system.module/fieldform', '编辑和添加', '1584427759', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('230', 'admin', '1', '0', 'admin/system.module/fieldsave', '保存', '1584427766', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('231', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584427768', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('232', 'admin', '1', '0', 'admin/system.module/fielddel', '删除', '1584427775', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('233', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584428019', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('234', 'admin', '1', '0', 'admin/system.module/fieldsort', '排序', '1584428021', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('235', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584428024', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('236', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584428408', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('237', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584428580', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('238', 'admin', '1', '0', 'admin/system.module/fieldsort', '排序', '1584428582', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('239', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584428588', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('240', 'admin', '1', '0', 'admin/system.module/fieldsort', '排序', '1584428590', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('241', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584428592', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('242', 'admin', '1', '0', 'admin/system.module/fieldsort', '排序', '1584428596', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('243', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584428646', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('244', 'admin', '1', '0', 'admin/system.module/fieldsort', '排序', '1584428647', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('245', 'admin', '1', '0', 'admin/system.module/fieldsort', '排序', '1584428649', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('246', 'admin', '1', '0', 'admin/system.module/fieldsort', '排序', '1584428679', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('247', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584428791', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('248', 'admin', '1', '0', 'admin/system.module/fieldsort', '排序', '1584428837', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('249', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584428846', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('250', 'admin', '1', '0', 'admin/system.module/fieldsort', '排序', '1584428850', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('251', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584428904', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('252', 'admin', '1', '0', 'admin/system.module/fieldsort', '排序', '1584428905', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('253', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584428906', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('254', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584428925', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('255', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584429063', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('256', 'admin', '1', '0', 'admin/system.module/fieldsort', '排序', '1584429067', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('257', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584429069', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('258', 'admin', '1', '0', 'admin/system.module/fieldsort', '排序', '1584429069', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('259', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584429071', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('260', 'admin', '1', '0', 'admin/system.module/fieldsort', '排序', '1584429249', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('261', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584429250', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('262', 'admin', '1', '0', 'admin/system.module/fieldsort', '排序', '1584429251', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('263', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584429253', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('264', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584429268', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('265', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584429365', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('266', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584429485', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('267', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584429513', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('268', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584429532', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('269', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584429550', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('270', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584429551', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('271', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584429592', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('272', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584429594', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('273', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584429615', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('274', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584429617', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('275', 'admin', '1', '0', 'admin/system.module/fieldrequired', '必填', '1584429619', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('276', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584437479', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('277', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584437522', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('278', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584437524', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('279', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584437572', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('280', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584437587', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('281', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584437603', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('282', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584437712', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('283', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584437725', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('284', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438179', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('285', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438231', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('286', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438289', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('287', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438403', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('288', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438435', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('289', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438448', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('290', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438456', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('291', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438469', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('292', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438475', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('293', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438572', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('294', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438585', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('295', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438701', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('296', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438725', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('297', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438764', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('298', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438776', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('299', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584438781', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('300', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584451421', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('301', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584451444', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('302', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584451662', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('303', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584451711', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('304', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584451930', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('305', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584452058', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('306', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584452068', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('307', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584452069', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('308', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584452269', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('309', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584452367', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('310', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584452749', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('311', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584452751', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('312', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584452884', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('313', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584452886', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('314', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584452891', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('315', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584454020', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('316', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584454057', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('317', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584454060', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('318', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584454109', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('319', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584454135', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('320', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584454258', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('321', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584454623', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('322', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584454772', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('323', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584454801', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('324', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584454821', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('325', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1584454822', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('326', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1584454823', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('327', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584454826', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('328', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584454833', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('329', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584454839', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('330', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584454914', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('331', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584454917', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('332', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584455020', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('333', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584455041', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('334', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584455045', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('335', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584455061', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('336', 'admin', '1', '0', 'admin/system.module/index', '模型', '1584455067', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('337', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584455071', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('338', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584455073', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('339', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584455198', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('340', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584455203', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('341', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584455525', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('342', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584455538', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('343', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584455541', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('344', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584455571', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('345', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584455584', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('346', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584455591', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('347', 'admin', '1', '0', 'admin/system.module/index', '模型', '1584788809', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('348', 'admin', '1', '0', 'admin/system.module/index', '模型', '1584788838', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('349', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584789543', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('350', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584789837', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('351', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584789908', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('352', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584790048', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('353', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584790049', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('354', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584790065', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('355', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584790099', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('356', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584790139', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('357', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584790150', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('358', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791059', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('359', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791081', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('360', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791116', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('361', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791138', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('362', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791241', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('363', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791246', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('364', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791356', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('365', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791365', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('366', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791612', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('367', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791701', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('368', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791750', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('369', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791760', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('370', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791795', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('371', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791810', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('372', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791901', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('373', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584791944', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('374', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584792081', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('375', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584792140', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('376', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584792468', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('377', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584792515', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('378', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584792569', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('379', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584792580', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('380', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584792582', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('381', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584792623', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('382', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584792783', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('383', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584792794', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('384', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584792823', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('385', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584793022', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('386', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584793427', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('387', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584793555', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('388', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584793573', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('389', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584793597', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('390', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584793607', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('391', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584793771', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('392', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584793935', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('393', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584793954', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('394', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584794148', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('395', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584794247', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('396', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584794278', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('397', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584794317', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('398', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584794325', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('399', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584794407', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('400', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584798144', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('401', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584798216', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('402', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584798218', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('403', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584798242', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('404', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584798243', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('405', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584798252', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('406', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584798253', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('407', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584798260', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('408', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584798262', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('409', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584798266', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('410', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584798267', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('411', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584798272', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('412', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584798274', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('413', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584798301', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('414', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584798302', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('415', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584798461', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('416', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584798463', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('417', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584798468', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('418', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584798470', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('419', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584798475', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('420', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584798477', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('421', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584798507', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('422', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584798509', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('423', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584798539', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('424', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584798541', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('425', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584798589', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('426', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584798591', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('427', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584798689', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('428', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584798690', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('429', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584798730', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('430', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584798748', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('431', 'admin', '1', '0', 'admin/article.category/state', '状态', '1584798752', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('432', 'admin', '1', '0', 'admin/article.category/state', '状态', '1584798753', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('433', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1584799988', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('434', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1584799996', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('435', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584800074', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('436', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584802362', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('437', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584804251', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('438', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584841240', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('439', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584841546', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('440', 'admin', '1', '0', 'admin/system.module/index', '模型', '1584855317', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('441', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584855319', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('442', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584856505', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('443', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584863626', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('444', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584863628', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('445', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584863630', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('446', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584863647', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('447', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584863669', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('448', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864020', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('449', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864145', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('450', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864189', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('451', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864209', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('452', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864233', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('453', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864241', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('454', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864283', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('455', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864292', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('456', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864349', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('457', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864364', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('458', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864390', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('459', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864420', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('460', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864424', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('461', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864449', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('462', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864508', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('463', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864517', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('464', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864641', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('465', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864649', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('466', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864655', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('467', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864656', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('468', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864667', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('469', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864695', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('470', 'admin', '1', '0', 'admin/system.module/index', '模型', '1584864740', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('471', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864872', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('472', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864907', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('473', 'admin', '1', '0', 'admin/system.module/index', '模型', '1584864914', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('474', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864919', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('475', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584864972', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('476', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865015', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('477', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865019', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('478', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865020', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('479', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865093', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('480', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865100', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('481', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865101', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('482', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865103', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('483', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865140', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('484', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865141', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('485', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865149', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('486', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865161', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('487', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865362', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('488', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865365', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('489', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865372', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('490', 'admin', '1', '0', 'admin/system.module/index', '模型', '1584865384', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('491', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584865397', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('492', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584865430', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('493', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584865441', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('494', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584865462', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('495', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584865473', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('496', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584865486', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('497', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584865495', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('498', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584865503', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('499', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584865514', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('500', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865518', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('501', 'admin', '1', '0', 'admin/article.category/state', '状态', '1584865838', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('502', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865847', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('503', 'admin', '1', '0', 'admin/article.category/state', '状态', '1584865882', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('504', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865885', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('505', 'admin', '1', '0', 'admin/article.category/state', '状态', '1584865945', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('506', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584865948', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('507', 'admin', '1', '0', 'admin/article.category/state', '状态', '1584866007', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('508', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584866010', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('509', 'admin', '1', '0', 'admin/article.category/state', '状态', '1584866014', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('510', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584866018', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('511', 'admin', '1', '0', 'admin/system.module/index', '模型', '1584866040', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('512', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584866043', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('513', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584866096', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('514', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584866107', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('515', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584866158', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('516', 'admin', '1', '0', 'admin/article.category/state', '状态', '1584866163', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('517', 'admin', '1', '0', 'admin/article.category/state', '状态', '1584866165', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('518', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584866168', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('519', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584866185', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('520', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584866189', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('521', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584866196', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('522', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584866245', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('523', 'admin', '1', '0', 'admin/article.category/sort', '排序', '1584866248', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('524', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584866249', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('525', 'admin', '1', '0', 'admin/article.category/sort', '排序', '1584866253', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('526', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584866255', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('527', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584878354', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('528', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584878365', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('529', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584878380', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('530', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584879602', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('531', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584879615', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('532', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584879643', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('533', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584879645', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('534', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584879690', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('535', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584879692', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('536', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584880848', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('537', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584880980', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('538', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584880981', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('539', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584881017', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('540', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584881161', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('541', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584881206', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('542', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584881456', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('543', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584881468', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('544', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584881569', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('545', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584881673', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('546', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584881688', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('547', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584881706', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('548', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584881956', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('549', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584881970', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('550', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584882037', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('551', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584882057', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('552', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584882240', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('553', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584882334', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('554', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584882592', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('555', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584882617', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('556', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584882693', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('557', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584882706', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('558', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584882751', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('559', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584882785', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('560', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584882829', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('561', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584882883', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('562', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584882934', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('563', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584883009', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('564', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584883058', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('565', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584883102', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('566', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584883126', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('567', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584883146', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('568', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584962473', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('569', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584963065', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('570', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584963133', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('571', 'admin', '1', '0', 'admin/article.category/save', '保存', '1584963412', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('572', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584966500', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('573', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584968422', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('574', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584968424', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('575', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584968453', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('576', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584968455', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('577', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584969263', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('578', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584969265', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('579', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584969293', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('580', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584969295', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('581', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584969446', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('582', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584969447', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('583', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584969469', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('584', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584969471', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('585', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584969479', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('586', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584969481', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('587', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584969508', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('588', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584969510', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('589', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584969527', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('590', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584969528', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('591', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584969550', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('592', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584969552', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('593', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1584969971', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('594', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584970044', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('595', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584970069', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('596', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584970070', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('597', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584970097', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('598', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584970099', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('599', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585222502', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('600', 'admin', '1', '0', 'admin/article.category/del', '删除', '1585222529', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('601', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585222529', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('602', 'admin', '1', '0', 'admin/article.category/del', '删除', '1585222623', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('603', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585222624', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('604', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585222785', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('605', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585222813', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('606', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585222826', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('607', 'admin', '1', '0', 'admin/article.category/del', '删除', '1585222831', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('608', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585222831', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('609', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585223363', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('610', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585223382', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('611', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585223396', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('612', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585223463', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('613', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585223529', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('614', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585223883', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('615', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585225351', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('616', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225362', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('617', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225405', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('618', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225411', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('619', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225419', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('620', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585225553', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('621', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585225608', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('622', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225610', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('623', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225681', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('624', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225688', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('625', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225778', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('626', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225780', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('627', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225783', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('628', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225784', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('629', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225794', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('630', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225805', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('631', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225807', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('632', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225831', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('633', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225832', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('634', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585225835', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('635', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585225918', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('636', 'admin', '1', '0', 'admin/article.module/del', '删除', '1585225937', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('637', 'admin', '1', '0', 'admin/article.module/del', '删除', '1585225960', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('638', 'admin', '1', '0', 'admin/article.module/del', '删除', '1585225962', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('639', 'admin', '1', '0', 'admin/article.module/del', '删除', '1585225964', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('640', 'admin', '1', '0', 'admin/article.module/del', '删除', '1585225967', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('641', 'admin', '1', '0', 'admin/article.module/del', '删除', '1585225969', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('642', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585226231', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('643', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585226240', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('644', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585226254', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('645', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585226287', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('646', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585226289', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('647', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585226301', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('648', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585227354', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('649', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585227502', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('650', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585227547', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('651', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585227621', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('652', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585227657', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('653', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585227723', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('654', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585227769', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('655', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585227805', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('656', 'admin', '1', '0', 'admin/article.category/save', '保存', '1585227853', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('657', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585227877', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('658', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585227892', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('659', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585228176', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('660', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585228188', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('661', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585228192', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('662', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1585228223', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('663', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585228225', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('664', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1585228235', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('665', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585228236', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('666', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585228259', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('667', 'admin', '1', '0', 'admin/article.category/refresh', '刷新', '1585228264', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('668', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585228273', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('669', 'admin', '1', '0', 'admin/article.category/refresh', '刷新', '1585228274', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('670', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585228296', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('671', 'admin', '1', '0', 'admin/article.category/refresh', '刷新', '1585228298', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('672', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585228323', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('673', 'admin', '1', '0', 'admin/article.category/refresh', '刷新', '1585228326', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('674', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585228327', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('675', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585228906', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('676', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585228920', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('677', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585229035', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('678', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585229114', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('679', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585229190', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('680', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585229205', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('681', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585229240', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('682', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585229242', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('683', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585229243', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('684', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585229245', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('685', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585229246', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('686', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1585229246', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('687', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1585229254', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('688', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1585229257', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('689', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1585229261', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('690', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1585229321', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('691', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1585229326', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('692', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585229327', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('693', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585229329', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('694', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585229388', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('695', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585229517', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('696', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585230004', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('697', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585230024', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('698', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585230127', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('699', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585230225', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('700', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585230227', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('701', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585230252', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('702', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585230273', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('703', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585230281', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('704', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585230517', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('705', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585230518', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('706', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585230825', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('707', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585230988', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('708', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585231099', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('709', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1585231100', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('710', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231100', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('711', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231258', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('712', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231328', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('713', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231331', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('714', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231353', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('715', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231382', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('716', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231411', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('717', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231448', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('718', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231495', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('719', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231500', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('720', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231634', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('721', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231748', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('722', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231803', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('723', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231805', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('724', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231807', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('725', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231809', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('726', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585231831', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('727', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585232065', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('728', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585232071', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('729', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585232089', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('730', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585232107', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('731', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585232119', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('732', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585232175', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('733', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585232179', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('734', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585232250', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('735', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585234841', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('736', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585234847', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('737', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585234894', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('738', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585234968', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('739', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585234998', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('740', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235028', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('741', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235133', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('742', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235145', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('743', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235156', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('744', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235175', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('745', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235192', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('746', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235240', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('747', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235243', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('748', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235246', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('749', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235292', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('750', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585235301', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('751', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585235305', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('752', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585235307', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('753', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585235308', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('754', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235309', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('755', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1585235310', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('756', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1585235311', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('757', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1585235312', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('758', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235313', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('759', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585235314', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('760', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1585235315', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('761', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1585235316', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('762', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585235317', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('763', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1585235318', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('764', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235319', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('765', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585235319', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('766', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1585235320', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('767', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235321', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('768', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1585235322', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('769', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235323', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('770', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585235324', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('771', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585235441', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('772', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585235446', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('773', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235447', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('774', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585235449', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('775', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1585235450', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('776', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585235452', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('777', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1585235452', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('778', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1585235453', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('779', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1585235682', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('780', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1585235694', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('781', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585235695', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('782', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585235699', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('783', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585235745', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('784', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585236399', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('785', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585236404', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('786', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585236406', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('787', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585236412', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('788', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585236421', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('789', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585236558', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('790', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585236565', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('791', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585236569', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('792', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585236869', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('793', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585236918', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('794', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585236923', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('795', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585237279', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('796', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585237306', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('797', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585237308', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('798', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585237425', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('799', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585237432', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('800', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585237450', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('801', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585237452', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('802', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585237567', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('803', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585237676', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('804', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585237698', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('805', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585237702', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('806', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585237774', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('807', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585237777', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('808', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585237826', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('809', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585237985', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('810', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585237987', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('811', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585238003', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('812', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238012', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('813', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238049', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('814', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238051', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('815', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585238055', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('816', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585238075', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('817', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1585238081', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('818', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238082', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('819', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238126', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('820', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585238128', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('821', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1585238161', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('822', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238163', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('823', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238175', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('824', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238177', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('825', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238210', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('826', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238213', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('827', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238284', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('828', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238285', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('829', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238311', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('830', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238316', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('831', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238318', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('832', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238340', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('833', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238341', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('834', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238365', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('835', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238380', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('836', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238398', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('837', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238407', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('838', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238428', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('839', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585238431', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('840', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585238445', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('841', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585238447', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('842', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585238460', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('843', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585238461', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('844', 'admin', '1', '0', 'admin/article.content/index', '列表', '1585489710', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('845', 'admin', '1', '0', 'admin/article.content/index', '列表', '1585489747', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('846', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585494418', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('847', 'admin', '1', '0', 'admin/article.content/index', '列表', '1585494431', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('848', 'admin', '1', '0', 'admin/article.content/index', '列表', '1585494435', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('849', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585494437', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('850', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585494490', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('851', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585494494', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('852', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585494497', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('853', 'admin', '1', '0', 'admin/article.content/index', '列表', '1585494502', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('854', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585494580', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('855', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585494584', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('856', 'admin', '1', '0', 'admin/article.module/index', '模型', '1585494589', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('857', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585494595', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('858', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585494596', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('859', 'admin', '1', '0', 'admin/article.content/index', '列表', '1585494642', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('860', 'admin', '1', '0', 'admin/article.category/index', '栏目', '1585494645', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('861', 'admin', '1', '0', 'admin/article.content/index', '列表', '1585494813', '127.0.0.1');

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '菜单路径',
  `title` varchar(255) NOT NULL COMMENT '菜单名称',
  `icon` varchar(255) DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1=>菜单，0=>操作',
  `p_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `cat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '#', '系统', 'set', '1', '0', '2', '0', '0', null);
INSERT INTO `tb_menu` VALUES ('2', 'admin/system.menu/index', '菜单管理', '', '1', '63', '0', '0', '0', null);
INSERT INTO `tb_menu` VALUES ('3', 'admin/system.menu/form', '编辑和添加', '', '0', '2', '2', '0', '0', null);
INSERT INTO `tb_menu` VALUES ('4', 'admin/system.menu/save', '保存', '', '0', '2', '3', '0', '0', null);
INSERT INTO `tb_menu` VALUES ('5', 'admin/system.menu/del', '删除', '', '0', '2', '4', '0', '0', null);
INSERT INTO `tb_menu` VALUES ('49', 'admin/system.role/index', '角色管理', '', '1', '63', '0', '1581926140', '1581926140', null);
INSERT INTO `tb_menu` VALUES ('50', 'admin/system.role/save', '编辑和添加', '', '0', '49', '2', '1581926200', '1581926228', null);
INSERT INTO `tb_menu` VALUES ('51', 'admin/system.role/save', '保存', '', '0', '49', '3', '1581926245', '1581926245', null);
INSERT INTO `tb_menu` VALUES ('52', 'admin/system.role/del', '删除', '', '0', '49', '4', '1581926256', '1581926256', null);
INSERT INTO `tb_menu` VALUES ('53', 'admin/system.admin/index', '管理员管理', '', '1', '63', '0', '1581926858', '1581926858', null);
INSERT INTO `tb_menu` VALUES ('54', 'admin/index/index', '主页', 'home', '1', '0', '1', '0', '0', null);
INSERT INTO `tb_menu` VALUES ('56', 'admin/system.role/index', '列表', '', '0', '49', '1', '1582005720', '1582005720', null);
INSERT INTO `tb_menu` VALUES ('57', 'admin/system.menu/index', '列表', '', '0', '2', '1', '1582005742', '1582005742', null);
INSERT INTO `tb_menu` VALUES ('58', 'admin/system.admin/index', '列表', '', '0', '53', '0', '1582011246', '1582011246', null);
INSERT INTO `tb_menu` VALUES ('59', 'admin/system.admin/form', '编辑和添加', '', '0', '53', '0', '1582011268', '1582011268', null);
INSERT INTO `tb_menu` VALUES ('60', 'admin/system.admin/save', '保存', '', '0', '53', '0', '1582011281', '1582011281', null);
INSERT INTO `tb_menu` VALUES ('61', 'admin/system.admin/del', '删除', '', '0', '53', '0', '1582011294', '1582011294', null);
INSERT INTO `tb_menu` VALUES ('63', '#', '权限', 'key', '1', '0', '3', '0', '1584240324', null);
INSERT INTO `tb_menu` VALUES ('64', 'admin/system.system/form', '系统设置', '', '1', '1', '0', '1584019283', '1584019283', null);
INSERT INTO `tb_menu` VALUES ('65', 'admin/system.system/sms', '短信设置', '', '1', '1', '0', '1584019324', '1584019324', null);
INSERT INTO `tb_menu` VALUES ('66', 'admin/system.system/wechat', '公众号设置', '', '1', '1', '0', '1584019450', '1584020550', null);
INSERT INTO `tb_menu` VALUES ('68', 'admin/article.module/index', '模型', 'template-1', '1', '0', '4', '1584100844', '1584102142', null);
INSERT INTO `tb_menu` VALUES ('69', 'admin/article.module/index', '列表', null, '0', '68', '1', '1584102267', '1584798242', null);
INSERT INTO `tb_menu` VALUES ('70', 'admin/article.module/form', '编辑和添加', null, '0', '68', '2', '1584102352', '1584798252', null);
INSERT INTO `tb_menu` VALUES ('71', 'admin/article.module/save', '保存', null, '0', '68', '3', '1584102385', '1584798260', null);
INSERT INTO `tb_menu` VALUES ('72', 'admin/article.module/del', '删除', null, '0', '68', '4', '1584102412', '1584798266', null);
INSERT INTO `tb_menu` VALUES ('75', 'admin/system.role/state', '状态', null, '0', '49', '5', '1584192647', '1584192647', null);
INSERT INTO `tb_menu` VALUES ('78', 'admin/system.admin/state', '状态', null, '0', '53', '0', '1584243038', '1584243038', null);
INSERT INTO `tb_menu` VALUES ('79', 'admin/system.menu/state', '状态', null, '0', '2', '5', '1584243077', '1584243077', null);
INSERT INTO `tb_menu` VALUES ('80', 'admin/article.module/field', '模型字段', null, '0', '68', '5', '1584309048', '1584798272', null);
INSERT INTO `tb_menu` VALUES ('81', 'admin/article.module/field', '列表', null, '0', '80', '1', '1584309113', '1584309113', null);
INSERT INTO `tb_menu` VALUES ('82', 'admin/article.module/fieldform', '编辑和添加', null, '0', '80', '2', '1584309193', '1584309193', null);
INSERT INTO `tb_menu` VALUES ('83', 'admin/article.module/fieldsave', '保存', null, '0', '80', '3', '1584309231', '1584309231', null);
INSERT INTO `tb_menu` VALUES ('84', 'admin/article.module/fielddel', '删除', null, '0', '80', '4', '1584309323', '1584309323', null);
INSERT INTO `tb_menu` VALUES ('85', 'admin/article.module/fieldstate', '状态', null, '0', '80', '5', '1584309386', '1584309386', null);
INSERT INTO `tb_menu` VALUES ('86', 'admin/article.module/fieldsort', '排序', null, '0', '80', '6', '1584309552', '1584309552', null);
INSERT INTO `tb_menu` VALUES ('87', 'admin/system.log/index', '日志管理', null, '1', '63', '0', '1584343385', '1584343385', null);
INSERT INTO `tb_menu` VALUES ('88', 'admin/system.log/index', '列表', null, '0', '87', '0', '1584343519', '1584343519', null);
INSERT INTO `tb_menu` VALUES ('89', 'admin/system.log/del', '删除', null, '0', '87', '0', '1584343561', '1584343584', null);
INSERT INTO `tb_menu` VALUES ('90', 'admin/system.log/delAll', '清空', null, '0', '87', '0', '1584343623', '1584343623', null);
INSERT INTO `tb_menu` VALUES ('91', 'admin/article.module/fieldrequired', '必填', null, '0', '80', '7', '1584429592', '1584798301', null);
INSERT INTO `tb_menu` VALUES ('92', 'admin/article.category/index', '栏目', 'align-center', '1', '0', '5', '1584437522', '1584437522', null);
INSERT INTO `tb_menu` VALUES ('93', '#', '内容权限', 'list', '0', '0', '6', '1584455539', '1584970069', null);
INSERT INTO `tb_menu` VALUES ('94', 'admin/article.category/index', '列表', null, '0', '92', '1', '1584798216', '1584798468', null);
INSERT INTO `tb_menu` VALUES ('95', 'admin/article.category/form', '编辑和添加', null, '0', '92', '2', '1584798461', '1584798475', null);
INSERT INTO `tb_menu` VALUES ('96', 'admin/article.category/save', '保存', null, '0', '92', '3', '1584798507', '1584798507', null);
INSERT INTO `tb_menu` VALUES ('97', 'admin/article.category/del', '删除', null, '0', '92', '4', '1584798539', '1584798539', null);
INSERT INTO `tb_menu` VALUES ('98', 'admin/article.category/state', '状态', null, '0', '92', '5', '1584798589', '1584798589', null);
INSERT INTO `tb_menu` VALUES ('99', 'admin/article.category/sort', '排序', null, '0', '92', '6', '1584798689', '1584798689', null);
INSERT INTO `tb_menu` VALUES ('100', 'admin/article.content/index', '列表', null, '0', '93', '1', '1584968422', '1584968422', null);
INSERT INTO `tb_menu` VALUES ('101', 'admin/article.content/form', '编辑和添加', null, '0', '93', '2', '1584968453', '1584969263', null);
INSERT INTO `tb_menu` VALUES ('102', 'admin/article.content/save', '保存', null, '0', '93', '3', '1584969293', '1584969446', null);
INSERT INTO `tb_menu` VALUES ('103', 'admin/article.content/del', '删除', null, '0', '93', '4', '1584969469', '1584969479', null);
INSERT INTO `tb_menu` VALUES ('104', 'admin/article.content/state', '状态', null, '0', '93', '5', '1584969508', '1584969527', null);
INSERT INTO `tb_menu` VALUES ('105', 'admin/article.content/sort', '排序', null, '0', '93', '0', '1584969550', '1584969550', null);
INSERT INTO `tb_menu` VALUES ('106', '#', '内容', 'list', '1', '0', '7', '1584970097', '1584970097', null);
INSERT INTO `tb_menu` VALUES ('107', 'admin/article.content/form?catid=41', '测试', null, '1', '106', '0', '1585225608', '0', null);
INSERT INTO `tb_menu` VALUES ('108', 'admin/article.content/index?catid=42', '测试文章', null, '1', '106', '0', '1585226287', '0', '42');
INSERT INTO `tb_menu` VALUES ('110', 'admin/article.content/index?catid=52', '测试文章1', null, '1', '108', '0', '1585227853', '0', '52');
INSERT INTO `tb_menu` VALUES ('111', 'admin/article.category/refresh', '刷新', null, '0', '92', '7', '1585228223', '1585228235', null);

-- ----------------------------
-- Table structure for tb_module
-- ----------------------------
DROP TABLE IF EXISTS `tb_module`;
CREATE TABLE `tb_module` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listfields` varchar(255) NOT NULL DEFAULT '',
  `setup` text NOT NULL,
  `listorder` smallint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_module
-- ----------------------------
INSERT INTO `tb_module` VALUES ('1', '单页模型', 'page', '关于我们', '1', '0', '*', '', '0', '1');
INSERT INTO `tb_module` VALUES ('2', '文章模型', 'article', '新闻文章', '1', '0', '*', '', '0', '1');

-- ----------------------------
-- Table structure for tb_module1
-- ----------------------------
DROP TABLE IF EXISTS `tb_module1`;
CREATE TABLE `tb_module1` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listfields` varchar(255) NOT NULL DEFAULT '',
  `setup` text NOT NULL,
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='模型';

-- ----------------------------
-- Records of tb_module1
-- ----------------------------
INSERT INTO `tb_module1` VALUES ('1', '单页模型', 'page', '关于我们', '1', '0', '*', '', '0', '1');
INSERT INTO `tb_module1` VALUES ('2', '文章模型', 'article', '新闻文章', '1', '0', '*', '', '0', '1');

-- ----------------------------
-- Table structure for tb_page
-- ----------------------------
DROP TABLE IF EXISTS `tb_page`;
CREATE TABLE `tb_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='单页模型';

-- ----------------------------
-- Records of tb_page
-- ----------------------------
INSERT INTO `tb_page` VALUES ('41', '测试', '', '', '0', '0', '0', '', '0', '0', '0', '0', '');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '角色名称',
  `role` text COMMENT '角色权限',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>显示，0=>不显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '管理员', '1,66,65,64,54,63,49,56,52,2,57', '1581927783', '1584241079', '1');
INSERT INTO `tb_role` VALUES ('2', '客服', '1,53,49,52,51,50,2,3,4,5', '1581927783', '1584241080', '1');

-- ----------------------------
-- Table structure for tb_system
-- ----------------------------
DROP TABLE IF EXISTS `tb_system`;
CREATE TABLE `tb_system` (
  `id` int(36) unsigned NOT NULL,
  `name` char(36) NOT NULL DEFAULT '',
  `url` varchar(36) NOT NULL DEFAULT '',
  `title` varchar(200) NOT NULL,
  `key` varchar(200) NOT NULL,
  `des` varchar(200) NOT NULL,
  `bah` varchar(50) DEFAULT NULL COMMENT '备案号',
  `copyright` varchar(30) DEFAULT NULL COMMENT 'copyright',
  `ads` varchar(120) DEFAULT NULL COMMENT '公司地址',
  `tel` varchar(15) DEFAULT NULL COMMENT '公司电话',
  `email` varchar(50) DEFAULT NULL COMMENT '公司邮箱',
  `logo` varchar(120) DEFAULT NULL COMMENT 'logo',
  `others` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统设置';

-- ----------------------------
-- Records of tb_system
-- ----------------------------
INSERT INTO `tb_system` VALUES ('1', '哈尔滨酷创网络', 'http://api.hrbkcwl.com', '哈尔滨酷创网络', '酷创网络,哈尔滨网站建设,哈尔滨网站制作,哈尔滨网页设计,哈尔滨微信开发,哈尔滨网络公司,哈尔滨定制开发', '哈尔滨酷创网络科技有限公司，企业致力于网站建设，网页设计，网站优化，手机网站制作，微信开发，小程序，网络营销的互联网公司。最好的技术服务让您放心。方案定制、报价合理，期待您的合作！', '黑ICP备17007278号-1', '2018', '黑龙江哈尔滨', '13204660513', '1003418012@qq.com', '/uploads/20180612/d4911cc16a6e48c5fa7a18894e854f36.png', 'a:5:{s:4:\"file\";s:0:\"\";s:4:\"zxdz\";s:0:\"\";s:5:\"zxtel\";s:0:\"\";s:6:\"qlfxdz\";s:0:\"\";s:7:\"qlfxtel\";s:0:\"\";}');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
