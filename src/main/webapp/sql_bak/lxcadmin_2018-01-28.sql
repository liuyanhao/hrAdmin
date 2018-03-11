-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.27 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 lxcadmin 的数据库结构
DROP DATABASE IF EXISTS `lxcadmin`;
CREATE DATABASE IF NOT EXISTS `lxcadmin` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `lxcadmin`;

-- 导出  表 lxcadmin.db_lxcdb 结构
DROP TABLE IF EXISTS `db_lxcdb`;
CREATE TABLE IF NOT EXISTS `db_lxcdb` (
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

-- 正在导出表  lxcadmin.db_lxcdb 的数据：~0 rows (大约)
DELETE FROM `db_lxcdb`;
/*!40000 ALTER TABLE `db_lxcdb` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_lxcdb` ENABLE KEYS */;

-- 导出  表 lxcadmin.db_timingbackup 结构
DROP TABLE IF EXISTS `db_timingbackup`;
CREATE TABLE IF NOT EXISTS `db_timingbackup` (
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

-- 正在导出表  lxcadmin.db_timingbackup 的数据：~2 rows (大约)
DELETE FROM `db_timingbackup`;
/*!40000 ALTER TABLE `db_timingbackup` DISABLE KEYS */;
INSERT INTO `db_timingbackup` (`TIMINGBACKUP_ID`, `JOBNAME`, `CREATE_TIME`, `TABLENAME`, `STATUS`, `LXCTIME`, `TIMEEXPLAIN`, `BZ`) VALUES
	('311e06c34a5e4518a86d5d30799f9b55', 'sys_app_user_515762', '2016-04-11 17:04:55', 'sys_app_user', 2, '1/2 * * ? * *', '每个月的 每周 每天 每小时执行一次', '备份任务'),
	('bc4a788bc2ec40bdb1b7730131c26d42', 'sys_app_user_359515', '2016-04-12 17:24:05', 'sys_app_user', 2, '1/3 * * ? * *', '每个月的 每周 每天 每小时执行一次', 'ssss');
/*!40000 ALTER TABLE `db_timingbackup` ENABLE KEYS */;

-- 导出  表 lxcadmin.oa_department 结构
DROP TABLE IF EXISTS `oa_department`;
CREATE TABLE IF NOT EXISTS `oa_department` (
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

-- 正在导出表  lxcadmin.oa_department 的数据：~14 rows (大约)
DELETE FROM `oa_department`;
/*!40000 ALTER TABLE `oa_department` DISABLE KEYS */;
INSERT INTO `oa_department` (`DEPARTMENT_ID`, `NAME`, `NAME_EN`, `BIANMA`, `PARENT_ID`, `BZ`, `HEADMAN`, `TEL`, `FUNCTIONS`, `ADDRESS`) VALUES
	('0956d8c279274fca92f4091f2a69a9ad', '销售会计', 'xiaokuai', '05896', 'd41af567914a409893d011aa53eda797', '', '', '', '', ''),
	('3e7227e11dc14b4d9e863dd1a1fcedf6', '成本会计', 'chengb', '03656', 'd41af567914a409893d011aa53eda797', '', '', '', '', ''),
	('58febb24e42244e9bfffb7666892973c', '行政部', 'xingzhengbu', '00104', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', '冬梅', '', '', ''),
	('5cccdb7c432449d8b853c52880058140', 'B公司', 'b', '002', '0', '冶铁', '李四', '112', '冶铁', '河北'),
	('5dfc1c1c25f54603b62f70ba24d61fb1', '销售部', 'xiaoshoubu', '00102', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', '琳达', '', '', ''),
	('6d47d2d317aa4eb5906bad71a4bd5c34', '运营部', 'yunyingbu', '00106', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', '郑爽', '', '', ''),
	('83a25761c618457cae2fa1211bd8696d', '销售B组', 'xiaob', '002365', 'cbbc84eddde947ba8af7d509e430eb70', '', '李四', '', '', ''),
	('8f8b045470f342fdbc4c312ab881d62b', '销售A组', 'xiaoA', '0326', 'cbbc84eddde947ba8af7d509e430eb70', '', '张三', '0201212', '', ''),
	('a0982dea52554225ab682cd4b421de47', '1队', 'yidui', '02563', '8f8b045470f342fdbc4c312ab881d62b', '', '小王', '12356989', '', ''),
	('a6c6695217ba4a4dbfe9f7e9d2c06730', 'A公司', 'a', '001', '0', '挖煤', '张三', '110', '洼煤矿', '山西'),
	('b1fbd1e1ea8a48ebb1b06d9832333a18', '产品部', 'chanpingbu', '00109', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', '沈阳', '', '', ''),
	('cbbc84eddde947ba8af7d509e430eb70', '销售部', 'xiaoshoubu', '00201', '5cccdb7c432449d8b853c52880058140', '推销商品', '小明', '11236', '推销商品', '909办公室'),
	('d17cc99cfba845e0a055d5496ff779bd', '研发中心', 'yanfazhongxin', '00103', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '', '波波', '', '', ''),
	('d41af567914a409893d011aa53eda797', '财务部', 'caiwubu', '00101', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '负责发工资', '王武', '11236', '管理财务', '308办公室');
/*!40000 ALTER TABLE `oa_department` ENABLE KEYS */;

-- 导出  表 lxcadmin.sys_app_user 结构
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE IF NOT EXISTS `sys_app_user` (
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

-- 正在导出表  lxcadmin.sys_app_user 的数据：~1 rows (大约)
DELETE FROM `sys_app_user`;
/*!40000 ALTER TABLE `sys_app_user` DISABLE KEYS */;
INSERT INTO `sys_app_user` (`USER_ID`, `USERNAME`, `PASSWORD`, `NAME`, `RIGHTS`, `ROLE_ID`, `LAST_LOGIN`, `IP`, `STATUS`, `BZ`, `PHONE`, `SFID`, `START_TIME`, `END_TIME`, `YEARS`, `NUMBER`, `EMAIL`) VALUES
	('1e89e6504be349a68c025976b3ecc1d1', 'a1', '698d51a19d8a121ce581499d7b701668', '会员甲', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '121', '1212', '1212', '2015-12-02', '2015-12-25', 2, '111', '313596790@qq.com');
/*!40000 ALTER TABLE `sys_app_user` ENABLE KEYS */;

-- 导出  表 lxcadmin.sys_createcode 结构
DROP TABLE IF EXISTS `sys_createcode`;
CREATE TABLE IF NOT EXISTS `sys_createcode` (
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

-- 正在导出表  lxcadmin.sys_createcode 的数据：~8 rows (大约)
DELETE FROM `sys_createcode`;
/*!40000 ALTER TABLE `sys_createcode` DISABLE KEYS */;
INSERT INTO `sys_createcode` (`CREATECODE_ID`, `PACKAGENAME`, `OBJECTNAME`, `TABLENAME`, `FIELDLIST`, `CREATETIME`, `TITLE`, `LXCTYPE`) VALUES
	('19711ff736c44471a59a6b6e7dd41313', 'employee', 'Resume', 'TB_,lxc,RESUME', 'SEX,lxc,Integer,lxc,性别,lxc,是,lxc,无,lxc,2,lxc,0Q1094921525ADDRESS,lxc,String,lxc,地址,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525PHONE,lxc,String,lxc,电话,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525PIC,lxc,String,lxc,照片地址,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525CARD_ID,lxc,String,lxc,身份证号码,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525EMAIL,lxc,String,lxc,E-mail,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525QQ,lxc,String,lxc,QQ,lxc,是,lxc,无,lxc,15,lxc,0Q1094921525WECHAT,lxc,String,lxc,微信,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525POST_CODE,lxc,String,lxc,邮编号码,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525GOVEMMET,lxc,String,lxc,政治面貌,lxc,是,lxc,无,lxc,15,lxc,0Q1094921525NATION,lxc,String,lxc,民族,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525LEARING,lxc,String,lxc,学历,lxc,是,lxc,无,lxc,10,lxc,0Q1094921525HOBBY,lxc,String,lxc,爱好,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SUIT,lxc,String,lxc,特长,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525NATIONALITY,lxc,String,lxc,国籍,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525BIRTH,lxc,String,lxc,出生年月,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525FAITH,lxc,String,lxc,宗教信仰,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525SPEIALITY,lxc,String,lxc,专业,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525RESUME,lxc,String,lxc,个人简历,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525DESCRIBE,lxc,String,lxc,个人描述,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525REMARK,lxc,String,lxc,备注,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525ISROMVE,lxc,String,lxc,目前状况,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525USER_ID,lxc,String,lxc,审核人编码,lxc,否,lxc,无,lxc,32,lxc,0Q1094921525AGE,lxc,Integer,lxc,年龄,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525TIME,lxc,Date,lxc,时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525CREATE_TIME,lxc,Date,lxc,创建时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525UPDATE_TIME,lxc,Date,lxc,修改时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525CREATE_USER,lxc,String,lxc,创建人,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525UPDATE_USER,lxc,String,lxc,修改人,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525STAFF_NAME,lxc,String,lxc,员工姓名,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525STATUS,lxc,Integer,lxc,审核状态,lxc,是,lxc,无,lxc,5,lxc,0Q1094921525USER_NAME,lxc,String,lxc,审核人姓名,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525REASON,lxc,String,lxc,推荐理由,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525RESULT,lxc,Integer,lxc,面试成绩,lxc,是,lxc,无,lxc,10,lxc,0Q1094921525SCORE,lxc,String,lxc,面试评价,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525JOB_MESSAGE_ID,lxc,Integer,lxc,工作职位id,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525DEGREE,lxc,String,lxc,等级,lxc,是,lxc,无,lxc,10,lxc,0Q1094921525', '2018-01-27 16:40:33', '简历表', 'single'),
	('2512a85a675f45d39c82bb927ddc537a', 'employment', 'SubjectManage', 'TB_,lxc,SUBJECTMANAGE', 'SUBJECT_NAME,lxc,String,lxc,题目,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525SUBJECT_TYPE,lxc,String,lxc,资源地址,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525SELECT_A,lxc,String,lxc,A选项,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SELECT_B,lxc,String,lxc,B选项,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SELECT_C,lxc,String,lxc,C选项,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SELECT_D,lxc,String,lxc,D选项,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SELECT_E,lxc,String,lxc,E选项,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SELECT_F,lxc,String,lxc,F选项,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SELECT_TURE,lxc,String,lxc,正确选项,lxc,是,lxc,无,lxc,5,lxc,0Q1094921525ISSUE_PERSON,lxc,Integer,lxc,分值,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525ISSUE_TIME,lxc,Date,lxc,出题时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525', '2018-01-27 16:20:40', '题库信息表', 'single'),
	('8a7f641db01d4eb69f1d40025f8deb10', 'employment', 'InterviewInfo', 'TB_,lxc,INTERVIEWINFO', 'RESUME_ID,lxc,Integer,lxc,简历id,lxc,否,lxc,无,lxc,11,lxc,0Q1094921525EMPLOYEE_STATE,lxc,Integer,lxc,录用状态,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525EMPLOYEE_TIME,lxc,Date,lxc,录用时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525RESUME_USER_ID,lxc,String,lxc,招聘人id,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525RESUME_USER_NAME,lxc,String,lxc,招聘人姓名,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525', '2018-01-27 17:28:58', '面试人账户表', 'single'),
	('8a8609ca7a914e84ad10c06f9019d22c', 'mobilize', 'Mobilize', 'TB_,lxc,MOBILIZE', 'EMP_ID,lxc,String,lxc,审核人编号,lxc,否,lxc,无,lxc,32,lxc,0Q1094921525EMP_NAME,lxc,String,lxc,审核人名称,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525JOB_ID,lxc,String,lxc,工作职位编码,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525CAUSE,lxc,String,lxc,调用原因,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525STATUS,lxc,String,lxc,审核状态,lxc,是,lxc,无,lxc,5,lxc,0Q1094921525', '2018-01-27 16:25:06', '调动管理', 'single'),
	('ac8f10ec5bf140b5ba56fbf62508cc19', 'employee', 'IssueJob', 'TB_,lxc,ISSUEJOB', 'JOB_MESSAGE_ID,lxc,Integer,lxc,工作职位,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525COUNT,lxc,Integer,lxc,招聘人数,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525PRINCIPAL,lxc,Integer,lxc,招聘人,lxc,否,lxc,无,lxc,11,lxc,0Q1094921525FOUNDTIME,lxc,Date,lxc,建档时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525', '2018-03-11 05:12:17', '职位发布管理', 'fathertable'),
	('bd8d0943d9fe4b8b8018e6499c2658ca', 'compensation', 'StipenManager', 'TB_,lxc,STIPENMANAGER', 'STIPEND_NAME,lxc,String,lxc,薪酬名称,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525STIPEND_USER_NAME,lxc,String,lxc,登记人姓名,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525STIPEN_WEAL_JOURNEY,lxc,Integer,lxc,交通补贴,lxc,是,lxc,无,lxc,10,lxc,0Q1094921525STIPEN_WEAL_ LUNCH,lxc,Integer,lxc,午餐补贴,lxc,是,lxc,无,lxc,10,lxc,0Q1094921525GTIPEND_DATE,lxc,Date,lxc,登记时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525BASE_STIPEND_ID,lxc,String,lxc,基本薪资id,lxc,否,lxc,无,lxc,20,lxc,0Q1094921525STIPEND_TYPE,lxc,Integer,lxc,薪资类型,lxc,是,lxc,无,lxc,5,lxc,0Q1094921525STIPEND_WEAL,lxc,Integer,lxc,薪酬总额,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525STATUS,lxc,Integer,lxc,审批状态,lxc,是,lxc,无,lxc,5,lxc,0Q1094921525', '2018-01-27 16:13:05', '薪酬等级表', 'single'),
	('d44777af89914c288a25c6bc5e286172', 'staff', 'StaffEmployee', 'TB_,lxc,STAFFEMPLOYEE', 'STAFF_ID,lxc,Integer,lxc,员工ID,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525SEX,lxc,Integer,lxc,性别,lxc,是,lxc,无,lxc,2,lxc,0Q1094921525ADDRESS,lxc,String,lxc,地址,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525PHONE,lxc,String,lxc,电话,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525PIC,lxc,String,lxc,照片地址,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525CARD_ID,lxc,String,lxc,身份证号码,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525EMAIL,lxc,String,lxc,E-mail,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525QQ,lxc,String,lxc,QQ,lxc,是,lxc,无,lxc,15,lxc,0Q1094921525WECHAT,lxc,String,lxc,微信,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525POST_CODE,lxc,String,lxc,邮编号码,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525GOVEMMET,lxc,String,lxc,政治面貌,lxc,是,lxc,无,lxc,15,lxc,0Q1094921525NATION,lxc,String,lxc,民族,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525LEARING,lxc,String,lxc,学历,lxc,是,lxc,无,lxc,10,lxc,0Q1094921525HOBBY,lxc,String,lxc,爱好,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525SUIT,lxc,String,lxc,特长,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525NATIONALITY,lxc,String,lxc,国籍,lxc,是,lxc,无,lxc,50,lxc,0Q1094921525BIRTH,lxc,String,lxc,出生年月,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525FAITH,lxc,String,lxc,宗教信仰,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525SPEIALITY,lxc,String,lxc,专业,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525RESUME,lxc,String,lxc,个人简历,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525DESCRIBE,lxc,String,lxc,个人描述,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525REMARK,lxc,String,lxc,备注,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525ISROMVE,lxc,String,lxc,目前状况,lxc,是,lxc,无,lxc,30,lxc,0Q1094921525JOB_ID,lxc,Integer,lxc,工作编号,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525USER_ID,lxc,Integer,lxc,用户编号,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525AGE,lxc,Integer,lxc,年龄,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525ADD_TIME,lxc,Date,lxc,登记时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525STIPEND_ID,lxc,Integer,lxc,薪资ID,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525CREATE_TIME,lxc,Date,lxc,创建时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525UPDATE_TIME,lxc,Date,lxc,修改时间,lxc,是,lxc,无,lxc,32,lxc,0Q1094921525CREATE_USER,lxc,String,lxc,创建人,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525UPDATE_USER,lxc,String,lxc,修改人,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525STAFF_NAME,lxc,String,lxc,员工姓名,lxc,是,lxc,无,lxc,20,lxc,0Q1094921525', '2018-01-16 02:08:36', '员工档案信息表', 'single'),
	('eee7654085b84c35abc1ad2462ca02fa', 'employment', 'PaperTypeManage', 'TB_,lxc,PAPERTYPEMANAGE', 'PAPER_TYPE_ID,lxc,Integer,lxc,试卷分类id,lxc,是,lxc,无,lxc,11,lxc,0Q1094921525PAPER_NAME,lxc,String,lxc,类型名称,lxc,是,lxc,无,lxc,255,lxc,0Q1094921525', '2018-01-27 17:09:11', '试卷分类表', 'single');
/*!40000 ALTER TABLE `sys_createcode` ENABLE KEYS */;

-- 导出  表 lxcadmin.sys_dictionaries 结构
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE IF NOT EXISTS `sys_dictionaries` (
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

-- 正在导出表  lxcadmin.sys_dictionaries 的数据：~10 rows (大约)
DELETE FROM `sys_dictionaries`;
/*!40000 ALTER TABLE `sys_dictionaries` DISABLE KEYS */;
INSERT INTO `sys_dictionaries` (`DICTIONARIES_ID`, `NAME`, `NAME_EN`, `BIANMA`, `ORDER_BY`, `PARENT_ID`, `BZ`, `TBSNAME`) VALUES
	('096e4ec8986149d994b09e604504e38d', '黄浦区', 'huangpu', '0030201', 1, 'f1ea30ddef1340609c35c88fb2919bee', '黄埔', ''),
	('12a62a3e5bed44bba0412b7e6b733c93', '北京', 'beijing', '00301', 1, 'be4a8c5182c744d28282a5345783a77f', '北京', ''),
	('507fa87a49104c7c8cdb52fdb297da12', '宣武区', 'xuanwuqu', '0030101', 1, '12a62a3e5bed44bba0412b7e6b733c93', '宣武区', ''),
	('8994f5995f474e2dba6cfbcdfe5ea07a', '语文', 'yuwen', '00201', 1, 'fce20eb06d7b4b4d8f200eda623f725c', '语文', ''),
	('8ea7c44af25f48b993a14f791c8d689f', '分类', 'fenlei', '001', 1, '0', '分类', ''),
	('be4a8c5182c744d28282a5345783a77f', '地区', 'diqu', '003', 3, '0', '地区', ''),
	('d428594b0494476aa7338d9061e23ae3', '红色', 'red', '00101', 1, '8ea7c44af25f48b993a14f791c8d689f', '红色', ''),
	('de9afadfbed0428fa343704d6acce2c4', '绿色', 'green', '00102', 2, '8ea7c44af25f48b993a14f791c8d689f', '绿色', ''),
	('f1ea30ddef1340609c35c88fb2919bee', '上海', 'shanghai', '00302', 2, 'be4a8c5182c744d28282a5345783a77f', '上海', ''),
	('fce20eb06d7b4b4d8f200eda623f725c', '课程', 'kecheng', '002', 2, '0', '课程', '');
/*!40000 ALTER TABLE `sys_dictionaries` ENABLE KEYS */;

-- 导出  表 lxcadmin.sys_lxcbutton 结构
DROP TABLE IF EXISTS `sys_lxcbutton`;
CREATE TABLE IF NOT EXISTS `sys_lxcbutton` (
  `LXCBUTTON_ID` varchar(100) NOT NULL DEFAULT '',
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`LXCBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台按钮表';

-- 正在导出表  lxcadmin.sys_lxcbutton 的数据：~5 rows (大约)
DELETE FROM `sys_lxcbutton`;
/*!40000 ALTER TABLE `sys_lxcbutton` DISABLE KEYS */;
INSERT INTO `sys_lxcbutton` (`LXCBUTTON_ID`, `NAME`, `QX_NAME`, `BZ`) VALUES
	('3542adfbda73410c976e185ffe50ad06', '导出EXCEL', 'toExcel', '导出EXCEL'),
	('46992ea280ba4b72b29dedb0d4bc0106', '发邮件', 'email', '发送电子邮件'),
	('4efa162fce8340f0bd2dcd3b11d327ec', '导入EXCEL', 'FromExcel', '导入EXCEL到系统用户'),
	('6c63f4c03cb845099850a0c703e66cb2', '填写简历', 'fillResume', '职位发布管理-填写简历'),
	('cc51b694d5344d28a9aa13c84b7166cd', '发短信', 'sms', '发送短信'),
	('da7fd386de0b49ce809984f5919022b8', '站内信', 'LXCSMS', '发送站内信'),
	('fca15154923149a3a8f82e5ad6525f77', '参加考试', 'examination', '职位发布管理-参加考试');
/*!40000 ALTER TABLE `sys_lxcbutton` ENABLE KEYS */;

-- 导出  表 lxcadmin.sys_lxcsms 结构
DROP TABLE IF EXISTS `sys_lxcsms`;
CREATE TABLE IF NOT EXISTS `sys_lxcsms` (
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

-- 正在导出表  lxcadmin.sys_lxcsms 的数据：~10 rows (大约)
DELETE FROM `sys_lxcsms`;
/*!40000 ALTER TABLE `sys_lxcsms` DISABLE KEYS */;
INSERT INTO `sys_lxcsms` (`LXCSMS_ID`, `CONTENT`, `TYPE`, `TO_USERNAME`, `FROM_USERNAME`, `SEND_TIME`, `STATUS`, `SANME_ID`) VALUES
	('05879f5868824f35932ee9f2062adc03', '你好', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f'),
	('2635dd035c6f4bb5a091abdd784bd899', '你好', '2', 'san', 'admin', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5'),
	('52378ccd4e2d4fe08994d1652af87c68', '你好', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d'),
	('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00'),
	('98a6869f942042a1a037d9d9f01cb50f', '你好', '1', 'admin', 'san', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5'),
	('9e00295529014b6e8a27019cbccb3da1', '柔柔弱弱', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6'),
	('d3aedeb430f640359bff86cd657a8f59', '你好', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b'),
	('e5376b1bd54b489cb7f2203632bd74ec', '管理员好', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b'),
	('e613ac0fcc454f32895a70b747bf4fb5', '你也好', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d'),
	('f25e00cfafe741a3a05e3839b66dc7aa', '你好', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
/*!40000 ALTER TABLE `sys_lxcsms` ENABLE KEYS */;

-- 导出  表 lxcadmin.sys_menu 结构
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
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

-- 正在导出表  lxcadmin.sys_menu 的数据：~76 rows (大约)
DELETE FROM `sys_menu`;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`MENU_ID`, `MENU_NAME`, `MENU_URL`, `PARENT_ID`, `MENU_ORDER`, `MENU_ICON`, `MENU_TYPE`, `MENU_STATE`) VALUES
	(1, '系统管理', '#', '0', '10', 'menu-icon fa fa-desktop blue', '1', 1),
	(2, '权限管理', '#', '1', '1', 'menu-icon fa fa-lock black', '1', 1),
	(6, '信息管理', '#', '0', '8', 'menu-icon fa fa-credit-card green', '2', 1),
	(7, '图片管理', '#', '6', '1', 'menu-icon fa fa-folder-o pink', '2', 1),
	(8, '性能监控', 'druid/index.html', '9', '8', 'menu-icon fa fa-tachometer red', '1', 1),
	(9, '系统工具', '#', '0', '11', 'menu-icon fa fa-cog black', '1', 1),
	(10, '接口测试', 'tool/interfaceTest.do', '9', '2', 'menu-icon fa fa-exchange green', '1', 1),
	(11, '发送邮件', 'tool/goSendEmail.do', '9', '3', 'menu-icon fa fa-envelope-o green', '1', 1),
	(12, '置二维码', 'tool/goTwoDimensionCode.do', '9', '4', 'menu-icon fa fa-barcode green', '1', 1),
	(14, '地图工具', 'tool/map.do', '9', '6', 'menu-icon fa fa-globe black', '1', 1),
	(15, '微信管理', '#', '0', '9', 'menu-icon fa fa-comments purple', '2', 1),
	(16, '文本回复', 'textmsg/list.do', '15', '2', 'menu-icon fa fa-comment green', '2', 1),
	(17, '应用命令', 'command/list.do', '15', '4', 'menu-icon fa fa-comment grey', '2', 1),
	(18, '图文回复', 'imgmsg/list.do', '15', '3', 'menu-icon fa fa-comment pink', '2', 1),
	(19, '关注回复', 'textmsg/goSubscribe.do', '15', '1', 'menu-icon fa fa-comment orange', '2', 1),
	(20, '在线管理', 'onlinemanager/list.do', '1', '5', 'menu-icon fa fa-laptop green', '1', 1),
	(21, '打印测试', 'tool/printTest.do', '9', '7', 'menu-icon fa fa-hdd-o grey', '1', 1),
	(22, '一级菜单', '#', '0', '10', 'menu-icon fa fa-fire orange', '2', 1),
	(23, '二级菜单', '#', '22', '1', 'menu-icon fa fa-leaf black', '1', 1),
	(24, '三级菜单', '#', '23', '1', 'menu-icon fa fa-leaf black', '1', 1),
	(30, '四级菜单', '#', '24', '1', 'menu-icon fa fa-leaf black', '1', 1),
	(31, '五级菜单1', '#', '30', '1', 'menu-icon fa fa-leaf black', '1', 1),
	(32, '五级菜单2', '#', '30', '2', 'menu-icon fa fa-leaf black', '1', 1),
	(33, '六级菜单', '#', '31', '1', 'menu-icon fa fa-leaf black', '1', 1),
	(34, '六级菜单2', 'login_default.do', '31', '2', 'menu-icon fa fa-leaf black', '1', 1),
	(35, '四级菜单2', 'login_default.do', '24', '2', 'menu-icon fa fa-leaf black', '1', 1),
	(36, '角色(基础权限)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', 1),
	(37, '按钮权限', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', 1),
	(38, '菜单管理', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', 1),
	(39, '按钮管理', 'lxcbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', 1),
	(40, '用户管理', '#', '0', '8', 'menu-icon fa fa-users blue', '2', 1),
	(41, '系统用户', 'user/listUsers.do', '40', '1', 'menu-icon fa fa-users green', '1', 1),
	(42, '会员管理', 'happuser/listUsers.do', '40', '2', 'menu-icon fa fa-users orange', '1', 1),
	(43, '数据字典', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', 1),
	(44, '代码生成器', '#', '9', '0', 'menu-icon fa fa-cogs brown', '1', 1),
	(45, '七级菜单1', '#', '33', '1', 'menu-icon fa fa-leaf black', '1', 1),
	(46, '七级菜单2', '#', '33', '2', 'menu-icon fa fa-leaf black', '1', 1),
	(47, '八级菜单', 'login_default.do', '45', '1', 'menu-icon fa fa-leaf black', '1', 1),
	(48, '图表报表', ' tool/fusionchartsdemo.do', '9', '5', 'menu-icon fa fa-bar-chart-o black', '1', 1),
	(50, '站内信', 'lxcsms/list.do', '6', '3', 'menu-icon fa fa-envelope green', '1', 1),
	(51, '图片列表', 'pictures/list.do', '7', '1', 'menu-icon fa fa-folder-open-o green', '1', 1),
	(52, '图片爬虫', 'pictures/goImageCrawler.do', '7', '2', 'menu-icon fa fa-cloud-download green', '1', 1),
	(53, '表单构建器', 'tool/goFormbuilder.do', '9', '1', 'menu-icon fa fa-leaf black', '1', 1),
	(54, '数据库管理', '#', '0', '9', 'menu-icon fa fa-hdd-o blue', '1', 1),
	(55, '数据库备份', 'brdb/listAllTable.do', '54', '1', 'menu-icon fa fa-cloud-upload blue', '1', 1),
	(56, '数据库还原', 'brdb/list.do', '54', '3', 'menu-icon fa fa-cloud-download blue', '1', 1),
	(57, '备份定时器', 'timingbackup/list.do', '54', '2', 'menu-icon fa fa-tachometer blue', '1', 1),
	(58, 'SQL编辑器', 'sqledit/view.do', '54', '4', 'menu-icon fa fa-pencil-square-o blue', '1', 1),
	(59, 'OA办公', '#', '0', '6', 'menu-icon fa fa-laptop pink', '2', 1),
	(60, '组织机构', 'department/listAllDepartment.do?DEPARTMENT_ID=0', '59', '1', 'menu-icon fa fa-users green', '1', 1),
	(61, '反向生成', 'recreateCode/list.do', '44', '2', 'menu-icon fa fa-cogs blue', '1', 1),
	(62, '正向生成', 'createCode/list.do', '44', '1', 'menu-icon fa fa-cogs green', '1', 1),
	(63, '主附结构', 'attached/list.do', '6', '2', 'menu-icon fa fa-folder-open blue', '1', 1),
	(64, '人力资源档案管理', '#', '0', '1', 'menu-icon fa fa-desktop red', '2', 1),
	(65, '员工档案信息管理', 'staffemployee/list.do', '64', '1', 'menu-icon fa fa-leaf black', '1', 1),
	(66, '招聘管理', '#', '0', '1', 'menu-icon fa fa-users red', '2', 1),
	(67, '职位发布管理', 'issuejob/list.do', '66', '1', 'menu-icon fa fa-leaf black', '1', 1),
	(68, '简历登记', '#', '66', '2', 'menu-icon fa fa-leaf black', '1', 1),
	(69, '简历管理', 'resume/list.do', '66', '3', 'menu-icon fa fa-leaf black', '1', 1),
	(70, '招聘考试管理', '#', '66', '4', 'menu-icon fa fa-leaf black', '1', 1),
	(71, '招聘考试题库管理', 'subjectmanage/list.do', '66', '5', 'menu-icon fa fa-leaf black', '1', 1),
	(72, '录用管理', '#', '66', '6', 'menu-icon fa fa-leaf black', '1', 1),
	(73, '面试管理', '#', '66', '7', 'menu-icon fa fa-leaf black', '1', 1),
	(74, '考试出题', '#', '66', '8', 'menu-icon fa fa-leaf black', '1', 1),
	(75, '薪酬管理', '#', '0', '4', 'menu-icon fa fa-folder red', '2', 1),
	(76, '薪酬发放管理', 'stipenmanager/list.do', '75', '1', 'menu-icon fa fa-leaf black', '1', 1),
	(77, '薪酬标准管理', '#', '75', '2', 'menu-icon fa fa-leaf black', '1', 1),
	(78, '薪酬标准审核', '#', '75', '3', 'menu-icon fa fa-leaf black', '1', 1),
	(79, '薪酬发放审核', '#', '75', '4', 'menu-icon fa fa-leaf black', '1', 1),
	(80, '调动管理', '#', '0', '3', 'menu-icon fa fa-cogs red', '2', 1),
	(81, '统计报表', '#', '0', '5', 'menu-icon fa fa-bar-chart-o red', '2', 1),
	(82, '调动管理', 'mobilize/list.do', '80', '1', 'menu-icon fa fa-leaf black', '1', 1),
	(83, '调动审核', '#', '80', '2', 'menu-icon fa fa-leaf black', '1', 1),
	(84, '员工报表', '#', '81', '1', 'menu-icon fa fa-leaf black', '1', 1),
	(85, '薪酬报表', '#', '81', '2', 'menu-icon fa fa-leaf black', '1', 1),
	(86, '上传头像截图工具', 'tool/goJcropPortrait.do', '9', '9', 'menu-icon fa fa-users brown', '1', 1);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

-- 导出  表 lxcadmin.sys_role 结构
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE IF NOT EXISTS `sys_role` (
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

-- 正在导出表  lxcadmin.sys_role 的数据：~18 rows (大约)
DELETE FROM `sys_role`;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`ROLE_ID`, `ROLE_NAME`, `RIGHTS`, `PARENT_ID`, `ADD_QX`, `DEL_QX`, `EDIT_QX`, `CHA_QX`) VALUES
	('1', '系统管理组', '154742504910109583368773574', '0', '1', '1', '1', '1'),
	('115b386ff04f4352b060dffcd2b5d1da', '中级会员', '498', '2', '0', '0', '0', '0'),
	('1b67fc82ce89457a8347ae53e43a347e', '初级会员', '498', '2', '0', '0', '0', '0'),
	('2', '会员组', '498', '0', '0', '0', '0', '1'),
	('3264c8e83d0248bb9e3ea6195b4c0216', '一级管理员', '154742504910109583368773574', '1', '77371307797249640548523974', '55341921069948723142', '55340795170041880518', '77371308355703690923859910'),
	('46294b31a71c4600801724a6eb06bb26', '职位组', '77371235737982146963308544', '0', '0', '0', '0', '0'),
	('5466347ac07044cb8d82990ec7f3a90e', '主管', '77371235737982146963308544', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0'),
	('68f8e4a39efe47c7bb869e9d15ab925d', '二级管理员', '154742504910109583368773574', '1', '0', '0', '2251798773489606', '0'),
	('856849f422774ad390a4e564054d8cc8', '经理', '77371235737982146963308544', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0'),
	('8b70a7e67f2841e7aaba8a4d92e5ff6f', '高级会员', '498', '2', '0', '0', '0', '0'),
	('ab76c87c943b4551842a33f2f69be277', '普通员工', '154742504910109583368773574', '1', '0', '0', '0', '0'),
	('acf2091bd2014d72824fea2b6898bcda', '招聘专员', '154742504910109583368773574', '1', '10329004437600757450516352056119949495867338143311706149050930444560797425658268552155527979418894886790305323818340581568', '37762214501140362428416', '37762214501140362428416', '10329004437600757451636224961205865210992038556772291071801397097086346651829768185504906441018596397640825515064829149376'),
	('c21cecf84048434b93383182b1d98cba', '组长', '77371235737982146963308544', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0'),
	('c2ae457987fd4704bef5f630583aa6ad', '人力资源系统管理员', '154742504910109583368773574', '1', '77371251896080604112904134', '77371242664827267910229766', '77371242664827267910229766', '77371242664827267910229766'),
	('d449195cd8e7491080688c58e11452eb', '总监', '77371235737982146963308544', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0'),
	('de9de2f006e145a29d52dfadda295353', '三级管理员', '154742504910109583368773574', '1', '0', '0', '0', '0'),
	('f66cc8ea8acd44bdb8df001e253b5d2c', '薪酬绩效总监', '154742504910109583368773574', '1', '77333475252855566929756160', '1208853762020591246770176', '1171148617133928923267072', '61655144742752049982078976'),
	('f924d00914c54810922c31b62612dc57', '应聘面试人员', '154742504910109583368773574', '1', '368934881474191032320', '0', '368934881474191032320', '221360928884514619392');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- 导出  表 lxcadmin.sys_role_lxcbutton 结构
DROP TABLE IF EXISTS `sys_role_lxcbutton`;
CREATE TABLE IF NOT EXISTS `sys_role_lxcbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL COMMENT '角色id',
  `BUTTON_ID` varchar(100) DEFAULT NULL COMMENT '按钮id',
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_lxcbutton` (`LXCBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='按钮 角色中间表';

-- 正在导出表  lxcadmin.sys_role_lxcbutton 的数据：~61 rows (大约)
DELETE FROM `sys_role_lxcbutton`;
/*!40000 ALTER TABLE `sys_role_lxcbutton` DISABLE KEYS */;
INSERT INTO `sys_role_lxcbutton` (`RB_ID`, `ROLE_ID`, `BUTTON_ID`) VALUES
	('0a48a3ea60ef49fa85cadedfc16924d8', 'f66cc8ea8acd44bdb8df001e253b5d2c', '3542adfbda73410c976e185ffe50ad06'),
	('0a7e6563493f4a88af1851117dbfb369', '5466347ac07044cb8d82990ec7f3a90e', 'da7fd386de0b49ce809984f5919022b8'),
	('0c883cae19cf4a35a163f376e21d5094', 'c2ae457987fd4704bef5f630583aa6ad', 'da7fd386de0b49ce809984f5919022b8'),
	('0c9f6bedaab14cd98c43a9b8e34a012b', '3264c8e83d0248bb9e3ea6195b4c0216', '6c63f4c03cb845099850a0c703e66cb2'),
	('0cb658060a124f1eb2f57844a39a5a7e', '5466347ac07044cb8d82990ec7f3a90e', '46992ea280ba4b72b29dedb0d4bc0106'),
	('0da3d27b2f474fbd9ed87b3a1f073cb0', '856849f422774ad390a4e564054d8cc8', '3542adfbda73410c976e185ffe50ad06'),
	('0fe04126bbc24deb8c51149ce26cbc3d', 'c21cecf84048434b93383182b1d98cba', 'cc51b694d5344d28a9aa13c84b7166cd'),
	('14b5c28ea6ae4508b57d2d272ab3d5f1', '3264c8e83d0248bb9e3ea6195b4c0216', '46992ea280ba4b72b29dedb0d4bc0106'),
	('15817ede689a4fdcaa419c680c500bda', '856849f422774ad390a4e564054d8cc8', 'cc51b694d5344d28a9aa13c84b7166cd'),
	('1743733f366240c693c4295b527d1b0e', 'de9de2f006e145a29d52dfadda295353', '4efa162fce8340f0bd2dcd3b11d327ec'),
	('17f10a3b7736460d8af9d431ea10b366', 'f66cc8ea8acd44bdb8df001e253b5d2c', 'da7fd386de0b49ce809984f5919022b8'),
	('1c1d266a14ea4723bf9c56a10e21f115', '5466347ac07044cb8d82990ec7f3a90e', 'cc51b694d5344d28a9aa13c84b7166cd'),
	('2186211b5ac3428fa3a6785773d05cee', 'f66cc8ea8acd44bdb8df001e253b5d2c', '4efa162fce8340f0bd2dcd3b11d327ec'),
	('26353f41b3d44417a36f37c74eb302a4', 'ab76c87c943b4551842a33f2f69be277', 'da7fd386de0b49ce809984f5919022b8'),
	('311868de77464488a447ebd2ac2142c5', '1b67fc82ce89457a8347ae53e43a347e', '6c63f4c03cb845099850a0c703e66cb2'),
	('351d541f1b6a4b58a42d925bb0c720a8', '1b67fc82ce89457a8347ae53e43a347e', 'fca15154923149a3a8f82e5ad6525f77'),
	('3768e60edd1c4b5c9f1dd861188ae2f9', '3264c8e83d0248bb9e3ea6195b4c0216', 'cc51b694d5344d28a9aa13c84b7166cd'),
	('3855bc11012449728a48484fadd8fb20', 'ab76c87c943b4551842a33f2f69be277', 'da7fd386de0b49ce809984f5919022b8'),
	('3933e281267f4e49b33dc993a352d23a', 'd449195cd8e7491080688c58e11452eb', '46992ea280ba4b72b29dedb0d4bc0106'),
	('3c004ab1fe394a749b183bd7e1385f56', 'acf2091bd2014d72824fea2b6898bcda', 'da7fd386de0b49ce809984f5919022b8'),
	('449ced6e93834606879ed9a4762b90ab', 'c2ae457987fd4704bef5f630583aa6ad', '46992ea280ba4b72b29dedb0d4bc0106'),
	('46fddef71b7846d79b98647db3f62d27', 'c2ae457987fd4704bef5f630583aa6ad', '3542adfbda73410c976e185ffe50ad06'),
	('490dfd85658c4f82bbd450ae40dc95ed', 'f924d00914c54810922c31b62612dc57', 'fca15154923149a3a8f82e5ad6525f77'),
	('501248ca8b6246b19b465bdea2b24ab4', 'acf2091bd2014d72824fea2b6898bcda', '46992ea280ba4b72b29dedb0d4bc0106'),
	('52a4d63651a64793860b1cc64a9f96bd', 'd449195cd8e7491080688c58e11452eb', 'cc51b694d5344d28a9aa13c84b7166cd'),
	('52cfb2663a5d4d37990e798ffc69ca7f', 'acf2091bd2014d72824fea2b6898bcda', '4efa162fce8340f0bd2dcd3b11d327ec'),
	('54f020baed5e42c4813977822840c7f6', '5466347ac07044cb8d82990ec7f3a90e', '3542adfbda73410c976e185ffe50ad06'),
	('59a58f5edf6d4cc68f22a90feee8f169', 'ab76c87c943b4551842a33f2f69be277', '46992ea280ba4b72b29dedb0d4bc0106'),
	('5d0d81098f3047c9b1c39d13d7f614d3', 'c2ae457987fd4704bef5f630583aa6ad', '3542adfbda73410c976e185ffe50ad06'),
	('7345419394c34bd1acf47e46945cde19', 'acf2091bd2014d72824fea2b6898bcda', '3542adfbda73410c976e185ffe50ad06'),
	('786852b9d2a7429e9dd6f5440a63ae07', 'f66cc8ea8acd44bdb8df001e253b5d2c', 'da7fd386de0b49ce809984f5919022b8'),
	('80e9702770a54f56b66b92f2f493b23f', '856849f422774ad390a4e564054d8cc8', 'da7fd386de0b49ce809984f5919022b8'),
	('8231c216fb514b4188e4162e629c6237', '3264c8e83d0248bb9e3ea6195b4c0216', '4efa162fce8340f0bd2dcd3b11d327ec'),
	('828aa3f3ba64435fb35cdcd33629e929', 'f66cc8ea8acd44bdb8df001e253b5d2c', '46992ea280ba4b72b29dedb0d4bc0106'),
	('8d3a6dbfb874420691950e6491af60fe', '5466347ac07044cb8d82990ec7f3a90e', '4efa162fce8340f0bd2dcd3b11d327ec'),
	('8ec1968874064c64b2f8ee2878b0ec9c', 'd449195cd8e7491080688c58e11452eb', 'da7fd386de0b49ce809984f5919022b8'),
	('909c6b7b90834453ab88ebb8296cddfd', 'ab76c87c943b4551842a33f2f69be277', '4efa162fce8340f0bd2dcd3b11d327ec'),
	('9412d1d05162464c83658c7f89ab03f0', '68f8e4a39efe47c7bb869e9d15ab925d', '3542adfbda73410c976e185ffe50ad06'),
	('946a193cde034882a4fefe6c0431b8a2', 'de9de2f006e145a29d52dfadda295353', '3542adfbda73410c976e185ffe50ad06'),
	('96567633dd3548c9b75d28f430adf5a3', '3264c8e83d0248bb9e3ea6195b4c0216', 'da7fd386de0b49ce809984f5919022b8'),
	('a0020e0185154b51af48d9dd83b06612', 'ab76c87c943b4551842a33f2f69be277', '46992ea280ba4b72b29dedb0d4bc0106'),
	('a34cd03699b54db1b2505b496e1c5100', 'f66cc8ea8acd44bdb8df001e253b5d2c', 'cc51b694d5344d28a9aa13c84b7166cd'),
	('abf49a18f01f4e4a8c32ed16b284c343', 'ab76c87c943b4551842a33f2f69be277', '3542adfbda73410c976e185ffe50ad06'),
	('ada95a97025b4a82a19f694d36243abd', 'c2ae457987fd4704bef5f630583aa6ad', 'cc51b694d5344d28a9aa13c84b7166cd'),
	('b392ac80f9194f47ad7e642d2d2788cf', '3264c8e83d0248bb9e3ea6195b4c0216', '3542adfbda73410c976e185ffe50ad06'),
	('b58accc5368341478e1ad3379aa6db4d', 'ab76c87c943b4551842a33f2f69be277', '4efa162fce8340f0bd2dcd3b11d327ec'),
	('b6548f1993d9465fa717daae43e83954', 'acf2091bd2014d72824fea2b6898bcda', 'cc51b694d5344d28a9aa13c84b7166cd'),
	('ba3d44a087dd4d728ea4284fe9c34ea7', 'acf2091bd2014d72824fea2b6898bcda', '46992ea280ba4b72b29dedb0d4bc0106'),
	('ba6696b8761044618e44c7e02c9ba89e', '68f8e4a39efe47c7bb869e9d15ab925d', 'cc51b694d5344d28a9aa13c84b7166cd'),
	('bf3d22712f8143ae9c8ff51c36d5e432', 'f66cc8ea8acd44bdb8df001e253b5d2c', '4efa162fce8340f0bd2dcd3b11d327ec'),
	('bf904799e325417fa0bf5cbf0226ba3e', 'ab76c87c943b4551842a33f2f69be277', '3542adfbda73410c976e185ffe50ad06'),
	('c8d171794a2a42e1b9d2658628a25966', 'd449195cd8e7491080688c58e11452eb', '4efa162fce8340f0bd2dcd3b11d327ec'),
	('cd5dbc5565b849a886e5b4844abca5e4', 'c2ae457987fd4704bef5f630583aa6ad', '4efa162fce8340f0bd2dcd3b11d327ec'),
	('d92d43d6f16f4b9c8591d5ad246398f1', 'acf2091bd2014d72824fea2b6898bcda', '3542adfbda73410c976e185ffe50ad06'),
	('d949172d999c467c818289b1f9ecacf7', '856849f422774ad390a4e564054d8cc8', '4efa162fce8340f0bd2dcd3b11d327ec'),
	('d952ae96d14a42e0944c812ceff4c44c', 'd449195cd8e7491080688c58e11452eb', '3542adfbda73410c976e185ffe50ad06'),
	('dcc3ac4da04e409bade5a6998117823f', 'acf2091bd2014d72824fea2b6898bcda', 'da7fd386de0b49ce809984f5919022b8'),
	('dfe1251be31a4bd392ba90b3ac66f787', 'c21cecf84048434b93383182b1d98cba', 'da7fd386de0b49ce809984f5919022b8'),
	('e96b574d0f8042d497b6aa9bbc3c9444', 'f66cc8ea8acd44bdb8df001e253b5d2c', 'cc51b694d5344d28a9aa13c84b7166cd'),
	('eb1e3353f7ca4685a3d02a8f57fd9f7d', 'c21cecf84048434b93383182b1d98cba', '46992ea280ba4b72b29dedb0d4bc0106'),
	('f0329033d0914faf8ea6e9ff252cc5e6', '68f8e4a39efe47c7bb869e9d15ab925d', '46992ea280ba4b72b29dedb0d4bc0106'),
	('f0973eb23a45485480a679302162710a', 'f924d00914c54810922c31b62612dc57', '6c63f4c03cb845099850a0c703e66cb2'),
	('f25e0ae451da46eaa20c1d93849db183', 'acf2091bd2014d72824fea2b6898bcda', '4efa162fce8340f0bd2dcd3b11d327ec'),
	('f4263acc20e940e797d6eac7b45015a8', 'acf2091bd2014d72824fea2b6898bcda', 'cc51b694d5344d28a9aa13c84b7166cd'),
	('f627982cc9d4479dbc03af726dc6ac58', 'de9de2f006e145a29d52dfadda295353', 'cc51b694d5344d28a9aa13c84b7166cd'),
	('f84e96fe5386464aaff6ce928b93f21c', '3264c8e83d0248bb9e3ea6195b4c0216', 'fca15154923149a3a8f82e5ad6525f77'),
	('fce0826f5cbf4f66b1f8d65f6d5bbdce', '856849f422774ad390a4e564054d8cc8', '46992ea280ba4b72b29dedb0d4bc0106');
/*!40000 ALTER TABLE `sys_role_lxcbutton` ENABLE KEYS */;

-- 导出  表 lxcadmin.sys_user 结构
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE IF NOT EXISTS `sys_user` (
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

-- 正在导出表  lxcadmin.sys_user 的数据：~5 rows (大约)
DELETE FROM `sys_user`;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`USER_ID`, `USERNAME`, `PASSWORD`, `NAME`, `RIGHTS`, `ROLE_ID`, `LAST_LOGIN`, `IP`, `STATUS`, `BZ`, `SKIN`, `EMAIL`, `NUMBER`, `PHONE`) VALUES
	('1', 'admin', '302a0527527647a6dea9ae5dc8ed732ef8d7054a', 'lxc', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2018-03-11 07:49:26', '127.0.0.1', '0', 'admin', 'default', 'QQ1094921525@main.com', '001', '18101298728'),
	('69177258a06e4927b4639ab1684c3320', 'san', '577bdf3a59d0972ad918a38b30688440425717cc', '三', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2018-01-27 13:49:14', '127.0.0.1', '0', '111', 'default', '978336446@qq.com', '333', '13562202556'),
	('9991f4d7782a4ccfb8a65bd96ea7aafa', 'lisi', '434588cee83dca5aaa683852319c54c22f1b41ab', '李四', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2018-01-27 13:49:34', '127.0.0.1', '0', '小李', 'default', '313596790@qq.com', '1102', '13566233663'),
	('b920e29ae2264f40a6a9530036c732fd', 'hr', '861d10246b852f459de5d6e853db324ec270f270', 'HR', '', 'c2ae457987fd4704bef5f630583aa6ad', '2018-02-09 09:43:00', '0:0:0:0:0:0:0:1', '0', '人力资源管理员', 'default', '1281290121@qq.com', '1001', '18911780490'),
	('e29149962e944589bb7da23ad18ddeed', 'zhangsan', 'f1665429dbb3e6c2af7a461a4f547b82ee9ab233', '张三', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2018-01-27 13:51:10', '127.0.0.1', '0', '小张', 'default', 'zhangsan@www.com', '1101', '18918192891');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 lxcadmin.tb_attached 结构
DROP TABLE IF EXISTS `tb_attached`;
CREATE TABLE IF NOT EXISTS `tb_attached` (
  `ATTACHED_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `FDESCRIBE` varchar(255) DEFAULT NULL COMMENT '描述',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '薪酬',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ATTACHED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主附结构接口';

-- 正在导出表  lxcadmin.tb_attached 的数据：~1 rows (大约)
DELETE FROM `tb_attached`;
/*!40000 ALTER TABLE `tb_attached` DISABLE KEYS */;
INSERT INTO `tb_attached` (`ATTACHED_ID`, `NAME`, `FDESCRIBE`, `PRICE`, `CTIME`) VALUES
	('d74b6f507e784607b8f85e31e3cfad22', 'AA', 'aaa', 222.00, '2016-04-17 18:20:41');
/*!40000 ALTER TABLE `tb_attached` ENABLE KEYS */;

-- 导出  表 lxcadmin.tb_attachedmx 结构
DROP TABLE IF EXISTS `tb_attachedmx`;
CREATE TABLE IF NOT EXISTS `tb_attachedmx` (
  `ATTACHEDMX_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建日期',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '单价',
  `ATTACHED_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ATTACHEDMX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='明细表';

-- 正在导出表  lxcadmin.tb_attachedmx 的数据：~2 rows (大约)
DELETE FROM `tb_attachedmx`;
/*!40000 ALTER TABLE `tb_attachedmx` DISABLE KEYS */;
INSERT INTO `tb_attachedmx` (`ATTACHEDMX_ID`, `NAME`, `TITLE`, `CTIME`, `PRICE`, `ATTACHED_ID`) VALUES
	('04717d1a034c4e51aacd5e062a4c63bd', 'ddd', 'ddd', '2016-03-29', 111.00, 'd74b6f507e784607b8f85e31e3cfad22'),
	('f7ac797407be4a76a7125d41fe345112', 'rgt', 'gdf', '2016-03-30', 3423.00, 'd74b6f507e784607b8f85e31e3cfad22');
/*!40000 ALTER TABLE `tb_attachedmx` ENABLE KEYS */;

-- 导出  表 lxcadmin.tb_interviewinfo 结构
DROP TABLE IF EXISTS `tb_interviewinfo`;
CREATE TABLE IF NOT EXISTS `tb_interviewinfo` (
  `INTERVIEW_INFO_ID` varchar(100) NOT NULL,
  `RESUME_ID` int(11) DEFAULT NULL COMMENT '简历id',
  `EMPLOYEE_STATE` int(11) DEFAULT NULL COMMENT '录用状态',
  `EMPLOYEE_TIME` varchar(32) DEFAULT NULL COMMENT '录用时间',
  `RESUME_USER_ID` varchar(32) DEFAULT NULL COMMENT '招聘人id',
  `RESUME_USER_NAME` varchar(20) DEFAULT NULL COMMENT '招聘人姓名',
  PRIMARY KEY (`INTERVIEW_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='面试信息表';

-- 正在导出表  lxcadmin.tb_interviewinfo 的数据：~0 rows (大约)
DELETE FROM `tb_interviewinfo`;
/*!40000 ALTER TABLE `tb_interviewinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_interviewinfo` ENABLE KEYS */;

-- 导出  表 lxcadmin.tb_issuejob 结构
DROP TABLE IF EXISTS `tb_issuejob`;
CREATE TABLE IF NOT EXISTS `tb_issuejob` (
  `ISSUEJOB_ID` varchar(100) NOT NULL,
  `JOB_MESSAGE_ID` int(11) DEFAULT NULL COMMENT '工作职位ID',
  `JOB_MESSAGE_NAME` varchar(50) DEFAULT NULL COMMENT '工作职位名称',
  `COUNTS` int(11) DEFAULT NULL COMMENT '招聘人数',
  `PRINCIPAL` varchar(50) DEFAULT NULL COMMENT '招聘人',
  `FOUNDTIME` varchar(32) DEFAULT NULL COMMENT '招聘时间',
  PRIMARY KEY (`ISSUEJOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职位发布表';

-- 正在导出表  lxcadmin.tb_issuejob 的数据：~2 rows (大约)
DELETE FROM `tb_issuejob`;
/*!40000 ALTER TABLE `tb_issuejob` DISABLE KEYS */;
INSERT INTO `tb_issuejob` (`ISSUEJOB_ID`, `JOB_MESSAGE_ID`, `JOB_MESSAGE_NAME`, `COUNTS`, `PRINCIPAL`, `FOUNDTIME`) VALUES
	('b427d89f3e8b4555affeb413756cc9cc', 1, NULL, 10, '0', '2018-03-11'),
	('c895022ba7e647a78087cef57dc1b701', 2, NULL, 10, 'admin', '2018-03-11');
/*!40000 ALTER TABLE `tb_issuejob` ENABLE KEYS */;

-- 导出  表 lxcadmin.tb_mobilize 结构
DROP TABLE IF EXISTS `tb_mobilize`;
CREATE TABLE IF NOT EXISTS `tb_mobilize` (
  `MOBILIZE_ID` varchar(100) NOT NULL,
  `EMP_ID` varchar(32) DEFAULT NULL COMMENT '审核人编号',
  `EMP_NAME` varchar(20) DEFAULT NULL COMMENT '审核人名称',
  `JOB_ID` varchar(20) DEFAULT NULL COMMENT '工作职位编码',
  `CAUSE` varchar(255) DEFAULT NULL COMMENT '调用原因',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`MOBILIZE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调动管理表';

-- 正在导出表  lxcadmin.tb_mobilize 的数据：~1 rows (大约)
DELETE FROM `tb_mobilize`;
/*!40000 ALTER TABLE `tb_mobilize` DISABLE KEYS */;
INSERT INTO `tb_mobilize` (`MOBILIZE_ID`, `EMP_ID`, `EMP_NAME`, `JOB_ID`, `CAUSE`, `STATUS`) VALUES
	('276111b2e3e340e58f8e09c460b3eade', '', '张三', '001', '12121', '1');
/*!40000 ALTER TABLE `tb_mobilize` ENABLE KEYS */;

-- 导出  表 lxcadmin.tb_papertypemanage 结构
DROP TABLE IF EXISTS `tb_papertypemanage`;
CREATE TABLE IF NOT EXISTS `tb_papertypemanage` (
  `PAPERTYPEMANAGE_ID` varchar(100) NOT NULL,
  `PAPER_TYPE_ID` int(11) DEFAULT NULL COMMENT '试卷分类id',
  `PAPER_NAME` varchar(255) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`PAPERTYPEMANAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题库类型表';

-- 正在导出表  lxcadmin.tb_papertypemanage 的数据：~0 rows (大约)
DELETE FROM `tb_papertypemanage`;
/*!40000 ALTER TABLE `tb_papertypemanage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_papertypemanage` ENABLE KEYS */;

-- 导出  表 lxcadmin.tb_pictures 结构
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE IF NOT EXISTS `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片管理表';

-- 正在导出表  lxcadmin.tb_pictures 的数据：~14 rows (大约)
DELETE FROM `tb_pictures`;
/*!40000 ALTER TABLE `tb_pictures` DISABLE KEYS */;
INSERT INTO `tb_pictures` (`PICTURES_ID`, `TITLE`, `NAME`, `PATH`, `CREATETIME`, `MASTER_ID`, `BZ`) VALUES
	('0c0c82eca0da4ec1ab0fe6e20258798d', '图片', '5cd6aa624cfa402e9a8258c7c8d9728b.jpeg', '20180310/5cd6aa624cfa402e9a8258c7c8d9728b.jpeg', '2018-01-14 17:24:32', '1', '图片管理处上传'),
	('10928e45842c476881a931b66974942a', '图片', '8fdf2fa6de034426b03ae0efd6bf7ae7.jpeg', '20180114/8fdf2fa6de034426b03ae0efd6bf7ae7.jpeg', '2018-01-14 17:24:33', '1', '图片管理处上传'),
	('6864b83430bd4a5b96186a630678c269', '图片', 'db30eab3b7354ba78c3988774f0fee33.jpeg', '20180114/db30eab3b7354ba78c3988774f0fee33.jpeg', '2018-01-14 17:24:32', '1', '图片管理处上传'),
	('69efb1526b1e48459fbdb1f5efd09cc7', '图片', 'a56f3b473a1a42459bf64dfd9c4b2d2d.jpeg', '20180114/a56f3b473a1a42459bf64dfd9c4b2d2d.jpeg', '2018-01-14 17:24:32', '1', '图片管理处上传'),
	('785e4f3118ea4cefb68c628eaafaeb83', '图片', '282efe0ffedd4363a4189c4eae8ca387.jpeg', '20180114/282efe0ffedd4363a4189c4eae8ca387.jpeg', '2018-01-14 17:24:32', '1', '图片管理处上传'),
	('7e36027440fc468f89f332b20fc76a47', '图片', 'a4abfca27f874026ae8ada2e8240c2b4.jpeg', '20180114/a4abfca27f874026ae8ada2e8240c2b4.jpeg', '2018-01-14 17:24:32', '1', '图片管理处上传'),
	('82a794b75b2f4863b8bbae65f068e7e2', '图片', '0218761f21c14737b4d54e2d7c833502.jpeg', '20180114/0218761f21c14737b4d54e2d7c833502.jpeg', '2018-01-14 17:24:32', '1', '图片管理处上传'),
	('8c3cae8d260d405fbad5163d53ca7394', '图片', '0aa91efb080b415d967d04d74ea86f08.jpeg', '20180114/0aa91efb080b415d967d04d74ea86f08.jpeg', '2018-01-14 17:24:33', '1', '图片管理处上传'),
	('8c732f262f8b4a44921e7578ecb91c39', '图片', '83d14225c60249b09b16d2adc18d4f67.jpeg', '20180114/83d14225c60249b09b16d2adc18d4f67.jpeg', '2018-01-14 17:24:31', '1', '图片管理处上传'),
	('8d522630ef0841ceaf50dfb3cb91a7fb', '图片', '49c12b046b684b9c8876e68bcfc02a74.jpg', '20180310/49c12b046b684b9c8876e68bcfc02a74.jpg', '2018-03-10 00:49:11', '1', '图片管理处上传'),
	('9cbadf551b2f41deb909511d4e5ebd31', '图片', '348434c2117e47668e2f137e1ceea4a3.jpeg', '20180114/348434c2117e47668e2f137e1ceea4a3.jpeg', '2018-01-14 17:24:33', '1', '图片管理处上传'),
	('b09d264a371e412e94cd0c069825d02d', '图片', '5b205c612c114010942846b9e575c26c.jpeg', '20180114/5b205c612c114010942846b9e575c26c.jpeg', '2018-01-14 17:24:32', '1', '图片管理处上传'),
	('bf4e3b5ea81641538dc8d58ef4a9faf8', '图片', '554fd5c4ca124062a8574c18627e1c87.jpeg', '20180114/554fd5c4ca124062a8574c18627e1c87.jpeg', '2018-01-14 17:24:31', '1', '图片管理处上传'),
	('dffbc4d805204cfea70ae48881fe189e', '图片', 'd05219623f43481386e29f850a8a44b4.jpeg', '20180114/d05219623f43481386e29f850a8a44b4.jpeg', '2018-01-14 17:24:31', '1', '图片管理处上传');
/*!40000 ALTER TABLE `tb_pictures` ENABLE KEYS */;

-- 导出  表 lxcadmin.tb_resume 结构
DROP TABLE IF EXISTS `tb_resume`;
CREATE TABLE IF NOT EXISTS `tb_resume` (
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
  `RESUME` varchar(255) DEFAULT NULL COMMENT '个人简历',
  `DESCRIBES` varchar(255) DEFAULT NULL COMMENT '个人描述',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `ISROMVE` varchar(30) DEFAULT NULL COMMENT '目前状况',
  `USER_ID` varchar(32) DEFAULT NULL COMMENT '审核人编码',
  `AGE` int(11) DEFAULT NULL COMMENT '年龄',
  `TIME` varchar(32) DEFAULT NULL COMMENT '时间',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` varchar(255) DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` varchar(255) DEFAULT NULL COMMENT '修改人',
  `STAFF_NAME` varchar(20) DEFAULT NULL COMMENT '员工姓名',
  `STATUS` int(5) DEFAULT NULL COMMENT '审核状态',
  `USER_NAME` varchar(20) DEFAULT NULL COMMENT '审核人姓名',
  `REASON` varchar(50) DEFAULT NULL COMMENT '推荐理由',
  `RESULT` int(10) DEFAULT NULL COMMENT '面试成绩',
  `SCORE` varchar(255) DEFAULT NULL COMMENT '面试评价',
  `JOB_MESSAGE_ID` int(11) DEFAULT NULL COMMENT '工作职位id',
  `DEGREE` varchar(10) DEFAULT NULL COMMENT '等级',
  PRIMARY KEY (`RESUME_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简历表';

-- 正在导出表  lxcadmin.tb_resume 的数据：~1 rows (大约)
DELETE FROM `tb_resume`;
/*!40000 ALTER TABLE `tb_resume` DISABLE KEYS */;
INSERT INTO `tb_resume` (`RESUME_ID`, `SEX`, `ADDRESS`, `PHONE`, `PIC`, `CARD_ID`, `EMAIL`, `QQ`, `WECHAT`, `POST_CODE`, `GOVEMMET`, `NATION`, `LEARING`, `HOBBY`, `SUIT`, `NATIONALITY`, `BIRTH`, `FAITH`, `SPEIALITY`, `RESUME`, `DESCRIBES`, `REMARK`, `ISROMVE`, `USER_ID`, `AGE`, `TIME`, `CREATE_TIME`, `UPDATE_TIME`, `CREATE_USER`, `UPDATE_USER`, `STAFF_NAME`, `STATUS`, `USER_NAME`, `REASON`, `RESULT`, `SCORE`, `JOB_MESSAGE_ID`, `DEGREE`) VALUES
	('b0a739b2700042e483bd686bb6205363', 1, '北京市海淀区', '18102910911', '9e3df8dcd100baa16641635d4f10b912c9fc2ee2.jpg', '3607321919029101', '212111291@qq.com', '212111291', 'huanxiao', '10091', '群众', '0', '大学', '表演', '唱歌', 'CN', '1989-10-12', '佛教', '演员', '11111111', '111111111111', '111', '良好', '', 12, '2018-01-28', NULL, NULL, NULL, NULL, '黄晓', 1, '11', '111111111111', 96, '1111111111', 11, '1级');
/*!40000 ALTER TABLE `tb_resume` ENABLE KEYS */;

-- 导出  表 lxcadmin.tb_staffemployee 结构
DROP TABLE IF EXISTS `tb_staffemployee`;
CREATE TABLE IF NOT EXISTS `tb_staffemployee` (
  `STAFFEMPLOYEE_ID` varchar(100) NOT NULL,
  `STAFF_ID` int(11) DEFAULT NULL COMMENT '员工ID',
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
  `RESUME` varchar(255) DEFAULT NULL COMMENT '个人简历',
  `DESCRIBES` varchar(255) DEFAULT NULL COMMENT '个人描述',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `ISROMVE` varchar(30) DEFAULT NULL COMMENT '目前状况',
  `JOB_ID` int(11) DEFAULT NULL COMMENT '工作编号',
  `USER_ID` int(11) DEFAULT NULL COMMENT '用户编号',
  `AGE` int(11) DEFAULT NULL COMMENT '年龄',
  `ADD_TIME` varchar(32) DEFAULT NULL COMMENT '登记时间',
  `STIPEND_ID` int(11) DEFAULT NULL COMMENT '薪资ID',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` varchar(255) DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` varchar(255) DEFAULT NULL COMMENT '修改人',
  `STAFF_NAME` varchar(20) DEFAULT NULL COMMENT '员工姓名',
  `STATES` tinyint(5) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`STAFFEMPLOYEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工档案信息表';

-- 正在导出表  lxcadmin.tb_staffemployee 的数据：~6 rows (大约)
DELETE FROM `tb_staffemployee`;
/*!40000 ALTER TABLE `tb_staffemployee` DISABLE KEYS */;
INSERT INTO `tb_staffemployee` (`STAFFEMPLOYEE_ID`, `STAFF_ID`, `SEX`, `ADDRESS`, `PHONE`, `PIC`, `CARD_ID`, `EMAIL`, `QQ`, `WECHAT`, `POST_CODE`, `GOVEMMET`, `NATION`, `LEARING`, `HOBBY`, `SUIT`, `NATIONALITY`, `BIRTH`, `FAITH`, `SPEIALITY`, `RESUME`, `DESCRIBES`, `REMARK`, `ISROMVE`, `JOB_ID`, `USER_ID`, `AGE`, `ADD_TIME`, `STIPEND_ID`, `CREATE_TIME`, `UPDATE_TIME`, `CREATE_USER`, `UPDATE_USER`, `STAFF_NAME`, `STATES`) VALUES
	('3e69e297070e42d7b46628317898013e', 11, 1, '北京市', '111', '', '128901920121', '21212212@qq.com', '1901290112', '2121', '1212', '2121', '2', '硕士', '英语', '游泳', 'CN', '1992-12-11', '佛教', '计算机', '111', '111', '11', '良好', 111, 11, 11, '2018-01-25', 11, NULL, NULL, NULL, NULL, '张三丰', NULL),
	('58d0c83404c447ec94354d044f489897', 1002, 2, '海南岛', '18911780490', '', '360732199202102113', '212819289@qq.com', '1094921521', '121211214', '3424223', '党员', '5', '研究生', '旅游', '绘画', 'CN', '1992-02-10', '佛教', '金融', '1122222222222222222', '11111111111', '', '在职', 1001, 10002, 26, '2018-01-22', 111, NULL, NULL, NULL, NULL, '古成芳', NULL),
	('635f7ef8103742d1b59913922da5aff0', 1003, 1, '北京市海淀区', '18911780491', '', '36073220170191291', '121211211@qq.com', '1910290192', 'lixiaoxiao', '100093', '群众', '0', '本科', '睡觉', '看电视', 'CN', '2017-01-11', '无', '无', '11212', '121212', '哈哈', '良好', 1001, 101021, 1, '2018-01-23', 11, NULL, NULL, NULL, NULL, '李潇潇', NULL),
	('a5032a6ec23a40798448db57e8a5732b', 1002, 2, '黑龙江省哈尔滨市', '13641059864', '', '23012519910701264X', 'lixinxin852@126.com', '931920085', '13641059864', '100019', '党员', '0', '本科', '逛街购物', '跳舞', 'CN', '1991-07-01', '无', '通信工程', '外语能力： 六级\r\n东北石油大学', '1212', '父母联系方式15146409055', '在职', 1002, 11111, 27, '2018-02-09', 1001, NULL, NULL, NULL, NULL, '李欣欣', NULL),
	('c2cc729ffd684f6896a80cd4d02dfb82', 10022052, 2, '河南周口', '15600647138', '', '41272119901102266X', 'zhlee007@gmail.com', '395986883', 'leejenney', '100019', '党员', '0', '本科', '逛街', '唱歌', 'CN', '1990-11-02', '佛教', '软件工程', '中原工学院 \r\n软件工程（java方向）\r\n外语能力： cet-4（501）\r\n是否自备电脑：是', '是否住宿：是', '父母电话 15936913841', '在职', 1001, 1001, 28, '2018-02-09', 1001, NULL, NULL, NULL, NULL, '李志华', NULL),
	('f1c558ce3db2423e8e5dd1566839fe28', 101, 1, '北京市海淀区', '18101298728', '', '360732199306202118', '12811212921@qq.com', '1291290121', 'liuxicai002', '10001', '群众', '3', '本科', '编程', '书法', 'CN', '10919291', '佛教', '计算机科学与技术', 'vvv', '212121212', '哈哈', '11', 1002, 975, 23, '2018-01-16', 101, NULL, NULL, NULL, NULL, '刘熙财', NULL);
/*!40000 ALTER TABLE `tb_staffemployee` ENABLE KEYS */;

-- 导出  表 lxcadmin.tb_stipenmanager 结构
DROP TABLE IF EXISTS `tb_stipenmanager`;
CREATE TABLE IF NOT EXISTS `tb_stipenmanager` (
  `STIPENMANAGER_ID` varchar(100) NOT NULL,
  `STIPEND_NAME` varchar(20) DEFAULT NULL COMMENT '薪酬名称',
  `STIPEND_USER_NAME` varchar(20) DEFAULT NULL COMMENT '登记人姓名',
  `STIPEN_WEAL_JOURNEY` int(10) DEFAULT NULL COMMENT '交通补贴',
  `STIPEN_WEAL_LUNCH` int(10) DEFAULT NULL COMMENT '午餐补贴',
  `GTIPEND_DATE` varchar(32) DEFAULT NULL COMMENT '登记时间',
  `BASE_STIPEND_ID` varchar(20) DEFAULT NULL COMMENT '基本薪资id',
  `STIPEND_TYPE` int(5) DEFAULT NULL COMMENT '薪资类型',
  `STIPEND_WEAL` int(11) DEFAULT NULL COMMENT '薪酬总额',
  `STATUS` int(5) DEFAULT NULL COMMENT '审批状态',
  PRIMARY KEY (`STIPENMANAGER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='薪酬登记表';

-- 正在导出表  lxcadmin.tb_stipenmanager 的数据：~0 rows (大约)
DELETE FROM `tb_stipenmanager`;
/*!40000 ALTER TABLE `tb_stipenmanager` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_stipenmanager` ENABLE KEYS */;

-- 导出  表 lxcadmin.tb_subjectmanage 结构
DROP TABLE IF EXISTS `tb_subjectmanage`;
CREATE TABLE IF NOT EXISTS `tb_subjectmanage` (
  `SUBJECTMANAGE_ID` varchar(100) NOT NULL,
  `SUBJECT_NAME` varchar(255) DEFAULT NULL COMMENT '题目',
  `SUBJECT_TYPE` varchar(20) DEFAULT NULL COMMENT '资源地址',
  `SELECT_A` varchar(50) DEFAULT NULL COMMENT 'A选项',
  `SELECT_B` varchar(50) DEFAULT NULL COMMENT 'B选项',
  `SELECT_C` varchar(50) DEFAULT NULL COMMENT 'C选项',
  `SELECT_D` varchar(50) DEFAULT NULL COMMENT 'D选项',
  `SELECT_E` varchar(50) DEFAULT NULL COMMENT 'E选项',
  `SELECT_F` varchar(50) DEFAULT NULL COMMENT 'F选项',
  `SELECT_TURE` varchar(5) DEFAULT NULL COMMENT '正确选项',
  `ISSUE_PERSON` int(11) DEFAULT NULL COMMENT '分值',
  `ISSUE_TIME` varchar(32) DEFAULT NULL COMMENT '出题时间',
  PRIMARY KEY (`SUBJECTMANAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题库管理表';

-- 正在导出表  lxcadmin.tb_subjectmanage 的数据：~1 rows (大约)
DELETE FROM `tb_subjectmanage`;
/*!40000 ALTER TABLE `tb_subjectmanage` DISABLE KEYS */;
INSERT INTO `tb_subjectmanage` (`SUBJECTMANAGE_ID`, `SUBJECT_NAME`, `SUBJECT_TYPE`, `SELECT_A`, `SELECT_B`, `SELECT_C`, `SELECT_D`, `SELECT_E`, `SELECT_F`, `SELECT_TURE`, `ISSUE_PERSON`, `ISSUE_TIME`) VALUES
	('298625680fad4f0c870e20da7622d3c0', '什么是面向对象', 'dddd', 'A', 'B', 'C', 'D', 'E', 'F', 'B', 1, '2018-01-27');
/*!40000 ALTER TABLE `tb_subjectmanage` ENABLE KEYS */;

-- 导出  表 lxcadmin.weixin_command 结构
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE IF NOT EXISTS `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信指令表';

-- 正在导出表  lxcadmin.weixin_command 的数据：~5 rows (大约)
DELETE FROM `weixin_command`;
/*!40000 ALTER TABLE `weixin_command` DISABLE KEYS */;
INSERT INTO `weixin_command` (`COMMAND_ID`, `KEYWORD`, `COMMANDCODE`, `CREATETIME`, `STATUS`, `BZ`) VALUES
	('2636750f6978451b8330874c9be042c2', '锁定服务器', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', 1, '锁定计算机'),
	('46217c6d44354010823241ef484f7214', '打开浏览器', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', 1, '打开浏览器操作'),
	('576adcecce504bf3bb34c6b4da79a177', '关闭浏览器', 'taskkill /f /im iexplore.exe', '2015-05-09 02:36:48', 2, '关闭浏览器操作'),
	('854a157c6d99499493f4cc303674c01f', '关闭QQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', 1, '关闭QQ'),
	('ab3a8c6310ca4dc8b803ecc547e55ae7', '打开QQ', 'D:/SOFT/QQ/QQ/Bin/qq.exe', '2015-05-10 21:25:25', 1, '打开QQ');
/*!40000 ALTER TABLE `weixin_command` ENABLE KEYS */;

-- 导出  表 lxcadmin.weixin_imgmsg 结构
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE IF NOT EXISTS `weixin_imgmsg` (
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

-- 正在导出表  lxcadmin.weixin_imgmsg 的数据：~1 rows (大约)
DELETE FROM `weixin_imgmsg`;
/*!40000 ALTER TABLE `weixin_imgmsg` DISABLE KEYS */;
INSERT INTO `weixin_imgmsg` (`IMGMSG_ID`, `KEYWORD`, `CREATETIME`, `STATUS`, `BZ`, `TITLE1`, `DESCRIPTION1`, `IMGURL1`, `TOURL1`, `TITLE2`, `DESCRIPTION2`, `IMGURL2`, `TOURL2`, `TITLE3`, `DESCRIPTION3`, `IMGURL3`, `TOURL3`, `TITLE4`, `DESCRIPTION4`, `IMGURL4`, `TOURL4`, `TITLE5`, `DESCRIPTION5`, `IMGURL5`, `TOURL5`, `TITLE6`, `DESCRIPTION6`, `IMGURL6`, `TOURL6`, `TITLE7`, `DESCRIPTION7`, `IMGURL7`, `TOURL7`, `TITLE8`, `DESCRIPTION8`, `IMGURL8`, `TOURL8`) VALUES
	('380b2cb1f4954315b0e20618f7b5bd8f', '首页', '2015-05-10 20:51:09', 1, '图文回复', '图文回复标题', '图文回复描述', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'www.baidu.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
/*!40000 ALTER TABLE `weixin_imgmsg` ENABLE KEYS */;

-- 导出  表 lxcadmin.weixin_textmsg 结构
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE IF NOT EXISTS `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(2) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信文本消息表';

-- 正在导出表  lxcadmin.weixin_textmsg 的数据：~2 rows (大约)
DELETE FROM `weixin_textmsg`;
/*!40000 ALTER TABLE `weixin_textmsg` DISABLE KEYS */;
INSERT INTO `weixin_textmsg` (`TEXTMSG_ID`, `KEYWORD`, `CONTENT`, `CREATETIME`, `STATUS`, `BZ`) VALUES
	('695cd74779734231928a253107ab0eeb', '吃饭', '吃了噢噢噢噢', '2015-05-10 22:52:27', 1, '文本回复'),
	('d4738af7aea74a6ca1a5fb25a98f9acb', '关注', '这里是关注后回复的内容', '2015-05-11 02:12:36', 1, '关注回复');
/*!40000 ALTER TABLE `weixin_textmsg` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
