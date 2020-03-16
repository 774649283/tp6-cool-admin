CREATE TABLE `{$tablename}` (
			  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
			  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
			  `userid` int(8) unsigned NOT NULL DEFAULT '0',
			  `username` varchar(40) NOT NULL DEFAULT '',
			  `title` varchar(120) NOT NULL DEFAULT '',
			  `title_style` varchar(225) NOT NULL DEFAULT '',
			  `thumb` varchar(225) NOT NULL DEFAULT '',
			  `keywords` varchar(120) NOT NULL DEFAULT '',
			  `description` mediumtext NOT NULL,
			  `content` mediumtext NOT NULL,
			  `template` varchar(40) NOT NULL DEFAULT '',
			  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
			  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
			  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
			  `readgroup` varchar(100) NOT NULL DEFAULT '',
			  `readpoint` smallint(5) NOT NULL DEFAULT '0',
			  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
			  `hits` int(11) unsigned NOT NULL DEFAULT '0',
			  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
			  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
			  PRIMARY KEY (`id`),
			  KEY `status` (`id`,`status`,`listorder`),
			  KEY `catid` (`id`,`catid`,`status`),
			  KEY `listorder` (`id`,`catid`,`status`,`listorder`)
			) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8");
                Db::execute("INSERT INTO `".$prefix."field` VALUES (NULL, '".$moduleid."', 'catid', '栏目', '', '1', '1', '6', '', '必须选择一个栏目', '', 'catid', '','1','', '1', '1', '1')");
                Db::execute("INSERT INTO `".$prefix."field` VALUES (NULL, '".$moduleid."', 'title', '标题', '', '1', '1', '80', '', '标题必须为1-80个字符', '', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)','1','',  '2', '1', '1')");
                Db::execute("INSERT INTO `".$prefix."field` VALUES (NULL, '".$moduleid."', 'keywords', '关键词', '', '0', '0', '80', '', '', '', 'text', 'array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)','1','',  '3', '1', '1')");
                Db::execute("INSERT INTO `".$prefix."field` VALUES (NULL, '".$moduleid."', 'description', 'SEO简介', '', '0', '0', '0', '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)','1','',  '4', '1', '1')");
                Db::execute("INSERT INTO `".$prefix."field` VALUES (NULL, '".$moduleid."', 'content', '内容', '', '0', '0', '0', '', '', '', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'default\' => \'\',\n  \'height\' => \'\',\n  \'showpage\' => \'1\',\n  \'enablekeylink\' => \'0\',\n  \'replacenum\' => \'\',\n  \'enablesaveimage\' => \'0\',\n  \'flashupload\' => \'1\',\n  \'alowuploadexts\' => \'\',\n)','1','',  '5', '1', '1')");
                Db::execute("INSERT INTO `".$prefix."field` VALUES (NULL, '".$moduleid."', 'createtime', '发布时间', '', '1', '0', '0', 'date', '', '', 'datetime', '','1','',  '6', '1', '1')");
                Db::execute("INSERT INTO `".$prefix."field` VALUES (NULL, '".$moduleid."', 'status', '状态', '', '0', '0', '0', '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)','1','','7', '1', '1')");
                Db::execute("INSERT INTO `".$prefix."field` VALUES (NULL, '".$moduleid."', 'recommend', '允许评论', '', '0', '0', '1', '', '', '', 'radio', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)','1','', '8', '0', '0')");
                Db::execute("INSERT INTO `".$prefix."field` VALUES (NULL, '".$moduleid."', 'readpoint', '阅读收费', '', '0', '0', '5', '', '', '', 'number', 'array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)','1','', '9', '0', '0')");
                Db::execute("INSERT INTO `".$prefix."field` VALUES (NULL, '".$moduleid."', 'hits', '点击次数', '', '0', '0', '8', '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)','1','',  '10', '0', '0')");
                Db::execute("INSERT INTO `".$prefix."field` VALUES (NULL, '".$moduleid."', 'readgroup', '访问权限', '', '0', '0', '0', '', '', '', 'groupid', 'array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)','1','', '11', '0', '1')");
                Db::execute("INSERT INTO `".$prefix."field` VALUES (NULL, '".$moduleid."', 'posid', '推荐位', '', '0', '0', '0', '', '', '', 'posid', '','1','', '12', '1', '1')");
                Db::execute("INSERT INTO `".$prefix."field` VALUES (NULL, '".$moduleid."', 'template', '模板', '', '0', '0', '0', '', '', '', 'template', '','1','', '13', '1', '1')