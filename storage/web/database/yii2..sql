# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 192.168.33.30 (MySQL 5.5.44-0ubuntu0.14.04.1)
# Database: yii2
# Generation Time: 2016-12-22 00:55:30 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_assignment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_assignment`;

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL COMMENT '角色名称 role',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;



# Dump of table auth_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_item`;

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL COMMENT '角色或权限名称',
  `type` int(11) NOT NULL COMMENT '1角色 2权限',
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
VALUES
	('admin/add',2,NULL,'admin/add',NULL,1482322759,1482322759),
	('admin/auth',2,NULL,'admin/auth',NULL,1482322759,1482322759),
	('admin/edit',2,NULL,'admin/edit',NULL,1482322759,1482322759),
	('admin/index',2,NULL,'admin/index',NULL,1482322759,1482322759),
	('Administrator',1,'管理员',NULL,NULL,1482319874,1482320113),
	('auth/auth',2,NULL,'auth/auth',NULL,1482322759,1482322759),
	('auth/index',2,NULL,'auth/index',NULL,1482322759,1482322759),
	('default/index',2,NULL,'default/index',NULL,1482322759,1482322759),
	('menu/index',2,NULL,'menu/index',NULL,1482322760,1482322760),
	('merchant/create',2,NULL,'merchant/create',NULL,1482322759,1482322759),
	('merchant/index',2,NULL,'merchant/index',NULL,1482322759,1482322759),
	('StoreManager',1,'店长',NULL,NULL,1482320006,1482320129),
	('Superintendent',1,'主管',NULL,NULL,1482320103,1482320103);

/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_item_child
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_item_child`;

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;

INSERT INTO `auth_item_child` (`parent`, `child`)
VALUES
	('Administrator','admin/add'),
	('Administrator','admin/auth'),
	('Administrator','admin/edit'),
	('Administrator','admin/index'),
	('Administrator','auth/auth'),
	('Administrator','auth/index'),
	('Administrator','default/index'),
	('Administrator','menu/index'),
	('Administrator','merchant/create'),
	('Administrator','merchant/index');

/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_rule`;

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text COMMENT 'serialize后的rule对象',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`)
VALUES
	('admin/add','O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"admin/add\";s:9:\"createdAt\";i:1482322759;s:9:\"updatedAt\";i:1482322759;}',1482322759,1482322759),
	('admin/auth','O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"admin/auth\";s:9:\"createdAt\";i:1482322759;s:9:\"updatedAt\";i:1482322759;}',1482322759,1482322759),
	('admin/edit','O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"admin/edit\";s:9:\"createdAt\";i:1482322759;s:9:\"updatedAt\";i:1482322759;}',1482322759,1482322759),
	('admin/index','O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"admin/index\";s:9:\"createdAt\";i:1482322759;s:9:\"updatedAt\";i:1482322759;}',1482322759,1482322759),
	('auth/auth','O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"auth/auth\";s:9:\"createdAt\";i:1482322759;s:9:\"updatedAt\";i:1482322759;}',1482322759,1482322759),
	('auth/index','O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"auth/index\";s:9:\"createdAt\";i:1482322759;s:9:\"updatedAt\";i:1482322759;}',1482322759,1482322759),
	('default/index','O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:13:\"default/index\";s:9:\"createdAt\";i:1482322759;s:9:\"updatedAt\";i:1482322759;}',1482322759,1482322759),
	('menu/index','O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"menu/index\";s:9:\"createdAt\";i:1482322760;s:9:\"updatedAt\";i:1482322760;}',1482322760,1482322760),
	('merchant/create','O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"merchant/create\";s:9:\"createdAt\";i:1482322759;s:9:\"updatedAt\";i:1482322759;}',1482322759,1482322759),
	('merchant/index','O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:14:\"merchant/index\";s:9:\"createdAt\";i:1482322759;s:9:\"updatedAt\";i:1482322759;}',1482322759,1482322759);

/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jz_merchant
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jz_merchant`;

CREATE TABLE `jz_merchant` (
  `mer_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL COMMENT '用户id',
  `company` varchar(150) NOT NULL COMMENT '单位名称',
  `province` varchar(100) DEFAULT NULL COMMENT '省',
  `city` varchar(100) DEFAULT NULL COMMENT '市',
  `district` varchar(100) DEFAULT NULL COMMENT '区',
  `addr` varchar(200) DEFAULT NULL COMMENT '地址',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `job` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `business_scope` varchar(255) DEFAULT NULL COMMENT '经验范围',
  `org_code` varchar(32) DEFAULT NULL COMMENT '商户唯一编码',
  `mer_status` tinyint(3) NOT NULL DEFAULT '10' COMMENT '商户状态 10：正常 20：禁用',
  PRIMARY KEY (`mer_id`),
  UNIQUE KEY `org_code` (`org_code`) USING BTREE,
  KEY `staff_id` (`staff_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `jz_merchant` WRITE;
/*!40000 ALTER TABLE `jz_merchant` DISABLE KEYS */;

INSERT INTO `jz_merchant` (`mer_id`, `staff_id`, `company`, `province`, `city`, `district`, `addr`, `phone`, `job`, `create_time`, `update_time`, `business_scope`, `org_code`, `mer_status`)
VALUES
	(1,1,'数字营销部','浙江省','嘉兴市','嘉善县','洪山广场',NULL,NULL,'2016-12-19 18:45:08',NULL,'汽车、电子、医疗','szyx',10);

/*!40000 ALTER TABLE `jz_merchant` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table yii2_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yii2_admin`;

CREATE TABLE `yii2_admin` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(60) NOT NULL COMMENT '密码',
  `salt` char(32) NOT NULL COMMENT '密码干扰字符',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态 1正常 0禁用',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='用户表';

LOCK TABLES `yii2_admin` WRITE;
/*!40000 ALTER TABLE `yii2_admin` DISABLE KEYS */;

INSERT INTO `yii2_admin` (`uid`, `username`, `password`, `salt`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`)
VALUES
	(1,'admin','$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i','SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ','42629391@qq.com','13565231112',1457922160,2130706433,1457922174,2130706433,1482319239,1);

/*!40000 ALTER TABLE `yii2_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table yii2_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yii2_config`;

CREATE TABLE `yii2_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `value` text COMMENT '配置值',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



# Dump of table yii2_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yii2_log`;

CREATE TABLE `yii2_log` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `uid` int(8) NOT NULL COMMENT '用户uid',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `controller` varchar(50) NOT NULL COMMENT '控制器',
  `action` varchar(50) NOT NULL COMMENT '动作',
  `querystring` varchar(255) NOT NULL COMMENT '查询字符串',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `ip` varchar(15) NOT NULL DEFAULT '0.0.0.0' COMMENT 'IP',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台日志';



# Dump of table yii2_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yii2_menu`;

CREATE TABLE `yii2_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

LOCK TABLES `yii2_menu` WRITE;
/*!40000 ALTER TABLE `yii2_menu` DISABLE KEYS */;

INSERT INTO `yii2_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `group`, `status`)
VALUES
	(1,'首页',0,1,'default/index',0,'',1),
	(2,'系统',0,9,'menu/index',0,'',1),
	(3,'商户',0,8,'merchant/index',0,'',1),
	(4,'商户列表',3,0,'merchant/index',0,'商户管理|icon-note',1),
	(5,'菜单管理',2,0,'menu/index',0,'系统配置|icon-comment',1),
	(6,'添加商户',3,0,'merchant/create',0,'商户管理|icon-note',1),
	(7,'用户',0,1,'admin/index',0,'',1),
	(8,'管理员管理',7,1,'admin/index',0,'后台用户|icon-user',1),
	(9,'默认页',1,1,'default/index',0,'默认组|icon-user',1),
	(10,'新增管理员',8,0,'admin/add',0,'后台用户|icon-user',1),
	(11,'更新',8,0,'admin/edit',0,'后台用户|icon-user',1),
	(12,'管理员授权',8,0,'admin/auth',0,'后台用户|icon-user',0),
	(14,'权限管理',7,2,'auth/index',0,'后台用户|icon-user',1),
	(15,'授权',7,0,'auth/auth',0,'',1);

/*!40000 ALTER TABLE `yii2_menu` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
