# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.17)
# Database: lxcadmin
# Generation Time: 2018-03-24 06:25:18 +0000
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
  `LXCDB_ID` varchar(100) NOT NULL DEFAULT '' COMMENT '数据库id',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`LXCDB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据库备份表';



# Dump of table db_timingbackup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `db_timingbackup`;

CREATE TABLE `db_timingbackup` (
  `TIMINGBACKUP_ID` varchar(100) NOT NULL COMMENT '定时备份id',
  `JOBNAME` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `LXCTIME` varchar(30) DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时备份 备份表';

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
  `DEPARTMENT_ID` varchar(100) NOT NULL COMMENT '部门id',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OA办公部门表';

LOCK TABLES `oa_department` WRITE;
/*!40000 ALTER TABLE `oa_department` DISABLE KEYS */;

INSERT INTO `oa_department` (`DEPARTMENT_ID`, `NAME`, `NAME_EN`, `BIANMA`, `PARENT_ID`, `BZ`, `HEADMAN`, `TEL`, `FUNCTIONS`, `ADDRESS`)
VALUES
	('0956d8c279274fca92f4091f2a69a9ad','销售会计','xiaokuai','05896','d41af567914a409893d011aa53eda797','','','','',''),
	('3e7227e11dc14b4d9e863dd1a1fcedf6','成本会计','chengb','03656','d41af567914a409893d011aa53eda797','','','','',''),
	('58febb24e42244e9bfffb7666892973c','行政部','xingzhengbu','00104','a6c6695217ba4a4dbfe9f7e9d2c06730','','冬梅','','',''),
	('5cccdb7c432449d8b853c52880058140','B公司','b','002','0','冶铁','李四','112','冶铁','河北'),
	('5dfc1c1c25f54603b62f70ba24d61fb1','销售部','xiaoshoubu','00102','a6c6695217ba4a4dbfe9f7e9d2c06730','','琳达','','',''),
	('6d47d2d317aa4eb5906bad71a4bd5c34','运营部','yunyingbu','00106','a6c6695217ba4a4dbfe9f7e9d2c06730','','郑爽','','',''),
	('83a25761c618457cae2fa1211bd8696d','销售B组','xiaob','002365','cbbc84eddde947ba8af7d509e430eb70','','李四','','',''),
	('8f8b045470f342fdbc4c312ab881d62b','销售A组','xiaoA','0326','cbbc84eddde947ba8af7d509e430eb70','','张三','0201212','',''),
	('a0982dea52554225ab682cd4b421de47','1队','yidui','02563','8f8b045470f342fdbc4c312ab881d62b','','小王','12356989','',''),
	('a6c6695217ba4a4dbfe9f7e9d2c06730','A公司','a','001','0','挖煤','张三','110','洼煤矿','山西'),
	('b1fbd1e1ea8a48ebb1b06d9832333a18','产品部','chanpingbu','00109','a6c6695217ba4a4dbfe9f7e9d2c06730','','沈阳','','',''),
	('cbbc84eddde947ba8af7d509e430eb70','销售部','xiaoshoubu','00201','5cccdb7c432449d8b853c52880058140','推销商品','小明','11236','推销商品','909办公室'),
	('d17cc99cfba845e0a055d5496ff779bd','研发中心','yanfazhongxin','00103','a6c6695217ba4a4dbfe9f7e9d2c06730','','波波','','',''),
	('d41af567914a409893d011aa53eda797','财务部','caiwubu','00101','a6c6695217ba4a4dbfe9f7e9d2c06730','负责发工资','王武','11236','管理财务','308办公室');

/*!40000 ALTER TABLE `oa_department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_app_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_app_user`;

CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL COMMENT '用户id',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `NAME` varchar(255) DEFAULT NULL COMMENT '姓名',
  `RIGHTS` varchar(255) DEFAULT NULL COMMENT '权限',
  `ROLE_ID` varchar(100) DEFAULT NULL COMMENT '角色id',
  `LAST_LOGIN` varchar(255) DEFAULT NULL COMMENT '最后一次登录',
  `IP` varchar(100) DEFAULT NULL COMMENT 'IP地址',
  `STATUS` varchar(32) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `PHONE` varchar(100) DEFAULT NULL COMMENT '手机号码',
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL COMMENT '开始时间',
  `END_TIME` varchar(100) DEFAULT NULL COMMENT '结束时间',
  `YEARS` int(10) DEFAULT NULL COMMENT '年',
  `NUMBER` varchar(100) DEFAULT NULL COMMENT '数',
  `EMAIL` varchar(32) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='app 用户表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成器记录表';

LOCK TABLES `sys_createcode` WRITE;
/*!40000 ALTER TABLE `sys_createcode` DISABLE KEYS */;

INSERT INTO `sys_createcode` (`CREATECODE_ID`, `PACKAGENAME`, `OBJECTNAME`, `TABLENAME`, `FIELDLIST`, `CREATETIME`, `TITLE`, `LXCTYPE`)
VALUES
	('04b3841a04c246d787de7fb98c202d8c','job','Job_type','TB_,lxc,JOB_TYPE','TYPE_NAME,lxc,String,lxc,类别名称,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525SELET_ID,lxc,String,lxc,是否启用,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525','2018-03-14 23:48:11','职位类型模块','single'),
	('19711ff736c44471a59a6b6e7dd41313','employee','Resume','TB_,lxc,RESUME','SEX,lxc,Integer,lxc,性别,lxc,是,lxc,无,lxc,2,lxc,0Q1094921525ADDRESS,lxc,String,lxc,地址,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525PHONE,lxc,String,lxc,电话,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525PIC,lxc,String,lxc,照片地址,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525CARD_ID,lxc,String,lxc,身份证号码,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525EMAIL,lxc,String,lxc,E-mail,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525QQ,lxc,String,lxc,QQ,lxc,是,lxc,无,lxc,15,lxc,0Q1094921525WECHAT,lxc,String,lxc,微信,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525POST_CODE,lxc,String,lxc,邮编号码,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525GOVEMMET,lxc,String,lxc,政治面貌,lxc,是,lxc,无,lxc,15,lxc,0Q1094921525NATION,lxc,String,lxc,民族,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525LEARING,lxc,String,lxc,学历,lxc,是,lxc,无,lxc,10,lxc,0Q1094921525HOBBY,lxc,String,lxc,爱好,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SUIT,lxc,String,lxc,特长,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525NATIONALITY,lxc,String,lxc,国籍,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525BIRTH,lxc,String,lxc,出生年月,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525FAITH,lxc,String,lxc,宗教信仰,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525SPEIALITY,lxc,String,lxc,专业,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525RESUME,lxc,String,lxc,个人简历,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525DESCRIBE,lxc,String,lxc,个人描述,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525REMARK,lxc,String,lxc,备注,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525ISROMVE,lxc,String,lxc,目前状况,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525USER_ID,lxc,String,lxc,审核人编码,lxc,否,lxc,无,lxc,32,lxc,0Q1094921525AGE,lxc,Integer,lxc,年龄,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525TIME,lxc,Date,lxc,时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525CREATE_TIME,lxc,Date,lxc,创建时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525UPDATE_TIME,lxc,Date,lxc,修改时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525CREATE_USER,lxc,String,lxc,创建人,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525UPDATE_USER,lxc,String,lxc,修改人,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525STAFF_NAME,lxc,String,lxc,员工姓名,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525STATUS,lxc,Integer,lxc,审核状态,lxc,是,lxc,无,lxc,5,lxc,0Q1094921525USER_NAME,lxc,String,lxc,审核人姓名,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525REASON,lxc,String,lxc,推荐理由,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525RESULT,lxc,Integer,lxc,面试成绩,lxc,是,lxc,无,lxc,10,lxc,0Q1094921525SCORE,lxc,String,lxc,面试评价,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525JOBMESSAGE_ID,lxc,Integer,lxc,工作职位id,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525DEGREE,lxc,String,lxc,等级,lxc,是,lxc,无,lxc,10,lxc,0Q1094921525','2018-01-27 16:40:33','简历表','single'),
	('2512a85a675f45d39c82bb927ddc537a','employment','SubjectManage','TB_,lxc,SUBJECTMANAGE','SUBJECT_NAME,lxc,String,lxc,题目,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525SUBJECT_TYPE,lxc,String,lxc,资源地址,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525SELECT_A,lxc,String,lxc,A选项,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SELECT_B,lxc,String,lxc,B选项,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SELECT_C,lxc,String,lxc,C选项,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SELECT_D,lxc,String,lxc,D选项,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SELECT_E,lxc,String,lxc,E选项,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SELECT_F,lxc,String,lxc,F选项,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SELECT_TURE,lxc,String,lxc,正确选项,lxc,是,lxc,无,lxc,5,lxc,0Q1094921525ISSUE_PERSON,lxc,Integer,lxc,分值,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525ISSUE_TIME,lxc,Date,lxc,出题时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525','2018-01-27 16:20:40','题库信息表','single'),
	('390b72e895a6440a817bfd5310f0425d','job','JobMessage','TB_,lxc,JOBMESSAGE','JOB_TYPE_ID,lxc,Integer,lxc,工作类型id,lxc,否,lxc,无,lxc,11,lxc,0Q1094921525JOB_NAME,lxc,String,lxc,工作名称,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525STIPEND_MANGER_ID,lxc,String,lxc,薪酬标准id,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525','2018-03-11 14:27:18','职位工作类型表','fathertable'),
	('4b73f798425a4e95a719f7464a529654','employment','InterviewInfo','TB_,lxc,INTERVIEWINFO','RESUME_ID,lxc,Integer,lxc,简历id,lxc,否,lxc,无,lxc,11,lxc,0Q1094921525EMPLOYEE_STATE,lxc,Integer,lxc,录用状态,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525EMPLOYEE_TIME,lxc,Date,lxc,录用时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525RESUME_USER_ID,lxc,String,lxc,招聘人id,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525RESUME_USER_NAME,lxc,String,lxc,招聘人姓名,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525','2018-03-19 16:15:51','面试人账户表','single'),
	('6321af73dade47958c1ab0fb942f280b','subject','SubjectType','TB_,lxc,SUBJECTTYPE','SUBJECT_NAME,lxc,String,lxc,试卷分类名称,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525IS_REMOVE,lxc,Integer,lxc,是否删除 0 否 1 是,lxc,否,lxc,0,lxc,5,lxc,0Q1094921525CREATE_TIME,lxc,Date,lxc,创建时间,lxc,否,lxc,无,lxc,32,lxc,0Q1094921525CREATEUSER,lxc,String,lxc,创建人,lxc,否,lxc,无,lxc,255,lxc,0Q1094921525STATUS,lxc,Integer,lxc,是否启用,lxc,是,lxc,无,lxc,5,lxc,0Q1094921525','2018-03-19 17:40:21','试卷分类表','fathertable'),
	('6fb77bc66d704d9ab9b1987fcaf13878','employment','Answer','TB_,lxc,ANSWER','SUBJECT_ID,lxc,String,lxc,试题ID,引用试题表,lxc,否,lxc,无,lxc,32,lxc,0Q1094921525JOB_MESSAGE_ID,lxc,String,lxc,应聘职位ID,引用职位表,lxc,否,lxc,无,lxc,32,lxc,0Q1094921525SELECT_KEY,lxc,String,lxc,选择的答案,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525RESUME_ID,lxc,String,lxc,简历Id,lxc,否,lxc,无,lxc,255,lxc,0Q1094921525EXAM_TIME,lxc,Date,lxc,考试时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525CREATE_TIME,lxc,Date,lxc,创建时间,lxc,否,lxc, Tools.date2Str(new Date()),lxc,32,lxc,0Q1094921525CREATE_USER,lxc,String,lxc,创建人,lxc,否,lxc,Jurisdiction.getUsername(),lxc,255,lxc,0Q1094921525','2018-03-22 00:09:24','答题表','fathertable'),
	('8a7f641db01d4eb69f1d40025f8deb10','employment','InterviewInfo','TB_,lxc,INTERVIEWINFO','RESUME_ID,lxc,Integer,lxc,简历id,lxc,否,lxc,无,lxc,11,lxc,0Q1094921525EMPLOYEE_STATE,lxc,Integer,lxc,录用状态,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525EMPLOYEE_TIME,lxc,Date,lxc,录用时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525RESUME_USER_ID,lxc,String,lxc,招聘人id,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525RESUME_USER_NAME,lxc,String,lxc,招聘人姓名,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525','2018-01-27 17:28:58','面试人账户表','single'),
	('8a8609ca7a914e84ad10c06f9019d22c','mobilize','Mobilize','TB_,lxc,MOBILIZE','EMP_ID,lxc,String,lxc,审核人编号,lxc,否,lxc,无,lxc,32,lxc,0Q1094921525EMP_NAME,lxc,String,lxc,审核人名称,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525JOB_ID,lxc,String,lxc,工作职位编码,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525CAUSE,lxc,String,lxc,调用原因,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525STATUS,lxc,String,lxc,审核状态,lxc,是,lxc,无,lxc,5,lxc,0Q1094921525','2018-01-27 16:25:06','调动管理','single'),
	('95115d9955c449c2bfc86aec20cd0f59','subject','SubjectTypeMx','TB_,lxc,SUBJECTTYPEMX','SUBJECTTYPE_ID,lxc,String,lxc,试卷分类id,lxc,否,lxc,无,lxc,255,lxc,0Q1094921525SUBJECTMANAGE,lxc,String,lxc,试题类型,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525CREATE_TIME,lxc,Date,lxc,创建时间,lxc,否,lxc,无,lxc,32,lxc,0Q1094921525CREATE_USER,lxc,String,lxc,创建人,lxc,否,lxc,无,lxc,255,lxc,0Q1094921525IS_REMOVE,lxc,Integer,lxc,是否删除 0 否 1 是,lxc,否,lxc,0,lxc,11,lxc,0Q1094921525STATUS,lxc,Integer,lxc,是否启用,lxc,是,lxc,无,lxc,5,lxc,0Q1094921525','2018-03-19 18:05:27','试卷分类表(明细)','sontable'),
	('9eadb15bd32f419f90638c5339c2bbb3','compensation','StipendType','TB_,lxc,STIPENDTYPE','STIPENDNAME,lxc,String,lxc,薪资类型名称,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525CREATETIME,lxc,Date,lxc,创建时间,lxc,否,lxc,无,lxc,32,lxc,0Q1094921525ISREMOVE,lxc,Integer,lxc,是否删除,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525CREATEUSER,lxc,String,lxc,创建人,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525','2018-03-19 09:06:38','薪资类型表','single'),
	('a51c969572a04412899ba8dc74c2dc7f','want','SubPaper','TB_,lxc,SUBPAPER','JOB_MANAGER_ID,lxc,String,lxc,工作职位id,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525CREATE_USER,lxc,String,lxc,创建人,lxc,否,lxc,Jurisdiction.getUsername(),lxc,50,lxc,0Q1094921525CREATE_TIME,lxc,Date,lxc,创建时间,lxc,否,lxc,DateUtil.getTime().toString(),lxc,32,lxc,0Q1094921525STATUS,lxc,Integer,lxc,是否启用,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525','2018-03-22 00:40:42','试卷','fathertable'),
	('ac8f10ec5bf140b5ba56fbf62508cc19','employee','IssueJob','TB_,lxc,ISSUEJOB','JOB_MESSAGE_ID,lxc,Integer,lxc,工作职位,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525COUNT,lxc,Integer,lxc,招聘人数,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525PRINCIPAL,lxc,Integer,lxc,招聘人,lxc,否,lxc,无,lxc,11,lxc,0Q1094921525FOUNDTIME,lxc,Date,lxc,建档时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525','2018-03-11 05:12:17','职位发布管理','fathertable'),
	('bd8d0943d9fe4b8b8018e6499c2658ca','compensation','StipenManager','TB_,lxc,STIPENMANAGER','STIPEND_NAME,lxc,String,lxc,薪酬名称,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525STIPEND_USER_NAME,lxc,String,lxc,登记人姓名,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525STIPEN_WEAL_JOURNEY,lxc,Integer,lxc,交通补贴,lxc,是,lxc,无,lxc,10,lxc,0Q1094921525STIPEN_WEAL_ LUNCH,lxc,Integer,lxc,午餐补贴,lxc,是,lxc,无,lxc,10,lxc,0Q1094921525GTIPEND_DATE,lxc,Date,lxc,登记时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525BASE_STIPEND_ID,lxc,String,lxc,基本薪资id,lxc,否,lxc,无,lxc,20,lxc,0Q1094921525STIPEND_TYPE,lxc,Integer,lxc,薪资类型,lxc,是,lxc,无,lxc,5,lxc,0Q1094921525STIPEND_WEAL,lxc,Integer,lxc,薪酬总额,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525STATUS,lxc,Integer,lxc,审批状态,lxc,是,lxc,无,lxc,5,lxc,0Q1094921525','2018-01-27 16:13:05','薪酬等级表','single'),
	('c7e25d2a541c4546a705694e15d220d5','compensation','GrantIdManager','TB_,lxc,GRANTIDMANAGER','TEMLOYEE_ID,lxc,String,lxc,员工id,lxc,否,lxc,无,lxc,30,lxc,0Q1094921525GRANT_PRICE,lxc,String,lxc,薪酬总额,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525GRANT_TIME,lxc,Date,lxc,发放时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525GRANT_USER,lxc,String,lxc,发放人,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525GRANT_STATUS,lxc,Integer,lxc,审核状态,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525CREATE_USER,lxc,String,lxc,创建人,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525CREATE_TIME,lxc,Date,lxc,创建时间,lxc,否,lxc,DateUtil.getTime().toString(),lxc,32,lxc,0Q1094921525UPDATE_USER,lxc,String,lxc,修改人,lxc,否,lxc,Jurisdiction.getUsername(),lxc,255,lxc,0Q1094921525UPDATE_TIME,lxc,Date,lxc,修改时间,lxc,否,lxc,DateUtil.getTime().toString(),lxc,32,lxc,0Q1094921525','2018-03-21 23:40:35','薪酬发放','single'),
	('d44777af89914c288a25c6bc5e286172','staff','StaffEmployee','TB_,lxc,STAFFEMPLOYEE','STAFF_ID,lxc,Integer,lxc,员工ID,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525SEX,lxc,Integer,lxc,性别,lxc,是,lxc,无,lxc,2,lxc,0Q1094921525ADDRESS,lxc,String,lxc,地址,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525PHONE,lxc,String,lxc,电话,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525PIC,lxc,String,lxc,照片地址,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525CARD_ID,lxc,String,lxc,身份证号码,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525EMAIL,lxc,String,lxc,E-mail,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525QQ,lxc,String,lxc,QQ,lxc,是,lxc,无,lxc,15,lxc,0Q1094921525WECHAT,lxc,String,lxc,微信,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525POST_CODE,lxc,String,lxc,邮编号码,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525GOVEMMET,lxc,String,lxc,政治面貌,lxc,是,lxc,无,lxc,15,lxc,0Q1094921525NATION,lxc,String,lxc,民族,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525LEARING,lxc,String,lxc,学历,lxc,是,lxc,无,lxc,10,lxc,0Q1094921525HOBBY,lxc,String,lxc,爱好,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SUIT,lxc,String,lxc,特长,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525NATIONALITY,lxc,String,lxc,国籍,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525BIRTH,lxc,String,lxc,出生年月,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525FAITH,lxc,String,lxc,宗教信仰,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525SPEIALITY,lxc,String,lxc,专业,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525RESUME,lxc,String,lxc,个人简历,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525DESCRIBE,lxc,String,lxc,个人描述,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525REMARK,lxc,String,lxc,备注,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525ISROMVE,lxc,String,lxc,目前状况,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525JOB_ID,lxc,Integer,lxc,工作编号,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525USER_ID,lxc,Integer,lxc,用户编号,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525AGE,lxc,Integer,lxc,年龄,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525ADD_TIME,lxc,Date,lxc,登记时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525STIPEND_ID,lxc,Integer,lxc,薪资ID,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525CREATE_TIME,lxc,Date,lxc,创建时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525UPDATE_TIME,lxc,Date,lxc,修改时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525CREATE_USER,lxc,String,lxc,创建人,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525UPDATE_USER,lxc,String,lxc,修改人,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525STAFF_NAME,lxc,String,lxc,员工姓名,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525','2018-01-16 02:08:36','员工档案信息表','single'),
	('e562560a3f144edab5f5adec82265511','compensation','StipendType','TB_,lxc,STIPENDTYPE','STIPENDNAME,lxc,String,lxc,薪资类型名称,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525CREATETIME,lxc,Date,lxc,创建时间,lxc,否,lxc,Tools.date2Str(new Date()),lxc,32,lxc,0Q1094921525ISREMOVE,lxc,Integer,lxc,是否启用,lxc,否,lxc,0,lxc,5,lxc,0Q1094921525CREATEUSER,lxc,String,lxc,创建人,lxc,否,lxc,Jurisdiction.getUsername(),lxc,32,lxc,0Q1094921525SALARY_PACKAGE,lxc,String,lxc,薪资待遇,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525SALARY_RANGE,lxc,String,lxc,薪资范围,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525','2018-03-22 18:28:04','薪资标准','fathertable'),
	('eee7654085b84c35abc1ad2462ca02fa','employment','PaperTypeManage','TB_,lxc,PAPERTYPEMANAGE','PAPER_TYPE_ID,lxc,Integer,lxc,试卷分类id,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525PAPER_NAME,lxc,String,lxc,类型名称,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525','2018-01-27 17:09:11','试卷分类表','single'),
	('fdbde3908f3d4c11ab1407a3df2c99fe','want','SubPaperMx','TB_,lxc,SUBPAPERMX','SUBJECTMANAGE_ID,lxc,String,lxc,试题id,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525CRATE_USER,lxc,String,lxc,创建人,lxc,否,lxc,Jurisdiction.getUsername(),lxc,255,lxc,0Q1094921525CREATE_TIME,lxc,Date,lxc,创建时间,lxc,否,lxc,Tools.date2Str(new Date()),lxc,32,lxc,0Q1094921525STATUS,lxc,Integer,lxc,是否启用,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525','2018-03-22 00:50:05','试卷(明细)','sontable');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台字典表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台按钮表';

LOCK TABLES `sys_lxcbutton` WRITE;
/*!40000 ALTER TABLE `sys_lxcbutton` DISABLE KEYS */;

INSERT INTO `sys_lxcbutton` (`LXCBUTTON_ID`, `NAME`, `QX_NAME`, `BZ`)
VALUES
	('239f3c95ea2f4acf9b622b3a27d4a826','员工档案审核','staffemployeeExamine','员工档案审核权限'),
	('282ac5b115474b23a326fd82fcdc62a1','薪资标准审核','stipendStandardAudit','薪资标准审核'),
	('3542adfbda73410c976e185ffe50ad06','导出EXCEL','toExcel','导出EXCEL'),
	('46992ea280ba4b72b29dedb0d4bc0106','发邮件','email','发送电子邮件'),
	('4efa162fce8340f0bd2dcd3b11d327ec','导入EXCEL','FromExcel','导入EXCEL到系统用户'),
	('6c63f4c03cb845099850a0c703e66cb2','填写简历','fillResume','职位发布管理-填写简历'),
	('cc51b694d5344d28a9aa13c84b7166cd','发短信','sms','发送短信'),
	('da7fd386de0b49ce809984f5919022b8','站内信','LXCSMS','发送站内信'),
	('fca15154923149a3a8f82e5ad6525f77','参加考试','examination','职位发布管理-参加考试');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台短信表';

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
  `MENU_ID` int(11) NOT NULL COMMENT '菜单id',
  `MENU_NAME` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `MENU_URL` varchar(255) DEFAULT NULL COMMENT '菜单url',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '父级菜单id',
  `MENU_ORDER` varchar(100) DEFAULT NULL COMMENT '菜单顺序',
  `MENU_ICON` varchar(60) DEFAULT NULL COMMENT '菜单图标',
  `MENU_TYPE` varchar(10) DEFAULT NULL COMMENT '菜单类型',
  `MENU_STATE` int(1) DEFAULT NULL COMMENT '菜单状态',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;

INSERT INTO `sys_menu` (`MENU_ID`, `MENU_NAME`, `MENU_URL`, `PARENT_ID`, `MENU_ORDER`, `MENU_ICON`, `MENU_TYPE`, `MENU_STATE`)
VALUES
	(1,'系统管理','#','0','10','menu-icon fa fa-desktop blue','1',1),
	(2,'权限管理','#','1','1','menu-icon fa fa-lock black','1',1),
	(6,'信息管理','#','0','8','menu-icon fa fa-credit-card green','2',1),
	(7,'图片管理','#','6','1','menu-icon fa fa-folder-o pink','2',1),
	(8,'性能监控','druid/index.html','9','8','menu-icon fa fa-tachometer red','1',1),
	(9,'系统工具','#','0','11','menu-icon fa fa-cog black','1',1),
	(10,'接口测试','tool/interfaceTest.do','9','2','menu-icon fa fa-exchange green','1',1),
	(11,'发送邮件','tool/goSendEmail.do','9','3','menu-icon fa fa-envelope-o green','1',1),
	(12,'置二维码','tool/goTwoDimensionCode.do','9','4','menu-icon fa fa-barcode green','1',1),
	(14,'地图工具','tool/map.do','9','6','menu-icon fa fa-globe black','1',1),
	(15,'微信管理','#','0','9','menu-icon fa fa-comments purple','2',1),
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
	(40,'用户管理','#','0','8','menu-icon fa fa-users blue','2',1),
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
	(54,'数据库管理','#','0','9','menu-icon fa fa-hdd-o blue','1',1),
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
	(65,'员工档案信息管理','staffemployee/list.do','64','1','menu-icon fa fa-leaf black','1',1),
	(66,'招聘管理','#','0','1','menu-icon fa fa-users red','2',1),
	(67,'职位发布管理','issuejob/list.do','66','1','menu-icon fa fa-leaf black','1',1),
	(68,'简历登记','resume/goAdd.do','66','2','menu-icon fa fa-leaf black','1',1),
	(69,'简历管理','resume/list.do','66','3','menu-icon fa fa-leaf black','1',1),
	(70,'招聘考试管理','#','88','4','menu-icon fa fa-leaf black','1',1),
	(71,'招聘考试题库管理','subjectmanage/list.do','88','5','menu-icon fa fa-leaf black','1',1),
	(72,'录用管理','interviewinfo/list.do','66','6','menu-icon fa fa-leaf black','1',1),
	(73,'面试管理','#','66','7','menu-icon fa fa-leaf black','1',1),
	(74,'考试出题','#','88','8','menu-icon fa fa-leaf black','1',1),
	(75,'薪酬管理','#','0','4','menu-icon fa fa-folder red','2',1),
	(76,'薪酬发放管理','grantidmanager/stipend_list.do','75','1','menu-icon fa fa-leaf black','1',1),
	(77,'薪酬标准管理','stipendmanager/list.do','75','3','menu-icon fa fa-leaf black','1',1),
	(80,'调动管理','#','0','5','menu-icon fa fa-cogs red','2',1),
	(81,'统计报表','#','0','5','menu-icon fa fa-bar-chart-o red','2',1),
	(82,'调动管理','mobilize/doSelectList.do','80','1','menu-icon fa fa-leaf black','1',1),
	(83,'调动审核','mobilize/auditList.do','80','2','menu-icon fa fa-leaf black','1',1),
	(84,'员工报表','#','81','1','menu-icon fa fa-leaf black','1',1),
	(85,'薪酬报表','#','81','2','menu-icon fa fa-leaf black','1',1),
	(86,'上传头像截图工具','tool/goJcropPortrait.do','9','9','menu-icon fa fa-users brown','1',1),
	(87,'薪资类型管理','stipendtype/list.do','75','5','menu-icon fa fa-leaf black','1',1),
	(88,'考试管理','#','0','3','menu-icon fa fa-leaf black','2',1),
	(89,'试卷类别管理','subjecttype/list.do','88','1','menu-icon fa fa-leaf black','1',1),
	(90,'职位类别管理','job_type/list.do','66','9','menu-icon fa fa-leaf black','1',1),
	(91,'薪酬类别管理','stipendtype/list.do','75','3','menu-icon fa fa-leaf black','1',1),
	(92,'薪酬发放审核','grantidmanager/list.do','75','2','menu-icon fa fa-leaf black','1',1);

/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL COMMENT '角色id',
  `ROLE_NAME` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `RIGHTS` varchar(255) DEFAULT NULL COMMENT '权限',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '父级id',
  `ADD_QX` varchar(255) DEFAULT NULL COMMENT '新增权限',
  `DEL_QX` varchar(255) DEFAULT NULL COMMENT '删除权限',
  `EDIT_QX` varchar(255) DEFAULT NULL COMMENT '编辑权限',
  `CHA_QX` varchar(255) DEFAULT NULL COMMENT '查看权限',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`ROLE_ID`, `ROLE_NAME`, `RIGHTS`, `PARENT_ID`, `ADD_QX`, `DEL_QX`, `EDIT_QX`, `CHA_QX`)
VALUES
	('1','系统管理组','9902613619917768276318347206','0','1','1','1','1'),
	('115b386ff04f4352b060dffcd2b5d1da','中级会员','498','2','0','0','0','0'),
	('1b67fc82ce89457a8347ae53e43a347e','初级会员','498','2','0','0','0','0'),
	('2','会员组','498','0','0','0','0','1'),
	('3264c8e83d0248bb9e3ea6195b4c0216','一级管理员','9902613619917768276318347206','1','77371307797249640548523974','55341921069948723142','55340795170041880518','77371308355703690923859910'),
	('46294b31a71c4600801724a6eb06bb26','职位组','77371235737982146963308544','0','0','0','0','0'),
	('5466347ac07044cb8d82990ec7f3a90e','主管','77371235737982146963308544','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),
	('68f8e4a39efe47c7bb869e9d15ab925d','二级管理员','9902613619917768276318347206','1','0','0','2251798773489606','0'),
	('856849f422774ad390a4e564054d8cc8','经理','77371235737982146963308544','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),
	('8b70a7e67f2841e7aaba8a4d92e5ff6f','高级会员','498','2','0','0','0','0'),
	('ab76c87c943b4551842a33f2f69be277','普通员工','9902613619917768276318347206','1','0','0','0','0'),
	('acf2091bd2014d72824fea2b6898bcda','招聘专员','9902613619917768276318347206','1','10329004437600757450516352056119949495867338143311706149050930444560797425658268552155527979418894886790305323818340581568','37762214501140362428416','37762214501140362428416','10329004437600757451636224961205865210992038556772291071801397097086346651829768185504906441018596397640825515064829149376'),
	('c21cecf84048434b93383182b1d98cba','组长','77371235737982146963308544','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),
	('c2ae457987fd4704bef5f630583aa6ad','人力资源系统管理员','9902613619917768276318347206','1','77371251896080604112904134','77371242664827267910229766','77371242664827267910229766','77371242664827267910229766'),
	('d449195cd8e7491080688c58e11452eb','总监','77371235737982146963308544','46294b31a71c4600801724a6eb06bb26','0','0','0','0'),
	('de9de2f006e145a29d52dfadda295353','三级管理员','9902613619917768276318347206','1','0','0','0','0'),
	('f66cc8ea8acd44bdb8df001e253b5d2c','薪酬绩效总监','9902613619917768276318347206','1','77333475252855566929756160','1208853762020591246770176','1171148617133928923267072','61655144742752049982078976'),
	('f924d00914c54810922c31b62612dc57','应聘面试人员','9902613619917768276318347206','1','368934881474191032320','0','368934881474191032320','221360928884514619392');

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_lxcbutton
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_lxcbutton`;

CREATE TABLE `sys_role_lxcbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL COMMENT '角色id',
  `BUTTON_ID` varchar(100) DEFAULT NULL COMMENT '按钮id',
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_lxcbutton` (`LXCBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='按钮 角色中间表';

LOCK TABLES `sys_role_lxcbutton` WRITE;
/*!40000 ALTER TABLE `sys_role_lxcbutton` DISABLE KEYS */;

INSERT INTO `sys_role_lxcbutton` (`RB_ID`, `ROLE_ID`, `BUTTON_ID`)
VALUES
	('0a48a3ea60ef49fa85cadedfc16924d8','f66cc8ea8acd44bdb8df001e253b5d2c','3542adfbda73410c976e185ffe50ad06'),
	('0a7e6563493f4a88af1851117dbfb369','5466347ac07044cb8d82990ec7f3a90e','da7fd386de0b49ce809984f5919022b8'),
	('0c883cae19cf4a35a163f376e21d5094','c2ae457987fd4704bef5f630583aa6ad','da7fd386de0b49ce809984f5919022b8'),
	('0c9f6bedaab14cd98c43a9b8e34a012b','3264c8e83d0248bb9e3ea6195b4c0216','6c63f4c03cb845099850a0c703e66cb2'),
	('0cb658060a124f1eb2f57844a39a5a7e','5466347ac07044cb8d82990ec7f3a90e','46992ea280ba4b72b29dedb0d4bc0106'),
	('0da3d27b2f474fbd9ed87b3a1f073cb0','856849f422774ad390a4e564054d8cc8','3542adfbda73410c976e185ffe50ad06'),
	('0fe04126bbc24deb8c51149ce26cbc3d','c21cecf84048434b93383182b1d98cba','cc51b694d5344d28a9aa13c84b7166cd'),
	('14b5c28ea6ae4508b57d2d272ab3d5f1','3264c8e83d0248bb9e3ea6195b4c0216','46992ea280ba4b72b29dedb0d4bc0106'),
	('15817ede689a4fdcaa419c680c500bda','856849f422774ad390a4e564054d8cc8','cc51b694d5344d28a9aa13c84b7166cd'),
	('1743733f366240c693c4295b527d1b0e','de9de2f006e145a29d52dfadda295353','4efa162fce8340f0bd2dcd3b11d327ec'),
	('17f10a3b7736460d8af9d431ea10b366','f66cc8ea8acd44bdb8df001e253b5d2c','da7fd386de0b49ce809984f5919022b8'),
	('1c1d266a14ea4723bf9c56a10e21f115','5466347ac07044cb8d82990ec7f3a90e','cc51b694d5344d28a9aa13c84b7166cd'),
	('2186211b5ac3428fa3a6785773d05cee','f66cc8ea8acd44bdb8df001e253b5d2c','4efa162fce8340f0bd2dcd3b11d327ec'),
	('26353f41b3d44417a36f37c74eb302a4','ab76c87c943b4551842a33f2f69be277','da7fd386de0b49ce809984f5919022b8'),
	('311868de77464488a447ebd2ac2142c5','1b67fc82ce89457a8347ae53e43a347e','6c63f4c03cb845099850a0c703e66cb2'),
	('351d541f1b6a4b58a42d925bb0c720a8','1b67fc82ce89457a8347ae53e43a347e','fca15154923149a3a8f82e5ad6525f77'),
	('35ff27091efe4010a2e648fb2cbac5c8','c2ae457987fd4704bef5f630583aa6ad','239f3c95ea2f4acf9b622b3a27d4a826'),
	('3768e60edd1c4b5c9f1dd861188ae2f9','3264c8e83d0248bb9e3ea6195b4c0216','cc51b694d5344d28a9aa13c84b7166cd'),
	('3855bc11012449728a48484fadd8fb20','ab76c87c943b4551842a33f2f69be277','da7fd386de0b49ce809984f5919022b8'),
	('3933e281267f4e49b33dc993a352d23a','d449195cd8e7491080688c58e11452eb','46992ea280ba4b72b29dedb0d4bc0106'),
	('3c004ab1fe394a749b183bd7e1385f56','acf2091bd2014d72824fea2b6898bcda','da7fd386de0b49ce809984f5919022b8'),
	('449ced6e93834606879ed9a4762b90ab','c2ae457987fd4704bef5f630583aa6ad','46992ea280ba4b72b29dedb0d4bc0106'),
	('46fddef71b7846d79b98647db3f62d27','c2ae457987fd4704bef5f630583aa6ad','3542adfbda73410c976e185ffe50ad06'),
	('490dfd85658c4f82bbd450ae40dc95ed','f924d00914c54810922c31b62612dc57','fca15154923149a3a8f82e5ad6525f77'),
	('501248ca8b6246b19b465bdea2b24ab4','acf2091bd2014d72824fea2b6898bcda','46992ea280ba4b72b29dedb0d4bc0106'),
	('52a4d63651a64793860b1cc64a9f96bd','d449195cd8e7491080688c58e11452eb','cc51b694d5344d28a9aa13c84b7166cd'),
	('52cfb2663a5d4d37990e798ffc69ca7f','acf2091bd2014d72824fea2b6898bcda','4efa162fce8340f0bd2dcd3b11d327ec'),
	('54f020baed5e42c4813977822840c7f6','5466347ac07044cb8d82990ec7f3a90e','3542adfbda73410c976e185ffe50ad06'),
	('59a58f5edf6d4cc68f22a90feee8f169','ab76c87c943b4551842a33f2f69be277','46992ea280ba4b72b29dedb0d4bc0106'),
	('5d0d81098f3047c9b1c39d13d7f614d3','c2ae457987fd4704bef5f630583aa6ad','3542adfbda73410c976e185ffe50ad06'),
	('7345419394c34bd1acf47e46945cde19','acf2091bd2014d72824fea2b6898bcda','3542adfbda73410c976e185ffe50ad06'),
	('786852b9d2a7429e9dd6f5440a63ae07','f66cc8ea8acd44bdb8df001e253b5d2c','da7fd386de0b49ce809984f5919022b8'),
	('80e9702770a54f56b66b92f2f493b23f','856849f422774ad390a4e564054d8cc8','da7fd386de0b49ce809984f5919022b8'),
	('8231c216fb514b4188e4162e629c6237','3264c8e83d0248bb9e3ea6195b4c0216','4efa162fce8340f0bd2dcd3b11d327ec'),
	('828aa3f3ba64435fb35cdcd33629e929','f66cc8ea8acd44bdb8df001e253b5d2c','46992ea280ba4b72b29dedb0d4bc0106'),
	('8d3a6dbfb874420691950e6491af60fe','5466347ac07044cb8d82990ec7f3a90e','4efa162fce8340f0bd2dcd3b11d327ec'),
	('8ec1968874064c64b2f8ee2878b0ec9c','d449195cd8e7491080688c58e11452eb','da7fd386de0b49ce809984f5919022b8'),
	('909c6b7b90834453ab88ebb8296cddfd','ab76c87c943b4551842a33f2f69be277','4efa162fce8340f0bd2dcd3b11d327ec'),
	('9412d1d05162464c83658c7f89ab03f0','68f8e4a39efe47c7bb869e9d15ab925d','3542adfbda73410c976e185ffe50ad06'),
	('946a193cde034882a4fefe6c0431b8a2','de9de2f006e145a29d52dfadda295353','3542adfbda73410c976e185ffe50ad06'),
	('96567633dd3548c9b75d28f430adf5a3','3264c8e83d0248bb9e3ea6195b4c0216','da7fd386de0b49ce809984f5919022b8'),
	('a0020e0185154b51af48d9dd83b06612','ab76c87c943b4551842a33f2f69be277','46992ea280ba4b72b29dedb0d4bc0106'),
	('a34cd03699b54db1b2505b496e1c5100','f66cc8ea8acd44bdb8df001e253b5d2c','cc51b694d5344d28a9aa13c84b7166cd'),
	('abf49a18f01f4e4a8c32ed16b284c343','ab76c87c943b4551842a33f2f69be277','3542adfbda73410c976e185ffe50ad06'),
	('ada95a97025b4a82a19f694d36243abd','c2ae457987fd4704bef5f630583aa6ad','cc51b694d5344d28a9aa13c84b7166cd'),
	('b392ac80f9194f47ad7e642d2d2788cf','3264c8e83d0248bb9e3ea6195b4c0216','3542adfbda73410c976e185ffe50ad06'),
	('b58accc5368341478e1ad3379aa6db4d','ab76c87c943b4551842a33f2f69be277','4efa162fce8340f0bd2dcd3b11d327ec'),
	('b6548f1993d9465fa717daae43e83954','acf2091bd2014d72824fea2b6898bcda','cc51b694d5344d28a9aa13c84b7166cd'),
	('ba3d44a087dd4d728ea4284fe9c34ea7','acf2091bd2014d72824fea2b6898bcda','46992ea280ba4b72b29dedb0d4bc0106'),
	('ba6696b8761044618e44c7e02c9ba89e','68f8e4a39efe47c7bb869e9d15ab925d','cc51b694d5344d28a9aa13c84b7166cd'),
	('bf3d22712f8143ae9c8ff51c36d5e432','f66cc8ea8acd44bdb8df001e253b5d2c','4efa162fce8340f0bd2dcd3b11d327ec'),
	('bf904799e325417fa0bf5cbf0226ba3e','ab76c87c943b4551842a33f2f69be277','3542adfbda73410c976e185ffe50ad06'),
	('c1cade21046043ee9d5dc51f282391f3','3264c8e83d0248bb9e3ea6195b4c0216','282ac5b115474b23a326fd82fcdc62a1'),
	('c8d171794a2a42e1b9d2658628a25966','d449195cd8e7491080688c58e11452eb','4efa162fce8340f0bd2dcd3b11d327ec'),
	('cd5dbc5565b849a886e5b4844abca5e4','c2ae457987fd4704bef5f630583aa6ad','4efa162fce8340f0bd2dcd3b11d327ec'),
	('d92d43d6f16f4b9c8591d5ad246398f1','acf2091bd2014d72824fea2b6898bcda','3542adfbda73410c976e185ffe50ad06'),
	('d949172d999c467c818289b1f9ecacf7','856849f422774ad390a4e564054d8cc8','4efa162fce8340f0bd2dcd3b11d327ec'),
	('d952ae96d14a42e0944c812ceff4c44c','d449195cd8e7491080688c58e11452eb','3542adfbda73410c976e185ffe50ad06'),
	('dcc3ac4da04e409bade5a6998117823f','acf2091bd2014d72824fea2b6898bcda','da7fd386de0b49ce809984f5919022b8'),
	('dfe1251be31a4bd392ba90b3ac66f787','c21cecf84048434b93383182b1d98cba','da7fd386de0b49ce809984f5919022b8'),
	('e5909f66361247f6872446ec30e511f7','f66cc8ea8acd44bdb8df001e253b5d2c','282ac5b115474b23a326fd82fcdc62a1'),
	('e96b574d0f8042d497b6aa9bbc3c9444','f66cc8ea8acd44bdb8df001e253b5d2c','cc51b694d5344d28a9aa13c84b7166cd'),
	('eb1e3353f7ca4685a3d02a8f57fd9f7d','c21cecf84048434b93383182b1d98cba','46992ea280ba4b72b29dedb0d4bc0106'),
	('f0329033d0914faf8ea6e9ff252cc5e6','68f8e4a39efe47c7bb869e9d15ab925d','46992ea280ba4b72b29dedb0d4bc0106'),
	('f0973eb23a45485480a679302162710a','f924d00914c54810922c31b62612dc57','6c63f4c03cb845099850a0c703e66cb2'),
	('f25e0ae451da46eaa20c1d93849db183','acf2091bd2014d72824fea2b6898bcda','4efa162fce8340f0bd2dcd3b11d327ec'),
	('f4263acc20e940e797d6eac7b45015a8','acf2091bd2014d72824fea2b6898bcda','cc51b694d5344d28a9aa13c84b7166cd'),
	('f627982cc9d4479dbc03af726dc6ac58','de9de2f006e145a29d52dfadda295353','cc51b694d5344d28a9aa13c84b7166cd'),
	('f84e96fe5386464aaff6ce928b93f21c','3264c8e83d0248bb9e3ea6195b4c0216','fca15154923149a3a8f82e5ad6525f77'),
	('fce0826f5cbf4f66b1f8d65f6d5bbdce','856849f422774ad390a4e564054d8cc8','46992ea280ba4b72b29dedb0d4bc0106');

/*!40000 ALTER TABLE `sys_role_lxcbutton` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL COMMENT '用户id',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT '用户账号',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `NAME` varchar(255) DEFAULT NULL COMMENT '姓名',
  `RIGHTS` varchar(255) DEFAULT NULL COMMENT '权限',
  `ROLE_ID` varchar(100) DEFAULT NULL COMMENT '角色id',
  `LAST_LOGIN` varchar(255) DEFAULT NULL COMMENT '最后登录时间',
  `IP` varchar(100) DEFAULT NULL COMMENT 'ip地址',
  `STATUS` varchar(32) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `SKIN` varchar(100) DEFAULT NULL COMMENT '皮肤风格',
  `EMAIL` varchar(32) DEFAULT NULL COMMENT '电子邮箱',
  `NUMBER` varchar(100) DEFAULT NULL COMMENT '号码',
  `PHONE` varchar(32) DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台用户表';

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`USER_ID`, `USERNAME`, `PASSWORD`, `NAME`, `RIGHTS`, `ROLE_ID`, `LAST_LOGIN`, `IP`, `STATUS`, `BZ`, `SKIN`, `EMAIL`, `NUMBER`, `PHONE`)
VALUES
	('1','admin','de41b7fb99201d8334c23c014db35ecd92df81bc','lxc','1133671055321055258374707980945218933803269864762743594642571294','1','2018-03-24 13:36:08','0:0:0:0:0:0:0:1','0','admin','default','QQ1094921525@main.com','001','18101298728'),
	('1e17c5d17bce41d6b69178177ab5742c','liuxi','c9da4bc902c09bbbda3bd43eb3dbda3ec417c575','刘熙','','f924d00914c54810922c31b62612dc57','2018-03-11 13:53:35','0:0:0:0:0:0:0:1','0','面试人','default','1094921525@qq.com','1002','18911780490'),
	('69177258a06e4927b4639ab1684c3320','san','577bdf3a59d0972ad918a38b30688440425717cc','三','','3264c8e83d0248bb9e3ea6195b4c0216','2018-01-27 13:49:14','127.0.0.1','0','111','default','978336446@qq.com','333','13562202556'),
	('9991f4d7782a4ccfb8a65bd96ea7aafa','lisi','434588cee83dca5aaa683852319c54c22f1b41ab','李四','','3264c8e83d0248bb9e3ea6195b4c0216','2018-01-27 13:49:34','127.0.0.1','0','小李','default','313596790@qq.com','1102','13566233663'),
	('b920e29ae2264f40a6a9530036c732fd','hr','861d10246b852f459de5d6e853db324ec270f270','HR','','c2ae457987fd4704bef5f630583aa6ad','2018-02-09 09:43:00','0:0:0:0:0:0:0:1','0','人力资源管理员','default','1281290121@qq.com','1001','18911780490'),
	('e29149962e944589bb7da23ad18ddeed','zhangsan','f1665429dbb3e6c2af7a461a4f547b82ee9ab233','张三','','3264c8e83d0248bb9e3ea6195b4c0216','2018-01-27 13:51:10','127.0.0.1','0','小张','default','zhangsan@www.com','1101','18918192891');

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_answer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_answer`;

CREATE TABLE `tb_answer` (
  `ANSWER_ID` varchar(100) NOT NULL,
  `SUBJECT_ID` varchar(32) DEFAULT NULL COMMENT '试题ID,引用试题表',
  `JOB_MESSAGE_ID` varchar(32) DEFAULT NULL COMMENT '应聘职位ID,引用职位表',
  `SELECT_KEY` varchar(255) DEFAULT NULL COMMENT '选择的答案',
  `RESUME_ID` varchar(255) DEFAULT NULL COMMENT '简历Id',
  `EXAM_TIME` varchar(32) DEFAULT NULL COMMENT '考试时间',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(255) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`ANSWER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tb_attached
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_attached`;

CREATE TABLE `tb_attached` (
  `ATTACHED_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `FDESCRIBE` varchar(255) DEFAULT NULL COMMENT '描述',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '薪酬',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ATTACHED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主附结构接口';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='明细表';

LOCK TABLES `tb_attachedmx` WRITE;
/*!40000 ALTER TABLE `tb_attachedmx` DISABLE KEYS */;

INSERT INTO `tb_attachedmx` (`ATTACHEDMX_ID`, `NAME`, `TITLE`, `CTIME`, `PRICE`, `ATTACHED_ID`)
VALUES
	('04717d1a034c4e51aacd5e062a4c63bd','ddd','ddd','2016-03-29',111.00,'d74b6f507e784607b8f85e31e3cfad22'),
	('f7ac797407be4a76a7125d41fe345112','rgt','gdf','2016-03-30',3423.00,'d74b6f507e784607b8f85e31e3cfad22');

/*!40000 ALTER TABLE `tb_attachedmx` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_grantidmanager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_grantidmanager`;

CREATE TABLE `tb_grantidmanager` (
  `GRANTIDMANAGER_ID` varchar(100) NOT NULL,
  `TEMLOYEE_ID` varchar(32) DEFAULT NULL COMMENT '员工id',
  `GRANT_PRICE` varchar(255) DEFAULT NULL COMMENT '薪酬总额',
  `GRANT_TIME` varchar(32) DEFAULT NULL COMMENT '发放时间',
  `GRANT_USER` varchar(255) DEFAULT NULL COMMENT '发放人',
  `GRANT_STATUS` int(11) NOT NULL COMMENT '审核状态',
  `CREATE_USER` varchar(255) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_USER` varchar(255) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME` varchar(32) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`GRANTIDMANAGER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_grantidmanager` WRITE;
/*!40000 ALTER TABLE `tb_grantidmanager` DISABLE KEYS */;

INSERT INTO `tb_grantidmanager` (`GRANTIDMANAGER_ID`, `TEMLOYEE_ID`, `GRANT_PRICE`, `GRANT_TIME`, `GRANT_USER`, `GRANT_STATUS`, `CREATE_USER`, `CREATE_TIME`, `UPDATE_USER`, `UPDATE_TIME`)
VALUES
	('0c657b7624994456a319d455da19786a','a5032a6ec23a40798448db57e8a5732b','2951','2018-03-23','admin',1,NULL,'2018-03-23 16:58:40','admin','2018-03-23 17:35:32'),
	('37a5b833ea674611953b96e038689950','f1c558ce3db2423e8e5dd1566839fe28','1000','2018-03-21','1212',1,'admin','2018-03-21 23:55:55','admin','2018-03-21 23:55:55');

/*!40000 ALTER TABLE `tb_grantidmanager` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_interviewinfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_interviewinfo`;

CREATE TABLE `tb_interviewinfo` (
  `INTERVIEWINFO_ID` varchar(100) NOT NULL,
  `RESUME_ID` int(11) DEFAULT NULL COMMENT '简历id',
  `EMPLOYEE_STATE` int(11) DEFAULT NULL COMMENT '录用状态',
  `EMPLOYEE_TIME` varchar(32) DEFAULT NULL COMMENT '录用时间',
  `RESUME_USER_ID` varchar(32) DEFAULT NULL COMMENT '招聘人id',
  `RESUME_USER_NAME` varchar(20) DEFAULT NULL COMMENT '招聘人姓名',
  PRIMARY KEY (`INTERVIEWINFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='面试信息表';

LOCK TABLES `tb_interviewinfo` WRITE;
/*!40000 ALTER TABLE `tb_interviewinfo` DISABLE KEYS */;

INSERT INTO `tb_interviewinfo` (`INTERVIEWINFO_ID`, `RESUME_ID`, `EMPLOYEE_STATE`, `EMPLOYEE_TIME`, `RESUME_USER_ID`, `RESUME_USER_NAME`)
VALUES
	('1410e683c5c04b22b621c2dcddc772e6',0,1,'2018-03-19','111','112121'),
	('86353a5309584808a1ffa45d8f5157b5',0,0,'2018-03-21','1','admin');

/*!40000 ALTER TABLE `tb_interviewinfo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_issuejob
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_issuejob`;

CREATE TABLE `tb_issuejob` (
  `ISSUEJOB_ID` varchar(100) NOT NULL,
  `JOB_MESSAGE_ID` int(11) DEFAULT NULL COMMENT '工作职位ID',
  `COUNTS` int(11) DEFAULT NULL COMMENT '招聘人数',
  `PRINCIPAL` varchar(50) DEFAULT NULL COMMENT '招聘人',
  `FOUNDTIME` varchar(32) DEFAULT NULL COMMENT '招聘时间',
  PRIMARY KEY (`ISSUEJOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职位发布表';

LOCK TABLES `tb_issuejob` WRITE;
/*!40000 ALTER TABLE `tb_issuejob` DISABLE KEYS */;

INSERT INTO `tb_issuejob` (`ISSUEJOB_ID`, `JOB_MESSAGE_ID`, `COUNTS`, `PRINCIPAL`, `FOUNDTIME`)
VALUES
	('9e35cc300499494d958ac95c877bdb0f',4,2,'admin','2018-03-22'),
	('adad2a68782d4b25b901bd4b7dd4deba',3,5,'admin','2018-03-22'),
	('b427d89f3e8b4555affeb413756cc9cc',1,10,'0','2018-03-11'),
	('c895022ba7e647a78087cef57dc1b701',2,10,'admin','2018-03-11');

/*!40000 ALTER TABLE `tb_issuejob` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_job_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_job_message`;

CREATE TABLE `tb_job_message` (
  `JOB_MESSAGE_ID` varchar(100) NOT NULL,
  `JOB_TYPE_ID` varchar(50) NOT NULL COMMENT '工作类型id',
  `JOB_NAME` varchar(255) DEFAULT NULL COMMENT '工作名称',
  `STIPENDTYPE_ID` varchar(255) DEFAULT NULL COMMENT '薪酬标准id',
  PRIMARY KEY (`JOB_MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作职位表';

LOCK TABLES `tb_job_message` WRITE;
/*!40000 ALTER TABLE `tb_job_message` DISABLE KEYS */;

INSERT INTO `tb_job_message` (`JOB_MESSAGE_ID`, `JOB_TYPE_ID`, `JOB_NAME`, `STIPENDTYPE_ID`)
VALUES
	('1','1001','测试工程师','984c679af12f404ba7b2433e525fbe50'),
	('2','1001','软件工程师','984c679af12f404ba7b2433e525fbe50'),
	('3','1001','产品经理','984c679af12f404ba7b2433e525fbe50'),
	('4','1002','项目经理','1005'),
	('5','1002','行政总监','1004'),
	('6','1001','ISO工程师','984c679af12f404ba7b2433e525fbe50'),
	('7','1001','安卓工程师','984c679af12f404ba7b2433e525fbe50');

/*!40000 ALTER TABLE `tb_job_message` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_job_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_job_type`;

CREATE TABLE `tb_job_type` (
  `JOB_TYPE_ID` varchar(50) NOT NULL,
  `TYPE_NAME` varchar(50) NOT NULL COMMENT '职位类型名称',
  `selet_id` varchar(50) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`JOB_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='职位类别表';

LOCK TABLES `tb_job_type` WRITE;
/*!40000 ALTER TABLE `tb_job_type` DISABLE KEYS */;

INSERT INTO `tb_job_type` (`JOB_TYPE_ID`, `TYPE_NAME`, `selet_id`)
VALUES
	('1001','研发类','1'),
	('1002','管理类','1'),
	('1003','销售类','1'),
	('1004','招聘类','1');

/*!40000 ALTER TABLE `tb_job_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_mobilize
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_mobilize`;

CREATE TABLE `tb_mobilize` (
  `MOBILIZE_ID` varchar(100) NOT NULL,
  `EMP_ID` varchar(32) DEFAULT NULL COMMENT '审核人编号',
  `EMP_NAME` varchar(20) DEFAULT NULL COMMENT '审核人名称',
  `JOB_ID` varchar(20) DEFAULT NULL COMMENT '工作职位编码',
  `JOB_TYPE_ID` varchar(20) DEFAULT NULL COMMENT '工作职位类别编码',
  `CAUSE` varchar(255) DEFAULT NULL COMMENT '调动原因',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '审核状态 0 未审核 1 通过 2  拒绝',
  `STAFF_ID` varchar(50) DEFAULT NULL COMMENT '被调动人的id',
  PRIMARY KEY (`MOBILIZE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调动管理表';

LOCK TABLES `tb_mobilize` WRITE;
/*!40000 ALTER TABLE `tb_mobilize` DISABLE KEYS */;

INSERT INTO `tb_mobilize` (`MOBILIZE_ID`, `EMP_ID`, `EMP_NAME`, `JOB_ID`, `JOB_TYPE_ID`, `CAUSE`, `STATUS`, `STAFF_ID`)
VALUES
	('12a2293fdef64e86a00acc05ee2a53ee','1','admin','2','1001','1212','1','101'),
	('1b4779a8258446d4a5b89d7c106a36d0','1','admin','2','1001','表现好','1','1002'),
	('276111b2e3e340e58f8e09c460b3eade','','张三','2','1001','12121','2','11'),
	('653ca9ee7c124578869ce4f1551a9b13','1','admin','2','1001','qwqwq','2','101'),
	('abd545aeda704322a2f3502d7f968600','1','admin','5','1002','哈哈测试','1','1002'),
	('ebff4dacd56f423b9de87079076a1a1b','1','admin','2','1002','dsdsds','2','101');

/*!40000 ALTER TABLE `tb_mobilize` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_papertypemanage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_papertypemanage`;

CREATE TABLE `tb_papertypemanage` (
  `PAPERTYPEMANAGE_ID` varchar(100) NOT NULL,
  `PAPER_TYPE_ID` int(11) DEFAULT NULL COMMENT '试卷分类id',
  `PAPER_NAME` varchar(255) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`PAPERTYPEMANAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题库类型表';



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片管理表';

LOCK TABLES `tb_pictures` WRITE;
/*!40000 ALTER TABLE `tb_pictures` DISABLE KEYS */;

INSERT INTO `tb_pictures` (`PICTURES_ID`, `TITLE`, `NAME`, `PATH`, `CREATETIME`, `MASTER_ID`, `BZ`)
VALUES
	('0c0c82eca0da4ec1ab0fe6e20258798d','图片','5cd6aa624cfa402e9a8258c7c8d9728b.jpeg','20180310/5cd6aa624cfa402e9a8258c7c8d9728b.jpeg','2018-01-14 17:24:32','1','图片管理处上传'),
	('10928e45842c476881a931b66974942a','图片','8fdf2fa6de034426b03ae0efd6bf7ae7.jpeg','20180114/8fdf2fa6de034426b03ae0efd6bf7ae7.jpeg','2018-01-14 17:24:33','1','图片管理处上传'),
	('6864b83430bd4a5b96186a630678c269','图片','db30eab3b7354ba78c3988774f0fee33.jpeg','20180114/db30eab3b7354ba78c3988774f0fee33.jpeg','2018-01-14 17:24:32','1','图片管理处上传'),
	('69efb1526b1e48459fbdb1f5efd09cc7','图片','a56f3b473a1a42459bf64dfd9c4b2d2d.jpeg','20180114/a56f3b473a1a42459bf64dfd9c4b2d2d.jpeg','2018-01-14 17:24:32','1','图片管理处上传'),
	('785e4f3118ea4cefb68c628eaafaeb83','图片','282efe0ffedd4363a4189c4eae8ca387.jpeg','20180114/282efe0ffedd4363a4189c4eae8ca387.jpeg','2018-01-14 17:24:32','1','图片管理处上传'),
	('7e36027440fc468f89f332b20fc76a47','图片','a4abfca27f874026ae8ada2e8240c2b4.jpeg','20180114/a4abfca27f874026ae8ada2e8240c2b4.jpeg','2018-01-14 17:24:32','1','图片管理处上传'),
	('82a794b75b2f4863b8bbae65f068e7e2','图片','0218761f21c14737b4d54e2d7c833502.jpeg','20180114/0218761f21c14737b4d54e2d7c833502.jpeg','2018-01-14 17:24:32','1','图片管理处上传'),
	('8c3cae8d260d405fbad5163d53ca7394','图片','0aa91efb080b415d967d04d74ea86f08.jpeg','20180114/0aa91efb080b415d967d04d74ea86f08.jpeg','2018-01-14 17:24:33','1','图片管理处上传'),
	('8c732f262f8b4a44921e7578ecb91c39','图片','83d14225c60249b09b16d2adc18d4f67.jpeg','20180114/83d14225c60249b09b16d2adc18d4f67.jpeg','2018-01-14 17:24:31','1','图片管理处上传'),
	('8d522630ef0841ceaf50dfb3cb91a7fb','图片','49c12b046b684b9c8876e68bcfc02a74.jpg','20180310/49c12b046b684b9c8876e68bcfc02a74.jpg','2018-03-10 00:49:11','1','图片管理处上传'),
	('9cbadf551b2f41deb909511d4e5ebd31','图片','348434c2117e47668e2f137e1ceea4a3.jpeg','20180114/348434c2117e47668e2f137e1ceea4a3.jpeg','2018-01-14 17:24:33','1','图片管理处上传'),
	('b09d264a371e412e94cd0c069825d02d','图片','5b205c612c114010942846b9e575c26c.jpeg','20180114/5b205c612c114010942846b9e575c26c.jpeg','2018-01-14 17:24:32','1','图片管理处上传'),
	('bf4e3b5ea81641538dc8d58ef4a9faf8','图片','554fd5c4ca124062a8574c18627e1c87.jpeg','20180114/554fd5c4ca124062a8574c18627e1c87.jpeg','2018-01-14 17:24:31','1','图片管理处上传'),
	('dffbc4d805204cfea70ae48881fe189e','图片','d05219623f43481386e29f850a8a44b4.jpeg','20180114/d05219623f43481386e29f850a8a44b4.jpeg','2018-01-14 17:24:31','1','图片管理处上传');

/*!40000 ALTER TABLE `tb_pictures` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_resume
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_resume`;

CREATE TABLE `tb_resume` (
  `RESUME_ID` varchar(100) NOT NULL,
  `SEX` int(2) DEFAULT NULL COMMENT '性别',
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
  `RESUME` text COMMENT '个人简历',
  `DESCRIBES` text COMMENT '个人描述',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `USER_ID` varchar(32) DEFAULT NULL COMMENT '登录账号id',
  `AGE` int(11) DEFAULT NULL COMMENT '年龄',
  `TIME` varchar(32) DEFAULT NULL COMMENT '时间',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` varchar(255) DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` varchar(255) DEFAULT NULL COMMENT '修改人',
  `STAFF_NAME` varchar(20) DEFAULT NULL COMMENT '员工姓名',
  `STATUS` int(5) DEFAULT NULL COMMENT '审核状态',
  `USER_NAME` varchar(20) DEFAULT NULL COMMENT '审核人姓名',
  `REASON` varchar(255) DEFAULT NULL COMMENT '推荐理由',
  `RESULT` int(10) DEFAULT NULL COMMENT '面试成绩',
  `SCORE` varchar(255) DEFAULT NULL COMMENT '面试评价',
  `JOB_MESSAGE_ID` varchar(50) DEFAULT NULL COMMENT '工作职位id',
  `JOB_TYPE_ID` varchar(50) DEFAULT NULL COMMENT '工作职位类别id',
  `DEGREE` varchar(10) DEFAULT NULL COMMENT '英语等级',
  PRIMARY KEY (`RESUME_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简历表';

LOCK TABLES `tb_resume` WRITE;
/*!40000 ALTER TABLE `tb_resume` DISABLE KEYS */;

INSERT INTO `tb_resume` (`RESUME_ID`, `SEX`, `ADDRESS`, `PHONE`, `PIC`, `CARD_ID`, `EMAIL`, `QQ`, `WECHAT`, `POST_CODE`, `GOVEMMET`, `NATION`, `LEARING`, `HOBBY`, `SUIT`, `NATIONALITY`, `BIRTH`, `FAITH`, `SPEIALITY`, `RESUME`, `DESCRIBES`, `REMARK`, `USER_ID`, `AGE`, `TIME`, `CREATE_TIME`, `UPDATE_TIME`, `CREATE_USER`, `UPDATE_USER`, `STAFF_NAME`, `STATUS`, `USER_NAME`, `REASON`, `RESULT`, `SCORE`, `JOB_MESSAGE_ID`, `JOB_TYPE_ID`, `DEGREE`)
VALUES
	('a31fc9a04ba14a5c9474571aea318141',1,'浙江钱塘县','18181091112','CRm测试环境账号.txt','360732201803222116','1281921921@qq.com','181291011','xushilin','100086','群众','0','本科','读书','写文章','CN','2018-03-22','佛教','汉语文学','出生之后无父母，有姑父母带大。','简单','1111',NULL,20,'2018-03-22','2018-03-22 08:55:21','2018-03-22 08:55:21','admin','admin','许仕林',0,NULL,'文采出众，见解独到。文曲星下凡',100,'文采出众，见解独到。','1001',NULL,'六级'),
	('a388af209c22499285de1d051e2a46ce',1,'山东青岛','18911780490','CRm测试环境账号.txt','3607322018032211910','1821902102@qq.com','1821902102','jiangchao','10091','群众','0','大学','玩游戏','编程','CN','2018-03-22','无','计算机科学与技术','很简单','很好','无',NULL,28,'2018-03-22','2018-03-22 09:28:37','2018-03-22 09:28:37','admin','admin','姜超',0,NULL,'技术大牛',98,'ok ','2','1001','四级'),
	('b0a739b2700042e483bd686bb6205363',1,'北京市海淀区','18102910911','示例图片_02.jpg','3607321919029101','212111291@qq.com','212111291','huanxiao','10091','群众','0','大学','表演','唱歌','CN','1989-10-12','佛教','演员','11111111','111111111111','111','',12,'2018-01-28','2018-03-21 22:34:07','2018-03-21 22:34:07','admin','admin','黄晓',0,NULL,'111111111111',96,'1111111111','11',NULL,'四级');

/*!40000 ALTER TABLE `tb_resume` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_staffemployee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_staffemployee`;

CREATE TABLE `tb_staffemployee` (
  `STAFFEMPLOYEE_ID` varchar(100) NOT NULL,
  `STAFF_ID` int(11) DEFAULT NULL COMMENT '员工ID',
  `STAFF_NAME` varchar(20) DEFAULT NULL COMMENT '员工姓名',
  `SEX` int(2) DEFAULT NULL COMMENT '性别',
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
  `RESUME` text COMMENT '个人简历',
  `DESCRIBES` text COMMENT '个人描述',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `ISROMVE` int(11) DEFAULT '0' COMMENT '是否删除 0 正常  1 删除 2停职 3 恢复',
  `JOB_ID` varchar(50) DEFAULT NULL COMMENT '工作职位编码',
  `USER_ID` int(11) DEFAULT NULL COMMENT '账户id',
  `JOB_TYPE_ID` varchar(50) DEFAULT NULL COMMENT '工作职位类别编码',
  `AGE` int(11) DEFAULT NULL COMMENT '年龄',
  `ADD_TIME` varchar(32) DEFAULT NULL COMMENT '登记时间',
  `STIPEND_ID` varchar(50) DEFAULT NULL COMMENT '薪资ID',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` varchar(255) DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` varchar(255) DEFAULT NULL COMMENT '修改人',
  `STATES` tinyint(5) DEFAULT '0' COMMENT '状态  0未审核 1通过 2不通过  ',
  PRIMARY KEY (`STAFFEMPLOYEE_ID`),
  UNIQUE KEY `STAFF_ID` (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工档案信息表';

LOCK TABLES `tb_staffemployee` WRITE;
/*!40000 ALTER TABLE `tb_staffemployee` DISABLE KEYS */;

INSERT INTO `tb_staffemployee` (`STAFFEMPLOYEE_ID`, `STAFF_ID`, `STAFF_NAME`, `SEX`, `ADDRESS`, `PHONE`, `PIC`, `CARD_ID`, `EMAIL`, `QQ`, `WECHAT`, `POST_CODE`, `GOVEMMET`, `NATION`, `LEARING`, `HOBBY`, `SUIT`, `NATIONALITY`, `BIRTH`, `FAITH`, `SPEIALITY`, `RESUME`, `DESCRIBES`, `REMARK`, `ISROMVE`, `JOB_ID`, `USER_ID`, `JOB_TYPE_ID`, `AGE`, `ADD_TIME`, `STIPEND_ID`, `CREATE_TIME`, `UPDATE_TIME`, `CREATE_USER`, `UPDATE_USER`, `STATES`)
VALUES
	('3e69e297070e42d7b46628317898013e',11,'张三丰',1,'北京市','111','','128901920121','21212212@qq.com','1901290112','2121','1212','2121','2','硕士','英语','游泳','CN','1992-12-11','佛教','计算机','111','111','11',0,'2',11,'1001',11,'2018-01-25','c3dd94150b594f34b6541f8c205ab130',NULL,NULL,NULL,NULL,1),
	('58d0c83404c447ec94354d044f489897',1002,'古成芳',2,'海南岛','18911780490','','360732199202102113','212819289@qq.com','1094921521','121211214','3424223','党员','5','研究生','旅游','绘画','CN','1992-02-10','佛教','金融','1122222222222222222','11111111111','',0,'2',10002,'1001',26,'2018-01-22','d7b60e8f222c46fb8e2d45caf9fe4542',NULL,NULL,NULL,NULL,1),
	('635f7ef8103742d1b59913922da5aff0',1003,'李潇潇',1,'北京市海淀区','18911780491','','36073220170191291','121211211@qq.com','1910290192','lixiaoxiao','100093','群众','0','本科','睡觉','看电视','CN','2017-01-11','无','无','11212','121212','哈哈',0,'2',101021,'1001',1,'2018-01-23','c3dd94150b594f34b6541f8c205ab130',NULL,NULL,NULL,NULL,1),
	('a5032a6ec23a40798448db57e8a5732b',1004,'李欣欣',2,'黑龙江省哈尔滨市','13641059864','','23012519910701264X','lixinxin852@126.com','931920085','13641059864','100019','党员','0','本科','逛街购物','跳舞','CN','1991-07-01','无','通信工程','外语能力： 六级\r\n东北石油大学','1212','父母联系方式15146409055',0,'2',11111,'1001',27,'2018-02-09','1001',NULL,NULL,NULL,NULL,2),
	('c2cc729ffd684f6896a80cd4d02dfb82',10022052,'李志华',2,'河南周口','15600647138','','41272119901102266X','zhlee007@gmail.com','395986883','leejenney','100019','党员','0','本科','逛街','唱歌','CN','1990-11-02','佛教','软件工程','中原工学院 \r\n软件工程（java方向）\r\n外语能力： cet-4（501）\r\n是否自备电脑：是','是否住宿：是','父母电话 15936913841',0,'2',1001,'1001',28,'2018-02-09','1001',NULL,NULL,NULL,NULL,0),
	('f1c558ce3db2423e8e5dd1566839fe28',101,'刘熙财',1,'北京市海淀区','18101298728','','360732199306202118','12811212921@qq.com','1291290121','liuxicai002','10001','群众','3','本科','编程','书法','CN','10919291','佛教','计算机科学与技术','vvv','212121212','哈哈',0,'2',975,'1001',23,'2018-01-16','d7b60e8f222c46fb8e2d45caf9fe4542',NULL,NULL,NULL,NULL,1);

/*!40000 ALTER TABLE `tb_staffemployee` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_stipendmanager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_stipendmanager`;

CREATE TABLE `tb_stipendmanager` (
  `STIPENDMANAGER_ID` varchar(100) NOT NULL,
  `STIPEND_NAME` varchar(20) DEFAULT NULL COMMENT '薪酬名称',
  `STIPEND_USER_NAME` varchar(20) DEFAULT NULL COMMENT '登记人姓名',
  `STIPEN_WEAL_JOURNEY` int(10) DEFAULT NULL COMMENT '交通补贴',
  `STIPEN_WEAL_LUNCH` int(10) DEFAULT NULL COMMENT '午餐补助',
  `GTIPEND_DATE` varchar(32) DEFAULT NULL COMMENT '登记时间',
  `BASE_STIPEND` int(11) DEFAULT NULL COMMENT '基本薪资',
  `STIPENDTYPE_ID` varchar(50) DEFAULT NULL COMMENT '薪资类型Id',
  `STIPEND_WEAL` int(11) DEFAULT NULL COMMENT '薪酬总额',
  `STATUS` int(5) DEFAULT '1' COMMENT '审批状态 0未审批 2 不通过 1 通过 3删除',
  PRIMARY KEY (`STIPENDMANAGER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='薪酬登记表';

LOCK TABLES `tb_stipendmanager` WRITE;
/*!40000 ALTER TABLE `tb_stipendmanager` DISABLE KEYS */;

INSERT INTO `tb_stipendmanager` (`STIPENDMANAGER_ID`, `STIPEND_NAME`, `STIPEND_USER_NAME`, `STIPEN_WEAL_JOURNEY`, `STIPEN_WEAL_LUNCH`, `GTIPEND_DATE`, `BASE_STIPEND`, `STIPENDTYPE_ID`, `STIPEND_WEAL`, `STATUS`)
VALUES
	('1001','软件工程师薪资','admin',300,650,'2018-03-19 15:14:22',1001,'984c679af12f404ba7b2433e525fbe50',10950,1),
	('c3dd94150b594f34b6541f8c205ab130','IOS软件工程师','admin',300,450,'2018-03-22 19:21:34',14000,'984c679af12f404ba7b2433e525fbe50',14750,1),
	('d7b60e8f222c46fb8e2d45caf9fe4542','测试工程师 ','admin',300,650,'2018-03-19 15:17:10',8000,'984c679af12f404ba7b2433e525fbe50',8950,1);

/*!40000 ALTER TABLE `tb_stipendmanager` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_stipendtype
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_stipendtype`;

CREATE TABLE `tb_stipendtype` (
  `STIPENDTYPE_ID` varchar(100) NOT NULL,
  `STIPENDNAME` varchar(255) DEFAULT NULL COMMENT '薪资类型名称',
  `CREATETIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `ISREMOVE` int(5) NOT NULL COMMENT '是否启用',
  `CREATEUSER` varchar(32) DEFAULT NULL COMMENT '创建人',
  `SALARY_PACKAGE` varchar(255) DEFAULT NULL COMMENT '薪资待遇',
  `SALARY_RANGE` varchar(255) DEFAULT NULL COMMENT '薪资范围',
  PRIMARY KEY (`STIPENDTYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='薪资类型';

LOCK TABLES `tb_stipendtype` WRITE;
/*!40000 ALTER TABLE `tb_stipendtype` DISABLE KEYS */;

INSERT INTO `tb_stipendtype` (`STIPENDTYPE_ID`, `STIPENDNAME`, `CREATETIME`, `ISREMOVE`, `CREATEUSER`, `SALARY_PACKAGE`, `SALARY_RANGE`)
VALUES
	('984c679af12f404ba7b2433e525fbe50','研发中心','2018-03-22 19:06:19',1,'admin','发展空间大,年底双薪,有期权,五险一金','20k-40k');

/*!40000 ALTER TABLE `tb_stipendtype` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_subjectmanage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_subjectmanage`;

CREATE TABLE `tb_subjectmanage` (
  `SUBJECTMANAGE_ID` varchar(100) NOT NULL,
  `SUBJECT_NAME` varchar(255) DEFAULT NULL COMMENT '题目',
  `SUBJECT_TYPE` varchar(32) DEFAULT NULL COMMENT '试卷类型',
  `SELECT_A` varchar(50) DEFAULT NULL COMMENT 'A选项',
  `SELECT_B` varchar(50) DEFAULT NULL COMMENT 'B选项',
  `SELECT_C` varchar(50) DEFAULT NULL COMMENT 'C选项',
  `SELECT_D` varchar(50) DEFAULT NULL COMMENT 'D选项',
  `SELECT_E` varchar(50) DEFAULT NULL COMMENT 'E选项',
  `SELECT_F` varchar(50) DEFAULT NULL COMMENT 'F选项',
  `SELECT_TURE` varchar(5) DEFAULT NULL COMMENT '正确选项',
  `ISSUE_PERSON` varchar(50) DEFAULT NULL COMMENT '发布人',
  `SCORE` int(11) DEFAULT NULL COMMENT '分值',
  `ISSUE_TIME` varchar(32) DEFAULT NULL COMMENT '出题时间',
  PRIMARY KEY (`SUBJECTMANAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题库管理表';

LOCK TABLES `tb_subjectmanage` WRITE;
/*!40000 ALTER TABLE `tb_subjectmanage` DISABLE KEYS */;

INSERT INTO `tb_subjectmanage` (`SUBJECTMANAGE_ID`, `SUBJECT_NAME`, `SUBJECT_TYPE`, `SELECT_A`, `SELECT_B`, `SELECT_C`, `SELECT_D`, `SELECT_E`, `SELECT_F`, `SELECT_TURE`, `ISSUE_PERSON`, `SCORE`, `ISSUE_TIME`)
VALUES
	('189440aca290470fb3b559bac08a528b','H咨询公司有一支强大的管理咨询团队，H公司对这支团队应该采取的薪酬要素策略是\r\n','b63e63f8d8ae4a9b9b21f5dc46e1007e','采用宽带薪酬体系来核算和支付团队成员的基础薪酬','按团队成员的绩效等级分配团队的激励薪酬','按基础薪酬的相对比例支付团队的激励薪酬','不能经常使用加薪，且激励薪酬要以事后奖励为主','其他','以上都是','C','admin',2,'2018-03-24 13:27:45'),
	('1ab23384e7394de7bfc35e115aa93ac2','在岗位评价方法中，相对于要素计点法，排序法与分类法\r\n','b63e63f8d8ae4a9b9b21f5dc46e1007e','客观性强','管理负担轻','组织适应性弱','操作成本高','其他','以上都是','A','admin',2,'2018-03-24 13:20:52'),
	('1b7fd3de5966408199b584f731ab53cc','下列各项中，属于企业间接形式支付给员工的非货币性劳动收入的是','b63e63f8d8ae4a9b9b21f5dc46e1007e','薪金','工薪','红利','保险','其他','以上都是','D','admin',2,'2018-03-24 12:51:32'),
	('28ba97a874484402a6bcc840b5db89c0','下列各项中，不属于内在薪酬的是','b63e63f8d8ae4a9b9b21f5dc46e1007e','工作保障','培训机会','等级晋升','股票分红','其他','以上都是','A','admin',2,'2018-03-24 12:55:28'),
	('298625680fad4f0c870e20da7622d3c0','什么是面向对象？','4a440f987e604b0685f44b123966554f','A','B','C','D','E','F','C','admin',2,'2018-01-27'),
	('2a02c5d7a50446d38f2e115d4aea1b1a','在实施薪酬调查过程中，明确薪酬主体所涉及的决策因素包括\r\n1.选择基准市场\r\n2.选择基准企业\r\n3.选择基准岗位\r\n4.选择基准产品\r\n5.选择基准客户\r\n','b63e63f8d8ae4a9b9b21f5dc46e1007e','1，4，5','1，2，3','3，4，5','2，4，5','2，3，4','1，2，3，4，5','B','admin',2,'2018-03-24 13:23:13'),
	('2beaa2d7e6cf4e15b9c383247a159245','与非量化的岗位评价方法相比，评价过程和结果更容易被员工所感知的定量岗位评价方法是','b63e63f8d8ae4a9b9b21f5dc46e1007e','点数法','比较法','分类法','描述法','其他','以上都是','A','admin',2,'2018-03-24 13:19:47'),
	('38737c9b7b7f4047b4e5606e0afd0530','下列各项中属于高层管理人员的薪酬要素组合中的递延薪酬的是','b63e63f8d8ae4a9b9b21f5dc46e1007e','短期激励薪酬','激励股权计划','特定的职务消费','专有的补充福利','其他','以上都是','C','admin',2,'2018-03-24 13:17:22'),
	('4369f109a7034d499d8a1e852737e113','企业想将战略要点更系统地落实到具体的考核指标上，使战略便于表达和层层分解，实现战略的有效“落地”，可以采取的战略性绩效管理方法是','b63e63f8d8ae4a9b9b21f5dc46e1007e','关键绩效领域','关键绩效指标','平衡计分卡','SMART管理法','其他','以上都是','B','admin',2,'2018-03-24 13:26:18'),
	('48060a8a270f42f0a5cfd8a7b74212b9','下列属于影响薪酬预算的外部因素是','b63e63f8d8ae4a9b9b21f5dc46e1007e','员工队伍调整','薪酬体系现状','企业技术变革','物价水平波动','其他','以上都是','B','admin',2,'2018-03-24 13:30:39'),
	('49aa3ba55069458baafcdd37c4f73fcf','奖金计划不与特定的产量标准或工时标准相联系，可以与任何绩效指标挂钩，甚至与主观工作成效描述或打分对接，这体现的奖金计划的特点是','b63e63f8d8ae4a9b9b21f5dc46e1007e','激励性','适用性','兼容性','灵活性','其他','以上都是','B','admin',2,'2018-03-24 13:24:43'),
	('6886e61adff24089811f9f19b1d42b9e','外在薪酬是薪酬管理的核心领域，下列各项属于外在薪酬中的直接薪酬的是','b63e63f8d8ae4a9b9b21f5dc46e1007e','基础薪酬','服务薪酬','要素薪酬','福利薪酬','其他','以上都是','A','admin',2,'2018-03-24 12:54:09'),
	('6ac1f7b0dd2744138a8221b357eee324','G公司的高层管理人员根据企业当年绩效指标和下一年度预期目标，确定薪酬预算总额和年度加薪标准，再按照一定的比例把它分配给各个部门。G公司所采取的薪酬预算方法是\r\n','b63e63f8d8ae4a9b9b21f5dc46e1007e','自上而下法','自下而上法','微观接近法','分配＋汇总法','其他','以上都是','A','admin',2,'2018-03-24 13:31:19'),
	('7a29b261448e49ef802d3f7ef42b0a2a','主要根据事先确定的类别等级，参考岗位工作内容和工作要求对岗位进行分级定等的岗位评价方法是\r\n','b63e63f8d8ae4a9b9b21f5dc46e1007e','分类法','排序法','构造法','筛选法','其他','以上都是','A','admin',2,'2018-03-24 13:18:19'),
	('823fcf3d07ce4070825e239b89cbb1b2','甲公司是一家刚成立的广告公司，共有20名员工，采用扁平化的组织结构，公司刚成立不久，信息化程度较低，薪酬体系内容单纯。则适用于甲公司的薪酬信息管理基本模式是\r\n','b63e63f8d8ae4a9b9b21f5dc46e1007e','独立功能模式','功能整合模式','资料库模式','系统整合模式','其他','以上都是','B','admin',2,'2018-03-24 13:32:39'),
	('8af3153ea24f400b82f8143c140c6b8e','在绩效考核时，考核者排除眼前信息干扰，自然浮现被考核员工的形象，并依据有关价值标准作出评判的印象评判技术是\r\n','b63e63f8d8ae4a9b9b21f5dc46e1007e','回忆形象评判','第一印象评判','闭目浮现评判','总体印象评判','其他','以上都是','B','admin',2,'2018-03-24 13:25:31'),
	('9d6f5593a1434265ad48e62c9b4f47c9','基于相对科学的岗位评价方法并不能保证岗位评价结果的兼具效率性和公平性，还需要依据企业内外部的战略诉求，对岗位评价方法体系和操作流程进行必要的修正，可以采取的方法是\r\n','b63e63f8d8ae4a9b9b21f5dc46e1007e','用内部公平性修正外部公平性','用内部公平性修正外部竞争性','用岗位战略定价修正岗位市场定价','用外部竞争性修正内部公平性','其他','以上都是','C','admin',2,'2018-03-24 13:21:43'),
	('9df1362ed7ad4e9585b9bcb3a7591306','属于基础薪酬体系，且更关注特定岗位对企业的绩效贡献的薪酬类型是','b63e63f8d8ae4a9b9b21f5dc46e1007e','绩效加薪','绩效加薪','年功序列薪酬','激励薪酬','其他','以上都是','B','admin',2,'2018-03-24 13:23:55'),
	('a1297dbb58744f4d88f41068518ac5e5','下列关于岗位评价的说法中，不正确的是','b63e63f8d8ae4a9b9b21f5dc46e1007e','岗位评价是岗位薪酬体系的核心环节','岗位评价强调把岗位系统化（人-机-环境）','根据岗位评价进行薪酬制度安排符合企业战略导向','岗位评价的有效性是岗位薪酬体系公正性的前提','其他','以上都是','C','admin',2,'2018-03-24 13:16:15'),
	('a5f6fe0fc1de486cac11bbfe4593e655',' J公司通过一些内部的灵活的沟通方式方法，随时监测企业薪酬运行，及时发现薪酬管理中存在的问题。J公司所采取的薪酬运行诊断方式是\r\n','b63e63f8d8ae4a9b9b21f5dc46e1007e','正规诊断','非正规诊断','内部人员诊断','外部专家诊断','其他','以上都是','D','admin',2,'2018-03-24 13:29:52'),
	('cd95e6a64d564066907f3f9d77eb89f8','乙公司上年度共发生的员工基础薪酬总额为100万元，激励薪酬总额30万元，共发放价值70万元的福利薪酬，乙公司共有员工50人，则乙公司上年度发生的薪酬成本总额为','b63e63f8d8ae4a9b9b21f5dc46e1007e','100万元','130万元','200万元','120万元','其他','以上都是','B','admin',2,'2018-03-24 13:31:52'),
	('db08bf749eb5449c92967ae299c39bd3','企业视角下，薪酬的核心功能是','b63e63f8d8ae4a9b9b21f5dc46e1007e','补偿功能','增值功能','激励功能','协调功能','其他','以上都是','C','admin',2,'2018-03-24 12:52:49'),
	('dd803471849f48a1bef0f62f0311f9e3','新经济与传统经济公司的薪酬要素组合相比，新经济公司','b63e63f8d8ae4a9b9b21f5dc46e1007e','基础薪酬更高','激励薪酬更高','福利薪酬更高','要素薪酬更高','其他','以上都是','C','admin',2,'2018-03-24 13:26:59'),
	('eed62fef653f4674b56b1ff9a112bcc2','外派员工薪酬方案的常用确定方式中，适用于短期的外派任务，管理简单但不利于东道国公司的内部公平性管理的定价方式是\r\n','b63e63f8d8ae4a9b9b21f5dc46e1007e','自助餐法','平衡定价法','东道国定价法','母国定价法','其他','以上都是','B','admin',2,'2018-03-24 13:28:23'),
	('f87b671c5c2c463aa97d1bfa5fa9ac73','之所以需要对企业薪酬运行进行系统诊断，主要源自于','b63e63f8d8ae4a9b9b21f5dc46e1007e','薪酬运行中总会出现不可预见的干扰因素','薪酬运行诊断是企业薪酬管理的主要内容','薪酬运行诊断符合企业长期发展战略要求','劳动法要求企业不定期进行薪酬运行诊断','其他','以上都是','C','admin',2,'2018-03-24 13:29:08'),
	('fc13513fc9ae4053bc8e58d3039a18a4','对企业总薪酬中不同薪酬形式组成成分的决策是薪酬管理内容中的','b63e63f8d8ae4a9b9b21f5dc46e1007e','薪酬体系构成管理','薪酬水平设定管理','薪酬等级结构管理','薪酬管理组织管理','其他','以上都是','D','admin',2,'2018-03-24 13:14:31'),
	('fcf694d959ec431b9173bcd642dc1c84','什么是多态？','4a440f987e604b0685f44b123966554f','面向对象语言中，接口的多种不同的实现方式即为多态','b','c','d','e','f','A','admin',2,'2018-03-21 01:16:38');

/*!40000 ALTER TABLE `tb_subjectmanage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_subjecttype
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_subjecttype`;

CREATE TABLE `tb_subjecttype` (
  `SUBJECTTYPE_ID` varchar(100) NOT NULL,
  `SUBJECT_TYPE_NAME` varchar(255) DEFAULT NULL COMMENT '试卷分类名称',
  `IS_REMOVE` int(5) NOT NULL COMMENT '是否删除 0 否 1 是',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `CREATEUSER` varchar(255) DEFAULT NULL COMMENT '创建人',
  `STATUS` int(5) NOT NULL COMMENT '是否启用 0否 1 是',
  PRIMARY KEY (`SUBJECTTYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试卷类别表';

LOCK TABLES `tb_subjecttype` WRITE;
/*!40000 ALTER TABLE `tb_subjecttype` DISABLE KEYS */;

INSERT INTO `tb_subjecttype` (`SUBJECTTYPE_ID`, `SUBJECT_TYPE_NAME`, `IS_REMOVE`, `CREATE_TIME`, `CREATEUSER`, `STATUS`)
VALUES
	('2214bda597544575b44c293d43829734','主观题类',0,'2018-03-24 13:40:02','admin',0),
	('2cd497abe2a24de5a6d1265c4d3450d6','计算机基础类',0,'2018-03-19 21:51:11','admin',1),
	('3023dfc72e564701a771eb476736fb14','销售类',0,'2018-03-24 13:38:58','admin',1),
	('33b4455104f04d23ab4a32a48984a64c','行政管理类',0,'2018-03-19 23:41:33','admin',1),
	('47d96715e81c41ad9dbd7c0673b0cb83','产品类',0,'2018-03-24 13:40:34','admin',0),
	('5b4a9a4a9c7a4ee3b1df315f784b093c','法务类',0,'2018-03-24 13:40:48','admin',0),
	('62f5535f8fe04d0e879f2488b9a23e2b','公共类',0,'2018-03-24 13:40:19','admin',0),
	('80428683a52c448b8ac3f4eae3dc5e2e','综合题类',0,'2018-03-24 13:39:45','admin',1),
	('89de505b39e343f59a48fbdb3aead826','测试类',0,'2018-03-24 13:40:28','admin',0),
	('8d57ba25ef984b418c20e94048e9907d','客观题类',0,'2018-03-24 13:39:54','admin',0),
	('b7d3919b0cea44869ae104240a9ba476','运营类',0,'2018-03-24 13:39:25','admin',1),
	('e5743522dfa3408791f747c0e0319ca0','科研类',0,'2018-03-24 13:40:41','admin',0);

/*!40000 ALTER TABLE `tb_subjecttype` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_subjecttypemx
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_subjecttypemx`;

CREATE TABLE `tb_subjecttypemx` (
  `SUBJECTTYPEMX_ID` varchar(100) NOT NULL,
  `SUBJECTTYPE_ID` varchar(100) NOT NULL COMMENT '试卷分类id',
  `SUBJECTMANAGE` varchar(255) DEFAULT NULL COMMENT '试题类型',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(255) DEFAULT NULL COMMENT '创建人',
  `IS_REMOVE` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 0 否 1 是',
  `STATUS` int(5) NOT NULL DEFAULT '0' COMMENT '是否启用  0否 1 是',
  PRIMARY KEY (`SUBJECTTYPEMX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_subjecttypemx` WRITE;
/*!40000 ALTER TABLE `tb_subjecttypemx` DISABLE KEYS */;

INSERT INTO `tb_subjecttypemx` (`SUBJECTTYPEMX_ID`, `SUBJECTTYPE_ID`, `SUBJECTMANAGE`, `CREATE_TIME`, `CREATE_USER`, `IS_REMOVE`, `STATUS`)
VALUES
	('169f421444304353b90b49e954a207bb','2cd497abe2a24de5a6d1265c4d3450d6','框架类','2018-03-24 13:37:48','admin',0,1),
	('2e733d07a6244fbc9022b32c4433ca92','2cd497abe2a24de5a6d1265c4d3450d6','吹牛类','2018-03-24 13:38:31','admin',0,0),
	('4a440f987e604b0685f44b123966554f','2cd497abe2a24de5a6d1265c4d3450d6','语言类','2018-03-19 23:25:51','admin',0,1),
	('85d391a4940a4ad784d9dce2ca75efb0','2cd497abe2a24de5a6d1265c4d3450d6','数据库类','2018-03-24 13:37:57','admin',0,1),
	('b63e63f8d8ae4a9b9b21f5dc46e1007e','33b4455104f04d23ab4a32a48984a64c','绩效考核类','2018-03-21 00:51:20','admin',0,1),
	('c614b1f8f2a54ec19baee7df3693172b','33b4455104f04d23ab4a32a48984a64c','招聘类','2018-03-21 00:50:45','admin',0,1),
	('d3eeda32937247f4911f3493587ec9b3','33b4455104f04d23ab4a32a48984a64c','财产类','2018-03-21 00:52:25','admin',0,1),
	('ebf626d0920e464a99c23732de0ed106','2cd497abe2a24de5a6d1265c4d3450d6','算法类','2018-03-24 13:37:33','admin',0,1),
	('f6fe2c6a02b54b158e6e2ca11a56cdbf','33b4455104f04d23ab4a32a48984a64c','公关业务','2018-03-21 00:52:59','admin',0,1);

/*!40000 ALTER TABLE `tb_subjecttypemx` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信指令表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信图片表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信文本消息表';

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
