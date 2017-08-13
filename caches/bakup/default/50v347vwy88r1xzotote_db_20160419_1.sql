# phpcms bakfile
# version:PHPCMS V9
# time:2016-04-19 14:37:52
# type:phpcms
# phpcms:http://www.phpcms.cn
# --------------------------------------------------------


DROP TABLE IF EXISTS `v9_admin`;
CREATE TABLE `v9_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` varchar(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_admin` VALUES('1','admin','7c5426b66aeeb5d157a045bd839ca408','1','YiCmaf','123.147.83.106','1461047726','123@163.com','','','');

DROP TABLE IF EXISTS `v9_admin_panel`;
CREATE TABLE `v9_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_admin_role`;
CREATE TABLE `v9_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `v9_admin_role` VALUES('1','超级管理员','超级管理员','0','0');
INSERT INTO `v9_admin_role` VALUES('2','站点管理员','站点管理员','0','0');
INSERT INTO `v9_admin_role` VALUES('3','运营总监','运营总监','1','0');
INSERT INTO `v9_admin_role` VALUES('4','总编','总编','5','0');
INSERT INTO `v9_admin_role` VALUES('5','编辑','编辑','1','0');
INSERT INTO `v9_admin_role` VALUES('7','发布人员','发布人员','0','0');

DROP TABLE IF EXISTS `v9_admin_role_priv`;
CREATE TABLE `v9_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_announce`;
CREATE TABLE `v9_announce` (
  `aid` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `content` text NOT NULL,
  `starttime` date NOT NULL DEFAULT '0000-00-00',
  `endtime` date NOT NULL DEFAULT '0000-00-00',
  `username` varchar(40) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `style` char(15) NOT NULL,
  `show_template` char(30) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `siteid` (`siteid`,`passed`,`endtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_attachment`;
CREATE TABLE `v9_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

INSERT INTO `v9_attachment` VALUES('1','content','15','QQ图片20160126114034.png','2016/0126/20160126114052193.png','241468','png','1','0','0','1','1453779652','','1','fa3ba3497fcc998b1ef569bbf387525c','1');
INSERT INTO `v9_attachment` VALUES('2','content','15','QQ图片20160126114034.png','2016/0126/20160126114151691.png','241468','png','1','0','0','1','1453779711','','1','ddde8005e84859f82d74d9a533b65b13','1');
INSERT INTO `v9_attachment` VALUES('3','content','15','QQ图片20160126114034.png','2016/0126/20160126114335157.png','241468','png','1','0','0','1','1453779815','','1','c90957c7abb845a8804c6eeab5347fa1','1');
INSERT INTO `v9_attachment` VALUES('4','content','15','QQ图片20160126114034.png','2016/0126/20160126114416873.png','241468','png','1','0','0','1','1453779856','','1','b146e973a38758b79f74760b263d3e4e','1');
INSERT INTO `v9_attachment` VALUES('22','content','29','12-1.jpg','2016/0414/20160414041141280.jpg','175050','jpg','1','0','0','1','1460621501','125.84.81.104','1','9da22caf42247fd54095947f5586861c','1');
INSERT INTO `v9_attachment` VALUES('21','content','29','12.jpg','2016/0414/20160414041125845.jpg','145620','jpg','1','0','0','1','1460621485','125.84.81.104','1','2a090635ec77ab8cb928836185a39746','1');
INSERT INTO `v9_attachment` VALUES('7','content','20','20160315112849436.png','2016/0315/20160315112849405.png','468047','png','1','0','0','1','1458012528','125.84.82.218','1','5c660749f39bb669e9944c745cdb7705','1');
INSERT INTO `v9_attachment` VALUES('8','content','20','67.jpg','2016/0315/20160315113055526.jpg','175961','jpg','1','0','0','1','1458012655','125.84.82.218','1','704aeba556b7e6a24dc66c57c680e91f','1');
INSERT INTO `v9_attachment` VALUES('9','content','20','重庆市继续医学教育学分管理办法.png','2016/0315/20160315113244323.png','251901','png','1','0','0','1','1458012764','125.84.82.218','1','ad6f0c0c05c741927a4a75f8e1f2ec5d','1');
INSERT INTO `v9_attachment` VALUES('10','content','15','667.jpg','2016/0316/20160316033826259.jpg','284315','jpg','1','0','0','1','1458113906','125.84.82.63','0','8efbdc8e58f815bee4573cac20914ce4','1');
INSERT INTO `v9_attachment` VALUES('11','content','15','67.jpg','2016/0316/20160316033844651.jpg','284315','jpg','1','0','0','1','1458113924','125.84.82.63','1','7253f6b282cb41e7c6bdf366f7a16546','1');
INSERT INTO `v9_attachment` VALUES('12','content','15','67-1.jpg','2016/0316/20160316034432207.jpg','194578','jpg','1','0','0','1','1458114272','125.84.82.63','1','2d980504c0b6e620cfc26785bb4826bb','1');
INSERT INTO `v9_attachment` VALUES('13','content','28','99.jpg','2016/0316/20160316045245635.jpg','53956','jpg','1','0','0','1','1458118365','125.84.82.63','1','d71d337988c649329b429dc2594a7c90','1');
INSERT INTO `v9_attachment` VALUES('14','content','0','kaos.jpg','2016/0321/20160321110347904.jpg','56395','jpg','1','0','0','1','1458529427','125.84.84.234','1','7b859d12efc430fd72d5574b87e93969','1');
INSERT INTO `v9_attachment` VALUES('15','content','30','20160321110558916.pdf','2016/0321/20160321110558320.pdf','549988','pdf','0','0','0','1','1458529558','125.84.84.234','1','900f71d3c9d035ba4b751b0bcbf4cb51','1');
INSERT INTO `v9_attachment` VALUES('16','content','30','运动可健体，少吃可长寿.pdf','2016/0321/20160321111003266.pdf','731201','pdf','0','0','0','1','1458529803','125.84.84.234','1','16ba5612abfc4f9668d49174230c2f85','1');
INSERT INTO `v9_attachment` VALUES('17','content','30','122网站建设合同.pdf','2016/0321/20160321111524535.pdf','249893','pdf','0','0','0','1','1458530124','125.84.84.234','1','1d5eed93f3b5368b1ca87d95ab26b851','1');
INSERT INTO `v9_attachment` VALUES('18','content','30','20160322103251613.pdf','2016/0322/20160322103251363.pdf','174485','pdf','0','0','0','1','1458613971','125.84.84.234','1','85eec15668a510142b162ec9cb510bb3','1');
INSERT INTO `v9_attachment` VALUES('19','content','0','90.jpg','2016/0405/20160405024952312.jpg','16300','jpg','1','0','0','1','1459838992','125.84.83.86','1','99e72b0e488cd064032d49df8fc265d2','1');
INSERT INTO `v9_attachment` VALUES('20','content','0','90-1.jpg','2016/0405/20160405025021147.jpg','7966','jpg','1','0','0','1','1459839021','125.84.83.86','1','eab895fd4beddae6498c56a126a85789','1');
INSERT INTO `v9_attachment` VALUES('23','content','29','12.jpg','2016/0414/20160414041209493.jpg','145620','jpg','1','0','0','1','1460621529','125.84.81.104','1','4a1a6fbde07d136d1479fa0cd98025da','1');
INSERT INTO `v9_attachment` VALUES('24','content','29','12.jpg','2016/0414/20160414041229485.jpg','145620','jpg','1','0','0','1','1460621549','125.84.81.104','1','b4cb08b8d16b0487ddd3206b46301855','1');
INSERT INTO `v9_attachment` VALUES('25','content','29','12-1.jpg','2016/0414/20160414041247497.jpg','175050','jpg','1','0','0','1','1460621567','125.84.81.104','1','7549544dae8f741ff0553916ab002a72','1');

DROP TABLE IF EXISTS `v9_attachment_index`;
CREATE TABLE `v9_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_attachment_index` VALUES('c-15-2','1');
INSERT INTO `v9_attachment_index` VALUES('c-15-2','1');
INSERT INTO `v9_attachment_index` VALUES('c-15-2','2');
INSERT INTO `v9_attachment_index` VALUES('c-15-2','3');
INSERT INTO `v9_attachment_index` VALUES('c-15-2','4');
INSERT INTO `v9_attachment_index` VALUES('c-29-10','22');
INSERT INTO `v9_attachment_index` VALUES('c-29-10','21');
INSERT INTO `v9_attachment_index` VALUES('c-15-20','11');
INSERT INTO `v9_attachment_index` VALUES('c-20-17','7');
INSERT INTO `v9_attachment_index` VALUES('c-20-17','8');
INSERT INTO `v9_attachment_index` VALUES('c-20-17','9');
INSERT INTO `v9_attachment_index` VALUES('c-15-20','11');
INSERT INTO `v9_attachment_index` VALUES('c-15-21','12');
INSERT INTO `v9_attachment_index` VALUES('c-15-21','12');
INSERT INTO `v9_attachment_index` VALUES('c-28-9','13');
INSERT INTO `v9_attachment_index` VALUES('c-15-20','11');
INSERT INTO `v9_attachment_index` VALUES('c-15-20','12');
INSERT INTO `v9_attachment_index` VALUES('catid-18','14');
INSERT INTO `v9_attachment_index` VALUES('c-30-2','15');
INSERT INTO `v9_attachment_index` VALUES('c-30-3','16');
INSERT INTO `v9_attachment_index` VALUES('c-30-4','17');
INSERT INTO `v9_attachment_index` VALUES('c-30-8','18');
INSERT INTO `v9_attachment_index` VALUES('catid-28','19');
INSERT INTO `v9_attachment_index` VALUES('catid-29','20');
INSERT INTO `v9_attachment_index` VALUES('c-29-10','23');
INSERT INTO `v9_attachment_index` VALUES('c-29-10','24');
INSERT INTO `v9_attachment_index` VALUES('c-29-10','25');

DROP TABLE IF EXISTS `v9_badword`;
CREATE TABLE `v9_badword` (
  `badid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL DEFAULT '1',
  `replaceword` char(20) NOT NULL DEFAULT '0',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_block`;
CREATE TABLE `v9_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_block_history`;
CREATE TABLE `v9_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_block_priv`;
CREATE TABLE `v9_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_cache`;
CREATE TABLE `v9_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`filename`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_cache` VALUES('mood_program.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    1 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'震惊\',\n      \'pic\' => \'mood/a1.gif\',\n    ),\n    2 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'不解\',\n      \'pic\' => \'mood/a2.gif\',\n    ),\n    3 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'愤怒\',\n      \'pic\' => \'mood/a3.gif\',\n    ),\n    4 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'杯具\',\n      \'pic\' => \'mood/a4.gif\',\n    ),\n    5 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'无聊\',\n      \'pic\' => \'mood/a5.gif\',\n    ),\n    6 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'高兴\',\n      \'pic\' => \'mood/a6.gif\',\n    ),\n    7 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'支持\',\n      \'pic\' => \'mood/a7.gif\',\n    ),\n    8 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'超赞\',\n      \'pic\' => \'mood/a8.gif\',\n    ),\n    9 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n    10 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_content.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  6 => \'1\',\n  7 => \'1\',\n  8 => \'1\',\n  9 => \'1\',\n  10 => \'1\',\n  11 => \'1\',\n  12 => \'1\',\n  13 => \'1\',\n  14 => \'1\',\n  15 => \'1\',\n  16 => \'1\',\n  17 => \'1\',\n  18 => \'1\',\n  19 => \'1\',\n  20 => \'1\',\n  21 => \'1\',\n  30 => \'1\',\n  22 => \'1\',\n  23 => \'1\',\n  24 => \'1\',\n  25 => \'1\',\n  26 => \'1\',\n  27 => \'1\',\n  28 => \'1\',\n  29 => \'1\',\n  31 => \'1\',\n  32 => \'1\',\n  33 => \'1\',\n  34 => \'1\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_content_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  6 => \n  array (\n    \'catid\' => \'6\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'6,12,13,14\',\n    \'catname\' => \'单位概况\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'12\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'danweigaikuang\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=6\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'6\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'danweigaikuang\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  7 => \n  array (\n    \'catid\' => \'7\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'7,15,16\',\n    \'catname\' => \'工作动态\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'15\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'gongzuodongtai\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=7\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'7\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'gongzuodongtai\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  8 => \n  array (\n    \'catid\' => \'8\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'8,19\',\n    \'catname\' => \'办事指南\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'19\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'banshizhinan\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=8\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'8\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'banshizhinan\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  9 => \n  array (\n    \'catid\' => \'9\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'9,20\',\n    \'catname\' => \'政策法规\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'20\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'zhengcefagui\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=9\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'9\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'zhengcefagui\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  10 => \n  array (\n    \'catid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'10,17,18,28,29\',\n    \'catname\' => \'继续教育\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'jixujiaoyu\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=10\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_jxjy\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'10\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'jixujiaoyu\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  11 => \n  array (\n    \'catid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'11,21,31,32\',\n    \'catname\' => \'联系我们\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'21\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'lianxiwomen\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=11\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'11\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'lianxiwomen\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  12 => \n  array (\n    \'catid\' => \'12\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'12\',\n    \'catname\' => \'单位简介\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'danweigaikuang/\',\n    \'catdir\' => \'danweijianjie\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=12\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_about\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'12\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'danweijianjie\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  13 => \n  array (\n    \'catid\' => \'13\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'13\',\n    \'catname\' => \'领导分工\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'danweigaikuang/\',\n    \'catdir\' => \'lingdaofengong\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=13\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_about\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'13\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'lingdaofengong\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  14 => \n  array (\n    \'catid\' => \'14\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'6\',\n    \'arrparentid\' => \'0,6\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'14\',\n    \'catname\' => \'机构设置\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'danweigaikuang/\',\n    \'catdir\' => \'jigoushezhi\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=14\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_about\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'14\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'jigoushezhi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  15 => \n  array (\n    \'catid\' => \'15\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'7\',\n    \'arrparentid\' => \'0,7\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'15\',\n    \'catname\' => \'新闻中心\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'gongzuodongtai/\',\n    \'catdir\' => \'xinwenzhongxin\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=15\',\n    \'items\' => \'7\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'15\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xinwenzhongxin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  16 => \n  array (\n    \'catid\' => \'16\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'7\',\n    \'arrparentid\' => \'0,7\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'16\',\n    \'catname\' => \'公告通知\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'gongzuodongtai/\',\n    \'catdir\' => \'gonggaotongzhi\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=16\',\n    \'items\' => \'2\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'16\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'gonggaotongzhi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  17 => \n  array (\n    \'catid\' => \'17\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'17\',\n    \'catname\' => \'学习中心\',\n    \'style\' => \'\',\n    \'image\' => \'http://jxjy.90h.link/images/pic-9.jpg\',\n    \'description\' => \'22\',\n    \'parentdir\' => \'jixujiaoyu/\',\n    \'catdir\' => \'xuexi\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=17\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_pic\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'17\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xuexizhongxin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  18 => \n  array (\n    \'catid\' => \'18\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'18\',\n    \'catname\' => \'考试中心\',\n    \'style\' => \'\',\n    \'image\' => \'http://jxjy.90h.link/uploadfile/2016/0321/20160321110347904.jpg\',\n    \'description\' => \'\',\n    \'parentdir\' => \'jixujiaoyu/\',\n    \'catdir\' => \'kaoshi\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=18\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_kszx\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'18\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'kaoshizhongxin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  19 => \n  array (\n    \'catid\' => \'19\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'8\',\n    \'arrparentid\' => \'0,8\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'19\',\n    \'catname\' => \'办事指南\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'banshizhinan/\',\n    \'catdir\' => \'bszl\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=19\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'19\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'banshizhinan\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  20 => \n  array (\n    \'catid\' => \'20\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'9\',\n    \'arrparentid\' => \'0,9\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'20\',\n    \'catname\' => \'政策法规\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'zhengcefagui/\',\n    \'catdir\' => \'zcfg\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=20\',\n    \'items\' => \'4\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'20\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'zhengcefagui\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  21 => \n  array (\n    \'catid\' => \'21\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'11\',\n    \'arrparentid\' => \'0,11\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'21\',\n    \'catname\' => \'联系方式\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'lianxiwomen/\',\n    \'catdir\' => \'lxfs\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=21\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_about\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'21\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'lianxifangshi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  22 => \n  array (\n    \'catid\' => \'22\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'22,30,23,24,25,26,27\',\n    \'catname\' => \'资料库\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'30\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'ziliao\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=22\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_video\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'22\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'ziliaoku\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  30 => \n  array (\n    \'catid\' => \'30\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'22\',\n    \'arrparentid\' => \'0,22\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'30\',\n    \'catname\' => \'课件资料\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'ziliao/\',\n    \'catdir\' => \'kjzl\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=30\',\n    \'items\' => \'4\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_video\",\"show_template\":\"show_video\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'22\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'kejianziliao\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  23 => \n  array (\n    \'catid\' => \'23\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'22\',\n    \'arrparentid\' => \'0,22\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'23\',\n    \'catname\' => \'名师授课\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'ziliao/\',\n    \'catdir\' => \'mingshishouke\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=23\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'23\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'mingshishouke\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  24 => \n  array (\n    \'catid\' => \'24\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'22\',\n    \'arrparentid\' => \'0,22\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'24\',\n    \'catname\' => \'医学会议\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'ziliao/\',\n    \'catdir\' => \'yixuehuiyi\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=24\',\n    \'items\' => \'5\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'24\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'yixuehuiyi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  25 => \n  array (\n    \'catid\' => \'25\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'22\',\n    \'arrparentid\' => \'0,22\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'25\',\n    \'catname\' => \'技能培训\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'ziliao/\',\n    \'catdir\' => \'jinengpeixun\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=25\',\n    \'items\' => \'4\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'25\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'jinengpeixun\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  26 => \n  array (\n    \'catid\' => \'26\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'22\',\n    \'arrparentid\' => \'0,22\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'26\',\n    \'catname\' => \'临床指南\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'ziliao/\',\n    \'catdir\' => \'linchuangzhinan\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=26\',\n    \'items\' => \'4\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'26\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'linchuangzhinan\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  27 => \n  array (\n    \'catid\' => \'27\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'22\',\n    \'arrparentid\' => \'0,22\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'27\',\n    \'catname\' => \'搜索结果\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'ziliao/\',\n    \'catdir\' => \'search\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=27\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_video\",\"list_template\":\"list_search\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'27\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'sousuojieguo\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  28 => \n  array (\n    \'catid\' => \'28\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'28\',\n    \'catname\' => \'最新动态\',\n    \'style\' => \'\',\n    \'image\' => \'http://jxjy.90h.link/uploadfile/2016/0405/20160405024952312.jpg\',\n    \'description\' => \'\',\n    \'parentdir\' => \'jixujiaoyu/\',\n    \'catdir\' => \'zxdt\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=28\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'28\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'zuixindongtai\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  29 => \n  array (\n    \'catid\' => \'29\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'29\',\n    \'catname\' => \'帮助中心\',\n    \'style\' => \'\',\n    \'image\' => \'http://jxjy.90h.link/uploadfile/2016/0405/20160405025021147.jpg\',\n    \'description\' => \'\',\n    \'parentdir\' => \'jixujiaoyu/\',\n    \'catdir\' => \'help\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=29\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'29\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'bangzhuzhongxin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  31 => \n  array (\n    \'catid\' => \'31\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'11\',\n    \'arrparentid\' => \'0,11\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'31\',\n    \'catname\' => \'帮助中心\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'lianxiwomen/\',\n    \'catdir\' => \'help\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=31\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'31\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'bangzhuzhongxin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  32 => \n  array (\n    \'catid\' => \'32\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'11\',\n    \'arrparentid\' => \'0,11\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'32\',\n    \'catname\' => \'新手入门\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'lianxiwomen/\',\n    \'catdir\' => \'room\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=32\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'32\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xinshourumen\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  33 => \n  array (\n    \'catid\' => \'33\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'33,34\',\n    \'catname\' => \'其他栏目管理\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'other\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=33\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'33\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'qitalanmuguanli\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  34 => \n  array (\n    \'catid\' => \'34\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'33\',\n    \'arrparentid\' => \'0,33\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'34\',\n    \'catname\' => \'banner管理\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'other/\',\n    \'catdir\' => \'banner\',\n    \'url\' => \'http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=34\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'34\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'bannerguanli\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('sitelist.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'siteid\' => \'1\',\n    \'name\' => \'重庆医学继续考试网\',\n    \'dirname\' => \'\',\n    \'domain\' => \'http://jxjy.90h.link/\',\n    \'site_title\' => \'重庆医学继续考试网\',\n    \'keywords\' => \'继续医学教育,医学考试,执业护士,远程培训,公共卫生,乡村医生,健康教育,执业医师,远程教育,,医学培训,科教管理,CME,医疗信息化,科教平台,继教管理,医学考试培训,社区卫生人员培训,居民健康档案,农村卫生人员\"\',\n    \'description\' => \'重庆医学继续考试网站是卫生部批准的医学专业信息网站，是国家药监局批准的经营性医药网站，也是目前卫生部批准的国内第一家可以进行网络远程医学继续教育，并有权授予市级一、二类继续教育学分的医学教育网站。\',\n    \'release_point\' => \'\',\n    \'default_style\' => \'default\',\n    \'template\' => \'default\',\n    \'setting\' => \'{\"upload_maxsize\":\"2048\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"0\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"statics\\\\/images\\\\/water\\\\/\\\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"9\"}\',\n    \'uuid\' => \'557e75e8-c330-11e5-b7d8-b8975a19228e\',\n    \'url\' => \'http://jxjy.90h.link/\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('downservers.cache.php','caches_commons/caches_data/','<?php\nreturn NULL;\n?>');
INSERT INTO `v9_cache` VALUES('badword.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('ipbanned.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('keylink.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('position.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  2 => \n  array (\n    \'posid\' => \'2\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页头条推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'4\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  1 => \n  array (\n    \'posid\' => \'1\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页焦点图推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'1\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  16 => \n  array (\n    \'posid\' => \'16\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页每日热点\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  15 => \n  array (\n    \'posid\' => \'15\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页头条推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  14 => \n  array (\n    \'posid\' => \'14\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  12 => \n  array (\n    \'posid\' => \'12\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页图片推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  10 => \n  array (\n    \'posid\' => \'10\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'栏目首页推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  9 => \n  array (\n    \'posid\' => \'9\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'网站顶部推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  8 => \n  array (\n    \'posid\' => \'8\',\n    \'modelid\' => \'30\',\n    \'catid\' => \'54\',\n    \'name\' => \'图片频道首页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  5 => \n  array (\n    \'posid\' => \'5\',\n    \'modelid\' => \'69\',\n    \'catid\' => \'0\',\n    \'name\' => \'推荐下载\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  13 => \n  array (\n    \'posid\' => \'13\',\n    \'modelid\' => \'82\',\n    \'catid\' => \'0\',\n    \'name\' => \'栏目页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  17 => \n  array (\n    \'posid\' => \'17\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频栏目精彩推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('role_siteid.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('role.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'超级管理员\',\n  2 => \'站点管理员\',\n  3 => \'运营总监\',\n  4 => \'总编\',\n  5 => \'编辑\',\n  7 => \'发布人员\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('urlrules_detail.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'urlruleid\' => \'1\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n    \'example\' => \'news/china/1000.html\',\n  ),\n  6 => \n  array (\n    \'urlruleid\' => \'6\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=lists&catid=1&page=1\',\n  ),\n  11 => \n  array (\n    \'urlruleid\' => \'11\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'2010/catdir_0720/1_2.html\',\n  ),\n  12 => \n  array (\n    \'urlruleid\' => \'12\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'it/product/2010/0720/1_2.html\',\n  ),\n  16 => \n  array (\n    \'urlruleid\' => \'16\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=show&catid=1&id=1\',\n  ),\n  17 => \n  array (\n    \'urlruleid\' => \'17\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'show-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'show-1-2-1.html\',\n  ),\n  18 => \n  array (\n    \'urlruleid\' => \'18\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'content-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'content-1-2-1.html\',\n  ),\n  30 => \n  array (\n    \'urlruleid\' => \'30\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'list-{$catid}-{$page}.html\',\n    \'example\' => \'list-1-1.html\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('urlrules.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n  6 => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n  11 => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n  12 => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n  16 => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n  17 => \'show-{$catid}-{$id}-{$page}.html\',\n  18 => \'content-{$catid}-{$id}-{$page}.html\',\n  30 => \'list-{$catid}-{$page}.html\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('modules.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  \'admin\' => \n  array (\n    \'module\' => \'admin\',\n    \'name\' => \'admin\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'{\"admin_email\":\"phpcms@phpcms.cn\",\"maxloginfailedtimes\":\"8\",\"minrefreshtime\":\"2\",\"mail_type\":\"1\",\"mail_server\":\"smtp.qq.com\",\"mail_port\":\"25\",\"category_ajax\":\"0\",\"mail_user\":\"phpcms.cn@foxmail.com\",\"mail_auth\":\"1\",\"mail_from\":\"phpcms.cn@foxmail.com\",\"mail_password\":\"\",\"errorlog_size\":\"20\"}\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-18\',\n    \'updatedate\' => \'2010-10-18\',\n  ),\n  \'member\' => \n  array (\n    \'module\' => \'member\',\n    \'name\' => \'会员\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'allowregister\\\' => \\\'1\\\',\n  \\\'choosemodel\\\' => \\\'1\\\',\n  \\\'enablemailcheck\\\' => \\\'0\\\',\n  \\\'registerverify\\\' => \\\'0\\\',\n  \\\'showapppoint\\\' => \\\'0\\\',\n  \\\'rmb_point_rate\\\' => \\\'10\\\',\n  \\\'defualtpoint\\\' => \\\'0\\\',\n  \\\'defualtamount\\\' => \\\'0\\\',\n  \\\'showregprotocol\\\' => \\\'0\\\',\n  \\\'regprotocol\\\' => \\\'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \\\',\n  \\\'registerverifymessage\\\' => \\\' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n  \\\'forgetpassword\\\' => \\\' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'pay\' => \n  array (\n    \'module\' => \'pay\',\n    \'name\' => \'支付\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'digg\' => \n  array (\n    \'module\' => \'digg\',\n    \'name\' => \'顶一下\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'special\' => \n  array (\n    \'module\' => \'special\',\n    \'name\' => \'专题\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'content\' => \n  array (\n    \'module\' => \'content\',\n    \'name\' => \'内容模块\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'search\' => \n  array (\n    \'module\' => \'search\',\n    \'name\' => \'全站搜索\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'fulltextenble\\\' => \\\'1\\\',\n  \\\'relationenble\\\' => \\\'1\\\',\n  \\\'suggestenable\\\' => \\\'1\\\',\n  \\\'sphinxenable\\\' => \\\'0\\\',\n  \\\'sphinxhost\\\' => \\\'10.228.134.102\\\',\n  \\\'sphinxport\\\' => \\\'9312\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'scan\' => \n  array (\n    \'module\' => \'scan\',\n    \'name\' => \'木马扫描\',\n    \'url\' => \'scan\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'attachment\' => \n  array (\n    \'module\' => \'attachment\',\n    \'name\' => \'附件\',\n    \'url\' => \'attachment\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'block\' => \n  array (\n    \'module\' => \'block\',\n    \'name\' => \'碎片\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'collection\' => \n  array (\n    \'module\' => \'collection\',\n    \'name\' => \'采集模块\',\n    \'url\' => \'collection\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'dbsource\' => \n  array (\n    \'module\' => \'dbsource\',\n    \'name\' => \'数据源\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'template\' => \n  array (\n    \'module\' => \'template\',\n    \'name\' => \'模板风格\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'release\' => \n  array (\n    \'module\' => \'release\',\n    \'name\' => \'发布点\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'video\' => \n  array (\n    \'module\' => \'video\',\n    \'name\' => \'视频库\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2012-09-28\',\n    \'updatedate\' => \'2012-09-28\',\n  ),\n  \'announce\' => \n  array (\n    \'module\' => \'announce\',\n    \'name\' => \'公告\',\n    \'url\' => \'announce/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'公告\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-01-25\',\n    \'updatedate\' => \'2016-01-25\',\n  ),\n  \'comment\' => \n  array (\n    \'module\' => \'comment\',\n    \'name\' => \'评论\',\n    \'url\' => \'comment/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'评论\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-01-25\',\n    \'updatedate\' => \'2016-01-25\',\n  ),\n  \'link\' => \n  array (\n    \'module\' => \'link\',\n    \'name\' => \'友情链接\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  1 => \n  array (\n    \\\'is_post\\\' => \\\'1\\\',\n    \\\'enablecheckcode\\\' => \\\'0\\\',\n  ),\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'vote\' => \n  array (\n    \'module\' => \'vote\',\n    \'name\' => \'投票\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\r\n  1 => \r\n  array (\r\n    \\\'default_style\\\' => \\\'default\\\',\r\n    \\\'vote_tp_template\\\' => \\\'vote_tp\\\',\r\n    \\\'allowguest\\\' => \\\'1\\\',\r\n    \\\'enabled\\\' => \\\'1\\\',\r\n    \\\'interval\\\' => \\\'1\\\',\r\n    \\\'credit\\\' => \\\'1\\\',\r\n  ),\r\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'message\' => \n  array (\n    \'module\' => \'message\',\n    \'name\' => \'短消息\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'mood\' => \n  array (\n    \'module\' => \'mood\',\n    \'name\' => \'新闻心情\',\n    \'url\' => \'mood/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'新闻心情\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-01-25\',\n    \'updatedate\' => \'2016-01-25\',\n  ),\n  \'poster\' => \n  array (\n    \'module\' => \'poster\',\n    \'name\' => \'广告模块\',\n    \'url\' => \'poster/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'广告模块\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-01-25\',\n    \'updatedate\' => \'2016-01-25\',\n  ),\n  \'formguide\' => \n  array (\n    \'module\' => \'formguide\',\n    \'name\' => \'表单向导\',\n    \'url\' => \'formguide/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'formguide\',\n    \'setting\' => \'array (\n  \\\'allowmultisubmit\\\' => \\\'1\\\',\n  \\\'interval\\\' => \\\'30\\\',\n  \\\'allowunreg\\\' => \\\'0\\\',\n  \\\'mailmessage\\\' => \\\'用户向我们提交了表单数据，赶快去看看吧。\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-20\',\n    \'updatedate\' => \'2010-10-20\',\n  ),\n  \'wap\' => \n  array (\n    \'module\' => \'wap\',\n    \'name\' => \'手机门户\',\n    \'url\' => \'wap/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'手机门户\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-01-25\',\n    \'updatedate\' => \'2016-01-25\',\n  ),\n  \'upgrade\' => \n  array (\n    \'module\' => \'upgrade\',\n    \'name\' => \'在线升级\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-05-18\',\n    \'updatedate\' => \'2011-05-18\',\n  ),\n  \'tag\' => \n  array (\n    \'module\' => \'tag\',\n    \'name\' => \'标签向导\',\n    \'url\' => \'tag/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'标签向导\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-01-25\',\n    \'updatedate\' => \'2016-01-25\',\n  ),\n  \'sms\' => \n  array (\n    \'module\' => \'sms\',\n    \'name\' => \'短信平台\',\n    \'url\' => \'sms/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'短信平台\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-09-02\',\n    \'updatedate\' => \'2011-09-02\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('type_content_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('model.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'modelid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'name\' => \'文章模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'news\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  2 => \n  array (\n    \'modelid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'name\' => \'下载模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'download\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_download\',\n    \'list_template\' => \'list_download\',\n    \'show_template\' => \'show_download\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  3 => \n  array (\n    \'modelid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'name\' => \'图片模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'picture\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_picture\',\n    \'list_template\' => \'list_picture\',\n    \'show_template\' => \'show_picture\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  11 => \n  array (\n    \'modelid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'name\' => \'视频模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'video\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_video\',\n    \'list_template\' => \'list_video\',\n    \'show_template\' => \'show_video\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  12 => \n  array (\n    \'modelid\' => \'12\',\n    \'siteid\' => \'1\',\n    \'name\' => \'学习课件\',\n    \'description\' => \'学习课件\',\n    \'tablename\' => \'kj\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('workflow_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'workflowid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'1\',\n    \'workname\' => \'一级审核\',\n    \'description\' => \'审核一次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  2 => \n  array (\n    \'workflowid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'2\',\n    \'workname\' => \'二级审核\',\n    \'description\' => \'审核两次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  3 => \n  array (\n    \'workflowid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'3\',\n    \'workname\' => \'三级审核\',\n    \'description\' => \'审核三次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  4 => \n  array (\n    \'workflowid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'4\',\n    \'workname\' => \'四级审核\',\n    \'description\' => \'四级审核\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('member_model.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  10 => \n  array (\n    \'modelid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'name\' => \'普通会员\',\n    \'description\' => \'普通会员\',\n    \'tablename\' => \'member_detail\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'2\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('special.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('common.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'category_ajax\' => \'0\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  6 => \'0\',\n  7 => \'0\',\n  17 => \'0\',\n  16 => \'2\',\n  15 => \'7\',\n  8 => \'0\',\n  9 => \'0\',\n  10 => \'0\',\n  11 => \'0\',\n  12 => \'1\',\n  13 => \'0\',\n  14 => \'1\',\n  18 => \'0\',\n  22 => \'0\',\n  19 => \'0\',\n  20 => \'4\',\n  21 => \'0\',\n  23 => \'0\',\n  24 => \'5\',\n  25 => \'4\',\n  26 => \'4\',\n  27 => \'0\',\n  28 => \'1\',\n  29 => \'2\',\n  31 => \'0\',\n  32 => \'0\',\n  33 => \'0\',\n  34 => \'0\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_2.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_3.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_11.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('type_content.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('vote.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'default_style\' => \'default\',\n    \'vote_tp_template\' => \'vote_tp\',\n    \'allowguest\' => \'1\',\n    \'enabled\' => \'1\',\n    \'interval\' => \'1\',\n    \'credit\' => \'1\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('link.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('type_.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_12.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  30 => \'4\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('bakup_tables.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  0 => \'v9_admin\',\n  1 => \'v9_admin_panel\',\n  2 => \'v9_admin_role\',\n  3 => \'v9_admin_role_priv\',\n  4 => \'v9_announce\',\n  5 => \'v9_attachment\',\n  6 => \'v9_attachment_index\',\n  7 => \'v9_badword\',\n  8 => \'v9_block\',\n  9 => \'v9_block_history\',\n  10 => \'v9_block_priv\',\n  11 => \'v9_cache\',\n  12 => \'v9_category\',\n  13 => \'v9_category_priv\',\n  14 => \'v9_collection_content\',\n  15 => \'v9_collection_history\',\n  16 => \'v9_collection_node\',\n  17 => \'v9_collection_program\',\n  18 => \'v9_comment\',\n  19 => \'v9_comment_check\',\n  20 => \'v9_comment_data_1\',\n  21 => \'v9_comment_setting\',\n  22 => \'v9_comment_table\',\n  23 => \'v9_content_check\',\n  24 => \'v9_copyfrom\',\n  25 => \'v9_datacall\',\n  26 => \'v9_dbsource\',\n  27 => \'v9_download\',\n  28 => \'v9_download_data\',\n  29 => \'v9_downservers\',\n  30 => \'v9_extend_setting\',\n  31 => \'v9_favorite\',\n  32 => \'v9_hits\',\n  33 => \'v9_ipbanned\',\n  34 => \'v9_keylink\',\n  35 => \'v9_keyword\',\n  36 => \'v9_keyword_data\',\n  37 => \'v9_kj\',\n  38 => \'v9_kj_data\',\n  39 => \'v9_link\',\n  40 => \'v9_linkage\',\n  41 => \'v9_log\',\n  42 => \'v9_member\',\n  43 => \'v9_member_detail\',\n  44 => \'v9_member_group\',\n  45 => \'v9_member_menu\',\n  46 => \'v9_member_verify\',\n  47 => \'v9_member_vip\',\n  48 => \'v9_menu\',\n  49 => \'v9_message\',\n  50 => \'v9_message_data\',\n  51 => \'v9_message_group\',\n  52 => \'v9_model\',\n  53 => \'v9_model_field\',\n  54 => \'v9_module\',\n  55 => \'v9_mood\',\n  56 => \'v9_news\',\n  57 => \'v9_news_data\',\n  58 => \'v9_page\',\n  59 => \'v9_pay_account\',\n  60 => \'v9_pay_payment\',\n  61 => \'v9_pay_spend\',\n  62 => \'v9_picture\',\n  63 => \'v9_picture_data\',\n  64 => \'v9_position\',\n  65 => \'v9_position_data\',\n  66 => \'v9_poster\',\n  67 => \'v9_poster_201601\',\n  68 => \'v9_poster_space\',\n  69 => \'v9_queue\',\n  70 => \'v9_release_point\',\n  71 => \'v9_search\',\n  72 => \'v9_search_keyword\',\n  73 => \'v9_session\',\n  74 => \'v9_site\',\n  75 => \'v9_sms_report\',\n  76 => \'v9_special\',\n  77 => \'v9_special_c_data\',\n  78 => \'v9_special_content\',\n  79 => \'v9_sphinx_counter\',\n  80 => \'v9_sso_admin\',\n  81 => \'v9_sso_applications\',\n  82 => \'v9_sso_members\',\n  83 => \'v9_sso_messagequeue\',\n  84 => \'v9_sso_session\',\n  85 => \'v9_sso_settings\',\n  86 => \'v9_tag\',\n  87 => \'v9_template_bak\',\n  88 => \'v9_times\',\n  89 => \'v9_type\',\n  90 => \'v9_urlrule\',\n  91 => \'v9_video\',\n  92 => \'v9_video_content\',\n  93 => \'v9_video_data\',\n  94 => \'v9_video_store\',\n  95 => \'v9_vote_data\',\n  96 => \'v9_vote_option\',\n  97 => \'v9_vote_subject\',\n  98 => \'v9_wap\',\n  99 => \'v9_wap_type\',\n  100 => \'v9_workflow\',\n);\n?>');

DROP TABLE IF EXISTS `v9_category`;
CREATE TABLE `v9_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

INSERT INTO `v9_category` VALUES('6','1','content','0','1','0','0','1','6,12,13,14','单位概况','','','12','','danweigaikuang','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=6','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','6','1','0','danweigaikuang','');
INSERT INTO `v9_category` VALUES('7','1','content','0','1','0','0','1','7,15,16','工作动态','','','15','','gongzuodongtai','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=7','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','7','1','0','gongzuodongtai','');
INSERT INTO `v9_category` VALUES('17','1','content','0','1','10','0,10','0','17','学习中心','','http://jxjy.90h.link/images/pic-9.jpg','22','jixujiaoyu/','xuexi','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=17','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_pic\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','17','1','0','xuexizhongxin','');
INSERT INTO `v9_category` VALUES('16','1','content','0','1','7','0,7','0','16','公告通知','','','','gongzuodongtai/','gonggaotongzhi','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=16','2','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','16','1','0','gonggaotongzhi','');
INSERT INTO `v9_category` VALUES('15','1','content','0','1','7','0,7','0','15','新闻中心','','','','gongzuodongtai/','xinwenzhongxin','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=15','7','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','15','1','0','xinwenzhongxin','');
INSERT INTO `v9_category` VALUES('8','1','content','0','1','0','0','1','8,19','办事指南','','','19','','banshizhinan','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=8','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','8','1','0','banshizhinan','');
INSERT INTO `v9_category` VALUES('9','1','content','0','1','0','0','1','9,20','政策法规','','','20','','zhengcefagui','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=9','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','9','1','0','zhengcefagui','');
INSERT INTO `v9_category` VALUES('10','1','content','0','1','0','0','1','10,17,18,28,29','继续教育','','','','','jixujiaoyu','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=10','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_jxjy\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','10','1','0','jixujiaoyu','');
INSERT INTO `v9_category` VALUES('11','1','content','0','1','0','0','1','11,21,31,32','联系我们','','','21','','lianxiwomen','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=11','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','11','1','0','lianxiwomen','');
INSERT INTO `v9_category` VALUES('12','1','content','0','1','6','0,6','0','12','单位简介','','','','danweigaikuang/','danweijianjie','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=12','1','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_about\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','12','1','0','danweijianjie','');
INSERT INTO `v9_category` VALUES('13','1','content','0','1','6','0,6','0','13','领导分工','','','','danweigaikuang/','lingdaofengong','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=13','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_about\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','13','1','0','lingdaofengong','');
INSERT INTO `v9_category` VALUES('14','1','content','0','1','6','0,6','0','14','机构设置','','','','danweigaikuang/','jigoushezhi','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=14','1','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_about\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','14','1','0','jigoushezhi','');
INSERT INTO `v9_category` VALUES('18','1','content','0','1','10','0,10','0','18','考试中心','','http://jxjy.90h.link/uploadfile/2016/0321/20160321110347904.jpg','','jixujiaoyu/','kaoshi','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=18','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_kszx\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','18','1','0','kaoshizhongxin','');
INSERT INTO `v9_category` VALUES('22','1','content','0','1','0','0','1','22,30,23,24,25,26,27','资料库','','','30','','ziliao','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=22','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_video\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','22','0','0','ziliaoku','');
INSERT INTO `v9_category` VALUES('19','1','content','0','1','8','0,8','0','19','办事指南','','','','banshizhinan/','bszl','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=19','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','19','1','0','banshizhinan','');
INSERT INTO `v9_category` VALUES('20','1','content','0','1','9','0,9','0','20','政策法规','','','','zhengcefagui/','zcfg','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=20','4','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','20','1','0','zhengcefagui','');
INSERT INTO `v9_category` VALUES('21','1','content','0','1','11','0,11','0','21','联系方式','','','','lianxiwomen/','lxfs','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=21','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_about\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','21','1','0','lianxifangshi','');
INSERT INTO `v9_category` VALUES('23','1','content','0','1','22','0,22','0','23','名师授课','','','','ziliao/','mingshishouke','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=23','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','23','1','0','mingshishouke','');
INSERT INTO `v9_category` VALUES('24','1','content','0','1','22','0,22','0','24','医学会议','','','','ziliao/','yixuehuiyi','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=24','5','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','24','1','0','yixuehuiyi','');
INSERT INTO `v9_category` VALUES('25','1','content','0','1','22','0,22','0','25','技能培训','','','','ziliao/','jinengpeixun','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=25','4','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','25','1','0','jinengpeixun','');
INSERT INTO `v9_category` VALUES('26','1','content','0','1','22','0,22','0','26','临床指南','','','','ziliao/','linchuangzhinan','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=26','4','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','26','1','0','linchuangzhinan','');
INSERT INTO `v9_category` VALUES('27','1','content','0','1','22','0,22','0','27','搜索结果','','','','ziliao/','search','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=27','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category_video\",\"list_template\":\"list_search\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','27','0','0','sousuojieguo','');
INSERT INTO `v9_category` VALUES('28','1','content','0','1','10','0,10','0','28','最新动态','','http://jxjy.90h.link/uploadfile/2016/0405/20160405024952312.jpg','','jixujiaoyu/','zxdt','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=28','1','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','28','1','0','zuixindongtai','');
INSERT INTO `v9_category` VALUES('29','1','content','0','1','10','0,10','0','29','帮助中心','','http://jxjy.90h.link/uploadfile/2016/0405/20160405025021147.jpg','','jixujiaoyu/','help','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=29','2','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','29','1','0','bangzhuzhongxin','');
INSERT INTO `v9_category` VALUES('31','1','content','0','1','11','0,11','0','31','帮助中心','','','','lianxiwomen/','help','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=31','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','31','1','0','bangzhuzhongxin','');
INSERT INTO `v9_category` VALUES('30','1','content','0','12','22','0,22','0','30','课件资料','','','','ziliao/','kjzl','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=30','4','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_video\",\"show_template\":\"show_video\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','22','1','0','kejianziliao','');
INSERT INTO `v9_category` VALUES('32','1','content','0','1','11','0,11','0','32','新手入门','','','','lianxiwomen/','room','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=32','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list_news\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','32','1','0','xinshourumen','');
INSERT INTO `v9_category` VALUES('33','1','content','0','1','0','0','1','33,34','其他栏目管理','','','','','other','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=33','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','33','0','0','qitalanmuguanli','');
INSERT INTO `v9_category` VALUES('34','1','content','0','1','33','0,33','0','34','banner管理','','','','other/','banner','http://jxjy.90h.link/index.php?m=content&c=index&a=lists&catid=34','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}','34','1','0','bannerguanli','');

DROP TABLE IF EXISTS `v9_category_priv`;
CREATE TABLE `v9_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_collection_content`;
CREATE TABLE `v9_collection_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`,`siteid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_collection_history`;
CREATE TABLE `v9_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_collection_node`;
CREATE TABLE `v9_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY (`nodeid`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_collection_program`;
CREATE TABLE `v9_collection_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `nodeid` (`nodeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_comment`;
CREATE TABLE `v9_comment` (
  `commentid` char(30) NOT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  `title` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `total` int(8) unsigned DEFAULT '0',
  `square` mediumint(8) unsigned DEFAULT '0',
  `anti` mediumint(8) unsigned DEFAULT '0',
  `neutral` mediumint(8) unsigned DEFAULT '0',
  `display_type` tinyint(1) DEFAULT '0',
  `tableid` mediumint(8) unsigned DEFAULT '0',
  `lastupdate` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`commentid`),
  KEY `lastupdate` (`lastupdate`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_comment_check`;
CREATE TABLE `v9_comment_check` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `comment_data_id` int(10) DEFAULT '0' COMMENT '论评ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `tableid` mediumint(8) DEFAULT '0' COMMENT '数据存储表ID',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `comment_data_id` (`comment_data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_comment_data_1`;
CREATE TABLE `v9_comment_data_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `commentid` char(30) NOT NULL DEFAULT '' COMMENT '评论ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `userid` int(10) unsigned DEFAULT '0' COMMENT '用户ID',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `creat_at` int(10) DEFAULT NULL COMMENT '发布时间',
  `ip` varchar(15) DEFAULT NULL COMMENT '用户IP地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '评论状态{0:未审核,-1:未通过审核,1:通过审核}',
  `content` text COMMENT '评论内容',
  `direction` tinyint(1) DEFAULT '0' COMMENT '评论方向{0:无方向,1:正文,2:反方,3:中立}',
  `support` mediumint(8) unsigned DEFAULT '0' COMMENT '支持数',
  `reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为回复',
  PRIMARY KEY (`id`),
  KEY `commentid` (`commentid`),
  KEY `direction` (`direction`),
  KEY `siteid` (`siteid`),
  KEY `support` (`support`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_comment_setting`;
CREATE TABLE `v9_comment_setting` (
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `guest` tinyint(1) DEFAULT '0' COMMENT '是否允许游客评论',
  `check` tinyint(1) DEFAULT '0' COMMENT '是否需要审核',
  `code` tinyint(1) DEFAULT '0' COMMENT '是否开启验证码',
  `add_point` tinyint(3) unsigned DEFAULT '0' COMMENT '添加的积分数',
  `del_point` tinyint(3) unsigned DEFAULT '0' COMMENT '扣除的积分数',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_comment_setting` VALUES('1','0','0','0','0','0');

DROP TABLE IF EXISTS `v9_comment_table`;
CREATE TABLE `v9_comment_table` (
  `tableid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '表ID号',
  `total` int(10) unsigned DEFAULT '0' COMMENT '数据总量',
  `creat_at` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`tableid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_comment_table` VALUES('1','0','0');

DROP TABLE IF EXISTS `v9_content_check`;
CREATE TABLE `v9_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_copyfrom`;
CREATE TABLE `v9_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_datacall`;
CREATE TABLE `v9_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_dbsource`;
CREATE TABLE `v9_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_download`;
CREATE TABLE `v9_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_download_data`;
CREATE TABLE `v9_download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_downservers`;
CREATE TABLE `v9_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_extend_setting`;
CREATE TABLE `v9_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_favorite`;
CREATE TABLE `v9_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_hits`;
CREATE TABLE `v9_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_hits` VALUES('c-1-1','12','0','0','0','0','0','1453709489');
INSERT INTO `v9_hits` VALUES('c-1-2','17','1','0','1','1','1','1453780763');
INSERT INTO `v9_hits` VALUES('c-1-8','23','0','0','0','0','0','1455503710');
INSERT INTO `v9_hits` VALUES('c-1-40','29','0','0','0','0','0','1460621639');
INSERT INTO `v9_hits` VALUES('c-1-9','28','0','0','0','0','0','1457492184');
INSERT INTO `v9_hits` VALUES('c-1-10','29','0','0','0','0','0','1457492261');
INSERT INTO `v9_hits` VALUES('c-1-11','15','0','0','0','0','0','1458009488');
INSERT INTO `v9_hits` VALUES('c-1-12','15','0','0','0','0','0','1458009643');
INSERT INTO `v9_hits` VALUES('c-1-13','15','0','0','0','0','0','1458010028');
INSERT INTO `v9_hits` VALUES('c-1-14','20','0','0','0','0','0','1458010362');
INSERT INTO `v9_hits` VALUES('c-1-15','20','0','0','0','0','0','1458010501');
INSERT INTO `v9_hits` VALUES('c-1-16','20','0','0','0','0','0','1458010766');
INSERT INTO `v9_hits` VALUES('c-1-17','20','0','0','0','0','0','1458012534');
INSERT INTO `v9_hits` VALUES('c-1-18','16','0','0','0','0','0','1458113316');
INSERT INTO `v9_hits` VALUES('c-1-19','16','0','0','0','0','0','1458113453');
INSERT INTO `v9_hits` VALUES('c-1-20','15','0','0','0','0','0','1458113932');
INSERT INTO `v9_hits` VALUES('c-1-21','15','0','0','0','0','0','1458114291');
INSERT INTO `v9_hits` VALUES('c-1-22','15','0','0','0','0','0','1458114574');
INSERT INTO `v9_hits` VALUES('c-1-23','15','0','0','0','0','0','1458114846');
INSERT INTO `v9_hits` VALUES('c-1-24','15','0','0','0','0','0','1458114997');
INSERT INTO `v9_hits` VALUES('c-1-25','14','0','0','0','0','0','1458115552');
INSERT INTO `v9_hits` VALUES('c-12-2','30','0','0','0','0','0','1458529622');
INSERT INTO `v9_hits` VALUES('c-12-3','30','0','0','0','0','0','1458529837');
INSERT INTO `v9_hits` VALUES('c-12-4','30','0','0','0','0','0','1458530142');
INSERT INTO `v9_hits` VALUES('c-1-27','24','0','0','0','0','0','1458612461');
INSERT INTO `v9_hits` VALUES('c-1-28','24','0','0','0','0','0','1458612508');
INSERT INTO `v9_hits` VALUES('c-1-29','24','0','0','0','0','0','1458612635');
INSERT INTO `v9_hits` VALUES('c-1-30','24','0','0','0','0','0','1458612711');
INSERT INTO `v9_hits` VALUES('c-1-31','24','0','0','0','0','0','1458612800');
INSERT INTO `v9_hits` VALUES('c-1-32','26','0','0','0','0','0','1458613182');
INSERT INTO `v9_hits` VALUES('c-1-33','26','0','0','0','0','0','1458613509');
INSERT INTO `v9_hits` VALUES('c-1-34','26','0','0','0','0','0','1458613567');
INSERT INTO `v9_hits` VALUES('c-12-8','30','0','0','0','0','0','1458613975');
INSERT INTO `v9_hits` VALUES('c-1-35','26','0','0','0','0','0','1458614024');
INSERT INTO `v9_hits` VALUES('c-1-36','25','0','0','0','0','0','1458614092');
INSERT INTO `v9_hits` VALUES('c-1-37','25','0','0','0','0','0','1458614128');
INSERT INTO `v9_hits` VALUES('c-1-38','25','0','0','0','0','0','1458614207');
INSERT INTO `v9_hits` VALUES('c-1-39','25','0','0','0','0','0','1458614279');

DROP TABLE IF EXISTS `v9_ipbanned`;
CREATE TABLE `v9_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipbannedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_keylink`;
CREATE TABLE `v9_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY (`keylinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_keyword`;
CREATE TABLE `v9_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL DEFAULT '0',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

INSERT INTO `v9_keyword` VALUES('1','1','单位','danwei','5','0');
INSERT INTO `v9_keyword` VALUES('2','1','简介','jianjie','5','0');
INSERT INTO `v9_keyword` VALUES('3','1','计委','jiwei','7','0');
INSERT INTO `v9_keyword` VALUES('4','1','第一站','diyizhan','7','0');
INSERT INTO `v9_keyword` VALUES('5','1','主任','zhuren','7','0');
INSERT INTO `v9_keyword` VALUES('6','1','总结会','zongjiehui','8','0');
INSERT INTO `v9_keyword` VALUES('7','1','新生儿','xinshenger','8','0');
INSERT INTO `v9_keyword` VALUES('8','1','分子','fenzi','8','0');
INSERT INTO `v9_keyword` VALUES('9','1','学术会','xueshuhui','6','0');
INSERT INTO `v9_keyword` VALUES('10','1','重庆市','zhongqingshi','11','0');
INSERT INTO `v9_keyword` VALUES('11','1','中西医','zhongxiyi','6','0');
INSERT INTO `v9_keyword` VALUES('12','1','流动人口','liudongrenkou','1','0');
INSERT INTO `v9_keyword` VALUES('13','1','实效','shixiao','1','0');
INSERT INTO `v9_keyword` VALUES('14','1','全市','quanshi','6','0');
INSERT INTO `v9_keyword` VALUES('15','1','会议','huiyi','1','0');
INSERT INTO `v9_keyword` VALUES('16','1','公共服务','gonggongfuwu','1','0');
INSERT INTO `v9_keyword` VALUES('17','1','政府','zhengfu','1','0');
INSERT INTO `v9_keyword` VALUES('18','1','医学教育','yixuejiaoyu','7','0');
INSERT INTO `v9_keyword` VALUES('19','1','全国','quanguo','2','0');
INSERT INTO `v9_keyword` VALUES('20','1','管理办法','guanlibanfa','2','0');
INSERT INTO `v9_keyword` VALUES('21','1','学分','xuefen','4','0');
INSERT INTO `v9_keyword` VALUES('22','1','执业资格','zhiyezige','1','0');
INSERT INTO `v9_keyword` VALUES('23','1','全区','quanqu','1','0');
INSERT INTO `v9_keyword` VALUES('24','1','事宜','shiyi','1','0');
INSERT INTO `v9_keyword` VALUES('25','1','资格考试','zigekaoshi','1','0');
INSERT INTO `v9_keyword` VALUES('26','1','年度','niandu','1','0');
INSERT INTO `v9_keyword` VALUES('27','1','专业','zhuanye','1','0');
INSERT INTO `v9_keyword` VALUES('28','1','九龙坡区','jiulongpoqu','8','0');
INSERT INTO `v9_keyword` VALUES('29','1','团体','tuanti','5','0');
INSERT INTO `v9_keyword` VALUES('30','1','计生委','jishengwei','2','0');
INSERT INTO `v9_keyword` VALUES('31','1','医改','yigai','1','0');
INSERT INTO `v9_keyword` VALUES('32','1','热血','rexue','1','0');
INSERT INTO `v9_keyword` VALUES('33','1','爱心','aixin','1','0');
INSERT INTO `v9_keyword` VALUES('34','1','生命','shengming','1','0');
INSERT INTO `v9_keyword` VALUES('35','1','队伍建设','duiwujianshe','1','0');
INSERT INTO `v9_keyword` VALUES('36','1','成效','chengxiao','1','0');
INSERT INTO `v9_keyword` VALUES('37','1','招商引资','zhaoshangyinzi','1','0');
INSERT INTO `v9_keyword` VALUES('38','1','公共卫生','gonggongweisheng','1','0');
INSERT INTO `v9_keyword` VALUES('39','1','服务中心','fuwuzhongxin','1','0');
INSERT INTO `v9_keyword` VALUES('40','1','文件','wenjian','4','0');
INSERT INTO `v9_keyword` VALUES('41','1','长寿','changshou','3','0');
INSERT INTO `v9_keyword` VALUES('42','1','网站建设','wangzhanjianshe','3','0');
INSERT INTO `v9_keyword` VALUES('43','1','合同','hetong','3','0');
INSERT INTO `v9_keyword` VALUES('44','1','产妇','chanfu','1','0');
INSERT INTO `v9_keyword` VALUES('45','1','高龄','gaoling','1','0');
INSERT INTO `v9_keyword` VALUES('46','1','周时','zhoushi','1','0');
INSERT INTO `v9_keyword` VALUES('47','1','学术会议','xueshuhuiyi','1','0');
INSERT INTO `v9_keyword` VALUES('48','1','妇科','fuke','2','0');
INSERT INTO `v9_keyword` VALUES('49','1','肿瘤','zhongliu','2','0');
INSERT INTO `v9_keyword` VALUES('50','1','生殖医学','shengzhiyixue','1','0');
INSERT INTO `v9_keyword` VALUES('51','1','论坛','luntan','1','0');
INSERT INTO `v9_keyword` VALUES('52','1','癌症','aizheng','1','0');
INSERT INTO `v9_keyword` VALUES('53','1','协会','xiehui','1','0');
INSERT INTO `v9_keyword` VALUES('54','1','妇产','fuchan','1','0');
INSERT INTO `v9_keyword` VALUES('55','1','美国','meiguo','1','0');
INSERT INTO `v9_keyword` VALUES('56','1','医师','yishi','1','0');
INSERT INTO `v9_keyword` VALUES('57','1','医学','yixue','1','0');
INSERT INTO `v9_keyword` VALUES('58','1','华夏','huaxia','1','0');
INSERT INTO `v9_keyword` VALUES('59','1','长城','changcheng','1','0');
INSERT INTO `v9_keyword` VALUES('60','1','南京','nanjing','1','0');
INSERT INTO `v9_keyword` VALUES('61','1','首届','shoujie','1','0');
INSERT INTO `v9_keyword` VALUES('62','1','大会','dahui','2','0');
INSERT INTO `v9_keyword` VALUES('63','1','培训班','peixunban','3','0');
INSERT INTO `v9_keyword` VALUES('64','1','六西格玛','liuxigema','1','0');
INSERT INTO `v9_keyword` VALUES('65','1','质量管理','zhiliangguanli','1','0');
INSERT INTO `v9_keyword` VALUES('66','1','新进','xinjin','1','0');
INSERT INTO `v9_keyword` VALUES('67','1','昆明','kunming','1','0');
INSERT INTO `v9_keyword` VALUES('68','1','学习班','xuexiban','1','0');
INSERT INTO `v9_keyword` VALUES('69','1','岗位培训','gangweipeixun','1','0');
INSERT INTO `v9_keyword` VALUES('70','1','招生简章','zhaoshengjianzhang','1','0');
INSERT INTO `v9_keyword` VALUES('71','1','心脏病','xinzangbing','1','0');
INSERT INTO `v9_keyword` VALUES('72','1','国际','guoji','2','0');
INSERT INTO `v9_keyword` VALUES('73','1','第四届','disijie','1','0');
INSERT INTO `v9_keyword` VALUES('74','1','中国','zhongguo','1','0');
INSERT INTO `v9_keyword` VALUES('75','1','高峰','gaofeng','1','0');
INSERT INTO `v9_keyword` VALUES('76','1','曲美','qumei','5','0');
INSERT INTO `v9_keyword` VALUES('77','1','川芎','chuanzuo','5','0');
INSERT INTO `v9_keyword` VALUES('78','1','丹参','dancan','5','0');
INSERT INTO `v9_keyword` VALUES('79','1','糖尿','tangniao','1','0');
INSERT INTO `v9_keyword` VALUES('80','1','病学','bingxue','1','0');
INSERT INTO `v9_keyword` VALUES('81','1','养生保健','yangshengbaojian','1','0');
INSERT INTO `v9_keyword` VALUES('82','1','职业培训','zhiyepeixun','1','0');
INSERT INTO `v9_keyword` VALUES('83','1','绩效','jixiao','1','0');
INSERT INTO `v9_keyword` VALUES('84','1','高端','gaoduan','1','0');
INSERT INTO `v9_keyword` VALUES('85','1','重症','zhongzheng','1','0');
INSERT INTO `v9_keyword` VALUES('86','1','儿科','erke','1','0');
INSERT INTO `v9_keyword` VALUES('87','1','儿科疾病','erkejibing','1','0');
INSERT INTO `v9_keyword` VALUES('88','1','全科','quanke','1','0');
INSERT INTO `v9_keyword` VALUES('89','1','','','3','0');

DROP TABLE IF EXISTS `v9_keyword_data`;
CREATE TABLE `v9_keyword_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

INSERT INTO `v9_keyword_data` VALUES('1','1','1','1-1');
INSERT INTO `v9_keyword_data` VALUES('2','2','1','1-1');
INSERT INTO `v9_keyword_data` VALUES('3','3','1','2-1');
INSERT INTO `v9_keyword_data` VALUES('4','4','1','2-1');
INSERT INTO `v9_keyword_data` VALUES('5','5','1','2-1');
INSERT INTO `v9_keyword_data` VALUES('6','6','1','8-1');
INSERT INTO `v9_keyword_data` VALUES('7','7','1','8-1');
INSERT INTO `v9_keyword_data` VALUES('8','8','1','8-1');
INSERT INTO `v9_keyword_data` VALUES('9','6','1','1-12');
INSERT INTO `v9_keyword_data` VALUES('10','7','1','1-12');
INSERT INTO `v9_keyword_data` VALUES('11','8','1','1-12');
INSERT INTO `v9_keyword_data` VALUES('12','9','1','9-1');
INSERT INTO `v9_keyword_data` VALUES('13','10','1','9-1');
INSERT INTO `v9_keyword_data` VALUES('14','11','1','9-1');
INSERT INTO `v9_keyword_data` VALUES('15','9','1','10-1');
INSERT INTO `v9_keyword_data` VALUES('16','10','1','10-1');
INSERT INTO `v9_keyword_data` VALUES('17','11','1','10-1');
INSERT INTO `v9_keyword_data` VALUES('18','3','1','7-1');
INSERT INTO `v9_keyword_data` VALUES('19','4','1','7-1');
INSERT INTO `v9_keyword_data` VALUES('20','5','1','7-1');
INSERT INTO `v9_keyword_data` VALUES('21','3','1','6-1');
INSERT INTO `v9_keyword_data` VALUES('22','4','1','6-1');
INSERT INTO `v9_keyword_data` VALUES('23','5','1','6-1');
INSERT INTO `v9_keyword_data` VALUES('24','12','1','11-1');
INSERT INTO `v9_keyword_data` VALUES('25','13','1','11-1');
INSERT INTO `v9_keyword_data` VALUES('26','14','1','12-1');
INSERT INTO `v9_keyword_data` VALUES('27','15','1','12-1');
INSERT INTO `v9_keyword_data` VALUES('28','16','1','13-1');
INSERT INTO `v9_keyword_data` VALUES('29','17','1','13-1');
INSERT INTO `v9_keyword_data` VALUES('30','18','1','14-1');
INSERT INTO `v9_keyword_data` VALUES('31','18','1','15-1');
INSERT INTO `v9_keyword_data` VALUES('32','19','1','15-1');
INSERT INTO `v9_keyword_data` VALUES('33','10','1','16-1');
INSERT INTO `v9_keyword_data` VALUES('34','18','1','16-1');
INSERT INTO `v9_keyword_data` VALUES('35','20','1','16-1');
INSERT INTO `v9_keyword_data` VALUES('36','10','1','17-1');
INSERT INTO `v9_keyword_data` VALUES('37','18','1','17-1');
INSERT INTO `v9_keyword_data` VALUES('38','21','1','17-1');
INSERT INTO `v9_keyword_data` VALUES('39','22','1','18-1');
INSERT INTO `v9_keyword_data` VALUES('40','23','1','18-1');
INSERT INTO `v9_keyword_data` VALUES('41','24','1','18-1');
INSERT INTO `v9_keyword_data` VALUES('42','25','1','19-1');
INSERT INTO `v9_keyword_data` VALUES('43','26','1','19-1');
INSERT INTO `v9_keyword_data` VALUES('44','27','1','19-1');
INSERT INTO `v9_keyword_data` VALUES('45','28','1','20-1');
INSERT INTO `v9_keyword_data` VALUES('46','14','1','20-1');
INSERT INTO `v9_keyword_data` VALUES('47','29','1','20-1');
INSERT INTO `v9_keyword_data` VALUES('48','28','1','21-1');
INSERT INTO `v9_keyword_data` VALUES('49','30','1','21-1');
INSERT INTO `v9_keyword_data` VALUES('50','31','1','21-1');
INSERT INTO `v9_keyword_data` VALUES('51','32','1','22-1');
INSERT INTO `v9_keyword_data` VALUES('52','33','1','22-1');
INSERT INTO `v9_keyword_data` VALUES('53','34','1','22-1');
INSERT INTO `v9_keyword_data` VALUES('54','28','1','23-1');
INSERT INTO `v9_keyword_data` VALUES('55','35','1','23-1');
INSERT INTO `v9_keyword_data` VALUES('56','36','1','23-1');
INSERT INTO `v9_keyword_data` VALUES('57','30','1','24-1');
INSERT INTO `v9_keyword_data` VALUES('58','37','1','24-1');
INSERT INTO `v9_keyword_data` VALUES('59','28','1','25-1');
INSERT INTO `v9_keyword_data` VALUES('60','38','1','25-1');
INSERT INTO `v9_keyword_data` VALUES('61','39','1','25-1');
INSERT INTO `v9_keyword_data` VALUES('62','40','1','2-12');
INSERT INTO `v9_keyword_data` VALUES('63','41','1','3-12');
INSERT INTO `v9_keyword_data` VALUES('64','42','1','4-12');
INSERT INTO `v9_keyword_data` VALUES('65','43','1','4-12');
INSERT INTO `v9_keyword_data` VALUES('66','44','1','26-1');
INSERT INTO `v9_keyword_data` VALUES('67','45','1','26-1');
INSERT INTO `v9_keyword_data` VALUES('68','46','1','26-1');
INSERT INTO `v9_keyword_data` VALUES('69','47','1','27-1');
INSERT INTO `v9_keyword_data` VALUES('70','48','1','27-1');
INSERT INTO `v9_keyword_data` VALUES('71','49','1','27-1');
INSERT INTO `v9_keyword_data` VALUES('72','50','1','28-1');
INSERT INTO `v9_keyword_data` VALUES('73','19','1','28-1');
INSERT INTO `v9_keyword_data` VALUES('74','51','1','28-1');
INSERT INTO `v9_keyword_data` VALUES('75','48','1','29-1');
INSERT INTO `v9_keyword_data` VALUES('76','52','1','29-1');
INSERT INTO `v9_keyword_data` VALUES('77','53','1','29-1');
INSERT INTO `v9_keyword_data` VALUES('78','54','1','30-1');
INSERT INTO `v9_keyword_data` VALUES('79','55','1','30-1');
INSERT INTO `v9_keyword_data` VALUES('80','56','1','30-1');
INSERT INTO `v9_keyword_data` VALUES('81','57','1','31-1');
INSERT INTO `v9_keyword_data` VALUES('82','58','1','31-1');
INSERT INTO `v9_keyword_data` VALUES('83','59','1','31-1');
INSERT INTO `v9_keyword_data` VALUES('84','60','1','32-1');
INSERT INTO `v9_keyword_data` VALUES('85','61','1','32-1');
INSERT INTO `v9_keyword_data` VALUES('86','62','1','32-1');
INSERT INTO `v9_keyword_data` VALUES('87','63','1','5-12');
INSERT INTO `v9_keyword_data` VALUES('88','64','1','5-12');
INSERT INTO `v9_keyword_data` VALUES('89','65','1','5-12');
INSERT INTO `v9_keyword_data` VALUES('90','66','1','6-12');
INSERT INTO `v9_keyword_data` VALUES('91','67','1','6-12');
INSERT INTO `v9_keyword_data` VALUES('92','68','1','6-12');
INSERT INTO `v9_keyword_data` VALUES('93','69','1','33-1');
INSERT INTO `v9_keyword_data` VALUES('94','70','1','33-1');
INSERT INTO `v9_keyword_data` VALUES('95','71','1','34-1');
INSERT INTO `v9_keyword_data` VALUES('96','62','1','34-1');
INSERT INTO `v9_keyword_data` VALUES('97','72','1','34-1');
INSERT INTO `v9_keyword_data` VALUES('98','73','1','7-12');
INSERT INTO `v9_keyword_data` VALUES('99','74','1','7-12');
INSERT INTO `v9_keyword_data` VALUES('100','75','1','7-12');
INSERT INTO `v9_keyword_data` VALUES('101','76','1','8-12');
INSERT INTO `v9_keyword_data` VALUES('102','77','1','8-12');
INSERT INTO `v9_keyword_data` VALUES('103','78','1','8-12');
INSERT INTO `v9_keyword_data` VALUES('104','79','1','35-1');
INSERT INTO `v9_keyword_data` VALUES('105','72','1','35-1');
INSERT INTO `v9_keyword_data` VALUES('106','80','1','35-1');
INSERT INTO `v9_keyword_data` VALUES('107','81','1','36-1');
INSERT INTO `v9_keyword_data` VALUES('108','82','1','36-1');
INSERT INTO `v9_keyword_data` VALUES('109','63','1','37-1');
INSERT INTO `v9_keyword_data` VALUES('110','83','1','37-1');
INSERT INTO `v9_keyword_data` VALUES('111','84','1','37-1');
INSERT INTO `v9_keyword_data` VALUES('112','63','1','38-1');
INSERT INTO `v9_keyword_data` VALUES('113','85','1','38-1');
INSERT INTO `v9_keyword_data` VALUES('114','86','1','38-1');
INSERT INTO `v9_keyword_data` VALUES('115','87','1','39-1');
INSERT INTO `v9_keyword_data` VALUES('116','88','1','39-1');
INSERT INTO `v9_keyword_data` VALUES('117','49','1','39-1');
INSERT INTO `v9_keyword_data` VALUES('118','89','1','10-1');
INSERT INTO `v9_keyword_data` VALUES('119','21','1','40-1');

DROP TABLE IF EXISTS `v9_kj`;
CREATE TABLE `v9_kj` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `place` varchar(255) NOT NULL DEFAULT '',
  `kjxssj` varchar(255) NOT NULL DEFAULT '',
  `ks` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `v9_kj` VALUES('2','30','0','继教新文件３：渝卫科教发 (2014) 78号关于进一步加强我市继','','','文件','','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=30&id=2','0','99','1','0','admin','1458529527','1460556190','test','重庆卫生局','5','4');
INSERT INTO `v9_kj` VALUES('3','30','0','运动可健体，少吃可长寿','','','长寿','','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=30&id=3','0','99','1','0','admin','1458529768','1460018831','周瑜','重庆火石科技有限公司','3','3');
INSERT INTO `v9_kj` VALUES('4','30','0','网站建设合同','','','网站建设 合同','111112','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=30&id=4','0','99','1','0','admin','1458530057','1460018816','周瑜','重庆火石科技有限公司','6','2');
INSERT INTO `v9_kj` VALUES('8','30','0','曲美他嗪与丹参川芎嗪注射液联合治疗不稳定心绞痛的疗效','','','曲美 川芎 丹参','','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=30&id=8','0','99','1','0','admin','1458613923','1460556154','test','重庆火石科技有限公司','10','1');

DROP TABLE IF EXISTS `v9_kj_data`;
CREATE TABLE `v9_kj_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pdf` mediumtext NOT NULL,
  `kj` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_kj_data` VALUES('2','&nbsp; &nbsp;','0','','0','10000','','0','1','','{\"0\":{\"fileurl\":\"http:\\/\\/jxjy.90h.link\\/uploadfile\\/2016\\/0321\\/20160321110558320.pdf\",\"filename\":\"20160321110558916\"}}','心血管');
INSERT INTO `v9_kj_data` VALUES('3','&nbsp;&nbsp;','0','','0','10000','','0','1','','{\"0\":{\"fileurl\":\"http:\\/\\/jxjy.90h.link\\/uploadfile\\/2016\\/0321\\/20160321111003266.pdf\",\"filename\":\"\\u8fd0\\u52a8\\u53ef\\u5065\\u4f53\\uff0c\\u5c11\\u5403\\u53ef\\u957f\\u5bff\"}}','消化内科');
INSERT INTO `v9_kj_data` VALUES('4','111112','0','','0','10000','','0','1','','{\"0\":{\"fileurl\":\"http:\\/\\/jxjy.90h.link\\/uploadfile\\/2016\\/0321\\/20160321111524535.pdf\",\"filename\":\"122\\u7f51\\u7ad9\\u5efa\\u8bbe\\u5408\\u540c\"}}','心血管');
INSERT INTO `v9_kj_data` VALUES('8','&nbsp; &nbsp;','0','','0','10000','','0','1','','{\"0\":{\"fileurl\":\"http:\\/\\/jxjy.90h.link\\/uploadfile\\/2016\\/0322\\/20160322103251363.pdf\",\"filename\":\"20160322103251613\"}}','中医学');

DROP TABLE IF EXISTS `v9_link`;
CREATE TABLE `v9_link` (
  `linkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  KEY `typeid` (`typeid`,`passed`,`listorder`,`linkid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `v9_link` VALUES('1','1','0','1','PHPCMS','http://www.phpcms.cn','http://www.phpcms.cn/images/logo_88_31.gif','','','0','0','1','1453704789');
INSERT INTO `v9_link` VALUES('2','1','0','1','盛大在线','http://www.sdo.com','http://www.snda.com/cn/logo/comp_logo_sdo.gif','','','0','0','1','1453704789');

DROP TABLE IF EXISTS `v9_linkage`;
CREATE TABLE `v9_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=3360 DEFAULT CHARSET=utf8;

INSERT INTO `v9_linkage` VALUES('1','中国','1','0','0','','0','0','','','0');
INSERT INTO `v9_linkage` VALUES('2','北京市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3','上海市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('4','天津市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('5','重庆市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('6','河北省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('7','山西省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('8','内蒙古','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('9','辽宁省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('10','吉林省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('11','黑龙江省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('12','江苏省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('13','浙江省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('14','安徽省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('15','福建省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('16','江西省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('17','山东省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('18','河南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('19','湖北省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('20','湖南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('21','广东省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('22','广西','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('23','海南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('24','四川省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('25','贵州省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('26','云南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('27','西藏','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('28','陕西省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('29','甘肃省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('30','青海省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('31','宁夏','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('32','新疆','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('33','台湾省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('34','香港','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('35','澳门','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('36','东城区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('37','西城区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('38','崇文区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('39','宣武区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('40','朝阳区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('41','石景山区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('42','海淀区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('43','门头沟区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('44','房山区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('45','通州区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('46','顺义区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('47','昌平区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('48','大兴区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('49','怀柔区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('50','平谷区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('51','密云县','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('52','延庆县','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('53','黄浦区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('54','卢湾区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('55','徐汇区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('56','长宁区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('57','静安区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('58','普陀区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('59','闸北区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('60','虹口区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('61','杨浦区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('62','闵行区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('63','宝山区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('64','嘉定区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('65','浦东新区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('66','金山区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('67','松江区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('68','青浦区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('69','南汇区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('70','奉贤区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('71','崇明县','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('72','和平区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('73','河东区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('74','河西区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('75','南开区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('76','河北区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('77','红桥区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('78','塘沽区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('79','汉沽区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('80','大港区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('81','东丽区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('82','西青区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('83','津南区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('84','北辰区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('85','武清区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('86','宝坻区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('87','宁河县','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('88','静海县','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('89','蓟县','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('90','万州区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('91','涪陵区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('92','渝中区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('93','大渡口区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('94','江北区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('95','沙坪坝区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('96','九龙坡区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('97','南岸区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('98','北碚区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('99','万盛区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('100','双桥区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('101','渝北区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('102','巴南区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('103','黔江区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('104','长寿区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('105','綦江县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('106','潼南县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('107','铜梁县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('108','大足县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('109','荣昌县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('110','璧山县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('111','梁平县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('112','城口县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('113','丰都县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('114','垫江县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('115','武隆县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('116','忠县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('117','开县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('118','云阳县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('119','奉节县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('120','巫山县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('121','巫溪县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('122','石柱县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('123','秀山县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('124','酉阳县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('125','彭水县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('126','江津区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('127','合川区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('128','永川区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('129','南川区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('130','石家庄市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('131','唐山市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('132','秦皇岛市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('133','邯郸市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('134','邢台市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('135','保定市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('136','张家口市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('137','承德市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('138','沧州市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('139','廊坊市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('140','衡水市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('141','太原市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('142','大同市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('143','阳泉市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('144','长治市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('145','晋城市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('146','朔州市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('147','晋中市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('148','运城市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('149','忻州市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('150','临汾市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('151','吕梁市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('152','呼和浩特市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('153','包头市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('154','乌海市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('155','赤峰市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('156','通辽市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('157','鄂尔多斯市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('158','呼伦贝尔市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('159','巴彦淖尔市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('160','乌兰察布市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('161','兴安盟','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('162','锡林郭勒盟','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('163','阿拉善盟','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('164','沈阳市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('165','大连市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('166','鞍山市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('167','抚顺市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('168','本溪市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('169','丹东市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('170','锦州市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('171','营口市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('172','阜新市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('173','辽阳市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('174','盘锦市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('175','铁岭市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('176','朝阳市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('177','葫芦岛市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('178','长春市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('179','吉林市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('180','四平市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('181','辽源市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('182','通化市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('183','白山市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('184','松原市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('185','白城市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('186','延边','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('187','哈尔滨市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('188','齐齐哈尔市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('189','鸡西市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('190','鹤岗市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('191','双鸭山市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('192','大庆市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('193','伊春市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('194','佳木斯市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('195','七台河市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('196','牡丹江市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('197','黑河市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('198','绥化市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('199','大兴安岭地区','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('200','南京市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('201','无锡市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('202','徐州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('203','常州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('204','苏州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('205','南通市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('206','连云港市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('207','淮安市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('208','盐城市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('209','扬州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('210','镇江市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('211','泰州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('212','宿迁市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('213','杭州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('214','宁波市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('215','温州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('216','嘉兴市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('217','湖州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('218','绍兴市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('219','金华市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('220','衢州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('221','舟山市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('222','台州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('223','丽水市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('224','合肥市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('225','芜湖市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('226','蚌埠市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('227','淮南市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('228','马鞍山市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('229','淮北市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('230','铜陵市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('231','安庆市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('232','黄山市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('233','滁州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('234','阜阳市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('235','宿州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('236','巢湖市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('237','六安市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('238','亳州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('239','池州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('240','宣城市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('241','福州市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('242','厦门市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('243','莆田市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('244','三明市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('245','泉州市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('246','漳州市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('247','南平市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('248','龙岩市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('249','宁德市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('250','南昌市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('251','景德镇市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('252','萍乡市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('253','九江市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('254','新余市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('255','鹰潭市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('256','赣州市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('257','吉安市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('258','宜春市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('259','抚州市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('260','上饶市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('261','济南市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('262','青岛市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('263','淄博市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('264','枣庄市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('265','东营市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('266','烟台市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('267','潍坊市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('268','济宁市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('269','泰安市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('270','威海市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('271','日照市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('272','莱芜市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('273','临沂市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('274','德州市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('275','聊城市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('276','滨州市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('277','荷泽市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('278','郑州市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('279','开封市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('280','洛阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('281','平顶山市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('282','安阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('283','鹤壁市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('284','新乡市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('285','焦作市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('286','濮阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('287','许昌市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('288','漯河市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('289','三门峡市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('290','南阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('291','商丘市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('292','信阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('293','周口市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('294','驻马店市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('295','武汉市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('296','黄石市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('297','十堰市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('298','宜昌市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('299','襄樊市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('300','鄂州市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('301','荆门市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('302','孝感市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('303','荆州市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('304','黄冈市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('305','咸宁市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('306','随州市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('307','恩施土家族苗族自治州','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('308','仙桃市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('309','潜江市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('310','天门市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('311','神农架林区','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('312','长沙市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('313','株洲市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('314','湘潭市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('315','衡阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('316','邵阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('317','岳阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('318','常德市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('319','张家界市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('320','益阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('321','郴州市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('322','永州市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('323','怀化市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('324','娄底市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('325','湘西土家族苗族自治州','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('326','广州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('327','韶关市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('328','深圳市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('329','珠海市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('330','汕头市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('331','佛山市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('332','江门市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('333','湛江市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('334','茂名市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('335','肇庆市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('336','惠州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('337','梅州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('338','汕尾市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('339','河源市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('340','阳江市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('341','清远市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('342','东莞市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('343','中山市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('344','潮州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('345','揭阳市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('346','云浮市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('347','南宁市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('348','柳州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('349','桂林市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('350','梧州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('351','北海市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('352','防城港市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('353','钦州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('354','贵港市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('355','玉林市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('356','百色市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('357','贺州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('358','河池市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('359','来宾市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('360','崇左市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('361','海口市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('362','三亚市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('363','五指山市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('364','琼海市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('365','儋州市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('366','文昌市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('367','万宁市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('368','东方市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('369','定安县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('370','屯昌县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('371','澄迈县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('372','临高县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('373','白沙黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('374','昌江黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('375','乐东黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('376','陵水黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('377','保亭黎族苗族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('378','琼中黎族苗族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('379','西沙群岛','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('380','南沙群岛','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('381','中沙群岛的岛礁及其海域','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('382','成都市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('383','自贡市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('384','攀枝花市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('385','泸州市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('386','德阳市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('387','绵阳市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('388','广元市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('389','遂宁市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('390','内江市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('391','乐山市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('392','南充市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('393','眉山市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('394','宜宾市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('395','广安市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('396','达州市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('397','雅安市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('398','巴中市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('399','资阳市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('400','阿坝州','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('401','甘孜州','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('402','凉山州','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('403','贵阳市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('404','六盘水市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('405','遵义市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('406','安顺市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('407','铜仁地区','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('408','黔西南州','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('409','毕节地区','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('410','黔东南州','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('411','黔南州','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('412','昆明市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('413','曲靖市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('414','玉溪市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('415','保山市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('416','昭通市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('417','丽江市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('418','思茅市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('419','临沧市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('420','楚雄州','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('421','红河州','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('422','文山州','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('423','西双版纳','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('424','大理','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('425','德宏','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('426','怒江','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('427','迪庆','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('428','拉萨市','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('429','昌都','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('430','山南','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('431','日喀则','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('432','那曲','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('433','阿里','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('434','林芝','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('435','西安市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('436','铜川市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('437','宝鸡市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('438','咸阳市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('439','渭南市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('440','延安市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('441','汉中市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('442','榆林市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('443','安康市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('444','商洛市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('445','兰州市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('446','嘉峪关市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('447','金昌市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('448','白银市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('449','天水市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('450','武威市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('451','张掖市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('452','平凉市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('453','酒泉市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('454','庆阳市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('455','定西市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('456','陇南市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('457','临夏州','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('458','甘州','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('459','西宁市','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('460','海东地区','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('461','海州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('462','黄南州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('463','海南州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('464','果洛州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('465','玉树州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('466','海西州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('467','银川市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('468','石嘴山市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('469','吴忠市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('470','固原市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('471','中卫市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('472','乌鲁木齐市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('473','克拉玛依市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('474','吐鲁番地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('475','哈密地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('476','昌吉州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('477','博尔州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('478','巴音郭楞州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('479','阿克苏地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('480','克孜勒苏柯尔克孜自治州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('481','喀什地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('482','和田地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('483','伊犁州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('484','塔城地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('485','阿勒泰地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('486','石河子市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('487','阿拉尔市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('488','图木舒克市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('489','五家渠市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('490','台北市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('491','高雄市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('492','基隆市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('493','新竹市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('494','台中市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('495','嘉义市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('496','台南市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('497','台北县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('498','桃园县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('499','新竹县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('500','苗栗县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('501','台中县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('502','彰化县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('503','南投县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('504','云林县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('505','嘉义县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('506','台南县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('507','高雄县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('508','屏东县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('509','宜兰县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('510','花莲县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('511','台东县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('512','澎湖县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('513','金门县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('514','连江县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('515','中西区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('516','东区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('517','南区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('518','湾仔区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('519','九龙城区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('520','观塘区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('521','深水埗区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('522','黄大仙区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('523','油尖旺区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('524','离岛区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('525','葵青区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('526','北区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('527','西贡区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('528','沙田区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('529','大埔区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('530','荃湾区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('531','屯门区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('532','元朗区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('533','花地玛堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('534','市圣安多尼堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('535','大堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('536','望德堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('537','风顺堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('538','嘉模堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('539','圣方济各堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('540','长安区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('541','桥东区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('542','桥西区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('543','新华区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('544','井陉矿区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('545','裕华区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('546','井陉县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('547','正定县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('548','栾城县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('549','行唐县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('550','灵寿县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('551','高邑县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('552','深泽县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('553','赞皇县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('554','无极县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('555','平山县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('556','元氏县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('557','赵县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('558','辛集市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('559','藁城市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('560','晋州市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('561','新乐市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('562','鹿泉市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('563','路南区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('564','路北区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('565','古冶区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('566','开平区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('567','丰南区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('568','丰润区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('569','滦县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('570','滦南县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('571','乐亭县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('572','迁西县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('573','玉田县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('574','唐海县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('575','遵化市','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('576','迁安市','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('577','海港区','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('578','山海关区','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('579','北戴河区','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('580','青龙县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('581','昌黎县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('582','抚宁县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('583','卢龙县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('584','邯山区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('585','丛台区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('586','复兴区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('587','峰峰矿区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('588','邯郸县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('589','临漳县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('590','成安县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('591','大名县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('592','涉县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('593','磁县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('594','肥乡县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('595','永年县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('596','邱县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('597','鸡泽县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('598','广平县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('599','馆陶县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('600','魏县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('601','曲周县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('602','武安市','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('603','桥东区','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('604','桥西区','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('605','邢台县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('606','临城县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('607','内丘县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('608','柏乡县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('609','隆尧县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('610','任县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('611','南和县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('612','宁晋县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('613','巨鹿县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('614','新河县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('615','广宗县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('616','平乡县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('617','威县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('618','清河县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('619','临西县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('620','南宫市','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('621','沙河市','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('622','新市区','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('623','北市区','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('624','南市区','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('625','满城县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('626','清苑县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('627','涞水县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('628','阜平县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('629','徐水县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('630','定兴县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('631','唐县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('632','高阳县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('633','容城县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('634','涞源县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('635','望都县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('636','安新县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('637','易县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('638','曲阳县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('639','蠡县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('640','顺平县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('641','博野县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('642','雄县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('643','涿州市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('644','定州市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('645','安国市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('646','高碑店市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('647','桥东区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('648','桥西区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('649','宣化区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('650','下花园区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('651','宣化县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('652','张北县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('653','康保县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('654','沽源县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('655','尚义县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('656','蔚县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('657','阳原县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('658','怀安县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('659','万全县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('660','怀来县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('661','涿鹿县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('662','赤城县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('663','崇礼县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('664','双桥区','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('665','双滦区','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('666','鹰手营子矿区','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('667','承德县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('668','兴隆县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('669','平泉县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('670','滦平县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('671','隆化县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('672','丰宁县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('673','宽城县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('674','围场县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('675','新华区','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('676','运河区','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('677','沧县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('678','青县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('679','东光县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('680','海兴县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('681','盐山县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('682','肃宁县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('683','南皮县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('684','吴桥县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('685','献县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('686','孟村县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('687','泊头市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('688','任丘市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('689','黄骅市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('690','河间市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('691','安次区','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('692','广阳区','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('693','固安县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('694','永清县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('695','香河县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('696','大城县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('697','文安县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('698','大厂县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('699','霸州市','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('700','三河市','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('701','桃城区','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('702','枣强县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('703','武邑县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('704','武强县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('705','饶阳县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('706','安平县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('707','故城县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('708','景县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('709','阜城县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('710','冀州市','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('711','深州市','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('712','小店区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('713','迎泽区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('714','杏花岭区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('715','尖草坪区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('716','万柏林区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('717','晋源区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('718','清徐县','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('719','阳曲县','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('720','娄烦县','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('721','古交市','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('722','城区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('723','矿区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('724','南郊区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('725','新荣区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('726','阳高县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('727','天镇县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('728','广灵县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('729','灵丘县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('730','浑源县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('731','左云县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('732','大同县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('733','城区','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('734','矿区','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('735','郊区','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('736','平定县','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('737','盂县','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('738','城区','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('739','郊区','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('740','长治县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('741','襄垣县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('742','屯留县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('743','平顺县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('744','黎城县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('745','壶关县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('746','长子县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('747','武乡县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('748','沁县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('749','沁源县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('750','潞城市','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('751','城区','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('752','沁水县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('753','阳城县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('754','陵川县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('755','泽州县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('756','高平市','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('757','朔城区','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('758','平鲁区','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('759','山阴县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('760','应县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('761','右玉县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('762','怀仁县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('763','榆次区','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('764','榆社县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('765','左权县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('766','和顺县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('767','昔阳县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('768','寿阳县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('769','太谷县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('770','祁县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('771','平遥县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('772','灵石县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('773','介休市','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('774','盐湖区','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('775','临猗县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('776','万荣县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('777','闻喜县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('778','稷山县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('779','新绛县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('780','绛县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('781','垣曲县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('782','夏县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('783','平陆县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('784','芮城县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('785','永济市','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('786','河津市','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('787','忻府区','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('788','定襄县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('789','五台县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('790','代县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('791','繁峙县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('792','宁武县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('793','静乐县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('794','神池县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('795','五寨县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('796','岢岚县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('797','河曲县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('798','保德县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('799','偏关县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('800','原平市','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('801','尧都区','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('802','曲沃县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('803','翼城县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('804','襄汾县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('805','洪洞县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('806','古县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('807','安泽县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('808','浮山县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('809','吉县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('810','乡宁县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('811','大宁县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('812','隰县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('813','永和县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('814','蒲县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('815','汾西县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('816','侯马市','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('817','霍州市','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('818','离石区','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('819','文水县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('820','交城县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('821','兴县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('822','临县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('823','柳林县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('824','石楼县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('825','岚县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('826','方山县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('827','中阳县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('828','交口县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('829','孝义市','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('830','汾阳市','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('831','新城区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('832','回民区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('833','玉泉区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('834','赛罕区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('835','土默特左旗','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('836','托克托县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('837','和林格尔县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('838','清水河县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('839','武川县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('840','东河区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('841','昆都仑区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('842','青山区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('843','石拐区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('844','白云矿区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('845','九原区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('846','土默特右旗','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('847','固阳县','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('848','达尔罕茂明安联合旗','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('849','海勃湾区','0','154','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('850','海南区','0','154','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('851','乌达区','0','154','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('852','红山区','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('853','元宝山区','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('854','松山区','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('855','阿鲁科尔沁旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('856','巴林左旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('857','巴林右旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('858','林西县','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('859','克什克腾旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('860','翁牛特旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('861','喀喇沁旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('862','宁城县','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('863','敖汉旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('864','科尔沁区','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('865','科尔沁左翼中旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('866','科尔沁左翼后旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('867','开鲁县','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('868','库伦旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('869','奈曼旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('870','扎鲁特旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('871','霍林郭勒市','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('872','东胜区','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('873','达拉特旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('874','准格尔旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('875','鄂托克前旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('876','鄂托克旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('877','杭锦旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('878','乌审旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('879','伊金霍洛旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('880','海拉尔区','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('881','阿荣旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('882','莫力达瓦达斡尔族自治旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('883','鄂伦春自治旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('884','鄂温克族自治旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('885','陈巴尔虎旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('886','新巴尔虎左旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('887','新巴尔虎右旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('888','满洲里市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('889','牙克石市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('890','扎兰屯市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('891','额尔古纳市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('892','根河市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('893','临河区','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('894','五原县','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('895','磴口县','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('896','乌拉特前旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('897','乌拉特中旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('898','乌拉特后旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('899','杭锦后旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('900','集宁区','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('901','卓资县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('902','化德县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('903','商都县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('904','兴和县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('905','凉城县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('906','察哈尔右翼前旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('907','察哈尔右翼中旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('908','察哈尔右翼后旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('909','四子王旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('910','丰镇市','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('911','乌兰浩特市','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('912','阿尔山市','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('913','科尔沁右翼前旗','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('914','科尔沁右翼中旗','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('915','扎赉特旗','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('916','突泉县','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('917','二连浩特市','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('918','锡林浩特市','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('919','阿巴嘎旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('920','苏尼特左旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('921','苏尼特右旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('922','东乌珠穆沁旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('923','西乌珠穆沁旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('924','太仆寺旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('925','镶黄旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('926','正镶白旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('927','正蓝旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('928','多伦县','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('929','阿拉善左旗','0','163','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('930','阿拉善右旗','0','163','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('931','额济纳旗','0','163','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('932','和平区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('933','沈河区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('934','大东区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('935','皇姑区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('936','铁西区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('937','苏家屯区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('938','东陵区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('939','新城子区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('940','于洪区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('941','辽中县','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('942','康平县','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('943','法库县','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('944','新民市','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('945','中山区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('946','西岗区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('947','沙河口区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('948','甘井子区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('949','旅顺口区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('950','金州区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('951','长海县','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('952','瓦房店市','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('953','普兰店市','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('954','庄河市','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('955','铁东区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('956','铁西区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('957','立山区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('958','千山区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('959','台安县','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('960','岫岩满族自治县','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('961','海城市','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('962','新抚区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('963','东洲区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('964','望花区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('965','顺城区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('966','抚顺县','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('967','新宾满族自治县','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('968','清原满族自治县','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('969','平山区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('970','溪湖区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('971','明山区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('972','南芬区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('973','本溪满族自治县','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('974','桓仁满族自治县','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('975','元宝区','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('976','振兴区','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('977','振安区','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('978','宽甸满族自治县','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('979','东港市','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('980','凤城市','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('981','古塔区','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('982','凌河区','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('983','太和区','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('984','黑山县','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('985','义县','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('986','凌海市','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('987','北镇市','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('988','站前区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('989','西市区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('990','鲅鱼圈区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('991','老边区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('992','盖州市','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('993','大石桥市','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('994','海州区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('995','新邱区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('996','太平区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('997','清河门区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('998','细河区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('999','阜新蒙古族自治县','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1000','彰武县','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1001','白塔区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1002','文圣区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1003','宏伟区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1004','弓长岭区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1005','太子河区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1006','辽阳县','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1007','灯塔市','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1008','双台子区','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1009','兴隆台区','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1010','大洼县','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1011','盘山县','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1012','银州区','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1013','清河区','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1014','铁岭县','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1015','西丰县','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1016','昌图县','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1017','调兵山市','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1018','开原市','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1019','双塔区','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1020','龙城区','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1021','朝阳县','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1022','建平县','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1023','喀喇沁左翼蒙古族自治县','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1024','北票市','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1025','凌源市','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1026','连山区','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1027','龙港区','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1028','南票区','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1029','绥中县','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1030','建昌县','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1031','兴城市','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1032','南关区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1033','宽城区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1034','朝阳区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1035','二道区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1036','绿园区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1037','双阳区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1038','农安县','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1039','九台市','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1040','榆树市','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1041','德惠市','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1042','昌邑区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1043','龙潭区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1044','船营区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1045','丰满区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1046','永吉县','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1047','蛟河市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1048','桦甸市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1049','舒兰市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1050','磐石市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1051','铁西区','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1052','铁东区','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1053','梨树县','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1054','伊通满族自治县','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1055','公主岭市','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1056','双辽市','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1057','龙山区','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1058','西安区','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1059','东丰县','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1060','东辽县','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1061','东昌区','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1062','二道江区','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1063','通化县','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1064','辉南县','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1065','柳河县','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1066','梅河口市','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1067','集安市','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1068','八道江区','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1069','抚松县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1070','靖宇县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1071','长白朝鲜族自治县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1072','江源县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1073','临江市','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1074','宁江区','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1075','前郭尔罗斯蒙古族自治县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1076','长岭县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1077','乾安县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1078','扶余县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1079','洮北区','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1080','镇赉县','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1081','通榆县','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1082','洮南市','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1083','大安市','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1084','延吉市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1085','图们市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1086','敦化市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1087','珲春市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1088','龙井市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1089','和龙市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1090','汪清县','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1091','安图县','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1092','道里区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1093','南岗区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1094','道外区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1095','香坊区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1096','动力区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1097','平房区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1098','松北区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1099','呼兰区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1100','依兰县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1101','方正县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1102','宾县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1103','巴彦县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1104','木兰县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1105','通河县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1106','延寿县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1107','阿城市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1108','双城市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1109','尚志市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1110','五常市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1111','龙沙区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1112','建华区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1113','铁锋区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1114','昂昂溪区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1115','富拉尔基区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1116','碾子山区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1117','梅里斯达斡尔族区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1118','龙江县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1119','依安县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1120','泰来县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1121','甘南县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1122','富裕县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1123','克山县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1124','克东县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1125','拜泉县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1126','讷河市','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1127','鸡冠区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1128','恒山区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1129','滴道区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1130','梨树区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1131','城子河区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1132','麻山区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1133','鸡东县','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1134','虎林市','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1135','密山市','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1136','向阳区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1137','工农区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1138','南山区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1139','兴安区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1140','东山区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1141','兴山区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1142','萝北县','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1143','绥滨县','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1144','尖山区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1145','岭东区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1146','四方台区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1147','宝山区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1148','集贤县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1149','友谊县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1150','宝清县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1151','饶河县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1152','萨尔图区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1153','龙凤区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1154','让胡路区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1155','红岗区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1156','大同区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1157','肇州县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1158','肇源县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1159','林甸县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1160','杜尔伯特蒙古族自治县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1161','伊春区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1162','南岔区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1163','友好区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1164','西林区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1165','翠峦区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1166','新青区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1167','美溪区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1168','金山屯区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1169','五营区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1170','乌马河区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1171','汤旺河区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1172','带岭区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1173','乌伊岭区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1174','红星区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1175','上甘岭区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1176','嘉荫县','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1177','铁力市','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1178','永红区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1179','向阳区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1180','前进区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1181','东风区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1182','郊区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1183','桦南县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1184','桦川县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1185','汤原县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1186','抚远县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1187','同江市','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1188','富锦市','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1189','新兴区','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1190','桃山区','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1191','茄子河区','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1192','勃利县','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1193','东安区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1194','阳明区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1195','爱民区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1196','西安区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1197','东宁县','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1198','林口县','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1199','绥芬河市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1200','海林市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1201','宁安市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1202','穆棱市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1203','爱辉区','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1204','嫩江县','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1205','逊克县','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1206','孙吴县','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1207','北安市','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1208','五大连池市','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1209','北林区','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1210','望奎县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1211','兰西县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1212','青冈县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1213','庆安县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1214','明水县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1215','绥棱县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1216','安达市','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1217','肇东市','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1218','海伦市','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1219','呼玛县','0','199','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1220','塔河县','0','199','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1221','漠河县','0','199','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1222','玄武区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1223','白下区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1224','秦淮区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1225','建邺区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1226','鼓楼区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1227','下关区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1228','浦口区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1229','栖霞区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1230','雨花台区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1231','江宁区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1232','六合区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1233','溧水县','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1234','高淳县','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1235','崇安区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1236','南长区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1237','北塘区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1238','锡山区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1239','惠山区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1240','滨湖区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1241','江阴市','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1242','宜兴市','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1243','鼓楼区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1244','云龙区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1245','九里区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1246','贾汪区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1247','泉山区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1248','丰县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1249','沛县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1250','铜山县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1251','睢宁县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1252','新沂市','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1253','邳州市','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1254','天宁区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1255','钟楼区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1256','戚墅堰区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1257','新北区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1258','武进区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1259','溧阳市','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1260','金坛市','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1261','沧浪区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1262','平江区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1263','金阊区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1264','虎丘区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1265','吴中区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1266','相城区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1267','常熟市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1268','张家港市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1269','昆山市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1270','吴江市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1271','太仓市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1272','崇川区','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1273','港闸区','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1274','海安县','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1275','如东县','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1276','启东市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1277','如皋市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1278','通州市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1279','海门市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1280','连云区','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1281','新浦区','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1282','海州区','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1283','赣榆县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1284','东海县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1285','灌云县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1286','灌南县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1287','清河区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1288','楚州区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1289','淮阴区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1290','清浦区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1291','涟水县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1292','洪泽县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1293','盱眙县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1294','金湖县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1295','亭湖区','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1296','盐都区','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1297','响水县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1298','滨海县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1299','阜宁县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1300','射阳县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1301','建湖县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1302','东台市','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1303','大丰市','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1304','广陵区','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1305','邗江区','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1306','维扬区','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1307','宝应县','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1308','仪征市','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1309','高邮市','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1310','江都市','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1311','京口区','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1312','润州区','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1313','丹徒区','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1314','丹阳市','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1315','扬中市','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1316','句容市','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1317','海陵区','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1318','高港区','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1319','兴化市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1320','靖江市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1321','泰兴市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1322','姜堰市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1323','宿城区','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1324','宿豫区','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1325','沭阳县','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1326','泗阳县','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1327','泗洪县','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1328','上城区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1329','下城区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1330','江干区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1331','拱墅区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1332','西湖区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1333','滨江区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1334','萧山区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1335','余杭区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1336','桐庐县','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1337','淳安县','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1338','建德市','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1339','富阳市','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1340','临安市','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1341','海曙区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1342','江东区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1343','江北区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1344','北仑区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1345','镇海区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1346','鄞州区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1347','象山县','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1348','宁海县','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1349','余姚市','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1350','慈溪市','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1351','奉化市','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1352','鹿城区','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1353','龙湾区','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1354','瓯海区','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1355','洞头县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1356','永嘉县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1357','平阳县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1358','苍南县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1359','文成县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1360','泰顺县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1361','瑞安市','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1362','乐清市','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1363','秀城区','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1364','秀洲区','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1365','嘉善县','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1366','海盐县','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1367','海宁市','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1368','平湖市','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1369','桐乡市','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1370','吴兴区','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1371','南浔区','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1372','德清县','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1373','长兴县','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1374','安吉县','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1375','越城区','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1376','绍兴县','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1377','新昌县','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1378','诸暨市','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1379','上虞市','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1380','嵊州市','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1381','婺城区','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1382','金东区','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1383','武义县','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1384','浦江县','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1385','磐安县','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1386','兰溪市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1387','义乌市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1388','东阳市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1389','永康市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1390','柯城区','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1391','衢江区','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1392','常山县','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1393','开化县','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1394','龙游县','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1395','江山市','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1396','定海区','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1397','普陀区','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1398','岱山县','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1399','嵊泗县','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1400','椒江区','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1401','黄岩区','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1402','路桥区','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1403','玉环县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1404','三门县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1405','天台县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1406','仙居县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1407','温岭市','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1408','临海市','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1409','莲都区','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1410','青田县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1411','缙云县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1412','遂昌县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1413','松阳县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1414','云和县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1415','庆元县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1416','景宁畲族自治县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1417','龙泉市','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1418','瑶海区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1419','庐阳区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1420','蜀山区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1421','包河区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1422','长丰县','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1423','肥东县','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1424','肥西县','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1425','镜湖区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1426','弋江区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1427','鸠江区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1428','三山区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1429','芜湖县','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1430','繁昌县','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1431','南陵县','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1432','龙子湖区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1433','蚌山区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1434','禹会区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1435','淮上区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1436','怀远县','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1437','五河县','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1438','固镇县','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1439','大通区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1440','田家庵区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1441','谢家集区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1442','八公山区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1443','潘集区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1444','凤台县','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1445','金家庄区','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1446','花山区','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1447','雨山区','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1448','当涂县','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1449','杜集区','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1450','相山区','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1451','烈山区','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1452','濉溪县','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1453','铜官山区','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1454','狮子山区','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1455','郊区','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1456','铜陵县','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1457','迎江区','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1458','大观区','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1459','宜秀区','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1460','怀宁县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1461','枞阳县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1462','潜山县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1463','太湖县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1464','宿松县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1465','望江县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1466','岳西县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1467','桐城市','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1468','屯溪区','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1469','黄山区','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1470','徽州区','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1471','歙县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1472','休宁县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1473','黟县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1474','祁门县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1475','琅琊区','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1476','南谯区','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1477','来安县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1478','全椒县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1479','定远县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1480','凤阳县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1481','天长市','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1482','明光市','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1483','颍州区','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1484','颍东区','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1485','颍泉区','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1486','临泉县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1487','太和县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1488','阜南县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1489','颍上县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1490','界首市','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1491','埇桥区','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1492','砀山县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1493','萧县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1494','灵璧县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1495','泗县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1496','居巢区','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1497','庐江县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1498','无为县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1499','含山县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1500','和县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1501','金安区','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1502','裕安区','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1503','寿县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1504','霍邱县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1505','舒城县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1506','金寨县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1507','霍山县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1508','谯城区','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1509','涡阳县','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1510','蒙城县','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1511','利辛县','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1512','贵池区','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1513','东至县','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1514','石台县','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1515','青阳县','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1516','宣州区','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1517','郎溪县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1518','广德县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1519','泾县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1520','绩溪县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1521','旌德县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1522','宁国市','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1523','鼓楼区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1524','台江区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1525','仓山区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1526','马尾区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1527','晋安区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1528','闽侯县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1529','连江县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1530','罗源县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1531','闽清县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1532','永泰县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1533','平潭县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1534','福清市','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1535','长乐市','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1536','思明区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1537','海沧区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1538','湖里区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1539','集美区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1540','同安区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1541','翔安区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1542','城厢区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1543','涵江区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1544','荔城区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1545','秀屿区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1546','仙游县','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1547','梅列区','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1548','三元区','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1549','明溪县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1550','清流县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1551','宁化县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1552','大田县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1553','尤溪县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1554','沙县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1555','将乐县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1556','泰宁县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1557','建宁县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1558','永安市','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1559','鲤城区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1560','丰泽区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1561','洛江区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1562','泉港区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1563','惠安县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1564','安溪县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1565','永春县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1566','德化县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1567','金门县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1568','石狮市','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1569','晋江市','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1570','南安市','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1571','芗城区','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1572','龙文区','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1573','云霄县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1574','漳浦县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1575','诏安县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1576','长泰县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1577','东山县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1578','南靖县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1579','平和县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1580','华安县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1581','龙海市','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1582','延平区','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1583','顺昌县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1584','浦城县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1585','光泽县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1586','松溪县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1587','政和县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1588','邵武市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1589','武夷山市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1590','建瓯市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1591','建阳市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1592','新罗区','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1593','长汀县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1594','永定县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1595','上杭县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1596','武平县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1597','连城县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1598','漳平市','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1599','蕉城区','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1600','霞浦县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1601','古田县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1602','屏南县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1603','寿宁县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1604','周宁县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1605','柘荣县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1606','福安市','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1607','福鼎市','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1608','东湖区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1609','西湖区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1610','青云谱区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1611','湾里区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1612','青山湖区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1613','南昌县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1614','新建县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1615','安义县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1616','进贤县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1617','昌江区','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1618','珠山区','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1619','浮梁县','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1620','乐平市','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1621','安源区','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1622','湘东区','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1623','莲花县','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1624','上栗县','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1625','芦溪县','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1626','庐山区','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1627','浔阳区','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1628','九江县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1629','武宁县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1630','修水县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1631','永修县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1632','德安县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1633','星子县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1634','都昌县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1635','湖口县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1636','彭泽县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1637','瑞昌市','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1638','渝水区','0','254','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1639','分宜县','0','254','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1640','月湖区','0','255','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1641','余江县','0','255','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1642','贵溪市','0','255','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1643','章贡区','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1644','赣县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1645','信丰县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1646','大余县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1647','上犹县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1648','崇义县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1649','安远县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1650','龙南县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1651','定南县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1652','全南县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1653','宁都县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1654','于都县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1655','兴国县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1656','会昌县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1657','寻乌县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1658','石城县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1659','瑞金市','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1660','南康市','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1661','吉州区','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1662','青原区','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1663','吉安县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1664','吉水县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1665','峡江县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1666','新干县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1667','永丰县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1668','泰和县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1669','遂川县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1670','万安县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1671','安福县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1672','永新县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1673','井冈山市','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1674','袁州区','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1675','奉新县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1676','万载县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1677','上高县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1678','宜丰县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1679','靖安县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1680','铜鼓县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1681','丰城市','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1682','樟树市','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1683','高安市','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1684','临川区','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1685','南城县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1686','黎川县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1687','南丰县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1688','崇仁县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1689','乐安县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1690','宜黄县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1691','金溪县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1692','资溪县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1693','东乡县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1694','广昌县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1695','信州区','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1696','上饶县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1697','广丰县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1698','玉山县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1699','铅山县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1700','横峰县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1701','弋阳县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1702','余干县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1703','鄱阳县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1704','万年县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1705','婺源县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1706','德兴市','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1707','历下区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1708','市中区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1709','槐荫区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1710','天桥区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1711','历城区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1712','长清区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1713','平阴县','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1714','济阳县','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1715','商河县','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1716','章丘市','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1717','市南区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1718','市北区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1719','四方区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1720','黄岛区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1721','崂山区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1722','李沧区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1723','城阳区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1724','胶州市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1725','即墨市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1726','平度市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1727','胶南市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1728','莱西市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1729','淄川区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1730','张店区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1731','博山区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1732','临淄区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1733','周村区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1734','桓台县','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1735','高青县','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1736','沂源县','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1737','市中区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1738','薛城区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1739','峄城区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1740','台儿庄区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1741','山亭区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1742','滕州市','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1743','东营区','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1744','河口区','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1745','垦利县','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1746','利津县','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1747','广饶县','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1748','芝罘区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1749','福山区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1750','牟平区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1751','莱山区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1752','长岛县','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1753','龙口市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1754','莱阳市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1755','莱州市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1756','蓬莱市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1757','招远市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1758','栖霞市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1759','海阳市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1760','潍城区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1761','寒亭区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1762','坊子区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1763','奎文区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1764','临朐县','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1765','昌乐县','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1766','青州市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1767','诸城市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1768','寿光市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1769','安丘市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1770','高密市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1771','昌邑市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1772','市中区','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1773','任城区','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1774','微山县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1775','鱼台县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1776','金乡县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1777','嘉祥县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1778','汶上县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1779','泗水县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1780','梁山县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1781','曲阜市','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1782','兖州市','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1783','邹城市','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1784','泰山区','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1785','岱岳区','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1786','宁阳县','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1787','东平县','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1788','新泰市','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1789','肥城市','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1790','环翠区','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1791','文登市','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1792','荣成市','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1793','乳山市','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1794','东港区','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1795','岚山区','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1796','五莲县','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1797','莒县','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1798','莱城区','0','272','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1799','钢城区','0','272','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1800','兰山区','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1801','罗庄区','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1802','河东区','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1803','沂南县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1804','郯城县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1805','沂水县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1806','苍山县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1807','费县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1808','平邑县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1809','莒南县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1810','蒙阴县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1811','临沭县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1812','德城区','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1813','陵县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1814','宁津县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1815','庆云县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1816','临邑县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1817','齐河县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1818','平原县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1819','夏津县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1820','武城县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1821','乐陵市','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1822','禹城市','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1823','东昌府区','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1824','阳谷县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1825','莘县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1826','茌平县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1827','东阿县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1828','冠县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1829','高唐县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1830','临清市','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1831','滨城区','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1832','惠民县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1833','阳信县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1834','无棣县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1835','沾化县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1836','博兴县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1837','邹平县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1838','牡丹区','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1839','曹县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1840','单县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1841','成武县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1842','巨野县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1843','郓城县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1844','鄄城县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1845','定陶县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1846','东明县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1847','中原区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1848','二七区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1849','管城回族区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1850','金水区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1851','上街区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1852','惠济区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1853','中牟县','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1854','巩义市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1855','荥阳市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1856','新密市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1857','新郑市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1858','登封市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1859','龙亭区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1860','顺河回族区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1861','鼓楼区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1862','禹王台区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1863','金明区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1864','杞县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1865','通许县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1866','尉氏县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1867','开封县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1868','兰考县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1869','老城区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1870','西工区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1871','廛河回族区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1872','涧西区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1873','吉利区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1874','洛龙区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1875','孟津县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1876','新安县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1877','栾川县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1878','嵩县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1879','汝阳县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1880','宜阳县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1881','洛宁县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1882','伊川县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1883','偃师市','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1884','新华区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1885','卫东区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1886','石龙区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1887','湛河区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1888','宝丰县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1889','叶县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1890','鲁山县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1891','郏县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1892','舞钢市','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1893','汝州市','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1894','文峰区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1895','北关区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1896','殷都区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1897','龙安区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1898','安阳县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1899','汤阴县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1900','滑县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1901','内黄县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1902','林州市','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1903','鹤山区','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1904','山城区','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1905','淇滨区','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1906','浚县','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1907','淇县','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1908','红旗区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1909','卫滨区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1910','凤泉区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1911','牧野区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1912','新乡县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1913','获嘉县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1914','原阳县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1915','延津县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1916','封丘县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1917','长垣县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1918','卫辉市','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1919','辉县市','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1920','解放区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1921','中站区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1922','马村区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1923','山阳区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1924','修武县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1925','博爱县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1926','武陟县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1927','温县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1928','济源市','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1929','沁阳市','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1930','孟州市','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1931','华龙区','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1932','清丰县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1933','南乐县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1934','范县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1935','台前县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1936','濮阳县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1937','魏都区','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1938','许昌县','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1939','鄢陵县','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1940','襄城县','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1941','禹州市','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1942','长葛市','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1943','源汇区','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1944','郾城区','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1945','召陵区','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1946','舞阳县','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1947','临颍县','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1948','湖滨区','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1949','渑池县','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1950','陕县','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1951','卢氏县','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1952','义马市','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1953','灵宝市','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1954','宛城区','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1955','卧龙区','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1956','南召县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1957','方城县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1958','西峡县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1959','镇平县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1960','内乡县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1961','淅川县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1962','社旗县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1963','唐河县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1964','新野县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1965','桐柏县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1966','邓州市','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1967','梁园区','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1968','睢阳区','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1969','民权县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1970','睢县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1971','宁陵县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1972','柘城县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1973','虞城县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1974','夏邑县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1975','永城市','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1976','浉河区','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1977','平桥区','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1978','罗山县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1979','光山县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1980','新县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1981','商城县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1982','固始县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1983','潢川县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1984','淮滨县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1985','息县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1986','川汇区','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1987','扶沟县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1988','西华县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1989','商水县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1990','沈丘县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1991','郸城县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1992','淮阳县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1993','太康县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1994','鹿邑县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1995','项城市','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1996','驿城区','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1997','西平县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1998','上蔡县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1999','平舆县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2000','正阳县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2001','确山县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2002','泌阳县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2003','汝南县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2004','遂平县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2005','新蔡县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2006','江岸区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2007','江汉区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2008','硚口区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2009','汉阳区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2010','武昌区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2011','青山区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2012','洪山区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2013','东西湖区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2014','汉南区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2015','蔡甸区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2016','江夏区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2017','黄陂区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2018','新洲区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2019','黄石港区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2020','西塞山区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2021','下陆区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2022','铁山区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2023','阳新县','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2024','大冶市','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2025','茅箭区','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2026','张湾区','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2027','郧县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2028','郧西县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2029','竹山县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2030','竹溪县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2031','房县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2032','丹江口市','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2033','西陵区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2034','伍家岗区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2035','点军区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2036','猇亭区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2037','夷陵区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2038','远安县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2039','兴山县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2040','秭归县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2041','长阳土家族自治县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2042','五峰土家族自治县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2043','宜都市','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2044','当阳市','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2045','枝江市','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2046','襄城区','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2047','樊城区','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2048','襄阳区','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2049','南漳县','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2050','谷城县','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2051','保康县','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2052','老河口市','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2053','枣阳市','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2054','宜城市','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2055','梁子湖区','0','300','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2056','华容区','0','300','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2057','鄂城区','0','300','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2058','东宝区','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2059','掇刀区','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2060','京山县','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2061','沙洋县','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2062','钟祥市','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2063','孝南区','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2064','孝昌县','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2065','大悟县','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2066','云梦县','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2067','应城市','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2068','安陆市','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2069','汉川市','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2070','沙市区','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2071','荆州区','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2072','公安县','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2073','监利县','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2074','江陵县','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2075','石首市','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2076','洪湖市','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2077','松滋市','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2078','黄州区','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2079','团风县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2080','红安县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2081','罗田县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2082','英山县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2083','浠水县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2084','蕲春县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2085','黄梅县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2086','麻城市','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2087','武穴市','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2088','咸安区','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2089','嘉鱼县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2090','通城县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2091','崇阳县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2092','通山县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2093','赤壁市','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2094','曾都区','0','306','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2095','广水市','0','306','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2096','恩施市','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2097','利川市','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2098','建始县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2099','巴东县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2100','宣恩县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2101','咸丰县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2102','来凤县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2103','鹤峰县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2104','芙蓉区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2105','天心区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2106','岳麓区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2107','开福区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2108','雨花区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2109','长沙县','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2110','望城县','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2111','宁乡县','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2112','浏阳市','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2113','荷塘区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2114','芦淞区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2115','石峰区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2116','天元区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2117','株洲县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2118','攸县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2119','茶陵县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2120','炎陵县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2121','醴陵市','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2122','雨湖区','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2123','岳塘区','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2124','湘潭县','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2125','湘乡市','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2126','韶山市','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2127','珠晖区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2128','雁峰区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2129','石鼓区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2130','蒸湘区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2131','南岳区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2132','衡阳县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2133','衡南县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2134','衡山县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2135','衡东县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2136','祁东县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2137','耒阳市','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2138','常宁市','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2139','双清区','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2140','大祥区','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2141','北塔区','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2142','邵东县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2143','新邵县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2144','邵阳县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2145','隆回县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2146','洞口县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2147','绥宁县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2148','新宁县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2149','城步苗族自治县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2150','武冈市','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2151','岳阳楼区','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2152','云溪区','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2153','君山区','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2154','岳阳县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2155','华容县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2156','湘阴县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2157','平江县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2158','汨罗市','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2159','临湘市','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2160','武陵区','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2161','鼎城区','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2162','安乡县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2163','汉寿县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2164','澧县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2165','临澧县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2166','桃源县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2167','石门县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2168','津市市','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2169','永定区','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2170','武陵源区','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2171','慈利县','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2172','桑植县','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2173','资阳区','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2174','赫山区','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2175','南县','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2176','桃江县','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2177','安化县','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2178','沅江市','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2179','北湖区','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2180','苏仙区','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2181','桂阳县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2182','宜章县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2183','永兴县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2184','嘉禾县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2185','临武县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2186','汝城县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2187','桂东县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2188','安仁县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2189','资兴市','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2190','零陵区','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2191','冷水滩区','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2192','祁阳县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2193','东安县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2194','双牌县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2195','道县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2196','江永县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2197','宁远县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2198','蓝山县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2199','新田县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2200','江华瑶族自治县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2201','鹤城区','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2202','中方县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2203','沅陵县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2204','辰溪县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2205','溆浦县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2206','会同县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2207','麻阳苗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2208','新晃侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2209','芷江侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2210','靖州苗族侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2211','通道侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2212','洪江市','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2213','娄星区','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2214','双峰县','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2215','新化县','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2216','冷水江市','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2217','涟源市','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2218','吉首市','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2219','泸溪县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2220','凤凰县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2221','花垣县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2222','保靖县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2223','古丈县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2224','永顺县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2225','龙山县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2226','荔湾区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2227','越秀区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2228','海珠区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2229','天河区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2230','白云区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2231','黄埔区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2232','番禺区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2233','花都区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2234','南沙区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2235','萝岗区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2236','增城市','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2237','从化市','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2238','武江区','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2239','浈江区','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2240','曲江区','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2241','始兴县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2242','仁化县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2243','翁源县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2244','乳源瑶族自治县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2245','新丰县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2246','乐昌市','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2247','南雄市','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2248','罗湖区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2249','福田区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2250','南山区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2251','宝安区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2252','龙岗区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2253','盐田区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2254','香洲区','0','329','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2255','斗门区','0','329','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2256','金湾区','0','329','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2257','龙湖区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2258','金平区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2259','濠江区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2260','潮阳区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2261','潮南区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2262','澄海区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2263','南澳县','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2264','禅城区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2265','南海区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2266','顺德区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2267','三水区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2268','高明区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2269','蓬江区','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2270','江海区','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2271','新会区','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2272','台山市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2273','开平市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2274','鹤山市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2275','恩平市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2276','赤坎区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2277','霞山区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2278','坡头区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2279','麻章区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2280','遂溪县','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2281','徐闻县','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2282','廉江市','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2283','雷州市','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2284','吴川市','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2285','茂南区','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2286','茂港区','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2287','电白县','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2288','高州市','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2289','化州市','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2290','信宜市','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2291','端州区','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2292','鼎湖区','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2293','广宁县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2294','怀集县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2295','封开县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2296','德庆县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2297','高要市','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2298','四会市','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2299','惠城区','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2300','惠阳区','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2301','博罗县','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2302','惠东县','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2303','龙门县','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2304','梅江区','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2305','梅县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2306','大埔县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2307','丰顺县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2308','五华县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2309','平远县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2310','蕉岭县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2311','兴宁市','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2312','城区','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2313','海丰县','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2314','陆河县','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2315','陆丰市','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2316','源城区','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2317','紫金县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2318','龙川县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2319','连平县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2320','和平县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2321','东源县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2322','江城区','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2323','阳西县','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2324','阳东县','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2325','阳春市','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2326','清城区','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2327','佛冈县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2328','阳山县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2329','连山壮族瑶族自治县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2330','连南瑶族自治县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2331','清新县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2332','英德市','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2333','连州市','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2334','湘桥区','0','344','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2335','潮安县','0','344','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2336','饶平县','0','344','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2337','榕城区','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2338','揭东县','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2339','揭西县','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2340','惠来县','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2341','普宁市','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2342','云城区','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2343','新兴县','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2344','郁南县','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2345','云安县','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2346','罗定市','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2347','兴宁区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2348','青秀区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2349','江南区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2350','西乡塘区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2351','良庆区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2352','邕宁区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2353','武鸣县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2354','隆安县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2355','马山县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2356','上林县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2357','宾阳县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2358','横县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2359','城中区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2360','鱼峰区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2361','柳南区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2362','柳北区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2363','柳江县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2364','柳城县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2365','鹿寨县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2366','融安县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2367','融水苗族自治县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2368','三江侗族自治县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2369','秀峰区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2370','叠彩区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2371','象山区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2372','七星区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2373','雁山区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2374','阳朔县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2375','临桂县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2376','灵川县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2377','全州县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2378','兴安县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2379','永福县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2380','灌阳县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2381','龙胜各族自治县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2382','资源县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2383','平乐县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2384','荔蒲县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2385','恭城瑶族自治县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2386','万秀区','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2387','蝶山区','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2388','长洲区','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2389','苍梧县','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2390','藤县','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2391','蒙山县','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2392','岑溪市','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2393','海城区','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2394','银海区','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2395','铁山港区','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2396','合浦县','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2397','港口区','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2398','防城区','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2399','上思县','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2400','东兴市','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2401','钦南区','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2402','钦北区','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2403','灵山县','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2404','浦北县','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2405','港北区','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2406','港南区','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2407','覃塘区','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2408','平南县','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2409','桂平市','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2410','玉州区','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2411','容县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2412','陆川县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2413','博白县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2414','兴业县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2415','北流市','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2416','右江区','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2417','田阳县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2418','田东县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2419','平果县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2420','德保县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2421','靖西县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2422','那坡县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2423','凌云县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2424','乐业县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2425','田林县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2426','西林县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2427','隆林各族自治县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2428','八步区','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2429','昭平县','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2430','钟山县','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2431','富川瑶族自治县','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2432','金城江区','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2433','南丹县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2434','天峨县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2435','凤山县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2436','东兰县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2437','罗城仫佬族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2438','环江毛南族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2439','巴马瑶族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2440','都安瑶族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2441','大化瑶族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2442','宜州市','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2443','兴宾区','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2444','忻城县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2445','象州县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2446','武宣县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2447','金秀瑶族自治县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2448','合山市','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2449','江洲区','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2450','扶绥县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2451','宁明县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2452','龙州县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2453','大新县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2454','天等县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2455','凭祥市','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2456','秀英区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2457','龙华区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2458','琼山区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2459','美兰区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2460','锦江区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2461','青羊区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2462','金牛区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2463','武侯区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2464','成华区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2465','龙泉驿区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2466','青白江区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2467','新都区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2468','温江区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2469','金堂县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2470','双流县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2471','郫县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2472','大邑县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2473','蒲江县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2474','新津县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2475','都江堰市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2476','彭州市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2477','邛崃市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2478','崇州市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2479','自流井区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2480','贡井区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2481','大安区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2482','沿滩区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2483','荣县','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2484','富顺县','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2485','东区','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2486','西区','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2487','仁和区','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2488','米易县','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2489','盐边县','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2490','江阳区','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2491','纳溪区','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2492','龙马潭区','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2493','泸县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2494','合江县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2495','叙永县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2496','古蔺县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2497','旌阳区','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2498','中江县','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2499','罗江县','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2500','广汉市','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2501','什邡市','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2502','绵竹市','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2503','涪城区','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2504','游仙区','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2505','三台县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2506','盐亭县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2507','安县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2508','梓潼县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2509','北川羌族自治县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2510','平武县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2511','江油市','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2512','市中区','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2513','元坝区','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2514','朝天区','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2515','旺苍县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2516','青川县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2517','剑阁县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2518','苍溪县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2519','船山区','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2520','安居区','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2521','蓬溪县','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2522','射洪县','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2523','大英县','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2524','市中区','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2525','东兴区','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2526','威远县','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2527','资中县','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2528','隆昌县','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2529','市中区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2530','沙湾区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2531','五通桥区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2532','金口河区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2533','犍为县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2534','井研县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2535','夹江县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2536','沐川县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2537','峨边彝族自治县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2538','马边彝族自治县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2539','峨眉山市','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2540','顺庆区','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2541','高坪区','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2542','嘉陵区','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2543','南部县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2544','营山县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2545','蓬安县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2546','仪陇县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2547','西充县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2548','阆中市','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2549','东坡区','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2550','仁寿县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2551','彭山县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2552','洪雅县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2553','丹棱县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2554','青神县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2555','翠屏区','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2556','宜宾县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2557','南溪县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2558','江安县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2559','长宁县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2560','高县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2561','珙县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2562','筠连县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2563','兴文县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2564','屏山县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2565','广安区','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2566','岳池县','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2567','武胜县','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2568','邻水县','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2569','华蓥市','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2570','通川区','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2571','达县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2572','宣汉县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2573','开江县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2574','大竹县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2575','渠县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2576','万源市','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2577','雨城区','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2578','名山县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2579','荥经县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2580','汉源县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2581','石棉县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2582','天全县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2583','芦山县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2584','宝兴县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2585','巴州区','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2586','通江县','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2587','南江县','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2588','平昌县','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2589','雁江区','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2590','安岳县','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2591','乐至县','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2592','简阳市','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2593','汶川县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2594','理县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2595','茂县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2596','松潘县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2597','九寨沟县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2598','金川县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2599','小金县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2600','黑水县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2601','马尔康县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2602','壤塘县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2603','阿坝县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2604','若尔盖县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2605','红原县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2606','康定县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2607','泸定县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2608','丹巴县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2609','九龙县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2610','雅江县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2611','道孚县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2612','炉霍县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2613','甘孜县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2614','新龙县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2615','德格县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2616','白玉县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2617','石渠县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2618','色达县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2619','理塘县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2620','巴塘县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2621','乡城县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2622','稻城县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2623','得荣县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2624','西昌市','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2625','木里藏族自治县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2626','盐源县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2627','德昌县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2628','会理县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2629','会东县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2630','宁南县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2631','普格县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2632','布拖县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2633','金阳县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2634','昭觉县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2635','喜德县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2636','冕宁县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2637','越西县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2638','甘洛县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2639','美姑县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2640','雷波县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2641','南明区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2642','云岩区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2643','花溪区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2644','乌当区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2645','白云区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2646','小河区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2647','开阳县','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2648','息烽县','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2649','修文县','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2650','清镇市','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2651','钟山区','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2652','六枝特区','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2653','水城县','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2654','盘县','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2655','红花岗区','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2656','汇川区','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2657','遵义县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2658','桐梓县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2659','绥阳县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2660','正安县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2661','道真仡佬族苗族自治县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2662','务川仡佬族苗族自治县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2663','凤冈县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2664','湄潭县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2665','余庆县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2666','习水县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2667','赤水市','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2668','仁怀市','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2669','西秀区','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2670','平坝县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2671','普定县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2672','镇宁布依族苗族自治县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2673','关岭布依族苗族自治县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2674','紫云苗族布依族自治县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2675','铜仁市','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2676','江口县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2677','玉屏侗族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2678','石阡县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2679','思南县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2680','印江土家族苗族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2681','德江县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2682','沿河土家族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2683','松桃苗族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2684','万山特区','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2685','兴义市','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2686','兴仁县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2687','普安县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2688','晴隆县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2689','贞丰县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2690','望谟县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2691','册亨县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2692','安龙县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2693','毕节市','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2694','大方县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2695','黔西县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2696','金沙县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2697','织金县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2698','纳雍县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2699','威宁彝族回族苗族自治县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2700','赫章县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2701','凯里市','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2702','黄平县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2703','施秉县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2704','三穗县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2705','镇远县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2706','岑巩县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2707','天柱县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2708','锦屏县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2709','剑河县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2710','台江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2711','黎平县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2712','榕江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2713','从江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2714','雷山县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2715','麻江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2716','丹寨县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2717','都匀市','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2718','福泉市','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2719','荔波县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2720','贵定县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2721','瓮安县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2722','独山县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2723','平塘县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2724','罗甸县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2725','长顺县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2726','龙里县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2727','惠水县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2728','三都水族自治县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2729','五华区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2730','盘龙区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2731','官渡区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2732','西山区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2733','东川区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2734','呈贡县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2735','晋宁县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2736','富民县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2737','宜良县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2738','石林彝族自治县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2739','嵩明县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2740','禄劝彝族苗族自治县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2741','寻甸回族彝族自治县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2742','安宁市','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2743','麒麟区','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2744','马龙县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2745','陆良县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2746','师宗县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2747','罗平县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2748','富源县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2749','会泽县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2750','沾益县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2751','宣威市','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2752','红塔区','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2753','江川县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2754','澄江县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2755','通海县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2756','华宁县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2757','易门县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2758','峨山彝族自治县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2759','新平彝族傣族自治县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2760','元江哈尼族彝族傣族自治县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2761','隆阳区','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2762','施甸县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2763','腾冲县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2764','龙陵县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2765','昌宁县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2766','昭阳区','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2767','鲁甸县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2768','巧家县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2769','盐津县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2770','大关县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2771','永善县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2772','绥江县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2773','镇雄县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2774','彝良县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2775','威信县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2776','水富县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2777','古城区','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2778','玉龙纳西族自治县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2779','永胜县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2780','华坪县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2781','宁蒗彝族自治县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2782','翠云区','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2783','普洱哈尼族彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2784','墨江哈尼族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2785','景东彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2786','景谷傣族彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2787','镇沅彝族哈尼族拉祜族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2788','江城哈尼族彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2789','孟连傣族拉祜族佤族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2790','澜沧拉祜族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2791','西盟佤族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2792','临翔区','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2793','凤庆县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2794','云县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2795','永德县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2796','镇康县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2797','双江拉祜族佤族布朗族傣族自治县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2798','耿马傣族佤族自治县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2799','沧源佤族自治县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2800','楚雄市','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2801','双柏县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2802','牟定县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2803','南华县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2804','姚安县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2805','大姚县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2806','永仁县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2807','元谋县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2808','武定县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2809','禄丰县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2810','个旧市','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2811','开远市','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2812','蒙自县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2813','屏边苗族自治县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2814','建水县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2815','石屏县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2816','弥勒县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2817','泸西县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2818','元阳县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2819','红河县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2820','金平苗族瑶族傣族自治县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2821','绿春县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2822','河口瑶族自治县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2823','文山县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2824','砚山县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2825','西畴县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2826','麻栗坡县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2827','马关县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2828','丘北县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2829','广南县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2830','富宁县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2831','景洪市','0','423','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2832','勐海县','0','423','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2833','勐腊县','0','423','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2834','大理市','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2835','漾濞彝族自治县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2836','祥云县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2837','宾川县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2838','弥渡县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2839','南涧彝族自治县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2840','巍山彝族回族自治县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2841','永平县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2842','云龙县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2843','洱源县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2844','剑川县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2845','鹤庆县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2846','瑞丽市','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2847','潞西市','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2848','梁河县','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2849','盈江县','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2850','陇川县','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2851','泸水县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2852','福贡县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2853','贡山独龙族怒族自治县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2854','兰坪白族普米族自治县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2855','香格里拉县','0','427','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2856','德钦县','0','427','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2857','维西傈僳族自治县','0','427','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2858','城关区','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2859','林周县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2860','当雄县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2861','尼木县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2862','曲水县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2863','堆龙德庆县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2864','达孜县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2865','墨竹工卡县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2866','昌都县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2867','江达县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2868','贡觉县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2869','类乌齐县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2870','丁青县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2871','察雅县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2872','八宿县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2873','左贡县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2874','芒康县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2875','洛隆县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2876','边坝县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2877','乃东县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2878','扎囊县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2879','贡嘎县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2880','桑日县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2881','琼结县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2882','曲松县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2883','措美县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2884','洛扎县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2885','加查县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2886','隆子县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2887','错那县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2888','浪卡子县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2889','日喀则市','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2890','南木林县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2891','江孜县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2892','定日县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2893','萨迦县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2894','拉孜县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2895','昂仁县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2896','谢通门县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2897','白朗县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2898','仁布县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2899','康马县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2900','定结县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2901','仲巴县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2902','亚东县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2903','吉隆县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2904','聂拉木县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2905','萨嘎县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2906','岗巴县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2907','那曲县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2908','嘉黎县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2909','比如县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2910','聂荣县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2911','安多县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2912','申扎县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2913','索县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2914','班戈县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2915','巴青县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2916','尼玛县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2917','普兰县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2918','札达县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2919','噶尔县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2920','日土县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2921','革吉县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2922','改则县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2923','措勤县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2924','林芝县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2925','工布江达县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2926','米林县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2927','墨脱县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2928','波密县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2929','察隅县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2930','朗县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2931','新城区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2932','碑林区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2933','莲湖区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2934','灞桥区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2935','未央区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2936','雁塔区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2937','阎良区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2938','临潼区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2939','长安区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2940','蓝田县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2941','周至县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2942','户县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2943','高陵县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2944','王益区','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2945','印台区','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2946','耀州区','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2947','宜君县','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2948','渭滨区','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2949','金台区','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2950','陈仓区','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2951','凤翔县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2952','岐山县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2953','扶风县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2954','眉县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2955','陇县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2956','千阳县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2957','麟游县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2958','凤县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2959','太白县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2960','秦都区','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2961','杨凌区','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2962','渭城区','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2963','三原县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2964','泾阳县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2965','乾县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2966','礼泉县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2967','永寿县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2968','彬县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2969','长武县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2970','旬邑县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2971','淳化县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2972','武功县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2973','兴平市','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2974','临渭区','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2975','华县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2976','潼关县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2977','大荔县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2978','合阳县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2979','澄城县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2980','蒲城县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2981','白水县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2982','富平县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2983','韩城市','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2984','华阴市','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2985','宝塔区','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2986','延长县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2987','延川县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2988','子长县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2989','安塞县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2990','志丹县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2991','吴起县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2992','甘泉县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2993','富县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2994','洛川县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2995','宜川县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2996','黄龙县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2997','黄陵县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2998','汉台区','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2999','南郑县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3000','城固县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3001','洋县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3002','西乡县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3003','勉县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3004','宁强县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3005','略阳县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3006','镇巴县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3007','留坝县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3008','佛坪县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3009','榆阳区','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3010','神木县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3011','府谷县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3012','横山县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3013','靖边县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3014','定边县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3015','绥德县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3016','米脂县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3017','佳县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3018','吴堡县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3019','清涧县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3020','子洲县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3021','汉滨区','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3022','汉阴县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3023','石泉县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3024','宁陕县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3025','紫阳县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3026','岚皋县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3027','平利县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3028','镇坪县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3029','旬阳县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3030','白河县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3031','商州区','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3032','洛南县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3033','丹凤县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3034','商南县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3035','山阳县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3036','镇安县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3037','柞水县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3038','城关区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3039','七里河区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3040','西固区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3041','安宁区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3042','红古区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3043','永登县','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3044','皋兰县','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3045','榆中县','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3046','金川区','0','447','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3047','永昌县','0','447','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3048','白银区','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3049','平川区','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3050','靖远县','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3051','会宁县','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3052','景泰县','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3053','秦城区','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3054','北道区','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3055','清水县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3056','秦安县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3057','甘谷县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3058','武山县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3059','张家川回族自治县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3060','凉州区','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3061','民勤县','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3062','古浪县','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3063','天祝藏族自治县','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3064','甘州区','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3065','肃南裕固族自治县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3066','民乐县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3067','临泽县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3068','高台县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3069','山丹县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3070','崆峒区','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3071','泾川县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3072','灵台县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3073','崇信县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3074','华亭县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3075','庄浪县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3076','静宁县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3077','肃州区','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3078','金塔县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3079','瓜州县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3080','肃北蒙古族自治县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3081','阿克塞哈萨克族自治县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3082','玉门市','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3083','敦煌市','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3084','西峰区','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3085','庆城县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3086','环县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3087','华池县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3088','合水县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3089','正宁县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3090','宁县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3091','镇原县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3092','安定区','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3093','通渭县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3094','陇西县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3095','渭源县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3096','临洮县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3097','漳县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3098','岷县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3099','武都区','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3100','成县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3101','文县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3102','宕昌县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3103','康县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3104','西和县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3105','礼县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3106','徽县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3107','两当县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3108','临夏市','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3109','临夏县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3110','康乐县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3111','永靖县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3112','广河县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3113','和政县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3114','东乡族自治县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3115','积石山保安族东乡族撒拉族自治县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3116','合作市','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3117','临潭县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3118','卓尼县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3119','舟曲县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3120','迭部县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3121','玛曲县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3122','碌曲县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3123','夏河县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3124','城东区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3125','城中区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3126','城西区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3127','城北区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3128','大通回族土族自治县','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3129','湟中县','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3130','湟源县','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3131','平安县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3132','民和回族土族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3133','乐都县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3134','互助土族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3135','化隆回族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3136','循化撒拉族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3137','门源回族自治县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3138','祁连县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3139','海晏县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3140','刚察县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3141','同仁县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3142','尖扎县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3143','泽库县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3144','河南蒙古族自治县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3145','共和县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3146','同德县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3147','贵德县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3148','兴海县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3149','贵南县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3150','玛沁县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3151','班玛县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3152','甘德县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3153','达日县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3154','久治县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3155','玛多县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3156','玉树县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3157','杂多县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3158','称多县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3159','治多县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3160','囊谦县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3161','曲麻莱县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3162','格尔木市','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3163','德令哈市','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3164','乌兰县','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3165','都兰县','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3166','天峻县','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3167','兴庆区','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3168','西夏区','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3169','金凤区','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3170','永宁县','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3171','贺兰县','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3172','灵武市','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3173','大武口区','0','468','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3174','惠农区','0','468','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3175','平罗县','0','468','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3176','利通区','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3177','盐池县','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3178','同心县','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3179','青铜峡市','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3180','原州区','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3181','西吉县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3182','隆德县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3183','泾源县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3184','彭阳县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3185','沙坡头区','0','471','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3186','中宁县','0','471','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3187','海原县','0','471','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3188','天山区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3189','沙依巴克区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3190','新市区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3191','水磨沟区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3192','头屯河区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3193','达坂城区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3194','东山区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3195','乌鲁木齐县','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3196','独山子区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3197','克拉玛依区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3198','白碱滩区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3199','乌尔禾区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3200','吐鲁番市','0','474','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3201','鄯善县','0','474','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3202','托克逊县','0','474','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3203','哈密市','0','475','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3204','巴里坤哈萨克自治县','0','475','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3205','伊吾县','0','475','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3206','昌吉市','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3207','阜康市','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3208','米泉市','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3209','呼图壁县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3210','玛纳斯县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3211','奇台县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3212','吉木萨尔县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3213','木垒哈萨克自治县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3214','博乐市','0','477','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3215','精河县','0','477','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3216','温泉县','0','477','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3217','库尔勒市','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3218','轮台县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3219','尉犁县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3220','若羌县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3221','且末县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3222','焉耆回族自治县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3223','和静县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3224','和硕县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3225','博湖县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3226','阿克苏市','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3227','温宿县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3228','库车县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3229','沙雅县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3230','新和县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3231','拜城县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3232','乌什县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3233','阿瓦提县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3234','柯坪县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3235','阿图什市','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3236','阿克陶县','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3237','阿合奇县','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3238','乌恰县','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3239','喀什市','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3240','疏附县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3241','疏勒县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3242','英吉沙县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3243','泽普县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3244','莎车县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3245','叶城县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3246','麦盖提县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3247','岳普湖县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3248','伽师县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3249','巴楚县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3250','塔什库尔干塔吉克自治县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3251','和田市','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3252','和田县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3253','墨玉县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3254','皮山县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3255','洛浦县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3256','策勒县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3257','于田县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3258','民丰县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3259','伊宁市','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3260','奎屯市','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3261','伊宁县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3262','察布查尔锡伯自治县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3263','霍城县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3264','巩留县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3265','新源县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3266','昭苏县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3267','特克斯县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3268','尼勒克县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3269','塔城市','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3270','乌苏市','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3271','额敏县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3272','沙湾县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3273','托里县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3274','裕民县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3275','和布克赛尔蒙古自治县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3276','阿勒泰市','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3277','布尔津县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3278','富蕴县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3279','福海县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3280','哈巴河县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3281','青河县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3282','吉木乃县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3358','钓鱼岛','','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3359','钓鱼岛','','3358','0','','1','0','','','0');

DROP TABLE IF EXISTS `v9_log`;
CREATE TABLE `v9_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) ENGINE=MyISAM AUTO_INCREMENT=1145 DEFAULT CHARSET=utf8;

INSERT INTO `v9_log` VALUES('1','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2016-01-25 14:53:15');
INSERT INTO `v9_log` VALUES('2','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2016-01-25 14:53:19');
INSERT INTO `v9_log` VALUES('3','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2016-01-25 14:53:20');
INSERT INTO `v9_log` VALUES('4','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2016-01-25 14:53:24');
INSERT INTO `v9_log` VALUES('5','','0','admin','','category','?m=admin&c=category&a=delete','','1','admin','127.0.0.1','2016-01-25 14:56:08');
INSERT INTO `v9_log` VALUES('6','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2016-01-25 14:56:15');
INSERT INTO `v9_log` VALUES('7','','0','admin','','category','?m=admin&c=category&a=batch_edit','','1','admin','127.0.0.1','2016-01-25 14:57:09');
INSERT INTO `v9_log` VALUES('8','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2016-01-25 14:57:18');
INSERT INTO `v9_log` VALUES('9','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2016-01-25 14:58:21');
INSERT INTO `v9_log` VALUES('10','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2016-01-25 14:58:23');
INSERT INTO `v9_log` VALUES('11','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2016-01-25 14:58:27');
INSERT INTO `v9_log` VALUES('12','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2016-01-25 14:59:03');
INSERT INTO `v9_log` VALUES('13','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2016-01-25 14:59:14');
INSERT INTO `v9_log` VALUES('14','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2016-01-25 14:59:29');
INSERT INTO `v9_log` VALUES('15','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2016-01-25 14:59:44');
INSERT INTO `v9_log` VALUES('16','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2016-01-25 14:59:56');
INSERT INTO `v9_log` VALUES('17','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2016-01-25 15:00:12');
INSERT INTO `v9_log` VALUES('18','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2016-01-25 15:01:33');
INSERT INTO `v9_log` VALUES('19','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2016-01-25 15:15:28');
INSERT INTO `v9_log` VALUES('20','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-01-25 15:15:40');
INSERT INTO `v9_log` VALUES('21','','0','admin','','googlesitemap','?m=admin&c=googlesitemap&a=set','','1','admin','127.0.0.1','2016-01-25 15:15:44');
INSERT INTO `v9_log` VALUES('22','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:22:12');
INSERT INTO `v9_log` VALUES('23','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:23:28');
INSERT INTO `v9_log` VALUES('24','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:23:30');
INSERT INTO `v9_log` VALUES('25','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:23:34');
INSERT INTO `v9_log` VALUES('26','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:25:03');
INSERT INTO `v9_log` VALUES('27','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:25:04');
INSERT INTO `v9_log` VALUES('28','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:25:22');
INSERT INTO `v9_log` VALUES('29','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:25:24');
INSERT INTO `v9_log` VALUES('30','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:25:40');
INSERT INTO `v9_log` VALUES('31','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:25:42');
INSERT INTO `v9_log` VALUES('32','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:26:05');
INSERT INTO `v9_log` VALUES('33','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:26:06');
INSERT INTO `v9_log` VALUES('34','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-01-25 15:26:18');
INSERT INTO `v9_log` VALUES('35','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2016-01-25 15:26:21');
INSERT INTO `v9_log` VALUES('36','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-01-25 15:26:23');
INSERT INTO `v9_log` VALUES('37','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:26:36');
INSERT INTO `v9_log` VALUES('38','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:26:57');
INSERT INTO `v9_log` VALUES('39','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:26:58');
INSERT INTO `v9_log` VALUES('40','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:27:02');
INSERT INTO `v9_log` VALUES('41','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:27:14');
INSERT INTO `v9_log` VALUES('42','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:27:20');
INSERT INTO `v9_log` VALUES('43','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:27:40');
INSERT INTO `v9_log` VALUES('44','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:27:45');
INSERT INTO `v9_log` VALUES('45','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:27:59');
INSERT INTO `v9_log` VALUES('46','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:28:00');
INSERT INTO `v9_log` VALUES('47','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:28:12');
INSERT INTO `v9_log` VALUES('48','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:28:14');
INSERT INTO `v9_log` VALUES('49','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:28:25');
INSERT INTO `v9_log` VALUES('50','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:28:26');
INSERT INTO `v9_log` VALUES('51','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:28:57');
INSERT INTO `v9_log` VALUES('52','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:29:09');
INSERT INTO `v9_log` VALUES('53','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:29:10');
INSERT INTO `v9_log` VALUES('54','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:29:20');
INSERT INTO `v9_log` VALUES('55','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:29:25');
INSERT INTO `v9_log` VALUES('56','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:29:26');
INSERT INTO `v9_log` VALUES('57','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:29:30');
INSERT INTO `v9_log` VALUES('58','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:29:34');
INSERT INTO `v9_log` VALUES('59','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:29:35');
INSERT INTO `v9_log` VALUES('60','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:29:41');
INSERT INTO `v9_log` VALUES('61','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:29:52');
INSERT INTO `v9_log` VALUES('62','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:29:53');
INSERT INTO `v9_log` VALUES('63','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:29:58');
INSERT INTO `v9_log` VALUES('64','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:30:11');
INSERT INTO `v9_log` VALUES('65','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:30:17');
INSERT INTO `v9_log` VALUES('66','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:30:27');
INSERT INTO `v9_log` VALUES('67','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:30:31');
INSERT INTO `v9_log` VALUES('68','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:30:38');
INSERT INTO `v9_log` VALUES('69','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:30:39');
INSERT INTO `v9_log` VALUES('70','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:30:48');
INSERT INTO `v9_log` VALUES('71','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:30:57');
INSERT INTO `v9_log` VALUES('72','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:31:01');
INSERT INTO `v9_log` VALUES('73','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:31:08');
INSERT INTO `v9_log` VALUES('74','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:31:12');
INSERT INTO `v9_log` VALUES('75','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:31:23');
INSERT INTO `v9_log` VALUES('76','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:31:24');
INSERT INTO `v9_log` VALUES('77','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:31:51');
INSERT INTO `v9_log` VALUES('78','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:31:56');
INSERT INTO `v9_log` VALUES('79','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:32:07');
INSERT INTO `v9_log` VALUES('80','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:32:15');
INSERT INTO `v9_log` VALUES('81','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:32:27');
INSERT INTO `v9_log` VALUES('82','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','127.0.0.1','2016-01-25 15:32:28');
INSERT INTO `v9_log` VALUES('83','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2016-01-25 15:32:49');
INSERT INTO `v9_log` VALUES('84','','0','admin','','menu','?m=admin&c=menu&a=listorder','','1','admin','127.0.0.1','2016-01-25 15:33:40');
INSERT INTO `v9_log` VALUES('85','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:36:51');
INSERT INTO `v9_log` VALUES('86','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:37:12');
INSERT INTO `v9_log` VALUES('87','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:37:13');
INSERT INTO `v9_log` VALUES('88','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-01-25 15:37:45');
INSERT INTO `v9_log` VALUES('89','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:37:48');
INSERT INTO `v9_log` VALUES('90','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:38:10');
INSERT INTO `v9_log` VALUES('91','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:46:59');
INSERT INTO `v9_log` VALUES('92','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:47:11');
INSERT INTO `v9_log` VALUES('93','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:47:12');
INSERT INTO `v9_log` VALUES('94','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:47:21');
INSERT INTO `v9_log` VALUES('95','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:47:22');
INSERT INTO `v9_log` VALUES('96','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:47:28');
INSERT INTO `v9_log` VALUES('97','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:47:43');
INSERT INTO `v9_log` VALUES('98','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:47:44');
INSERT INTO `v9_log` VALUES('99','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-01-25 15:57:42');
INSERT INTO `v9_log` VALUES('100','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:57:47');
INSERT INTO `v9_log` VALUES('101','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:58:05');
INSERT INTO `v9_log` VALUES('102','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:58:06');
INSERT INTO `v9_log` VALUES('103','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:58:11');
INSERT INTO `v9_log` VALUES('104','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:58:32');
INSERT INTO `v9_log` VALUES('105','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:58:33');
INSERT INTO `v9_log` VALUES('106','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:58:38');
INSERT INTO `v9_log` VALUES('107','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:59:04');
INSERT INTO `v9_log` VALUES('108','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 15:59:06');
INSERT INTO `v9_log` VALUES('109','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-01-25 16:00:22');
INSERT INTO `v9_log` VALUES('110','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:00:26');
INSERT INTO `v9_log` VALUES('111','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:00:38');
INSERT INTO `v9_log` VALUES('112','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:00:39');
INSERT INTO `v9_log` VALUES('113','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:00:45');
INSERT INTO `v9_log` VALUES('114','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:01:02');
INSERT INTO `v9_log` VALUES('115','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:01:03');
INSERT INTO `v9_log` VALUES('116','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:01:08');
INSERT INTO `v9_log` VALUES('117','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:01:48');
INSERT INTO `v9_log` VALUES('118','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:01:59');
INSERT INTO `v9_log` VALUES('119','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:02:00');
INSERT INTO `v9_log` VALUES('120','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:02:44');
INSERT INTO `v9_log` VALUES('121','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:03:09');
INSERT INTO `v9_log` VALUES('122','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:03:10');
INSERT INTO `v9_log` VALUES('123','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:03:17');
INSERT INTO `v9_log` VALUES('124','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:03:23');
INSERT INTO `v9_log` VALUES('125','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:03:24');
INSERT INTO `v9_log` VALUES('126','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:03:30');
INSERT INTO `v9_log` VALUES('127','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:03:58');
INSERT INTO `v9_log` VALUES('128','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:03:59');
INSERT INTO `v9_log` VALUES('129','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:04:04');
INSERT INTO `v9_log` VALUES('130','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:04:32');
INSERT INTO `v9_log` VALUES('131','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:04:33');
INSERT INTO `v9_log` VALUES('132','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:04:44');
INSERT INTO `v9_log` VALUES('133','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:05:09');
INSERT INTO `v9_log` VALUES('134','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:05:10');
INSERT INTO `v9_log` VALUES('135','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:05:15');
INSERT INTO `v9_log` VALUES('136','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:05:36');
INSERT INTO `v9_log` VALUES('137','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:05:37');
INSERT INTO `v9_log` VALUES('138','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:05:42');
INSERT INTO `v9_log` VALUES('139','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:06:28');
INSERT INTO `v9_log` VALUES('140','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2016-01-25 16:06:29');
INSERT INTO `v9_log` VALUES('141','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-01-25 16:09:02');
INSERT INTO `v9_log` VALUES('142','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-01-25 16:09:05');
INSERT INTO `v9_log` VALUES('143','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-01-25 16:09:37');
INSERT INTO `v9_log` VALUES('144','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-01-25 16:09:40');
INSERT INTO `v9_log` VALUES('145','','0','admin','','database','?m=admin&c=database&a=import','','1','admin','127.0.0.1','2016-01-25 16:09:41');
INSERT INTO `v9_log` VALUES('146','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2016-01-25 16:10:17');
INSERT INTO `v9_log` VALUES('147','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2016-01-25 16:10:47');
INSERT INTO `v9_log` VALUES('148','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2016-01-25 16:11:29');
INSERT INTO `v9_log` VALUES('149','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-01-25 17:57:32');
INSERT INTO `v9_log` VALUES('150','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-01-25 17:57:35');
INSERT INTO `v9_log` VALUES('151','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-01-25 17:57:39');
INSERT INTO `v9_log` VALUES('152','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-01-25 17:57:43');
INSERT INTO `v9_log` VALUES('153','','0','admin','','database','?m=admin&c=database&a=import','','1','admin','127.0.0.1','2016-01-25 17:57:44');
INSERT INTO `v9_log` VALUES('154','','0','admin','','index','?m=admin&c=index&a=login','','0','','','2016-01-26 11:39:38');
INSERT INTO `v9_log` VALUES('155','','0','admin','','index','?m=admin&c=index&a=login','','0','','','2016-01-26 11:39:47');
INSERT INTO `v9_log` VALUES('156','','0','admin','','index','?m=admin&c=index&a=login','','0','','','2016-01-26 11:39:48');
INSERT INTO `v9_log` VALUES('157','','0','admin','','index','?m=admin&c=index&a=login','','0','','','2016-01-26 11:39:53');
INSERT INTO `v9_log` VALUES('158','','0','admin','','index','?m=admin&c=index&a=login','','0','','','2016-01-26 11:39:54');
INSERT INTO `v9_log` VALUES('159','','0','admin','','index','?m=admin&c=index&a=login','','0','','','2016-01-26 11:40:00');
INSERT INTO `v9_log` VALUES('160','','0','content','','content','?m=content&c=content&a=add','','1','admin','','2016-01-26 11:40:10');
INSERT INTO `v9_log` VALUES('161','','0','content','','content','?m=content&c=content&a=add','','1','admin','','2016-01-26 11:43:41');
INSERT INTO `v9_log` VALUES('162','','0','content','','content','?m=content&c=content&a=edit','','1','admin','','2016-01-26 11:43:59');
INSERT INTO `v9_log` VALUES('163','','0','content','','content','?m=content&c=content&a=edit','','1','admin','','2016-01-26 11:44:23');
INSERT INTO `v9_log` VALUES('164','','0','content','','content','?m=content&c=content&a=edit','','1','admin','','2016-01-26 11:48:15');
INSERT INTO `v9_log` VALUES('165','','0','content','','content','?m=content&c=content&a=remove','','1','admin','','2016-01-26 17:23:02');
INSERT INTO `v9_log` VALUES('166','','0','content','','content','?m=content&c=content&a=remove','','1','admin','','2016-01-26 17:23:08');
INSERT INTO `v9_log` VALUES('167','','0','content','','content','?m=content&c=content&a=remove','','1','admin','','2016-01-26 17:23:09');
INSERT INTO `v9_log` VALUES('168','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:23:16');
INSERT INTO `v9_log` VALUES('169','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:23:21');
INSERT INTO `v9_log` VALUES('170','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-01-26 17:23:41');
INSERT INTO `v9_log` VALUES('171','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-01-26 17:23:51');
INSERT INTO `v9_log` VALUES('172','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-01-26 17:24:14');
INSERT INTO `v9_log` VALUES('173','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-01-26 17:24:15');
INSERT INTO `v9_log` VALUES('174','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-01-26 17:24:20');
INSERT INTO `v9_log` VALUES('175','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-01-26 17:24:32');
INSERT INTO `v9_log` VALUES('176','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-01-26 17:24:33');
INSERT INTO `v9_log` VALUES('177','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:24:37');
INSERT INTO `v9_log` VALUES('178','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:24:40');
INSERT INTO `v9_log` VALUES('179','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-01-26 17:24:46');
INSERT INTO `v9_log` VALUES('180','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-01-26 17:25:04');
INSERT INTO `v9_log` VALUES('181','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-01-26 17:25:05');
INSERT INTO `v9_log` VALUES('182','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:25:10');
INSERT INTO `v9_log` VALUES('183','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:25:12');
INSERT INTO `v9_log` VALUES('184','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:25:16');
INSERT INTO `v9_log` VALUES('185','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:25:18');
INSERT INTO `v9_log` VALUES('186','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:25:37');
INSERT INTO `v9_log` VALUES('187','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:25:40');
INSERT INTO `v9_log` VALUES('188','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:25:46');
INSERT INTO `v9_log` VALUES('189','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:25:51');
INSERT INTO `v9_log` VALUES('190','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:25:55');
INSERT INTO `v9_log` VALUES('191','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:26:00');
INSERT INTO `v9_log` VALUES('192','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:26:33');
INSERT INTO `v9_log` VALUES('193','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:26:35');
INSERT INTO `v9_log` VALUES('194','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:26:39');
INSERT INTO `v9_log` VALUES('195','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:26:45');
INSERT INTO `v9_log` VALUES('196','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:26:50');
INSERT INTO `v9_log` VALUES('197','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:26:53');
INSERT INTO `v9_log` VALUES('198','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:26:58');
INSERT INTO `v9_log` VALUES('199','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:27:02');
INSERT INTO `v9_log` VALUES('200','','0','content','','content','?m=content&c=content&a=remove','','1','admin','','2016-01-26 17:29:52');
INSERT INTO `v9_log` VALUES('201','','0','content','','content','?m=content&c=content&a=remove','','1','admin','','2016-01-26 17:29:56');
INSERT INTO `v9_log` VALUES('202','','0','content','','content','?m=content&c=content&a=remove','','1','admin','','2016-01-26 17:29:57');
INSERT INTO `v9_log` VALUES('203','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','','2016-01-26 17:30:00');
INSERT INTO `v9_log` VALUES('204','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:30:16');
INSERT INTO `v9_log` VALUES('205','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:30:20');
INSERT INTO `v9_log` VALUES('206','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:30:25');
INSERT INTO `v9_log` VALUES('207','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:30:30');
INSERT INTO `v9_log` VALUES('208','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:30:35');
INSERT INTO `v9_log` VALUES('209','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-01-26 17:30:40');
INSERT INTO `v9_log` VALUES('210','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-01-26 18:03:26');
INSERT INTO `v9_log` VALUES('211','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-01-26 18:03:28');
INSERT INTO `v9_log` VALUES('212','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-01-26 18:03:32');
INSERT INTO `v9_log` VALUES('213','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-01-26 18:03:36');
INSERT INTO `v9_log` VALUES('214','','0','admin','','database','?m=admin&c=database&a=import','','1','admin','','2016-01-26 18:03:37');
INSERT INTO `v9_log` VALUES('215','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-01-27 09:49:26');
INSERT INTO `v9_log` VALUES('216','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-01-27 09:49:25');
INSERT INTO `v9_log` VALUES('217','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-01-27 09:49:33');
INSERT INTO `v9_log` VALUES('218','','0','content','','content','?m=content&c=content&a=edit','','1','admin','','2016-01-27 09:49:45');
INSERT INTO `v9_log` VALUES('219','','0','content','','content','?m=content&c=content&a=edit','','1','admin','','2016-01-27 09:50:51');
INSERT INTO `v9_log` VALUES('220','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','','2016-01-27 14:05:14');
INSERT INTO `v9_log` VALUES('221','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','','2016-01-27 14:06:01');
INSERT INTO `v9_log` VALUES('222','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','','2016-01-27 14:06:02');
INSERT INTO `v9_log` VALUES('223','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','','2016-01-27 14:06:07');
INSERT INTO `v9_log` VALUES('224','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','','2016-01-27 14:06:41');
INSERT INTO `v9_log` VALUES('225','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','','2016-01-27 14:06:42');
INSERT INTO `v9_log` VALUES('226','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','','2016-01-27 14:13:36');
INSERT INTO `v9_log` VALUES('227','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','','2016-01-27 14:13:45');
INSERT INTO `v9_log` VALUES('228','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','','2016-01-27 14:14:08');
INSERT INTO `v9_log` VALUES('229','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','','2016-01-27 14:14:09');
INSERT INTO `v9_log` VALUES('230','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-01-27 16:30:39');
INSERT INTO `v9_log` VALUES('231','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-01-27 16:30:39');
INSERT INTO `v9_log` VALUES('232','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-01-27 16:30:47');
INSERT INTO `v9_log` VALUES('233','','0','admin','','index','?m=admin&c=index&a=login','','0','','','2016-01-27 16:55:08');
INSERT INTO `v9_log` VALUES('234','','0','admin','','index','?m=admin&c=index&a=login','','0','','','2016-01-27 16:55:14');
INSERT INTO `v9_log` VALUES('235','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-01-27 17:15:03');
INSERT INTO `v9_log` VALUES('236','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-01-27 17:15:10');
INSERT INTO `v9_log` VALUES('237','','0','admin','','index','?m=admin&c=index&a=login','','0','','','2016-01-27 17:44:07');
INSERT INTO `v9_log` VALUES('238','','0','admin','','index','?m=admin&c=index&a=login','','0','','','2016-01-27 17:44:16');
INSERT INTO `v9_log` VALUES('239','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-01-27 18:03:29');
INSERT INTO `v9_log` VALUES('240','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-01-27 18:03:31');
INSERT INTO `v9_log` VALUES('241','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-01-27 18:03:34');
INSERT INTO `v9_log` VALUES('242','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-01-27 18:03:38');
INSERT INTO `v9_log` VALUES('243','','0','admin','','database','?m=admin&c=database&a=import','','1','admin','','2016-01-27 18:03:40');
INSERT INTO `v9_log` VALUES('244','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-01 16:51:57');
INSERT INTO `v9_log` VALUES('245','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-01 16:51:57');
INSERT INTO `v9_log` VALUES('246','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-01 16:52:05');
INSERT INTO `v9_log` VALUES('247','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-01 16:52:07');
INSERT INTO `v9_log` VALUES('248','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-01 16:52:14');
INSERT INTO `v9_log` VALUES('249','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','','2016-02-01 16:55:20');
INSERT INTO `v9_log` VALUES('250','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-02-01 18:11:29');
INSERT INTO `v9_log` VALUES('251','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-02-01 18:11:33');
INSERT INTO `v9_log` VALUES('252','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-02-01 18:11:36');
INSERT INTO `v9_log` VALUES('253','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-02-01 18:11:40');
INSERT INTO `v9_log` VALUES('254','','0','admin','','database','?m=admin&c=database&a=import','','1','admin','','2016-02-01 18:11:41');
INSERT INTO `v9_log` VALUES('255','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-15 10:33:05');
INSERT INTO `v9_log` VALUES('256','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-15 10:33:05');
INSERT INTO `v9_log` VALUES('257','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-15 10:33:14');
INSERT INTO `v9_log` VALUES('258','','0','content','','content','?m=content&c=content&a=add','','1','admin','','2016-02-15 10:35:00');
INSERT INTO `v9_log` VALUES('259','','0','content','','content','?m=content&c=content&a=add','','1','admin','','2016-02-15 10:35:10');
INSERT INTO `v9_log` VALUES('260','','0','content','','content','?m=content&c=content&a=edit','','1','admin','','2016-02-15 10:36:52');
INSERT INTO `v9_log` VALUES('261','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','','2016-02-15 10:37:18');
INSERT INTO `v9_log` VALUES('262','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','','2016-02-15 10:37:33');
INSERT INTO `v9_log` VALUES('263','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','','2016-02-15 10:37:36');
INSERT INTO `v9_log` VALUES('264','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','','2016-02-15 10:37:51');
INSERT INTO `v9_log` VALUES('265','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=listorder','','1','admin','','2016-02-15 10:37:59');
INSERT INTO `v9_log` VALUES('266','','0','content','','content','?m=content&c=content&a=edit','','1','admin','','2016-02-15 10:38:04');
INSERT INTO `v9_log` VALUES('267','','0','content','','content','?m=content&c=content&a=edit','','1','admin','','2016-02-15 10:38:16');
INSERT INTO `v9_log` VALUES('268','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-15 10:50:52');
INSERT INTO `v9_log` VALUES('269','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-15 10:51:18');
INSERT INTO `v9_log` VALUES('270','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-15 10:51:23');
INSERT INTO `v9_log` VALUES('271','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-15 10:51:27');
INSERT INTO `v9_log` VALUES('272','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-02-15 10:52:08');
INSERT INTO `v9_log` VALUES('273','','0','admin','','database','?m=admin&c=database&a=import','','1','admin','','2016-02-15 10:52:10');
INSERT INTO `v9_log` VALUES('274','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-02-15 10:52:40');
INSERT INTO `v9_log` VALUES('275','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-02-15 10:52:56');
INSERT INTO `v9_log` VALUES('276','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-02-15 10:52:58');
INSERT INTO `v9_log` VALUES('277','','0','admin','','category','?m=admin&c=category&a=batch_edit','','1','admin','','2016-02-15 10:53:05');
INSERT INTO `v9_log` VALUES('278','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-02-15 10:53:07');
INSERT INTO `v9_log` VALUES('279','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-02-15 10:54:07');
INSERT INTO `v9_log` VALUES('280','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-02-15 10:54:09');
INSERT INTO `v9_log` VALUES('281','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-15 10:54:15');
INSERT INTO `v9_log` VALUES('282','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-15 10:54:22');
INSERT INTO `v9_log` VALUES('283','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-15 10:54:38');
INSERT INTO `v9_log` VALUES('284','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-15 10:54:52');
INSERT INTO `v9_log` VALUES('285','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-15 10:54:56');
INSERT INTO `v9_log` VALUES('286','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-15 10:55:03');
INSERT INTO `v9_log` VALUES('287','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-15 10:55:08');
INSERT INTO `v9_log` VALUES('288','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-15 10:55:13');
INSERT INTO `v9_log` VALUES('289','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-15 10:55:18');
INSERT INTO `v9_log` VALUES('290','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-15 10:55:23');
INSERT INTO `v9_log` VALUES('291','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','','2016-02-15 11:30:04');
INSERT INTO `v9_log` VALUES('292','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','','2016-02-15 11:30:12');
INSERT INTO `v9_log` VALUES('293','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','','2016-02-15 11:30:14');
INSERT INTO `v9_log` VALUES('294','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','','2016-02-15 11:30:19');
INSERT INTO `v9_log` VALUES('295','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-15 15:58:01');
INSERT INTO `v9_log` VALUES('296','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-15 15:58:11');
INSERT INTO `v9_log` VALUES('297','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-15 16:36:07');
INSERT INTO `v9_log` VALUES('298','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-15 16:36:13');
INSERT INTO `v9_log` VALUES('299','','0','admin','','setting','?m=admin&c=setting&a=save','','1','admin','','2016-02-15 16:46:34');
INSERT INTO `v9_log` VALUES('300','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','','2016-02-15 16:46:43');
INSERT INTO `v9_log` VALUES('301','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2016-02-16 18:02:33');
INSERT INTO `v9_log` VALUES('302','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2016-02-16 18:02:33');
INSERT INTO `v9_log` VALUES('303','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2016-02-16 18:02:38');
INSERT INTO `v9_log` VALUES('304','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2016-02-16 18:02:39');
INSERT INTO `v9_log` VALUES('305','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2016-02-16 18:02:44');
INSERT INTO `v9_log` VALUES('306','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-02-16 18:02:50');
INSERT INTO `v9_log` VALUES('307','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-02-16 18:02:52');
INSERT INTO `v9_log` VALUES('308','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-02-16 18:02:53');
INSERT INTO `v9_log` VALUES('309','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-02-16 18:02:54');
INSERT INTO `v9_log` VALUES('310','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-02-16 18:02:56');
INSERT INTO `v9_log` VALUES('311','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-02-16 18:02:58');
INSERT INTO `v9_log` VALUES('312','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2016-02-16 18:03:01');
INSERT INTO `v9_log` VALUES('313','','0','admin','','database','?m=admin&c=database&a=import','','1','admin','127.0.0.1','2016-02-16 18:03:03');
INSERT INTO `v9_log` VALUES('314','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-18 10:36:00');
INSERT INTO `v9_log` VALUES('315','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-18 10:36:00');
INSERT INTO `v9_log` VALUES('316','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-18 10:36:07');
INSERT INTO `v9_log` VALUES('317','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-18 10:36:09');
INSERT INTO `v9_log` VALUES('318','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-18 10:36:14');
INSERT INTO `v9_log` VALUES('319','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-18 10:36:15');
INSERT INTO `v9_log` VALUES('320','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-18 10:36:23');
INSERT INTO `v9_log` VALUES('321','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-02-18 10:37:12');
INSERT INTO `v9_log` VALUES('322','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','','2016-02-18 10:37:50');
INSERT INTO `v9_log` VALUES('323','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-18 10:37:59');
INSERT INTO `v9_log` VALUES('324','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-18 10:38:08');
INSERT INTO `v9_log` VALUES('325','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-18 10:46:25');
INSERT INTO `v9_log` VALUES('326','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','','2016-02-18 10:46:30');
INSERT INTO `v9_log` VALUES('327','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-02-18 11:20:54');
INSERT INTO `v9_log` VALUES('328','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-02-18 11:20:56');
INSERT INTO `v9_log` VALUES('329','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-02-18 11:20:59');
INSERT INTO `v9_log` VALUES('330','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-02-18 11:21:02');
INSERT INTO `v9_log` VALUES('331','','0','admin','','database','?m=admin&c=database&a=import','','1','admin','','2016-02-18 11:21:03');
INSERT INTO `v9_log` VALUES('332','','0','admin','','database','?m=admin&c=database&a=delete','','1','admin','','2016-02-18 11:21:08');
INSERT INTO `v9_log` VALUES('333','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-02-18 11:21:09');
INSERT INTO `v9_log` VALUES('334','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-02-18 11:21:11');
INSERT INTO `v9_log` VALUES('335','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-02-18 11:21:12');
INSERT INTO `v9_log` VALUES('336','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','','2016-02-18 11:21:15');
INSERT INTO `v9_log` VALUES('337','','0','admin','','database','?m=admin&c=database&a=import','','1','admin','','2016-02-18 11:21:17');
INSERT INTO `v9_log` VALUES('338','','0','admin','','index','?m=admin&c=index&a=login','','0','','123.147.86.122','2016-02-18 11:50:34');
INSERT INTO `v9_log` VALUES('339','','0','admin','','index','?m=admin&c=index&a=login','','0','','123.147.86.122','2016-02-18 11:50:42');
INSERT INTO `v9_log` VALUES('340','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','123.147.86.122','2016-02-18 11:51:00');
INSERT INTO `v9_log` VALUES('341','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','123.147.86.122','2016-02-18 11:51:04');
INSERT INTO `v9_log` VALUES('342','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','123.147.86.122','2016-02-18 11:51:05');
INSERT INTO `v9_log` VALUES('343','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','123.147.86.122','2016-02-18 11:51:18');
INSERT INTO `v9_log` VALUES('344','','0','attachment','','address','?m=attachment&c=address&a=update','','1','admin','123.147.86.122','2016-02-18 11:51:45');
INSERT INTO `v9_log` VALUES('345','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','123.147.86.122','2016-02-18 11:58:36');
INSERT INTO `v9_log` VALUES('346','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','123.147.86.122','2016-02-18 11:58:38');
INSERT INTO `v9_log` VALUES('347','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','123.147.86.122','2016-02-18 11:58:38');
INSERT INTO `v9_log` VALUES('348','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','123.147.86.122','2016-02-18 11:58:39');
INSERT INTO `v9_log` VALUES('349','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:58:40');
INSERT INTO `v9_log` VALUES('350','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:58:41');
INSERT INTO `v9_log` VALUES('351','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:58:41');
INSERT INTO `v9_log` VALUES('352','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:58:42');
INSERT INTO `v9_log` VALUES('353','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:58:42');
INSERT INTO `v9_log` VALUES('354','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:58:43');
INSERT INTO `v9_log` VALUES('355','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:58:43');
INSERT INTO `v9_log` VALUES('356','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:17');
INSERT INTO `v9_log` VALUES('357','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:18');
INSERT INTO `v9_log` VALUES('358','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:19');
INSERT INTO `v9_log` VALUES('359','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:19');
INSERT INTO `v9_log` VALUES('360','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:20');
INSERT INTO `v9_log` VALUES('361','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:21');
INSERT INTO `v9_log` VALUES('362','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:21');
INSERT INTO `v9_log` VALUES('363','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:22');
INSERT INTO `v9_log` VALUES('364','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:22');
INSERT INTO `v9_log` VALUES('365','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:23');
INSERT INTO `v9_log` VALUES('366','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:24');
INSERT INTO `v9_log` VALUES('367','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:24');
INSERT INTO `v9_log` VALUES('368','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:25');
INSERT INTO `v9_log` VALUES('369','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:25');
INSERT INTO `v9_log` VALUES('370','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:26');
INSERT INTO `v9_log` VALUES('371','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:27');
INSERT INTO `v9_log` VALUES('372','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:27');
INSERT INTO `v9_log` VALUES('373','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:28');
INSERT INTO `v9_log` VALUES('374','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-18 11:59:28');
INSERT INTO `v9_log` VALUES('375','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','123.147.86.122','2016-02-18 11:59:49');
INSERT INTO `v9_log` VALUES('376','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','123.147.86.122','2016-02-18 11:59:52');
INSERT INTO `v9_log` VALUES('377','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','123.147.86.122','2016-02-18 11:59:53');
INSERT INTO `v9_log` VALUES('378','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','123.147.86.122','2016-02-18 11:59:54');
INSERT INTO `v9_log` VALUES('379','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.86.122','2016-02-19 09:14:57');
INSERT INTO `v9_log` VALUES('380','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.86.122','2016-02-19 09:15:05');
INSERT INTO `v9_log` VALUES('381','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.86.122','2016-02-19 09:15:06');
INSERT INTO `v9_log` VALUES('382','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.86.122','2016-02-19 09:15:17');
INSERT INTO `v9_log` VALUES('383','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','123.147.86.122','2016-02-19 09:15:28');
INSERT INTO `v9_log` VALUES('384','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','123.147.86.122','2016-02-19 09:15:30');
INSERT INTO `v9_log` VALUES('385','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','123.147.86.122','2016-02-19 09:15:30');
INSERT INTO `v9_log` VALUES('386','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','123.147.86.122','2016-02-19 09:15:31');
INSERT INTO `v9_log` VALUES('387','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','123.147.86.122','2016-02-19 09:15:48');
INSERT INTO `v9_log` VALUES('388','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:15:51');
INSERT INTO `v9_log` VALUES('389','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:15:55');
INSERT INTO `v9_log` VALUES('390','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:15:55');
INSERT INTO `v9_log` VALUES('391','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:15:56');
INSERT INTO `v9_log` VALUES('392','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:15:56');
INSERT INTO `v9_log` VALUES('393','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:15:57');
INSERT INTO `v9_log` VALUES('394','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:15:57');
INSERT INTO `v9_log` VALUES('395','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:15:58');
INSERT INTO `v9_log` VALUES('396','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:15:58');
INSERT INTO `v9_log` VALUES('397','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:15:59');
INSERT INTO `v9_log` VALUES('398','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:15:59');
INSERT INTO `v9_log` VALUES('399','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:16:00');
INSERT INTO `v9_log` VALUES('400','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:16:00');
INSERT INTO `v9_log` VALUES('401','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:16:01');
INSERT INTO `v9_log` VALUES('402','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:16:01');
INSERT INTO `v9_log` VALUES('403','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:16:02');
INSERT INTO `v9_log` VALUES('404','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:16:02');
INSERT INTO `v9_log` VALUES('405','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:16:03');
INSERT INTO `v9_log` VALUES('406','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.86.122','2016-02-19 09:16:03');
INSERT INTO `v9_log` VALUES('407','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','123.147.86.122','2016-02-19 09:46:13');
INSERT INTO `v9_log` VALUES('408','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','123.147.86.122','2016-02-19 09:46:22');
INSERT INTO `v9_log` VALUES('409','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','123.147.86.122','2016-02-19 09:46:27');
INSERT INTO `v9_log` VALUES('410','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','123.147.86.122','2016-02-19 09:46:28');
INSERT INTO `v9_log` VALUES('411','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.86.122','2016-02-19 11:33:35');
INSERT INTO `v9_log` VALUES('412','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.86.122','2016-02-19 11:33:35');
INSERT INTO `v9_log` VALUES('413','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.86.122','2016-02-19 11:33:42');
INSERT INTO `v9_log` VALUES('414','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.90.241','2016-02-23 15:03:24');
INSERT INTO `v9_log` VALUES('415','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.90.241','2016-02-23 15:03:31');
INSERT INTO `v9_log` VALUES('416','','0','admin','','index','?m=admin&c=index&a=login','','0','','125.84.81.27','2016-02-23 16:31:04');
INSERT INTO `v9_log` VALUES('417','','0','admin','','index','?m=admin&c=index&a=login','','0','','125.84.81.27','2016-02-23 16:31:32');
INSERT INTO `v9_log` VALUES('418','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.81.27','2016-02-23 16:32:26');
INSERT INTO `v9_log` VALUES('419','','0','admin','','index','?m=admin&c=index&a=login','','0','','180.173.36.21','2016-02-23 21:21:18');
INSERT INTO `v9_log` VALUES('420','','0','admin','','index','?m=admin&c=index&a=login','','0','','180.173.36.21','2016-02-23 21:21:29');
INSERT INTO `v9_log` VALUES('421','','0','admin','','index','?m=admin&c=index&a=login','','0','','180.173.36.21','2016-02-23 21:21:33');
INSERT INTO `v9_log` VALUES('422','','0','admin','','index','?m=admin&c=index&a=login','','0','','180.173.36.21','2016-02-23 21:21:40');
INSERT INTO `v9_log` VALUES('423','','0','content','','content','?m=content&c=content&a=edit','','1','admin','180.173.36.21','2016-02-23 21:25:36');
INSERT INTO `v9_log` VALUES('424','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','180.173.36.21','2016-02-23 21:26:35');
INSERT INTO `v9_log` VALUES('425','','0','member','','member','?m=member&c=member&a=manage','','1','admin','180.173.36.21','2016-02-23 21:28:13');
INSERT INTO `v9_log` VALUES('426','','0','admin','','index','?m=admin&c=index&a=login','','0','','183.228.4.103','2016-02-23 21:34:27');
INSERT INTO `v9_log` VALUES('427','','0','admin','','index','?m=admin&c=index&a=login','','0','','183.228.4.103','2016-02-23 21:34:40');
INSERT INTO `v9_log` VALUES('428','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','180.173.36.21','2016-02-23 21:54:33');
INSERT INTO `v9_log` VALUES('429','','0','content','','content','?m=content&c=content&a=clear_data','','1','admin','180.173.36.21','2016-02-23 21:54:48');
INSERT INTO `v9_log` VALUES('430','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','180.173.36.21','2016-02-23 21:54:49');
INSERT INTO `v9_log` VALUES('431','','0','video','','video','?m=video&c=video&a=open','','1','admin','180.173.36.21','2016-02-23 21:55:01');
INSERT INTO `v9_log` VALUES('432','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','180.173.36.21','2016-02-23 21:55:26');
INSERT INTO `v9_log` VALUES('433','','0','member','','member','?m=member&c=member&a=manage','','1','admin','180.173.36.21','2016-02-23 21:55:58');
INSERT INTO `v9_log` VALUES('434','','0','admin','','index','?m=admin&c=index&a=login','','0','','180.173.36.21','2016-02-23 22:34:06');
INSERT INTO `v9_log` VALUES('435','','0','admin','','index','?m=admin&c=index&a=login','','0','','183.228.4.227','2016-02-25 22:55:01');
INSERT INTO `v9_log` VALUES('436','','0','admin','','index','?m=admin&c=index&a=login','','0','','183.228.4.227','2016-02-25 22:55:23');
INSERT INTO `v9_log` VALUES('437','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.4.227','2016-02-25 22:55:51');
INSERT INTO `v9_log` VALUES('438','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.4.227','2016-02-25 22:56:01');
INSERT INTO `v9_log` VALUES('439','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.4.227','2016-02-25 22:57:38');
INSERT INTO `v9_log` VALUES('440','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=listorder','','1','admin','183.228.4.227','2016-02-25 22:57:46');
INSERT INTO `v9_log` VALUES('441','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.4.227','2016-02-25 22:58:03');
INSERT INTO `v9_log` VALUES('442','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.4.227','2016-02-25 22:58:14');
INSERT INTO `v9_log` VALUES('443','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.4.227','2016-02-25 22:58:22');
INSERT INTO `v9_log` VALUES('444','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','admin','183.228.4.227','2016-02-25 22:58:29');
INSERT INTO `v9_log` VALUES('445','','0','content','','sitemodel','?m=content&c=sitemodel&a=add','','1','admin','183.228.4.227','2016-02-25 22:58:51');
INSERT INTO `v9_log` VALUES('446','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.4.227','2016-02-25 22:59:43');
INSERT INTO `v9_log` VALUES('447','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.4.227','2016-02-25 22:59:59');
INSERT INTO `v9_log` VALUES('448','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.4.227','2016-02-25 23:00:04');
INSERT INTO `v9_log` VALUES('449','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.4.227','2016-02-25 23:00:16');
INSERT INTO `v9_log` VALUES('450','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.4.227','2016-02-25 23:00:21');
INSERT INTO `v9_log` VALUES('451','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','admin','183.228.4.227','2016-02-25 23:00:35');
INSERT INTO `v9_log` VALUES('452','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.4.227','2016-02-25 23:01:04');
INSERT INTO `v9_log` VALUES('453','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=listorder','','1','admin','183.228.4.227','2016-02-25 23:01:12');
INSERT INTO `v9_log` VALUES('454','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.4.227','2016-02-25 23:01:24');
INSERT INTO `v9_log` VALUES('455','','0','content','','content','?m=content&c=content&a=delete','','1','admin','183.228.4.227','2016-02-25 23:03:09');
INSERT INTO `v9_log` VALUES('456','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.4.227','2016-02-25 23:03:31');
INSERT INTO `v9_log` VALUES('457','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.4.227','2016-02-25 23:03:34');
INSERT INTO `v9_log` VALUES('458','','0','content','','content','?m=content&c=content&a=add','','1','admin','183.228.4.227','2016-02-25 23:03:44');
INSERT INTO `v9_log` VALUES('459','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=delete','','1','admin','183.228.4.227','2016-02-25 23:04:03');
INSERT INTO `v9_log` VALUES('460','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=delete','','1','admin','183.228.4.227','2016-02-25 23:04:09');
INSERT INTO `v9_log` VALUES('461','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=delete','','1','admin','183.228.4.227','2016-02-25 23:04:14');
INSERT INTO `v9_log` VALUES('462','','0','content','','content','?m=content&c=content&a=add','','1','admin','183.228.4.227','2016-02-25 23:04:23');
INSERT INTO `v9_log` VALUES('463','','0','content','','content','?m=content&c=content&a=add','','1','admin','183.228.4.227','2016-02-25 23:05:53');
INSERT INTO `v9_log` VALUES('464','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.4.227','2016-02-25 23:09:02');
INSERT INTO `v9_log` VALUES('465','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.80.24','2016-02-26 10:43:37');
INSERT INTO `v9_log` VALUES('466','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.80.24','2016-02-26 10:43:46');
INSERT INTO `v9_log` VALUES('467','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.80.24','2016-02-26 10:43:47');
INSERT INTO `v9_log` VALUES('468','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.80.24','2016-02-26 10:43:48');
INSERT INTO `v9_log` VALUES('469','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.80.24','2016-02-26 10:43:58');
INSERT INTO `v9_log` VALUES('470','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.80.24','2016-02-26 11:37:20');
INSERT INTO `v9_log` VALUES('471','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.80.24','2016-02-26 11:37:30');
INSERT INTO `v9_log` VALUES('472','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','admin','123.147.80.24','2016-02-26 11:45:37');
INSERT INTO `v9_log` VALUES('473','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.80.24','2016-02-26 11:45:48');
INSERT INTO `v9_log` VALUES('474','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.80.24','2016-02-26 11:46:14');
INSERT INTO `v9_log` VALUES('475','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.80.24','2016-02-26 15:12:27');
INSERT INTO `v9_log` VALUES('476','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-26 15:25:23');
INSERT INTO `v9_log` VALUES('477','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','','2016-02-26 15:25:30');
INSERT INTO `v9_log` VALUES('478','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','','2016-02-26 15:28:35');
INSERT INTO `v9_log` VALUES('479','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','','2016-02-26 15:28:49');
INSERT INTO `v9_log` VALUES('480','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','','2016-02-26 15:29:25');
INSERT INTO `v9_log` VALUES('481','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','','2016-02-26 15:29:26');
INSERT INTO `v9_log` VALUES('482','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','','2016-02-26 15:29:26');
INSERT INTO `v9_log` VALUES('483','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','','2016-02-26 15:29:26');
INSERT INTO `v9_log` VALUES('484','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:27');
INSERT INTO `v9_log` VALUES('485','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:28');
INSERT INTO `v9_log` VALUES('486','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:28');
INSERT INTO `v9_log` VALUES('487','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:29');
INSERT INTO `v9_log` VALUES('488','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:29');
INSERT INTO `v9_log` VALUES('489','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:29');
INSERT INTO `v9_log` VALUES('490','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:30');
INSERT INTO `v9_log` VALUES('491','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:30');
INSERT INTO `v9_log` VALUES('492','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:30');
INSERT INTO `v9_log` VALUES('493','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:30');
INSERT INTO `v9_log` VALUES('494','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:31');
INSERT INTO `v9_log` VALUES('495','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:31');
INSERT INTO `v9_log` VALUES('496','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:31');
INSERT INTO `v9_log` VALUES('497','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:32');
INSERT INTO `v9_log` VALUES('498','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:32');
INSERT INTO `v9_log` VALUES('499','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:32');
INSERT INTO `v9_log` VALUES('500','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:32');
INSERT INTO `v9_log` VALUES('501','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:33');
INSERT INTO `v9_log` VALUES('502','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','','2016-02-26 15:29:33');
INSERT INTO `v9_log` VALUES('503','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','','2016-02-26 17:17:08');
INSERT INTO `v9_log` VALUES('504','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','','2016-02-26 17:18:06');
INSERT INTO `v9_log` VALUES('505','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','','2016-02-26 17:18:07');
INSERT INTO `v9_log` VALUES('506','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','','2016-02-26 17:19:21');
INSERT INTO `v9_log` VALUES('507','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','','2016-02-26 17:19:26');
INSERT INTO `v9_log` VALUES('508','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.80.24','2016-02-26 18:03:42');
INSERT INTO `v9_log` VALUES('509','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.80.24','2016-02-26 18:03:42');
INSERT INTO `v9_log` VALUES('510','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.80.24','2016-02-26 18:03:48');
INSERT INTO `v9_log` VALUES('511','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.5.208','2016-02-29 23:08:41');
INSERT INTO `v9_log` VALUES('512','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.5.208','2016-02-29 23:08:41');
INSERT INTO `v9_log` VALUES('513','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.5.208','2016-02-29 23:08:49');
INSERT INTO `v9_log` VALUES('514','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.5.208','2016-02-29 23:11:40');
INSERT INTO `v9_log` VALUES('515','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.5.208','2016-02-29 23:11:48');
INSERT INTO `v9_log` VALUES('516','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.5.208','2016-02-29 23:11:54');
INSERT INTO `v9_log` VALUES('517','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.5.208','2016-02-29 23:12:00');
INSERT INTO `v9_log` VALUES('518','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.5.208','2016-02-29 23:12:11');
INSERT INTO `v9_log` VALUES('519','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','183.228.5.208','2016-02-29 23:12:17');
INSERT INTO `v9_log` VALUES('520','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','183.228.5.208','2016-02-29 23:12:40');
INSERT INTO `v9_log` VALUES('521','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','183.228.5.208','2016-02-29 23:12:45');
INSERT INTO `v9_log` VALUES('522','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','183.228.5.208','2016-02-29 23:13:16');
INSERT INTO `v9_log` VALUES('523','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','183.228.5.208','2016-02-29 23:13:26');
INSERT INTO `v9_log` VALUES('524','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.82.42','2016-03-03 10:06:41');
INSERT INTO `v9_log` VALUES('525','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.82.42','2016-03-03 10:06:54');
INSERT INTO `v9_log` VALUES('526','','0','content','','content','?m=content&c=content&a=add','','1','admin','123.147.82.42','2016-03-03 10:07:47');
INSERT INTO `v9_log` VALUES('527','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','123.147.82.42','2016-03-03 10:08:17');
INSERT INTO `v9_log` VALUES('528','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.7.134','2016-03-03 22:33:29');
INSERT INTO `v9_log` VALUES('529','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.7.134','2016-03-03 22:33:35');
INSERT INTO `v9_log` VALUES('530','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.7.134','2016-03-03 22:34:05');
INSERT INTO `v9_log` VALUES('531','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.7.134','2016-03-03 22:34:30');
INSERT INTO `v9_log` VALUES('532','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.7.134','2016-03-03 22:34:39');
INSERT INTO `v9_log` VALUES('533','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.7.134','2016-03-03 22:34:47');
INSERT INTO `v9_log` VALUES('534','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.7.134','2016-03-03 22:34:57');
INSERT INTO `v9_log` VALUES('535','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.7.134','2016-03-03 22:35:03');
INSERT INTO `v9_log` VALUES('536','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.7.134','2016-03-03 22:40:39');
INSERT INTO `v9_log` VALUES('537','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.7.134','2016-03-03 22:40:48');
INSERT INTO `v9_log` VALUES('538','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.7.134','2016-03-03 22:40:54');
INSERT INTO `v9_log` VALUES('539','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.7.134','2016-03-03 22:41:10');
INSERT INTO `v9_log` VALUES('540','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.7.134','2016-03-03 22:41:12');
INSERT INTO `v9_log` VALUES('541','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.7.134','2016-03-03 22:41:38');
INSERT INTO `v9_log` VALUES('542','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.82.42','2016-03-04 17:11:17');
INSERT INTO `v9_log` VALUES('543','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.82.42','2016-03-04 17:11:17');
INSERT INTO `v9_log` VALUES('544','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.82.42','2016-03-04 17:11:25');
INSERT INTO `v9_log` VALUES('545','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','123.147.82.42','2016-03-04 17:11:32');
INSERT INTO `v9_log` VALUES('546','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','123.147.82.42','2016-03-04 17:11:33');
INSERT INTO `v9_log` VALUES('547','','0','member','','member_group','?m=member&c=member_group&a=manage','','1','admin','123.147.82.42','2016-03-04 17:11:36');
INSERT INTO `v9_log` VALUES('548','','0','member','','member_model','?m=member&c=member_model&a=manage','','1','admin','123.147.82.42','2016-03-04 17:11:37');
INSERT INTO `v9_log` VALUES('549','','0','member','','member_model','?m=member&c=member_model&a=edit','','1','admin','123.147.82.42','2016-03-04 17:11:39');
INSERT INTO `v9_log` VALUES('550','','0','member','','member_modelfield','?m=member&c=member_modelfield&a=manage','','1','admin','123.147.82.42','2016-03-04 17:11:42');
INSERT INTO `v9_log` VALUES('551','','0','member','','member_model','?m=member&c=member_model&a=manage','','1','admin','123.147.82.42','2016-03-04 17:11:44');
INSERT INTO `v9_log` VALUES('552','','0','member','','member_group','?m=member&c=member_group&a=manage','','1','admin','123.147.82.42','2016-03-04 17:11:46');
INSERT INTO `v9_log` VALUES('553','','0','member','','member_group','?m=member&c=member_group&a=edit','','1','admin','123.147.82.42','2016-03-04 17:11:50');
INSERT INTO `v9_log` VALUES('554','','0','member','','member_group','?m=member&c=member_group&a=add','','1','admin','123.147.82.42','2016-03-04 17:11:55');
INSERT INTO `v9_log` VALUES('555','','0','member','','member','?m=member&c=member&a=manage','','1','admin','123.147.82.42','2016-03-04 17:12:05');
INSERT INTO `v9_log` VALUES('556','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','123.147.82.42','2016-03-04 17:12:06');
INSERT INTO `v9_log` VALUES('557','','0','admin','','admin_manage','?m=admin&c=admin_manage&a=edit','','1','admin','123.147.82.42','2016-03-04 17:12:21');
INSERT INTO `v9_log` VALUES('558','','0','admin','','admin_manage','?m=admin&c=admin_manage&a=card','','1','admin','123.147.82.42','2016-03-04 17:12:23');
INSERT INTO `v9_log` VALUES('559','','0','admin','','role','?m=admin&c=role&a=priv_setting','','1','admin','123.147.82.42','2016-03-04 17:12:30');
INSERT INTO `v9_log` VALUES('560','','0','admin','','role','?m=admin&c=role&a=role_priv','','1','admin','123.147.82.42','2016-03-04 17:12:30');
INSERT INTO `v9_log` VALUES('561','','0','admin','','role','?m=admin&c=role&a=role_priv','','1','admin','123.147.82.42','2016-03-04 17:12:31');
INSERT INTO `v9_log` VALUES('562','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.87.166','2016-03-08 15:53:44');
INSERT INTO `v9_log` VALUES('563','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.87.166','2016-03-08 15:53:44');
INSERT INTO `v9_log` VALUES('564','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.87.166','2016-03-08 15:53:52');
INSERT INTO `v9_log` VALUES('565','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.87.166','2016-03-08 16:21:35');
INSERT INTO `v9_log` VALUES('566','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.36','2016-03-09 10:48:47');
INSERT INTO `v9_log` VALUES('567','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.36','2016-03-09 10:48:47');
INSERT INTO `v9_log` VALUES('568','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.36','2016-03-09 10:48:53');
INSERT INTO `v9_log` VALUES('569','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','123.147.77.36','2016-03-09 10:49:02');
INSERT INTO `v9_log` VALUES('570','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','123.147.77.36','2016-03-09 10:49:05');
INSERT INTO `v9_log` VALUES('571','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','123.147.77.36','2016-03-09 10:49:06');
INSERT INTO `v9_log` VALUES('572','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','123.147.77.36','2016-03-09 10:49:06');
INSERT INTO `v9_log` VALUES('573','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:08');
INSERT INTO `v9_log` VALUES('574','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:09');
INSERT INTO `v9_log` VALUES('575','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:09');
INSERT INTO `v9_log` VALUES('576','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:10');
INSERT INTO `v9_log` VALUES('577','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:10');
INSERT INTO `v9_log` VALUES('578','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:11');
INSERT INTO `v9_log` VALUES('579','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:11');
INSERT INTO `v9_log` VALUES('580','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:13');
INSERT INTO `v9_log` VALUES('581','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:15');
INSERT INTO `v9_log` VALUES('582','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:17');
INSERT INTO `v9_log` VALUES('583','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:18');
INSERT INTO `v9_log` VALUES('584','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:19');
INSERT INTO `v9_log` VALUES('585','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:21');
INSERT INTO `v9_log` VALUES('586','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:22');
INSERT INTO `v9_log` VALUES('587','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:22');
INSERT INTO `v9_log` VALUES('588','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:23');
INSERT INTO `v9_log` VALUES('589','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:23');
INSERT INTO `v9_log` VALUES('590','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:24');
INSERT INTO `v9_log` VALUES('591','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:24');
INSERT INTO `v9_log` VALUES('592','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:27');
INSERT INTO `v9_log` VALUES('593','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.77.36','2016-03-09 10:49:27');
INSERT INTO `v9_log` VALUES('594','','0','content','','content','?m=content&c=content&a=add','','1','admin','123.147.77.36','2016-03-09 10:56:01');
INSERT INTO `v9_log` VALUES('595','','0','content','','content','?m=content&c=content&a=add','','1','admin','123.147.77.36','2016-03-09 10:56:24');
INSERT INTO `v9_log` VALUES('596','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.36','2016-03-09 10:56:32');
INSERT INTO `v9_log` VALUES('597','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.36','2016-03-09 10:57:00');
INSERT INTO `v9_log` VALUES('598','','0','content','','content','?m=content&c=content&a=add','','1','admin','123.147.77.36','2016-03-09 10:57:18');
INSERT INTO `v9_log` VALUES('599','','0','content','','content','?m=content&c=content&a=add','','1','admin','123.147.77.36','2016-03-09 10:57:41');
INSERT INTO `v9_log` VALUES('600','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:02:37');
INSERT INTO `v9_log` VALUES('601','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:06:32');
INSERT INTO `v9_log` VALUES('602','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:06:47');
INSERT INTO `v9_log` VALUES('603','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:06:52');
INSERT INTO `v9_log` VALUES('604','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:06:57');
INSERT INTO `v9_log` VALUES('605','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:07:04');
INSERT INTO `v9_log` VALUES('606','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:07:16');
INSERT INTO `v9_log` VALUES('607','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:07:22');
INSERT INTO `v9_log` VALUES('608','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:07:29');
INSERT INTO `v9_log` VALUES('609','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:09:55');
INSERT INTO `v9_log` VALUES('610','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:10:01');
INSERT INTO `v9_log` VALUES('611','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:10:07');
INSERT INTO `v9_log` VALUES('612','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:10:15');
INSERT INTO `v9_log` VALUES('613','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','123.147.77.36','2016-03-09 11:18:00');
INSERT INTO `v9_log` VALUES('614','','0','template','','file','?m=template&c=file&a=updatefilename','','1','admin','123.147.77.36','2016-03-09 11:19:11');
INSERT INTO `v9_log` VALUES('615','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:19:20');
INSERT INTO `v9_log` VALUES('616','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:47:30');
INSERT INTO `v9_log` VALUES('617','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:47:37');
INSERT INTO `v9_log` VALUES('618','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','123.147.77.36','2016-03-09 11:47:58');
INSERT INTO `v9_log` VALUES('619','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','123.147.77.36','2016-03-09 11:48:05');
INSERT INTO `v9_log` VALUES('620','','0','admin','','index','?m=admin&c=index&a=login','','0','','123.147.77.36','2016-03-09 11:48:52');
INSERT INTO `v9_log` VALUES('621','','0','admin','','index','?m=admin&c=index&a=login','','0','','123.147.77.36','2016-03-09 11:48:59');
INSERT INTO `v9_log` VALUES('622','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 11:49:32');
INSERT INTO `v9_log` VALUES('623','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','admin','123.147.77.36','2016-03-09 11:52:12');
INSERT INTO `v9_log` VALUES('624','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.36','2016-03-09 11:52:27');
INSERT INTO `v9_log` VALUES('625','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 12:02:14');
INSERT INTO `v9_log` VALUES('626','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.36','2016-03-09 12:02:20');
INSERT INTO `v9_log` VALUES('627','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.36','2016-03-09 15:44:17');
INSERT INTO `v9_log` VALUES('628','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.36','2016-03-09 15:44:17');
INSERT INTO `v9_log` VALUES('629','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.36','2016-03-09 15:44:24');
INSERT INTO `v9_log` VALUES('630','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.2.9','2016-03-13 20:40:08');
INSERT INTO `v9_log` VALUES('631','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.2.9','2016-03-13 20:40:08');
INSERT INTO `v9_log` VALUES('632','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.2.9','2016-03-13 20:40:24');
INSERT INTO `v9_log` VALUES('633','','0','content','','content','?m=content&c=content&a=add','','1','admin','183.228.2.9','2016-03-13 21:23:14');
INSERT INTO `v9_log` VALUES('634','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.2.9','2016-03-13 21:23:32');
INSERT INTO `v9_log` VALUES('635','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.2.9','2016-03-13 21:25:18');
INSERT INTO `v9_log` VALUES('636','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=listorder','','1','admin','183.228.2.9','2016-03-13 21:25:25');
INSERT INTO `v9_log` VALUES('637','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 21:27:25');
INSERT INTO `v9_log` VALUES('638','','0','admin','','index','?m=admin&c=index&a=login','','0','','183.228.2.9','2016-03-13 21:27:58');
INSERT INTO `v9_log` VALUES('639','','0','admin','','index','?m=admin&c=index&a=login','','0','','183.228.2.9','2016-03-13 21:28:15');
INSERT INTO `v9_log` VALUES('640','','0','admin','','index','?m=admin&c=index&a=login','','1','','183.228.2.9','2016-03-13 21:28:18');
INSERT INTO `v9_log` VALUES('641','','0','admin','','index','?m=admin&c=index&a=login','','1','','183.228.2.9','2016-03-13 21:28:25');
INSERT INTO `v9_log` VALUES('642','','0','admin','','index','?m=admin&c=index&a=login','','1','','183.228.2.9','2016-03-13 21:28:37');
INSERT INTO `v9_log` VALUES('643','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 21:29:27');
INSERT INTO `v9_log` VALUES('644','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 21:30:00');
INSERT INTO `v9_log` VALUES('645','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','admin','183.228.2.9','2016-03-13 21:35:01');
INSERT INTO `v9_log` VALUES('646','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=delete','','1','admin','183.228.2.9','2016-03-13 21:35:23');
INSERT INTO `v9_log` VALUES('647','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.2.9','2016-03-13 21:35:25');
INSERT INTO `v9_log` VALUES('648','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.2.9','2016-03-13 21:36:09');
INSERT INTO `v9_log` VALUES('649','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 21:36:17');
INSERT INTO `v9_log` VALUES('650','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 21:36:27');
INSERT INTO `v9_log` VALUES('651','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.2.9','2016-03-13 21:37:39');
INSERT INTO `v9_log` VALUES('652','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=delete','','1','admin','183.228.2.9','2016-03-13 21:40:16');
INSERT INTO `v9_log` VALUES('653','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.2.9','2016-03-13 21:40:20');
INSERT INTO `v9_log` VALUES('654','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.2.9','2016-03-13 21:40:50');
INSERT INTO `v9_log` VALUES('655','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=listorder','','1','admin','183.228.2.9','2016-03-13 21:40:55');
INSERT INTO `v9_log` VALUES('656','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 21:41:01');
INSERT INTO `v9_log` VALUES('657','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 21:41:27');
INSERT INTO `v9_log` VALUES('658','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 21:41:35');
INSERT INTO `v9_log` VALUES('659','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','admin','183.228.2.9','2016-03-13 21:44:17');
INSERT INTO `v9_log` VALUES('660','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','admin','183.228.2.9','2016-03-13 21:44:41');
INSERT INTO `v9_log` VALUES('661','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 22:07:19');
INSERT INTO `v9_log` VALUES('662','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 22:07:40');
INSERT INTO `v9_log` VALUES('663','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 22:08:14');
INSERT INTO `v9_log` VALUES('664','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 22:09:38');
INSERT INTO `v9_log` VALUES('665','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 22:09:50');
INSERT INTO `v9_log` VALUES('666','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 22:10:13');
INSERT INTO `v9_log` VALUES('667','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 22:10:16');
INSERT INTO `v9_log` VALUES('668','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 22:10:20');
INSERT INTO `v9_log` VALUES('669','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 22:10:26');
INSERT INTO `v9_log` VALUES('670','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 22:15:22');
INSERT INTO `v9_log` VALUES('671','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 22:15:58');
INSERT INTO `v9_log` VALUES('672','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 22:16:04');
INSERT INTO `v9_log` VALUES('673','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.2.9','2016-03-13 22:16:12');
INSERT INTO `v9_log` VALUES('674','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.82.218','2016-03-15 10:31:08');
INSERT INTO `v9_log` VALUES('675','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.82.218','2016-03-15 10:31:21');
INSERT INTO `v9_log` VALUES('676','','0','admin','','index','?m=admin&c=index&a=login','','0','','220.181.132.196','2016-03-15 10:33:01');
INSERT INTO `v9_log` VALUES('677','','0','admin','','index','?m=admin&c=index&a=login','','0','','220.181.132.218','2016-03-15 10:33:10');
INSERT INTO `v9_log` VALUES('678','','0','admin','','index','?m=admin&c=index&a=login','','0','','220.181.132.218','2016-03-15 10:33:13');
INSERT INTO `v9_log` VALUES('679','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.199.108.59','2016-03-15 10:33:20');
INSERT INTO `v9_log` VALUES('680','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.199.112.45','2016-03-15 10:33:28');
INSERT INTO `v9_log` VALUES('681','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.199.112.45','2016-03-15 10:33:40');
INSERT INTO `v9_log` VALUES('682','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.218','2016-03-15 10:36:55');
INSERT INTO `v9_log` VALUES('683','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.218','2016-03-15 10:38:08');
INSERT INTO `v9_log` VALUES('684','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.199.112.55','2016-03-15 10:38:12');
INSERT INTO `v9_log` VALUES('685','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.218','2016-03-15 10:39:19');
INSERT INTO `v9_log` VALUES('686','','0','admin','','index','?m=admin&c=index&a=login','','0','','220.181.132.197','2016-03-15 10:40:13');
INSERT INTO `v9_log` VALUES('687','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.218','2016-03-15 10:40:43');
INSERT INTO `v9_log` VALUES('688','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.218','2016-03-15 10:46:31');
INSERT INTO `v9_log` VALUES('689','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.218','2016-03-15 10:47:08');
INSERT INTO `v9_log` VALUES('690','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.218','2016-03-15 10:51:53');
INSERT INTO `v9_log` VALUES('691','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.218','2016-03-15 10:52:42');
INSERT INTO `v9_log` VALUES('692','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.218','2016-03-15 10:54:17');
INSERT INTO `v9_log` VALUES('693','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.218','2016-03-15 10:55:01');
INSERT INTO `v9_log` VALUES('694','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.218','2016-03-15 10:57:34');
INSERT INTO `v9_log` VALUES('695','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.218','2016-03-15 10:58:36');
INSERT INTO `v9_log` VALUES('696','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.218','2016-03-15 10:59:26');
INSERT INTO `v9_log` VALUES('697','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.218','2016-03-15 10:59:43');
INSERT INTO `v9_log` VALUES('698','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.218','2016-03-15 11:02:14');
INSERT INTO `v9_log` VALUES('699','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.218','2016-03-15 11:28:04');
INSERT INTO `v9_log` VALUES('700','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.218','2016-03-15 11:28:54');
INSERT INTO `v9_log` VALUES('701','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.218','2016-03-15 11:30:43');
INSERT INTO `v9_log` VALUES('702','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.218','2016-03-15 11:30:57');
INSERT INTO `v9_log` VALUES('703','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.218','2016-03-15 11:31:36');
INSERT INTO `v9_log` VALUES('704','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.218','2016-03-15 11:33:11');
INSERT INTO `v9_log` VALUES('705','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.82.218','2016-03-15 11:44:08');
INSERT INTO `v9_log` VALUES('706','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.82.218','2016-03-15 11:45:37');
INSERT INTO `v9_log` VALUES('707','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.82.218','2016-03-15 11:45:39');
INSERT INTO `v9_log` VALUES('708','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.82.218','2016-03-15 11:45:50');
INSERT INTO `v9_log` VALUES('709','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.1.99','2016-03-15 22:05:39');
INSERT INTO `v9_log` VALUES('710','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.1.99','2016-03-15 22:05:39');
INSERT INTO `v9_log` VALUES('711','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.1.99','2016-03-15 22:05:46');
INSERT INTO `v9_log` VALUES('712','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.1.99','2016-03-15 22:06:02');
INSERT INTO `v9_log` VALUES('713','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','183.228.1.99','2016-03-15 22:07:54');
INSERT INTO `v9_log` VALUES('714','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=listorder','','1','admin','183.228.1.99','2016-03-15 22:08:00');
INSERT INTO `v9_log` VALUES('715','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.1.99','2016-03-15 22:08:07');
INSERT INTO `v9_log` VALUES('716','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','admin','183.228.1.99','2016-03-15 22:09:03');
INSERT INTO `v9_log` VALUES('717','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.1.99','2016-03-15 22:20:26');
INSERT INTO `v9_log` VALUES('718','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.1.99','2016-03-15 22:20:28');
INSERT INTO `v9_log` VALUES('719','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.1.99','2016-03-15 22:20:29');
INSERT INTO `v9_log` VALUES('720','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.1.99','2016-03-15 22:20:31');
INSERT INTO `v9_log` VALUES('721','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.1.99','2016-03-15 22:20:47');
INSERT INTO `v9_log` VALUES('722','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.1.99','2016-03-15 22:20:49');
INSERT INTO `v9_log` VALUES('723','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.1.99','2016-03-15 22:20:51');
INSERT INTO `v9_log` VALUES('724','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.1.99','2016-03-15 22:21:19');
INSERT INTO `v9_log` VALUES('725','','0','content','','content','?m=content&c=content&a=add','','1','admin','183.228.1.99','2016-03-15 22:23:50');
INSERT INTO `v9_log` VALUES('726','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.1.99','2016-03-15 22:23:57');
INSERT INTO `v9_log` VALUES('727','','0','content','','content','?m=content&c=content&a=add','','1','admin','183.228.1.99','2016-03-15 22:32:22');
INSERT INTO `v9_log` VALUES('728','','0','admin','','index','?m=admin&c=index&a=login','','0','','123.147.83.189','2016-03-16 09:09:21');
INSERT INTO `v9_log` VALUES('729','','0','admin','','index','?m=admin&c=index&a=login','','0','','123.147.83.189','2016-03-16 09:09:31');
INSERT INTO `v9_log` VALUES('730','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','123.147.83.189','2016-03-16 09:09:49');
INSERT INTO `v9_log` VALUES('731','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','123.147.83.189','2016-03-16 09:10:15');
INSERT INTO `v9_log` VALUES('732','','0','admin','','category','?m=admin&c=category&a=listorder','','1','admin','123.147.83.189','2016-03-16 09:10:26');
INSERT INTO `v9_log` VALUES('733','','0','admin','','category','?m=admin&c=category&a=listorder','','1','admin','123.147.83.189','2016-03-16 09:10:36');
INSERT INTO `v9_log` VALUES('734','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.83.189','2016-03-16 10:00:27');
INSERT INTO `v9_log` VALUES('735','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.83.189','2016-03-16 10:00:33');
INSERT INTO `v9_log` VALUES('736','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.82.63','2016-03-16 15:24:24');
INSERT INTO `v9_log` VALUES('737','','0','admin','','index','?m=admin&c=index&a=login','','0','','220.181.132.218','2016-03-16 15:25:48');
INSERT INTO `v9_log` VALUES('738','','0','admin','','index','?m=admin&c=index&a=login','','0','','220.181.132.197','2016-03-16 15:26:03');
INSERT INTO `v9_log` VALUES('739','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.199.108.56','2016-03-16 15:26:57');
INSERT INTO `v9_log` VALUES('740','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.82.63','2016-03-16 15:26:59');
INSERT INTO `v9_log` VALUES('741','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 15:27:48');
INSERT INTO `v9_log` VALUES('742','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 15:28:36');
INSERT INTO `v9_log` VALUES('743','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 15:30:15');
INSERT INTO `v9_log` VALUES('744','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 15:30:53');
INSERT INTO `v9_log` VALUES('745','','0','content','','content','?m=content&c=content&a=delete','','1','admin','125.84.82.63','2016-03-16 15:34:24');
INSERT INTO `v9_log` VALUES('746','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 15:34:30');
INSERT INTO `v9_log` VALUES('747','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 15:38:52');
INSERT INTO `v9_log` VALUES('748','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 15:38:54');
INSERT INTO `v9_log` VALUES('749','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 15:39:42');
INSERT INTO `v9_log` VALUES('750','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 15:39:51');
INSERT INTO `v9_log` VALUES('751','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 15:40:22');
INSERT INTO `v9_log` VALUES('752','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 15:40:42');
INSERT INTO `v9_log` VALUES('753','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 15:44:51');
INSERT INTO `v9_log` VALUES('754','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 15:45:23');
INSERT INTO `v9_log` VALUES('755','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 15:45:28');
INSERT INTO `v9_log` VALUES('756','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 15:45:33');
INSERT INTO `v9_log` VALUES('757','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 15:45:35');
INSERT INTO `v9_log` VALUES('758','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 15:45:39');
INSERT INTO `v9_log` VALUES('759','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 15:45:41');
INSERT INTO `v9_log` VALUES('760','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 15:45:48');
INSERT INTO `v9_log` VALUES('761','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 15:45:50');
INSERT INTO `v9_log` VALUES('762','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 15:48:27');
INSERT INTO `v9_log` VALUES('763','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 15:49:34');
INSERT INTO `v9_log` VALUES('764','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 15:53:23');
INSERT INTO `v9_log` VALUES('765','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 15:54:06');
INSERT INTO `v9_log` VALUES('766','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 15:55:55');
INSERT INTO `v9_log` VALUES('767','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 15:56:37');
INSERT INTO `v9_log` VALUES('768','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 16:01:03');
INSERT INTO `v9_log` VALUES('769','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 16:01:27');
INSERT INTO `v9_log` VALUES('770','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 16:01:47');
INSERT INTO `v9_log` VALUES('771','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 16:03:14');
INSERT INTO `v9_log` VALUES('772','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 16:03:15');
INSERT INTO `v9_log` VALUES('773','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 16:03:45');
INSERT INTO `v9_log` VALUES('774','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 16:04:27');
INSERT INTO `v9_log` VALUES('775','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 16:04:34');
INSERT INTO `v9_log` VALUES('776','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.63','2016-03-16 16:05:52');
INSERT INTO `v9_log` VALUES('777','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 16:46:11');
INSERT INTO `v9_log` VALUES('778','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 16:47:17');
INSERT INTO `v9_log` VALUES('779','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 16:52:01');
INSERT INTO `v9_log` VALUES('780','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 16:52:52');
INSERT INTO `v9_log` VALUES('781','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 16:53:49');
INSERT INTO `v9_log` VALUES('782','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 16:54:17');
INSERT INTO `v9_log` VALUES('783','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 16:54:25');
INSERT INTO `v9_log` VALUES('784','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 17:01:37');
INSERT INTO `v9_log` VALUES('785','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 17:01:52');
INSERT INTO `v9_log` VALUES('786','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 17:01:52');
INSERT INTO `v9_log` VALUES('787','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.82.63','2016-03-16 17:01:53');
INSERT INTO `v9_log` VALUES('788','','0','admin','','index','?m=admin&c=index&a=login','','0','','123.147.83.189','2016-03-17 14:19:05');
INSERT INTO `v9_log` VALUES('789','','0','admin','','index','?m=admin&c=index&a=login','','0','','123.147.83.189','2016-03-17 14:19:13');
INSERT INTO `v9_log` VALUES('790','','0','attachment','','address','?m=attachment&c=address&a=update','','1','admin','123.147.83.189','2016-03-17 14:20:31');
INSERT INTO `v9_log` VALUES('791','','0','attachment','','address','?m=attachment&c=address&a=update','','1','admin','123.147.83.189','2016-03-17 14:20:38');
INSERT INTO `v9_log` VALUES('792','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','123.147.83.189','2016-03-17 14:21:01');
INSERT INTO `v9_log` VALUES('793','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.83.189','2016-03-17 14:21:51');
INSERT INTO `v9_log` VALUES('794','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.83.189','2016-03-17 14:22:09');
INSERT INTO `v9_log` VALUES('795','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.83.189','2016-03-17 14:22:15');
INSERT INTO `v9_log` VALUES('796','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.83.189','2016-03-17 14:23:42');
INSERT INTO `v9_log` VALUES('797','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.83.189','2016-03-17 14:23:46');
INSERT INTO `v9_log` VALUES('798','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.83.189','2016-03-17 14:25:18');
INSERT INTO `v9_log` VALUES('799','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.83.189','2016-03-17 14:25:47');
INSERT INTO `v9_log` VALUES('800','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','123.147.83.189','2016-03-17 14:25:57');
INSERT INTO `v9_log` VALUES('801','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','123.147.83.189','2016-03-17 14:26:01');
INSERT INTO `v9_log` VALUES('802','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.83.189','2016-03-17 16:25:04');
INSERT INTO `v9_log` VALUES('803','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.83.189','2016-03-17 16:25:04');
INSERT INTO `v9_log` VALUES('804','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.83.189','2016-03-17 16:25:11');
INSERT INTO `v9_log` VALUES('805','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.83.189','2016-03-17 16:25:24');
INSERT INTO `v9_log` VALUES('806','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','123.147.83.189','2016-03-17 16:27:03');
INSERT INTO `v9_log` VALUES('807','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','123.147.83.189','2016-03-17 16:27:04');
INSERT INTO `v9_log` VALUES('808','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','123.147.83.189','2016-03-17 16:27:05');
INSERT INTO `v9_log` VALUES('809','','0','content','','content','?m=content&c=content&a=clear_data','','1','admin','123.147.83.189','2016-03-17 16:27:06');
INSERT INTO `v9_log` VALUES('810','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','123.147.83.189','2016-03-17 16:27:07');
INSERT INTO `v9_log` VALUES('811','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.4.7','2016-03-19 18:32:09');
INSERT INTO `v9_log` VALUES('812','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.4.7','2016-03-19 18:32:15');
INSERT INTO `v9_log` VALUES('813','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','183.228.4.7','2016-03-19 18:39:50');
INSERT INTO `v9_log` VALUES('814','','0','member','','member','?m=member&c=member&a=manage','','1','admin','183.228.4.7','2016-03-19 18:39:54');
INSERT INTO `v9_log` VALUES('815','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','183.228.4.7','2016-03-19 19:26:15');
INSERT INTO `v9_log` VALUES('816','','0','attachment','','address','?m=attachment&c=address&a=update','','1','admin','183.228.4.7','2016-03-19 19:27:51');
INSERT INTO `v9_log` VALUES('817','','0','attachment','','address','?m=attachment&c=address&a=update','','1','admin','183.228.4.7','2016-03-19 20:18:08');
INSERT INTO `v9_log` VALUES('818','','0','attachment','','address','?m=attachment&c=address&a=update','','1','admin','183.228.4.7','2016-03-19 20:19:01');
INSERT INTO `v9_log` VALUES('819','','0','attachment','','address','?m=attachment&c=address&a=update','','1','admin','183.228.4.7','2016-03-19 20:19:04');
INSERT INTO `v9_log` VALUES('820','','0','attachment','','address','?m=attachment&c=address&a=update','','1','admin','183.228.4.7','2016-03-19 20:19:06');
INSERT INTO `v9_log` VALUES('821','','0','attachment','','address','?m=attachment&c=address&a=update','','1','admin','183.228.4.7','2016-03-19 20:20:07');
INSERT INTO `v9_log` VALUES('822','','0','attachment','','address','?m=attachment&c=address&a=update','','1','admin','183.228.4.7','2016-03-19 20:20:15');
INSERT INTO `v9_log` VALUES('823','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.4.7','2016-03-20 12:33:33');
INSERT INTO `v9_log` VALUES('824','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.4.7','2016-03-20 12:33:40');
INSERT INTO `v9_log` VALUES('825','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.4.7','2016-03-20 12:33:41');
INSERT INTO `v9_log` VALUES('826','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.4.7','2016-03-20 12:34:08');
INSERT INTO `v9_log` VALUES('827','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.4.7','2016-03-20 12:34:14');
INSERT INTO `v9_log` VALUES('828','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.4.7','2016-03-20 14:20:54');
INSERT INTO `v9_log` VALUES('829','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.4.7','2016-03-20 14:20:58');
INSERT INTO `v9_log` VALUES('830','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','183.228.4.7','2016-03-20 14:21:23');
INSERT INTO `v9_log` VALUES('831','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','183.228.4.7','2016-03-20 14:21:35');
INSERT INTO `v9_log` VALUES('832','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.4.7','2016-03-20 14:35:14');
INSERT INTO `v9_log` VALUES('833','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.4.7','2016-03-20 14:35:14');
INSERT INTO `v9_log` VALUES('834','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','183.228.4.7','2016-03-20 14:35:27');
INSERT INTO `v9_log` VALUES('835','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','183.228.4.7','2016-03-20 14:35:39');
INSERT INTO `v9_log` VALUES('836','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.4.7','2016-03-20 14:37:11');
INSERT INTO `v9_log` VALUES('837','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.4.7','2016-03-20 14:37:20');
INSERT INTO `v9_log` VALUES('838','','0','content','','content','?m=content&c=content&a=edit','','1','admin','183.228.4.7','2016-03-20 14:37:20');
INSERT INTO `v9_log` VALUES('839','','0','admin','','index','?m=admin&c=index&a=login','','0','','125.86.110.191','2016-03-20 17:41:44');
INSERT INTO `v9_log` VALUES('840','','0','admin','','index','?m=admin&c=index&a=login','','0','','220.181.132.218','2016-03-20 17:42:51');
INSERT INTO `v9_log` VALUES('841','','0','admin','','index','?m=admin&c=index&a=login','','0','','125.86.110.191','2016-03-20 17:43:01');
INSERT INTO `v9_log` VALUES('842','','0','admin','','index','?m=admin&c=index&a=login','','0','','125.86.110.191','2016-03-20 17:43:04');
INSERT INTO `v9_log` VALUES('843','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.199.108.57','2016-03-20 17:43:06');
INSERT INTO `v9_log` VALUES('844','','0','admin','','index','?m=admin&c=index&a=login','','0','','125.86.110.191','2016-03-20 17:44:00');
INSERT INTO `v9_log` VALUES('845','','0','admin','','index','?m=admin&c=index&a=login','','0','','125.86.110.191','2016-03-20 17:44:02');
INSERT INTO `v9_log` VALUES('846','','0','admin','','index','?m=admin&c=index&a=login','','0','','125.86.110.191','2016-03-20 17:44:36');
INSERT INTO `v9_log` VALUES('847','','0','admin','','index','?m=admin&c=index&a=login','','0','','125.86.110.191','2016-03-20 17:44:37');
INSERT INTO `v9_log` VALUES('848','','0','admin','','index','?m=admin&c=index&a=login','','0','','125.86.110.191','2016-03-20 17:44:52');
INSERT INTO `v9_log` VALUES('849','','0','admin','','index','?m=admin&c=index&a=login','','0','','220.181.132.218','2016-03-20 17:45:12');
INSERT INTO `v9_log` VALUES('850','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.86.110.191','2016-03-20 17:45:20');
INSERT INTO `v9_log` VALUES('851','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.199.108.59','2016-03-20 17:45:29');
INSERT INTO `v9_log` VALUES('852','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.86.110.191','2016-03-20 17:45:46');
INSERT INTO `v9_log` VALUES('853','','0','admin','','index','?m=admin&c=index&a=login','','0','','220.181.132.199','2016-03-20 17:46:32');
INSERT INTO `v9_log` VALUES('854','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.84.234','2016-03-21 11:02:04');
INSERT INTO `v9_log` VALUES('855','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.84.234','2016-03-21 11:03:11');
INSERT INTO `v9_log` VALUES('856','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','125.84.84.234','2016-03-21 11:03:33');
INSERT INTO `v9_log` VALUES('857','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','125.84.84.234','2016-03-21 11:03:56');
INSERT INTO `v9_log` VALUES('858','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-21 11:05:27');
INSERT INTO `v9_log` VALUES('859','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-21 11:07:02');
INSERT INTO `v9_log` VALUES('860','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-21 11:09:28');
INSERT INTO `v9_log` VALUES('861','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-21 11:10:37');
INSERT INTO `v9_log` VALUES('862','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.84.234','2016-03-21 11:10:45');
INSERT INTO `v9_log` VALUES('863','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-21 11:14:17');
INSERT INTO `v9_log` VALUES('864','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-21 11:15:42');
INSERT INTO `v9_log` VALUES('865','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.79.1','2016-03-21 11:18:09');
INSERT INTO `v9_log` VALUES('866','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.79.1','2016-03-21 11:18:09');
INSERT INTO `v9_log` VALUES('867','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.79.1','2016-03-21 11:18:17');
INSERT INTO `v9_log` VALUES('868','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.79.1','2016-03-21 15:51:12');
INSERT INTO `v9_log` VALUES('869','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.79.1','2016-03-21 15:51:13');
INSERT INTO `v9_log` VALUES('870','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.79.1','2016-03-21 15:51:17');
INSERT INTO `v9_log` VALUES('871','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.79.1','2016-03-21 15:51:18');
INSERT INTO `v9_log` VALUES('872','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.79.1','2016-03-21 15:51:25');
INSERT INTO `v9_log` VALUES('873','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.79.1','2016-03-21 15:51:27');
INSERT INTO `v9_log` VALUES('874','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.79.1','2016-03-21 15:51:27');
INSERT INTO `v9_log` VALUES('875','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.79.1','2016-03-21 15:51:27');
INSERT INTO `v9_log` VALUES('876','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.79.1','2016-03-21 15:51:37');
INSERT INTO `v9_log` VALUES('877','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','123.147.79.1','2016-03-21 15:51:47');
INSERT INTO `v9_log` VALUES('878','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','123.147.79.1','2016-03-21 15:51:54');
INSERT INTO `v9_log` VALUES('879','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','123.147.79.1','2016-03-21 15:52:17');
INSERT INTO `v9_log` VALUES('880','','0','admin','','menu','?m=admin&c=menu&a=add','','1','admin','123.147.79.1','2016-03-21 15:52:19');
INSERT INTO `v9_log` VALUES('881','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.79.1','2016-03-21 16:08:03');
INSERT INTO `v9_log` VALUES('882','','0','admin','','category','?m=admin&c=category&a=batch_edit','','1','admin','123.147.79.1','2016-03-21 16:08:06');
INSERT INTO `v9_log` VALUES('883','','0','admin','','category','?m=admin&c=category&a=batch_edit','','1','admin','123.147.79.1','2016-03-21 16:08:11');
INSERT INTO `v9_log` VALUES('884','','0','admin','','category','?m=admin&c=category&a=batch_edit','','1','admin','123.147.79.1','2016-03-21 16:08:29');
INSERT INTO `v9_log` VALUES('885','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.199.112.49','2016-03-21 17:22:02');
INSERT INTO `v9_log` VALUES('886','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.84.234','2016-03-22 09:55:43');
INSERT INTO `v9_log` VALUES('887','','0','admin','','index','?m=admin&c=index&a=login','','0','','183.232.120.54','2016-03-22 09:55:54');
INSERT INTO `v9_log` VALUES('888','','0','admin','','index','?m=admin&c=index&a=login','','0','','125.84.84.234','2016-03-22 09:56:04');
INSERT INTO `v9_log` VALUES('889','','0','admin','','index','?m=admin&c=index&a=login','','0','','125.84.84.234','2016-03-22 09:56:28');
INSERT INTO `v9_log` VALUES('890','','0','admin','','index','?m=admin&c=index&a=login','','0','','125.84.84.234','2016-03-22 09:58:00');
INSERT INTO `v9_log` VALUES('891','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:03:05');
INSERT INTO `v9_log` VALUES('892','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:03:33');
INSERT INTO `v9_log` VALUES('893','','0','content','','content','?m=content&c=content&a=delete','','1','admin','125.84.84.234','2016-03-22 10:06:07');
INSERT INTO `v9_log` VALUES('894','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:07:12');
INSERT INTO `v9_log` VALUES('895','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:07:41');
INSERT INTO `v9_log` VALUES('896','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:08:01');
INSERT INTO `v9_log` VALUES('897','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:08:28');
INSERT INTO `v9_log` VALUES('898','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:09:00');
INSERT INTO `v9_log` VALUES('899','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:10:35');
INSERT INTO `v9_log` VALUES('900','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:11:26');
INSERT INTO `v9_log` VALUES('901','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:11:51');
INSERT INTO `v9_log` VALUES('902','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:12:57');
INSERT INTO `v9_log` VALUES('903','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:13:20');
INSERT INTO `v9_log` VALUES('904','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:19:04');
INSERT INTO `v9_log` VALUES('905','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:19:42');
INSERT INTO `v9_log` VALUES('906','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:21:32');
INSERT INTO `v9_log` VALUES('907','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:23:09');
INSERT INTO `v9_log` VALUES('908','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:23:33');
INSERT INTO `v9_log` VALUES('909','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:23:53');
INSERT INTO `v9_log` VALUES('910','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:24:43');
INSERT INTO `v9_log` VALUES('911','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:25:09');
INSERT INTO `v9_log` VALUES('912','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:25:23');
INSERT INTO `v9_log` VALUES('913','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:26:07');
INSERT INTO `v9_log` VALUES('914','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:26:21');
INSERT INTO `v9_log` VALUES('915','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:26:48');
INSERT INTO `v9_log` VALUES('916','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.84.234','2016-03-22 10:31:27');
INSERT INTO `v9_log` VALUES('917','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.84.234','2016-03-22 10:31:48');
INSERT INTO `v9_log` VALUES('918','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:32:03');
INSERT INTO `v9_log` VALUES('919','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:32:55');
INSERT INTO `v9_log` VALUES('920','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:33:19');
INSERT INTO `v9_log` VALUES('921','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:33:44');
INSERT INTO `v9_log` VALUES('922','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:34:01');
INSERT INTO `v9_log` VALUES('923','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.84.234','2016-03-22 10:34:14');
INSERT INTO `v9_log` VALUES('924','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.84.234','2016-03-22 10:34:28');
INSERT INTO `v9_log` VALUES('925','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:34:52');
INSERT INTO `v9_log` VALUES('926','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:35:06');
INSERT INTO `v9_log` VALUES('927','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:35:28');
INSERT INTO `v9_log` VALUES('928','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:35:46');
INSERT INTO `v9_log` VALUES('929','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:36:47');
INSERT INTO `v9_log` VALUES('930','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:37:31');
INSERT INTO `v9_log` VALUES('931','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.84.234','2016-03-22 10:37:59');
INSERT INTO `v9_log` VALUES('932','','0','admin','','index','?m=admin&c=index&a=login','','1','admin','125.84.84.234','2016-03-22 15:59:56');
INSERT INTO `v9_log` VALUES('933','','0','admin','','index','?m=admin&c=index&a=login','','0','','220.181.132.196','2016-03-22 17:29:09');
INSERT INTO `v9_log` VALUES('934','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.84.234','2016-03-22 18:45:03');
INSERT INTO `v9_log` VALUES('935','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.83.240','2016-04-01 13:23:03');
INSERT INTO `v9_log` VALUES('936','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.83.240','2016-04-01 13:23:03');
INSERT INTO `v9_log` VALUES('937','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.83.240','2016-04-01 13:23:33');
INSERT INTO `v9_log` VALUES('938','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.83.240','2016-04-01 13:23:34');
INSERT INTO `v9_log` VALUES('939','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.83.240','2016-04-01 13:23:55');
INSERT INTO `v9_log` VALUES('940','','0','admin','','index','?m=admin&c=index&a=login','','0','','220.181.132.218','2016-04-01 13:25:27');
INSERT INTO `v9_log` VALUES('941','','0','admin','','index','?m=admin&c=index&a=login','','0','','220.181.132.218','2016-04-01 13:25:29');
INSERT INTO `v9_log` VALUES('942','','0','member','','member','?m=member&c=member&a=manage','','1','admin','125.84.83.240','2016-04-01 13:25:59');
INSERT INTO `v9_log` VALUES('943','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','125.84.83.240','2016-04-01 13:26:04');
INSERT INTO `v9_log` VALUES('944','','0','admin','','index','?m=admin&c=index&a=login','','0','','171.8.167.66','2016-04-01 13:26:18');
INSERT INTO `v9_log` VALUES('945','','0','admin','','index','?m=admin&c=index&a=login','','0','','171.8.167.66','2016-04-01 13:26:21');
INSERT INTO `v9_log` VALUES('946','','0','admin','','index','?m=admin&c=index&a=login','','0','','171.8.167.66','2016-04-01 13:26:31');
INSERT INTO `v9_log` VALUES('947','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.86.104.237','2016-04-01 23:22:32');
INSERT INTO `v9_log` VALUES('948','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.199.108.58','2016-04-01 23:24:35');
INSERT INTO `v9_log` VALUES('949','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.83.86','2016-04-05 10:31:00');
INSERT INTO `v9_log` VALUES('950','','0','admin','','index','?m=admin&c=index&a=login','','0','','220.181.132.218','2016-04-05 10:33:27');
INSERT INTO `v9_log` VALUES('951','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.199.112.45','2016-04-05 10:34:17');
INSERT INTO `v9_log` VALUES('952','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.83.86','2016-04-05 11:46:23');
INSERT INTO `v9_log` VALUES('953','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.83.86','2016-04-05 11:47:32');
INSERT INTO `v9_log` VALUES('954','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.83.86','2016-04-05 11:47:34');
INSERT INTO `v9_log` VALUES('955','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.83.86','2016-04-05 11:47:45');
INSERT INTO `v9_log` VALUES('956','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.83.86','2016-04-05 11:47:47');
INSERT INTO `v9_log` VALUES('957','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.83.86','2016-04-05 11:47:58');
INSERT INTO `v9_log` VALUES('958','','0','admin','','index','?m=admin&c=index&a=login','','0','','14.17.18.147','2016-04-05 11:54:33');
INSERT INTO `v9_log` VALUES('959','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','125.84.83.86','2016-04-05 14:49:38');
INSERT INTO `v9_log` VALUES('960','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','125.84.83.86','2016-04-05 14:49:57');
INSERT INTO `v9_log` VALUES('961','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','125.84.83.86','2016-04-05 14:50:10');
INSERT INTO `v9_log` VALUES('962','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','125.84.83.86','2016-04-05 14:50:24');
INSERT INTO `v9_log` VALUES('963','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','125.84.83.86','2016-04-05 14:50:59');
INSERT INTO `v9_log` VALUES('964','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','125.84.83.86','2016-04-05 14:52:33');
INSERT INTO `v9_log` VALUES('965','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:53:11');
INSERT INTO `v9_log` VALUES('966','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:53:27');
INSERT INTO `v9_log` VALUES('967','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:53:28');
INSERT INTO `v9_log` VALUES('968','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:53:36');
INSERT INTO `v9_log` VALUES('969','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:53:37');
INSERT INTO `v9_log` VALUES('970','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:53:50');
INSERT INTO `v9_log` VALUES('971','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:53:52');
INSERT INTO `v9_log` VALUES('972','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:54:03');
INSERT INTO `v9_log` VALUES('973','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:54:14');
INSERT INTO `v9_log` VALUES('974','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:54:15');
INSERT INTO `v9_log` VALUES('975','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:54:24');
INSERT INTO `v9_log` VALUES('976','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:54:25');
INSERT INTO `v9_log` VALUES('977','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:54:45');
INSERT INTO `v9_log` VALUES('978','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:54:53');
INSERT INTO `v9_log` VALUES('979','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:54:54');
INSERT INTO `v9_log` VALUES('980','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:55:01');
INSERT INTO `v9_log` VALUES('981','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:55:06');
INSERT INTO `v9_log` VALUES('982','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:55:07');
INSERT INTO `v9_log` VALUES('983','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:55:11');
INSERT INTO `v9_log` VALUES('984','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.86','2016-04-05 14:55:13');
INSERT INTO `v9_log` VALUES('985','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','125.84.83.86','2016-04-05 15:05:56');
INSERT INTO `v9_log` VALUES('986','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','125.84.83.86','2016-04-05 15:06:10');
INSERT INTO `v9_log` VALUES('987','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.80.38','2016-04-05 15:59:39');
INSERT INTO `v9_log` VALUES('988','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.80.38','2016-04-05 15:59:45');
INSERT INTO `v9_log` VALUES('989','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','123.147.80.38','2016-04-05 16:00:05');
INSERT INTO `v9_log` VALUES('990','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','123.147.80.38','2016-04-05 16:00:42');
INSERT INTO `v9_log` VALUES('991','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.80.38','2016-04-05 16:49:27');
INSERT INTO `v9_log` VALUES('992','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.80.38','2016-04-05 16:56:25');
INSERT INTO `v9_log` VALUES('993','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','admin','123.147.80.38','2016-04-05 16:56:50');
INSERT INTO `v9_log` VALUES('994','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','123.147.80.38','2016-04-05 16:58:05');
INSERT INTO `v9_log` VALUES('995','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.228','2016-04-07 09:26:03');
INSERT INTO `v9_log` VALUES('996','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.228','2016-04-07 09:26:03');
INSERT INTO `v9_log` VALUES('997','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.228','2016-04-07 09:26:09');
INSERT INTO `v9_log` VALUES('998','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','123.147.77.228','2016-04-07 10:53:31');
INSERT INTO `v9_log` VALUES('999','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','123.147.77.228','2016-04-07 10:54:02');
INSERT INTO `v9_log` VALUES('1000','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.83.54','2016-04-07 13:32:15');
INSERT INTO `v9_log` VALUES('1001','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.83.54','2016-04-07 13:32:59');
INSERT INTO `v9_log` VALUES('1002','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.83.54','2016-04-07 13:33:15');
INSERT INTO `v9_log` VALUES('1003','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.83.54','2016-04-07 13:35:39');
INSERT INTO `v9_log` VALUES('1004','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.54','2016-04-07 13:40:32');
INSERT INTO `v9_log` VALUES('1005','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.54','2016-04-07 13:40:34');
INSERT INTO `v9_log` VALUES('1006','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.54','2016-04-07 13:40:36');
INSERT INTO `v9_log` VALUES('1007','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','125.84.83.54','2016-04-07 13:41:01');
INSERT INTO `v9_log` VALUES('1008','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.54','2016-04-07 13:41:36');
INSERT INTO `v9_log` VALUES('1009','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.54','2016-04-07 13:41:43');
INSERT INTO `v9_log` VALUES('1010','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.54','2016-04-07 13:41:44');
INSERT INTO `v9_log` VALUES('1011','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.54','2016-04-07 13:41:48');
INSERT INTO `v9_log` VALUES('1012','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.54','2016-04-07 13:41:49');
INSERT INTO `v9_log` VALUES('1013','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.54','2016-04-07 13:42:00');
INSERT INTO `v9_log` VALUES('1014','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.54','2016-04-07 13:42:01');
INSERT INTO `v9_log` VALUES('1015','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.54','2016-04-07 13:44:40');
INSERT INTO `v9_log` VALUES('1016','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.54','2016-04-07 13:44:42');
INSERT INTO `v9_log` VALUES('1017','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.54','2016-04-07 13:44:43');
INSERT INTO `v9_log` VALUES('1018','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.54','2016-04-07 13:44:46');
INSERT INTO `v9_log` VALUES('1019','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.83.54','2016-04-07 13:44:48');
INSERT INTO `v9_log` VALUES('1020','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.228','2016-04-07 16:11:47');
INSERT INTO `v9_log` VALUES('1021','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.228','2016-04-07 16:11:54');
INSERT INTO `v9_log` VALUES('1022','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','123.147.77.228','2016-04-07 16:30:00');
INSERT INTO `v9_log` VALUES('1023','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','123.147.77.228','2016-04-07 16:30:38');
INSERT INTO `v9_log` VALUES('1024','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=listorder','','1','admin','123.147.77.228','2016-04-07 16:30:51');
INSERT INTO `v9_log` VALUES('1025','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','admin','123.147.77.228','2016-04-07 16:30:56');
INSERT INTO `v9_log` VALUES('1026','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','admin','123.147.77.228','2016-04-07 16:31:08');
INSERT INTO `v9_log` VALUES('1027','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:31:18');
INSERT INTO `v9_log` VALUES('1028','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:31:26');
INSERT INTO `v9_log` VALUES('1029','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:31:30');
INSERT INTO `v9_log` VALUES('1030','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:31:33');
INSERT INTO `v9_log` VALUES('1031','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:31:37');
INSERT INTO `v9_log` VALUES('1032','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:31:42');
INSERT INTO `v9_log` VALUES('1033','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:31:45');
INSERT INTO `v9_log` VALUES('1034','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:31:51');
INSERT INTO `v9_log` VALUES('1035','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','admin','123.147.77.228','2016-04-07 16:42:56');
INSERT INTO `v9_log` VALUES('1036','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','admin','123.147.77.228','2016-04-07 16:44:44');
INSERT INTO `v9_log` VALUES('1037','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=delete','','1','admin','123.147.77.228','2016-04-07 16:45:05');
INSERT INTO `v9_log` VALUES('1038','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','123.147.77.228','2016-04-07 16:45:11');
INSERT INTO `v9_log` VALUES('1039','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=add','','1','admin','123.147.77.228','2016-04-07 16:46:05');
INSERT INTO `v9_log` VALUES('1040','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=listorder','','1','admin','123.147.77.228','2016-04-07 16:46:20');
INSERT INTO `v9_log` VALUES('1041','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','admin','123.147.77.228','2016-04-07 16:46:26');
INSERT INTO `v9_log` VALUES('1042','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=edit','','1','admin','123.147.77.228','2016-04-07 16:46:35');
INSERT INTO `v9_log` VALUES('1043','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:46:42');
INSERT INTO `v9_log` VALUES('1044','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:46:47');
INSERT INTO `v9_log` VALUES('1045','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:46:51');
INSERT INTO `v9_log` VALUES('1046','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:46:56');
INSERT INTO `v9_log` VALUES('1047','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:47:03');
INSERT INTO `v9_log` VALUES('1048','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:47:11');
INSERT INTO `v9_log` VALUES('1049','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:47:29');
INSERT INTO `v9_log` VALUES('1050','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-07 16:47:34');
INSERT INTO `v9_log` VALUES('1051','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.228','2016-04-08 15:05:13');
INSERT INTO `v9_log` VALUES('1052','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.228','2016-04-08 15:05:30');
INSERT INTO `v9_log` VALUES('1053','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.228','2016-04-08 15:05:32');
INSERT INTO `v9_log` VALUES('1054','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.228','2016-04-08 15:05:32');
INSERT INTO `v9_log` VALUES('1055','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.228','2016-04-08 15:05:43');
INSERT INTO `v9_log` VALUES('1056','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.228','2016-04-08 15:05:44');
INSERT INTO `v9_log` VALUES('1057','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.228','2016-04-08 15:05:52');
INSERT INTO `v9_log` VALUES('1058','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','123.147.77.228','2016-04-08 15:06:14');
INSERT INTO `v9_log` VALUES('1059','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','123.147.77.228','2016-04-08 15:06:41');
INSERT INTO `v9_log` VALUES('1060','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','123.147.77.228','2016-04-08 15:07:14');
INSERT INTO `v9_log` VALUES('1061','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','123.147.77.228','2016-04-08 15:07:29');
INSERT INTO `v9_log` VALUES('1062','','0','content','','content','?m=content&c=content&a=add','','1','admin','123.147.77.228','2016-04-08 15:07:46');
INSERT INTO `v9_log` VALUES('1063','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-08 15:18:57');
INSERT INTO `v9_log` VALUES('1064','','0','content','','content','?m=content&c=content&a=remove','','1','admin','123.147.77.228','2016-04-08 15:19:49');
INSERT INTO `v9_log` VALUES('1065','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.228','2016-04-08 15:20:17');
INSERT INTO `v9_log` VALUES('1066','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.77.228','2016-04-08 15:20:25');
INSERT INTO `v9_log` VALUES('1067','','0','content','','content','?m=content&c=content&a=remove','','1','admin','123.147.77.228','2016-04-08 15:20:49');
INSERT INTO `v9_log` VALUES('1068','','0','content','','content','?m=content&c=content&a=edit','','1','admin','123.147.77.228','2016-04-08 15:21:22');
INSERT INTO `v9_log` VALUES('1069','','0','content','','content','?m=content&c=content&a=remove','','1','admin','123.147.77.228','2016-04-08 15:21:42');
INSERT INTO `v9_log` VALUES('1070','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.228','2016-04-08 15:22:27');
INSERT INTO `v9_log` VALUES('1071','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.228','2016-04-08 15:22:34');
INSERT INTO `v9_log` VALUES('1072','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.77.228','2016-04-08 15:22:41');
INSERT INTO `v9_log` VALUES('1073','','0','content','','content','?m=content&c=content&a=remove','','1','admin','123.147.77.228','2016-04-08 16:16:06');
INSERT INTO `v9_log` VALUES('1074','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.82.208','2016-04-11 10:44:02');
INSERT INTO `v9_log` VALUES('1075','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.82.208','2016-04-11 10:45:22');
INSERT INTO `v9_log` VALUES('1076','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.82.208','2016-04-11 10:47:27');
INSERT INTO `v9_log` VALUES('1077','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.83.194','2016-04-11 10:56:15');
INSERT INTO `v9_log` VALUES('1078','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.83.194','2016-04-11 10:56:15');
INSERT INTO `v9_log` VALUES('1079','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','123.147.83.194','2016-04-11 10:56:22');
INSERT INTO `v9_log` VALUES('1080','','0','content','','content','?m=content&c=content&a=delete','','1','admin','123.147.83.194','2016-04-11 10:56:50');
INSERT INTO `v9_log` VALUES('1081','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.83.194','2016-04-11 10:56:57');
INSERT INTO `v9_log` VALUES('1082','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','123.147.83.194','2016-04-11 10:57:07');
INSERT INTO `v9_log` VALUES('1083','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.82.208','2016-04-11 11:32:57');
INSERT INTO `v9_log` VALUES('1084','','0','admin','','index','?m=admin&c=index&a=login','','0','','180.169.123.26','2016-04-11 17:39:34');
INSERT INTO `v9_log` VALUES('1085','','0','admin','','index','?m=admin&c=index&a=login','','0','','180.169.123.26','2016-04-11 17:39:44');
INSERT INTO `v9_log` VALUES('1086','','0','admin','','index','?m=admin&c=index&a=login','','0','','180.169.123.26','2016-04-11 17:39:45');
INSERT INTO `v9_log` VALUES('1087','','0','admin','','index','?m=admin&c=index&a=login','','0','','180.169.123.26','2016-04-11 17:39:54');
INSERT INTO `v9_log` VALUES('1088','','0','admin','','index','?m=admin&c=index&a=login','','0','','180.169.123.26','2016-04-11 17:39:56');
INSERT INTO `v9_log` VALUES('1089','','0','admin','','index','?m=admin&c=index&a=login','','0','','180.169.123.26','2016-04-11 17:40:04');
INSERT INTO `v9_log` VALUES('1090','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.86.111.66','2016-04-11 22:42:19');
INSERT INTO `v9_log` VALUES('1091','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.226.68.215','2016-04-12 16:33:36');
INSERT INTO `v9_log` VALUES('1092','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.84.8','2016-04-12 17:33:43');
INSERT INTO `v9_log` VALUES('1093','','0','admin','','index','?m=admin&c=index&a=login','','0','','220.181.132.218','2016-04-12 17:35:19');
INSERT INTO `v9_log` VALUES('1094','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.84.8','2016-04-12 17:35:23');
INSERT INTO `v9_log` VALUES('1095','','0','admin','','index','?m=admin&c=index&a=login','','0','','220.181.132.195','2016-04-12 17:35:39');
INSERT INTO `v9_log` VALUES('1096','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.199.108.59','2016-04-12 17:37:48');
INSERT INTO `v9_log` VALUES('1097','','0','admin','','index','?m=admin&c=index&a=login','','0','','180.169.123.26','2016-04-13 21:47:27');
INSERT INTO `v9_log` VALUES('1098','','0','admin','','index','?m=admin&c=index&a=login','','0','','180.169.123.26','2016-04-13 21:50:54');
INSERT INTO `v9_log` VALUES('1099','','0','content','','content','?m=content&c=content&a=edit','','1','admin','180.169.123.26','2016-04-13 22:02:15');
INSERT INTO `v9_log` VALUES('1100','','0','content','','content','?m=content&c=content&a=edit','','1','admin','180.169.123.26','2016-04-13 22:02:34');
INSERT INTO `v9_log` VALUES('1101','','0','content','','content','?m=content&c=content&a=edit','','1','admin','180.169.123.26','2016-04-13 22:02:49');
INSERT INTO `v9_log` VALUES('1102','','0','content','','content','?m=content&c=content&a=edit','','1','admin','180.169.123.26','2016-04-13 22:03:02');
INSERT INTO `v9_log` VALUES('1103','','0','content','','content','?m=content&c=content&a=edit','','1','admin','180.169.123.26','2016-04-13 22:03:10');
INSERT INTO `v9_log` VALUES('1104','','0','content','','content','?m=content&c=content&a=edit','','1','admin','180.169.123.26','2016-04-13 22:08:11');
INSERT INTO `v9_log` VALUES('1105','','0','content','','content','?m=content&c=content&a=edit','','1','admin','180.169.123.26','2016-04-13 22:08:37');
INSERT INTO `v9_log` VALUES('1106','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.81.104','2016-04-14 15:37:33');
INSERT INTO `v9_log` VALUES('1107','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.81.104','2016-04-14 15:37:34');
INSERT INTO `v9_log` VALUES('1108','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.199.108.50','2016-04-14 15:39:27');
INSERT INTO `v9_log` VALUES('1109','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.81.104','2016-04-14 15:58:59');
INSERT INTO `v9_log` VALUES('1110','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.81.104','2016-04-14 15:58:59');
INSERT INTO `v9_log` VALUES('1111','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.81.104','2016-04-14 15:59:28');
INSERT INTO `v9_log` VALUES('1112','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:01:22');
INSERT INTO `v9_log` VALUES('1113','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:03:21');
INSERT INTO `v9_log` VALUES('1114','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:03:49');
INSERT INTO `v9_log` VALUES('1115','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:04:04');
INSERT INTO `v9_log` VALUES('1116','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:05:16');
INSERT INTO `v9_log` VALUES('1117','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:11:09');
INSERT INTO `v9_log` VALUES('1118','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:11:45');
INSERT INTO `v9_log` VALUES('1119','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:11:46');
INSERT INTO `v9_log` VALUES('1120','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:11:52');
INSERT INTO `v9_log` VALUES('1121','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:11:53');
INSERT INTO `v9_log` VALUES('1122','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:12:12');
INSERT INTO `v9_log` VALUES('1123','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:12:14');
INSERT INTO `v9_log` VALUES('1124','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:12:50');
INSERT INTO `v9_log` VALUES('1125','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:12:52');
INSERT INTO `v9_log` VALUES('1126','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.81.104','2016-04-14 16:13:29');
INSERT INTO `v9_log` VALUES('1127','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.81.104','2016-04-14 16:13:59');
INSERT INTO `v9_log` VALUES('1128','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:17:08');
INSERT INTO `v9_log` VALUES('1129','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:17:11');
INSERT INTO `v9_log` VALUES('1130','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:17:12');
INSERT INTO `v9_log` VALUES('1131','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:17:15');
INSERT INTO `v9_log` VALUES('1132','','0','content','','content','?m=content&c=content&a=edit','','1','admin','125.84.81.104','2016-04-14 16:17:17');
INSERT INTO `v9_log` VALUES('1133','','0','content','','content','?m=content&c=content&a=add','','1','admin','125.84.81.104','2016-04-14 16:24:31');
INSERT INTO `v9_log` VALUES('1134','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.87.52','2016-04-15 10:33:02');
INSERT INTO `v9_log` VALUES('1135','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','125.84.87.52','2016-04-15 10:33:48');
INSERT INTO `v9_log` VALUES('1136','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','125.84.87.52','2016-04-15 10:34:21');
INSERT INTO `v9_log` VALUES('1137','','0','admin','','index','?m=admin&c=index&a=login','','0','','101.199.112.50','2016-04-15 10:35:46');
INSERT INTO `v9_log` VALUES('1138','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','125.84.87.52','2016-04-15 10:40:09');
INSERT INTO `v9_log` VALUES('1139','','0','admin','','index','?m=admin&c=index&a=login','','0','','123.147.83.106','2016-04-19 14:35:19');
INSERT INTO `v9_log` VALUES('1140','','0','admin','','index','?m=admin&c=index&a=login','','0','','123.147.83.106','2016-04-19 14:35:26');
INSERT INTO `v9_log` VALUES('1141','','0','content','','content','?m=content&c=content&a=add','','1','admin','123.147.83.106','2016-04-19 14:35:53');
INSERT INTO `v9_log` VALUES('1142','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','123.147.83.106','2016-04-19 14:37:36');
INSERT INTO `v9_log` VALUES('1143','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','123.147.83.106','2016-04-19 14:37:38');
INSERT INTO `v9_log` VALUES('1144','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','123.147.83.106','2016-04-19 14:37:52');

DROP TABLE IF EXISTS `v9_member`;
CREATE TABLE `v9_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(40) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `phpssouid` (`phpssouid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_member_detail`;
CREATE TABLE `v9_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_member_group`;
CREATE TABLE `v9_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `v9_member_group` VALUES('8','游客','1','0','0','0','0','0','0','1','0','0','0','0','0.00','0.00','0.00','','','','0','0');
INSERT INTO `v9_member_group` VALUES('2','新手上路','1','1','50','100','1','1','0','0','0','1','0','0','50.00','10.00','1.00','','','','2','0');
INSERT INTO `v9_member_group` VALUES('6','注册会员','1','2','100','150','0','1','0','0','1','1','0','0','300.00','30.00','1.00','','','','6','0');
INSERT INTO `v9_member_group` VALUES('4','中级会员','1','3','150','500','1','1','0','1','1','1','0','0','500.00','60.00','1.00','','','','4','0');
INSERT INTO `v9_member_group` VALUES('5','高级会员','1','5','300','999','1','1','0','1','1','1','0','0','360.00','90.00','5.00','','','','5','0');
INSERT INTO `v9_member_group` VALUES('1','禁止访问','1','0','0','0','1','1','0','1','0','0','0','0','0.00','0.00','0.00','','','0','0','0');
INSERT INTO `v9_member_group` VALUES('7','邮件认证','1','0','0','0','0','0','0','0','0','0','0','0','0.00','0.00','0.00','images/group/vip.jpg','#000000','','7','0');

DROP TABLE IF EXISTS `v9_member_menu`;
CREATE TABLE `v9_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `v9_member_menu` VALUES('1','member_init','0','member','index','init','t=0','0','1','','');
INSERT INTO `v9_member_menu` VALUES('2','account_manage','0','member','index','account_manage','t=1','0','1','','');
INSERT INTO `v9_member_menu` VALUES('3','favorite','0','member','index','favorite','t=2','0','1','','');

DROP TABLE IF EXISTS `v9_member_verify`;
CREATE TABLE `v9_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `modelinfo` char(255) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) DEFAULT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_member_vip`;
CREATE TABLE `v9_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_menu`;
CREATE TABLE `v9_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `project1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project3` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project4` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project5` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=1695 DEFAULT CHARSET=utf8;

INSERT INTO `v9_menu` VALUES('1','sys_setting','0','admin','setting','init','','1','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('2','module','0','admin','module','init','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('872','sync_release_point','873','release','index','init','','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('4','content','0','content','content','init','','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('5','members','0','member','member','init','','5','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('6','userinterface','0','template','style','init','','6','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('30','correlative_setting','1','admin','admin','admin','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('31','menu_manage','977','admin','menu','init','','8','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('32','posid_manage','975','admin','position','init','','7','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('29','module_list','2','admin','module','','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('82','module_manage','2','admin','module','','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('10','panel','0','admin','index','public_main','','0','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('35','menu_add','31','admin','menu','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('826','template_manager','6','','','','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('54','admin_manage','49','admin','admin_manage','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('43','category_manage','975','admin','category','init','module=admin','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('42','add_category','43','admin','category','add','s=0','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('44','edit_category','43','admin','category','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('45','badword_manage','977','admin','badword','init','','10','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('46','posid_add','32','admin','position','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('49','admin_setting','1','admin','','','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('50','role_manage','49','admin','role','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('51','role_add','50','admin','role','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('52','category_cache','43','admin','category','public_cache','module=admin','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('55','manage_member','5','member','member','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('58','admin_add','54','admin','admin_manage','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('59','model_manage','975','content','sitemodel','init','','5','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('64','site_management','30','admin','site','init','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('81','member_add','72','member','member','add','','2','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('62','add_model','59','content','sitemodel','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('65','release_point_management','30','admin','release_point','init','','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('66','badword_export','45','admin','badword','export','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('67','add_site','64','admin','site','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('68','badword_import','45','admin','badword','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('812','member_group_manage','76','member','member_group','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('74','member_verify','55','member','member_verify','manage','s=0','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('76','manage_member_group','5','member','member_group','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('77','manage_member_model','5','member','member_model','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('78','member_group_add','812','member','member_group','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('79','member_model_add','813','member','member_model','add','','1','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('80','member_model_import','77','member','member_model','import','','2','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('72','member_manage','55','member','member','manage','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('813','member_model_manage','77','member','member_model','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('814','site_edit','64','admin','site','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('815','site_del','64','admin','site','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('816','release_point_add','65','admin','release_point','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('817','release_point_del','65','admin','release_point','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('818','release_point_edit','65','admin','release_point','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('821','content_publish','4','content','content','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('822','content_manage','821','content','content','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('867','linkage','977','admin','linkage','init','','13','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('827','template_style','826','template','style','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('828','import_style','827','template','style','import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('831','template_export','827','template','style','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('830','template_file','827','template','file','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('832','template_onoff','827','template','style','disable','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('833','template_updatename','827','template','style','updatename','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('834','member_lock','72','member','member','lock','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('835','member_unlock','72','member','member','unlock','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('836','member_move','72','member','member','move','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('837','member_delete','72','member','member','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('842','verify_ignore','74','member','member_verify','manage','s=2','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('839','member_setting','55','member','member_setting','manage','','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('841','verify_pass','74','member','member_verify','manage','s=1','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('843','verify_delete','74','member','member_verify','manage','s=3','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('844','verify_deny','74','member','member_verify','manage','s=4','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('845','never_pass','74','member','member_verify','manage','s=5','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('846','template_file_list','827','template','file','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('847','template_file_edit','827','template','file','edit_file','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('848','file_add_file','827','template','file','add_file','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('850','listorder','76','member','member_group','sort','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('852','priv_setting','50','admin','role','priv_setting','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('853','role_priv','50','admin','role','role_priv','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('857','attachment_manage','821','attachment','manage','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('868','special','821','special','special','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('869','template_editor','827','template','file','edit_file','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('870','template_visualization','827','template','file','visualization','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('871','pc_tag_edit','827','template','file','edit_pc_tag','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('873','release_manage','4','release','html','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('874','type_manage','975','content','type_manage','init','','6','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('875','add_type','874','content','type_manage','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('876','linkageadd','867','admin','linkage','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('877','failure_list','872','release','index','failed','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('879','member_search','72','member','member','search','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('880','queue_del','872','release','index','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('881','member_model_delete','813','member','member_model','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('882','member_model_edit','813','member','member_model','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('885','workflow','977','content','workflow','init','','15','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('888','add_workflow','885','content','workflow','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('889','member_modelfield_add','813','member','member_modelfield','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('890','member_modelfield_edit','813','member','member_modelfield','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('891','member_modelfield_delete','813','member','member_modelfield','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('892','member_modelfield_manage','813','member','member_modelfield','manage','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('895','sitemodel_import','59','content','sitemodel','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('896','pay','29','pay','payment','pay_list','s=3','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('897','payments','896','pay','payment','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('898','paylist','896','pay','payment','pay_list','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('899','add_content','822','content','content','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('900','modify_deposit','896','pay','payment','modify_deposit','s=1','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('901','check_content','822','content','content','pass','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('902','dbsource','29','dbsource','data','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('905','create_content_html','873','content','create_html','show','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('904','external_data_sources','902','dbsource','dbsource_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('906','update_urls','873','content','create_html','update_urls','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('960','node_add','957','collection','node','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('909','fulltext_search','29','search','search_type','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('910','manage_type','909','search','search_type','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('911','search_setting','909','search','search_admin','setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('912','createindex','909','search','search_admin','createindex','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('913','add_search_type','909','search','search_type','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('914','database_toos','977','admin','database','export','','6','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('915','database_export','914','admin','database','export','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('916','database_import','914','admin','database','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('917','dbsource_add','902','dbsource','dbsource_admin','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('918','dbsource_edit','902','dbsource','dbsource_admin','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('919','dbsource_del','902','dbsource','dbsource_admin','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('920','dbsource_data_add','902','dbsource','data','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('921','dbsource_data_edit','902','dbsource','data','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('922','dbsource_data_del','902','dbsource','data','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('926','add_special','868','special','special','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('927','edit_special','868','special','special','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('928','special_list','868','special','special','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('929','special_elite','868','special','special','elite','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('930','delete_special','868','special','special','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('931','badword_add','45','admin','badword','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('932','badword_edit','45','admin','badword','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('933','badword_delete','45','admin','badword','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('934','special_listorder','868','special','special','listorder','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('935','special_content_list','868','special','content','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('936','special_content_add','935','special','content','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('937','special_content_list','935','special','content','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('938','special_content_edit','935','special','content','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('939','special_content_delete','935','special','content','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('940','special_content_listorder','935','special','content','listorder','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('941','special_content_import','935','special','special','import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('942','history_version','827','template','template_bak','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('943','restore_version','827','template','template_bak','restore','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('944','del_history_version','827','template','template_bak','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('945','block','821','block','block_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('946','block_add','945','block','block_admin','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('950','block_edit','945','block','block_admin','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('951','block_del','945','block','block_admin','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('952','block_update','945','block','block_admin','block_update','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('953','block_restore','945','block','block_admin','history_restore','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('954','history_del','945','block','block_admin','history_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('978','urlrule_manage','977','admin','urlrule','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('957','collection_node','821','collection','node','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('979','safe_config','30','admin','setting','init','&tab=2','11','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('959','basic_config','30','admin','setting','init','','10','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('961','position_edit','32','admin','position','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('962','collection_node_edit','957','collection','node','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('963','collection_node_delete','957','collection','node','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('990','col_url_list','957','collection','node','col_url_list','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('965','collection_node_publish','957','collection','node','publist','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('966','collection_node_import','957','collection','node','node_import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('967','collection_node_export','957','collection','node','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('968','collection_node_collection_content','957','collection','node','col_content','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('969','googlesitemap','977','admin','googlesitemap','set','','11','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('970','admininfo','10','admin','admin_manage','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('971','editpwd','970','admin','admin_manage','public_edit_pwd','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('972','editinfo','970','admin','admin_manage','public_edit_info','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('973','keylink','977','admin','keylink','init','','12','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('974','add_keylink','973','admin','keylink','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('975','content_settings','4','content','content_settings','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('7','extend','0','admin','extend','init_extend','','7','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('977','extend_all','7','admin','extend_all','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('980','sso_config','30','admin','setting','init','&tab=3','12','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('981','email_config','30','admin','setting','init','&tab=4','13','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('982','module_manage','82','admin','module','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('983','ipbanned','977','admin','ipbanned','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('984','add_ipbanned','983','admin','ipbanned','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('993','collection_content_import','957','collection','node','import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('991','copy_node','957','collection','node','copy','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('992','content_del','957','collection','node','content_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('989','downsites','977','admin','downservers','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('994','import_program_add','957','collection','node','import_program_add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('995','import_program_del','957','collection','node','import_program_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('996','import_content','957','collection','node','import_content','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('997','log','977','admin','log','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('998','add_page','43','admin','category','add','s=1','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('999','add_cat_link','43','admin','category','add','s=2','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1000','count_items','43','admin','category','count_items','','5','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1001','cache_all','977','admin','cache_all','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1002','create_list_html','873','content','create_html','category','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1003','create_html_quick','10','content','create_html_opt','index','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1004','create_index','1003','content','create_html','public_index','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1005','scan','977','scan','index','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1006','scan_report','1005','scan','index','scan_report','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1007','md5_creat','1005','scan','index','md5_creat','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1008','album_import','868','special','album','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('8','phpsso','0','admin','phpsso','menu','','7','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1011','edit_content','822','content','content','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1012','push_to_special','822','content','push','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1023','delete_log','997','admin','log','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1024','delete_ip','983','admin','ipbanned','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1026','delete_keylink','973','admin','keylink','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1027','edit_keylink','973','admin','keylink','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1034','operation_pass','74','member','member_verify','pass','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1035','operation_delete','74','member','member_verify','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1039','operation_ignore','74','member','member_verify','ignore','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1038','settingsave','30','admin','setting','save','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1040','admin_edit','54','admin','admin_manage','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1041','operation_reject','74','member','member_verify','reject','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1042','admin_delete','54','admin','admin_manage','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1043','card','54','admin','admin_manage','card','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1044','creat_card','54','admin','admin_manage','creat_card','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1045','remove_card','54','admin','admin_manage','remove_card','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1049','member_group_edit','812','member','member_group','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1048','member_edit','72','member','member','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1050','role_edit','50','admin','role','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1051','member_group_delete','812','member','member_group','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1052','member_manage','50','admin','role','member_manage','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1053','role_delete','50','admin','role','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1054','member_model_export','77','member','member_model','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1055','member_model_sort','77','member','member_model','sort','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1056','member_model_move','77','member','member_model','move','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1057','payment_add','897','pay','payment','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1058','payment_delete','897','pay','payment','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1059','payment_edit','897','pay','payment','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1060','spend_record','896','pay','spend','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1061','pay_stat','896','pay','payment','pay_stat','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1062','fields_manage','59','content','sitemodel_field','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1063','edit_model_content','59','content','sitemodel','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1064','disabled_model','59','content','sitemodel','disabled','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1065','delete_model','59','content','sitemodel','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1066','export_model','59','content','sitemodel','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1067','delete','874','content','type_manage','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1068','edit','874','content','type_manage','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1069','add_urlrule','978','admin','urlrule','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1070','edit_urlrule','978','admin','urlrule','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1071','delete_urlrule','978','admin','urlrule','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1072','edit_menu','31','admin','menu','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1073','delete_menu','31','admin','menu','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1074','edit_workflow','885','content','workflow','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1075','delete_workflow','885','content','workflow','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1076','creat_html','868','special','special','html','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1093','connect_config','30','admin','setting','init','&tab=5','14','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1102','view_modelinfo','74','member','member_verify','modelinfo','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1202','create_special_list','868','special','special','create_special_list','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1240','view_memberlinfo','72','member','member','memberinfo','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1239','copyfrom_manage','977','admin','copyfrom','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1241','move_content','822','content','content','remove','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1242','poster_template','56','poster','space','poster_template','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1243','create_index','873','content','create_html','public_index','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1244','add_othors','822','content','content','add_othors','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1295','attachment_manager_dir','857','attachment','manage','dir','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1296','attachment_manager_db','857','attachment','manage','init','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1346','attachment_address_replace','857','attachment','address','init','','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1347','attachment_address_update','857','attachment','address','update','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1348','delete_content','822','content','content','delete','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1349','member_menu_manage','977','member','member_menu','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1350','member_menu_add','1349','member','member_menu','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1351','member_menu_edit','1349','member','member_menu','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1352','member_menu_delete','1349','member','member_menu','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1353','batch_show','822','content','create_html','batch_show','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1354','pay_delete','898','pay','payment','pay_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1355','pay_cancel','898','pay','payment','pay_cancel','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1356','discount','898','pay','payment','discount','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1360','category_batch_edit','43','admin','category','batch_edit','','6','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1500','listorder','822','content','content','listorder','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1501','a_clean_data','873','content','content','clear_data','','0','1','0','0','0','0','0');
INSERT INTO `v9_menu` VALUES('9','video','0','video','video','init','','11','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1589','video','9','video','video','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1583','sub_delete','1589','video','video','sub_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1582','subscribe_manage','1589','video','video','subscribe_list','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1581','video_open','1589','video','video','open','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1592','complete_info','1581','video','video','complete_info','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1591','video_inputinfo','1581','video','video','open','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1577','video_manage','1589','video','video','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1590','player_manage','1589','video','player','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1585','import_ku6_video','1589','video','video','import_ku6video','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1579','video_edit','1589','video','video','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1580','video_delete','1589','video','video','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1578','video_upload','1589','video','video','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1593','video_stat','1589','video','stat','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1586','video_store','1589','video','video','video2content','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1594','announce','29','announce','admin_announce','init','s=1','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1595','announce_add','1594','announce','admin_announce','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1596','edit_announce','1594','announce','admin_announce','edit','s=1','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1597','check_announce','1594','announce','admin_announce','init','s=2','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1598','overdue','1594','announce','admin_announce','init','s=3','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1599','del_announce','1594','announce','admin_announce','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1600','comment','29','comment','comment_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1601','comment_manage','821','comment','comment_admin','listinfo','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1602','comment_check','1601','comment','check','checks','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1603','comment_list','1600','comment','comment_admin','lists','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1604','link','29','link','link','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1605','add_link','1604','link','link','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1606','edit_link','1604','link','link','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1607','delete_link','1604','link','link','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1608','link_setting','1604','link','link','setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1609','add_type','1604','link','link','add_type','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1610','list_type','1604','link','link','list_type','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1611','check_register','1604','link','link','check_register','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1612','vote','29','vote','vote','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1613','add_vote','1612','vote','vote','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1614','edit_vote','1612','vote','vote','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1615','delete_vote','1612','vote','vote','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1616','vote_setting','1612','vote','vote','setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1617','statistics_vote','1612','vote','vote','statistics','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1618','statistics_userlist','1612','vote','vote','statistics_userlist','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1619','create_js','1612','vote','vote','create_js','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1620','message','29','message','message','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1621','send_one','1620','message','message','send_one','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1622','delete_message','1620','message','message','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1623','message_send','1620','message','message','message_send','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1624','message_group_manage','1620','message','message','message_group_manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1625','mood','29','mood','mood_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1626','mood_setting','1625','mood','mood_admin','setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1627','poster','29','poster','space','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1628','add_space','1627','poster','space','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1629','edit_space','1627','poster','space','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1630','del_space','1627','poster','space','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1631','poster_list','1627','poster','poster','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1632','add_poster','1627','poster','poster','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1633','edit_poster','1627','poster','poster','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1634','del_poster','1627','poster','poster','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1635','poster_stat','1627','poster','poster','stat','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1636','poster_setting','1627','poster','space','setting','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1637','create_poster_js','1627','poster','space','create_js','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1638','poster_template','1627','poster','space','poster_template','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1639','formguide','29','formguide','formguide','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1640','formguide_add','1639','formguide','formguide','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1641','formguide_edit','1639','formguide','formguide','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1642','form_info_list','1639','formguide','formguide_info','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1643','formguide_disabled','1639','formguide','formguide','disabled','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1644','formguide_delete','1639','formguide','formguide','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1645','formguide_stat','1639','formguide','formguide','stat','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1646','add_public_field','1639','formguide','formguide_field','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1647','list_public_field','1639','formguide','formguide_field','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1648','module_setting','1639','formguide','formguide','setting','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1649','wap','29','wap','wap_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1650','wap_add','1649','wap','wap_admin','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1651','wap_edit','1649','wap','wap_admin','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1652','wap_delete','1649','wap','wap_admin','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1653','wap_type_manage','1649','wap','wap_admin','type_manage','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1654','wap_type_edit','1649','wap','wap_admin','type_edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1655','wap_type_delete','1649','wap','wap_admin','type_delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1656','upgrade','977','upgrade','index','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1657','checkfile','1656','upgrade','index','checkfile','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1658','tag','826','tag','tag','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1659','add_tag','1658','tag','tag','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1660','edit_tag','1658','tag','tag','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1661','delete_tag','1658','tag','tag','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1662','tag_lists','1658','tag','tag','lists','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1663','sms','29','sms','sms','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1664','sms_setting','1663','sms','sms','sms_setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1665','sms_pay_history','1663','sms','sms','sms_pay_history','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1666','sms_buy_history','1663','sms','sms','sms_buy_history','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1667','sms_api','1663','sms','sms','sms_api','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1668','sms_sent','1663','sms','sms','sms_sent','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1669','kaoshi','0','kaoshi','index','int','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1670','kc','1669','kaoshi','kc','kc','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1671','kj','1669','st','st','st','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1672','xw','1669','xw','xw','xw','','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1673','pz','1669','pz','pz','pz','','5','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1674','tjkc','1670','kaoshi','index','kc','type=add','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1675','xgkc','1670','kaoshi','index','kc','type=edit','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1676','sckc','1670','kaoshi','index','kc','type=del','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1677','tjkj','1671','kaoshi','index','kj','type=add','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1678','xgkj','1671','kaoshi','index','kj','type=edit','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1679','sckj','1671','kaoshi','index','kj','type=del','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1680','stgl','1669','stgl','stgl','stgl','','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1681','tjst','1680','kaoshi','index','st','type=add','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1682','xgst','1680','kaoshi','index','st','type=edit','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1683','scst','1680','kaoshi','index','st','type=del','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1684','zftj','1672','kaoshi','index','tj','type=zftj','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1685','xmtj','1672','kaoshi','index','tj','type=mxtj','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1686','cxtj','1672','kaoshi','index','tj','type=cxtj','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1687','xtzt','1673','kaoshi','index','sys','type=xtzt','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1688','sdkg','1673','kaoshi','index','sys','type=sdkg','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1689','zdkg','1673','kaoshi','index','sys','type=zdkg','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1690','hygl','1669','kaoshi','index','member','type=list','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1691','hylb','1690','kaoshi','index','member','type=list','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1692','schy','1690','kaoshi','index','member','type=del','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1693','xtpz','1673','kaoshi','index','sys','type=jb','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1694','shhy','1690','kaoshi','index','member','type=sh','0','1','1','1','1','1','1');

DROP TABLE IF EXISTS `v9_message`;
CREATE TABLE `v9_message` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_from_id` char(30) NOT NULL DEFAULT '0',
  `send_to_id` char(30) NOT NULL DEFAULT '0',
  `folder` enum('all','inbox','outbox') NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_time` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL,
  `replyid` int(10) unsigned NOT NULL DEFAULT '0',
  `del_type` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`messageid`),
  KEY `msgtoid` (`send_to_id`,`folder`),
  KEY `replyid` (`replyid`),
  KEY `folder` (`send_from_id`,`folder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_message_data`;
CREATE TABLE `v9_message_data` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) NOT NULL,
  `group_message_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message` (`userid`,`group_message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_message_group`;
CREATE TABLE `v9_message_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL COMMENT '内容',
  `inputtime` int(10) unsigned DEFAULT '0',
  `status` tinyint(2) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_model`;
CREATE TABLE `v9_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL,
  `member_list_template` varchar(30) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `v9_model` VALUES('1','1','文章模型','','news','','0','0','1','0','default','category','list','show','','','','','0','0');
INSERT INTO `v9_model` VALUES('2','1','下载模型','','download','','0','0','1','0','default','category_download','list_download','show_download','','','','','0','0');
INSERT INTO `v9_model` VALUES('3','1','图片模型','','picture','','0','0','1','0','default','category_picture','list_picture','show_picture','','','','','0','0');
INSERT INTO `v9_model` VALUES('10','1','普通会员','普通会员','member_detail','','0','0','1','0','','','','','','','','','0','2');
INSERT INTO `v9_model` VALUES('11','1','视频模型','','video','','0','0','1','0','default','category_video','list_video','show_video','','','','','0','0');
INSERT INTO `v9_model` VALUES('12','1','学习课件','学习课件','kj','','0','0','1','0','default','category','list','show','','','','','0','0');

DROP TABLE IF EXISTS `v9_model_field`;
CREATE TABLE `v9_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

INSERT INTO `v9_model_field` VALUES('1','1','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('2','1','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('3','1','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('4','1','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('5','1','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('6','1','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('7','1','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('8','1','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('9','1','1','voteid','添加投票','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'text\\\' name=\\\'info[voteid]\\\' id=\\\'voteid\\\' value=\\\'{FIELD_VALUE}\\\' size=\\\'3\\\'> \r\n<input type=\\\'button\\\' value=\"选择已有投票\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=vote&c=vote&a=public_get_votelist&from_api=1\\\',\\\'选择已有投票\\\')\" class=\"button\">\r\n<input type=\\\'button\\\' value=\"新增投票\" onclick=\"omnipotent(\\\'addvote\\\',\\\'?m=vote&c=vote&a=add&from_api=1\\\',\\\'添加投票\\\',0)\" class=\"button\">\',\n  \'fieldtype\' => \'mediumint\',\n  \'minnumber\' => \'1\',\n)','','','','0','0','0','1','0','0','1','0','21','0','0');
INSERT INTO `v9_model_field` VALUES('10','1','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `v9_model_field` VALUES('11','1','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('12','1','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('13','1','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('14','1','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('15','1','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('16','1','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('17','1','1','groupids_view','阅读权限','','','0','0','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('18','1','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('19','1','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('20','1','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('21','1','1','copyfrom','来源','','','0','100','','','copyfrom','array (\n  \'defaultvalue\' => \'\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('80','1','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('22','2','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('23','2','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','1','0');
INSERT INTO `v9_model_field` VALUES('24','2','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('25','2','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('26','2','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('27','2','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('28','2','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('29','2','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('30','2','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('31','2','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','1','0');
INSERT INTO `v9_model_field` VALUES('32','2','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('33','2','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('34','2','1','groupids_view','阅读权限','','','0','0','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('35','2','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('36','2','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('37','2','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('38','2','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('39','2','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('40','2','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('41','2','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('42','2','1','downfiles','本地下载','','','0','0','','','downfiles','array (\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'10\',\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('43','2','1','downfile','镜像下载','','','0','0','','','downfile','array (\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'1\',\n)','','','','0','0','0','1','0','1','0','0','9','0','0');
INSERT INTO `v9_model_field` VALUES('44','2','1','systems','软件平台','<select name=\'selectSystem\' onchange=\"ChangeInput(this,document.myform.systems,\'/\')\">\r\n	<option value=\'WinXP\'>WinXP</option>\r\n	<option value=\'Vista\'>Windows 7</option>\r\n	<option value=\'Win2000\'>Win2000</option>\r\n	<option value=\'Win2003\'>Win2003</option>\r\n	<option value=\'Unix\'>Unix</option>\r\n	<option value=\'Linux\'>Linux</option>\r\n	<option value=\'MacOS\'>MacOS</option>\r\n</select>','','0','100','','','text','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'Win2000/WinXP/Win2003\',\n  \'ispassword\' => \'0\',\n)','','','','0','1','0','1','0','1','1','0','14','0','0');
INSERT INTO `v9_model_field` VALUES('45','2','1','copytype','软件授权形式','','','0','15','','','box','array (\n  \'options\' => \'免费版|免费版\r\n共享版|共享版\r\n试用版|试用版\r\n演示版|演示版\r\n注册版|注册版\r\n破解版|破解版\r\n零售版|零售版\r\nOEM版|OEM版\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'免费版\',\n)','','','','0','1','0','1','0','1','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('46','2','1','language','软件语言','','','0','16','','','box','array (\n  \'options\' => \'英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'简体中文\',\n)','','','','0','1','0','1','0','1','0','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('47','2','1','classtype','软件类型','','','0','20','','','box','array (\n  \'options\' => \'国产软件|国产软件\r\n国外软件|国外软件\r\n汉化补丁|汉化补丁\r\n程序源码|程序源码\r\n其他|其他\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'国产软件\',\n)','','','','0','1','0','1','0','1','0','0','17','0','0');
INSERT INTO `v9_model_field` VALUES('48','2','1','version','版本号','','','0','20','','','text','array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)','','','','0','1','0','0','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('49','2','1','filesize','文件大小','','','0','10','','','text','array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'未知\',\n  \'ispassword\' => \'0\',\n)','','','','0','1','0','0','0','1','1','0','14','0','0');
INSERT INTO `v9_model_field` VALUES('50','2','1','stars','评分等级','','','0','20','','','box','array (\n  \'options\' => \'★☆☆☆☆|★☆☆☆☆\r\n★★☆☆☆|★★☆☆☆\r\n★★★☆☆|★★★☆☆\r\n★★★★☆|★★★★☆\r\n★★★★★|★★★★★\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'★★★☆☆\',\n)','','','','0','1','0','1','0','1','0','0','17','0','0');
INSERT INTO `v9_model_field` VALUES('51','3','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('52','3','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('53','3','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('54','3','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('55','3','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('56','3','1','groupids_view','阅读权限','','','0','0','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('57','3','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('58','3','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `v9_model_field` VALUES('59','3','1','relation','相关组图','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('60','3','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('61','3','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','0','999999','','','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('62','3','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('63','3','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('64','3','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('65','3','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('66','3','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('67','3','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('68','3','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('69','3','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('70','3','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('71','3','1','pictureurls','组图','','','0','0','','','images','array (\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'upload_number\' => \'50\',\n)','','','','0','0','0','1','0','1','0','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('72','3','1','copyfrom','来源','','','0','0','','','copyfrom','array (\n  \'defaultvalue\' => \'\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('73','1','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','30','0','0');
INSERT INTO `v9_model_field` VALUES('74','2','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','30','0','0');
INSERT INTO `v9_model_field` VALUES('75','3','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','30','0','0');
INSERT INTO `v9_model_field` VALUES('83','10','1','birthday','生日','','','0','0','','生日格式错误','datetime','array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)','','','','0','0','0','0','0','1','1','0','0','0','0');
INSERT INTO `v9_model_field` VALUES('84','11','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('85','11','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('86','11','1','title','标题','','inputtitle','1','80','','请输入标题','title','array (\n)','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('87','11','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\n  \'size\' => \'100\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('88','11','1','description','摘要','','','0','255','','','textarea','array (\n  \'width\' => \'98\',\n  \'height\' => \'46\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('89','11','1','updatetime','更新时间','','','0','0','','','datetime','array (\n  \'dateformat\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('90','11','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','0','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'0\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('91','11','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('92','11','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('93','11','1','pages','分页方式','','','0','0','','','pages','array (\n)','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `v9_model_field` VALUES('94','11','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('95','11','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('96','11','1','groupids_view','阅读权限','','','0','100','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('97','11','1','url','URL','','','0','100','','','text','array (\n)','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('98','11','1','listorder','排序','','','0','6','','','number','array (\n)','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('99','11','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('100','11','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('101','11','1','status','状态','','','0','2','','','box','array (\n)','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('102','11','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('103','11','1','username','用户名','','','0','20','','','text','array (\n)','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('104','11','1','islink','转向链接','','','0','0','','','islink','array (\n)','','','','0','1','0','1','0','1','0','0','20','0','0');
INSERT INTO `v9_model_field` VALUES('105','11','1','video','视频上传','','','0','0','','','video','array (\n  \'upload_allowext\' => \'flv|rm|mp4|rmv\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('106','11','1','vision','画质','','','0','0','','','box','array (\n  \'options\' => \'高清|1\r\n普通|2\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)','','','','0','1','0','1','0','1','0','0','9','0','0');
INSERT INTO `v9_model_field` VALUES('107','11','1','video_category','视频分类','','','0','0','','','box','array (\n  \'options\' => \'喜剧|1\r\n爱情|2\r\n科幻|3\r\n剧情|4\r\n动作|5\r\n伦理|6\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)','','','','0','1','0','1','0','1','0','0','9','0','0');
INSERT INTO `v9_model_field` VALUES('111','12','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('112','12','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('113','12','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('114','12','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('115','12','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('116','12','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('117','12','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('118','12','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('119','12','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('120','12','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `v9_model_field` VALUES('121','12','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('122','12','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('123','12','1','groupids_view','阅读权限','','','0','100','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('124','12','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('125','12','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('126','12','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('127','12','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('128','12','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('129','12','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('130','12','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('131','12','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','1','0','1','0','0','20','0','0');
INSERT INTO `v9_model_field` VALUES('132','12','1','name','项目负责人','','','0','0','','','text','{\"size\":\"50\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}','','','','0','1','0','1','0','1','1','0','4','0','0');
INSERT INTO `v9_model_field` VALUES('133','12','1','place','项目负责人单位','','','0','0','','','text','{\"size\":\"50\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}','','','','0','1','0','1','0','1','1','0','4','0','0');
INSERT INTO `v9_model_field` VALUES('134','12','1','kjxssj','课件学习时间','输入完成课件所需要的<font color=\"red\">分钟</font>数','','0','0','/^[0-9-]+$/','','text','{\"size\":\"50\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}','','','','0','1','0','1','0','1','1','0','4','0','0');
INSERT INTO `v9_model_field` VALUES('138','12','1','kj','课件类别','','','0','0','','','omnipotent','{\"formtext\":\"{FUNC(kj~~{FIELD_VALUE})}\",\"fieldtype\":\"varchar\",\"minnumber\":\"1\"}','','','','0','0','0','1','0','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('137','12','1','pdf','课件上传','请上传PDF课件','','0','0','','','downfiles','{\"upload_allowext\":\"PDF\",\"isselectimage\":\"0\",\"upload_number\":\"10\",\"downloadlink\":\"0\",\"downloadtype\":\"0\"}','','','','0','0','0','1','0','1','0','0','5','0','0');
INSERT INTO `v9_model_field` VALUES('140','12','1','ks','可获得课时','','','0','0','/^[0-9.-]+$/','','text','{\"size\":\"50\",\"defaultvalue\":\"0\",\"ispassword\":\"0\"}','','','','0','1','0','1','0','1','1','0','4','0','0');

DROP TABLE IF EXISTS `v9_module`;
CREATE TABLE `v9_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `installdate` date NOT NULL DEFAULT '0000-00-00',
  `updatedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_module` VALUES('admin','admin','','1','1.0','','{\"admin_email\":\"phpcms@phpcms.cn\",\"maxloginfailedtimes\":\"8\",\"minrefreshtime\":\"2\",\"mail_type\":\"1\",\"mail_server\":\"smtp.qq.com\",\"mail_port\":\"25\",\"category_ajax\":\"0\",\"mail_user\":\"phpcms.cn@foxmail.com\",\"mail_auth\":\"1\",\"mail_from\":\"phpcms.cn@foxmail.com\",\"mail_password\":\"\",\"errorlog_size\":\"20\"}','0','0','2010-10-18','2010-10-18');
INSERT INTO `v9_module` VALUES('member','会员','','1','1.0','','array (\n  \'allowregister\' => \'1\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'registerverify\' => \'0\',\n  \'showapppoint\' => \'0\',\n  \'rmb_point_rate\' => \'10\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0\',\n  \'showregprotocol\' => \'0\',\n  \'regprotocol\' => \'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \',\n  \'registerverifymessage\' => \' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\',\n  \'forgetpassword\' => \' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\',\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('pay','支付','','1','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('digg','顶一下','','0','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('special','专题','','0','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('content','内容模块','','1','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('search','全站搜索','','0','1.0','','array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('scan','木马扫描','scan','0','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('attachment','附件','attachment','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('block','碎片','','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('collection','采集模块','collection','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('dbsource','数据源','','1','','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('template','模板风格','','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('release','发布点','','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('video','视频库','','0','1.0','','','0','0','2012-09-28','2012-09-28');
INSERT INTO `v9_module` VALUES('announce','公告','announce/','0','1.0','公告','','0','0','2016-01-25','2016-01-25');
INSERT INTO `v9_module` VALUES('comment','评论','comment/','0','1.0','评论','','0','0','2016-01-25','2016-01-25');
INSERT INTO `v9_module` VALUES('link','友情链接','','0','1.0','','array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('vote','投票','','0','1.0','','array (\r\n  1 => \r\n  array (\r\n    \'default_style\' => \'default\',\r\n    \'vote_tp_template\' => \'vote_tp\',\r\n    \'allowguest\' => \'1\',\r\n    \'enabled\' => \'1\',\r\n    \'interval\' => \'1\',\r\n    \'credit\' => \'1\',\r\n  ),\r\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('message','短消息','','0','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('mood','新闻心情','mood/','0','1.0','新闻心情','','0','0','2016-01-25','2016-01-25');
INSERT INTO `v9_module` VALUES('poster','广告模块','poster/','0','1.0','广告模块','','0','0','2016-01-25','2016-01-25');
INSERT INTO `v9_module` VALUES('formguide','表单向导','formguide/','0','1.0','formguide','array (\n  \'allowmultisubmit\' => \'1\',\n  \'interval\' => \'30\',\n  \'allowunreg\' => \'0\',\n  \'mailmessage\' => \'用户向我们提交了表单数据，赶快去看看吧。\',\n)','0','0','2010-10-20','2010-10-20');
INSERT INTO `v9_module` VALUES('wap','手机门户','wap/','0','1.0','手机门户','','0','0','2016-01-25','2016-01-25');
INSERT INTO `v9_module` VALUES('upgrade','在线升级','','0','1.0','','','0','0','2011-05-18','2011-05-18');
INSERT INTO `v9_module` VALUES('tag','标签向导','tag/','0','1.0','标签向导','','0','0','2016-01-25','2016-01-25');
INSERT INTO `v9_module` VALUES('sms','短信平台','sms/','0','1.0','短信平台','','0','0','2011-09-02','2011-09-02');

DROP TABLE IF EXISTS `v9_mood`;
CREATE TABLE `v9_mood` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `siteid` mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `contentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总数',
  `n1` int(10) unsigned NOT NULL DEFAULT '0',
  `n2` int(10) unsigned NOT NULL DEFAULT '0',
  `n3` int(10) unsigned NOT NULL DEFAULT '0',
  `n4` int(10) unsigned NOT NULL DEFAULT '0',
  `n5` int(10) unsigned NOT NULL DEFAULT '0',
  `n6` int(10) unsigned NOT NULL DEFAULT '0',
  `n7` int(10) unsigned NOT NULL DEFAULT '0',
  `n8` int(10) unsigned NOT NULL DEFAULT '0',
  `n9` int(10) unsigned NOT NULL DEFAULT '0',
  `n10` int(10) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `total` (`total`),
  KEY `lastupdate` (`lastupdate`),
  KEY `catid` (`catid`,`siteid`,`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_news`;
CREATE TABLE `v9_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

INSERT INTO `v9_news` VALUES('1','12','0','重庆市九龙坡区公共卫生和计划生育管理服务中心职责','','','单位 简介','一、机构性质及类别重庆市九龙坡区公共卫生和计划生育管理服务中心 为区卫生计生委所属正科级事业单位，经费渠道为区财政全额拨款，机构类   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=12&id=1','0','99','1','0','admin','1453709447','1460007634');
INSERT INTO `v9_news` VALUES('2','17','0','市卫计委屈谦主任带队赴新年调研第一站','','/uploadfile/2016/0126/20160126114052193.png','计委 第一站 主任','元月4日，市卫计委屈谦主任、王卫副主任带领卫计委办公室、医政处、规财处负责人一行5人驱车前往儿童医院礼嘉分院现场调研工作，院领导班子   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=17&id=2','0','99','1','0','admin','1453779610','1453779863');
INSERT INTO `v9_news` VALUES('3','17','0','市卫计委屈谦主任带队赴新年调研第一站','','/uploadfile/2016/0126/20160126114052193.png','计委 第一站 主任','元月4日，市卫计委屈谦主任、王卫副主任带领卫计委办公室、医政处、规财处负责人一行5人驱车前往儿童医院礼嘉分院现场调研工作，院领导班子   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=17&id=3','0','99','1','0','admin','1453779610','1453779863');
INSERT INTO `v9_news` VALUES('4','17','0','市卫计委屈谦主任带队赴新年调研第一站','','/uploadfile/2016/0126/20160126114052193.png','计委 第一站 主任','元月4日，市卫计委屈谦主任、王卫副主任带领卫计委办公室、医政处、规财处负责人一行5人驱车前往儿童医院礼嘉分院现场调研工作，院领导班子   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=17&id=4','0','99','1','0','admin','1453779610','1453779863');
INSERT INTO `v9_news` VALUES('5','17','0','市卫计委屈谦主任带队赴新年调研第一站','','/uploadfile/2016/0126/20160126114052193.png','计委 第一站 主任','元月4日，市卫计委屈谦主任、王卫副主任带领卫计委办公室、医政处、规财处负责人一行5人驱车前往儿童医院礼嘉分院现场调研工作，院领导班子   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=17&id=5','0','99','1','0','admin','1453779610','1453779863');
INSERT INTO `v9_news` VALUES('20','15','0','九龙坡区荣获全市卫生计生监督技能竞赛团体第一','','http://jxjy.90h. /uploadfile/2016/0316/20160316034432207.jpg','九龙坡区 全市 团体','    近日，由市总工会、市卫生计生委举办的全市卫生计生监督技能竞赛在合川区举行。我区卫生计生监督执法局在竞赛中荣获团体第一名。本   ','1','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=15&id=20','0','99','1','0','admin','1458113670','1458195822');
INSERT INTO `v9_news` VALUES('21','15','0','市卫生计生委调研指导九龙坡区医改工作','','http://jxjy.90h. /uploadfile/2016/0316/20160316034432207.jpg','九龙坡区 计生委 医改','   10月27日，市卫生计生委医改调研组何爱华巡视员一行到我区调研指导医药卫生体制改革工作。  此次市卫生计生委启动的卫生计生系统医   ','1','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=15&id=21','0','99','1','0','admin','1458113934','1458114291');
INSERT INTO `v9_news` VALUES('11','15','0','强化统筹 注重实效 扎实开展流动人口关怀关爱活动','','','流动人口 实效','为贯彻落实国家卫生计生委《关于做好元旦春节期间流动人口“关怀关爱”活动的通知》相关要求，重庆市卫生计生委高度重视，','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=15&id=11','0','99','1','0','admin','1458009415','1458009488');
INSERT INTO `v9_news` VALUES('28','24','0','2016全国生殖医学临床实践和研究论坛','','','生殖医学 全国 论坛','类型：会议时间：2016-03-18 08:00:00 至2016-03-20 20:00:00地点：北京市东城区北京内容：第四届全国生殖医学临床实践和研究论坛征文通   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=24&id=28','0','99','1','0','admin','1458612481','1458612508');
INSERT INTO `v9_news` VALUES('9','28','0','2016年继续教育的课程即将上线','','http://jxjy.90h. /uploadfile/2016/0316/20160316045245635.jpg','学术会 重庆市 中西医','2016年继续教育的课程即将上线。','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=28&id=9','0','99','1','0','admin','1457492161','1459839230');
INSERT INTO `v9_news` VALUES('10','29','0','如何在IE中中直接查看PDF文件,','','http://jxjy.90h. /images/pic-8.jpg','','如何在IE中中直接查看PDF文件','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=29&id=10','0','99','1','0','admin','1457492238','1460621570');
INSERT INTO `v9_news` VALUES('40','29','0','如何获得学分','','','学分','如何获得学分','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=29&id=40','0','99','1','0','admin','1460621609','1460621639');
INSERT INTO `v9_news` VALUES('12','15','0','全市卫生和计划生育工作会议召开','','','全市 会议','    2月26日，重庆市卫生和计划生育工作会议召开。主任屈谦作工作报告，党委书记盛娅农作总结讲话，副主任王卫主持会议。委领导尹祖海   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=15&id=12','0','99','1','0','admin','1458009559','1458009643');
INSERT INTO `v9_news` VALUES('13','15','0','政府购买卫生计生公共服务开始试点','','','公共服务 政府','    近日，国家卫生计生委发布《关于开展政府购买公共服务试点工作的通知》，要求每个省份选择3个～5个城市或地区开展政府购买公共服务   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=15&id=13','0','99','1','0','admin','1458009991','1458010028');
INSERT INTO `v9_news` VALUES('14','20','0','继续医学教育规定(试行)','','','医学教育','    第一章 总则第一条 为实施科教兴国战略，适应社会主义卫生事业发展需要，国家对卫生技术人员实行继续医学教育制度。依据《教育法   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=20&id=14','0','99','1','0','admin','1458010313','1458010362');
INSERT INTO `v9_news` VALUES('15','20','0','全国继续医学教育 “十五”计划','','','医学教育 全国','    21世纪是知识经济时代，是经济与社会加速发展、生命科学将取得重大突破的时代。实施继续医学教育是提高我国卫生队伍整体素质的重要   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=20&id=15','0','99','1','0','admin','1458010457','1458010501');
INSERT INTO `v9_news` VALUES('16','20','0','重庆市继续医学教育项目管理办法','','','重庆市 医学教育 管理办法','    为加强我市继续医学教育工作，不断提高卫生计生技术人员的专业素质和服务水平，根据《重庆市专业技术人员继续教育条例》和《重庆市   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=20&id=16','0','99','1','0','admin','1458010716','1458010934');
INSERT INTO `v9_news` VALUES('17','20','0','重庆市继续医学教育学分管理办法专技人员','','http://jxjy.90h. /uploadfile/2016/0315/20160315112849405.png','重庆市 医学教育 学分','','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=20&id=17','0','99','1','0','admin','1458012484','1458012791');
INSERT INTO `v9_news` VALUES('18','16','0','关于2016年全区护士执业资格考试报名工作有关事宜的通知','','','执业资格 全区 事宜','重庆市九龙坡区卫生和计划生育委员会关于2016年全区护士执业资格考试报名工作有关事宜的通知全区各卫生计生单位：为保证我区2016年护士执业   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=16&id=18','0','99','1','0','admin','1458113268','1458113316');
INSERT INTO `v9_news` VALUES('19','16','0','关于2016年度卫生专业技术资格考试报名工作的通知','','','资格考试 年度 专业','重庆市九龙坡区卫生和计划生育委员会关于2016年度卫生专业技术资格考试报名工作的通知全区各卫生计生单位、个体诊所：根据重庆市卫生专业技   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=16&id=19','0','99','1','0','admin','1458113415','1458113453');
INSERT INTO `v9_news` VALUES('22','15','0','捐一份热血 用爱心为生命加油','','','热血 爱心 生命','   随着经济社会的快速发展，社会保障制度逐步完善，医疗卫生水平日益提高，人民群众对健康的需求越来越迫切，临床用血需求不断增长，成   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=15&id=22','0','99','1','0','admin','1458114507','1458114574');
INSERT INTO `v9_news` VALUES('23','15','0','九龙坡区“十二五”期间卫生计生人才队伍建设成效显著','','','九龙坡区 队伍建设 成效','   一是积极探索人才引招育留机制。十二五期间，通过走出去、引进来措施、重点高校招聘、公开招聘及基层考核招聘等形式，共引进各级各类   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=15&id=23','0','99','1','0','admin','1458114803','1458114846');
INSERT INTO `v9_news` VALUES('24','15','0','区卫生计生委开展健康“定制”服务助力招商引资','','','计生委 招商引资','   加大招商引资力度，助力八大功能板块建设是当前全区的一项重要工作。近日，区卫生计生委立足行业特点，在金凤园区积极探索健康定制服   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=15&id=24','0','99','1','0','admin','1458114955','1458114997');
INSERT INTO `v9_news` VALUES('25','14','0','九龙坡区公共卫生和计划生育管理服务中心','','','九龙坡区 公共卫生 服务中心','九龙坡区公共卫生和计划生育管理服务中心关于相关科室职能职责   (一）公共卫生管理科  职能职责：负责贯彻落实公共卫生管理服务相关   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=14&id=25','0','99','1','0','admin','1458115474','1458115552');
INSERT INTO `v9_news` VALUES('27','24','0','第十五次全国妇科肿瘤学术会议','','','学术会议 妇科 肿瘤','类型：会议时间：2016-03-01 09:00:00 至2016-03-03 18:00:00地点：广东省广州市内容：会议日期2016-03-01至2016-03-03会议地点广东广州   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=24&id=27','0','99','1','0','admin','1458612432','1458612461');
INSERT INTO `v9_news` VALUES('29','24','0','2016年国际妇科癌症协会16两年一次的会议','','','妇科 癌症 协会','类型：会议时间：2016-10-29 08:00:00 至2016-10-31 18:00:00地点：海外侨胞海外侨胞葡萄牙-里斯本内容：　　一、2016年国际妇科癌症协   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=24&id=29','0','99','1','0','admin','1458612540','1458612635');
INSERT INTO `v9_news` VALUES('30','24','0','2016年美国妇产医师学院临床大会（ACOG）','','','妇产 美国 医师','类型：会议时间：2016-05-02 16:00:00 至2016-05-06 20:00:00地点：海外侨胞海外侨胞美国-旧金山-washington convention center(华盛   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=24&id=30','0','99','1','0','admin','1458612686','1458612711');
INSERT INTO `v9_news` VALUES('31','24','0','华夏医学泌尿生殖肿瘤论坛2016暨长城国际泌尿男科转化医学','','','医学 华夏 长城','  邀请函尊敬的同仁、朋友们：你们好！华夏医学泌尿生殖肿瘤论坛2016暨长城国际泌尿男科转化医学论坛2016（HMF-GUT 2016 &amp; GITAU 201   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=24&id=31','0','99','1','0','admin','1458612777','1458612800');
INSERT INTO `v9_news` VALUES('32','26','0','2015首届世界消化大会--初冬我们于南京欢迎您','','','南京 首届 大会','  消化领域的快速发展为消化疾病诊疗带来了革命性突破，各种新技术、新方法不断涌现。为进一步加强国内外新技术的学术交流，促进我国消化   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=26&id=32','0','99','1','0','admin','1458613144','1458613182');
INSERT INTO `v9_news` VALUES('33','26','0','《康复理疗师》岗位培训招生简章','','','岗位培训 招生简章','  十二五规划以来，我国已明确把康复保健和预防保健、基本医疗并列，纳入国家总体发展规划之中。为提高康复理疗行业从业人员的技术水平，   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=26&id=33','0','99','1','0','admin','1458613483','1458613509');
INSERT INTO `v9_news` VALUES('34','26','0','2015第七届国际心脏病大会','','','心脏病 大会 国际','  展望未来，昂扬奋进，展翅腾飞，为了进一步推动中国心血管相关疾病的学术和临床诊治发展，第七届国际心脏病大会（ICC）将于2015年12月4   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=26&id=34','0','99','1','0','admin','1458613523','1458613567');
INSERT INTO `v9_news` VALUES('35','26','0','2015第五届国际内分泌与代谢大会&2015第四届国际糖尿病学大','','','糖尿 国际 病学','  由百奥泰国际会议（大连）有限公司主办，安益集团--茵康国际会议股份有限公司作为支持单位的2015第五届国际内分泌与代谢大会、2015第四   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=26&id=35','0','99','1','0','admin','1458613999','1458614024');
INSERT INTO `v9_news` VALUES('36','25','0','关于开展养生保健师、康复理疗师职业培训的通知','','','养生保健 职业培训','  中华慢性病防治联合会以上医治未病的中华传统医学文化理念为宗旨，为进一步提高慢性病防治在卫生保健工作中的地位和作用，团结和促进世   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=25&id=36','0','99','1','0','admin','1458614041','1458614092');
INSERT INTO `v9_news` VALUES('37','25','0','第43期全国现代医院岗位设计绩效考核与管理高端培训班','','','培训班 绩效 高端','第43期全国现代医院岗位设计绩效考核与管理高端培训班【课程背景】卓越绩效模式是现代医院全面绩效管理与经营的科学化、标准化、规范化和常   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=25&id=37','0','99','1','0','admin','1458614106','1458614128');
INSERT INTO `v9_news` VALUES('38','25','0','“儿科重症监护实用技术及管理”培训班','','','培训班 重症 儿科','关于举办儿科重症监护实用技术及管理培训班通知国家级继续医学教育项目编号：2015-14-04-014(国)随着儿科医疗技术的发展，众多的监测、生命   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=25&id=38','0','99','1','0','admin','1458614146','1458614207');
INSERT INTO `v9_news` VALUES('39','25','0','2015年儿童血液肿瘤的治疗进展、全科医生儿科疾病诊治提高','','','儿科疾病 全科 肿瘤','一、组织机构主办单位：中华医学会北京分会，中国人民解放军总医院协办单位：中国出生缺陷干预救助基金会承办单位：汉唐博瑞国际咨询（北京   ','0','http://jxjy.90h.link/index.php?m=content&c=index&a=show&catid=25&id=39','0','99','1','0','admin','1458614251','1458614279');

DROP TABLE IF EXISTS `v9_news_data`;
CREATE TABLE `v9_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(100) NOT NULL DEFAULT '',
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_news_data` VALUES('1','<div style=\"text-align: center;\"><br />\r\n<span style=\"font-size:20px;\"><strong>重庆市九龙坡区公共卫生和计划生育管理服务中心职责</strong></span></div>\r\n<div><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; 一、机构性质及类别<br />\r\n&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp;&ldquo;重庆市九龙坡区公共卫生和计划生育管理服务中心&rdquo; 为区卫生计生委所属正科级事业单位，经费渠道为区财政全额拨款，机构类别为公益一类。<br />\r\n&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp;二、宗旨和主要职责</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;（一）宗旨</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;强化计生药具服务保障，提高公共卫生管理水平。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;（二）主要职责</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;负责贯彻落实公共卫生管理服务和计划生育药具管理相关法律、法规、规章和方针政策，研究提出发展本区公共卫生事业和计划生育药具管理的政策建议；具体实施全区专业公共卫生机构和医疗卫生机构落实农村卫生、社区卫生、疾病预防控制、健康教育与健康促进、妇幼保健、精神卫生等公共卫生服务工作的考核、评估工作，并按相关要求进行督导管理；指导、协调专业公共卫生机构和医疗卫生机构公共卫生业务工作；具体承办卫生和计划生育专业技术人员的培养培训和继续教育相关工作；负责拟定全区计划生育药具管理制度和编制全区计划生育药具需求计划；负责全区计划生育技术服务的药具仓贮、供应、发放以及质量管理工作；负责指导基层药具管理工作，培训药具管理人员，开展新药具的宣传、推广、服务，配合区卫生计生委对基层药具管理工作的考评；协同有关部门监督、管理本区计划生育药具零售市场；负责共公卫生管理和计划生育药具管理相关数据统计、信息报送、调研分析等工作。</div>\r\n<div style=\"text-align: center;\">&nbsp;</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('25','<div style=\"text-align: center;\"><span style=\"font-size:20px;\">九龙坡区公共卫生和计划生育管理服务中心关于相关科室职能职责</span></div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<div><strong>&nbsp; &nbsp; &nbsp; (一）公共卫生管理科</strong><br />\r\n&nbsp;</div>\r\n<div><strong>&nbsp; &nbsp; &nbsp;&nbsp;</strong>职能职责：负责贯彻落实公共卫生管理服务相关法律、法规、规章和方针政策建议，研究提出发展本区公共卫生事业的政策建议；具体实施全区专业公共卫生机构和医疗卫生机构落实农村卫生、社区卫生、疾病预防控制、健康教育与健康促进、妇幼保健、精神卫生等公共卫生服务工作的考核、评估工作，并按照相关要求进行督导管理；指导、协调专业公共卫生机构和医疗卫生机构公共卫生业务工作；负责公共卫生管理相关数据统计、信息报送、调研分析等工作；负责医疗事故鉴定相关法律、法规、程序、政策的贯彻落实及宣传；组织开展医疗事故鉴定工作；医疗事故鉴定专家库管理工作。<br />\r\n&nbsp;</div>\r\n<div><strong>&nbsp; &nbsp; &nbsp;&nbsp;</strong><strong>（二）计生药具管理科</strong><br />\r\n&nbsp;</div>\r\n<div><strong>&nbsp; &nbsp; &nbsp;&nbsp;</strong>职能职责：负责贯彻落实计划生育药具管理相关法律、法规、规章和方针政策，研究提出计划生育药具管理的政策建议；负责拟定全区计划生育药具管理制度和编制全区计划生育生育药具需求计划；负责全区计划生育技术服务的药具仓贮、供应、发放以及质量管理工作；负责指导基层药具管理工作；培训药具管理人员，开展新药具的宣传、推广、服务，配合区卫生计生委对基层药具管理工作的考评；协调有关部门监督、管理本区计划生育药具零售市场；负责计划生育药具管理相关数据统计、信息报送、调研分析等工作。<br />\r\n&nbsp;</div>\r\n<div><strong>&nbsp; &nbsp; &nbsp;&nbsp;</strong><strong>（三）药品采购管理科</strong><br />\r\n&nbsp;</div>\r\n<div><strong>&nbsp; &nbsp; &nbsp;&nbsp;</strong>职能职责：负责贯彻落实基本药物和非基本药物采购的相关法律、法规、规章、政策；根据上级的要求负责全区医疗卫生机构基本药物和非基本药物相关政策、管理办法的起草；负责全区医疗卫生机构药品集中采购的调研、指导、督导等工作；负责全区医疗卫生机构集中上线采购药品的筛选、药款的支付、协调沟通等管理；负责全区医疗卫生机构药品集中采购相关数据统计、信息报送、调研分析等工作。<br />\r\n&nbsp;</div>\r\n<div><strong>&nbsp; &nbsp; &nbsp;&nbsp;</strong><strong>（四）继教培训科</strong><br />\r\n&nbsp;</div>\r\n<div><strong>&nbsp; &nbsp; &nbsp;&nbsp;</strong>职能职责：具体承办卫生和计划生育专业技术人员的培养培训和继续教育相关工作；负责专业技术委员会相关工作；负责开展及宣传无偿献血工作；负责卫考、护考、医考报名现场确认工作。</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('27','<a href=\"http://yyq.haoyisheng.com/wap/action.php?m_sid=&amp;ac=supers&amp;eventid=297&amp;uid=3507277###\">类型：会议</a>\r\n<div><a href=\"http://yyq.haoyisheng.com/wap/action.php?m_sid=&amp;ac=supers&amp;eventid=297&amp;uid=3507277###\">时间：2016-03-01 09:00:00 至2016-03-03 18:00:00</a><br />\r\n<a href=\"http://yyq.haoyisheng.com/wap/action.php?m_sid=&amp;ac=supers&amp;eventid=297&amp;uid=3507277###\">地点：广东省&nbsp;广州市&nbsp;</a><br />\r\n<div>&nbsp;</div>\r\n</div>\r\n<div>内容：<br />\r\n会议日期&nbsp;2016-03-01至&nbsp;2016-03-03<br />\r\n会议地点&nbsp;广东广州<br />\r\n会议学科&nbsp;其他临床专科<br />\r\n主办单位&nbsp;中华医学会<br />\r\n&nbsp;<br />\r\n&nbsp; &nbsp; &nbsp;中华医学会第十五次全国妇科肿瘤学术会议将在2016-03-01广东召开。　　<br />\r\n&nbsp;<br />\r\n&nbsp; &nbsp; &nbsp;中华医学会第十五次全国妇科肿瘤学术会议将充分发挥学会的作用，&nbsp;对一年来的学科发展进行总结，对今后的发展提出要求。&nbsp;大会将是中国妇科肿瘤学界的盛事，是旗帜性的会议。<br />\r\n&nbsp;<br />\r\n&nbsp; &nbsp; &nbsp;会议目的：<br />\r\n&nbsp;<br />\r\n　　1、&nbsp;促进中国妇科肿瘤学的发展<br />\r\n&nbsp;<br />\r\n　　2、&nbsp;探讨妇科肿瘤相关问题的进展<br />\r\n&nbsp;<br />\r\n　　3、&nbsp;建立妇科肿瘤今后研究的发展方向及临床科研合作的方法<br />\r\n&nbsp;<br />\r\n　　4、&nbsp;推广微创外科、&nbsp;介入、&nbsp;及其他治疗的应用及规范<br />\r\n&nbsp;<br />\r\n　　5、&nbsp;交流妇科肿瘤治疗的临床体会<br />\r\n&nbsp;<br />\r\n　　6、&nbsp;对全国每年一度的妇科肿瘤专业进行总结<br />\r\n&nbsp;<br />\r\n　　联系人：冯少玲<br />\r\n&nbsp;<br />\r\n　　联系电话：010-8515812</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('28','<a href=\"http://yyq.haoyisheng.com/wap/action.php?m_sid=&amp;ac=supers&amp;eventid=269&amp;uid=3507273###\" style=\"font-family: Helvetica, \'Microsoft Yahei\'; font-size: 14px; line-height: 22px; widows: auto; color: rgb(51, 51, 51); text-decoration: none; outline: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); transition: all 0.3s;\">类型：会议</a>\r\n<div class=\"hc_test\" style=\"font-size: 14px; color: rgb(94, 94, 94); line-height: 22px; padding: 14.7188px 0px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(229, 229, 229); margin-bottom: 22.0781px; font-family: Helvetica, \'Microsoft Yahei\'; widows: auto;\">\r\n<p style=\"margin: 14.71875px 0px; padding: 0px;\"><a href=\"http://yyq.haoyisheng.com/wap/action.php?m_sid=&amp;ac=supers&amp;eventid=269&amp;uid=3507273###\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-transition: all 0.3s; transition: all 0.3s;\">时间：2016-03-18 08:00:00 至2016-03-20 20:00:00</a></p>\r\n<p style=\"margin: 14.71875px 0px; padding: 0px;\"><a href=\"http://yyq.haoyisheng.com/wap/action.php?m_sid=&amp;ac=supers&amp;eventid=269&amp;uid=3507273###\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-transition: all 0.3s; transition: all 0.3s;\">地点：北京市&nbsp;东城区&nbsp;北京</a></p>\r\n<div class=\"hy_btn\" style=\"margin: 7.359375px 0px;\">&nbsp;</div>\r\n</div>\r\n<div class=\"test_detail he_auto\" style=\"color: rgb(132, 132, 132); font-size: 14px; line-height: 20px; margin: 5px 0px; max-height: none; font-family: Helvetica, \'Microsoft Yahei\'; widows: auto;\">内容：<br />\r\n<div style=\"text-align: center;\"><span style=\"line-height: 1.8em;\">第四届全国生殖医学临床实践和研究论坛征文通知</span></div>\r\n<div>&nbsp; &nbsp; 各有关单位：《第四届全国生殖医学临床实践和研究论坛》将于2016年3月18-20日在北京举办，预计将有500余名与生殖医学相关的医师参加此次论坛。本次大会将承接前三届论坛一贯的办会精神，邀请国内知名专家、教授、学者共聚一堂，围绕妇科生殖内分泌疾病诊治、不孕不育的治疗、男性疾病诊治、生殖遗传、避孕节育及辅助生殖技术等领域的前沿及热点问题进行全方位、多角度的学术交流和探讨。\r\n<div>&nbsp; &nbsp; 本次论坛将设：</div>\r\n</div>\r\n<blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n	<div><span style=\"line-height: 1.8em;\">女性生殖内分泌与不孕不育论坛</span></div>\r\n	<div><span style=\"line-height: 1.8em;\">男性生殖医学论坛</span></div>\r\n	<div><span style=\"line-height: 1.8em;\">计划生育与生殖保健适宜技术论坛</span></div>\r\n	<div><span style=\"line-height: 1.8em;\">生殖外科论坛辅助生殖论坛</span></div>\r\n	<div><span style=\"line-height: 1.8em;\">中药与不孕不育论坛</span></div>\r\n</blockquote>\r\n<div>一、征文内容如下：</div>\r\n<blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n	<span style=\"line-height: 1.8em;\">1.涉及生殖临床学；生殖实验室技术、基础研究；生殖男科学、人类精子库；生殖伦理、管理学、护理学等涉及生殖医学的基础研究和临床研究及相关问题探索等：</span></blockquote>\r\n<div><span style=\"line-height: 1.8em;\">二、征文要求：</span></div>\r\n<blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n	<span style=\"line-height: 1.8em;\">1.凡未在国家级以上学术会议或杂志上公开发表过的学术论文均可投寄。论文要求具有科学性、实用性，论据充分、文字精练、重点突出。</span><br />\r\n	<span style=\"line-height: 1.8em;\">2.论文请书写全文，摘要文体采用结构式，包括目的、方法、结果、结论；无摘要的论文不予授理；论文应写清楚题目、作者姓名、单位、邮编；请自留底稿，恕不退稿。</span><br />\r\n	<span style=\"line-height: 1.8em;\">3.来稿一律请用word方式发送至E-mail：xieheyiyuan1921@126.com。请务必在电子邮件主题上注明&ldquo;投稿&rdquo;字样。</span><br />\r\n	<span style=\"line-height: 1.8em;\">4.截稿日期：2016年2月28日。</span><br />\r\n	<span style=\"line-height: 1.8em;\">5.本次大会论文将汇编成册，颁发证书，优秀论文将推荐在《生殖医学杂志》及中华医学会《中华临床医师杂志（电子版）》上发表，并颁发论文证书。</span>\r\n	<div><span style=\"line-height: 1.8em;\">6.录取论文的第一作者，将发给参加会议论文录用通知。</span></div>\r\n</blockquote>\r\n<div>三、参会对象：</div>\r\n<blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n	<div>1．各级医院从事生殖医学的临床医生、护士、实验室人员。</div>\r\n	<div>2．从事遗传、男科、妇产科、外科、微创、腔镜等相关专业的医生、护士和实验室人员。</div>\r\n	<div>3、各级人口卫生计生委及科研院所，人口计生委技术服务机构相关人员。</div>\r\n</blockquote>\r\n<div>五、组委会秘书处：</div>\r\n<blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n	<div>组委会电话/传真：010-51956860 &nbsp; &nbsp;13366622096</div>\r\n	<div>联系人：王红翔 杨志强&nbsp;</div>\r\n</blockquote>\r\n<blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n	<div>第四届全国生殖医学临床实践和研究论坛组委会&nbsp;</div>\r\n	<div>2015年10月27日</div>\r\n</blockquote>\r\n</div>\r\n<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('2','&nbsp;&nbsp;&nbsp;<img alt=\"\" src=\"/uploadfile/2016/0126/20160126114416873.png\" style=\"width: 550px; height: 294px;\" /><br />\r\n<br />\r\n元月4日，市卫计委屈谦主任、王卫副主任带领卫计委办公室、医政处、规财处负责人一行5人驱车前往儿童医院礼嘉分院现场调研工作，院领导班子、两办主任、分院管理干部等陪同调研。市卫计委屈谦主任主持会议。<br />\r\n&nbsp;&nbsp;&nbsp; 隆冬时节，会议室内气氛却是热烈的。儿童医院谭大兵副院长详细汇报分院建设的规划、设计以及因轻轨修建而带来的重大变更情况，分析现阶段分院建设中存在的涉及人、财、物的问题。分院综合办唐时奎主任报告了分院前期试运行、病房筹备期的亮点工作、成效及下一步需要完善的问题。<br />\r\n&nbsp;&nbsp;&nbsp; 李廷玉院长向调研组全面介绍医院的发展史，本院与分院发展理念及规划。她感谢市政府、市卫计委对分院建设的关心和支持，汇报了院领导班子一贯重视科研与国际合作，重视临床建设与公益事业，坚持立足重庆，服务西部，面向全国。近年来，医院收获5个国家重点专业、教育部重点实验室、国家食品药品监督管理局药物临床试验机构、国家国际科技合作基地，群众满意的卫生机构、全国精神文明集体等荣誉称号，成为儿童医院三甲标准制定单位之一、国家区域儿童医疗中心标准制定单位之一、儿童医院建设标准制定单位之一。<br />\r\n&nbsp;&nbsp;&nbsp; 李院长介绍，尽管医院本部有1400张床位，但仍有160余名患儿因床位不足，无法得到及时救治，她呼吁上级领导在制定区域医疗战略规划时，充分考虑我市的儿童医院在应对医疗服务、公共安全、家庭二胎潮等方面存在的困难，能予以政策和资金的支持、扶助。市卫计委调研组成员针对分院规划建设提出建议。<br />\r\n屈谦主任在总结中首先向全体儿院人送上新年的问候，肯定儿童医院发展取得的成绩和院领导班子对分院发展的定位规划，明确要按照西部地区国家级儿童医学中心的要求和标准来规划和建设医院。儿童医院是西部儿童医学中心，在发展中要充分考虑本部与分院协同性，在分院建设中，充分考虑传染救治与儿童急救的规划布局，在符合规划的要求下分阶段、分步骤、渐进式推进分院建设与发展。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('3','&nbsp;&nbsp;&nbsp;<img alt=\"\" src=\"/uploadfile/2016/0126/20160126114416873.png\" style=\"width: 550px; height: 294px;\" /><br />\r\n<br />\r\n元月4日，市卫计委屈谦主任、王卫副主任带领卫计委办公室、医政处、规财处负责人一行5人驱车前往儿童医院礼嘉分院现场调研工作，院领导班子、两办主任、分院管理干部等陪同调研。市卫计委屈谦主任主持会议。<br />\r\n&nbsp;&nbsp;&nbsp; 隆冬时节，会议室内气氛却是热烈的。儿童医院谭大兵副院长详细汇报分院建设的规划、设计以及因轻轨修建而带来的重大变更情况，分析现阶段分院建设中存在的涉及人、财、物的问题。分院综合办唐时奎主任报告了分院前期试运行、病房筹备期的亮点工作、成效及下一步需要完善的问题。<br />\r\n&nbsp;&nbsp;&nbsp; 李廷玉院长向调研组全面介绍医院的发展史，本院与分院发展理念及规划。她感谢市政府、市卫计委对分院建设的关心和支持，汇报了院领导班子一贯重视科研与国际合作，重视临床建设与公益事业，坚持立足重庆，服务西部，面向全国。近年来，医院收获5个国家重点专业、教育部重点实验室、国家食品药品监督管理局药物临床试验机构、国家国际科技合作基地，群众满意的卫生机构、全国精神文明集体等荣誉称号，成为儿童医院三甲标准制定单位之一、国家区域儿童医疗中心标准制定单位之一、儿童医院建设标准制定单位之一。<br />\r\n&nbsp;&nbsp;&nbsp; 李院长介绍，尽管医院本部有1400张床位，但仍有160余名患儿因床位不足，无法得到及时救治，她呼吁上级领导在制定区域医疗战略规划时，充分考虑我市的儿童医院在应对医疗服务、公共安全、家庭二胎潮等方面存在的困难，能予以政策和资金的支持、扶助。市卫计委调研组成员针对分院规划建设提出建议。<br />\r\n屈谦主任在总结中首先向全体儿院人送上新年的问候，肯定儿童医院发展取得的成绩和院领导班子对分院发展的定位规划，明确要按照西部地区国家级儿童医学中心的要求和标准来规划和建设医院。儿童医院是西部儿童医学中心，在发展中要充分考虑本部与分院协同性，在分院建设中，充分考虑传染救治与儿童急救的规划布局，在符合规划的要求下分阶段、分步骤、渐进式推进分院建设与发展。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('4','&nbsp;&nbsp;&nbsp;<img alt=\"\" src=\"/uploadfile/2016/0126/20160126114416873.png\" style=\"width: 550px; height: 294px;\" /><br />\r\n<br />\r\n元月4日，市卫计委屈谦主任、王卫副主任带领卫计委办公室、医政处、规财处负责人一行5人驱车前往儿童医院礼嘉分院现场调研工作，院领导班子、两办主任、分院管理干部等陪同调研。市卫计委屈谦主任主持会议。<br />\r\n&nbsp;&nbsp;&nbsp; 隆冬时节，会议室内气氛却是热烈的。儿童医院谭大兵副院长详细汇报分院建设的规划、设计以及因轻轨修建而带来的重大变更情况，分析现阶段分院建设中存在的涉及人、财、物的问题。分院综合办唐时奎主任报告了分院前期试运行、病房筹备期的亮点工作、成效及下一步需要完善的问题。<br />\r\n&nbsp;&nbsp;&nbsp; 李廷玉院长向调研组全面介绍医院的发展史，本院与分院发展理念及规划。她感谢市政府、市卫计委对分院建设的关心和支持，汇报了院领导班子一贯重视科研与国际合作，重视临床建设与公益事业，坚持立足重庆，服务西部，面向全国。近年来，医院收获5个国家重点专业、教育部重点实验室、国家食品药品监督管理局药物临床试验机构、国家国际科技合作基地，群众满意的卫生机构、全国精神文明集体等荣誉称号，成为儿童医院三甲标准制定单位之一、国家区域儿童医疗中心标准制定单位之一、儿童医院建设标准制定单位之一。<br />\r\n&nbsp;&nbsp;&nbsp; 李院长介绍，尽管医院本部有1400张床位，但仍有160余名患儿因床位不足，无法得到及时救治，她呼吁上级领导在制定区域医疗战略规划时，充分考虑我市的儿童医院在应对医疗服务、公共安全、家庭二胎潮等方面存在的困难，能予以政策和资金的支持、扶助。市卫计委调研组成员针对分院规划建设提出建议。<br />\r\n屈谦主任在总结中首先向全体儿院人送上新年的问候，肯定儿童医院发展取得的成绩和院领导班子对分院发展的定位规划，明确要按照西部地区国家级儿童医学中心的要求和标准来规划和建设医院。儿童医院是西部儿童医学中心，在发展中要充分考虑本部与分院协同性，在分院建设中，充分考虑传染救治与儿童急救的规划布局，在符合规划的要求下分阶段、分步骤、渐进式推进分院建设与发展。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('5','&nbsp;&nbsp;&nbsp;<img alt=\"\" src=\"/uploadfile/2016/0126/20160126114416873.png\" style=\"width: 550px; height: 294px;\" /><br />\r\n<br />\r\n元月4日，市卫计委屈谦主任、王卫副主任带领卫计委办公室、医政处、规财处负责人一行5人驱车前往儿童医院礼嘉分院现场调研工作，院领导班子、两办主任、分院管理干部等陪同调研。市卫计委屈谦主任主持会议。<br />\r\n&nbsp;&nbsp;&nbsp; 隆冬时节，会议室内气氛却是热烈的。儿童医院谭大兵副院长详细汇报分院建设的规划、设计以及因轻轨修建而带来的重大变更情况，分析现阶段分院建设中存在的涉及人、财、物的问题。分院综合办唐时奎主任报告了分院前期试运行、病房筹备期的亮点工作、成效及下一步需要完善的问题。<br />\r\n&nbsp;&nbsp;&nbsp; 李廷玉院长向调研组全面介绍医院的发展史，本院与分院发展理念及规划。她感谢市政府、市卫计委对分院建设的关心和支持，汇报了院领导班子一贯重视科研与国际合作，重视临床建设与公益事业，坚持立足重庆，服务西部，面向全国。近年来，医院收获5个国家重点专业、教育部重点实验室、国家食品药品监督管理局药物临床试验机构、国家国际科技合作基地，群众满意的卫生机构、全国精神文明集体等荣誉称号，成为儿童医院三甲标准制定单位之一、国家区域儿童医疗中心标准制定单位之一、儿童医院建设标准制定单位之一。<br />\r\n&nbsp;&nbsp;&nbsp; 李院长介绍，尽管医院本部有1400张床位，但仍有160余名患儿因床位不足，无法得到及时救治，她呼吁上级领导在制定区域医疗战略规划时，充分考虑我市的儿童医院在应对医疗服务、公共安全、家庭二胎潮等方面存在的困难，能予以政策和资金的支持、扶助。市卫计委调研组成员针对分院规划建设提出建议。<br />\r\n屈谦主任在总结中首先向全体儿院人送上新年的问候，肯定儿童医院发展取得的成绩和院领导班子对分院发展的定位规划，明确要按照西部地区国家级儿童医学中心的要求和标准来规划和建设医院。儿童医院是西部儿童医学中心，在发展中要充分考虑本部与分院协同性，在分院建设中，充分考虑传染救治与儿童急救的规划布局，在符合规划的要求下分阶段、分步骤、渐进式推进分院建设与发展。<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('20','&nbsp; &nbsp; &nbsp; &nbsp; 近日，由市总工会、市卫生计生委举办的全市卫生计生监督技能竞赛在合川区举行。我区卫生计生监督执法局在竞赛中荣获团体第一名。本次竞赛分为医疗监督、传染病防治监督、公共卫生监督、放射诊疗和职业卫生监督、计划生育监督等5个项目，团体赛包括闭卷笔试、知识竞答和录像模拟执法竞赛等三个部分，代表我区参赛的5名同志，在各个环节中沉着应战，以优异成绩全部进入个人赛决赛，并在参赛的38个区县中脱颖而出，荣获团体赛总分第一。&nbsp;<br />\r\n<br />\r\n<div style=\"text-align: center;\">&nbsp;</div>\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/uploadfile/2016/0316/20160316033844651.jpg\" style=\"width: 652px; height: 434px;\" /></div>\r\n<div style=\"text-align: center;\">&nbsp;</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('21','&nbsp; &nbsp; &nbsp; 10月27日，市卫生计生委医改调研组何爱华巡视员一行到我区调研指导医药卫生体制改革工作。<br />\r\n<br />\r\n<div>&nbsp; &nbsp; &nbsp;&nbsp;此次市卫生计生委启动的卫生计生系统医改专题调研，是贯彻落实国务院的相关部署，深入基层、了解情况，加强对深化医改工作的调查研究和医改成效的总结宣传，梳理可向全国推广的典型经验和可上升为政策制度的改革举措。同时，认真查找医改和卫生计生工作中存在的不足和仍需完善的政策措施，推动各项措施尽快实施、尽快落地、尽快见效。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;当天，何爱华巡视员先后来到西彭镇卫生院、区人民医院西城院区，就医院的基本公共卫生服务、分级诊疗推进情况、基层医疗机构综合改革等内容进行实地调研指导。并召开了医改工作座谈会，深入了解了我区卫生计生工作和医改情况，并对我区卫生计生工作及医改工作所取得的成绩给予充分肯定，认为九龙坡区在医改工作上，切实做到了&ldquo;彰显公益性、保障均衡性、调动积极性、决策科学性、改革成效性&rdquo;。希望九龙坡区继续强化医改成效，不断完善制度体系，在医改工作方面取得新突破，切实为老百姓服好务。<br />\r\n&nbsp;</div>\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/uploadfile/2016/0316/20160316034432207.jpg\" style=\"width: 624px; height: 414px;\" /></div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('22','&nbsp; &nbsp; &nbsp; 随着经济社会的快速发展，社会保障制度逐步完善，医疗卫生水平日益提高，人民群众对健康的需求越来越迫切，临床用血需求不断增长，成千上万的病患需要血液救命，但是，在科学技术不能制造出人类血液的今天，临床用血只能来自健康人体，依靠人们用爱心提供。2016年1月15日上午，九龙坡区献血办组织了一场区内机关干部无偿献血活动，为不影响献血者的工作，将献血现场搬到了办公楼下。<br />\r\n<br />\r\n<div>&nbsp; &nbsp; &nbsp;&nbsp;上午8点多钟，献血工作刚刚开始，在区政府大门旁的献血现场已经排成了一支队伍，不少机关干部都争先赶在上班前来献血，这样既不耽误工作又能为等待用血的病患送上一份爱心。大家都对无偿献血报以极大的热情：&ldquo;献血是利人利己的好事，我每年都坚持献血&rdquo;、&ldquo;现在这个时候血液紧张，我作为党员更要带头来献血了。&rdquo;&hellip;&hellip;在现场听到了各种正能量的谈话声。人群中有区政府领导、区级部门领导，人民干部带头捐献自己的鲜血，发挥先锋模范作用，用实际行动落实民生，又为多少濒临死亡的生命带来了希望。此次市血液中心共采血19700ml。<br />\r\n&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp;&nbsp;冬季用血高峰，血液紧张现象还在持续，九龙坡区献血办温馨提示：希望更多的爱心人士能参与到无偿献血中来，为这个春节增添一份温暖。九龙坡区献血办联系电话：89068580。</div>\r\n<div>供稿：九龙坡区献血办</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('23','&nbsp; &nbsp; &nbsp; 一是积极探索人才引招育留机制。&ldquo;十二五&rdquo;期间，通过&ldquo;走出去、引进来&rdquo;措施、重点高校招聘、公开招聘及基层考核招聘等形式，共引进各级各类人才483名，其中：正高4名，副高40名，博士后1名，博士5名。在卫生人才中有3名专家人才获得国家级专委会委员称号，25名人才被评为学科带头人，2名人才被评选为&ldquo;西部之光访问学者&rdquo;，先后13名专家人才被评为九龙坡区突出贡献专家。二是加强自身建设实现自我造血。按照&ldquo;全面覆盖、夯实基础、提升高端、深化管理&rdquo;的卫生人才培训思路，每年安排100万元人才专项培训经费用于人才队伍培训工作。&ldquo;十二五&rdquo;期间，组织开展了各级各类培训等近140期1.3万余人次。每年投入专项资金80余万元用于卫生人才基地的软硬件建设和师资带教培训补助，先后获得重庆市全科医学住院医师规范化培训基地2个，中医类别全科医师规范化培训基地1个，全科医师规范化培训实践基地3个，其中：石桥铺社区卫生服务中心被中国社区卫生协会授予&ldquo;人民满意社区卫生服务中心&rdquo;的称号，走马镇卫生院被国家卫计委授予&ldquo;人民群众满意的乡镇卫生院&rdquo;。三是加强医学科技建设推进卫生科技进步。&ldquo;十二五&rdquo;期间，成功申报市级科研项目51项、市级中医科研项目8项、区级软科学49项，社会事业类科研项目58项，市级科研项目结题22项、市级中医科研项目结题4项、区级软科学结题39项，社会事业类科研项目结题32项；2011年，区中医院成功申报九龙坡区区事业单位中的首个博士后工作站，2012年获得两项市卫计委医学科技成果奖三等奖。&ldquo;十二五&rdquo;期间全系统发表SCI论文 4篇。四是探索重点人才项目建设。强化以项目为抓手，推动人才工作目标任务的落实，实施区重点人才项目3项。&ldquo;十二五&rdquo;期间，全区累计完成全科医师规范化、转岗培训165人，平均每万名城乡居民配备全科医生1.19人；全区镇卫生院累计选派参加住院医师规范化培训达50人。五是探索基层全科建设机制。出台《九龙坡区关于建立全科医生制度的实施意见》、《九龙坡区关于加强基层卫生机构人才队伍建设实施意见》，创新推行基层医疗卫生机构&ldquo;五大政策&rdquo;，即&ldquo;非编人员补助政策&rdquo;、&ldquo;医务人员激励政策&rdquo;、&ldquo;专家基层服务补偿政策&rdquo;、&ldquo;有序就诊患者奖励政策&rdquo;、&ldquo;全科医生专项补助政策&rdquo;。 &nbsp;','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('9','2016年继续教育的课程即将上线。','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('10','如何在IE中中直接查看PDF文件。 &nbsp; &nbsp;<br />\r\n<br />\r\n<img alt=\"\" src=\"http://jxjy.90h.link/uploadfile/2016/0414/20160414041229485.jpg\" style=\"width: 765px; height: 809px;\" /><br />\r\n<img alt=\"\" src=\"http://jxjy.90h.link/uploadfile/2016/0414/20160414041247497.jpg\" style=\"width: 708px; height: 774px;\" /><br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('40','如何获得学分','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('11','&nbsp; &nbsp; &nbsp; &nbsp; 为贯彻落实国家卫生计生委《关于做好元旦春节期间流动人口&ldquo;关怀关爱&rdquo;活动的通知》相关要求，重庆市卫生计生委高度重视，认真学习领会国家卫生计生委副主任王培安在2016年流动人口关怀关爱活动启动仪式上的讲话精神，结合重庆市流动人口特点，在元旦春节期间利用外出务工集中返乡的有利时机，扎实开展流动人口关怀关爱活动，取得较好成效。<br />\r\n<br />\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;一是加强组织，推进活动有序开展。年初，市卫生计生委下发《关于做好近期工作的通知》，明确各地要在元旦春节期间开展流动人口关怀关爱活动。为确保活动效果，市卫生计生委成立活动领导小组，制定工作方案，于1月30日在渝北区开展流动人口关怀关爱活动启动仪式。主城区及区域中心城市结合流动人口多、相对集中的特点，在本地中心广场或集贸市场等流动人口聚集地先后启动活动仪式，远郊区县根据本地地理条件受限、流动人口较为分散等特点，在赶场日启动活动。<br />\r\n&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;二是深化宣传，营造良好社会氛围。重庆电视台、重庆广播电台、重庆大渝网、重庆晨报、商报、时报等媒体开设卫生计生专栏，对流动人口卫生计生相关政策法律法规、流动人口婚育证明办理、流动人口均等化服务等定期宣传；&ldquo;12320&rdquo;、&ldquo;12356&rdquo;卫生计生热线24小时实施人工咨询服务；各地加强宣传阵地建设，优化宣传内容，更新宣传手册、标语、横幅，出动宣传车，组织文艺汇演等形式及时宣传，进一步提高广大群众对卫生计生政策知识的知晓率，有效提高群众参与卫生计生服务的主动性和积极性。<br />\r\n&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;三是注重实效，切实把关怀关爱落到实处。坚持把&ldquo;返乡农民工，留守老人、妇女、儿童及流入地过节的流动人口&rdquo;作为走访慰问的重点。全市卫生计生部门各级领导采取分头实施、分片负责的方式，深入村社和工作一线，慰问部分流动人口困难家庭、留守老人和留守儿童；主城各区针对在流入地过节的流动人口较多的实情，开设亲情房、开展联谊会、发放服务卡等增强外来流动人口的归属感，远郊区县针对返乡流动人口多的特点，举办就业专场招聘会、技能培训等增强流动人口就业能力；全市40个区县有30个区县修订有关政策，为返乡农民工在种养植业、创办微型企业等方面出台减免税收、政府补贴等优惠政策；各地在流动人口集中地，有组织有计划开展健康专题讲座，组织医护人员为流动人口免费健康义诊、生殖健康检查及计生咨询，为适龄儿童进行疫苗查漏补种；各乡镇（街）办事大厅集中开设&ldquo;一站式&rdquo;办工，简化资料和程序，对不能亲临现场办理，实施委托代办或上门服务。</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('12','&nbsp; &nbsp; &nbsp; &nbsp; 2月26日，重庆市卫生和计划生育工作会议召开。主任屈谦作工作报告，党委书记盛娅农作总结讲话，副主任王卫主持会议。委领导尹祖海、刘克佳、刘文华，副巡视员张志坚、唐亚辉出席会议。<br />\r\n<br />\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;屈谦在报告中指出，&ldquo;十二五&rdquo;以来，医药卫生体制改革逐步深化，计划生育政策实现重大调整，城乡居民健康素质稳步提升，群众就医条件明显改善，中医药事业发展迈上新台阶。2015年，深化医改取得新的进展，单独两孩政策稳妥实施，公共卫生保障能力不断加强，医疗卫生服务水平和质量持续提升，中医药特色优势不断巩固，其他各项重点工作统筹推进。他要求，未来5年要全面落实&ldquo;四个全面&rdquo;战略布局，牢固树立五大发展理念，深入实施五大功能区域发展战略，以增进群众的健康素质为出发点，加快医药卫生体制改革，改革完善计划生育服务管理，实现人人享有基本医疗卫生服务。他强调，要认真学习贯彻习近平总书记视察重庆时的重要讲话精神，落实全国卫生计生工作会议和市委、市政府决策部署，坚持保基本、强基层、建机制、补短板，扎实推进（省）级综合改革试点，全面抓好卫生计生各项工作。要攻坚克难，全面深化公立医院综合改革；统筹施策，积极推进分级诊疗制度建设；强化服务，积极稳妥实施全面两孩政策；优化供给，促进卫生资源均衡和服务能力提升；构建屏障，做好公共卫生和疾病防控工作；筑牢底线，扎实做好健康扶贫与民生实事；加强管理，为高效履职提供有力支撑。<br />\r\n&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;盛娅农在讲话中指出，要把全面贯彻落实习近平总书记视察重庆重要讲话精神，作为当前和今后一个时期的首要政治任务，深入学习领会，切实把思想和行动统一到讲话精神上来。她要求，&ldquo;十三五&rdquo;时期是全面建成小康社会的决胜阶段，也是实现人人享有基本医疗卫生服务目标的收官阶段，要做好六个坚持：坚持深化改革，健全基本医疗卫生制度；坚持基本国策，促进人口均衡发展；坚持协调发展，构建现代医疗服务体系；坚持预防为主，提升公共卫生服务水平；坚持扩大开放，加快发展健康服务业；坚持依法行政，推进卫生计生治理现代化。她强调，2016年是&ldquo;十三五&rdquo;开局之年，要在全面抓好各项任务落实的基础上，重点抓好时刻把纪律规矩挺在前面、狠抓责任落实、加强考核督查、加强统筹协调、抓好省级医改综合试点、抓好全面两孩政策落地、抓好队伍建设、抓好精准扶贫和民生实事、抓好典型示范等九个方面工作。<br />\r\n&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;会上，渝北区、巴南区、合川区、巫溪县、武隆县卫生计生委，重医附属儿童医院、市肿瘤医院作交流发言。</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('13','&nbsp; &nbsp; &nbsp; &nbsp; 近日，国家卫生计生委发布《关于开展政府购买公共服务试点工作的通知》，要求每个省份选择3个～5个城市或地区开展政府购买公共服务试点工作，取得经验后逐步扩大试点范围。新农合基金经办服务等七大类项目列入首批试点项目目录。\r\n<div>&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;据介绍，卫生计生系统开展政府购买公共服务，是指各级卫生计生行政部门利用财政资金，将原本由政府直接向社会提供的卫生计生公共服务，转交由具有专业资质的社会组织或企事业单位提供，以提高服务质量和财政资金使用效率。</div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;据悉，列入卫生计生系统开展政府购买公共服务首批试点目录的项目有：新农合基金经办服务；新农合基金购买大病保险服务；国家基本公共卫生服务项目中孕产妇健康管理、重性精神疾病患者管理；艾滋病防治项目中为男男同性性行为者、暗娼和吸毒者等高危人群提供宣传教育、行为干预和检测动员等服务，为艾滋病病毒感染者和病人提供关怀照顾和心理支持服务；结核病防治项目中结核病高危人群和可疑症状者筛查；农村妇女宫颈癌、乳腺癌筛查；避孕药具仓储物流服务；其他适合购买服务的项目。</div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;据介绍，购买主体是各级卫生计生行政部门，以及参照公务员法管理、具有行政管理职能的各级卫生计生事业单位。承接主体包括依法在民政部门登记成立或经国务院批准免予登记的社会组织，以及依法登记成立的企业、事业单位等。购买服务的内容主要为适合采取市场化提供、社会力量能够承担、具有公共性和服务性的卫生计生公共服务。各地可结合本地实际，研究制定本地区政府购买卫生计生公共服务试点项目实施目录，明确服务项目种类、性质和内容，细化目录清单，并实行动态调整。政府购买服务所需资金从同级部门预算经费或专项资金中安排。</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('14','<span style=\"color: rgb(0, 0, 0); font-family: Simsun; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px;\">&nbsp; &nbsp; &nbsp; &nbsp; 第一章 总则</span>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第一条 为实施&ldquo;科教兴国&rdquo;战略，适应社会主义卫生事业发展需要，国家对卫生技术人员实行继续医学教育制度。依据《教育法》、《执业医师法》和《全国专业技术人员继续教育暂行规定》，特制定本规定。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第二条 继续医学教育工作应适应医学科学技术的发展和社会的实际需要，面向现代化，面向世界，面向未来。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第三条 继续医学教育是继毕业后医学教育之后，以学习新理论、新知识、新技术、新方法为主的一种终生教育。继续医学教育的目的是使卫生技术人员在整个职业生涯中，保持高尚的职业道德，不断提高专业工作能力和业务水平，提高服务质量，以适应医学科学技术和卫生事业的发展。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第四条 继续医学教育的对象是完成毕业后医学教育培训或具有中级以上(含中级)专业技术职务从事卫生技术工作的人员。参加继续医学教育是卫生技术人员应享有的权利和应履行的义务。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第二章 组织管理</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第五条 继续医学教育工作实行全行业管理。各级卫生行政部门要打破医疗机构的行政隶属关系和所有制界限，充分利用各地区的卫生和医学教育资源，按照专业技术人员继续教育的总体要求，加强对继续医学教育工作的规划、组织和领导。全国和各省、自治区、直辖市继续医学教育委员会是指导、协调和质量监控的组织。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第六条 全国继续医学教育委员会在卫生部、人事部的领导下，由卫生部、人事部、解放军总后卫生部、有关卫生厅(局)、人事厅(局)，高等医学院校、学术团体和医疗卫生单位的领导及专家组成。委员会下设若干个学科组，聘请有关专家担任学科组成员。委员会的职能是：</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">1．研究全国继续医学教育的方针、政策，向卫生部、人事部提出建议；</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">2.研究和提出全国继续医学教育的总体规划和实施计划；</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">3．负责拟订继续医学教育项目的评审标准，申报、认可办法和学分授予办法等；</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">4．负责国家级继续医学教育项目的评审。评审结果作为卫生部批准和公布的依据；</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">5．组织选编、出版国家级继续医学教育项目的优秀文字教材、音像教材和远程继续医学教育课件；</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">6．开展远程教育，推动全国继续医学教育广泛深入地开展；</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">7．对省级继续医学教育委员会、卫生部直属单位及相关单位的继续医学教育工作进行指导、检查和评估；</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">8．负责国家级继续医学教育基地的评审。评审结果作为行政主管部门批准和公布的依据。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第七条 省级继续医学教育委员会在省级卫生行政部门、人事行政部门的领导下，由卫生厅(局)、人事厅(局)和有关单位的领导及专家组成。委员会下设若干个学科组。委员会的职能是：</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">1．拟订本省(自治区、直辖市)继续医学教育的规划和计划；</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">2．依据继续医学教育有关规定，拟订实施细则；</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">3．评审省(自治区、直辖市)级继续医学教育项目。评审结果作为省级卫生行政部门批准和公布的依据；</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">4．组织继续医学教育文字教材、音像教材和远程继续医学教育课件的编写、 出版和发行工作，开展远程教育；</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">5．对本省(自治区、直辖市)的继续医学教育工作进行指导、检查和评估；</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">6．评审本省(自治区、直辖市)继续医学教育基地。评审结果作为行政主管部门批准和公布的依据。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第八条 地(市)、县两级卫生行政部门应加强对继续医学教育的领导，负责贯彻落实省级继续医学教育的计划和要求，组织各项活动。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第九条 各单位要为卫生技术人员参加继续医学教育提供必要的条件。卫生技术人员要积极主动参加继续医学教育活动，并按照继续医学教育的有关规定，服从所在单位的安排，接受考核。在学习期间享受国家和本单位规定的工资、保险、福利待遇。在接受继续医学教育后，有义务更好地为本单位服务。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第十条 各级卫生、人事行政主管部门应加强对继续医学教育工作的领导，并从制度上予以保证。各医疗卫生单位、高等医学院校和学术团体应将开展继续医学教育作为一项重要任务，认真落实。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第三章 内容与形式</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第十一条 继续医学教育的内容，应以现代医学科学技术发展中的新理论、新知识、新技术和新方法为重点，注意先进性、针对性和实用性，重视卫生技术人员创造力的开发和创造性思维的培养。根据学科发展和社会需求，开展多种形式的继续医学教育活动。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第十二条 在继续医学教育活动中要注意加强政治思想、职业道德和医学伦理学等有关内容的教育，培养高素质的卫生技术人员。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第十三条 继续医学教育坚持理论联系实际，按需施教，讲求实效的原则，根据学习对象、学习条件、学习内容等具体情况的不同，采用培训班、进修班、研修班、学术讲座、学术会议、业务考察和有计划、有组织、有考核的自学等多种方式组织实施。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第十四条 各地区、各单位应根据不同内容和条件，采取灵活多样的形式和办法，开展以短期和业余学习为主的继续医学教育活动。自学是继续医学教育的重要形式之一，应有明确的目标，制定自学计划，经考核认可授予学分。相应的自学管理办法由省级卫生行政部门制定。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第十五条 卫生部和省级卫生行政部门定期将认可的继续医学教育项目，按学科专业分类提前公布，供各地卫生技术人员选择参加。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第十六条 经审批认可的继续医学教育项目分为国家级和省级。全国继续医学教育委员会评审国家级继续医学教育项目。此类项目按《国家级继续医学教育项目申报、认可试行办法》办理。省级继续医学教育委员会负责评审省级继续医学教育项目，此类项目按各省(自治区、直辖市)制定的省级继续医学教育项目申报、认可办法办理。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第十七条 接受继续医学教育的卫生技术人员应根据本人的实际情况和工作需要，选择参加与本人专业和岗位工作相关的继续医学教育活动。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第十八条 解放军总后卫生部、高等医学院校、科研院所根据本系统和单位的具体情况及特点，在做好本单位继续医学教育工作的同时，要积极面向社会，开展继续医学教育。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第四章 考核、登记、评估</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第十九条 要对卫生技术人员参加继续医学教育活动进行考核。继续医学教育活动主办单位负责考核，卫生技术人员所在单位负责审核。考核、审核的具体办法由各省级卫生行政部门会同人事行政部门共同制定。解放军总后卫生部、卫生部直属单位考核、审核的具体办法由各单位制定。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第二十条 继续医学教育实行登记制度。继续医学教育活动主办单位应对参加活动的卫生技术人员发放本单位签章的包括活动名称、编号、形式、日期、考核结果、学分类别、学分数等内容的登记证或学习证明。各单位应建立继续医学教育档案，对本单位卫生技术人员每年参加各种继续医学教育活动和获得的学分进行登记。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第二十一条 继续医学教育实行学分制。继续医学教育对象每年都应参加与本专业相关的继续医学教育活动，学分数不低于25学分。学分的授予和登记应严格执行继续医学教育学分授予的有关规定。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第二十二条 卫生技术人员接受继续医学教育的基本情况作为年度考核的重要内容。继续医学教育合格作为卫生技术人员聘任、技术职务晋升和执业再注册的必备条件之一。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第二十三条 各单位开展继续医学教育工作的情况，应作为对领导干部政绩考核的内容之一。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第二十四条 建立继续医学教育的评估制度。全国继续医学教育委员会和省级继续医学教育委员会定期对开展继续医学教育情况进行检查评估。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第二十五条 对积极开展和踊跃参加继续医学教育活动，并且成绩显著的单位和个人，应给予表彰和奖励。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第五章 经费</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第二十六条 继续医学教育所需的经费，采取国家、集体、个人等多渠道筹集的办法解决。各级卫生行政部门应将继续医学教育经费列入预算。各卫生单位应保证一定的继续医学教育费用，并通过其它途径筹集资金。继续医学教育经费要专款专用。卫生技术人员本人也应承担一定的费用。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第二十七条 根据原国家教育委员会、国家计划委员会、财政部《关于颁发义务教育等四个教育收费管理暂行办法的通知》(教财[1996]101号)的有关规定，举办继续医学教育活动可收取合理学习费用，但不以盈利为目的。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第六章 附则</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第二十八条 护士(助产土)的继续教育暂依照《继续护理学教育试行办法》执行。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第二十九条 省级卫生行政部门会同人事行政部门可参照本规定，结合实际，制定具体的实施细则。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第三十条 本规定自发布之日起施行，1991年卫生部发布的《继续医学教育暂行规定》同时废止。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">第三十一条 本规定的解释权属卫生部。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;卫生部 .2005年12月9日</p>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('15','<span style=\"color: rgb(0, 0, 0); font-family: Simsun; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px;\">&nbsp; &nbsp; &nbsp; &nbsp; 21世纪是知识经济时代，是经济与社会加速发展、生命科学将取得重大突破的时代。</span>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">实施继续医学教育是提高我国卫生队伍整体素质的重要措施，是落实&ldquo;科教兴国&rdquo;战略和《中共中央国务院关于卫生改革与发展的决定》的重要内容。&ldquo;九五&rdquo;期间，各级卫生行政部门积极贯彻落实卫生部《继续医学教育暂行规定》，全国已有29个省、自治区、直辖市成立了继续医学教育委员会或领导小组，并开展了工作；制定了一系列继续医学教育规章制度。全国开展继续医学教育工作的省（自治区、直辖市）和举办继续医学教育工作的学科（一级学科）覆盖率均超过了&ldquo;九五&rdquo;计划中提出的85%的目标，继续医学教育工作成绩显著，为&ldquo;十五&rdquo;期间继续医学教育工作的持续发展奠定了良好的基础。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">到2010年，我国要在全国建立起适应社会主义市场经济体制和人民群众健康需求的、比较完善的卫生体系。国民健康的主要指标在经济发达地区达到或接近世界中等发达国家的平均水平，在欠发达地区达到发展中国家的先进水平。要实现这一目标，必须充分依靠科技的进步与教育的发展，继续医学教育是医学教育的重要组成部分，是实现卫生改革与发展总目标的基本保障，必须进一步加强领导，加大投入，加快发展。根据卫生事业&ldquo;十五&rdquo;期间的发展目标和任务，特制定本计划。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">一、指导思想和原则</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">继续医学教育要以邓小平理论为指导，贯彻实施&ldquo;科教兴国&rdquo;伟大战略，落实新时期卫生工作方针，面向现代化、面向世界、面向未来，适应21世纪医学科学技术和卫生事业发展的需要，建设一支高素质的卫生技术队伍。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">继续医学教育是以学习现代医学科学技术发展的新理论、新知识、新技术、新方法（以下简称&ldquo;四新&rdquo;）为重点，注重先进性、针对性和实用性（以下简称&ldquo;三性&rdquo;）。坚持教育方式的多种形式，注重质量和实效；坚持普及与提高相结合，创造优秀卫生技术人才脱颖而出的良好环境；坚持实事求是、因地制宜的原则。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">继续医学教育实行全行业管理。要充分利用各地的卫生和医学教育资源，加强对继续医学教育工作的规划、组织和管理。注重发挥高等医学院校和学术团体的作用；注重向农村基层和西部地区倾斜；探索把现代远程教育手段用于这一领域。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">二、总体目标与具体指标</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&ldquo;十五&rdquo;期间继续医学教育工作的总体目标是：在巩固&ldquo;九五&rdquo;成绩的基础上，进一步提高教育质量和效益，实现继续医学教育工作制度化、管理规范化、手段现代化，在全国建立起比较完善的、具有中国特色的继续医学教育体系，以适应卫生事业改革发展与卫生技术人员自身学习提高的需要。具体指标包括：</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">（一）各省、自治区、直辖市的县（区）级医疗卫生单位开展继续医学教育工作的覆盖率达到85%；</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">（二）各省、自治区、直辖市举办继续医学教育活动项目的学科专业（二级学科）覆盖率达到85%；</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">（三）按卫生部、人事部发布的《继续医学教育规定（试行）》要求，各省、自治区、直辖市继续医学教育对象获取学分的达标率达到85%。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">三、措施</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">继续医学教育是一项系统工程，各级卫生行政部门、各医疗卫生单位必须把继续医学教育工作摆上重要工作日程，采取有力措施，确保计划目标的实现。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">（一）进一步提高认识，加强领导</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">要通过多种形式和途径加大对继续医学教育在卫生改革与发展中重要地位、作用的宣传，提高各级领导和卫生技术人员&ldquo;科教兴国&rdquo;的意识，树立终生教育的观念，把继续医学教育工作摆在重要工作日程上，并且把开展继续医学教育工作情况作为领导干部政绩考核内容之一。切实做好组织落实、人员落实、工作落实。在实施全行业管理的基础上，做好继续医学教育工作的规划。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">尚未成立继续医学教育委员会及学科组的省、自治区、直辖市应于2002年上半年前成立，并尽快开展继续医学教育工作。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">（二）进一步完善制度，规范管理</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">要在总结&ldquo;九五&rdquo;工作经验的基础上，建立健全有关规章制度，加快继续医学教育工作的制度化、规范化、科学化建设。要严格按照《继续医学教育规定（试行）》要求，规范继续医学教育的对象、学分的授予、考核、登记、验证等环节的管理，使继续医学教育工作有序健康地开展。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">（三）进一步提高质量与效益</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">积极开展多种形式的继续医学教育活动，在坚持&ldquo;按需施教、讲求实效&rdquo;和教育内容突出&ldquo;四新&rdquo;、&ldquo;三性&rdquo;基础上，要加强政治思想、医德医风、医学伦理学等有关知识的学习和教育。在努力扩大继续医学教育覆盖面的同时，要加强对国家级、省级继续医学教育项目举办过程的监督检查，规范继续医学教育活动的管理，把工作的重点放在提高质量和效益上。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">（四）建立一批国家级继续医学教育基地</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">按照《国家级继续医学教育基地认可标准及管理试行办法》，逐步在一些符合条件的单位建立国家级继续医学教育基地，面向全国开展高水平、高效益的继续医学教育项目。基地实行滚动式管理，定期进行检查评估，优胜劣汰，避免终身制，保证继续医学教育基地工作的质量。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">（五）充分利用现代技术手段，开展继续医学教育</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">要充分利用各种现代技术手段，开发多媒体教学课件，积极发展远程教育，以解决工作与学习的矛盾，促进继续医学教育更加广泛深入地开展，使更多的卫生技术人员及时地参加继续医学教育活动和学习相关的知识。同时，充分利用现代技术手段进行继续医学教育的管理，积极开发各种管理软件系统，使继续医学教育的管理更加高效、便捷和规范。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">（六）加强理论研究，积极开展国内外学术交流</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">全国继续医学教育委员会要根据工作需要，组织开展有关专题的调查研究，为继续医学教育工作的不断深入提供理论依据和决策咨询。举办继续医学教育管理干部讲习班和学术研讨会，不断提高管理人员素质和继续医学教育工作水平。积极创造条件开办继续医学教育刊物，为广大卫生技术人员与管理干部拓宽学习与交流的园地。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">（七）完善考核评估制度，健全激励机制</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">进一步完善并严格执行继续医学教育考核、登记和评估制度，健全激励和约束机制。充分发挥继续医学教育委员会和学科专家组的作用，定期对继续医学教育工作进行检查评估，对先进单位和个人予以表彰。对乱办班、乱收费、乱发证等问题及时纠正，必要时通报批评违规单位，并取消其举办继续医学教育项目的资格。要重视继续医学教育的质量和实效，将继续医学教育与卫生技术人员的考核、聘任、晋升、任职、执业注册等密切结合。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">（八）保证投入，多方投资</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">各级卫生行政部门要把继续医学教育经费列入预算，各医疗卫生机构要加大经费投入，并通过多种渠道筹集资金。继续医学教育经费要专款专用。接受继续医学教育的个人在参加有关活动时应负担一定的费用。</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 全国继续医学教育委员会．2005年12月9日</p>\r\n<p style=\"margin: 0px; padding: 0px 30px; line-height: 24px; text-indent: 28px; font-size: 14px; text-align: justify; color: rgb(0, 0, 0); font-family: Simsun;\">&nbsp;<br style=\"margin: 0px; padding: 0px;\" />\r\n&nbsp;</p>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('16','&nbsp; &nbsp; &nbsp; 为加强我市继续医学教育工作，不断提高卫生计生技术人员的专业素质和服务水平，根据《重庆市专业技术人员继续教育条例》和《重庆市卫生和计划生育委员会关于进一步加强我市继续医学教育工作的意见》（渝卫科教发[2014]78号）精神，制定本办法。<br />\r\n&nbsp;&nbsp;\r\n<div><strong>&nbsp; &nbsp; &nbsp;&nbsp;一、市级继续医学教育项目</strong></div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;市级继续医学教育项目包括：经重庆市继续医学教育委员会评审、批准并公布的项目；市级继续医学教育基地备案和市级继续医学教育备案项目，重庆市继续医学教育委员会核准、公布的项目；重庆市继续医学教育委员会、重庆市卫生和计划生育委员会根据卫生计生事业改革发展的重大需求或突发公共卫生事件应急培训，由重庆市继续医学教育委员会统一公布的推广及必修项目。<br />\r\n&nbsp;</div>\r\n<div><strong>&nbsp; &nbsp; &nbsp;&nbsp;二、市级继续医学教育项目条件</strong></div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;市级继续医学教育项目应以现代医学科学技术发展中的新理论、新知识、新技术和新方法以及卫生计生事业改革发展的重大需求为主要内容，注重针对性、实用性、先进性，且符合下列条件之一：<br />\r\n&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp;&nbsp;（一）本学科的国内或市内发展前沿；</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;（二）边缘学科和交叉学科的新进展；</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;（三）国外先进技术、成果的引进和推广或国内、市内先进技术、成果的推广；</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;（四）根据卫生事业改革发展的重大需求或突发公共卫生事件应急培训，启动的推广及必修项目；</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;（五） 填补国内空白，有显著社会或经济效益的技术和方法。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;<strong>&nbsp;三、市级继续医学教育项目申报</strong></div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;（一）申报资格</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;1. 医疗卫生、教学、科研机构可按申报程序申报市级继续医学教育项目，其他机构须先经重庆市继续医学教育委员会批准获得申报资格。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;2. 市级继续医学教育项目负责人应具有中级及以上专业技术职务，负责的项目内容须是其所从事的主要专业或研究方向；其当年申报的市级继续医学教育项目最多2项，市级继续医学教育备案项目除外。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;（二）申报程序</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;1. 项目申报按照属地化管理的原则，各单位应将市级继续医学教育项目申报表按统一要求，先报所在区（县）继续医学教育委员会，经核准后，由所在区（县）继续医学教育委员会向重庆市继续医学教育委员会推荐。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;2. 重庆市医学会、重庆市卫生服务中心、重庆市基层卫生协会、重庆市社区卫生协会、重庆市医院管理协会、重庆市护理学会、远程医学教育中心等具有申报市级继续医学教育项目资格的社团应将拟举办的市级继续医学教育项目经审定后向重庆市继续医学教育委员会申报；市直属单位直接向重庆市继续医学教育委员会申报。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;3. 重庆市继续医学教育委员会、重庆市卫生和计划生育委员会根据卫生计生事业改革发展的重大需求或卫生突发事件应急培训需要，启动的推广及必修项目，由项目负责人填写统一制定的项目申报表，直接向重庆市继续医学教育委员会申报。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;4. 凡在获准当年举办的市级继续医学教育项目有效期为2年。若在第二年举办，申报备案项目的单位应按统一要求填写备案项目申报表，按申报途径报重庆市继续医学教育委员会，称为市级继续医学教育备案项目。<br />\r\n&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp;5. 每年申报次年项目的时间为5、11月，申报单位将下一年度拟举办的市级继续医学教育项目按统一要求填写后，按程序向重庆市继续医学教育委员会申报。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp; <strong>四、市级继续医学教育项目审批</strong></div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;（一）申报的项目由重庆市继续医学教育委员会办公室进行形式审查，重庆市继续医学教育委员会进行审批及公布。市级继续医学教育备案项目及市级继续医学教育基地举办项目由重庆市继续医学教育委员会办公室进行形式审查，重庆市继续医学教育委员会核准并公布。重庆市继续医学教育委员会或重庆市卫生和计划生育委员会根据卫生计生事业改革发展的重大需求或突发公共卫生事件应急培训，启动的推广及必修项目，由重庆市继续医学教育委员会统一公布。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;（二）重庆市继续医学教育委员会每年年底及次年的2月底以前将下一年度获准的市级继续医学教育项目向社会公布。公布时按学科分类，列出项目编号、项目名称、主办单位（远程项目为申报单位）、项目负责人及联系电话、学分数、日期、地点等，供各地医疗卫生单位和有关卫生专业技术人员选择参加。<br />\r\n&nbsp;</div>\r\n<div><strong>&nbsp; &nbsp; &nbsp;&nbsp;五、市级继续医学教育项目管理</strong></div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;（一）项目举办单位的市级继续医学教育活动须符合市级继续医学教育项目的相关规定，按照项目内容编写教材、组织培训等，保证项目水平和教学质量。<br />\r\n&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp;&nbsp;（二）项目举办单位应按重庆市继续医学教育委员会颁发的《继续医学教育学分授予与管理办法》的规定授予学分、颁发继续医学教育项目学分及学分证书。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;（三）项目举办后填写&ldquo;市级继续医学教育项目汇报表&rdquo;，同教材、学员名单、总结和试题等材料经上级主管职能部门报重庆市继续医学教育委员会办公室。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;（四）加强对项目负责人的培训。应对项目负责人进行培训，使其了解和熟悉国家有关继续医学教育项目活动和学分授予的管理规定，明确项目负责人的职责，规范项目管理，提高项目举办水平，保证项目的质量和效果。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;（五）各区（县）继续医学教育委员会和有关市属单位及学术团体等单位须加强对项目举办单位的管理和项目举办过程的监管，每年对继续医学教育项目执行情况进行检查，检查项目数不低于举办项目总数的10%。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;<strong>六、其他</strong><br />\r\n&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp;&nbsp;（一）各区（县）级继续医学教育委员会根据本办法制定区（县）级和基层卫生专业技术人员培训项目申报与认可办法。报重庆市继续医学教育委员会备案。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;（二）本办法自2015年1月1日起施行，2008年颁布的《重庆市卫生局关于印发重庆市市级继续医学教育项目申报认可办法的通知》（渝卫科教〔2008〕8号）同时废止。</div>\r\n<div><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;（三）本办法由重庆市继续医学教育委员会负责解释。</div>\r\n<div>&nbsp;</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('17','<div style=\"text-align: center;\"><img alt=\"\" src=\"/uploadfile/2016/0315/20160315113244323.png\" style=\"width: 489px; height: 767px;\" /></div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('18','<span style=\"font-family: \'Times New Roman\'; font-size: 22pt; color: rgb(22, 22, 22); line-height: 30pt; text-align: center; text-indent: 28px;\">重庆市九龙坡区卫生和计划生育委员会</span><span style=\"color: rgb(22, 22, 22); line-height: 30pt; text-align: center; text-indent: 28px; margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 22pt;\">关于</span><span style=\"color: rgb(22, 22, 22); line-height: 30pt; text-align: center; text-indent: 28px; margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 22pt;\">201</span><span style=\"color: rgb(22, 22, 22); line-height: 30pt; text-align: center; text-indent: 28px; margin: 0px; padding: 0px; font-family: 方正小标宋_GBK; font-size: 22pt;\">6</span><span style=\"color: rgb(22, 22, 22); line-height: 30pt; text-align: center; text-indent: 28px; margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 22pt;\">年全区护士执业资格考试报名工作</span><span style=\"font-family: \'Times New Roman\'; font-size: 22pt; color: rgb(22, 22, 22); line-height: 30pt; text-align: center; text-indent: 28px;\">有关事宜的通知</span>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">全区各卫生计生单位：</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">为保证我区<font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">201</font></span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">年护士执业资格考试顺利进行，根据《重庆市卫生专业技术资格考试办公室关于<font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">201</font></span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">年护士执业资格考试考务工作计划的通知》（渝卫考办〔<font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">201</font></span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">〕</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">3</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">号）要求，现将<font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">201</font></span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">年护士执业资格考试报名现场确认有关事宜通知如下：</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">一、</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">报名条件</span><span style=\"margin: 0px; padding: 0px; font-family: 方正黑体_GBK; font-size: 16pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">执行原卫生部、人力社保部印发的《执士执业资格考试办法》（部长令第</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">74</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">号）相关规定，即：符合报考条件的</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">201</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">年应届毕业生和在中等职业学校、高等学校完成国务院教育主管部门和国务院卫生主管部门规定的普通全日制</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">3</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">年以上的护理、助产专业课程学习，包括在教学、综合医院完成</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">8</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">个月以上护理临床实习，并取得相应学历证书，可以申请参加护士执业资格考试。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">&nbsp;</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">二、</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">报名方式及资格审查</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px 0pt 30.4pt; padding: 0px; text-indent: 28px; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">（一）网上报名</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px 0pt 32.25pt; padding: 0px; text-indent: 28px; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">1.</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">报名时间：</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">201</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">年</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">1</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">月</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">12</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">日至</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">201</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">年</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">1</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">月</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">3</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">1</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">日。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">2.</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">报名方式：报考人员请登录中国卫生</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">人才网（</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">www.21wecan.com)</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">或重庆卫生人才网（</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">www.cqwsrc.com)</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">，根据提示在网上填写个人报名信息，并打印《</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">2016</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">年护士执业资格考试报名申请表》。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt; font-weight: bold;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px 0pt 30.4pt; padding: 0px; text-indent: 28px; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">（二）现场确认</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">1.</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">确认时间：</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">201</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">年</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">1</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">月</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">19</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">日</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">&mdash;201</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">年</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">2</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">月</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">1</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">日。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">作息时间：上午</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">9:00</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">至</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">12:00</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">，下午</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">2:00</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">至</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">5:00</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">（国家法定节假日休息）。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">2.确认地点：</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">九龙坡</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">区</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">公共卫生和计划生育管理服务中心</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">（地址：九龙坡区九龙园区蟠龙大道</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">56</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">号，区疾病预防控制中心六楼</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">603<font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">室</font></span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">）。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">3.</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">需提交的材料</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">（<font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">1</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">）</font></span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">《</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">201</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">年度护士执业资格考试报名表申请表》（需加盖单位公章）</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">1</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">式</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">2</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">份；</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">（<font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">2</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">）</font></span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">本人身份证（军官证）原件及复印件</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">2</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">份；</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">（<font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">3</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">）</font></span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">毕业证书原件及复印件</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">2</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">份</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">(201</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">年应届毕业生须出示毕业学校出具应届毕业生证明，并</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">加盖毕业</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">学校公章</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">)</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">&nbsp;</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt; font-weight: bold;\">考生提交的所有纸质材料均须使用</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt; font-weight: bold;\">A4</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt; font-weight: bold;\">纸。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt; font-weight: bold;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">（三）资格审查</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">1</span><span style=\"margin: 0px; padding: 0px; font-family: 方正楷体_GBK; font-size: 16pt;\">.</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">报考人员为在校</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">应届毕业生</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">的，</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">应当持有所在学校出具的应届毕业生毕业证明，到学校所在地的考点报名。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">2</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">.</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">报考人员为非应届毕业生的</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt; font-weight: bold;\">，</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">人事档案属九龙坡的须到九龙坡</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">卫生计生委</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">指定地点进行现场确认和资格审查。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">&nbsp;&nbsp;</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">3</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">.</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">各</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">医疗机构要认真审核报名表及相关证书上的姓名、身份证号与身份证是否一致。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt; font-weight: bold;\">单位意见栏要签署意见并加盖公章。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">现场确认审核通过的人员需在确认单上签字。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正楷体_GBK; font-size: 16pt;\">（四）收费标准</span><span style=\"margin: 0px; padding: 0px; font-family: 方正楷体_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p16\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 26px;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">&nbsp;&nbsp;&nbsp;&nbsp;报名收费<font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">61</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">元</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">/</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">科，两科共计</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">122</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">元。（收费标准按《财政部　国家发展改革委员会关于同意护士执业资格考试考务费等有关问题的通知（财综〔</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">2012</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">〕</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">59</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">号）》）。</font></span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">三、</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">考试科目和时间安排</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">（一）专业实务：<font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">2016</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">年</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">5</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">月</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">14</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">日</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">9</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">：</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">00</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">&mdash;</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">11</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">：</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">00</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">。</font></span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">（二）实践能力：<font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">2016</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">年</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">5</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">月</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">14</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">日</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">14</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">：</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">00</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">&mdash;</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">16</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">：</font><font face=\"Times New Roman\" style=\"margin: 0px; padding: 0px;\">00</font><font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">。</font></span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">四、准考证打印</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">201</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">年</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">4</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">月</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">21</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">日至</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">5</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">月</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">14</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">日，考生自行登录重庆医药卫生人才网</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">(www.cqwsrc.com)</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">或中国卫生人才网</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">(www.21wecan.com.cn</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">）打印</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">准考证。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正黑体_GBK; font-size: 16pt;\">五、</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">成绩发布</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">（一）</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">考试结束后</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">45</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">个工作日内公布考试成绩，考生可凭本人准考证号和有效证件</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">登录</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">重庆卫生人才网</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">(www.cqwsrc.com)</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">或中国卫生人才网</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">(www.21wecan.com.cn</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">）查询成绩，并下载打印成绩单。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">（二）考生成绩合格证明，由考区下发到各考点，各考点再下发到各考试管理机构再发放到考生手中，请考试合格考生关注领取时间并及时领取。</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 31.5pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; text-align: right; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">重庆市九龙坡区卫生和计划生育委员会</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; text-align: right; line-height: 30pt; word-break: break-all;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">2016年1月18日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 31.5pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 31.5pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">（</span><span style=\"margin: 0px; padding: 0px; font-family: \'Times New Roman\'; font-size: 16pt;\">联系人：谭红芬；咨询电话：</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">18323254756<font face=\"方正仿宋_GBK\" style=\"margin: 0px; padding: 0px;\">）</font></span></p>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('19','<span style=\"font-family: \'Times New Roman\'; font-size: 22pt; color: rgb(22, 22, 22); line-height: 30pt; text-align: center; text-indent: 28px;\">重庆市九龙坡区卫生和计划生育委员会</span>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正小标宋_GBK; font-size: 22pt;\">关于2016年度卫生专业技术资格考试报名</span><span style=\"margin: 0px; padding: 0px; font-family: 方正小标宋_GBK; font-size: 22pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正小标宋_GBK; font-size: 22pt;\">工作的通知</span><span style=\"margin: 0px; padding: 0px; font-family: 方正小标宋_GBK; font-size: 22pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 仿宋_GB2312; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">全区各卫生计生单位、个体诊所：</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">根据重庆市卫生专业技术资格考试办公室《关于&nbsp;2016年度卫生专业技术资格考试考务工作计划的通知》（渝卫考办〔2016〕2号）、根据《人力资源社会保障部办公厅、国家卫生计生委办公厅关于2016年度卫生专业技术资格考试有关问题的通知》（人社厅发〔2015〕199号）和《国家卫生计生委人才交流服务中心关于印发2016年度卫生专业技术资格考试考务工作安排的通知》（卫人才发〔2016〕4号）文件精神，</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">现将九龙坡区2016年度卫生专业技术资格考试报名工作通知如下：</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正黑体_GBK; font-size: 16pt;\">一、</span><span style=\"margin: 0px; padding: 0px; font-family: 方正黑体_GBK; font-size: 16pt;\">报名条件</span><span style=\"margin: 0px; padding: 0px; font-family: 方正黑体_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">1.凡符合卫生部、原人事部印发的《临床医学专业技术资格考试暂行规定》（卫人发〔2000〕462号）和《预防医学、全科医学、药学、护理、其他卫生技术等专业技术资格考试暂行规定》（卫人发〔2001〕164号）中报名条件的人员，均可报名参加相应级别和专业类别的考试。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">2.按照《关于加强城市社区卫生人才队伍建设的指导意见》（国人部发〔2006〕69号）有关规定，凡到社区卫生服务机构工作的医师、护师，可提前一年参加全国卫生技术中级资格的全科医学、社区护理专业类别的考试。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt; font-weight: bold;\">注：社区卫生服务机构须为第一名称，有当地编制部门的正式批文，且为独立法人机构，报名时必须提供，同时提供2年岗位证明（法人签字）。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt; font-weight: bold;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">根据《重庆市基层医疗卫生机构全科医生职称评聘办法》（渝人发〔2015〕132号&nbsp;）有关规定，全市乡镇卫生院（含中心卫生院）、社区卫生服务机构及村卫生室等基层医疗卫生机构的全科医生（不含兼职人员，且须注册全科执业范围，并经全科医生规范化培训或转岗培训合格），可提前1年报考全国卫生专业技术中级资格考试（考试专业名称：全科医学、全科医学（中医类），专业代码301、302），在国家符合标准基础上降低10分划定市合格线，达到合格线的可取得重庆市全科医生（基层）中级职称，发放相应市级专业技术资格证书。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt; font-weight: bold;\">注：报名时需提交2年岗位工作证明（法人签字），同时提供全科医生规范化培训或转岗培训合格证明。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt; font-weight: bold;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">3.报名参加2016年度卫生专业技术资格各级别考试的人员，其</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt; font-weight: bold;\">学历取得日期和从事本专业工作年限均截止2015年12月31日</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">，报名条件中有关专业学历或学位的规定，是指国家教育和卫生行政部门认可的正规院校毕业学历或学位。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正黑体_GBK; font-size: 16pt;\">二、网上报名时间及报名方式</span><span style=\"margin: 0px; padding: 0px; font-family: 方正黑体_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正楷体_GBK; font-size: 16pt;\">（一）报名时间：</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt; font-weight: bold;\">2016年1月15日至2016年2月3日。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt; font-weight: bold;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正楷体_GBK; font-size: 16pt;\">（二）报名方式：</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">全部采用网上报名。报考人员登录重庆医药卫生人才网（www.cqwsrc.com)或中国卫生人才网(www.21wecan.com.cn），根据报名须知及提示在网上填写个人报名信息，并打印《&nbsp;2016年度卫生专业技术资格考试报名表》。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt; font-weight: bold;\">特别提示</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">：历史考生在填写申报材料时，必须</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt; font-weight: bold;\">填</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt; font-weight: bold;\">写原档案号</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">。历史考生身份证号升位或发生变更的，必须在填写档案号后，进行身份证号的升位或在规定时间内进行修改的工作。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正黑体_GBK; font-size: 16pt;\">三、现场确认和资格审查</span><span style=\"margin: 0px; padding: 0px; font-family: 方正黑体_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">凡单位或本人档案所属九龙坡区的网上报名人员，须到九龙坡区报名点进行现场确认和资格审查。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正楷体_GBK; font-size: 16pt;\">（一）确认时间：</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">2016年1月19日&mdash;2016年2月4日（法定假日休息，作息时间：上午9:00至12:00，下午2:00至5:00）&nbsp;。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正楷体_GBK; font-size: 16pt;\">（二）确认地点：</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">九龙坡区公共卫生和计划生育管理服务中心（九龙坡区九龙园区蟠龙大道56号，区疾病预防控制中心六楼603会议室）</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正楷体_GBK; font-size: 16pt;\">（三）报考人员在现场确认时需提交的材料</span><span style=\"margin: 0px; padding: 0px; font-family: 方正楷体_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 24pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 28pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">（注：考生提交的所有纸质材料均须使用A4纸）</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 24pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 28pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">（1）本人身份证（军官证）原件及复印件2份。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 24pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 28pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">（2）《2016年度卫生专业技术资格考试申报表》（各栏目内容须经单位人事部门或档案存放单位核实加盖印章）一式2份。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 24pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 28pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">（3）毕业证书、学位证书（硕士、博士必须提交学位证书）原件及复印件各2份。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 24pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 28pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">（4）申报上一级专业技术职务任职资格的考生，还须提交本级卫生专业技术资格证书原件及2份复印件；</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 24pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 28pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">有执业资格准入的专业必须同时提交执业证书原件及2份复印件。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">5．2015年已参加过本专业考试的考生只需提交本人身份证及&nbsp;2015年度卫生专业技术资格考试成绩单原件及2份复印件和《2016年度卫生专业技术资格考试报名表》(需加盖单位公章）一式2份。&nbsp;</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt; font-weight: bold;\">6.</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt; font-weight: bold;\">学历教育如果是&ldquo;网络教育&rdquo;，报名时必须提供在学信网上查询打印的学历教育证明一式两份。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt; font-weight: bold;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正楷体_GBK; font-size: 16pt;\">（四）收费标准</span><span style=\"margin: 0px; padding: 0px; font-family: 方正楷体_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">50元/每科。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正楷体_GBK; font-size: 16pt;\">（五）对现场确认审核通过的人员，打印确认单交报考人员签字确认。并在报名表及确认单上相应位置签署意见。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正楷体_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正黑体_GBK; font-size: 16pt;\">四、准考证打印</span><span style=\"margin: 0px; padding: 0px; font-family: 方正黑体_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 30.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">2016年4月26日至5月22日，考生自行登录重庆卫生人才网（www.cqwsrc.com）或中国卫生人才网（www.21wecan.com.cn）打印准考证。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; background-color: rgb(255, 255, 0); color: rgb(0, 0, 255); font-size: 16pt; background-position: initial initial; background-repeat: initial initial;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正黑体_GBK; font-size: 16pt;\">五、考试时间</span><span style=\"margin: 0px; padding: 0px; font-family: 方正黑体_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">纸笔考试时间：</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<table style=\"margin: 0px 0px 0px 23.4pt; padding: 0pt 5.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 26px; border-collapse: collapse;\">\r\n<tbody style=\"margin: 0px; padding: 0px;\">\r\n	<tr style=\"margin: 0px; padding: 0px; height: 11.25pt;\">\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border: 0.5pt solid rgb(0, 0, 0); width: 134.1pt;\" valign=\"bottom\" width=\"178\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">考试科目</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	<td colspan=\"2\" style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: 0.5pt 0.5pt 0.5pt medium; border-style: solid solid solid none; width: 268.6pt; border-top-color: rgb(0, 0, 0); border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"358\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">考试日期和时间</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	</tr>\r\n	<tr style=\"margin: 0px; padding: 0px; height: 27pt;\">\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt; border-style: none solid solid; border-left-color: rgb(0, 0, 0); width: 134.1pt; border-right-color: rgb(0, 0, 0);\" valign=\"bottom\" width=\"178\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">基础知识</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	<td rowspan=\"2\" style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt medium; border-style: none solid solid none; width: 98.45pt; border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"131\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">5月14日</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: 0.5pt 0.5pt 0.5pt medium; border-style: solid solid solid none; width: 170.15pt; border-top-color: rgb(0, 0, 0); border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"226\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">09：00-11：00</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	</tr>\r\n	<tr style=\"margin: 0px; padding: 0px; height: 20.25pt;\">\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt; border-style: none solid solid; border-left-color: rgb(0, 0, 0); width: 134.1pt; border-right-color: rgb(0, 0, 0);\" valign=\"bottom\" width=\"178\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">相关专业知识</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt medium; border-style: none solid solid none; width: 170.15pt; border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"226\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">14：00-16：00</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	</tr>\r\n	<tr style=\"margin: 0px; padding: 0px; height: 20.7pt;\">\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt; border-style: none solid solid; border-left-color: rgb(0, 0, 0); width: 134.1pt; border-right-color: rgb(0, 0, 0);\" valign=\"bottom\" width=\"178\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">专业知识</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	<td rowspan=\"2\" style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt medium; border-style: none solid solid none; width: 98.45pt; border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"131\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">5月15日</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt medium; border-style: none solid solid none; width: 170.15pt; border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"226\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">09：00-11：00</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	</tr>\r\n	<tr style=\"margin: 0px; padding: 0px; height: 9pt;\">\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt; border-style: none solid solid; border-left-color: rgb(0, 0, 0); width: 134.1pt; border-right-color: rgb(0, 0, 0);\" valign=\"bottom\" width=\"178\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">专业实践能力</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt medium; border-style: none solid solid none; width: 170.15pt; border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"226\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">14：00-16：00</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	</tr>\r\n</tbody>\r\n</table>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">人机对话考试时间：</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<table style=\"margin: 0px 0px 0px 23.4pt; padding: 0pt 5.4pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 26px; border-collapse: collapse;\">\r\n<tbody style=\"margin: 0px; padding: 0px;\">\r\n	<tr style=\"margin: 0px; padding: 0px; height: 11.25pt;\">\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border: 0.5pt solid rgb(0, 0, 0); width: 134.05pt;\" valign=\"center\" width=\"178\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">考试科目</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	<td colspan=\"2\" style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: 0.5pt 0.5pt 0.5pt medium; border-style: solid solid solid none; width: 268.65pt; border-top-color: rgb(0, 0, 0); border-right-color: rgb(0, 0, 0);\" valign=\"top\" width=\"358\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 96pt; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">考试时间</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	</tr>\r\n	<tr style=\"margin: 0px; padding: 0px; height: 27pt;\">\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt; border-style: none solid solid; border-left-color: rgb(0, 0, 0); width: 134.05pt; border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"178\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">基础知识</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	<td rowspan=\"4\" style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt medium; border-style: none solid solid none; width: 98.55pt; border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"131\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">5月14、15、21、22日</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: 0.5pt 0.5pt 0.5pt medium; border-style: solid solid solid none; width: 170.1pt; border-top-color: rgb(0, 0, 0); border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"226\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">08：30-10：00</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	</tr>\r\n	<tr style=\"margin: 0px; padding: 0px; height: 20.25pt;\">\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt; border-style: none solid solid; border-left-color: rgb(0, 0, 0); width: 134.05pt; border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"178\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">相关专业知识</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt medium; border-style: none solid solid none; width: 170.1pt; border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"226\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">11：00-12：30</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	</tr>\r\n	<tr style=\"margin: 0px; padding: 0px; height: 20.7pt;\">\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt; border-style: none solid solid; border-left-color: rgb(0, 0, 0); width: 134.05pt; border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"178\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">专业知识</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt medium; border-style: none solid solid none; width: 170.1pt; border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"226\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">14：00-15：30</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	</tr>\r\n	<tr style=\"margin: 0px; padding: 0px; height: 9pt;\">\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt; border-style: none solid solid; border-left-color: rgb(0, 0, 0); width: 134.05pt; border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"178\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">专业实践能力</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	<td style=\"margin: 0px; padding: 0pt 5.4pt; border-bottom-color: rgb(0, 0, 0); border-width: medium 0.5pt 0.5pt medium; border-style: none solid solid none; width: 170.1pt; border-right-color: rgb(0, 0, 0);\" valign=\"center\" width=\"226\">\r\n	<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">16：30-18：00</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n	</td>\r\n	</tr>\r\n</tbody>\r\n</table>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正黑体_GBK; font-size: 16pt;\">&nbsp;&nbsp;&nbsp;六、成绩发布</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">　</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">&nbsp;&nbsp;&nbsp;</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; color: rgb(0, 0, 0); font-size: 16pt;\">考试结束后2个月公布考试成绩，考生可凭本人准考证号和有效证件号登陆重庆医药卫生人才网(www.cqwsrc.com)或中国卫生人才网(www.21wecan.com.cn）查询成绩。</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; text-align: right; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">重庆市九龙坡区卫生和计划生育委员会</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 0px; padding: 0px; text-indent: 28px; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; text-align: right; line-height: 30pt; word-break: break-all;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">2016年1月18日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 42pt 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\"><o:p style=\"margin: 0px; padding: 0px;\"></o:p></span></p>\r\n<p class=\"p0\" style=\"margin: 0pt 42pt 0pt 0px; padding: 0px; text-indent: 32pt; color: rgb(22, 22, 22); font-family: 宋体, \'Microsoft YaHei\'; font-size: 14px; text-align: center; line-height: 30pt;\"><span style=\"margin: 0px; padding: 0px; font-family: 方正仿宋_GBK; font-size: 16pt;\">（联系人：谭红芬&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;咨询电话：18323254756）</span></p>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('24','&nbsp; &nbsp; &nbsp; 加大招商引资力度，助力八大功能板块建设是当前全区的一项重要工作。近日，区卫生计生委立足行业特点，在金凤园区积极探索健康&ldquo;定制&rdquo;服务，优质服务园区企业，助力招商引资、板块建设。<br />\r\n<br />\r\n<div>&nbsp; &nbsp; &nbsp;&nbsp;一是&ldquo;定制&rdquo;服务领导&ldquo;班底&rdquo;。综合专业水平、能力特长、工作经验，在干部队伍中精心挑选优秀干部成立健康&ldquo;定制&rdquo;服务行动专项领导&ldquo;班底&rdquo;；反复研讨、征求意见，精心制作健康&ldquo;定制&rdquo;服务行动方案；层层明确分工、层层落实责任、层层落实考核。<br />\r\n&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp;&nbsp;二是&ldquo;定制&rdquo;服务内容&ldquo;干货&rdquo;。基本医疗服务方面，即常见病、多发病的诊治、重大疑难疾病将及时联系上级会诊、转诊，畅通转诊绿色通道；基本公共卫生服务方面，即免费的居民健康档案管理、健康教育、预防接种、婚前医学检查等16大类70项服务；健康管理服务方面，即每季度享受&ldquo;健康知识进工厂&rdquo;等健康讲座、义诊、巡诊等健康宣传活动福利不少于1次，同时企业负责人还将享受一对一的专家顾问服务，获得个性化的疾病预防、治疗和健康指导。<br />\r\n&nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp;&nbsp;三是&ldquo;定制&rdquo;服务协同&ldquo;责任&rdquo;。采取 &ldquo;量体裁衣&rdquo;、分工协作模式，提高工作效率和精细化服务水平。金凤镇卫生院提供基本公共卫生和基本医疗首诊服务；区人民医院提供基本医疗、急危重症病人的抢救、疑难疾病转诊和企业负责人专家顾问健康管理服务；区卫生计生委协调市级三甲医院提供医疗服务。</div>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('29','<a href=\"http://yyq.haoyisheng.com/wap/action.php?m_sid=&amp;ac=supers&amp;eventid=281&amp;uid=3507277###\" style=\"font-family: Helvetica, \'Microsoft Yahei\'; font-size: 14px; line-height: 22px; widows: auto; color: rgb(51, 51, 51); text-decoration: none; outline: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); transition: all 0.3s;\">类型：会议</a>\r\n<p style=\"margin: 14.7188px 0px; padding: 0px; color: rgb(94, 94, 94); font-family: Helvetica, \'Microsoft Yahei\'; font-size: 14px; line-height: 22px; widows: auto;\"><a href=\"http://yyq.haoyisheng.com/wap/action.php?m_sid=&amp;ac=supers&amp;eventid=281&amp;uid=3507277###\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-transition: all 0.3s; transition: all 0.3s;\">时间：2016-10-29 08:00:00 至2016-10-31 18:00:00</a></p>\r\n<p style=\"margin: 14.7188px 0px; padding: 0px; font-family: Helvetica, \'Microsoft Yahei\'; font-size: 14px; widows: auto;\"><font color=\"#333333\" style=\"text-decoration: none; outline: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><span style=\"line-height: 22px;\"><a href=\"http://yyq.haoyisheng.com/wap/action.php?m_sid=&amp;ac=supers&amp;eventid=281&amp;uid=3507277###\" style=\"text-decoration: none; outline: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">地点：海外侨胞&nbsp;海外侨胞&nbsp;葡萄牙-里斯本</a><br />\r\n<br />\r\n内容：</span></font></p>\r\n<p style=\"margin: 0px; padding: 0px 3px; widows: auto; list-style: none; color: rgb(67, 67, 67); line-height: 22px; font-family: Arial, Helvetica, sans-serif;\">　　一、2016年国际妇科癌症协会16两年一次的会议(IGCS )于2016年10月29日到31日在葡萄牙-里斯本召开。</p>\r\n<p style=\"margin: 0px; padding: 0px 3px; widows: auto; list-style: none; color: rgb(67, 67, 67); line-height: 22px; font-family: Arial, Helvetica, sans-serif;\">　　二、活动地点：葡萄牙-里斯本</p>\r\n<p style=\"margin: 0px; padding: 0px 3px; widows: auto; list-style: none; color: rgb(67, 67, 67); line-height: 22px; font-family: Arial, Helvetica, sans-serif;\">　　三、组团推广时间：2016年10月29日到31日</p>\r\n<p style=\"margin: 0px; padding: 0px 3px; widows: auto; list-style: none; color: rgb(67, 67, 67); line-height: 22px; font-family: Arial, Helvetica, sans-serif;\">　　四、参会报名：1、大会注册费：暂无</p>\r\n<p style=\"margin: 0px; padding: 0px 3px; widows: auto; list-style: none; color: rgb(67, 67, 67); line-height: 22px; font-family: Arial, Helvetica, sans-serif;\">　　包含会议入场券、会议期间的午餐、茶歇、大会资料等</p>\r\n<p style=\"margin: 0px; padding: 0px 3px; widows: auto; list-style: none; color: rgb(67, 67, 67); line-height: 22px; font-family: Arial, Helvetica, sans-serif;\">　　2、邀请函：免费提供大会注册及申请邀请函等服务，成功注册后即可获得书面邀请函。</p>\r\n<p style=\"margin: 0px; padding: 0px 3px; widows: auto; list-style: none; color: rgb(67, 67, 67); line-height: 22px; font-family: Arial, Helvetica, sans-serif;\">　　五、贴心服务供您选：</p>\r\n<p style=\"margin: 0px; padding: 0px 3px; widows: auto; list-style: none; color: rgb(67, 67, 67); line-height: 22px; font-family: Arial, Helvetica, sans-serif;\">　　1、免费 提供以下服务：会议注册，申请邀请函，预订酒店、预订机票、代办签证、接送机安排</p>\r\n<p style=\"margin: 0px; padding: 0px 3px; widows: auto; list-style: none; color: rgb(67, 67, 67); line-height: 22px; font-family: Arial, Helvetica, sans-serif;\">　　2、随团预订：本机构组团前往，除安排前期所有的预订服务外随团安排参会全程及当地医院、文化的参观考察</p>\r\n<p style=\"margin: 0px; padding: 0px 3px; widows: auto; list-style: none; color: rgb(67, 67, 67); line-height: 22px; font-family: Arial, Helvetica, sans-serif;\">　　3、定制服务：根据客户时间及需求单独定制行程接待服务</p>\r\n<p style=\"margin: 0px; padding: 0px 3px; widows: auto; list-style: none; color: rgb(67, 67, 67); line-height: 22px; font-family: Arial, Helvetica, sans-serif;\">　　4、展台预订及布展服务<br />\r\n<br />\r\n<span style=\"widows: auto;\">&nbsp; &nbsp; &nbsp; &nbsp; 联系方式：<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; 电话：010-57216648联系人：秦老师</span><br />\r\n&nbsp;</p>\r\n<p style=\"margin: 14.7188px 0px; padding: 0px; color: rgb(94, 94, 94); font-family: Helvetica, \'Microsoft Yahei\'; font-size: 14px; line-height: 22px; widows: auto;\">&nbsp;</p>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('30','<a href=\"http://yyq.haoyisheng.com/wap/action.php?m_sid=&amp;ac=supers&amp;eventid=268&amp;uid=3507273###\" style=\"font-family: Helvetica, \'Microsoft Yahei\'; font-size: 14px; line-height: 22px; widows: auto; color: rgb(51, 51, 51); text-decoration: none; outline: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); transition: all 0.3s;\">类型：会议</a>\r\n<div class=\"hc_test\" style=\"font-size: 14px; color: rgb(94, 94, 94); line-height: 22px; padding: 14.7188px 0px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(229, 229, 229); margin-bottom: 22.0781px; font-family: Helvetica, \'Microsoft Yahei\'; widows: auto;\">\r\n<p style=\"margin: 14.71875px 0px; padding: 0px;\"><a href=\"http://yyq.haoyisheng.com/wap/action.php?m_sid=&amp;ac=supers&amp;eventid=268&amp;uid=3507273###\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-transition: all 0.3s; transition: all 0.3s;\">时间：2016-05-02 16:00:00 至2016-05-06 20:00:00</a></p>\r\n<p style=\"margin: 14.71875px 0px; padding: 0px;\"><a href=\"http://yyq.haoyisheng.com/wap/action.php?m_sid=&amp;ac=supers&amp;eventid=268&amp;uid=3507273###\" style=\"color: rgb(51, 51, 51); text-decoration: none; outline: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-transition: all 0.3s; transition: all 0.3s;\">地点：海外侨胞&nbsp;海外侨胞&nbsp;美国-旧金山-washington convention center(华盛顿会议中心)</a></p>\r\n</div>\r\n<div class=\"test_detail he_auto\" style=\"color: rgb(132, 132, 132); font-size: 14px; line-height: 20px; margin: 5px 0px; max-height: none; font-family: Helvetica, \'Microsoft Yahei\'; widows: auto;\">内容：<br />\r\n<p style=\"margin: 0px; padding: 0px 0px 25px; background-color: rgb(250, 250, 250);\"><font face=\"Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"color: rgb(246, 171, 54);\">一、会议名称：2016年美国妇产医师学院临床大会（ACOG）</font></p>\r\n<p style=\"margin: 0px; padding: 0px 0px 25px; background-color: rgb(250, 250, 250);\"><font face=\"Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"color: rgb(246, 171, 54);\">二、活动地点：美国-旧金山-washington convention center(华盛顿会议中心)</font></p>\r\n<p style=\"margin: 0px; padding: 0px 0px 25px; background-color: rgb(250, 250, 250);\"><font face=\"Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"color: rgb(246, 171, 54);\">三、会议时间：2016年5月2日-5月6日</font></p>\r\n<p style=\"margin: 0px; padding: 0px 0px 25px; background-color: rgb(250, 250, 250);\"><font face=\"Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"color: rgb(246, 171, 54);\">四、参会报名：</font></p>\r\n<p style=\"margin: 0px; padding: 0px 0px 25px; background-color: rgb(250, 250, 250);\"><font face=\"Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"color: rgb(246, 171, 54);\">1、大会注册费：详见官网</font></p>\r\n<p style=\"margin: 0px; padding: 0px 0px 25px; background-color: rgb(250, 250, 250);\"><font face=\"Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"color: rgb(246, 171, 54);\">2、邀请函：免费提供大会注册及申请邀请函等服务，成功注册后即可获得书面邀请函。</font></p>\r\n</div>\r\n<br />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('31','<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">&nbsp; &nbsp; 邀请函</span>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">尊敬的同仁、朋友们：</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">你们好！</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">华夏医学泌尿生殖肿瘤论坛2016暨长城国际泌尿男科转化医学论坛2016（HMF-GUT 2016 &amp; GITAU 2016&nbsp;）于2016年4月15-17日，将在天津大礼堂（天津）隆重举办(gua-cpam学会网站：<a href=\"http://www.gua-cpam.org/\" style=\"text-decoration: none; color: rgb(52, 52, 52);\">http://www.gua-cpam.org</a>)。本次盛会是由中国医疗保健国际交流促进会(CPAM)主办，中国医促会泌尿生殖分会(GUA-CPAM)委托天津市泌尿外科研究所承办，天津市医学会泌尿外科分会、天津中西医结合学会泌尿外科分会、北京大学第一医院男科中心、泌尿男科转化医学杂志（TAU）协办。中国工程院郭应禄院士、美国加州大学（UCSF）泌尿外科Tom F Lue&nbsp;教授,&nbsp;中国医促会国际交流与推广分会会长曹泽毅教授为本次大会名誉主席, GUA-CPAM会长北京大学第一医院泌尿外科辛钟成教授为本次大会主席，GUA-CPAM副会长天津医科大学第二医院泌尿外科牛远杰教授为本次大会执行主席。GUA-CPAM秘书长宋卫东教授和天津医科大学第二医院泌尿外科权昌益教授任本次大会组织委员会秘书长，GUA-CPAM林桂庭教授和李学松教授任本次大会学术委员会秘书长。</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">本届论坛的主题是&ldquo;泌尿生殖肿瘤与健康长寿之梦&rdquo;。我们的办会宗旨是为泌尿生殖肿瘤领域的基础与临床工作者提供有关泌尿生殖肿瘤新知识和新技术的交流平台，&nbsp;探讨现代融合医学和转化医学理念为泌尿生殖肿瘤基础和临床科学研究拓展的新思路和新方法，&nbsp;提高泌尿生殖肿瘤的诊疗水平，提高肿瘤病人的生殖和性功能健康，&nbsp;为人类健康长寿做出更大贡献。</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">本次大会学术委员会将邀请美国&nbsp;Tom F Lue教授、Wanyne Hellstrone教授、Arthur Burnet教授、王润教授、Chawnshang Chang教授、Amilca Flores教授,亚太地区Wun-Jae Kim教授、Nam Cheul Park教授、Sae Woong Kim教授以及GUA-CPAM辛钟成教授、牛远杰教授、丘少鹏教授、王平教授、邢念增教授、许传亮教授、周利群教授、白志明教授、蔡志明教授、刘继红教授等。本次大会拟邀请人员800至1000人国内外专家参会。本次大会将通过大会报告、专题讲座、论文交流、手术视频交流和现场手术演示等多种方式展现当前国内外泌尿生殖肿瘤领域的基础和临床最新研究进展。参加本次会议可获得国家级继续教育学分，并将评选10篇优秀论文给予学术奖励。</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">真诚欢迎各位专家踊跃投稿参加本次盛会，为实现&ldquo;泌尿生殖健康与健康长寿之梦&rdquo;做出更大贡献！</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">中国医疗保健国际交流促进会</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">中国医促会泌尿生殖分会</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">2015年10月</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">会议名称：HMF-GUT 2016 &amp; GITAU 2016</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">会议时间：2016年4月15-17日</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">会议地点：天津大礼堂（天津）</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">会议网站：<a href=\"http://www.gua-cpam.org/\" style=\"text-decoration: none; color: rgb(52, 52, 52);\">http://www.gua-cpam.org/</a></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">论文截止时间：2016年2月28日</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">&nbsp;</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">&nbsp;</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\"><font color=\"#1e50a2\">会议类型：学术大会&nbsp;&nbsp;&nbsp;&nbsp;会议学科：外科&nbsp;&nbsp;&nbsp;&nbsp;会议规模：500-1000人<br />\r\n　　会议地点：天津市河西区<br />\r\n　　会议时间：2016-04-15&nbsp;至&nbsp;2016-04-17<br />\r\n　　会议学分：有学分&nbsp;&nbsp;&nbsp;&nbsp;国家一类&nbsp;&nbsp;&nbsp;&nbsp;6分&nbsp;<br />\r\n　　联系人员：陈子龙&nbsp;&nbsp;&nbsp;&nbsp;联系电话：010-87380158&nbsp;&nbsp;&nbsp;&nbsp;传真号码：<br />\r\n　　电子邮件：evanchen@healife.com&nbsp;</font></p>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('32','<span style=\"color: rgb(0, 0, 0); font-family: Arial; line-height: 30px; text-align: justify; text-indent: 24px; widows: auto;\">&nbsp; &nbsp; 消化领域的快速发展为消化疾病诊疗带来了革命性突破，各种新技术、新方法不断涌现。为进一步加强国内外新技术的学术交流，促进我国消化领域事业的彭勃发展，2015首届世界消化大会将于2015年12月18-20日在中国南京隆重召开。本次大会将是国内消化疾病领域规模最大的学术盛会，预计将有150余名海内外代表出席，将成为引领和推动中国消化医学改革和发展的重要平台，并将以参会规模最大，参加国别最多，会议活动最多，专业人士最多，媒体关注度最高等竞争实力，成为业内充分认可的国际化程度高、影响力大的&ldquo;中国消化医学领域高端国际会议&rdquo;。会议期间，将组织开幕式、主题论坛、平行分组会议、圆桌会议、专题辩论、病理分享沙龙等多种精彩丰富的活动。</span><br />\r\n<br />\r\n<span style=\"color: rgb(30, 80, 162); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">&nbsp; &nbsp; 会议类型：国际会议&nbsp;&nbsp;&nbsp;&nbsp;会议学科：消化&nbsp;&nbsp;&nbsp;&nbsp;会议规模：200-300人 </span><br style=\"color: rgb(30, 80, 162); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(30, 80, 162); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">　　会议地点：江苏省南京市 </span><br style=\"color: rgb(30, 80, 162); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(30, 80, 162); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">　　会议时间：2015-12-18&nbsp;至&nbsp;2015-12-20 </span><br style=\"color: rgb(30, 80, 162); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(30, 80, 162); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">　　联系人员：韩松&nbsp;&nbsp;&nbsp;&nbsp;联系电话：0411-84799609-804&nbsp;&nbsp;&nbsp;&nbsp;传真号码：0411-84796897 </span><br style=\"color: rgb(30, 80, 162); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(30, 80, 162); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">　　电子邮件：mandy@bitcongress.com&nbsp;</span>','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('33','<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">&nbsp; &nbsp; &ldquo;十二五&rdquo;规划以来，我国已明确把康复保健和预防保健、基本医疗并列，纳入国家总体发展规划之中。为提高康复理疗行业从业人员的技术水平，为社会培养合格的康复理疗从业人员，提高居民健康水平，促进社会和谐发展，中国医促会中老年医疗保健分会特开展康复理疗师岗位考前培训项目。</span>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">&nbsp;&nbsp;&nbsp; 康复理疗师：针对亚健康人群以及中老年人群，运用相关知识和技能从事健康服务、预防、保健、养生、理疗、康复的人员。<br />\r\n&nbsp;&nbsp;&nbsp; 一、招生对象和申报条件<br />\r\n&nbsp;&nbsp;&nbsp; 大专院校医学相关专业学生；康复、护理行业从业人员；<br />\r\n&nbsp;&nbsp;&nbsp; 有意向从事康复、护理行业的社会待业人员。<br />\r\n&nbsp;&nbsp;&nbsp; 要求爱岗敬业、诚实守信、掌握相关基础知识、接受能力强，具备参加本培训所需的基本文化水平。<br />\r\n&nbsp;&nbsp;&nbsp; 二、培训时间和形式<br />\r\n&nbsp;&nbsp;&nbsp; 集中培训 40 学时。采取理论与实操相结合的培训模式。<br />\r\n&nbsp;&nbsp;&nbsp; 三、培训教材和授课内容<br />\r\n&nbsp;&nbsp;&nbsp; 统一教材《康复理疗师岗位培训教材》<br />\r\n&nbsp;&nbsp;&nbsp; 授课内容包括康复训练基础知识、基础技能、膳食营养与康复理疗、心理保健专业技能、运动与康复、中医养生保健与康复、物理因子康复理疗、常见的康复理疗技术等。<br />\r\n&nbsp;&nbsp;&nbsp; 四、结业<br />\r\n&nbsp;&nbsp;&nbsp; 经考试合格者，由人力资源和社会保障部教育培训中心颁发《康复理疗师岗位培训合格证书》，该证书可在人力资源和社会保障部教育培训网上查询。<br />\r\n&nbsp;&nbsp;&nbsp; 五、 报名须知<br />\r\n&nbsp;&nbsp;&nbsp; 从即日起报名，报名时需提交本人身份证复印件、学历证复印件、报名表和 2 寸蓝底证件照 4 张，学费 3680 元。<br />\r\n&nbsp;&nbsp;&nbsp; 六、报名方式<br />\r\n&nbsp;&nbsp;&nbsp; 联系方式：张海峰（13910323475）<br />\r\n&nbsp;&nbsp;&nbsp; 报名地址：北京市朝阳区青年沟路 23 号安源大厦</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\"><font color=\"#1e50a2\">会议类型：取证班&nbsp;&nbsp;&nbsp;&nbsp;会议学科：全科与康复&nbsp;&nbsp;&nbsp;&nbsp;会议规模：100人以内<br />\r\n　　会议地点：北京市朝阳区<br />\r\n　　会议时间：2015-12-31&nbsp;至&nbsp;2016-06-30<br />\r\n　　联系人员：张海峰&nbsp;&nbsp;&nbsp;&nbsp;联系电话：13910323475 &nbsp;<br />\r\n　　电子邮件：teseyiliao@163.com&nbsp;</font></p>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('34','<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">&nbsp; &nbsp; 展望未来，昂扬奋进，展翅腾飞，为了进一步推动中国心血管相关疾病的学术和临床诊治发展，第七届国际心脏病大会（ICC）将于2015年12月4-6日在上海举行，我们非常荣幸地代表组委会诚挚邀请您参加此次盛会。走过硕果累累的六年，ICC将再一次走在心脏病学研究与交流的前沿，为国内专家、学者和医生提供与国际交流的最佳窗口，引领我国心脏病学事业的前进步伐。</span>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">&nbsp;<br />\r\n&nbsp; &nbsp; 本次大会以&ldquo;为生命注入新活力&rdquo;为主题，将延续其以往鲜明的专业化、国际化特色，并对大会内容做进一步的充实和完善。我们诚挚地邀请您出席本次大会并做专题学术报告，与海内外同仁相互交流，共同分享彼此的研究成果。&nbsp;<br />\r\n&nbsp;<br />\r\n&nbsp; &nbsp; 本届大会涉及学术领域宽广、内容丰富，多角度分析临床、学术领域问题，拟邀请来自国内外著名的心血管病专家莅临讲学，就心血管基础与转化医学，心脏功能与心力衰竭，结构性心脏病，冠状动脉疾病，心律失常及心脏起搏电生理，高血压和外周血管疾病，卒中/外科/介入，心血管影像与诊断，预防、危险控制、护理及康复等方面取得的新成就，介绍最新进展，对热点问题进行深入讨论和经验交流，提高临床水平。对于参与者来说，不仅有机会分享科学信息和最新研究进程，更能交流心脏病学最权威的知识和经验。大会主要活动有开幕式、主题论坛、专题讨论会、展览展示、海报展示、项目合作洽谈会、欢迎晚宴、参观当地医疗机构和科研院所等。<br />\r\n&nbsp;<br />\r\n&nbsp; &nbsp; 衷心希望ICC在各位同道、合作伙伴及企业单位的帮助和共同支持下，携手同行，共襄盛会！我们期待与您岁末相会于上海！<br />\r\n&nbsp;<br />\r\n本次大会日程分为中文报告和英文报告两部分，更多会议信息请参见http: //www.bitcongress.com/icc2015/cn<br />\r\n&nbsp;<br />\r\n&nbsp; &nbsp; 大会有幸邀请到了多家海内外知名心血管研究中心和机构的嘉宾参加此次大会。如：<br />\r\n国外知名机构：美国梅奥诊所，澳大利亚墨尔本贝克心脏病和糖尿病研究所，哈佛大学医学院附属布莱根妇女医院，以色列理工学院，英国国立心肺研究所，美国加州大学，美国密歇根大学心律失常研究中心，美国德克萨斯心脏研究所，德国莱比锡大学心脏中心，比利时鲁汶大学医院，意大利米兰大学，芝加哥大学医学中心，丹麦哥本哈根大学医院，西奈山医院，马萨诸塞州总医院心血管研究中心，加拿大英属哥伦比亚大学，奥地利维也纳综合医院，加拿大蒙特利尔心脏研究所，NeuroVive制药公司，澳大利亚墨尔本大学皇家儿童医院，美国约翰.霍普金斯医院，意大利帕多瓦大学医学院，AdjuCor有限公司，美国哥伦比亚大学，以色列特拉维夫医学中心，巴西圣保罗大学<br />\r\n&nbsp;<br />\r\n&nbsp; &nbsp; 国内知名机构：北京协和医院，北京安贞医院，阜外医院心血管研究所，第二军医大学附属长征医院，上海交通大学医学院仁济医院，南京医科大学，广东省人民医院，四川普莱美生物科技有限公司，广东省立医院，中南大学湘雅二医院，首都医科大学，北京军区总医院，上海交通大学附属第六人民医院<br />\r\n&nbsp;</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\"><font color=\"#1e50a2\">会议类型：学术大会&nbsp;&nbsp;&nbsp;&nbsp;会议学科：心血管&nbsp;&nbsp;&nbsp;&nbsp;会议规模：100人以内<br />\r\n　　会议地点：上海市浦东新区<br />\r\n　　会议时间：2015-12-04&nbsp;至&nbsp;2015-12-06<br />\r\n　　会议学分：有学分&nbsp;&nbsp;&nbsp;&nbsp;国家一类&nbsp;&nbsp;&nbsp;&nbsp;1分&nbsp;<br />\r\n　　联系人员：奚宁&nbsp;&nbsp;&nbsp;&nbsp;联系电话：086-411-84799609-816 &nbsp;<br />\r\n　　电子邮件：cloris@bitconferences.cn&nbsp;</font></p>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('35','<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">&nbsp; &nbsp; 由百奥泰国际会议（大连）有限公司主办，安益集团--茵康国际会议股份有限公司作为支持单位的&ldquo;2015第五届国际内分泌与代谢大会&rdquo;、&ldquo;2015第四届国际糖尿病学大会&rdquo;将于2015年11月26-28日在台湾高雄召开。</span>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">截至目前，百奥泰国际会议（大连）有限公司已成功举办四届内分泌与代谢大会，糖尿病大会也已成功举办三届。本届大会将邀请众多内分泌与代谢、糖尿病领域的国内外知名演讲人，共聚一堂，讨论该领域的热点话题，分享最新的科研成果。届时将为国内专家学者、企业精英搭建专题演讲与交流合作的平台。会议围绕&ldquo;糖尿病学&rdquo;、&ldquo;内分泌与代谢&rdquo;，展开100多场口头报告，覆盖内分泌与代谢、糖尿病的30多个热点话题，聆听国内外著名演讲人的最新科研成果。会议期间，还可以畅游宝岛台湾、品尝特色美食。在此，我们期待您的到来与加入。</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">同期会议如下：2015首届国际失智症大会、2015第三届国际老年病学大会，四会联动，一次注册，均可参加！</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">美丽台湾</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">宝岛台湾，风景宜人。最著名的阿里山，是台湾秀丽俊美风光的象征，是台湾最理想的避暑胜地。地处亚热带海洋中的台湾，气候温和宜人，关山位于垦丁西南部，是观赏日落的绝佳胜地，每到日落时分，总有很多游客拍摄日落美景。因此，关山日落也被称为南台湾八大美景之一。士林夜市是台北最著名。也是最平民化的去处，在那里，你可以吃到各种各样的风味小吃。</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">官方网站：<a href=\"http://www.bitcongress.com/wce2015/cn/default.asp\" style=\"text-decoration: none; color: rgb(52, 52, 52);\">http://www.bitcongress.com/wce2015/cn/default.asp</a>（中）</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"http://www.bitcongress.com/wce2015/default.asp\" style=\"text-decoration: none; color: rgb(52, 52, 52);\">http://www.bitcongress.com/wce2015/default.asp</a>（英）</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">联系方式：</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\"><strong>参会、演讲联系人：</strong></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">联系人：郝艳茹</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">电话：0411-84799609-826</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">邮箱：<a href=\"mailto:Haoyr@bitcongress.com\" style=\"text-decoration: none; color: rgb(52, 52, 52);\">Haoyr@bitcongress.com</a></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">地址：辽宁省大连市高新园区汇贤园1号11层</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\"><strong>展位、赞助联系人：</strong></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">联系人：郭健新</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">电话：0411-84799609-829</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">传真：0411-84799629</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">邮箱：<a href=\"mailto:amy@bitlifesciences.com\" style=\"text-decoration: none; color: rgb(52, 52, 52);\">amy@bitlifesciences.com</a></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">地址：辽宁省大连市高新园区汇贤园1号11层</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">&nbsp;</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\"><font color=\"#1e50a2\">会议类型：国际会议&nbsp;&nbsp;&nbsp;&nbsp;会议学科：内分泌&nbsp;&nbsp;&nbsp;&nbsp;会议规模：1000-2000人<br />\r\n　　会议地点：台湾高雄市<br />\r\n　　会议时间：2015-11-26&nbsp;至&nbsp;2015-11-28<br />\r\n　　联系人员：会务组&nbsp;&nbsp;&nbsp;&nbsp;联系电话：0411-84799609-826 &nbsp;&nbsp;<br />\r\n　　电子邮件：haoyr@bitcongress.com&nbsp;</font></p>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('36','<span style=\"font-size: 13pt; color: rgb(52, 52, 52); font-family: 宋体; line-height: 24px; text-align: justify; text-indent: 25.5pt; widows: auto;\">&nbsp; &nbsp; 中华慢性病防治联合会以&ldquo;上医治未病&rdquo;的中华传统医学文化理念为宗旨，为进一步提高慢性病防治在卫生保健工作中的地位和作用，团结和促进世界华人群体关心慢性病预防与治疗的组织机构之间的了解与合作，加强慢病防治的学术交流，促进慢病防治医学成果与生产相结合，为中华民族的伟大复兴中国梦提供强大的健康基础而服务，本会现开展聘任会员工作。</span>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 25.6pt;\"><span style=\"font-size: 13pt; font-weight: bold;\">一、中华慢性病防治联合会的主要业务范围与职能</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 25.5pt;\"><span style=\"font-size: 13pt;\">1、为全体会员提供课题开发、研讨、健康公益平台搭建、研究成果转化对接等，创设会员之间的交流平台与合作机会。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 25.5pt;\"><span style=\"font-size: 13pt;\">2、协助政府相关部门开展慢性病健康教育与慢性病防治促进活动；支持边远贫困地区慢性病防治教育和慢性病健康促进机构建设，推动城乡整体健康事业的发展；规范慢性病防治管理，提升慢性病防治的重要地位，促进慢性病防治在各地健康有序地推广。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 25.5pt;\"><span style=\"font-size: 13pt;\">3、发展慢性病防治教育，通过制定培训规划、建立培训机制、人才流动机制、开办培训班、远程教育、资格考试等多种形式，开展防御医学教育、考试与培训，提高从业人员的素质与学术水平。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 25.5pt;\"><span style=\"font-size: 13pt;\">4、开展慢性病预防与治疗的从业人员培训工作，为相关专家团体提供技术咨询，技术培训，技术转让提供交流平台。为健康相关行业经营管理提供智力支持；</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 25.5pt;\"><span style=\"font-size: 13pt;\">5、组织世界慢性病与人类健康学术大会、学术研讨会。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 25.5pt;\"><span style=\"font-size: 13pt;\">6、完成与世界卫生组织建立正式关系所承担的工作，实施世界卫生组织慢性病防治战略；宣传和推广防御医学。奖励在慢性病防治教育和防御医学领域做出重要贡献的人员。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 25.6pt;\"><span style=\"font-size: 13pt; font-weight: bold;\">二、入会程序</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 25.5pt;\"><span style=\"font-size: 13pt;\">1、申请入会者填写会员审批表并一次性交纳注册费630元（含工本费）。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 25.5pt;\"><span style=\"font-size: 13pt;\">2、审核合格发放会员证，每四年换发一次。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 26.1pt;\"><span style=\"font-size: 13pt; font-weight: bold;\">三、</span><span style=\"font-size: 13pt; font-weight: bold;\">养生保健师、康复理疗师从业人员岗位职业培训</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 26pt;\"><span style=\"font-size: 13pt;\">本会近期的工作重点之一，是根据国家&ldquo;卫生事业发展十二五规划&rdquo;，贯彻落实《全国健康教育与健康促进工作规划纲要》精神，推进我国医疗机构养生保健从业人员相关资质的规范化培训和认证工作，</span><span style=\"font-size: 13pt;\">开展养生保健师、康复理疗师从业人员岗位职业培训</span><span style=\"font-size: 13pt;\">。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 26pt;\"><span style=\"font-size: 13pt;\">●</span><span style=\"font-size: 13pt; font-weight: bold;\">养生保健师：</span><span style=\"font-size: 13pt;\">是利用中医体质养生理论和传统养生保健技术，对个体或群体的体质情况进行分析、评估、调理、指导，通过</span><span style=\"font-size: 13pt;\">综合性</span><span style=\"font-size: 13pt;\">、针对性调养</span><span style=\"font-size: 13pt;\">措施</span><span style=\"font-size: 13pt;\">，制定出不同体质类型人群的个性化养生方案，实现阴阳平衡协调，促进健康、延长寿命的专业养生保健技术人员。养生保健师是我国养生保健行业新兴的知识型、技能型综合类人才，属于全新领域及高薪职位，目前人才缺口巨大。</span><span style=\"font-size: 13pt;\">养生保健师培训注重中国传统养生与现代科学养生的结合，深入传授中西医养生知识和传统养生精髓，为人们提供全面系统的养生指导、全方位的健康教育，及实效性更强的养生技能培训。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 26pt;\"><span style=\"font-size: 13pt;\">●</span><span style=\"font-size: 13pt; font-weight: bold;\">康复理疗师</span><span style=\"font-size: 13pt;\">：康复理疗技术是根据传统医学理论，运用针灸刮痧、推拿点穴、拔罐热疗、耳穴诊治、反射疗法、心理疗法、饮食疗法等防治疾病，简单易行、无痛苦、无毒副作用、疗效显著，是亚健康状态防治的重要手段。是康复理疗技术的高级技术应用性专门人才。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\"><span style=\"font-size: 13pt; font-weight: bold;\">【培训科目】&nbsp;养生保健师&nbsp;&nbsp;&nbsp;康复理疗师</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: -89.55pt; margin-left: 89.55pt;\"><span style=\"font-size: 13pt; font-weight: bold;\">&nbsp; &nbsp;【收费标准】</span><span style=\"font-size: 13pt;\">&nbsp;</span><span style=\"font-size: 13pt; font-weight: bold;\">报名费均为300元/人，培训费均为2600元</span><span style=\"font-size: 13pt; font-weight: bold;\">/</span><span style=\"font-size: 13pt; font-weight: bold;\">人。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\"><span style=\"font-size: 13pt; font-weight: bold;\">【其他事宜】&nbsp;&nbsp;</span><span style=\"font-size: 13pt;\">对于培训班毕业学生，将颁发国家</span><span style=\"font-size: 13pt;\">人社部中国就业培训技术指导中心师资《职业培训证书》或国家中医药管理局中华中医药学会师资《专业技术培训证书》任选其一，如办理双证需加收1000元。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 21pt; widows: auto;\"><span style=\"font-size: 10.5pt;\">根据《职业教育法》规定，</span><span style=\"font-size: 10.5pt;\">颁发的国家</span><span style=\"font-size: 10.5pt;\">人社部中国就业培训技术指导中心师资《职业培训证书》、国家中医药管理局中华中医药学会师资《专业技术培训证书》可以作为从业凭证；同时，在申请职业技能时，可以作为相关职业资格培训的证明。该证书具有高度的权威性，全国通用，是求职、任职、单位录用的重要依据；该证书带有防伪标识，其序列号为唯一号码，可在人力资源和社会保障部中国职业培训与技能鉴定服务网（</span><span style=\"font-size: 10.5pt;\">http://</span><span style=\"font-size: 10.5pt;\">www.cettic.cn）</span><span style=\"font-size: 10.5pt;\">&nbsp;</span><span style=\"font-size: 10.5pt;\">和中华中医药学会网站（</span><span style=\"font-size: 10.5pt;\">http://www.cacm.org.cn</span><span style=\"font-size: 10.5pt;\">）查询。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 32.65pt;\">&nbsp;</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 30pt;\">&nbsp;</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 30pt;\"><span style=\"color: rgb(0, 0, 0); font-size: 12pt;\">邮&nbsp;&nbsp;编：100853 &nbsp; &nbsp;&nbsp;</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">&nbsp;</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\"><font color=\"#1e50a2\">会议类型：取证班&nbsp;&nbsp;&nbsp;&nbsp;会议学科：全科与康复&nbsp;&nbsp;&nbsp;&nbsp;会议规模：200-300人<br />\r\n　　会议地点：北京市海淀区<br />\r\n　　会议时间：2015-11-11&nbsp;至&nbsp;2015-11-13<br />\r\n　　联系人员：张福会&nbsp;&nbsp;&nbsp;&nbsp;联系电话：13552154812 &nbsp;&nbsp;<br />\r\n　　电子邮件：13552154812@163.com&nbsp;</font></p>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('37','<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-indent: 28px; widows: auto;\">第43期全国现代医院岗位设计绩效考核与管理高端培训班</span><br />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【课程背景】&ldquo;卓越绩效模式&rdquo;是现代医院全面绩效管理与经营的科</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">学化、标准化、规范化和常态化的管理，是现代医院成功的必经之路，</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">是事实上的全球卓越管理的&ldquo;圣经&rdquo;。我们从事绩效考核与管理培训</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">工作的这些年中，发现医院对绩效管理的认识在不断深化，所面临的</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">问题逐渐具体化，这就是医院、科室、部门员工岗位设计与绩效考核</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">和管理的标准制定、检查岗位系数设置、绩效管理的落实问题。为此，</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">我们在江苏省�9�9苏州市召开&ldquo;第43期全国现代医院岗位设计绩效考核</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">与管理实战培训班&rdquo;。培训目的是使医院绩效考核与管理常态化，建立</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">现代医院可持续发展的绩效文化，这样就能够更好地贯彻《卫生部关于</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">开展卫生管理干部岗位培训通知》精神和要求。</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【主办单位】北京卓越医院管理研究院</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">中国质量与绩效管理研究中心</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【学员对象】卫生厅、局相关领导，医院院长、副院长、人力资源部</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">部长、医务部主任、护理部主任和院办主任等职能部门科长及医院科</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">室中高层管理人士。</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【培训地点】江苏省�9�9苏州市</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【时 间】 2015年11月13 ― 16日。11月13日全天报到。</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">11月14日--15日连续上课两天,16日撤离。</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【培训费用】2980元/人（包括：会务培训费、讲义、结业证书、</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">餐、中餐、信息咨询、照相合影、茶水等相关资料）。住宿、晚餐饮</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">食自理，统一安排。</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【课程特色】理论讲授＋案例分析＋现场互动＋经验分享</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【绩效管理当前焦点问题】绩效管理七个焦点问题：</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【焦点一】怎样制定医院职能部门、机关、后勤人员的岗位绩效考核</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">标准。全国医院绩效考核与管理高级实战培训班把医院职能部门、机</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">关、后勤人员岗位设计、绩效考核标准的制定作为重点内容讲解，特</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">别讲清后勤员工绩效考核标准制定，这样困扰我们多年的职能部门、</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">机关、后勤人员岗位设计、绩效考核标准老大难问题在培训班上将得</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">到彻底解决。</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">职能部门、后勤人员绩效考核标准培训班上有标准！</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【焦点二】怎样制定临床、医技科室、护理人员的岗位绩效</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">考核标准。这是提到我们面前迫切需要解决的问题。我们在培训班上</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">将从岗位设计、岗位说明书撰写，数量、质量指标的权重上按照绩效</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">考核与管理原则重新设计，新设计的临床科室、医技科室、护理人员、</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">职能部门、机关后勤人员的绩效考核与管理标准更加符合现代医院管</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">理的要求，更加符合现代顾客的需求，更加符合国家卫生部要求，更</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">加能够达到病人和员工满意要求。这些问题培训班上全能够解决！</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【焦点三】医院关键业绩指标与非关键业绩指标之间的矛盾。设计医院绩效考核与管理标准都会遇到一个问题，即关键业绩指标问题。我们采用的国际、国家、卫生部通用的的七项卓越绩效关键指标考评法。因为医院是一个整体，你会发现一个部门、科室的关键业绩，往往取决于别的部门、科室的配合，而别的部门、科室的配合工作，对于这个部门、科室又是一个非关键业绩，这样，就产生了一个两难问题，都考核，就会发现考核指标太多，不考核，又不全面。如何解决医院处理关键业绩与非关键业绩的问题呢？培训班上有答案！</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【焦点四】怎样设置与应用绩效考核中的六类岗位系数？即岗位职务系数、职称系数、工作资历系数、学历系数、同资历同学历同岗位不同工作时间的岗位系数？医院当月绩效考核后，领导、管理岗位、职称、学历、工作资历怎么确定系数比例；特别是没有职称、没有行政职位的后勤人员及其他人员工作资历系数怎么确定；怎样划分学历系数以及怎样加减系数。这些具体绩效考核与管理中的人员系数的成败关键问题，绩效奖金分配中的细节问题，培训班上老师详细破解难题，给你标准答案！</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【焦点五】临床、医技科室、职能部门、后勤人员绩效奖金比例问题。究竟这些科室、部门在奖金分配中怎样确定比例问题，这是一个老大难问题。这些问题在培训班上一一解读。</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【焦点六】科室绩效奖金二次分配问题。绩效奖金分配最难的是科室二次奖金分配，用什么方法进行奖金分配，怎样分配大家没有意见。这些疑难细节问题，学习班上一一破解。</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【焦点七】绩效考核结果兑现问题。有一家医院所处的环境受到宏观因素的影响。去年，上级、医院和他签订了绩效目标责任书，他年底大大地超过了年初所制定的绩效目标，按照目标责任书所规定的内容，他的奖金该多发好多倍，但是领导确没有给他兑现，如果遇到这样问题怎样处理。有办法！这些问题咱们在培训班上找取答案！</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【培训老师】任真年 主任医师 博士 教授 北京卓越医院管理研究院院长。任教授2012年10月由协和医科大学出版社出版160万字《现代医院卓越绩效考评与管理》专著，2015年5月已由中国协和医科大学出版社出版230万字上、下两册《现代医院卓越绩效考评与管理标准大全》专著。任教授已讲授绩效考核与管理课程近千场次。中国医院协会医疗质量管理委员会副主任委员。《中国医院院长》特邀主编。有医院管理30多年的经验。</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【优惠办法】团队10人以上参加会议者，</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【培训证书】会议代表、学员完成研讨班规定的学习课程，由中国医院质量与绩效管理研究中心和北京卓越医院管理研究院颁发《中国现代医院管理高级研修班结业证书》。</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【联系老师】刘梦雨老师电话：010―65735932</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【手机】13520430150</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【传真报名】010-65735932</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">【Q Q报名】644694099@qq.com</span><br style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\" />\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('38','<span style=\"color: rgb(52, 52, 52); font-family: 宋体; line-height: 24px; text-align: center; text-indent: 28px; widows: auto; font-weight: bold; font-size: 18pt;\">关于举办&ldquo;</span><span style=\"color: rgb(52, 52, 52); font-family: 宋体; line-height: 24px; text-align: center; text-indent: 28px; widows: auto; font-weight: bold; font-size: 18pt;\">儿科</span><span style=\"color: rgb(52, 52, 52); font-family: 宋体; line-height: 24px; text-align: center; text-indent: 28px; widows: auto; font-weight: bold; font-size: 18pt;\">重症监护实用技术及管理&rdquo;培训班</span>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-indent: 28px; widows: auto; text-align: center;\"><span style=\"font-weight: bold; font-size: 18pt;\">通&nbsp;&nbsp;知</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-indent: 28px; widows: auto; text-align: center;\"><span style=\"font-weight: bold; font-size: 10.5pt;\">国家级继续医学教育项目编号：</span><span style=\"font-weight: bold; font-size: 10.5pt;\">2015-14-04-01</span><span style=\"font-weight: bold; font-size: 10.5pt;\">4</span><span style=\"font-weight: bold; font-size: 10.5pt;\">&nbsp;(国)</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 24pt;\"><span style=\"font-size: 12pt;\">随着儿科医疗技术的发展，众多的监测、生命支持设备及技术应用于危重症儿童的抢救和治疗中，使得救治成功率越来越高。</span><span style=\"font-size: 12pt;\">监护</span><span style=\"font-size: 12pt;\">技术的进步也促进了儿科重症护理学的发展。儿科重症监护已成为涉及多学科、多层面知识与技能的学科，专业性、技术性要求越来越高，如何为重症儿童提供安全、有效的护理已成为护理管理者及ICU专科护士积极探索的课题</span><span style=\"font-size: 12pt;\">，</span><span style=\"font-size: 12pt;\">ICU护士不但需要掌握专科理论知识和技能，而且应能够应用先进的医疗仪器设备及监护技术，对重症儿童进行连续、动态的观察及护理。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 24pt;\"><span style=\"font-size: 12pt;\">首都医科大学附属北京儿童医院拟定于2015年</span><span style=\"font-weight: bold; font-size: 12pt;\">11</span><span style=\"font-weight: bold; font-size: 12pt;\">月&nbsp;</span><span style=\"font-size: 12pt;\">在北京举办&ldquo;</span><span style=\"font-size: 12pt;\">儿科</span><span style=\"font-size: 12pt;\">重症监护实用技术及管理&rdquo;培训班。本次培训</span><span style=\"font-size: 12pt;\">在反映儿科</span><span style=\"font-size: 12pt;\">危重症</span><span style=\"font-size: 12pt;\">医学最新进展和成就同时，</span><span style=\"font-size: 12pt;\">将详细讲授</span><span style=\"font-size: 12pt;\">儿童</span><span style=\"font-size: 12pt;\">危重症监护</span><span style=\"font-size: 12pt;\">技能</span><span style=\"font-size: 12pt;\">，</span><span style=\"font-size: 12pt;\">重症护理</span><span style=\"font-size: 12pt;\">新进展以及护理管理等方面的相关知识</span><span style=\"font-size: 12pt;\">，</span><span style=\"font-size: 12pt;\">通过培训使</span><span style=\"font-size: 12pt;\">儿科</span><span style=\"font-size: 12pt;\">医护</span><span style=\"font-size: 12pt;\">人员能够</span><span style=\"font-size: 12pt;\">熟练</span><span style=\"font-size: 12pt;\">运用</span><span style=\"font-size: 12pt;\">相关的</span><span style=\"font-size: 12pt;\">监护抢救技术，</span><span style=\"font-size: 12pt;\">熟悉的护理质量管理工具，</span><span style=\"font-size: 12pt;\">指导临床</span><span style=\"font-size: 12pt;\">儿童危重症</span><span style=\"font-size: 12pt;\">抢救工作的实施</span><span style=\"font-size: 12pt;\">和科室的建设，</span><span style=\"font-size: 12pt;\">提升儿科</span><span style=\"font-size: 12pt;\">重症监护技术及抢救监护水平</span><span style=\"font-size: 12pt;\">。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 24pt;\"><span style=\"font-size: 12pt;\">本培训班</span><span style=\"font-family: \'Times New Roman\'; font-size: 12pt;\">在儿科</span><span style=\"font-size: 12pt;\">重症</span><span style=\"font-family: \'Times New Roman\'; font-size: 12pt;\">领域具有前瞻性和实效性。大部分授课老师接受过美国心脏学会标准化的心肺复苏抢救技术培训获取证书。</span><span style=\"font-size: 12pt;\">欢迎</span><span style=\"font-weight: bold; font-size: 12pt;\">全国各级医疗单位儿科、急诊、ICU的医护及管理人员参会交流</span><span style=\"font-size: 12pt;\">。参会学员将授予</span><span style=\"font-weight: bold; font-size: 12pt;\">国家级继续医学教育学分10学分</span><span style=\"font-weight: bold; font-size: 12pt;\">，免费赠送光盘</span><span style=\"font-weight: bold; font-size: 12pt;\">。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\"><span style=\"font-weight: bold; font-size: 12pt;\">一、培训地点及时间：</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; margin-left: 316.05pt; text-indent: -287.9pt;\"><span style=\"font-weight: bold; font-size: 12pt;\">地&nbsp;&nbsp;点：</span><span style=\"font-family: 新宋体; font-weight: bold; font-size: 12pt;\">北　京&nbsp;</span><span style=\"font-family: 新宋体; font-weight: bold; font-size: 12pt;\">2015年</span><span style=\"font-family: 新宋体; font-weight: bold; font-size: 12pt;\">11</span><span style=\"font-family: 新宋体; font-weight: bold; font-size: 12pt;\">月</span><span style=\"font-family: 新宋体; font-weight: bold; font-size: 12pt;\">10</span><span style=\"font-family: 新宋体; font-weight: bold; font-size: 12pt;\">日―</span><span style=\"font-family: 新宋体; font-weight: bold; font-size: 12pt;\">11</span><span style=\"font-family: 新宋体; font-weight: bold; font-size: 12pt;\">月</span><span style=\"font-family: 新宋体; font-weight: bold; font-size: 12pt;\">16</span><span style=\"font-family: 新宋体; font-weight: bold; font-size: 12pt;\">日</span><span style=\"font-family: 新宋体; font-weight: bold; font-size: 12pt;\">(</span><span style=\"font-family: 新宋体; font-weight: bold; font-size: 12pt;\">10</span><span style=\"font-family: 新宋体; font-weight: bold; font-size: 12pt;\">日报到，</span><span style=\"font-family: 新宋体; font-weight: bold; font-size: 12pt;\">16</span><span style=\"font-family: 新宋体; font-weight: bold; font-size: 12pt;\">日撤离)</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\"><span style=\"font-weight: bold; font-size: 12pt;\">二</span><span style=\"font-weight: bold; font-size: 12pt;\">、收费标准：</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 24pt;\"><span style=\"font-size: 12pt;\">会务费</span><span style=\"font-weight: bold; font-size: 12pt;\">1080</span><span style=\"font-size: 12pt;\">元</span><span style=\"font-size: 12pt;\">（含培训费、资料费），</span><span style=\"font-size: 12pt;\">住宿统一安排，费用自理</span><span style=\"font-size: 12pt;\">。</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 24pt;\"><span style=\"font-size: 12pt;\">参观首都医科大学附属北京儿童医院另交纳</span><span style=\"font-size: 12pt;\">100元</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\"><span style=\"font-weight: bold; font-size: 12pt;\">三、报名方式：</span><span style=\"font-size: 12pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 23.2pt;\"><span style=\"font-weight: bold; font-size: 12pt;\">联系人：</span><span style=\"font-weight: bold; font-size: 12pt;\">赵</span><span style=\"font-weight: bold; font-size: 12pt;\">&nbsp;</span><span style=\"font-weight: bold; font-size: 12pt;\">燕</span><span style=\"font-weight: bold; font-size: 12pt;\">&nbsp;</span><span style=\"font-size: 12pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 23.2pt;\"><span style=\"font-weight: bold; font-size: 12pt;\">电&nbsp;&nbsp;话：</span><span style=\"font-weight: bold; font-size: 12pt;\">13621282670</span><span style=\"font-weight: bold; font-size: 12pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E-mail：&nbsp;&nbsp;</span><span style=\"font-weight: bold; font-size: 12pt;\">gj</span><span style=\"font-weight: bold; font-size: 12pt;\">d889911@163.com&nbsp;</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; text-indent: 23.2pt;\"><span style=\"font-weight: bold; font-size: 12pt;\">传&nbsp;&nbsp;真：010―526360</span><span style=\"font-weight: bold; font-size: 12pt;\">68</span><span style=\"font-weight: bold; font-size: 12pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;短信报名&nbsp;：</span><span style=\"font-weight: bold; font-size: 12pt;\">13621282670</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">&nbsp;</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; margin-left: 5.25pt; text-indent: 28.1pt;\"><span style=\"font-weight: bold; font-size: 12pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size: 12pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; widows: auto; margin-left: 5.25pt; text-indent: 28.1pt;\">&nbsp;</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; widows: auto; text-align: right; margin-left: 5.25pt; text-indent: 28.1pt;\"><span style=\"font-size: 12pt;\">首都医科大学附属北京儿童医</span><span style=\"font-size: 12pt;\">院护理部</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; widows: auto; text-align: right; margin-left: 354pt; text-indent: -354pt;\"><span style=\"font-size: 12pt;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2015年9月</span></p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">&nbsp;</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\"><font color=\"#1e50a2\">会议类型：培训班&nbsp;&nbsp;&nbsp;&nbsp;会议学科：护理&nbsp;&nbsp;&nbsp;&nbsp;会议规模：200-300人<br />\r\n　　会议地点：北京市丰台区<br />\r\n　　会议时间：2015-11-10&nbsp;至&nbsp;2015-11-16<br />\r\n　　会议学分：有学分&nbsp;&nbsp;&nbsp;&nbsp;国家一类&nbsp;&nbsp;&nbsp;&nbsp;10分&nbsp;<br />\r\n　　联系人员：赵 燕&nbsp;&nbsp;&nbsp;&nbsp;联系电话：13621282670&nbsp;&nbsp;&nbsp;&nbsp;传真号码：010-52636068<br />\r\n　　电子邮件：gjd889911@163.com&nbsp;</font></p>\r\n','0','','0','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('39','<span style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\">一、组织机构</span>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\"><br />\r\n主办单位：中华医学会北京分会，中国人民解放军总医院<br />\r\n<br />\r\n协办单位：中国出生缺陷干预救助基金会<br />\r\n<br />\r\n承办单位：汉唐博瑞国际咨询（北京）有限公司<br />\r\n<br />\r\n二、会议信息<br />\r\n<br />\r\n会议时间：<br />\r\n<br />\r\n2015年11月20日（周五）：报到和外地学员办理入住<br />\r\n<br />\r\n2015年11月21日（周六）：儿童血液肿瘤的治疗进展<br />\r\n<br />\r\n2015年11月22日（周日）：全科医生儿科疾病诊治提高班<br />\r\n<br />\r\n会议地点：<br />\r\n<br />\r\n中国人民解放军总医院国际会议中心第十一会议室（北京市海淀区复兴路28号）<br />\r\n<br />\r\n参会费用：<br />\r\n<br />\r\n注册费： 1000元/人（含资料费及午餐）；<br />\r\n<br />\r\n备注:住宿、往返交通费用及其他费用由学员自行解决<br />\r\n<br />\r\n学分及证书：<br />\r\n<br />\r\n本次会议授予国家级及市级一类学分各2分<br />\r\n<br />\r\n酒店信息：<br />\r\n<br />\r\n酒店名称：北京复兴路二十六号贵宾楼 (原北京复兴路招待所)<br />\r\n<br />\r\n酒店地址：北京市海淀区复兴路甲26号<br />\r\n<br />\r\n2015年11月21日（周六）会议日程：<br />\r\n<br />\r\n会议名称：儿童血液肿瘤的治疗进展<br />\r\n<br />\r\n时间 题目 讲者 单位<br />\r\n<br />\r\n08:30-09:20 儿童急淋白血病的诊治进展 吴敏媛 北京儿童医院<br />\r\n<br />\r\n09:20-10:10 儿童遗传性噬血细胞综合征的治疗进展 王天有 北京儿童医院<br />\r\n<br />\r\n10:10-10:25 茶 歇<br />\r\n<br />\r\n10:25-11:10 视网膜母细胞瘤的诊治 黄东生 北京同仁医院<br />\r\n<br />\r\n11:10-12:00 儿童造血干细胞移植治疗儿童白血病 栾&nbsp; 佐 北京海军总医院 午 休<br />\r\n<br />\r\n13:30-14:20 基因靶向治疗与儿童肿瘤 唐锁勤 解放军总医院<br />\r\n<br />\r\n14:20-15:10 儿童肿瘤诊治中神经系统并发症的处理 邹丽萍 解放军总医院<br />\r\n<br />\r\n15:10-15:25 茶 歇<br />\r\n<br />\r\n15:25-16:15 肿瘤的免疫治疗 黄建华 解放军总医院<br />\r\n<br />\r\n16:15-17:05 测序技术在儿童血液系统疾病诊断中的应用 孟&nbsp; 岩 解放军总医院<br />\r\n<br />\r\n2015年11月22日（周日）会议日程：<br />\r\n<br />\r\n会议名称：全科医生儿科疾病诊治提高班<br />\r\n<br />\r\n时间 题目 讲者 单位<br />\r\n<br />\r\n09:00-09:50 贫血的诊断和鉴别诊断&nbsp;&nbsp; 唐锁勤 解放军总医院<br />\r\n<br />\r\n09:50-10:40 先天性肺发育障碍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 赵顺英 北京儿童医院<br />\r\n<br />\r\n10:40-10:55 茶 歇<br />\r\n<br />\r\n10:55-11:45 肝脾肿大的诊断思路&nbsp;&nbsp;&nbsp;&nbsp; 肖&nbsp; 娟 北京协和医院<br />\r\n<br />\r\n午 休<br />\r\n<br />\r\n14:00-14:50 囊性纤维化&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 胡晓红 解放军总医院第一附属医院<br />\r\n<br />\r\n14:50-15:40 遗传咨询&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 孟&nbsp; 岩 解放军总医院<br />\r\n<br />\r\n15:40-15:55 茶 歇<br />\r\n<br />\r\n15:55-16:45 如何建立全科医生正确的儿童疾病诊断思路 邹丽萍 解放军总医院<br />\r\n&nbsp;</p>\r\n<p style=\"color: rgb(52, 52, 52); font-family: 宋体; font-size: 14px; line-height: 24px; text-align: justify; text-indent: 28px; widows: auto;\"><font color=\"#1e50a2\">会议类型：学习班&nbsp;&nbsp;&nbsp;&nbsp;会议学科：儿科&nbsp;&nbsp;&nbsp;&nbsp;会议规模：200-300人<br />\r\n　　会议地点：北京市海淀区<br />\r\n　　会议时间：2015-11-21&nbsp;至&nbsp;2015-11-22<br />\r\n　　会议学分：有学分&nbsp;&nbsp;&nbsp;&nbsp;国家一类&nbsp;&nbsp;&nbsp;&nbsp;2分&nbsp;<br />\r\n　　联系人员：白雪&nbsp;&nbsp;&nbsp;&nbsp;联系电话：010-84874100 &nbsp;&nbsp;<br />\r\n　　电子邮件：baixue@htbr.cn&nbsp;</font></p>\r\n','0','','0','10000','','0','','0','1','|0');

DROP TABLE IF EXISTS `v9_page`;
CREATE TABLE `v9_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_pay_account`;
CREATE TABLE `v9_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_pay_payment`;
CREATE TABLE `v9_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) DEFAULT NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_pay_spend`;
CREATE TABLE `v9_pay_spend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_picture`;
CREATE TABLE `v9_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_picture_data`;
CREATE TABLE `v9_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_position`;
CREATE TABLE `v9_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

INSERT INTO `v9_position` VALUES('1','0','0','首页焦点图推荐','20','','1','1','');
INSERT INTO `v9_position` VALUES('2','0','0','首页头条推荐','20','','4','1','');
INSERT INTO `v9_position` VALUES('13','82','0','栏目页焦点图','20','','0','1','');
INSERT INTO `v9_position` VALUES('5','69','0','推荐下载','20','','0','1','');
INSERT INTO `v9_position` VALUES('8','30','54','图片频道首页焦点图','20','','0','1','');
INSERT INTO `v9_position` VALUES('9','0','0','网站顶部推荐','20','','0','1','');
INSERT INTO `v9_position` VALUES('10','0','0','栏目首页推荐','20','','0','1','');
INSERT INTO `v9_position` VALUES('12','0','0','首页图片推荐','20','','0','1','');
INSERT INTO `v9_position` VALUES('14','0','0','视频首页焦点图','20','','0','1','');
INSERT INTO `v9_position` VALUES('15','0','0','视频首页头条推荐','20','','0','1','');
INSERT INTO `v9_position` VALUES('16','0','0','视频首页每日热点','20','','0','1','');
INSERT INTO `v9_position` VALUES('17','0','0','视频栏目精彩推荐','20','','0','1','');

DROP TABLE IF EXISTS `v9_position_data`;
CREATE TABLE `v9_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_position_data` VALUES('20','15','1','content','1','1','{\"title\":\"\\u4e5d\\u9f99\\u5761\\u533a\\u8363\\u83b7\\u5168\\u5e02\\u536b\\u751f\\u8ba1\\u751f\\u76d1\\u7763\\u6280\\u80fd\\u7ade\\u8d5b\\u56e2\\u4f53\\u7b2c\\u4e00\",\"description\":\"    \\u8fd1\\u65e5\\uff0c\\u7531\\u5e02\\u603b\\u5de5\\u4f1a\\u3001\\u5e02\\u536b\\u751f\\u8ba1\\u751f\\u59d4\\u4e3e\\u529e\\u7684\\u5168\\u5e02\\u536b\\u751f\\u8ba1\\u751f\\u76d1\\u7763\\u6280\\u80fd\\u7ade\\u8d5b\\u5728\\u5408\\u5ddd\\u533a\\u4e3e\\u884c\\u3002\\u6211\\u533a\\u536b\\u751f\\u8ba1\\u751f\\u76d1\\u7763\\u6267\\u6cd5\\u5c40\\u5728\\u7ade\\u8d5b\\u4e2d\\u8363\\u83b7\\u56e2\\u4f53\\u7b2c\\u4e00\\u540d\\u3002\\u672c   \",\"thumb\":\"http:\\/\\/jxjy.90h.link\\/uploadfile\\/2016\\/0316\\/20160316034432207.jpg\",\"inputtime\":\"1458113670\",\"style\":\"\"}','1','20','0','','0');
INSERT INTO `v9_position_data` VALUES('20','15','2','content','1','1','{\"title\":\"\\u4e5d\\u9f99\\u5761\\u533a\\u8363\\u83b7\\u5168\\u5e02\\u536b\\u751f\\u8ba1\\u751f\\u76d1\\u7763\\u6280\\u80fd\\u7ade\\u8d5b\\u56e2\\u4f53\\u7b2c\\u4e00\",\"description\":\"    \\u8fd1\\u65e5\\uff0c\\u7531\\u5e02\\u603b\\u5de5\\u4f1a\\u3001\\u5e02\\u536b\\u751f\\u8ba1\\u751f\\u59d4\\u4e3e\\u529e\\u7684\\u5168\\u5e02\\u536b\\u751f\\u8ba1\\u751f\\u76d1\\u7763\\u6280\\u80fd\\u7ade\\u8d5b\\u5728\\u5408\\u5ddd\\u533a\\u4e3e\\u884c\\u3002\\u6211\\u533a\\u536b\\u751f\\u8ba1\\u751f\\u76d1\\u7763\\u6267\\u6cd5\\u5c40\\u5728\\u7ade\\u8d5b\\u4e2d\\u8363\\u83b7\\u56e2\\u4f53\\u7b2c\\u4e00\\u540d\\u3002\\u672c   \",\"thumb\":\"http:\\/\\/jxjy.90h.link\\/uploadfile\\/2016\\/0316\\/20160316034432207.jpg\",\"inputtime\":\"1458113670\",\"style\":\"\"}','1','20','0','','0');
INSERT INTO `v9_position_data` VALUES('21','15','1','content','1','1','{\"title\":\"\\u5e02\\u536b\\u751f\\u8ba1\\u751f\\u59d4\\u8c03\\u7814\\u6307\\u5bfc\\u4e5d\\u9f99\\u5761\\u533a\\u533b\\u6539\\u5de5\\u4f5c\",\"description\":\"   10\\u670827\\u65e5\\uff0c\\u5e02\\u536b\\u751f\\u8ba1\\u751f\\u59d4\\u533b\\u6539\\u8c03\\u7814\\u7ec4\\u4f55\\u7231\\u534e\\u5de1\\u89c6\\u5458\\u4e00\\u884c\\u5230\\u6211\\u533a\\u8c03\\u7814\\u6307\\u5bfc\\u533b\\u836f\\u536b\\u751f\\u4f53\\u5236\\u6539\\u9769\\u5de5\\u4f5c\\u3002  \\u6b64\\u6b21\\u5e02\\u536b\\u751f\\u8ba1\\u751f\\u59d4\\u542f\\u52a8\\u7684\\u536b\\u751f\\u8ba1\\u751f\\u7cfb\\u7edf\\u533b   \",\"thumb\":\"http:\\/\\/jxjy.90h. \\/uploadfile\\/2016\\/0316\\/20160316034432207.jpg\",\"inputtime\":\"1458113934\"}','1','21','0','','0');

DROP TABLE IF EXISTS `v9_poster`;
CREATE TABLE `v9_poster` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `setting` text NOT NULL,
  `startdate` int(10) unsigned NOT NULL DEFAULT '0',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spaceid` (`spaceid`,`siteid`,`disabled`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `v9_poster` VALUES('1','1','banner','1','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://127.0.0.1/uploadfile/poster/2.png\',\n    \'alt\' => \'\',\n  ),\n)','1285813808','1446249600','1285813833','0','1','0','0');
INSERT INTO `v9_poster` VALUES('2','1','phpcmsv9','2','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://127.0.0.1/statics/images/v9/ad_login.jpg\',\n    \'alt\' => \'phpcms专业建站系统\',\n  ),\n)','1285816298','1446249600','1285816310','0','1','0','0');
INSERT INTO `v9_poster` VALUES('3','1','phpcms下载推荐','3','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://127.0.0.1/uploadfile/poster/3.png\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)','1286504815','1446249600','1286504865','0','1','0','0');
INSERT INTO `v9_poster` VALUES('4','1','phpcms广告','4','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://127.0.0.1/uploadfile/poster/4.gif\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)','1286505141','1446249600','1286505178','0','0','0','0');
INSERT INTO `v9_poster` VALUES('5','1','phpcms下载','5','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://127.0.0.1/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)','1286509363','1446249600','1286509401','0','0','0','0');
INSERT INTO `v9_poster` VALUES('6','1','phpcms下载推荐1','6','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://127.0.0.1/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)','1286510183','1446249600','1286510227','0','0','0','0');
INSERT INTO `v9_poster` VALUES('7','1','phpcms下载详情','7','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://127.0.0.1/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)','1286510314','1446249600','1286510341','0','0','0','0');
INSERT INTO `v9_poster` VALUES('8','1','phpcms下载页','8','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://127.0.0.1/uploadfile/poster/1.jpg\',\n    \'alt\' => \'官方站\',\n  ),\n)','1286522084','1446249600','1286522125','0','0','0','0');
INSERT INTO `v9_poster` VALUES('9','1','phpcms v9广告','9','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://127.0.0.1/uploadfile/poster/4.gif\',\n    \'alt\' => \'\',\n  ),\n)','1287041759','1446249600','1287041804','0','0','0','0');
INSERT INTO `v9_poster` VALUES('10','1','phpcms','10','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://127.0.0.1/uploadfile/poster/6.jpg\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)','1289270509','1446249600','1289270541','1','0','0','0');

DROP TABLE IF EXISTS `v9_poster_201601`;
CREATE TABLE `v9_poster_201601` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_poster_space`;
CREATE TABLE `v9_poster_space` (
  `spaceid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL,
  `type` char(30) NOT NULL,
  `path` char(40) NOT NULL,
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `setting` char(100) NOT NULL,
  `description` char(100) NOT NULL,
  `items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spaceid`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `v9_poster_space` VALUES('1','1','顶部搜索右侧广告位','banner','poster_js/1.js','430','63','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('2','1','会员登陆页广告','banner','poster_js/2.js','310','304','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','会员登陆页广告右侧代替外部通行证广告','1','0');
INSERT INTO `v9_poster_space` VALUES('3','1','图片频道图片排行下方','banner','poster_js/3.js','249','87','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('4','1','新闻中心推荐链接左侧','banner','poster_js/4.js','748','91','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('5','1','下载列表页右侧顶部','banner','poster_js/5.js','248','162','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('6','1','下载详情页右侧顶部','banner','poster_js/6.js','248','162','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('7','1','下载详情页右侧下部','banner','poster_js/7.js','248','162','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('8','1','下载频道首页','banner','poster_js/8.js','698','80','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('9','1','下载详情页地址列表右侧','banner','poster_js/12.js','330','50','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('10','1','首页关注下方广告','banner','poster_js/10.js','307','60','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');

DROP TABLE IF EXISTS `v9_queue`;
CREATE TABLE `v9_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_release_point`;
CREATE TABLE `v9_release_point` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `port` varchar(10) DEFAULT '21',
  `pasv` tinyint(1) DEFAULT '0',
  `ssl` tinyint(1) DEFAULT '0',
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_search`;
CREATE TABLE `v9_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

INSERT INTO `v9_search` VALUES('1','1','1','1453709447','重庆市九龙坡区公共卫生和计划生育管理服务中心职责 单位 简介 计划生育 管理 卫生 机构 负责 职责 相关 服务中心 工作 管理工作 专业 类别 健康 人员 具体 基层 服务 宗旨 培训 主要 经费 渠道 事业单位 所属 性质 财政 指导 落实 计划 需求 编制 业务 承办 协调 技术 培养 继续教育 管理制度 考评 市场 零售 监督 部门 分析 调研 信息 有关 协同 质量 以及 发放 供应 开展 新药 进行 配合 推广 宣传 技术服务 建议 保障 强化 一类 提高 水平 法律 贯彻 公益 简介 单位 法规 规章 促进 教育 控制 精神 评估 考核 社区 农村 提出 研究 发展 公共 实施 的政策 卫生事业 要求','1');
INSERT INTO `v9_search` VALUES('23','1','25','1458115474','九龙坡区公共卫生和计划生育管理服务中心 九龙坡区 公共卫生 服务中心 负责 相关 工作 管理 计划生育 机构 职能 职责 落实 贯彻 卫生 调研 基本药物 法规 法律 药品 服务中心 管理工作 专业 采购 协调 信息 政策 开展 培训 集中 宣传 鉴定 分析 指导 建议 规章 基层 关于 研究 人员 要求 提出 技术 的政策 具体 健康 监督 部门 零售 确认 市场 有关 新药 推广 服务 配合 考评 报名 培养 起草 承办 沟通 筛选 上线 管理办法 继续教育 根据 支付 上级 委员会 现场 需求 评估 考核 公共 按照 业务 发展 进行 精神 社区 卫生事业 农村 控制 促进 教育 实施 生育 编制 计划 技术服务 以及 发放 供应 管理制度 程序 组织 专家 质量','1');
INSERT INTO `v9_search` VALUES('24','53','2','1458529527','继教新文件３：渝卫科教发 (2014) 78号关于进一步加强我市继 文件 文件 我市 加强 科教 关于 进一步','1');
INSERT INTO `v9_search` VALUES('25','53','3','1458529768','运动可健体，少吃可长寿 长寿 有限公司 科技 运动','1');
INSERT INTO `v9_search` VALUES('26','53','4','1458530057','网站建设合同 网站建设 合同 网站建设 合同 有限公司 科技','1');
INSERT INTO `v9_search` VALUES('2','1','2','1453779610','市卫计委屈谦主任带队赴新年调研第一站 计委 第一站 主任 医院 儿童 建设 主任 规划 调研 发展 制定 标准 充分考虑 工作 单位 之一 院长 西部 国家 中心 问题 本部 医疗 汇报 区域 医学 重点 会议 存在 带领 办公室 副主任 元月 支持 新年 负责人 一行 临床 重视 介绍 机构 前往 现场 要求 及时 上级 呼吁 不足 得到 无法 成为 卫生 满意 群众 基地 全国 精神文明 尽管 领导 集体 成员 按照 地区 国家级 明确 定位 肯定 取得 成绩 同性 传染 步骤 推进 阶段 符合 急救 布局 问候 全体 家庭 方面 困难 安全 公共 我市 应对 予以 政策 建议 总结 首先 提出 针对 资金的 合作 立足 设计 以及 详细 却是 热烈 带来 现阶段 涉及 综合 分析 情况 重大 变更 气氛 室内 主持 干部 管理 报告 前期 收获 个国家 专业 近年来 坚持 服务 教育部 实验室 试验 国际 药物 监督管理 食品 药品 需要 完善 全面 成效 亮点 筹备 的发展 一贯 科研 关心 市政府 理念 感谢 科技','1');
INSERT INTO `v9_search` VALUES('3','1','8','1455503700','新生儿疾病筛查与分子诊断2014年总结会 总结会 新生儿 分子 分子 总结 诊断 疾病 信息 测试 研究院 医院','1');
INSERT INTO `v9_search` VALUES('5','1','9','1457492161','2016年继续教育的课程即将上线 学术会 重庆市 中西医 上线 继续教育 即将 课程','1');
INSERT INTO `v9_search` VALUES('6','1','10','1457492238','如何在IE中中直接查看PDF文件,  文件 如何在 查看 直接','1');
INSERT INTO `v9_search` VALUES('45','1','40','1460621609','如何获得学分 学分 如何 获得','1');
INSERT INTO `v9_search` VALUES('20','1','22','1458114507','捐一份热血 用爱心为生命加油 热血 爱心 生命 爱心 血液 需求 健康 人民 临床 生命 干部 现场 工作 希望 热血 机关 紧张 带头 群众 制度 越来越 社会保障 提高 日益 逐步 水平 完善 快速发展 随着 增长 不断 这个 迫切 经济社会 作为 发挥 先锋 模范 作用 自己 能量 各种 听到 实际 谈话 人群 党员 领导 中心 更多 提示 温馨 持续 人士 参与 联系电话 温暖 增添 春节 现象 高峰 多少 民生 落实 死亡 带来 冬季 此次 行动 队伍 依靠 人体 来自 只能 人们 提供 活动 组织 日上午 今天 人类 需要 加油 但是 制造 不能 科学技术 影响 办公 极大 大家 等待 热情 现在 坚持 每年 好事 这样 前来 开始 刚刚 上午 大门 已经 上班 不少 时候','1');
INSERT INTO `v9_search` VALUES('21','1','23','1458114803','九龙坡区“十二五”期间卫生计生人才队伍建设成效显著 九龙坡区 队伍建设 成效 人才 卫生 培训 期间 十二五 政策 基层 招聘 规范化 医师 探索 专家 建设 重点 引进 获得 医生 补助 医学 加强 社区 各类 机制 各级 实施 中医 授予 人民 满意 用于 工作 关于 专项 累计 每年 住院 万元 服务中心 项目 科学 科技 公开 考核 形式 申报 高校 措施 成效 积极 通过 其中 博士后 评为 先后 机构 称号 成功 社会 事业 意见 事业单位 工作站 科技成果 系统 发表 五大 人员 推行 制度 创新 患者 奖励 有序 服务 补偿 建立 出台 目标 任务 推动 强化 论文 项目建设 落实 完成 参加 配备 居民 平均 城乡 师资 实现 自我 自身 贡献 突出 按照 全面 提升 基础 覆盖 学者 访问 博士 国家级 显著 委员 西部 评选 学科 高端 深化 实践 基地 类别 软硬件 人才基地 协会 推进 乡镇 群众 国家 专项资金 投入 安排 经费 思路 管理 队伍 组织 人次 万余 开展 进步','1');
INSERT INTO `v9_search` VALUES('18','1','20','1458113670','九龙坡区荣获全市卫生计生监督技能竞赛团体第一 九龙坡区 全市 团体 监督 卫生 竞赛 团体 第一 荣获 全市 执法 技能 举办 参赛 近日 举行 区县 全部 成绩 进入 个人 决赛 脱颖而出 录像 放射 职业 计划生育 防治 本次 分为 医疗 传染病 项目 包括 代表 同志 各个 环节 部分 三个 笔试 知识 模拟','1');
INSERT INTO `v9_search` VALUES('19','1','21','1458113934','市卫生计生委调研指导九龙坡区医改工作 九龙坡区 计生委 医改 工作 卫生 调研 指导 情况 成效 尽快 改革 了解 基层 医院 深入 制度 切实 完善 取得 此次 系统 体制改革 启动 一行 做到 保障 等内容 成绩 召开 座谈会 对我 给予 认为 肯定 充分 进行 均衡 方面 老百姓 突破 科学性 决策 积极性 希望 继续 综合 体系 不断 强化 调动 推广 全国 宣传 典型 经验 举措 政策 上升 总结 调查研究 落实 贯彻 专题 国务院 相关 深化 加强 部署 同时 认真 基本 人民 来到 服务 推进 分级 先后 当天 政策措施 不足 存在 查找 推动 各项 落地 实施 措施','1');
INSERT INTO `v9_search` VALUES('9','1','11','1458009415','强化统筹 注重实效 扎实开展流动人口关怀关爱活动 流动人口 实效 卫生 活动 关怀 关爱 开展 宣传 春节 特点 组织 元旦 区县 启动 期间 仪式 儿童 服务 工作 集中 各地 开设 关于 相关 通知 国家 实施 做好 政策 加强 领导 中心 本地 健康 全市 慰问 针对 就业 流入 群众 提高 重视 高度 落实 要求 贯彻 办理 老人 增强 农民工 注重 结合 扎实 困难 部分 发放 亲情 家庭 妇女 坚持 外来 切实 积极性 参与 主动性 作为 负责 的方式 深入 采取 各级 重点 部门 一线 优惠政策 进行 疫苗 乡镇 办事 咨询 检查 免费 生殖健康 大厅 现场 委托 不能 简化 资料 程序 讲座 修订 有关 创办 微型 能力 举办 专场 招聘会 企业 方面 计划 专题 有效 政府补贴 出台 税收 方案 城区 区域 制定 小组 确保 效果 成立 城市 相对 地理 条件 受限 根据 先后 广场 市场 聚集 明确 近期 讲话 精神 利用 副主任 统筹 认真 学习 外出 有序 年初 下发 推进 成效 有利 时机 取得 较为 分散 内容 更新 手册 优化 建设 人工 咨询服务 阵地 进一步 广大 知识 及时 形式 文艺 小时 热线 电视台 广播电台 晨报 氛围 社会 深化 营造 良好 时报 定期 强化 证明 媒体 专栏 法律法规','1');
INSERT INTO `v9_search` VALUES('10','1','12','1458009559','全市卫生和计划生育工作会议召开 全市 会议 全面 抓好 坚持 卫生 服务 计划生育 发展 基本 健康 政策 深化 改革 落实 加强 推进 提升 会议 讲话 工作会议 综合 实施 做好 工作 精神 各项 召开 实现 统筹 阶段 总结 不断 积极 五大 能力 水平 试点 要求 主任 扎实 协调 加快 享有 视察 人人 时期 体制改革 指出 民生 扶贫 实事 强调 领导 素质 主持 任务 副主任 全市 中医药 促进 深入 构建 群众 均衡 管理 学习 今后 一个 首要 当前 作为 贯彻 实习 政治 上来 建成 统一 行动 切实 思想 典型 示范 落地 省级 责任 考核 方面 会上 交流 发言 医院 儿童 附属 前面 体系 预防 为主 现代 人口 健全 制度 扩大 开放 重点 时刻 纪律 基础 服务业 治理 现代化 目标 全国 保障 质量 持续 单独 进展 取得 特色 优势 战略 布局 未来 重点工作 巩固 其他 事业 改善 报告 十二五 以来 出席 逐步 重大调整 条件 明显 稳步 城乡 居民 树立 强化 优化 供给 制度建设 公立医院 分级 资源 提供 有力 高效 底线 疾病 防控 机制 增进 出发点 发展战略 区域 理念 功能 完善 认真 部署 基层 决策 市政府 市委 支撑','1');
INSERT INTO `v9_search` VALUES('11','1','13','1458009991','政府购买卫生计生公共服务开始试点 公共服务 政府 购买 公共服务 卫生 政府 服务 项目 开展 提供 试点 社会 目录 基金 事业单位 登记 管理 各级 具有 国家 试点工作 发布 依法 部门 组织 防治 财政资金 本地 成立 内容 艾滋病 行为 近日 人群 服务项目 行政部门 关于 首批 省份 每个 通知 列入 以及 选择 城市 地区 介绍 系统 适合 要求 主体 仓储 批准 其他 主要 企业 民政 公务员 参照 行政 安排 包括 承接 国务院 结合 清单 性质 种类 实行 动态 预算 经费 资金 调整 明确 实施 承担 能够 力量 市场化 和服 各地 研究制定 实际 专项资金 采取 使用效率 据悉 质量 提高 资质 基本 保险 专业 经验 逐步 取得 开始 扩大 范围 直接 原本 利用 大类 健康 精神 心理 支持 照顾 关怀 病人 妇女 农村 症状 感染 病毒 同性 患者 疾病 等高 等服务 动员 检测 干预','1');
INSERT INTO `v9_search` VALUES('12','1','14','1458010313','继续医学教育规定(试行) 医学教育 医学 教育 继续 卫生 技术 人员 单位 活动 省级 委员会 工作 卫生部 规定 行政部门 评审 第二 办法 参加 考核 开展 项目 全国 组织 作为 有关 学习 专业 领导 负责 内容 制定 依据 国家级 自治 根据 直辖市 认可 评估 进行 结果 学科 具体 制度 形式 公布 实行 情况 国家 批准 接受 人事 行政 条件 加强 登记 目的 适应 需要 发展 实际 教材 经费 第一 自学 实施 授予 计划 部门 主管 检查 相关 试行 费用 各级 卫生事业 审核 指导 院校 学术 高等 理论 解放军 之一 申报 本人 继续教育 专家 人事部 重要 暂行 科学技术 对象 面向 文字 出版 不同 同时 积极 十九 十七 办理 此类 筹集 一定 发布 个人 每年 分数 建立 选择 定期 实施细则 落实 所在 远程教育 远程 课件 保证 十一 提出 采取 三条 十二 注意 多种 音像 基地 中级 服务 社会 的发展 提高 地区 要求 毕业 第三 第五 管理 战略 社会主义 职务 职业道德 义务 执业 规划 按照 若干 新技术 知识 下设 组成 质量 研究 方法 业务 为主 职能 各省 团体 等内容 日期 严格执行 获得 低于 编号 各种 证明 档案 类别 未来 岗位 十八 之后 分为 分类 提前 各地 审批 系统 特点 共同 应对 发放 包括 医师 做好 世界 现代化 名称 通知 收费 举办 收取 合理 颁发 承担 专用 财政部 关于 盈利 护士 解释 第三十 结合 依照 护理 执行 参照 资金 政绩考核 并且 成绩 显著 领导干部 必备 合格 晋升 注册 管理办法 给予 预算 列入 通过 其它 途径 将继续 解决 表彰 奖励 集体 年度 考察 从事 贯彻 的计划 各项 提供 第八 发行 履行 第二章 权利 有的 编写 必要 以上 工资 享受 保险 福利 待遇 期间 教育培训 积极主动 服从 安排 具有 打破 标准 聘请 监控 协调 担任 成员 政策 建议 优秀 总体 所有制 深入 关系 隶属 广泛 推动 利用 充分 界限 更好 予以 培训班 采用 讲座 整个 职业生涯 原则 保持 方针 业余 短期 应有 明确 目标 多样 灵活 目的是 方式 十四 终生 联系 坚持 能力 重点 先进性 针对性 现代 水平 完成 任务 认真 重视 创造力 伦理学 思想 素质 高尚 政治 不断 开发 培养 需求 相应','1');
INSERT INTO `v9_search` VALUES('13','1','15','1458010457','全国继续医学教育 “十五”计划 医学教育 全国 医学 教育 继续 工作 卫生 开展 发展 管理 技术 提高 全国 重要 人员 进一步 学科 加强 直辖市 学习 自治 积极 落实 充分 现代 基地 举办 委员会 目标 手段 单位 基础 建立 完善 达到 活动 国家级 考核 领导 实现 水平 注重 计划 评估 时代 有关 期间 九五 实施 改革 利用 各级 坚持 规范 效益 质量 多种 制度 适应 健康 组织 指标 地区 试行 经费 面向 需要 健全 各省 进行 形式 知识 卫生事业 必须 作用 行政部门 队伍 措施 世纪 素质 内容 我国 规定 成立 整体 目的 定期 个人 卫生部 贯彻 远程教育 科学技术 建设 对象 理论 以下简称 要求 重点 经济与 总体 具体 规划 开发 参加 及时 更加 深入 战略 各种 结合 检查 日程 创造 知识经济 实行 保证 不断 干部 现代化 做好 加大 比较 登记 规章制度 项目 先进 发达 突破 同时 加速 良好 投入 社会 取得 世界 原则 高质 重大 通过 加快 根据 制定 生命科学 验证 课件 解决 授予 避免 教学 环节 多媒体 有序 伦理学 符合条件的 滚动 一些 放在 标准 办法 按照 逐步 过程 省级 思想 政治 突出 认可 努力 面的 覆盖 扩大 调查研究 将继续 重视 资格 晋升 执业 任职 取消 违规 等问题 乱收费 纠正 必要 批评 通报 注册 密切 接受 专用 负担 一定 费用 资金 筹集 投资 多方 列入 预算 渠道 机构 表彰 予以 专题 国内外 提供 决策 依据 理论研究 便捷 广泛 促进 更多 相关 高效 咨询 激励 严格执行 激励机制 约束 机制 专家组 充分发挥 园地 交流 条件 开办 刊物 拓宽 广大 矛盾 意识 未来 小组 高素质 个省 已有 是以 方针 任务 发展目标 指导思想 邓小平理论 伟大 暂行 新技术 人才 优秀 脱颖而出 环境 实事求是 普及 关于 先进性 方法 针对性 决定 方式 加大投入 系列 持续 主要 在经济 显著 接近 国民 体系 经济体制 市场 人民 群众 奠定 需求 中等 发达国家 组成部分 的发展 标的 保障 基本 进步 科技 提出 平均 发展中国家 超过 依靠 一级 国务院 各地 宣传 地位 社会主义 树立 观念 终生 途径 认识 获取 系统工程 采取 确保 有力 摆在 并且 尽快 年前 总结 经验 规范化 制度化 上半 尚未 作为 领导干部 政绩考核 切实 之一 发布 人事部 基层 农村 西部 倾斜 用于 探索 团体 学术 中央 中共 发挥 院校 高等 领域 巩固 包括 自身 二级 专业 成绩 具有 特色','1');
INSERT INTO `v9_search` VALUES('14','1','16','1458010716','重庆市继续医学教育项目管理办法 重庆市 医学教育 管理办法 医学 教育 继续 项目 委员会 申报 卫生 举办 单位 技术 备案 专业 公布 培训 发展 根据 统一 推广 人员 办法 负责人 需求 进行 重大 改革 加强 应急 事业 目的 填写 学科 报表 计划生育 水平 办公室 每年 授予 制定 国内 内容 要求 协会 工作 我市 提高 启动 管理办法 有关 资格 突发 程序 事件 颁发 其他 所在 具有 负责 管理 教学 当年 保证 认可 形式 检查 活动 审查 项目管理 规定 审批 远程 基层 学会 直接 年度 教材 质量 按照 方法 素质 先进 成果 服务 主要 符合 继续教育 条例 条件 科教 社会 基地 批准 不断 证书 日期 地点 各地 试题 总结 名单 学员 关于 材料 编写 评审 包括 组织 意见 相关 选择 进一步 参加 精神 了解 总数 低于 执行 情况 颁布 解释 同时 通知 关于印发 的监管 过程 熟悉 国家 分数 应对 主管 职能部门 管理规定 明确 学术 团体 效果 规范 职责 上级 分类 边缘 前沿 交叉 原则 进展 推荐 之一 护理 先进性 社区 服务中心 下列 国外 除外 获得 填补 机构 空白 显著 卫生事业 引进 从事 职务 以上 中级 教育中心 社团 科学技术 现代 理论 知识 新技术 时间 年年 月底 名称 编号 列出 以前 经济效益 称为 针对性 需要 注重 以及 途径 第二 联系电话','1');
INSERT INTO `v9_search` VALUES('15','1','17','1458012484','重庆市继续医学教育学分管理办法专技人员 重庆市 医学教育 学分 教育 医学 人员 管理办法 继续','1');
INSERT INTO `v9_search` VALUES('16','1','18','1458113268','关于2016年全区护士执业资格考试报名工作有关事宜的通知 执业资格 全区 事宜 方正 仿宋 宋体 报名 卫生 执业 资格考试 护士 确认 通知 应届 考生 毕业生 人才网 时间 有关 考试 关于 事宜 成绩 现场 人员 毕业 打印 学校 计划生育 工作 委员会 单位 登录 证书 考点 楷体 报考 资格 专业 证明 审查 方式 申请表 收费标准 意见 地点 合格 出具 领取 身份证 提交 国家 审核 材料 本人 发到 日至 以上 黑体 护理 进行 根据 国务院 保证 相关 规定 部门 主管 完成 改革 同意 问题 发展 财政部 收费 共计 签署 指定 认真 档案 人事 所在地 如下 要求 姓名 办公室 一致 是否 身份 通过 技术 再发 放到 管理机构 下载 顺利 手中 关注 联系人 咨询电话 及时 执业资格 查询 证件 所在 自行 能力 实践 安排 实务 发布 考证 有效 公布 日内 结束 科目 使用 填写 个人 网上 提示 普通 信息 教育 法定 节假日 高等学校 下午 上午 参加 实习 申请 可以 学历 取得 临床 个月 教学 包括 综合 医院 网上报名 休息 人力 卫生部 社保 办法 印发 执行 所有 在校 应当 条件 相应 部长 园区 大道 地址 服务中心 管理 控制 年度 符合 中等 中心 持有','1');
INSERT INTO `v9_search` VALUES('17','1','19','1458113415','关于2016年度卫生专业技术资格考试报名工作的通知 资格考试 年度 专业 方正 仿宋 宋体 卫生 专业 报名 技术 资格考试 年度 黑体 楷体 确认 考试 人员 工作 提交 考生 通知 证书 必须 关于 时间 人才网 规定 单位 打印 医学 根据 医生 社区 资格 专业知识 学位 成绩 证明 培训 合格 报考 档案 提供 有关 参加 国家 现场 计划生育 本人 基层 同时 进行 填写 学历 材料 网上报名 机构 委员会 中级 相应 服务机构 法人 条件 基础知识 身份证 暂行 提示 符合 登录 毕业 相关 方式 日至 审查 护理 服务中心 人才 科目 申报 历史 类别 级别 身份 个体 职称 取得 执业 规范化 名称 能力 提前 实践 日期 岗位 全国 中心 网络教育 如下 如果 审核 意见 卫生部 自行 签署 位置 在学 收费标准 通过 结束 个月 公布 发布 考证 有效 联系人 咨询电话 查询 证件 登陆 对话 问题 社会保障 人力资源 人才交流 关于印发 文件 办公室 人机 人事部 精神 报表 正规 院校 医师 国人 认可 行政部门 从事 年限 截止 教育 全部 采用 个人 信息 按照 特别 加强 网上 指导意见 城市 须知 第一 兼职 注册 范围 部门 乡镇 全市 独立 正式 办法 编制 当地 达到 发放 降低 基础 中医 代码 标准 发生 栏目 内容 人事部门 印发 使用 执业资格 任职 职务 硕士 博士 一级 所有 预防 法定 假日 休息 所属 变更 修改 其他 上午 大道 控制 园区 管理 下午 地点 只需','1');
INSERT INTO `v9_search` VALUES('22','1','24','1458114955','区卫生计生委开展健康“定制”服务助力招商引资 计生委 招商引资 健康 服务 定制 招商引资 基本 工作 卫生 提供 园区 企业 板块 方面 建设 责任 水平 干部 医疗 疑难 精心 加大 负责人 疾病 行动 落实 专家 医院 近日 重要 立足 探索 特点 积极 行业 力度 顾问 领导 八大 功能 享受 当前 同时 讲座 知识 季度 宣传 不少 福利 活动 工厂 提高 效率 人民 病人 协调 大类 模式 治疗 个性化 指导 协同 采取 获得 发病 专项 成立 优秀 反复 研讨 方案 制作 征求意见 挑选 队伍 开展 综合 专业 经验 特长 能力 明确 分工 居民 免费 教育 医学 预防 畅通 考核 重大 上级 联系 及时 检查','1');
INSERT INTO `v9_search` VALUES('28','1','27','1458612432','第十五次全国妇科肿瘤学术会议 学术会议 妇科 肿瘤 妇科 肿瘤 会议 学会 地点 全国 中华 临床 广东 总结 广东省 进行 今后 类型 时间 广州市 广州 治疗 日期 内容 学科 的发展 介入 外科 合作 发展方向 研究 科研 及其他 推广 方法 体会 专业 建立 联系人 一度 每年 规范 交流 联系电话 应用 充分发挥 召开 作用 年来的 发展 专科 其他 提出 要求 促进 探讨 相关 问题 目的 旗帜 大会 学界 进展','1');
INSERT INTO `v9_search` VALUES('29','1','28','1458612481','2016全国生殖医学临床实践和研究论坛 生殖医学 全国 论坛 生殖 论坛 医学 论文 临床 研究 全国 实践 技术 第四届 征文 相关 人员 实验室 杂志 内容 北京 本次 会议 基础 大会 医师 参加 要求 作者 中华 男性 遗传 辅助 地点 外科 疾病 颁发 问题 涉及 证书 人口 发表 护士 摘要 类型 北京市 东城区 时间 医生 单位 各级 从事 通知 结果 不予 方法 方式 邮编 目的 发送 书写 一律 清楚 题目 结论 姓名 结构 采用 全文 文体 包括 参会 医院 将发 录用 对象 专业 卫生 传真 联系人 电话 服务机构 第一 录取 投稿 注明 电子邮件 主题 日期 学会 电子版 推荐 优秀 汇编 领域 此次 承接 预计 举办 有关 将于 一贯 精神 教授 学者 专家 知名 邀请 国内 围绕 探索 国家级 以上 护理 管理学 人类 伦理 公开 充分 文字 科学性 具有 科学 如下 前沿 热点 进行 避孕 妇科 治疗 全方位 保健 适宜 中药 计划生育 女性 探讨','1');
INSERT INTO `v9_search` VALUES('30','1','29','1458612540','2016年国际妇科癌症协会16两年一次的会议 妇科 癌症 协会 会议 服务 预订 时间 妇科 癌症 海外 葡萄 注册 协会 大会 安排 地点 定制 参会 申请 一次 免费 内容 类型 提供 医院 所有 机构 前往 前期 全程 当地 联系方式 展台 接待 电话 联系人 老师 签证 单独 考察 参观 根据 客户 需求 文化 活动 召开 推广 报名 包含 期间 贴心 书面 以下 酒店 机票 获得 即可 资料 等服务 成功','1');
INSERT INTO `v9_search` VALUES('31','1','30','1458612686','2016年美国妇产医师学院临床大会（ACOG） 妇产 美国 医师 会议 海外 大会 注册 华盛 医师 时间 地点 中心 临床 类型 学院 年美国 成功 即可 书面 等服务 获得 申请 免费 报名 参会 活动 提供 名称 内容','1');
INSERT INTO `v9_search` VALUES('32','1','31','1458612777','华夏医学泌尿生殖肿瘤论坛2016暨长城国际泌尿男科转化医学 医学 华夏 长城 教授 宋体 泌尿 生殖 肿瘤 本次 大会 会议 医学 论坛 分会 转化 医院 健康 华夏 学术 天津市 秘书长 委员会 大学 临床 主席 时间 会长 论文 交流 基础 学会 国际 领域 你们 朋友 大礼 第二 提高 地点 做出 国内外 专家 同仁 手术 尊敬 人员 贡献 参加 邀请 第一 北京 医疗保健 网站 刘继红 进展 主办 研究 次会议 获得 评选 优秀 以及 继续教育 国家级 最新 当前 参会 讲座 专题 报告 视频 现场 方式 展现 给予 多种 演示 通过 欢迎 国家 一类 外科 规模 联系 联系电话 电子邮件 号码 传真 学科 类型 投稿 实现 各位 真诚 生殖健康 是由 截止 名称 奖励 中心 举办 我们 杂志 主题 宗旨 新技术 结合 知识 有关 工作者 提供 院士 推广 隆重 加州 名誉 组织 执行 工程 平台 探讨 委托 研究所 拓展 思路 科学研究 理念 现代 融合 方法 人类 承办 病人 水平','1');
INSERT INTO `v9_search` VALUES('33','1','32','1458613144','2015首届世界消化大会--初冬我们于南京欢迎您 南京 首届 大会 消化 宋体 会议 领域 新技术 大会 首届 疾病 规模 活动 成为 最大 发展 医学 方法 世界 涌现 快速发展 突破 各种 带来 进一步 不断 国内外 促进 加强 我国 辩论 专题 分享 沙龙 电子邮件 分组 组织 期间 主题 平行 论坛 多种 精彩 学科 类型 地点 江苏省 时间 南京市 号码 我们 联系电话 丰富 人员 联系 欢迎 传真 认可 预计 海内外 代表 推动 引领 出席 学术 国内 事业 将于 在中国 本次 召开 隆重 改革 重要 充分 业内 实力 国际化 影响力 程度 竞争 最高 参加 参会 平台 专业 人士 高端','1');
INSERT INTO `v9_search` VALUES('36','1','33','1458613483','《康复理疗师》岗位培训招生简章 岗位培训 招生简章 康复 保健 报名 会议 水平 从业 行业 培训 宋体 技能 相关 社会 预防 提高 技术 基本 从事 人力资源 授课 人群 养生 北京市 证书 专业 张海 护理 社会保障 时间 基础知识 人员 岗位 纳入 国家 发展规划 之中 医疗 明确 十二五 招生简章 规划 以来 我国 合格 总体 健康 颁发 培训中心 营养 规模 教育 教育培训 可在 类型 考试 物理 中医 运动 心理 因子 常见 学科 以内 联系方式 方式 学费 证件 联系 地址 联系电话 电子邮件 青年 本人 提交 日起 须知 身份证 地点 大厦 以及 针对 运用 知识 申报 条件 对象 招生 服务 考前 开展 培养 居民 促进 医疗保健 分会 发展 和谐 医学 理论 结合 采取 集中 模式 内容 训练 基础 教材 统一 形式 文化 敬业 诚实 要求 有意 学生 掌握 参加 具备 能力 接受','1');
INSERT INTO `v9_search` VALUES('37','1','34','1458613523','2015第七届国际心脏病大会 心脏病 大会 国际 医院 大学 大会 会议 心脏 学术 研究所 邀请 国际 临床 疾病 交流 我们 第七届 医学 附属 机构 医学院 研究中心 中心 知名 本次 北京 进一步 宋体 海内外 最新 共同 专题 未来 主题 分享 广东省 展望 有限公司 将于 为了 发展 推动 相关 澳大 领域 加拿 问题 人民 国内 参加 此次 专家 报告 研究 展示 信息 帮助 单位 贝克 企业 哈佛 布莱 妇女 希望 各位 合作伙伴 糖尿病 嘉宾 多家 分为 参见 部分 英文 中文 日程 支持 更多 国外 携手 同行 期待 综合 类型 学科 首都 四川 中南 规模 以内 联系 一类 人员 联系电话 电子邮件 国家 地点 上海市 新区 时间 马萨 芝加哥 地利 比利 加州 制药 第二 公司 皇家 儿童 约翰 进行 充实 内容 完善 出席 特色 国际化 延续 以往 鲜明 专业化 同仁 相互 来自 分析 国内外 著名 研究成果 彼此 涉及 活力 注入 走过 一次 前沿 代表 举行 非常 学者 医生 步伐 前进 生命 事业 我国 提供 最佳 窗口 引领 科学 机会 进程 权威 知识 不仅 来说 提高 水平 对于 参与者 经验 主要 欢迎 洽谈会 参观 当地 项目合作 海报 活动 论坛 展览 讨论 深入 高血压 生理 血管 外科 介入 结构性 转化 基础 功能 影像 诊断 成就 取得 介绍 进展 热点 方面 康复 预防 危险 控制 护理','1');
INSERT INTO `v9_search` VALUES('39','53','8','1458613923','曲美他嗪与丹参川芎嗪注射液联合治疗不稳定心绞痛的疗效 曲美 川芎 丹参 科技 有限公司 疗效 联合 治疗 稳定 注射','1');
INSERT INTO `v9_search` VALUES('40','1','35','1458613999','2015第五届国际内分泌与代谢大会&2015第四届国际糖尿病学大 糖尿 国际 病学 宋体 大会 国际 会议 糖尿病 联系人 演讲 著名 有限公司 第五届 邮箱 高新 最新 国内外 园区 辽宁省 电话 地址 主办 第四届 集团 股份有限公司 支持 作为 举办 成功 领域 单位 可以 美景 官方网站 游客 时分 拍摄 观赏 西南 温和 位于 因此 称为 那里 各种各样 台北 八大 之一 联系 时间 地点 规模 人员 电子邮件 联系电话 学科 类型 赞助 参会 传真 气候 联系方式 的到来 企业 国内 届时 讨论 分享 精英 搭建 展开 口头 围绕 平台 专题 交流合作 将于 在台 糖尿 召开 众多 知名 邀请 截至 目前 报告 覆盖 美丽 风景 参加 注册 一次 阿里 地处 理想 风光 象征 老年 第三届 特色 畅游 期间 多个 聆听 美食 我们 如下 首届 同期 加入 期待 海洋','1');
INSERT INTO `v9_search` VALUES('41','1','36','1458614041','关于开展养生保健师、康复理疗师职业培训的通知 养生保健 职业培训 宋体 养生 性病 防治 保健 健康 康复 促进 中华 职业培训 工作 教育 培训 从业 证书 开展 提供 技术 国家 会员 会议 相关 中医药 医学 卫生 人才 世界 指导 师资 重要 传统 规划 地位 人员 提高 根据 疗法 学会 平台 组织 专业 防御 联合会 全国 我国 支持 推广 发展 可以 中心 行业 颁发 申请 领域 管理局 学术 建立 制定 机制 岗位 作为 培训班 通过 理论 预防 治疗 群体 之间 合作 结合 类型 文化 理念 交流 团结 作用 进一步 显著 疗效 高薪 综合类 高级 职位 状态 技术应用 专门 科目 属于 手段 全新 巨大 人们 全面 心理 饮食 简单 疾病 运用 系统 全方位 精髓 知识 现代 科学 注重 目前 缺口 深入 传授 痛苦 证明 网站 查询 服务网 鉴定 号码 唯一 可在 人力资源 技能 社会保障 联系 联系电话 电子邮件 时间 北京市 学科 地点 规模 标识 其一 办理 规定 职业教育 学生 毕业 报名 收费标准 其他 对于 事宜 凭证 同时 单位 任职 录用 重要依据 防伪 带有 求职 通用 职业资格 职业技能 具有 权威性 高度 城乡 推动 整体 事业 规范 的发展 建设 机构 政府 协助 部门 活动 管理 提升 素质 考试 水平 团体 专家 形式 多种 有序 各地 流动 开办 资格考试 远程教育 机会 成果 生产 中华民族 复兴 伟大 加强 了解 以上 通知 华人 组织机构 关心 强大 基础 公益 研讨 搭建 研究 开发 课题 服务 主要 业务范围 全体 职能 利用 认证 中医 个体 进行 情况 规范化 资质 落实 贯彻 精神 推进 分析 评估 阴阳 实现 平衡 协调 寿命 延长 方案 个性化 综合性 针对性 措施 人群 不同 十二五 卫生事业 实施 承担 战略 宣传 做出 奖励 关系 正式 智力 经营管理 人类 大会 完成 贡献 程序 一次 关于 近期 之一 发放 合格 审批 填写 一次性 审核 注册 新兴','1');
INSERT INTO `v9_search` VALUES('42','1','37','1458614106','第43期全国现代医院岗位设计绩效考核与管理高端培训班 培训班 绩效 高端 宋体 绩效 管理 医院 现代 考核 岗位 高端 设计 全国 卓越 规范化 我们 标准化 背景 问题 经营 培训班 课程 模式 全面 部门 员工 逐渐 面临 就是 设置 深化 为此 落实 江苏省 系数 制定 检查 标准 全球 成功 事实上 圣经 从事 发现 认识 年中 这些 工作 不断','1');
INSERT INTO `v9_search` VALUES('43','1','38','1458614146','“儿科重症监护实用技术及管理”培训班 培训班 重症 儿科 宋体 护理 儿童 技术 会议 管理 北京 培训班 医疗 医学 首都 技能 人员 附属 知识 培训 的发展 国家级 教育 举办 继续 能够 时间 地点 护士 专科 医院 项目 进展 编号 随着 报名 相关 众多 关于 监测 生命 越来越 应用 学科 成为 参会 获取 欢迎 学员 证书 资料 复苏 收费标准 全国 单位 住宿 光盘 日报 各级 交流 授予 参观 北京市 国家 规模 类型 一类 联系 电子邮件 号码 传真 联系电话 方式 通知 标准化 安排 费用 联系人 短信 统一 水平 探索 课题 不但 积极 管理者 安全 有效 需要 掌握 进行 连续 仪器 先进 理论 而且 提供 为重 成功率 进步 促进 使得 支持 治疗 涉及 要求 如何 技术性 专业性 层面 动态 观察 建设 提升 领域 实施 临床 工作 具有 接受 心脏 老师 授课 大部分 指导 成就 同时 详细 最新 反映 本次 以及 熟悉 质量 运用 熟练 方面 通过 学会','1');
INSERT INTO `v9_search` VALUES('44','1','39','1458614251','2015年儿童血液肿瘤的治疗进展、全科医生儿科疾病诊治提高 儿科疾病 全科 肿瘤 儿童 会议 北京 解放军 肿瘤 治疗 疾病 进展 诊断 医院 复兴 单位 时间 医生 血液 宋体 提高 费用 酒店 人民 咨询 名称 北京市 地点 周日 周六 遗传 组织机构 题目 中华 细胞 日程 一类 学会 学员 国际 基金会 救助 出生 缺陷 干预 系统 信息 分会 思路 技术 障碍 发育 鉴别 应用 处理 并发症 免疫 规模 人员 联系 国家 神经 电子邮件 联系电话 学科 学习 如何 第一 纤维 建立 正确 类型 资料 十一 中心 参会 注册 住宿 入住 有限公司 周五 办理 外地 交通 地址 同仁 海军 移植 干细胞 贵宾 解决 自行 及其他 证书 次会议 国家级 授予 基因','1');

DROP TABLE IF EXISTS `v9_search_keyword`;
CREATE TABLE `v9_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_session`;
CREATE TABLE `v9_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

INSERT INTO `v9_session` VALUES('751n71h5fq06ns7o7vgclutnh4i5ivis','1','123.147.83.106','1461047858','1','0','admin','database','export','code|s:0:\"\";userid|s:1:\"1\";roleid|s:1:\"1\";pc_hash|s:6:\"7GcKEc\";lock_screen|i:0;');

DROP TABLE IF EXISTS `v9_site`;
CREATE TABLE `v9_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_site` VALUES('1','重庆医学继续考试网','','http://jxjy.90h.link/','重庆医学继续考试网','继续医学教育,医学考试,执业护士,远程培训,公共卫生,乡村医生,健康教育,执业医师,远程教育,,医学培训,科教管理,CME,医疗信息化,科教平台,继教管理,医学考试培训,社区卫生人员培训,居民健康档案,农村卫生人员\"','重庆医学继续考试网站是卫生部批准的医学专业信息网站，是国家药监局批准的经营性医药网站，也是目前卫生部批准的国内第一家可以进行网络远程医学继续教育，并有权授予市级一、二类继续教育学分的医学教育网站。','','default','default','{\"upload_maxsize\":\"2048\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"0\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"statics\\/images\\/water\\/\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"9\"}','557e75e8-c330-11e5-b7d8-b8975a19228e');

DROP TABLE IF EXISTS `v9_sms_report`;
CREATE TABLE `v9_sms_report` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `id_code` varchar(10) NOT NULL,
  `msg` varchar(90) NOT NULL,
  `send_userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `return_id` varchar(30) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`,`posttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_special`;
CREATE TABLE `v9_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isvideo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_special_c_data`;
CREATE TABLE `v9_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_special_content`;
CREATE TABLE `v9_special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`),
  KEY `typeid` (`typeid`,`isdata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_sphinx_counter`;
CREATE TABLE `v9_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_sso_admin`;
CREATE TABLE `v9_sso_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) DEFAULT NULL,
  `issuper` tinyint(1) DEFAULT '0',
  `lastlogin` int(10) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_sso_admin` VALUES('1','admin','4d3a27ec0f11afbaa734d49ecbfb0828','zJQW1Y','1','0','');

DROP TABLE IF EXISTS `v9_sso_applications`;
CREATE TABLE `v9_sso_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(16) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `url` char(255) NOT NULL DEFAULT '',
  `authkey` char(255) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `apifilename` char(30) NOT NULL DEFAULT 'phpsso.php',
  `charset` char(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`appid`),
  KEY `synlogin` (`synlogin`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_sso_applications` VALUES('1','phpcms_v9','phpcms v9','http://127.0.0.1/','BVbcASdeT7V8gFSNwKG2V2RgnG5qhRK5','','api.php?op=phpsso','utf-8','1');

DROP TABLE IF EXISTS `v9_sso_members`;
CREATE TABLE `v9_sso_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `random` char(8) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` char(15) NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `appname` char(15) NOT NULL,
  `type` enum('app','connect') DEFAULT NULL,
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `ucuserid` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `ucuserid` (`ucuserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_sso_messagequeue`;
CREATE TABLE `v9_sso_messagequeue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `succeed` tinyint(1) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `noticedata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `appstatus` mediumtext,
  PRIMARY KEY (`id`),
  KEY `dateline` (`dateline`),
  KEY `succeed` (`succeed`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_sso_session`;
CREATE TABLE `v9_sso_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_sso_settings`;
CREATE TABLE `v9_sso_settings` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_sso_settings` VALUES('denyemail','');
INSERT INTO `v9_sso_settings` VALUES('denyusername','');
INSERT INTO `v9_sso_settings` VALUES('creditrate','');
INSERT INTO `v9_sso_settings` VALUES('sp4','');
INSERT INTO `v9_sso_settings` VALUES('ucenter','');

DROP TABLE IF EXISTS `v9_tag`;
CREATE TABLE `v9_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tag` text NOT NULL,
  `name` char(40) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `module` char(20) NOT NULL,
  `action` char(20) NOT NULL,
  `data` text NOT NULL,
  `page` char(15) NOT NULL,
  `return` char(20) NOT NULL,
  `cache` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_template_bak`;
CREATE TABLE `v9_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_times`;
CREATE TABLE `v9_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_type`;
CREATE TABLE `v9_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

INSERT INTO `v9_type` VALUES('52','1','search','0','专题','0','special','','','4','专题');
INSERT INTO `v9_type` VALUES('1','1','search','1','新闻','0','','','','1','新闻模型搜索');
INSERT INTO `v9_type` VALUES('2','1','search','2','下载','0','','','','3','下载模型搜索');
INSERT INTO `v9_type` VALUES('3','1','search','3','图片','0','','','','2','图片模型搜索');
INSERT INTO `v9_type` VALUES('53','1','search','12','学习课件','0','','','','0','');

DROP TABLE IF EXISTS `v9_urlrule`;
CREATE TABLE `v9_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

INSERT INTO `v9_urlrule` VALUES('1','content','category','1','{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html','news/china/1000.html');
INSERT INTO `v9_urlrule` VALUES('6','content','category','0','index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}','index.php?m=content&c=index&a=lists&catid=1&page=1');
INSERT INTO `v9_urlrule` VALUES('11','content','show','1','{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html','2010/catdir_0720/1_2.html');
INSERT INTO `v9_urlrule` VALUES('12','content','show','1','{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html','it/product/2010/0720/1_2.html');
INSERT INTO `v9_urlrule` VALUES('16','content','show','0','index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}','index.php?m=content&c=index&a=show&catid=1&id=1');
INSERT INTO `v9_urlrule` VALUES('17','content','show','0','show-{$catid}-{$id}-{$page}.html','show-1-2-1.html');
INSERT INTO `v9_urlrule` VALUES('18','content','show','0','content-{$catid}-{$id}-{$page}.html','content-1-2-1.html');
INSERT INTO `v9_urlrule` VALUES('30','content','category','0','list-{$catid}-{$page}.html','list-1-1.html');

DROP TABLE IF EXISTS `v9_video`;
CREATE TABLE `v9_video` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `vision` varchar(255) NOT NULL DEFAULT '',
  `video_category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_video_content`;
CREATE TABLE `v9_video_content` (
  `contentid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `videoid` (`videoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_video_data`;
CREATE TABLE `v9_video_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `video` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_video_store`;
CREATE TABLE `v9_video_store` (
  `videoid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(60) NOT NULL,
  `vid` char(40) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `picpath` char(120) NOT NULL,
  `size` char(20) NOT NULL,
  `timelen` mediumint(9) NOT NULL DEFAULT '0',
  `userupload` tinyint(1) NOT NULL DEFAULT '0',
  `channelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`videoid`),
  KEY `videoid` (`videoid`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_vote_data`;
CREATE TABLE `v9_vote_data` (
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) NOT NULL,
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `data` text NOT NULL,
  `userinfo` text NOT NULL,
  KEY `subjectid` (`subjectid`),
  KEY `userid` (`userid`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_vote_option`;
CREATE TABLE `v9_vote_option` (
  `optionid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option` varchar(255) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `listorder` tinyint(2) unsigned DEFAULT '0',
  PRIMARY KEY (`optionid`),
  KEY `subjectid` (`subjectid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_vote_subject`;
CREATE TABLE `v9_vote_subject` (
  `subjectid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `subject` char(255) NOT NULL,
  `ismultiple` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ischeckbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `credit` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromdate` date NOT NULL DEFAULT '0000-00-00',
  `todate` date NOT NULL DEFAULT '0000-00-00',
  `interval` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` char(20) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowguest` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `maxval` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `minval` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `optionnumber` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `votenumber` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`subjectid`),
  KEY `enabled` (`enabled`),
  KEY `fromdate` (`fromdate`,`todate`),
  KEY `todate` (`todate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_wap`;
CREATE TABLE `v9_wap` (
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `sitename` char(30) NOT NULL,
  `logo` char(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `setting` mediumtext,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_wap` VALUES('1','PHPCMS手机门户','/statics/images/wap/wlogo.gif','','array (\n  \'listnum\' => \'10\',\n  \'thumb_w\' => \'220\',\n  \'thumb_h\' => \'0\',\n  \'c_num\' => \'1000\',\n  \'index_template\' => \'index\',\n  \'category_template\' => \'category\',\n  \'list_template\' => \'list\',\n  \'show_template\' => \'show\',\n)','0');

DROP TABLE IF EXISTS `v9_wap_type`;
CREATE TABLE `v9_wap_type` (
  `typeid` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat` smallint(5) NOT NULL,
  `parentid` smallint(5) NOT NULL,
  `typename` varchar(30) NOT NULL,
  `siteid` smallint(5) NOT NULL,
  `listorder` smallint(5) DEFAULT '0',
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_workflow`;
CREATE TABLE `v9_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `v9_workflow` VALUES('1','1','1','一级审核','审核一次','','0');
INSERT INTO `v9_workflow` VALUES('2','1','2','二级审核','审核两次','','0');
INSERT INTO `v9_workflow` VALUES('3','1','3','三级审核','审核三次','','0');
INSERT INTO `v9_workflow` VALUES('4','1','4','四级审核','四级审核','','0');

