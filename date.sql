/*
Navicat MySQL Data Transfer

Source Server         : admin
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : admin

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-03-16 17:34:39
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
) ENGINE=MyISAM AUTO_INCREMENT=326 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_field
-- ----------------------------
INSERT INTO `tb_field` VALUES ('1', '1', 'title', '标题', '', '1', '1', '80', '', '标题必须为1-80个字符', '', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)', '1', '', '2', '1', '1');
INSERT INTO `tb_field` VALUES ('2', '1', 'hits', '点击次数', '', '0', '0', '8', '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', '1', '', '8', '0', '0');
INSERT INTO `tb_field` VALUES ('3', '1', 'createtime', '发布时间', '', '1', '0', '0', 'date', '', '', 'datetime', '', '1', '', '97', '1', '1');
INSERT INTO `tb_field` VALUES ('4', '1', 'template', '模板', '', '0', '0', '0', '', '', '', 'template', '', '1', '', '99', '1', '1');
INSERT INTO `tb_field` VALUES ('5', '1', 'status', '状态', '', '0', '0', '0', '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', '0', '', '98', '1', '1');
INSERT INTO `tb_field` VALUES ('6', '1', 'content', '内容', '', '1', '0', '0', 'defaul', '', 'content', 'editor', 'array (\n  \'edittype\' => \'UEditor\',\n)', '0', '', '3', '1', '0');
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
INSERT INTO `tb_field` VALUES ('325', '1', 'cs', '测试', '', '1', '0', '0', 'defaul', '', 'cs', 'text', 'array (\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'info\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', '0', '', '0', '1', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_log
-- ----------------------------
INSERT INTO `tb_log` VALUES ('8', 'admin', '1', '0', 'admin/system.module/field', '模型字段', '1584343272', '');
INSERT INTO `tb_log` VALUES ('9', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1584343293', '');
INSERT INTO `tb_log` VALUES ('10', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584343339', '');
INSERT INTO `tb_log` VALUES ('11', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584343385', '');
INSERT INTO `tb_log` VALUES ('12', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584343387', '');
INSERT INTO `tb_log` VALUES ('13', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584343519', '');
INSERT INTO `tb_log` VALUES ('14', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584343521', '');
INSERT INTO `tb_log` VALUES ('15', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584343561', '');
INSERT INTO `tb_log` VALUES ('16', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584343563', '');
INSERT INTO `tb_log` VALUES ('17', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584343583', '');
INSERT INTO `tb_log` VALUES ('18', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584343585', '');
INSERT INTO `tb_log` VALUES ('19', 'admin', '1', '0', 'admin/system.menu/save', '保存', '1584343623', '');
INSERT INTO `tb_log` VALUES ('20', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584343625', '');
INSERT INTO `tb_log` VALUES ('21', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584344568', '');
INSERT INTO `tb_log` VALUES ('22', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584344611', '');
INSERT INTO `tb_log` VALUES ('23', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584344658', '');
INSERT INTO `tb_log` VALUES ('24', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584344672', '');
INSERT INTO `tb_log` VALUES ('25', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584344683', '');
INSERT INTO `tb_log` VALUES ('26', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584344714', '');
INSERT INTO `tb_log` VALUES ('27', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584344733', '');
INSERT INTO `tb_log` VALUES ('28', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584344755', '');
INSERT INTO `tb_log` VALUES ('29', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584345117', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('30', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584345123', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('31', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584345129', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('32', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584345572', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('33', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1584345645', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('34', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1584345709', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('35', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584345713', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('36', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1584345717', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('37', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1584345719', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('38', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584345720', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('39', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584345722', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('40', 'admin', '1', '0', 'admin/system.menu/index', '菜单管理', '1584345728', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('41', 'admin', '1', '0', 'admin/system.role/index', '角色管理', '1584345729', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('42', 'admin', '1', '0', 'admin/system.admin/index', '管理员管理', '1584345730', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('43', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584345730', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('44', 'admin', '1', '0', 'admin/system.module/index', '模型管理', '1584345733', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('45', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584345755', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('46', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584345797', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('47', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584345799', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('48', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584345800', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('49', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584345801', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('50', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584345803', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('51', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584345804', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('52', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584345804', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('53', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584345805', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('54', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584345805', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('56', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584346065', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('57', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584346066', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('58', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584346124', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('59', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584346135', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('60', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584346135', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('61', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584346136', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('62', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584346137', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('63', 'admin', '1', '0', 'admin/system.log/index', '日志管理', '1584346137', '127.0.0.1');
INSERT INTO `tb_log` VALUES ('64', 'admin', '1', '0', 'admin/system.log/del', '删除', '1584347591', '127.0.0.1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '#', '系统', 'set', '1', '0', '2', '0', '0');
INSERT INTO `tb_menu` VALUES ('2', 'admin/system.menu/index', '菜单管理', '', '1', '63', '0', '0', '0');
INSERT INTO `tb_menu` VALUES ('3', 'admin/system.menu/form', '编辑和添加', '', '0', '2', '2', '0', '0');
INSERT INTO `tb_menu` VALUES ('4', 'admin/system.menu/save', '保存', '', '0', '2', '3', '0', '0');
INSERT INTO `tb_menu` VALUES ('5', 'admin/system.menu/del', '删除', '', '0', '2', '4', '0', '0');
INSERT INTO `tb_menu` VALUES ('49', 'admin/system.role/index', '角色管理', '', '1', '63', '0', '1581926140', '1581926140');
INSERT INTO `tb_menu` VALUES ('50', 'admin/system.role/save', '编辑和添加', '', '0', '49', '2', '1581926200', '1581926228');
INSERT INTO `tb_menu` VALUES ('51', 'admin/system.role/save', '保存', '', '0', '49', '3', '1581926245', '1581926245');
INSERT INTO `tb_menu` VALUES ('52', 'admin/system.role/del', '删除', '', '0', '49', '4', '1581926256', '1581926256');
INSERT INTO `tb_menu` VALUES ('53', 'admin/system.admin/index', '管理员管理', '', '1', '63', '0', '1581926858', '1581926858');
INSERT INTO `tb_menu` VALUES ('54', 'admin/index/index', '主页', 'home', '1', '0', '1', '0', '0');
INSERT INTO `tb_menu` VALUES ('56', 'admin/system.role/index', '列表', '', '0', '49', '1', '1582005720', '1582005720');
INSERT INTO `tb_menu` VALUES ('57', 'admin/system.menu/index', '列表', '', '0', '2', '1', '1582005742', '1582005742');
INSERT INTO `tb_menu` VALUES ('58', 'admin/system.admin/index', '列表', '', '0', '53', '0', '1582011246', '1582011246');
INSERT INTO `tb_menu` VALUES ('59', 'admin/system.admin/form', '编辑和添加', '', '0', '53', '0', '1582011268', '1582011268');
INSERT INTO `tb_menu` VALUES ('60', 'admin/system.admin/save', '保存', '', '0', '53', '0', '1582011281', '1582011281');
INSERT INTO `tb_menu` VALUES ('61', 'admin/system.admin/del', '删除', '', '0', '53', '0', '1582011294', '1582011294');
INSERT INTO `tb_menu` VALUES ('63', '#', '权限', 'key', '1', '0', '3', '0', '1584240324');
INSERT INTO `tb_menu` VALUES ('64', 'admin/system.system/form', '系统设置', '', '1', '1', '0', '1584019283', '1584019283');
INSERT INTO `tb_menu` VALUES ('65', 'admin/system.system/sms', '短信设置', '', '1', '1', '0', '1584019324', '1584019324');
INSERT INTO `tb_menu` VALUES ('66', 'admin/system.system/wechat', '公众号设置', '', '1', '1', '0', '1584019450', '1584020550');
INSERT INTO `tb_menu` VALUES ('67', '#', '模型', 'template-1', '1', '0', '4', '1584099409', '1584112699');
INSERT INTO `tb_menu` VALUES ('68', 'admin/system.module/index', '模型管理', null, '1', '67', '0', '1584100844', '1584102142');
INSERT INTO `tb_menu` VALUES ('69', 'admin/system.module/index', '列表', null, '0', '68', '0', '1584102267', '1584102267');
INSERT INTO `tb_menu` VALUES ('70', 'admin/system.module/form', '编辑和添加', null, '0', '68', '0', '1584102352', '1584102352');
INSERT INTO `tb_menu` VALUES ('71', 'admin/system.module/save', '保存', null, '0', '68', '0', '1584102385', '1584102385');
INSERT INTO `tb_menu` VALUES ('72', 'admin/system.module/del', '删除', null, '0', '68', '0', '1584102412', '1584243547');
INSERT INTO `tb_menu` VALUES ('75', 'admin/system.role/state', '状态', null, '0', '49', '5', '1584192647', '1584192647');
INSERT INTO `tb_menu` VALUES ('78', 'admin/system.admin/state', '状态', null, '0', '53', '0', '1584243038', '1584243038');
INSERT INTO `tb_menu` VALUES ('79', 'admin/system.menu/state', '状态', null, '0', '2', '5', '1584243077', '1584243077');
INSERT INTO `tb_menu` VALUES ('80', 'admin/system.module/field', '模型字段', null, '0', '68', '0', '1584309048', '1584309048');
INSERT INTO `tb_menu` VALUES ('81', 'admin/system.module/field', '列表', null, '0', '80', '1', '1584309113', '1584309113');
INSERT INTO `tb_menu` VALUES ('82', 'admin/system.module/fieldform', '编辑和添加', null, '0', '80', '2', '1584309193', '1584309193');
INSERT INTO `tb_menu` VALUES ('83', 'admin/system.module/fieldsave', '保存', null, '0', '80', '3', '1584309231', '1584309231');
INSERT INTO `tb_menu` VALUES ('84', 'admin/system.module/fielddel', '删除', null, '0', '80', '4', '1584309323', '1584309323');
INSERT INTO `tb_menu` VALUES ('85', 'admin/system.module/fieldstate', '状态', null, '0', '80', '5', '1584309386', '1584309386');
INSERT INTO `tb_menu` VALUES ('86', 'admin/system.module/fieldsort', '排序', null, '0', '80', '6', '1584309552', '1584309552');
INSERT INTO `tb_menu` VALUES ('87', 'admin/system.log/index', '日志管理', null, '1', '63', '0', '1584343385', '1584343385');
INSERT INTO `tb_menu` VALUES ('88', 'admin/system.log/index', '列表', null, '0', '87', '0', '1584343519', '1584343519');
INSERT INTO `tb_menu` VALUES ('89', 'admin/system.log/del', '删除', null, '0', '87', '0', '1584343561', '1584343584');
INSERT INTO `tb_menu` VALUES ('90', 'admin/system.log/delAll', '清空', null, '0', '87', '0', '1584343623', '1584343623');

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
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='模型';

-- ----------------------------
-- Records of tb_module
-- ----------------------------
INSERT INTO `tb_module` VALUES ('1', '单页模型', 'page', '关于我们', '1', '0', '*', '', '0', '1');
INSERT INTO `tb_module` VALUES ('2', '文章模型', 'article', '新闻文章', '1', '0', '*', '', '0', '1');

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
  `cs` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='单页';

-- ----------------------------
-- Records of tb_page
-- ----------------------------

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
