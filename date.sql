/*
Navicat MySQL Data Transfer

Source Server         : main
Source Server Version : 50561
Source Host           : 114.115.177.23:3306
Source Database       : main_coolwl_cn

Target Server Type    : MYSQL
Target Server Version : 50561
File Encoding         : 65001

Date: 2020-03-14 13:00:49
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', '0', 'admin', 'e4be4cf79617a7b72a0692dc0d05d18c', 'OstSqp7JM5', '0', '0');
INSERT INTO `tb_admin` VALUES ('2', '1', 'test', 'e4be4cf79617a7b72a0692dc0d05d18c', 'OstSqp7JM5', '0', '1581948632');

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '菜单路径',
  `title` varchar(255) NOT NULL COMMENT '菜单名称',
  `icon` varchar(255) DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1=>显示，2=>不显示',
  `p_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '#', '系统', 'set', '1', '0', '2', '0', '0');
INSERT INTO `tb_menu` VALUES ('2', 'admin/system.menu/index', '菜单管理', '', '1', '63', '0', '0', '0');
INSERT INTO `tb_menu` VALUES ('3', 'admin/system.menu/form', '编辑和添加', '', '0', '2', '0', '0', '0');
INSERT INTO `tb_menu` VALUES ('4', 'admin/system.menu/save', '保存', '', '0', '2', '0', '0', '0');
INSERT INTO `tb_menu` VALUES ('5', 'admin/system.menu/del', '删除', '', '0', '2', '0', '0', '0');
INSERT INTO `tb_menu` VALUES ('49', 'admin/system.role/index', '角色管理', '', '1', '63', '0', '1581926140', '1581926140');
INSERT INTO `tb_menu` VALUES ('50', 'admin/system.role/save', '编辑和添加', '', '0', '49', '0', '1581926200', '1581926228');
INSERT INTO `tb_menu` VALUES ('51', 'admin/system.role/save', '保存', '', '0', '49', '0', '1581926245', '1581926245');
INSERT INTO `tb_menu` VALUES ('52', 'admin/system.role/del', '删除', '', '0', '49', '0', '1581926256', '1581926256');
INSERT INTO `tb_menu` VALUES ('53', 'admin/system.admin/index', '管理员管理', '', '1', '63', '0', '1581926858', '1581926858');
INSERT INTO `tb_menu` VALUES ('54', 'admin/index/index', '主页', 'home', '1', '0', '1', '0', '0');
INSERT INTO `tb_menu` VALUES ('56', 'admin/system.role/index', '列表', '', '0', '49', '0', '1582005720', '1582005720');
INSERT INTO `tb_menu` VALUES ('57', 'admin/system.menu/index', '列表', '', '0', '2', '0', '1582005742', '1582005742');
INSERT INTO `tb_menu` VALUES ('58', 'admin/system.admin/index', '列表', '', '0', '53', '0', '1582011246', '1582011246');
INSERT INTO `tb_menu` VALUES ('59', 'admin/system.admin/form', '编辑和添加', '', '0', '53', '0', '1582011268', '1582011268');
INSERT INTO `tb_menu` VALUES ('60', 'admin/system.admin/save', '保存', '', '0', '53', '0', '1582011281', '1582011281');
INSERT INTO `tb_menu` VALUES ('61', 'admin/system.admin/del', '删除', '', '0', '53', '0', '1582011294', '1582011294');
INSERT INTO `tb_menu` VALUES ('63', '#', '权限', 'key', '1', '0', '3', '0', '1584112615');
INSERT INTO `tb_menu` VALUES ('64', 'admin/system.system/form', '系统设置', '', '1', '1', '0', '1584019283', '1584019283');
INSERT INTO `tb_menu` VALUES ('65', 'admin/system.system/sms', '短信设置', '', '1', '1', '0', '1584019324', '1584019324');
INSERT INTO `tb_menu` VALUES ('66', 'admin/system.system/wechat', '公众号设置', '', '1', '1', '0', '1584019450', '1584020550');
INSERT INTO `tb_menu` VALUES ('67', '#', '模型', 'template-1', '1', '0', '4', '1584099409', '1584112699');
INSERT INTO `tb_menu` VALUES ('68', 'admin/system.module/index', '模型管理', null, '1', '67', '0', '1584100844', '1584102142');
INSERT INTO `tb_menu` VALUES ('69', 'admin/system.module/index', '列表', null, '0', '68', '0', '1584102267', '1584102267');
INSERT INTO `tb_menu` VALUES ('70', 'admin/system.module/form', '编辑和添加', null, '0', '68', '0', '1584102352', '1584102352');
INSERT INTO `tb_menu` VALUES ('71', 'admin/system.module/save', '保存', null, '0', '68', '0', '1584102385', '1584102385');
INSERT INTO `tb_menu` VALUES ('72', 'admin/system.module/del', '删除', null, '0', '68', '0', '1584102412', '1584111332');

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='模型';

-- ----------------------------
-- Records of tb_module
-- ----------------------------
INSERT INTO `tb_module` VALUES ('1', '单页模型', 'page', '关于我们', '1', '0', '*', '', '0', '1');
INSERT INTO `tb_module` VALUES ('2', '文章模型', 'article', '新闻文章', '1', '0', '*', '', '0', '1');
INSERT INTO `tb_module` VALUES ('3', '图片模型', 'picture', '图片展示', '1', '0', '*', '', '0', '1');
INSERT INTO `tb_module` VALUES ('33', '充值选项', 'prepaid', '充值选项表', '1', '0', '*', '', '0', '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '管理员', '6,54,1,53,49,56,52,2,57', '1581927783', '1582006157');
INSERT INTO `tb_role` VALUES ('2', '客服', '1,53,49,52,51,50,2,3,4,5', '1581927783', '1581945524');

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
