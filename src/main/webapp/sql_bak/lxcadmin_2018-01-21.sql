# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.17)
# Database: lxcadmin
# Generation Time: 2018-01-21 06:03:04 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table db_lxcdb
# ------------------------------------------------------------

DROP TABLE IF EXISTS `db_lxcdb`;

CREATE TABLE `db_lxcdb` (
  `LXCDB_ID` varchar(100) NOT NULL DEFAULT '',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`LXCDB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table db_timingbackup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `db_timingbackup`;

CREATE TABLE `db_timingbackup` (
  `TIMINGBACKUP_ID` varchar(100) NOT NULL,
  `JOBNAME` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `LXCTIME` varchar(30) DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `db_timingbackup` WRITE;
/*!40000 ALTER TABLE `db_timingbackup` DISABLE KEYS */;

INSERT INTO `db_timingbackup` (`TIMINGBACKUP_ID`, `JOBNAME`, `CREATE_TIME`, `TABLENAME`, `STATUS`, `LXCTIME`, `TIMEEXPLAIN`, `BZ`)
VALUES
	('311e06c34a5e4518a86d5d30799f9b55','sys_app_user_515762','2016-04-11 17:04:55','sys_app_user',2,'1/2 * * ? * *','每个月的 每周 每天 每小时执行一次','备份任务'),
	('bc4a788bc2ec40bdb1b7730131c26d42','sys_app_user_359515','2016-04-12 17:24:05','sys_app_user',2,'1/3 * * ? * *','每个月的 每周 每天 每小时执行一次','ssss');

/*!40000 ALTER TABLE `db_timingbackup` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oa_department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oa_department`;

CREATE TABLE `oa_department` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT '负责人',
  `TEL` varchar(50) DEFAULT NULL COMMENT '电话',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '部门职能',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oa_department` WRITE;
/*!40000 ALTER TABLE `oa_department` DISABLE KEYS */;

INSERT INTO `oa_department` (`DEPARTMENT_ID`, `NAME`, `NAME_EN`, `BIANMA`, `PARENT_ID`, `BZ`, `HEADMAN`, `TEL`, `FUNCTIONS`, `ADDRESS`)
VALUES
	('0956d8c279274fca92f4091f2a69a9ad','销售会计','xiaokuai','05896','d41af567914a409893d011aa53eda797','','','','',''),
	('3e7227e11dc14b4d9e863dd1a1fcedf6','成本会计','chengb','03656','d41af567914a409893d011aa53eda797','','','','',''),
	('5cccdb7c432449d8b853c52880058140','B公司','b','002','0','冶铁','李四','112','冶铁','河北'),
	('83a25761c618457cae2fa1211bd8696d','销售B组','xiaob','002365','cbbc84eddde947ba8af7d509e430eb70','','李四','','',''),
	('8f8b045470f342fdbc4c312ab881d62b','销售A组','xiaoA','0326','cbbc84eddde947ba8af7d509e430eb70','','张三','0201212','',''),
	('a0982dea52554225ab682cd4b421de47','1队','yidui','02563','8f8b045470f342fdbc4c312ab881d62b','','小王','12356989','',''),
	('a6c6695217ba4a4dbfe9f7e9d2c06730','A公司','a','001','0','挖煤','张三','110','洼煤矿','山西'),
	('cbbc84eddde947ba8af7d509e430eb70','销售部','xiaoshoubu','00201','5cccdb7c432449d8b853c52880058140','推销商品','小明','11236','推销商品','909办公室'),
	('d41af567914a409893d011aa53eda797','财务部','caiwubu','00101','a6c6695217ba4a4dbfe9f7e9d2c06730','负责发工资','王武','11236','管理财务','308办公室');

/*!40000 ALTER TABLE `oa_department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_app_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_app_user`;

CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_app_user` WRITE;
/*!40000 ALTER TABLE `sys_app_user` DISABLE KEYS */;

INSERT INTO `sys_app_user` (`USER_ID`, `USERNAME`, `PASSWORD`, `NAME`, `RIGHTS`, `ROLE_ID`, `LAST_LOGIN`, `IP`, `STATUS`, `BZ`, `PHONE`, `SFID`, `START_TIME`, `END_TIME`, `YEARS`, `NUMBER`, `EMAIL`)
VALUES
	('1e89e6504be349a68c025976b3ecc1d1','a1','698d51a19d8a121ce581499d7b701668','会员甲','','115b386ff04f4352b060dffcd2b5d1da','','','1','121','1212','1212','2015-12-02','2015-12-25',2,'111','313596790@qq.com');

/*!40000 ALTER TABLE `sys_app_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_createcode
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_createcode`;

CREATE TABLE `sys_createcode` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT '属性集',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '描述',
  `LXCTYPE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_createcode` WRITE;
/*!40000 ALTER TABLE `sys_createcode` DISABLE KEYS */;

INSERT INTO `sys_createcode` (`CREATECODE_ID`, `PACKAGENAME`, `OBJECTNAME`, `TABLENAME`, `FIELDLIST`, `CREATETIME`, `TITLE`, `LXCTYPE`)
VALUES
	('4ceb3157322a4cbbbcde2c81fc78d636','staff','StaffEmployee','TB_,lxc,STAFFEMPLOYEE','STAFF_ID,lxc,Integer,lxc,员工ID,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525STAFF_NAME,lxc,String,lxc,员工姓名,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525SEX,lxc,Integer,lxc,性别,lxc,是,lxc,无,lxc,2,lxc,0Q1094921525ADDRESS,lxc,String,lxc,地址,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525PHONE,lxc,String,lxc,电话,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525PIC,lxc,String,lxc,照片地址,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525CARD_ID,lxc,String,lxc,身份证号码,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525EMAIL,lxc,String,lxc,E-mail,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525QQ,lxc,String,lxc,QQ,lxc,是,lxc,无,lxc,15,lxc,0Q1094921525WECHAT,lxc,String,lxc,微信,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525POST_CODE,lxc,String,lxc,邮编号码,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525GOVEMMET,lxc,String,lxc,政治面貌,lxc,是,lxc,无,lxc,15,lxc,0Q1094921525NATION,lxc,String,lxc,民族,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525LEARING,lxc,String,lxc,学历,lxc,是,lxc,无,lxc,10,lxc,0Q1094921525HOBBY,lxc,String,lxc,爱好,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SUIT,lxc,String,lxc,特长,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525NATIONALITY,lxc,String,lxc,国籍,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525BIRTH,lxc,String,lxc,出生年月,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525FAITH,lxc,String,lxc,宗教信仰,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525SPEIALITY,lxc,String,lxc,专业,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525RESUME,lxc,String,lxc,个人简历,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525DESCRIBE,lxc,String,lxc,个人描述,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525REMARK,lxc,String,lxc,备注,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525ISROMVE,lxc,String,lxc,目前状况,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525JOB_ID,lxc,Integer,lxc,工作编号,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525USER_ID,lxc,Integer,lxc,用户编号,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525AGE,lxc,Integer,lxc,年龄,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525ADD_TIME,lxc,Date,lxc,登记时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525STIPEND_ID,lxc,Integer,lxc,薪资ID,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525CREATE_TIME,lxc,Date,lxc,创建时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525UPDATE_TIME,lxc,Date,lxc,修改时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525CREATE_USER,lxc,String,lxc,创建人,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525UPDATE_USER,lxc,String,lxc,修改人,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525','2018-01-16 01:00:45','员工档案信息表','single'),
	('d44777af89914c288a25c6bc5e286172','staff','StaffEmployee','TB_,lxc,STAFFEMPLOYEE','STAFF_ID,lxc,Integer,lxc,员工ID,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525SEX,lxc,Integer,lxc,性别,lxc,是,lxc,无,lxc,2,lxc,0Q1094921525ADDRESS,lxc,String,lxc,地址,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525PHONE,lxc,String,lxc,电话,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525PIC,lxc,String,lxc,照片地址,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525CARD_ID,lxc,String,lxc,身份证号码,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525EMAIL,lxc,String,lxc,E-mail,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525QQ,lxc,String,lxc,QQ,lxc,是,lxc,无,lxc,15,lxc,0Q1094921525WECHAT,lxc,String,lxc,微信,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525POST_CODE,lxc,String,lxc,邮编号码,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525GOVEMMET,lxc,String,lxc,政治面貌,lxc,是,lxc,无,lxc,15,lxc,0Q1094921525NATION,lxc,String,lxc,民族,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525LEARING,lxc,String,lxc,学历,lxc,是,lxc,无,lxc,10,lxc,0Q1094921525HOBBY,lxc,String,lxc,爱好,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SUIT,lxc,String,lxc,特长,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525NATIONALITY,lxc,String,lxc,国籍,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525BIRTH,lxc,String,lxc,出生年月,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525FAITH,lxc,String,lxc,宗教信仰,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525SPEIALITY,lxc,String,lxc,专业,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525RESUME,lxc,String,lxc,个人简历,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525DESCRIBE,lxc,String,lxc,个人描述,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525REMARK,lxc,String,lxc,备注,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525ISROMVE,lxc,String,lxc,目前状况,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525JOB_ID,lxc,Integer,lxc,工作编号,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525USER_ID,lxc,Integer,lxc,用户编号,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525AGE,lxc,Integer,lxc,年龄,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525ADD_TIME,lxc,Date,lxc,登记时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525STIPEND_ID,lxc,Integer,lxc,薪资ID,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525CREATE_TIME,lxc,Date,lxc,创建时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525UPDATE_TIME,lxc,Date,lxc,修改时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525CREATE_USER,lxc,String,lxc,创建人,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525UPDATE_USER,lxc,String,lxc,修改人,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525STAFF_NAME,lxc,String,lxc,员工姓名,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525','2018-01-16 02:08:36','员工档案信息表','single');

/*!40000 ALTER TABLE `sys_createcode` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dictionaries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dictionaries`;

CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_dictionaries` WRITE;
/*!40000 ALTER TABLE `sys_dictionaries` DISABLE KEYS */;

INSERT INTO `sys_dictionaries` (`DICTIONARIES_ID`, `NAME`, `NAME_EN`, `BIANMA`, `ORDER_BY`, `PARENT_ID`, `BZ`, `TBSNAME`)
VALUES
	('096e4ec8986149d994b09e604504e38d','黄浦区','huangpu','0030201',1,'f1ea30ddef1340609c35c88fb2919bee','黄埔',''),
	('12a62a3e5bed44bba0412b7e6b733c93','北京','beijing','00301',1,'be4a8c5182c744d28282a5345783a77f','北京',''),
	('507fa87a49104c7c8cdb52fdb297da12','宣武区','xuanwuqu','0030101',1,'12a62a3e5bed44bba0412b7e6b733c93','宣武区',''),
	('8994f5995f474e2dba6cfbcdfe5ea07a','语文','yuwen','00201',1,'fce20eb06d7b4b4d8f200eda623f725c','语文',''),
	('8ea7c44af25f48b993a14f791c8d689f','分类','fenlei','001',1,'0','分类',''),
	('be4a8c5182c744d28282a5345783a77f','地区','diqu','003',3,'0','地区',''),
	('d428594b0494476aa7338d9061e23ae3','红色','red','00101',1,'8ea7c44af25f48b993a14f791c8d689f','红色',''),
	('de9afadfbed0428fa343704d6acce2c4','绿色','green','00102',2,'8ea7c44af25f48b993a14f791c8d689f','绿色',''),
	('f1ea30ddef1340609c35c88fb2919bee','上海','shanghai','00302',2,'be4a8c5182c744d28282a5345783a77f','上海',''),
	('fce20eb06d7b4b4d8f200eda623f725c','课程','kecheng','002',2,'0','课程','');

/*!40000 ALTER TABLE `sys_dictionaries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_lxcbutton
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_lxcbutton`;

CREATE TABLE `sys_lxcbutton` (
  `LXCBUTTON_ID` varchar(100) NOT NULL DEFAULT '',
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`LXCBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_lxcbutton` WRITE;
/*!40000 ALTER TABLE `sys_lxcbutton` DISABLE KEYS */;

INSERT INTO `sys_lxcbutton` (`LXCBUTTON_ID`, `NAME`, `QX_NAME`, `BZ`)
VALUES
	('3542adfbda73410c976e185ffe50ad06','导出EXCEL','toExcel','导出EXCEL'),
	('46992ea280ba4b72b29dedb0d4bc0106','发邮件','email','发送电子邮件'),
	('4efa162fce8340f0bd2dcd3b11d327ec','导入EXCEL','FromExcel','导入EXCEL到系统用户'),
	('cc51b694d5344d28a9aa13c84b7166cd','发短信','sms','发送短信'),
	('da7fd386de0b49ce809984f5919022b8','站内信','LXCSMS','发送站内信');

/*!40000 ALTER TABLE `sys_lxcbutton` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_lxcsms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_lxcsms`;

CREATE TABLE `sys_lxcsms` (
  `LXCSMS_ID` varchar(100) NOT NULL DEFAULT '',
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`LXCSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_lxcsms` WRITE;
/*!40000 ALTER TABLE `sys_lxcsms` DISABLE KEYS */;

INSERT INTO `sys_lxcsms` (`LXCSMS_ID`, `CONTENT`, `TYPE`, `TO_USERNAME`, `FROM_USERNAME`, `SEND_TIME`, `STATUS`, `SANME_ID`)
VALUES
	('05879f5868824f35932ee9f2062adc03','你好','2','admin','san','2016-01-25 14:05:31','1','b311e893228f42d5a05dbe16917fd16f'),
	('2635dd035c6f4bb5a091abdd784bd899','你好','2','san','admin','2016-01-25 14:05:02','2','1b7637306683460f89174c2b025862b5'),
	('52378ccd4e2d4fe08994d1652af87c68','你好','1','admin','san','2016-01-25 16:26:44','1','920b20dafdfb4c09b560884eb277c51d'),
	('77ed13f9c49a4c4bb460c41b8580dd36','gggg','2','admin','san','2016-01-24 21:22:43','2','dd9ee339576e48c5b046b94fa1901d00'),
	('98a6869f942042a1a037d9d9f01cb50f','你好','1','admin','san','2016-01-25 14:05:02','2','1b7637306683460f89174c2b025862b5'),
	('9e00295529014b6e8a27019cbccb3da1','柔柔弱弱','1','admin','san','2016-01-24 21:22:57','1','a29603d613ea4e54b5678033c1bf70a6'),
	('d3aedeb430f640359bff86cd657a8f59','你好','1','admin','san','2016-01-24 21:22:12','1','f022fbdce3d845aba927edb698beb90b'),
	('e5376b1bd54b489cb7f2203632bd74ec','管理员好','2','admin','san','2016-01-25 14:06:13','2','b347b2034faf43c79b54be4627f3bd2b'),
	('e613ac0fcc454f32895a70b747bf4fb5','你也好','2','admin','san','2016-01-25 16:27:54','2','ce8dc3b15afb40f28090f8b8e13f078d'),
	('f25e00cfafe741a3a05e3839b66dc7aa','你好','2','san','admin','2016-01-25 16:26:44','1','920b20dafdfb4c09b560884eb277c51d');

/*!40000 ALTER TABLE `sys_lxcsms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;

INSERT INTO `sys_menu` (`MENU_ID`, `MENU_NAME`, `MENU_URL`, `PARENT_ID`, `MENU_ORDER`, `MENU_ICON`, `MENU_TYPE`, `MENU_STATE`)
VALUES
	(1,'系统管理','#','0','1','menu-icon fa fa-desktop blue','2',1),
	(2,'权限管理','#','1','1','menu-icon fa fa-lock black','1',1),
	(6,'信息管理','#','0','5','menu-icon fa fa-credit-card green','2',1),
	(7,'图片管理','#','6','1','menu-icon fa fa-folder-o pink','2',1),
	(8,'性能监控','druid/index.html','9','8','menu-icon fa fa-tachometer red','1',1),
	(9,'系统工具','#','0','3','menu-icon fa fa-cog black','2',1),
	(10,'接口测试','tool/interfaceTest.do','9','2','menu-icon fa fa-exchange green','1',1),
	(11,'发送邮件','tool/goSendEmail.do','9','3','menu-icon fa fa-envelope-o green','1',1),
	(12,'置二维码','tool/goTwoDimensionCode.do','9','4','menu-icon fa fa-barcode green','1',1),
	(14,'地图工具','tool/map.do','9','6','menu-icon fa fa-globe black','1',1),
	(15,'微信管理','#','0','4','menu-icon fa fa-comments purple','2',1),
	(16,'文本回复','textmsg/list.do','15','2','menu-icon fa fa-comment green','2',1),
	(17,'应用命令','command/list.do','15','4','menu-icon fa fa-comment grey','2',1),
	(18,'图文回复','imgmsg/list.do','15','3','menu-icon fa fa-comment pink','2',1),
	(19,'关注回复','textmsg/goSubscribe.do','15','1','menu-icon fa fa-comment orange','2',1),
	(20,'在线管理','onlinemanager/list.do','1','5','menu-icon fa fa-laptop green','1',1),
	(21,'打印测试','tool/printTest.do','9','7','menu-icon fa fa-hdd-o grey','1',1),
	(22,'一级菜单','#','0','10','menu-icon fa fa-fire orange','2',1),
	(23,'二级菜单','#','22','1','menu-icon fa fa-leaf black','1',1),
	(24,'三级菜单','#','23','1','menu-icon fa fa-leaf black','1',1),
	(30,'四级菜单','#','24','1','menu-icon fa fa-leaf black','1',1),
	(31,'五级菜单1','#','30','1','menu-icon fa fa-leaf black','1',1),
	(32,'五级菜单2','#','30','2','menu-icon fa fa-leaf black','1',1),
	(33,'六级菜单','#','31','1','menu-icon fa fa-leaf black','1',1),
	(34,'六级菜单2','login_default.do','31','2','menu-icon fa fa-leaf black','1',1),
	(35,'四级菜单2','login_default.do','24','2','menu-icon fa fa-leaf black','1',1),
	(36,'角色(基础权限)','role.do','2','1','menu-icon fa fa-key orange','1',1),
	(37,'按钮权限','buttonrights/list.do','2','2','menu-icon fa fa-key green','1',1),
	(38,'菜单管理','menu/listAllMenu.do','1','3','menu-icon fa fa-folder-open-o brown','1',1),
	(39,'按钮管理','lxcbutton/list.do','1','2','menu-icon fa fa-download orange','1',1),
	(40,'用户管理','#','0','2','menu-icon fa fa-users blue','2',1),
	(41,'系统用户','user/listUsers.do','40','1','menu-icon fa fa-users green','1',1),
	(42,'会员管理','happuser/listUsers.do','40','2','menu-icon fa fa-users orange','1',1),
	(43,'数据字典','dictionaries/listAllDict.do?DICTIONARIES_ID=0','1','4','menu-icon fa fa-book purple','1',1),
	(44,'代码生成器','#','9','0','menu-icon fa fa-cogs brown','1',1),
	(45,'七级菜单1','#','33','1','menu-icon fa fa-leaf black','1',1),
	(46,'七级菜单2','#','33','2','menu-icon fa fa-leaf black','1',1),
	(47,'八级菜单','login_default.do','45','1','menu-icon fa fa-leaf black','1',1),
	(48,'图表报表',' tool/fusionchartsdemo.do','9','5','menu-icon fa fa-bar-chart-o black','1',1),
	(50,'站内信','lxcsms/list.do','6','3','menu-icon fa fa-envelope green','1',1),
	(51,'图片列表','pictures/list.do','7','1','menu-icon fa fa-folder-open-o green','1',1),
	(52,'图片爬虫','pictures/goImageCrawler.do','7','2','menu-icon fa fa-cloud-download green','1',1),
	(53,'表单构建器','tool/goFormbuilder.do','9','1','menu-icon fa fa-leaf black','1',1),
	(54,'数据库管理','#','0','9','menu-icon fa fa-hdd-o blue','2',1),
	(55,'数据库备份','brdb/listAllTable.do','54','1','menu-icon fa fa-cloud-upload blue','1',1),
	(56,'数据库还原','brdb/list.do','54','3','menu-icon fa fa-cloud-download blue','1',1),
	(57,'备份定时器','timingbackup/list.do','54','2','menu-icon fa fa-tachometer blue','1',1),
	(58,'SQL编辑器','sqledit/view.do','54','4','menu-icon fa fa-pencil-square-o blue','1',1),
	(59,'OA办公','#','0','6','menu-icon fa fa-laptop pink','2',1),
	(60,'组织机构','department/listAllDepartment.do?DEPARTMENT_ID=0','59','1','menu-icon fa fa-users green','1',1),
	(61,'反向生成','recreateCode/list.do','44','2','menu-icon fa fa-cogs blue','1',1),
	(62,'正向生成','createCode/list.do','44','1','menu-icon fa fa-cogs green','1',1),
	(63,'主附结构','attached/list.do','6','2','menu-icon fa fa-folder-open blue','1',1),
	(64,'人力资源档案管理','#','0','1','menu-icon fa fa-desktop red','2',1),
	(65,'员工档案信息管理','staffemployee/list.do','64','1','menu-icon fa fa-leaf black','1',1);

/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`ROLE_ID`, `ROLE_NAME`, `RIGHTS`, `PARENT_ID`, `ADD_QX`, `DEL_QX`, `EDIT_QX`, `CHA_QX`)
VALUES
	('1','系统管理组','18446181122715934662','0','1','1','1','1'),
	('115b386ff04f4352b060dffcd2b5d1da','中级会员','498','2','0','0','0','0'),
	('1b67fc82ce89457a8347ae53e43a347e','初级会员','498','2','0','0','0','0'),
	('2','会员组','498','0','0','0','0','1'),
	('3264c8e83d0248bb9e3ea6195b4c0216','一级管理员','18446181122715934662','1','2244102192095174','2251798773489606','1125898866646982','560135202614009798'),
	('46294b31a71c4600801724a6eb06bb26','职位组','','0','0','0','0','0'),
	('5466347ac07044cb8d82990ec7f3a90e','主管','','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),
	('68f8e4a39efe47c7bb869e9d15ab925d','二级管理员','18446181122715934662','1','0','0','2251798773489606','0'),
	('856849f422774ad390a4e564054d8cc8','经理','','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),
	('8b70a7e67f2841e7aaba8a4d92e5ff6f','高级会员','498','2','0','0','0','0'),
	('c21cecf84048434b93383182b1d98cba','组长','','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),
	('c2ae457987fd4704bef5f630583aa6ad','人力资源系统管理员','57069622174620319744','1','57069622174620319744','55340232221128654848','66300867814241599680','57069614478038925312'),
	('d449195cd8e7491080688c58e11452eb','总监','','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),
	('de9de2f006e145a29d52dfadda295353','三级管理员','18446181122715934662','1','0','0','0','0');

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_lxcbutton
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_lxcbutton`;

CREATE TABLE `sys_role_lxcbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_lxcbutton` (`LXCBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_role_lxcbutton` WRITE;
/*!40000 ALTER TABLE `sys_role_lxcbutton` DISABLE KEYS */;

INSERT INTO `sys_role_lxcbutton` (`RB_ID`, `ROLE_ID`, `BUTTON_ID`)
VALUES
	('14b5c28ea6ae4508b57d2d272ab3d5f1','3264c8e83d0248bb9e3ea6195b4c0216','46992ea280ba4b72b29dedb0d4bc0106'),
	('1743733f366240c693c4295b527d1b0e','de9de2f006e145a29d52dfadda295353','4efa162fce8340f0bd2dcd3b11d327ec'),
	('3768e60edd1c4b5c9f1dd861188ae2f9','3264c8e83d0248bb9e3ea6195b4c0216','cc51b694d5344d28a9aa13c84b7166cd'),
	('8231c216fb514b4188e4162e629c6237','3264c8e83d0248bb9e3ea6195b4c0216','4efa162fce8340f0bd2dcd3b11d327ec'),
	('9412d1d05162464c83658c7f89ab03f0','68f8e4a39efe47c7bb869e9d15ab925d','3542adfbda73410c976e185ffe50ad06'),
	('96567633dd3548c9b75d28f430adf5a3','3264c8e83d0248bb9e3ea6195b4c0216','da7fd386de0b49ce809984f5919022b8'),
	('a1478f27c852459fa9cad04b642f4fb7','de9de2f006e145a29d52dfadda295353','3542adfbda73410c976e185ffe50ad06'),
	('ba6696b8761044618e44c7e02c9ba89e','68f8e4a39efe47c7bb869e9d15ab925d','cc51b694d5344d28a9aa13c84b7166cd'),
	('f0329033d0914faf8ea6e9ff252cc5e6','68f8e4a39efe47c7bb869e9d15ab925d','46992ea280ba4b72b29dedb0d4bc0106'),
	('f627982cc9d4479dbc03af726dc6ac58','de9de2f006e145a29d52dfadda295353','cc51b694d5344d28a9aa13c84b7166cd');

/*!40000 ALTER TABLE `sys_role_lxcbutton` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`USER_ID`, `USERNAME`, `PASSWORD`, `NAME`, `RIGHTS`, `ROLE_ID`, `LAST_LOGIN`, `IP`, `STATUS`, `BZ`, `SKIN`, `EMAIL`, `NUMBER`, `PHONE`)
VALUES
	('1','admin','de41b7fb99201d8334c23c014db35ecd92df81bc','lxc','1133671055321055258374707980945218933803269864762743594642571294','1','2018-01-16 03:00:48','0:0:0:0:0:0:0:1','0','admin','default','QQ1094921525@main.com','001','18101298728'),
	('69177258a06e4927b4639ab1684c3320','san','47c4a8dc64ac2f0bb46bbd8813b037c9718f9349','三','','3264c8e83d0248bb9e3ea6195b4c0216','2016-04-21 17:53:06','127.0.0.1','0','111','default','978336446@qq.com','333','13562202556'),
	('9991f4d7782a4ccfb8a65bd96ea7aafa','lisi','2612ade71c1e48cd7150b5f4df152faa699cedfe','李四','','3264c8e83d0248bb9e3ea6195b4c0216','2016-03-21 17:41:57','127.0.0.1','0','小李','default','313596790@qq.com','1102','13566233663'),
	('b920e29ae2264f40a6a9530036c732fd','hr','861d10246b852f459de5d6e853db324ec270f270','HR','','c2ae457987fd4704bef5f630583aa6ad','2018-01-21 13:48:10','0:0:0:0:0:0:0:1','0','人力资源管理员','default','1281290121@qq.com','1001','18911780490'),
	('e29149962e944589bb7da23ad18ddeed','zhangsan','de41b7fb99201d8334c23c014db35ecd92df81bc','张三','','3264c8e83d0248bb9e3ea6195b4c0216','','','0','小张','default','zhangsan@www.com','1101','2147483647');

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_attached
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_attached`;

CREATE TABLE `tb_attached` (
  `ATTACHED_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `FDESCRIBE` varchar(255) DEFAULT NULL COMMENT '描述',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '价格',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ATTACHED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_attached` WRITE;
/*!40000 ALTER TABLE `tb_attached` DISABLE KEYS */;

INSERT INTO `tb_attached` (`ATTACHED_ID`, `NAME`, `FDESCRIBE`, `PRICE`, `CTIME`)
VALUES
	('d74b6f507e784607b8f85e31e3cfad22','AA','aaa',222.00,'2016-04-17 18:20:41');

/*!40000 ALTER TABLE `tb_attached` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_attachedmx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_attachedmx`;

CREATE TABLE `tb_attachedmx` (
  `ATTACHEDMX_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建日期',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '单价',
  `ATTACHED_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ATTACHEDMX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_attachedmx` WRITE;
/*!40000 ALTER TABLE `tb_attachedmx` DISABLE KEYS */;

INSERT INTO `tb_attachedmx` (`ATTACHEDMX_ID`, `NAME`, `TITLE`, `CTIME`, `PRICE`, `ATTACHED_ID`)
VALUES
	('04717d1a034c4e51aacd5e062a4c63bd','ddd','ddd','2016-03-29',111.00,'d74b6f507e784607b8f85e31e3cfad22'),
	('f7ac797407be4a76a7125d41fe345112','rgt','gdf','2016-03-30',3423.00,'d74b6f507e784607b8f85e31e3cfad22');

/*!40000 ALTER TABLE `tb_attachedmx` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_pictures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_pictures`;

CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_pictures` WRITE;
/*!40000 ALTER TABLE `tb_pictures` DISABLE KEYS */;

INSERT INTO `tb_pictures` (`PICTURES_ID`, `TITLE`, `NAME`, `PATH`, `CREATETIME`, `MASTER_ID`, `BZ`)
VALUES
	('0c0c82eca0da4ec1ab0fe6e20258798d','图片','2db0d7a559f74a66902d0a5ba06a6335.jpeg','20180114/2db0d7a559f74a66902d0a5ba06a6335.jpeg','2018-01-14 17:24:32','1','图片管理处上传'),
	('10928e45842c476881a931b66974942a','图片','8fdf2fa6de034426b03ae0efd6bf7ae7.jpeg','20180114/8fdf2fa6de034426b03ae0efd6bf7ae7.jpeg','2018-01-14 17:24:33','1','图片管理处上传'),
	('6864b83430bd4a5b96186a630678c269','图片','db30eab3b7354ba78c3988774f0fee33.jpeg','20180114/db30eab3b7354ba78c3988774f0fee33.jpeg','2018-01-14 17:24:32','1','图片管理处上传'),
	('69efb1526b1e48459fbdb1f5efd09cc7','图片','a56f3b473a1a42459bf64dfd9c4b2d2d.jpeg','20180114/a56f3b473a1a42459bf64dfd9c4b2d2d.jpeg','2018-01-14 17:24:32','1','图片管理处上传'),
	('785e4f3118ea4cefb68c628eaafaeb83','图片','282efe0ffedd4363a4189c4eae8ca387.jpeg','20180114/282efe0ffedd4363a4189c4eae8ca387.jpeg','2018-01-14 17:24:32','1','图片管理处上传'),
	('7e36027440fc468f89f332b20fc76a47','图片','a4abfca27f874026ae8ada2e8240c2b4.jpeg','20180114/a4abfca27f874026ae8ada2e8240c2b4.jpeg','2018-01-14 17:24:32','1','图片管理处上传'),
	('82a794b75b2f4863b8bbae65f068e7e2','图片','0218761f21c14737b4d54e2d7c833502.jpeg','20180114/0218761f21c14737b4d54e2d7c833502.jpeg','2018-01-14 17:24:32','1','图片管理处上传'),
	('8c3cae8d260d405fbad5163d53ca7394','图片','0aa91efb080b415d967d04d74ea86f08.jpeg','20180114/0aa91efb080b415d967d04d74ea86f08.jpeg','2018-01-14 17:24:33','1','图片管理处上传'),
	('8c732f262f8b4a44921e7578ecb91c39','图片','83d14225c60249b09b16d2adc18d4f67.jpeg','20180114/83d14225c60249b09b16d2adc18d4f67.jpeg','2018-01-14 17:24:31','1','图片管理处上传'),
	('9cbadf551b2f41deb909511d4e5ebd31','图片','348434c2117e47668e2f137e1ceea4a3.jpeg','20180114/348434c2117e47668e2f137e1ceea4a3.jpeg','2018-01-14 17:24:33','1','图片管理处上传'),
	('b09d264a371e412e94cd0c069825d02d','图片','5b205c612c114010942846b9e575c26c.jpeg','20180114/5b205c612c114010942846b9e575c26c.jpeg','2018-01-14 17:24:32','1','图片管理处上传'),
	('bf4e3b5ea81641538dc8d58ef4a9faf8','图片','554fd5c4ca124062a8574c18627e1c87.jpeg','20180114/554fd5c4ca124062a8574c18627e1c87.jpeg','2018-01-14 17:24:31','1','图片管理处上传'),
	('dffbc4d805204cfea70ae48881fe189e','图片','d05219623f43481386e29f850a8a44b4.jpeg','20180114/d05219623f43481386e29f850a8a44b4.jpeg','2018-01-14 17:24:31','1','图片管理处上传');

/*!40000 ALTER TABLE `tb_pictures` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table TB_STAFFEMPLOYEE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_STAFFEMPLOYEE`;

CREATE TABLE `TB_STAFFEMPLOYEE` (
  `STAFFEMPLOYEE_ID` varchar(100) NOT NULL,
  `STAFF_ID` int(11) NOT NULL COMMENT '员工ID',
  `SEX` int(2) NOT NULL COMMENT '性别',
  `ADDRESS` varchar(50) DEFAULT NULL COMMENT '地址',
  `PHONE` varchar(20) DEFAULT NULL COMMENT '电话',
  `PIC` varchar(255) DEFAULT NULL COMMENT '照片地址',
  `CARD_ID` varchar(20) DEFAULT NULL COMMENT '身份证号码',
  `EMAIL` varchar(30) DEFAULT NULL COMMENT 'E-mail',
  `QQ` varchar(15) DEFAULT NULL COMMENT 'QQ',
  `WECHAT` varchar(30) DEFAULT NULL COMMENT '微信',
  `POST_CODE` varchar(255) DEFAULT NULL COMMENT '邮编号码',
  `GOVEMMET` varchar(15) DEFAULT NULL COMMENT '政治面貌',
  `NATION` varchar(30) DEFAULT NULL COMMENT '民族',
  `LEARING` varchar(10) DEFAULT NULL COMMENT '学历',
  `HOBBY` varchar(50) DEFAULT NULL COMMENT '爱好',
  `SUIT` varchar(50) DEFAULT NULL COMMENT '特长',
  `NATIONALITY` varchar(50) DEFAULT NULL COMMENT '国籍',
  `BIRTH` varchar(20) DEFAULT NULL COMMENT '出生年月',
  `FAITH` varchar(30) DEFAULT NULL COMMENT '宗教信仰',
  `SPEIALITY` varchar(20) DEFAULT NULL COMMENT '专业',
  `RESUME` varchar(255) DEFAULT NULL COMMENT '个人简历',
  `DESCRIBES` varchar(255) DEFAULT NULL COMMENT '个人描述',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `ISROMVE` varchar(30) DEFAULT NULL COMMENT '目前状况',
  `JOB_ID` int(11) NOT NULL COMMENT '工作编号',
  `USER_ID` int(11) NOT NULL COMMENT '用户编号',
  `AGE` int(11) NOT NULL COMMENT '年龄',
  `ADD_TIME` varchar(32) DEFAULT NULL COMMENT '登记时间',
  `STIPEND_ID` int(11) NOT NULL COMMENT '薪资ID',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` varchar(255) DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` varchar(255) DEFAULT NULL COMMENT '修改人',
  `STAFF_NAME` varchar(20) DEFAULT NULL COMMENT '员工姓名',
  PRIMARY KEY (`STAFFEMPLOYEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `TB_STAFFEMPLOYEE` WRITE;
/*!40000 ALTER TABLE `TB_STAFFEMPLOYEE` DISABLE KEYS */;

INSERT INTO `TB_STAFFEMPLOYEE` (`STAFFEMPLOYEE_ID`, `STAFF_ID`, `SEX`, `ADDRESS`, `PHONE`, `PIC`, `CARD_ID`, `EMAIL`, `QQ`, `WECHAT`, `POST_CODE`, `GOVEMMET`, `NATION`, `LEARING`, `HOBBY`, `SUIT`, `NATIONALITY`, `BIRTH`, `FAITH`, `SPEIALITY`, `RESUME`, `DESCRIBES`, `REMARK`, `ISROMVE`, `JOB_ID`, `USER_ID`, `AGE`, `ADD_TIME`, `STIPEND_ID`, `CREATE_TIME`, `UPDATE_TIME`, `CREATE_USER`, `UPDATE_USER`, `STAFF_NAME`)
VALUES
	('f1c558ce3db2423e8e5dd1566839fe28',101,1,'北京市海淀区','18101298728','121211','360732199306202118','12811212921@qq.com','1291290121','liuxicai002','10001','群众','汉','本科','编程','书法','中国','10919291','佛教','计算机科学与技术','哈哈哈',NULL,'哈哈','11',1002,975,23,'2018-01-16',101,'2018-01-16','2018-01-16','1','1','刘熙财');

/*!40000 ALTER TABLE `TB_STAFFEMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table weixin_command
# ------------------------------------------------------------

DROP TABLE IF EXISTS `weixin_command`;

CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `weixin_command` WRITE;
/*!40000 ALTER TABLE `weixin_command` DISABLE KEYS */;

INSERT INTO `weixin_command` (`COMMAND_ID`, `KEYWORD`, `COMMANDCODE`, `CREATETIME`, `STATUS`, `BZ`)
VALUES
	('2636750f6978451b8330874c9be042c2','锁定服务器','rundll32.exe user32.dll,LockWorkStation','2015-05-10 21:25:06',1,'锁定计算机'),
	('46217c6d44354010823241ef484f7214','打开浏览器','C:/Program Files/Internet Explorer/iexplore.exe','2015-05-09 02:43:02',1,'打开浏览器操作'),
	('576adcecce504bf3bb34c6b4da79a177','关闭浏览器','taskkill /f /im iexplore.exe','2015-05-09 02:36:48',2,'关闭浏览器操作'),
	('854a157c6d99499493f4cc303674c01f','关闭QQ','taskkill /f /im qq.exe','2015-05-10 21:25:46',1,'关闭QQ'),
	('ab3a8c6310ca4dc8b803ecc547e55ae7','打开QQ','D:/SOFT/QQ/QQ/Bin/qq.exe','2015-05-10 21:25:25',1,'打开QQ');

/*!40000 ALTER TABLE `weixin_command` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table weixin_imgmsg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `weixin_imgmsg`;

CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `weixin_imgmsg` WRITE;
/*!40000 ALTER TABLE `weixin_imgmsg` DISABLE KEYS */;

INSERT INTO `weixin_imgmsg` (`IMGMSG_ID`, `KEYWORD`, `CREATETIME`, `STATUS`, `BZ`, `TITLE1`, `DESCRIPTION1`, `IMGURL1`, `TOURL1`, `TITLE2`, `DESCRIPTION2`, `IMGURL2`, `TOURL2`, `TITLE3`, `DESCRIPTION3`, `IMGURL3`, `TOURL3`, `TITLE4`, `DESCRIPTION4`, `IMGURL4`, `TOURL4`, `TITLE5`, `DESCRIPTION5`, `IMGURL5`, `TOURL5`, `TITLE6`, `DESCRIPTION6`, `IMGURL6`, `TOURL6`, `TITLE7`, `DESCRIPTION7`, `IMGURL7`, `TOURL7`, `TITLE8`, `DESCRIPTION8`, `IMGURL8`, `TOURL8`)
VALUES
	('380b2cb1f4954315b0e20618f7b5bd8f','首页','2015-05-10 20:51:09',1,'图文回复','图文回复标题','图文回复描述','http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg','www.baidu.com','','','','','','','','','','','','','','','','','','','','','','','','','','','','');

/*!40000 ALTER TABLE `weixin_imgmsg` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table weixin_textmsg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `weixin_textmsg`;

CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(2) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `weixin_textmsg` WRITE;
/*!40000 ALTER TABLE `weixin_textmsg` DISABLE KEYS */;

INSERT INTO `weixin_textmsg` (`TEXTMSG_ID`, `KEYWORD`, `CONTENT`, `CREATETIME`, `STATUS`, `BZ`)
VALUES
	('695cd74779734231928a253107ab0eeb','吃饭','吃了噢噢噢噢','2015-05-10 22:52:27',1,'文本回复'),
	('d4738af7aea74a6ca1a5fb25a98f9acb','关注','这里是关注后回复的内容','2015-05-11 02:12:36',1,'关注回复');

/*!40000 ALTER TABLE `weixin_textmsg` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
