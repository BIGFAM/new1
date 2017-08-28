-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 08 月 28 日 02:27
-- 服务器版本: 5.6.12-log
-- PHP 版本: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `invoicing`
--
CREATE DATABASE IF NOT EXISTS `invoicing` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `invoicing`;

-- --------------------------------------------------------

--
-- 表的结构 `ci_account`
--

CREATE TABLE IF NOT EXISTS `ci_account` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `number` varchar(15) COLLATE utf8_unicode_ci DEFAULT '0',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `amount` double DEFAULT '0',
  `date` date DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `number` (`number`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ci_account`
--

INSERT INTO `ci_account` (`id`, `name`, `number`, `status`, `amount`, `date`, `type`, `isDelete`) VALUES
(1, '公司账户', '1', 1, 500000, '2017-07-12', 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_account_info`
--

CREATE TABLE IF NOT EXISTS `ci_account_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '客户ID',
  `billNo` varchar(25) DEFAULT '' COMMENT '销售单号',
  `billType` varchar(20) DEFAULT '',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `accId` int(11) DEFAULT '0' COMMENT '结算账户ID',
  `payment` double DEFAULT '0' COMMENT '收款金额  采购退回为正',
  `wayId` int(11) DEFAULT '0' COMMENT '结算方式ID',
  `settlement` varchar(50) DEFAULT '' COMMENT '结算号',
  `remark` varchar(50) DEFAULT '' COMMENT '备注',
  `transType` int(11) DEFAULT '0',
  `transTypeName` varchar(50) DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `billdate` (`billDate`) USING BTREE,
  KEY `iid` (`iid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `ci_account_info`
--

INSERT INTO `ci_account_info` (`id`, `iid`, `buId`, `billNo`, `billType`, `billDate`, `accId`, `payment`, `wayId`, `settlement`, `remark`, `transType`, `transTypeName`, `isDelete`) VALUES
(7, 2, 8, 'XS201707201353280', 'SALE', '2017-07-20', 1, 45800, 0, '', '', 150601, '普通销售', 0),
(10, 4, 8, 'XS201707241509264', 'SALE', '2017-07-24', 1, 1620, 0, '', '', 150601, '普通销售', 0),
(11, 1, 7, 'CG201707201351082', 'PUR', '2017-07-20', 1, -32500, 0, '', '', 150501, '普通采购', 0),
(13, 3, 9, 'CG201707241458329', 'PUR', '2017-07-24', 1, -650, 0, '', '', 150501, '普通采购', 0),
(14, 5, 9, 'CG201707281734457', 'PUR', '2017-07-28', 1, -33592, 0, '', '', 150501, '普通采购', 0),
(17, 7, 7, 'CG201707310957118', 'PUR', '2017-07-31', 1, -29500, 0, '', '', 150501, '普通采购', 0),
(21, 9, 7, 'CG201707311010221', 'PUR', '2017-07-31', 1, -9410, 0, '', '', 150501, '普通采购', 0),
(23, 11, 9, 'CG201707311034011', 'PUR', '2017-07-31', 1, -167346, 0, '', '', 150501, '普通采购', 0),
(26, 13, 7, 'CG201708020940071', 'PUR', '2017-08-02', 1, -6899, 0, '', '', 150501, '普通采购', 0),
(27, 14, 10, 'XS201708020941349', 'SALE', '2017-08-02', 1, 6899, 0, '', '', 150601, '普通销售', 0),
(28, 6, 10, 'XS201707281737467', 'SALE', '2017-07-28', 1, 33592, 0, '', '', 150601, '普通销售', 0),
(31, 10, 13, 'XS201707311018053', 'SALE', '2017-07-31', 1, 9410, 0, '', '', 150601, '普通销售', 0),
(32, 12, 12, 'XS201707311037066', 'SALE', '2017-07-31', 1, 167346, 0, '', '', 150601, '普通销售', 0),
(34, 8, 11, 'XS201707310958002', 'SALE', '2017-07-31', 1, 29500, 0, '', '', 150601, '普通销售', 0),
(35, 15, 14, 'CG201708021102174', 'PUR', '2017-08-02', 1, -85200, 0, '', '', 150501, '普通采购', 0),
(36, 16, 15, 'CG201708021104599', 'PUR', '2017-08-02', 1, -4750, 0, '', '', 150501, '普通采购', 0),
(37, 17, 16, 'XS201708021117341', 'SALE', '2017-08-02', 1, 5699, 0, '', '', 150601, '普通销售', 0),
(38, 18, 17, 'CG201708111549588', 'PUR', '2017-08-11', 1, -7180, 0, '', '', 150501, '普通采购', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_address`
--

CREATE TABLE IF NOT EXISTS `ci_address` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `shortName` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT ' ',
  `postalcode` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `province` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `area` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `address` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `linkman` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `isdefault` tinyint(1) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `pid` (`postalcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_admin`
--

CREATE TABLE IF NOT EXISTS `ci_admin` (
  `uid` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户名称',
  `userpwd` varchar(32) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '密码',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否锁定',
  `name` varchar(25) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `lever` text COLLATE utf8_unicode_ci COMMENT '权限',
  `roleid` tinyint(1) DEFAULT '1' COMMENT '角色ID',
  `rightids` varchar(255) COLLATE utf8_unicode_ci DEFAULT '1,2,4,8',
  `righttype1` text COLLATE utf8_unicode_ci,
  `righttype2` text COLLATE utf8_unicode_ci,
  `righttype3` text COLLATE utf8_unicode_ci,
  `righttype4` text COLLATE utf8_unicode_ci,
  `righttype8` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `ci_admin`
--

INSERT INTO `ci_admin` (`uid`, `username`, `userpwd`, `status`, `name`, `mobile`, `lever`, `roleid`, `rightids`, `righttype1`, `righttype2`, `righttype3`, `righttype4`, `righttype8`) VALUES
(1, 'admin', '93761ac02fe06abc278c4f509d0713d2', 1, '吴哲帆', '15521030223', NULL, 0, '', NULL, NULL, NULL, NULL, NULL),
(3, 'xudong', 'da5eac1c341ce4c2790e920c9d19e012', 1, '徐东', '15876535632', '1,2,3,4,5,85,86,87,106,107,108,109,110,111,11,12,13,99,112,113,114,115,116,117,124,125,126,127,128,198,199,129,130,131,132,133,200,201,134,135,136,137,138,139,140,141,142,143,14,100,101,102,15,16,17,144,145,146,147,148,179,196,197,149,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,18,103,104,105,19,20,21,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,202,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,91,92,6,10,7,8,88,89,9,90,63,64,65,66,67,93,94,68,69,70,71,72,95,96,73,74,75,76,77,78,79,80', 1, '1,2,4,8', NULL, NULL, NULL, NULL, NULL),
(4, 'xuxiaodong', 'da5eac1c341ce4c2790e920c9d19e012', 1, '徐晓东', '13580456738', '1,2,3,4,5,85,86,87,106,107,108,109,110,111,11,12,13,99,112,113,114,115,116,117,124,125,126,127,128,198,199,129,130,131,132,133,200,201,134,135,136,137,138,139,140,141,142,143,14,100,101,102,15,16,17,144,145,146,147,148,179,196,197,149,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,18,103,104,105,19,20,21,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,202,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,91,92,6,10,7,8,88,89,9,90,63,64,65,66,67,93,94,68,69,70,71,72,95,96,73,74,75,76,77,78,79,80', 1, '1,2,4,8', NULL, NULL, NULL, NULL, NULL),
(6, 'caiwu', 'c6bf36a47ef3b46cf776f9c3844b73a1', 1, '财务', '13588888888', '1,2,3,4,5,85,86,87,106,107,108,109,110,111,11,12,13,99,112,113,114,115,116,117,124,125,126,127,128,198,199,129,130,131,132,133,200,201,134,135,136,137,138,139,140,141,142,143,14,100,101,102,15,16,17,144,145,146,147,148,179,196,197,149,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,18,103,104,105,19,20,21,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,202,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,91,92,6,10,7,8,88,89,9,90,63,64,65,66,67,93,94,68,69,70,71,72,95,96,73,74,75,76,77,78,79,80', 1, '1,2,4,8', NULL, NULL, NULL, NULL, NULL),
(7, 'dingjunsheng', '02b7bac67a124c59d43bfb650eb9bc3d', 1, '丁俊盛', '18826256459', '1,2,3,4,5,85,86,87,11,12,13,99,151,152,153,154,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,22,23,24,25,26,27,28,29,30,40,41,42,43,44,45,46,47,48,58,59,60,61,62,91,92,6,10,7,8,88,89,9,90,63,64,65,66,67,93,94,68,69,70,71,72,95,96,73,74,75,76,77,78,79,80', 1, '1,2,4,8', NULL, NULL, NULL, NULL, NULL),
(8, 'pitianwu', '1a825e4472ee7ae7f5b37497679b2b70', 1, '皮天午', '13928956073', '1,2,3,4,5,85,86,87,11,12,13,99,151,152,153,154,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,22,23,24,25,26,27,28,29,30,40,41,42,43,44,45,46,47,48,58,59,60,61,62,91,92,6,10,7,8,88,89,9,90,63,64,65,66,67,93,94,68,69,70,71,72,95,96,73,74,75,76,77,78,79,80', 1, '1,2,4,8', NULL, NULL, NULL, NULL, NULL),
(9, 'linjianxin', '0c1bbce0d0cd9011eb6ed996c9d9bd8e', 1, '林健新', '13143589303', '1,2,3,4,5,85,86,87,11,12,13,99,151,152,153,154,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,22,23,24,25,26,27,28,29,30,40,41,42,43,44,45,46,47,48,58,59,60,61,62,91,92,6,10,7,8,88,89,9,90,63,64,65,66,67,93,94,68,69,70,71,72,95,96,73,74,75,76,77,78,79,80', 1, '1,2,4,8', NULL, NULL, NULL, NULL, NULL),
(10, 'yangqingyun', '2126ccabb2546311d0d5731d0f63f797', 1, '杨清云', '13126430494', '1,2,3,4,5,85,86,87,11,12,13,99,151,152,153,154,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,22,23,24,25,26,27,28,29,30,40,41,42,43,44,45,46,47,48,58,59,60,61,62,91,92,6,10,7,8,88,89,9,90,63,64,65,66,67,93,94,68,69,70,71,72,95,96,73,74,75,76,77,78,79,80', 1, '1,2,4,8', NULL, NULL, NULL, NULL, NULL),
(11, 'liguicheng', '3ebede2637a65ee0a3d131ef1606732e', 1, '黎规城', '13544569537', '1,2,3,4,5,85,86,87,11,12,13,99,151,152,153,154,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,22,23,24,25,26,27,28,29,30,40,41,42,43,44,45,46,47,48,58,59,60,61,62,91,92,6,10,7,8,88,89,9,90,63,64,65,66,67,93,94,68,69,70,71,72,95,96,73,74,75,76,77,78,79,80', 1, '1,2,4,8', NULL, NULL, NULL, NULL, NULL),
(12, 'zhangyuli', '5abd06d6f6ef0e022e11b8a41f57ebda', 1, '张玉莉', '13824423242', '1,2,3,4,5,85,86,87,11,12,13,99,151,152,153,154,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,22,23,24,25,26,27,28,29,30,40,41,42,43,44,45,46,47,48,58,59,60,61,62,91,92,6,10,7,8,88,89,9,90,63,64,65,66,67,93,94,68,69,70,71,72,95,96,73,74,75,76,77,78,79,80', 1, '1,2,4,8', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ci_assistingprop`
--

CREATE TABLE IF NOT EXISTS `ci_assistingprop` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `disable` tinyint(1) DEFAULT '0' COMMENT '状态',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_assistsku`
--

CREATE TABLE IF NOT EXISTS `ci_assistsku` (
  `skuId` int(11) NOT NULL AUTO_INCREMENT,
  `skuClassId` int(11) DEFAULT '0',
  `skuAssistId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skuName` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`skuId`),
  KEY `id` (`skuClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_category`
--

CREATE TABLE IF NOT EXISTS `ci_category` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `parentId` smallint(6) DEFAULT '0' COMMENT '上级栏目ID',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目路径',
  `level` tinyint(2) DEFAULT '1' COMMENT '层次',
  `ordnum` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `typeNumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '区别',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `detail` tinyint(4) DEFAULT '1',
  `sortIndex` smallint(6) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parentId` (`parentId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- 转存表中的数据 `ci_category`
--

INSERT INTO `ci_category` (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `status`, `typeNumber`, `remark`, `detail`, `sortIndex`, `isDelete`) VALUES
(1, '办公设备', 30, '30,1', 2, 0, 1, 'trade', '', 1, 0, 0),
(3, '测试结算方式1', 0, '', 1, 0, 1, 'PayMethod', '', 1, 0, 0),
(4, '测试结算方式2', 0, '', 1, 0, 1, 'PayMethod', '', 1, 0, 0),
(5, '政府单位', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0),
(6, '电脑供应商', 0, '', 1, 0, 1, 'supplytype', '', 1, 0, 0),
(7, '笔记本电脑', 1, '30,1,7', 3, 0, 1, 'trade', '', 1, 0, 0),
(8, '电汇', 0, '', 1, 0, 1, 'paccttype', '', 1, 0, 0),
(9, '电汇', 0, '', 1, 0, 1, 'raccttype', '', 1, 0, 0),
(10, '打印机', 1, '30,1,10', 3, 0, 1, 'trade', '', 1, 0, 0),
(11, '台式电脑', 1, '30,1,11', 3, 0, 1, 'trade', '', 1, 0, 0),
(12, '打印机供应商', 0, '', 1, 0, 1, 'supplytype', '', 1, 0, 0),
(13, '学校', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0),
(14, '商城过单', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0),
(15, '医院', 0, '', 1, 0, 1, 'customertype', '', 1, 0, 0),
(17, '集成类供应商', 0, '', 1, 0, 1, 'supplytype', '', 1, 0, 0),
(18, '复合机', 1, '30,1,18', 3, 0, 1, 'trade', '', 1, 0, 0),
(19, '办公耗材', 30, '30,19', 2, 0, 1, 'trade', '', 1, 0, 0),
(20, '硒鼓墨盒', 19, '30,19,20', 3, 0, 1, 'trade', '', 1, 0, 0),
(21, '耗材供应商', 0, '', 1, 0, 1, 'supplytype', '', 1, 0, 0),
(23, '过单设备', 42, '42,23', 2, 0, 1, 'trade', '', 1, 0, 0),
(24, '过单耗材', 42, '42,24', 2, 0, 1, 'trade', '', 1, 0, 0),
(25, '打印机', 23, '42,23,25', 3, 0, 1, 'trade', '', 1, 0, 0),
(26, '台式电脑', 23, '42,23,26', 3, 0, 1, 'trade', '', 1, 0, 0),
(27, '笔记本电脑', 23, '42,23,27', 3, 0, 1, 'trade', '', 1, 0, 0),
(28, '复合机', 23, '42,23,28', 3, 0, 1, 'trade', '', 1, 0, 0),
(29, '硒鼓墨盒', 24, '42,24,29', 3, 0, 1, 'trade', '', 1, 0, 0),
(30, '直单专用★', 0, '30', 1, 0, 1, 'trade', '', 1, 0, 0),
(31, '过单摄像设备', 42, '42,31', 2, 0, 1, 'trade', '', 1, 0, 0),
(32, '数码相机', 31, '42,31,32', 3, 0, 1, 'trade', '', 1, 0, 0),
(33, '单反', 31, '42,31,33', 3, 0, 1, 'trade', '', 1, 0, 0),
(34, '微单', 31, '42,31,34', 3, 0, 1, 'trade', '', 1, 0, 0),
(35, '摄像配件', 31, '42,31,35', 3, 0, 1, 'trade', '', 1, 0, 0),
(36, '摄像设备', 30, '30,36', 2, 0, 1, 'trade', '', 1, 0, 0),
(37, '数码相机', 36, '30,36,37', 3, 0, 1, 'trade', '', 1, 0, 0),
(38, '单反', 36, '30,36,38', 3, 0, 1, 'trade', '', 1, 0, 0),
(39, '微单', 36, '30,36,39', 3, 0, 1, 'trade', '', 1, 0, 0),
(40, '摄像配件', 36, '30,36,40', 3, 0, 1, 'trade', '', 1, 0, 0),
(41, '复印机', 23, '42,23,41', 3, 0, 1, 'trade', '', 1, 0, 0),
(42, '过单专用△', 0, '42', 1, 0, 1, 'trade', '', 1, 0, 0),
(45, '打印纸', 24, '42,24,45', 3, 0, 1, 'trade', '', 1, 0, 0),
(46, '摄像机', 31, '42,31,46', 3, 0, 1, 'trade', '', 1, 0, 0),
(47, '销毁设备', 23, '42,23,47', 3, 0, 1, 'trade', '', 1, 0, 0),
(48, '多功能一体机', 23, '42,23,48', 3, 0, 1, 'trade', '', 1, 0, 0),
(49, '过单系统软件', 42, '42,49', 2, 0, 1, 'trade', '', 1, 0, 0),
(50, '操作系统', 49, '42,49,50', 3, 0, 1, 'trade', '', 1, 0, 0),
(51, '办公软件', 49, '42,49,51', 3, 0, 1, 'trade', '', 1, 0, 0),
(52, '触控一体机', 1, '30,1,52', 3, 0, 1, 'trade', '', 1, 0, 0),
(53, '平板电脑', 23, '42,23,53', 3, 0, 1, 'trade', '', 1, 0, 0),
(54, '触控一体机', 23, '42,23,54', 3, 0, 1, 'trade', '', 1, 0, 0),
(55, '空调冰箱应商', 0, '', 1, 0, 1, 'supplytype', '', 1, 0, 0),
(56, '空调冰箱家用电器', 30, '30,56', 2, 0, 1, 'trade', '', 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_contact`
--

CREATE TABLE IF NOT EXISTS `ci_contact` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '客户名称',
  `number` varchar(50) DEFAULT '0' COMMENT '客户编号',
  `cCategory` smallint(6) DEFAULT '0' COMMENT '客户类别',
  `cCategoryName` varchar(50) DEFAULT '' COMMENT '分类名称',
  `taxRate` double DEFAULT '0' COMMENT '税率',
  `amount` double DEFAULT '0' COMMENT '期初应付款',
  `periodMoney` double DEFAULT '0' COMMENT '期初预付款',
  `difMoney` double DEFAULT '0' COMMENT '初期往来余额',
  `beginDate` date DEFAULT NULL COMMENT '余额日期',
  `remark` varchar(100) DEFAULT '' COMMENT '备注',
  `linkMans` text COMMENT '客户联系方式',
  `type` tinyint(1) DEFAULT '-10' COMMENT '-10客户  10供应商',
  `contact` varchar(255) DEFAULT '',
  `cLevel` smallint(5) DEFAULT '1' COMMENT '客户等级ID',
  `cLevelName` varchar(50) DEFAULT '' COMMENT '客户等级',
  `pinYin` varchar(50) DEFAULT '',
  `disable` tinyint(1) DEFAULT '0' COMMENT '0启用   1禁用',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '0正常 1删除',
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `ci_contact`
--

INSERT INTO `ci_contact` (`id`, `name`, `number`, `cCategory`, `cCategoryName`, `taxRate`, `amount`, `periodMoney`, `difMoney`, `beginDate`, `remark`, `linkMans`, `type`, `contact`, `cLevel`, `cLevelName`, `pinYin`, `disable`, `isDelete`) VALUES
(1, '康志', '100', 5, '001', 0, 1, 1, 0, '2015-10-01', '', '[{"linkName":"1","linkMobile":"","linkPhone":"","linkIm":"","linkFirst":1,"id":0}]', -10, '', 0, '零售客户', '', 0, 1),
(2, '中国共产党广州市越秀区委员会老干部局', '2', 5, '政府单位', 0, 0, 0, 0, '2015-10-01', '123123333333333311111', '[]', -10, '', 0, '零售客户', '', 0, 0),
(3, '测试供应商1', '111', 6, '供应商类别测试1', 0, 11, 111, -100, '0000-00-00', '', '[{"linkName":"某联系人","linkMobile":"11","linkPhone":"11","linkIm":"11","linkFirst":1,"id":0}]', 10, '', 1, '', '', 0, 1),
(4, '广佳过单', '1', 14, '商城过单', 0, 0, 0, 0, NULL, '', '[]', -10, '', 1, '零售客户', '', 0, 0),
(5, '广州市双敏电子产品有限公司', '1', 12, '打印机供应商', 0, 0, 0, 0, NULL, '', '[]', 10, '', 1, '', '', 0, 0),
(6, '广州爱联科技有限公司', '2', 6, '电脑供应商', 0, 0, 0, 0, NULL, '', '[]', 10, '', 1, '', '', 0, 0),
(7, '广州市广佳办公设备服务有限公司', '3', 17, '集成类供应商', 0, 0, 0, 0, NULL, '', '[{"linkName":"巫少端","linkMobile":"13312817741","linkPhone":"020-81083551","linkIm":"413701851","linkFirst":1,"id":0}]', 10, '', 1, '', '', 0, 0),
(8, '广州市海珠区房屋安全和物业二所', '3', 5, '政府单位', 0, 0, 0, 0, NULL, '', '[]', -10, '', 1, '零售客户', '', 0, 0),
(9, '广东原色科技有限公司', '4', 21, '耗材供应商', 0, 0, 0, 0, NULL, '', '[]', 10, '', 1, '', '', 0, 0),
(10, '广州市黄浦区人民政府荔联街道办事处', '4', 5, '政府单位', 0, 0, 0, 0, NULL, '', '[]', -10, '', 1, '零售客户', '', 0, 0),
(11, '广州市人民政府办公厅', '5', 5, '政府单位', 0, 0, 0, 0, NULL, '', '[]', -10, '', 1, '零售客户', '', 0, 0),
(12, '广州市黄埔区人民政府黄埔街道办事处', '6', 5, '政府单位', 0, 0, 0, 0, NULL, '', '[]', -10, '', 1, '零售客户', '', 0, 0),
(13, '广州市司法局', '7', 5, '政府单位', 0, 0, 0, 0, NULL, '', '[]', -10, '', 1, '零售客户', '', 0, 0),
(14, '深圳市鸿合创新信息技术有限责任公司', '5', 17, '集成类供应商', 0, 0, 0, 0, NULL, '', '[]', 10, '', 1, '', '', 0, 0),
(15, '广州上乘信息科技有限公司', '6', 6, '电脑供应商', 0, 0, 0, 0, NULL, '', '[]', 10, '', 1, '', '', 0, 0),
(16, '广州市花都区文化广电新闻出版局', '8', 5, '政府单位', 0, 0, 0, 0, NULL, '', '[]', -10, '', 1, '零售客户', '', 0, 0),
(17, '广州精海电子科技有限公司', '7', 17, '集成类供应商', 0, 0, 0, 0, NULL, '', '[{"linkName":"王国相","linkMobile":"","linkPhone":"87500648","linkIm":"","linkFirst":1,"id":0}]', 10, '', 1, '', '', 0, 0),
(18, '广州市越秀区文化广电新闻出版局', '9', 5, '政府单位', 0, 0, 0, 0, NULL, '', '[]', -10, '', 1, '零售客户', '', 0, 0),
(19, '广州市潭岗强制隔离戒毒所', '10', 5, '政府单位', 0, 0, 0, 0, NULL, '', '[]', -10, '', 1, '零售客户', '', 0, 0),
(20, '广州市东奔电器有限公司', '8', 17, '集成类供应商', 0, 0, 0, 0, NULL, '', '[]', 10, '', 1, '', '', 0, 0),
(21, '广州市光彩事业指导中心', '11', 5, '政府单位', 0, 0, 0, 0, NULL, '', '[]', -10, '', 1, '零售客户', '', 0, 0),
(22, '广州医科大学附属口腔医院(广州医科大学羊城医院)', '12', 15, '医院', 0, 0, 0, 0, NULL, '', '[]', -10, '', 1, '零售客户', '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_contract_img`
--

CREATE TABLE IF NOT EXISTS `ci_contract_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  `invId` varchar(100) DEFAULT '0',
  `type` varchar(100) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `thumbnailUrl` varchar(255) DEFAULT '',
  `size` int(11) DEFAULT '0',
  `deleteUrl` varchar(255) DEFAULT '',
  `deleteType` varchar(50) DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  PRIMARY KEY (`id`),
  KEY `invId` (`invId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `ci_contract_img`
--

INSERT INTO `ci_contract_img` (`id`, `name`, `invId`, `type`, `url`, `thumbnailUrl`, `size`, `deleteUrl`, `deleteType`, `isDelete`, `billNo`) VALUES
(1, '201706300954073281.jpg', 'asd', 'image/jpeg', 'http://localhost/Invoicing/data/upfile/contract/201706300954073281.jpg', 'http://localhost/Invoicing/data/upfile/contract/thumbnail/201706300954073281.jpg', 38237, '', '', 1, ''),
(2, '201706300954478757.jpg', 'asd', 'image/jpeg', 'http://localhost/Invoicing/data/upfile/contract/201706300954478757.jpg', 'http://localhost/Invoicing/data/upfile/contract/thumbnail/201706300954478757.jpg', 129256, '', '', 1, ''),
(3, '201706301011401167.jpg', 'asd', 'image/jpeg', 'http://localhost/Invoicing/data/upfile/contract/201706301011401167.jpg', '', 56394, '', '', 1, ''),
(19, '201707121114339744.png', 'CG201707121333443', 'image/png', 'http://localhost/Invoicing/data/upfile/contract/201707121114339744.png', 'http://localhost/Invoicing/data/upfile/contract/thumbnail/201707121114339744.png', 111854, '', '', 0, ''),
(20, '201707121335463000.jpg', 'CG201707121336090', 'image/jpeg', 'http://localhost/Invoicing/data/upfile/contract/201707121335463000.jpg', 'http://localhost/Invoicing/data/upfile/contract/thumbnail/201707121335463000.jpg', 44554, '', '', 0, ''),
(21, '201707211055488781.jpg', 'XS201707201353280', 'image/jpeg', 'http://192.168.0.122:8088/invoicing721/data/upfile/contract/201707211055488781.jpg', 'http://192.168.0.122:8088/invoicing721/data/upfile/contract/thumbnail/201707211055488781.jpg', 24388, '', '', 0, ''),
(22, '201708021110343134.pdf', 'CG201708021102174', 'application/pdf', 'http://192.168.0.126/invoicing728/data/upfile/contract/201708021110343134.pdf', '', 203741, '', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ci_goods`
--

CREATE TABLE IF NOT EXISTS `ci_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '商品编号',
  `quantity` double DEFAULT '0' COMMENT '起初数量',
  `spec` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '规格',
  `baseUnitId` smallint(6) DEFAULT '0' COMMENT '单位ID',
  `unitName` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单位名称',
  `categoryId` smallint(6) DEFAULT '0' COMMENT '商品分类ID',
  `categoryName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '分类名称',
  `purPrice` double DEFAULT '0' COMMENT '预计采购价',
  `salePrice` double DEFAULT '0' COMMENT '预计销售价',
  `unitCost` double DEFAULT '0' COMMENT '单位成本',
  `amount` double DEFAULT '0' COMMENT '期初总价',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `goods` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `propertys` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '初期设置',
  `vipPrice` double DEFAULT '0' COMMENT '会员价',
  `lowQty` double DEFAULT '0',
  `length` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `height` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `highQty` double DEFAULT '0',
  `isSerNum` double DEFAULT '0',
  `barCode` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `discountRate1` double DEFAULT '0' COMMENT '0',
  `discountRate2` double DEFAULT '0',
  `locationId` int(11) DEFAULT '0',
  `locationName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `wholesalePrice` double DEFAULT '0',
  `width` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `skuAssistId` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '辅助属性分类',
  `pinYin` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `unitId` smallint(6) DEFAULT '0',
  `files` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '图片路径',
  `disable` tinyint(1) DEFAULT '0' COMMENT '0启用   1禁用',
  `unitTypeId` int(11) DEFAULT '0',
  `assistIds` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `assistName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `assistUnit` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `jianxing` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `josl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `skuClassId` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `property` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `safeDays` double DEFAULT '0',
  `advanceDay` double DEFAULT '0',
  `isWarranty` double DEFAULT '0',
  `delete` int(11) DEFAULT '0',
  `weight` double DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '0正常  1删除',
  `warehouseWarning` text,
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- 转存表中的数据 `ci_goods`
--

INSERT INTO `ci_goods` (`id`, `name`, `number`, `quantity`, `spec`, `baseUnitId`, `unitName`, `categoryId`, `categoryName`, `purPrice`, `salePrice`, `unitCost`, `amount`, `remark`, `status`, `goods`, `propertys`, `vipPrice`, `lowQty`, `length`, `height`, `highQty`, `isSerNum`, `barCode`, `discountRate1`, `discountRate2`, `locationId`, `locationName`, `wholesalePrice`, `width`, `skuAssistId`, `pinYin`, `unitId`, `files`, `disable`, `unitTypeId`, `assistIds`, `assistName`, `assistUnit`, `jianxing`, `josl`, `skuClassId`, `property`, `safeDays`, `advanceDay`, `isWarranty`, `delete`, `weight`, `isDelete`, `warehouseWarning`) VALUES
(6, '(32500)佳能彩色彩色数码中速复合机智简iR-ADV C3330', '4', 0, NULL, 6, '台', 18, '复合机', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '(32500)jncscssmzsfhjzjiR-ADV C3330', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(7, '(650)佳能 NPG-67 BK墨粉', '5', 0, NULL, 9, '盒', 20, '硒鼓墨盒', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '(650)jn NPG-67 BKmf', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(8, '(155)佳能 NPG-28碳粉', '6', 0, NULL, 9, '盒', 20, '硒鼓墨盒', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '(155)jn NPG-28tf', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(9, '<2199>佳能powershot SX620 HS数码相机', '7', 0, NULL, 6, '台', 32, '数码相机', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<2199>jnpowershot SX620 HSsmxj', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(10, '<5999>华硕P453UJ62084DS2笔记本电脑', '8', 0, NULL, 6, '台', 27, '笔记本电脑', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<5999>hsP453UJ62084DS2bjbdn', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(11, '<5999>华硕D520MT-156500台式电脑', '9', 0, NULL, 6, '台', 26, '台式电脑', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<5999>hsD520MT-156500tsdn', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(12, '<4499>华硕D520MT台式电脑', '10', 0, NULL, 6, '台', 26, '台式电脑', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<4499>hsD520MTtsdn', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(13, '<29500>富士施乐（FujiXerox）DocuCentre-V C2265 CPS 2T A3', '11', 0, NULL, 6, '台', 41, '复印机', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<29500>fsslFujiXeroxDocuCentre-V C2265 CPS 2T A3csfyjg', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(14, '<135>施乐（Xerox）捷印复印纸 80g A4（5包一箱）', '12', 0, NULL, 10, '箱', 45, '打印纸', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<135>slXeroxjyfyz 80g A45byx', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(15, '<500>佳能 CRG-328 硒鼓', '13', 0, NULL, 9, '盒', 29, '硒鼓墨盒', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<500>jn CRG-328 xg', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(16, '<1580>惠普 507A CE401A 青色原装硒鼓', '14', 0, NULL, 9, '盒', 29, '硒鼓墨盒', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<1580>hp 507A CE401A qsyzxg', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(17, '<1280>惠普 507A CE400A 黑色原装硒鼓', '15', 0, NULL, 9, '盒', 29, '硒鼓墨盒', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<1280>hp 507A CE400A hsyzxg', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(18, '<480>惠普 88A 原装硒鼓', '16', 0, NULL, 9, '盒', 29, '硒鼓墨盒', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<480>hp 88A yzxg', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(19, '<750>惠普 53A 黑色硒鼓（Q7553A）', '17', 0, NULL, 9, '盒', 29, '硒鼓墨盒', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<750>hp 53A hsxgQ7553A', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(20, '<7900>索尼（SONY）FDR-AX40 摄像机（64G高速内存卡+摄像包）', '18', 0, NULL, 6, '台', 46, '摄像机', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<7900>snSONYFDR-AX40 sxj64Ggsnck+sxb', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(21, '<4999>索尼 ILCE-6000L 数码微单相机（配16-50镜头）', '19', 0, NULL, 6, '台', 34, '微单', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<4999>sn ILCE-6000L smwdxjp16-50jt', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(22, '<19999>佳能 EOS 5DS 数码单反相机（EF 24-105mm f/4L IS USM 镜', '20', 0, NULL, 6, '台', 33, '单反', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<19999>jn EOS 5DS smdfxjEF 24-105mm f/4L IS USM jt ', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(23, '<1999>三木碎纸机MSD9620（刀具终生保修）', '21', 0, NULL, 6, '台', 47, '销毁设备', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<1999>smszjMSD9620djzsbx', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(24, '<29700>佳能IR2525I复印机（配内置式装订器-B1，50页自动角落装订，两点装订，双纸盒，', '22', 0, NULL, 6, '台', 41, '复印机', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<29700>jnIR2525Ifyjpnzszdq-B150yzdjlzdldzdszhgzt', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(25, '<2890>佳能（Canon）LBP6230dn激光打印机（3年上门服务）', '23', 0, NULL, 6, '台', 25, '打印机', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<2890>jnCanonLBP6230dnjgdyj3nsmfw', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(26, '<5800>佳能MF412DN一体机', '24', 0, NULL, 6, '台', 48, '多功能一体机', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<5800>jnMF412DNytj', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(27, '<5900>HP Color LaserJet Pro MFP M277dw 彩色激光一体机（三年上', '25', 0, NULL, 6, '台', 48, '多功能一体机', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<5900>HP Color LaserJet Pro MFP M277dw csjgytjsnsmfw', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(28, '<5999>惠普（HP）ProDesk 480 G3 台式机电脑（I5-6500 8G 128G+1', '26', 0, NULL, 6, '台', 26, '台式电脑', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<5999>hpHPProDesk 480 G3 tsjdnI5-6500 8G 128G+1000G 2GdlxkDVDRW wxt dkhyxfw snbx 21.5cxsq+jpsb', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(29, '<5999>惠普（HP）PROBOOK 430 G3 13.3寸笔记本（i5-6200u 4G 12', '27', 0, NULL, 6, '台', 27, '笔记本电脑', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<5999>hpHPPROBOOK 430 G3 13.3cbjbi5-6200u 4G 128G+1TB jx DOS', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(30, '<4999>联想启天M410-D002 i5-6500/4G/1T/集显/DVDRW/DOS/19.', '28', 0, NULL, 6, '台', 26, '台式电脑', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<4999>lxqtM410-D002 i5-6500/4G/1T/jx/DVDRW/DOS/19.5', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(31, '<1900>三木 MSD9520 碎纸机', '29', 0, NULL, 6, '台', 47, '销毁设备', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<1900>sm MSD9520 szj', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(32, '<11800>交互书写屏HD-I757VE', '30', 0, NULL, 6, '台', 54, '触控一体机', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<11800>jhsxpHD-I757VE', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(33, '<2200>OPS电脑HO-361', '31', 0, NULL, 6, '台', 11, '台式电脑', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<2200>OPSdnHO-361', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(34, '<100>操作系统WIN10', '32', 0, NULL, 8, '套', 50, '操作系统', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<100>czxtWIN10', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(35, '<100>办公软件OFFICE', '33', 0, NULL, 8, '套', 51, '办公软件', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<100>bgrjOFFICE', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(36, '<0>资源软件 人教版', '34', 0, NULL, 8, '套', 51, '办公软件', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<0>zyrj rjb', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(37, '<4750>华为平板电脑matebook M3 4G 128G 金色+键盘', '35', 0, NULL, 6, '台', 1, '办公设备', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<4750>hwpbdnmatebook M3 4G 128G js+jp', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(38, '(650)硒鼓CF228A', '36', 0, NULL, 7, '个', 20, '硒鼓墨盒', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '(650)xgCF228A', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(39, '(1630)惠普M403d', '37', 0, NULL, 6, '台', 10, '打印机', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '(1630)hpM403d', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(40, '(2450)惠普M252dw', '38', 0, NULL, 6, '台', 10, '打印机', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '(2450)hpM252dw', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(41, '<2699>惠普M226DN黑白双面一体机', '39', 0, NULL, 6, '台', 25, '打印机', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<2699>hpM226DNhbsmytj', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(42, '<295>罗技 C525 高清摄像头', '40', 0, NULL, 7, '个', 35, '摄像配件', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<295>lj C525 gqsxt', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(43, '<1600>华旭 HX-FDX3S 身份证阅读器', '41', 0, NULL, 7, '个', 23, '过单设备', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<1600>hx HX-FDX3S sfzydq', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(44, '<2899>惠普HP Color LaserJet Pro M252dw 彩色双面网络激光打印机', '42', 0, NULL, 6, '台', 25, '打印机', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<2899>hpHP Color LaserJet Pro M252dw cssmwljgdyj', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(45, '<2980>惠普黑白激光打印机 M403D 三年服务', '43', 0, NULL, 6, '台', 25, '打印机', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<2980>hphbjgdyj M403D snfw', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(46, '<619>闪迪（SanDisk）至尊高速（CZ48） 256GB USB3.0 U盘', '44', 0, NULL, 7, '个', 23, '过单设备', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '<619>sdSanDiskzzgsCZ48 256GB USB3.0 Up', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(47, '(3560)HP/惠普 Color LaserJet Pro M452dn', '45', 0, NULL, 6, '台', 10, '打印机', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '(3560)HP/hp Color LaserJet Pro M452dn', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(48, '(2960)海尔 厨房操作台 冰柜 SP-330C2', '46', 0, NULL, 6, '台', 56, '空调冰箱家用电器', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '(2960)he cfczt bg SP-330C2', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL),
(49, '(2024)海尔空调 大1匹 挂机 定频单冷 KF-26GW/06NCA12', '47', 0, NULL, 6, '台', 56, '空调冰箱家用电器', 0, 0, 0, 0, NULL, 1, '', NULL, 0, 0, '', '', 0, 0, NULL, 0, 0, 1, '公司仓库', 0, '', NULL, '(2024)hekd d1p gj dpdl KF-26GW/06NCA12', 0, NULL, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ci_goods_img`
--

CREATE TABLE IF NOT EXISTS `ci_goods_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  `invId` int(11) DEFAULT '0',
  `type` varchar(100) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `thumbnailUrl` varchar(255) DEFAULT '',
  `size` int(11) DEFAULT '0',
  `deleteUrl` varchar(255) DEFAULT '',
  `deleteType` varchar(50) DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `invId` (`invId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `ci_goods_img`
--

INSERT INTO `ci_goods_img` (`id`, `name`, `invId`, `type`, `url`, `thumbnailUrl`, `size`, `deleteUrl`, `deleteType`, `isDelete`) VALUES
(1, '201706231444203945.jpg', 3, 'image/jpeg', 'http://localhost/Invoicing/data/upfile/goods/201706231444203945.jpg', 'http://localhost/Invoicing/data/upfile/goods/thumbnail/201706231444203945.jpg', 43440, '', '', 1),
(2, '201706231448494953.jpg', 2, 'image/jpeg', 'http://localhost/Invoicing/data/upfile/goods/201706231448494953.jpg', 'http://localhost/Invoicing/data/upfile/goods/thumbnail/201706231448494953.jpg', 89580, '', '', 0),
(3, '201706231721463378.jpg', 3, 'image/jpeg', 'http://localhost/Invoicing/data/upfile/goods/201706231721463378.jpg', 'http://localhost/Invoicing/data/upfile/goods/thumbnail/201706231721463378.jpg', 42027, '', '', 1),
(4, '201706261015193401.jpg', 3, 'image/jpeg', 'http://localhost/Invoicing/data/upfile/goods/201706261015193401.jpg', 'http://localhost/Invoicing/data/upfile/goods/thumbnail/201706261015193401.jpg', 70751, '', '', 1),
(5, '201706261650281041.jpg', 3, 'image/jpeg', 'http://localhost/Invoicing/data/upfile/goods/201706261650281041.jpg', 'http://localhost/Invoicing/data/upfile/goods/thumbnail/201706261650281041.jpg', 109839, '', '', 1),
(6, '201706261651465361.jpg', 3, 'image/jpeg', 'http://localhost/Invoicing/data/upfile/goods/201706261651465361.jpg', 'http://localhost/Invoicing/data/upfile/goods/thumbnail/201706261651465361.jpg', 34518, '', '', 1),
(7, '201706291447205686.jpg', 0, 'image/jpeg', 'http://localhost/Invoicing/data/upfile/goods/201706291447205686.jpg', 'http://localhost/Invoicing/data/upfile/goods/thumbnail/201706291447205686.jpg', 48482, '', '', 0),
(8, '201706291447352229.jpg', 0, 'image/jpeg', 'http://localhost/Invoicing/data/upfile/goods/201706291447352229.jpg', '', 56394, '', '', 0),
(9, '201706291504341747.jpg', 0, 'image/jpeg', 'http://localhost/Invoicing/data/upfile/goods/201706291504341747.jpg', 'http://localhost/Invoicing/data/upfile/goods/thumbnail/201706291504341747.jpg', 213354, '', '', 0),
(10, '201706300932131862.jpg', 3, 'image/jpeg', 'http://localhost/Invoicing/data/upfile/goods/201706300932131862.jpg', 'http://localhost/Invoicing/data/upfile/goods/thumbnail/201706300932131862.jpg', 18960, '', '', 1),
(11, '201706300934243860.jpg', 3, 'image/jpeg', 'http://localhost/Invoicing/data/upfile/goods/201706300934243860.jpg', 'http://localhost/Invoicing/data/upfile/goods/thumbnail/201706300934243860.jpg', 25395, '', '', 1),
(12, '201706300944083728.png', 3, 'image/png', 'http://localhost/Invoicing/data/upfile/goods/201706300944083728.png', 'http://localhost/Invoicing/data/upfile/goods/thumbnail/201706300944083728.png', 126528, '', '', 1),
(13, '201706300945267814.jpg', 3, 'image/jpeg', 'http://localhost/Invoicing/data/upfile/goods/201706300945267814.jpg', 'http://localhost/Invoicing/data/upfile/goods/thumbnail/201706300945267814.jpg', 23543, '', '', 0),
(14, '201706300947433304.jpg', 0, 'image/jpeg', 'http://localhost/Invoicing/data/upfile/goods/201706300947433304.jpg', 'http://localhost/Invoicing/data/upfile/goods/thumbnail/201706300947433304.jpg', 14821, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_invoice`
--

CREATE TABLE IF NOT EXISTS `ci_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `uid` smallint(6) DEFAULT '0',
  `userName` varchar(50) DEFAULT '' COMMENT '制单人',
  `transType` int(11) DEFAULT '0' COMMENT '150501购货 150502退货 150601销售 150602退销 150706其他入库',
  `totalAmount` double DEFAULT '0' COMMENT '购货总金额',
  `amount` double DEFAULT '0' COMMENT '折扣后金额',
  `rpAmount` double DEFAULT '0' COMMENT '本次付款',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(100) DEFAULT '' COMMENT '备注',
  `arrears` double DEFAULT '0' COMMENT '本次欠款',
  `disRate` double DEFAULT '0' COMMENT '折扣率',
  `disAmount` double DEFAULT '0' COMMENT '折扣金额',
  `totalQty` double DEFAULT '0' COMMENT '总数量',
  `totalArrears` double DEFAULT '0',
  `billStatus` tinyint(1) DEFAULT '0' COMMENT '订单状态 ',
  `checkName` varchar(50) DEFAULT '' COMMENT '采购单审核人',
  `totalTax` double DEFAULT '0',
  `totalTaxAmount` double DEFAULT '0',
  `checked` tinyint(1) DEFAULT '0' COMMENT '采购单状态',
  `accId` tinyint(4) DEFAULT '0' COMMENT '结算账户ID',
  `billType` varchar(20) DEFAULT '' COMMENT 'PO采购订单 OI其他入库 PUR采购入库 BAL初期余额',
  `modifyTime` datetime DEFAULT NULL COMMENT '更新时间',
  `hxStateCode` tinyint(4) DEFAULT '0' COMMENT '0未付款  1部分付款  2全部付款',
  `transTypeName` varchar(20) DEFAULT '',
  `totalDiscount` double DEFAULT '0',
  `salesId` smallint(6) DEFAULT '0' COMMENT '销售人员ID',
  `customerFree` double DEFAULT '0' COMMENT '客户承担费用',
  `hxAmount` double DEFAULT '0' COMMENT '本次核销金额',
  `hasCheck` double DEFAULT '0' COMMENT '已核销',
  `notCheck` double DEFAULT '0' COMMENT '未核销',
  `nowCheck` double DEFAULT '0' COMMENT '本次核销',
  `payment` double DEFAULT '0' COMMENT '本次预收款',
  `discount` double DEFAULT '0' COMMENT '整单折扣',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除  0正常',
  `srcOrderId` int(11) DEFAULT '0',
  `srcOrderNo` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `accId` (`accId`),
  KEY `buId` (`buId`),
  KEY `salesId` (`salesId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `ci_invoice`
--

INSERT INTO `ci_invoice` (`id`, `buId`, `billNo`, `uid`, `userName`, `transType`, `totalAmount`, `amount`, `rpAmount`, `billDate`, `description`, `arrears`, `disRate`, `disAmount`, `totalQty`, `totalArrears`, `billStatus`, `checkName`, `totalTax`, `totalTaxAmount`, `checked`, `accId`, `billType`, `modifyTime`, `hxStateCode`, `transTypeName`, `totalDiscount`, `salesId`, `customerFree`, `hxAmount`, `hasCheck`, `notCheck`, `nowCheck`, `payment`, `discount`, `isDelete`, `srcOrderId`, `srcOrderNo`) VALUES
(1, 7, 'CG201707201351082', 1, '吴', 150501, 32500, 32500, 32500, '2017-07-20', '', 0, 0, 0, 1, 0, 0, '', 0, 0, 0, 1, 'PUR', '2017-07-28 15:42:34', 2, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2, 8, 'XS201707201353280', 1, '吴', 150601, 45800, 45800, 45800, '2017-07-20', '', 0, 0, 0, 1, 0, 0, '', 0, 0, 0, 1, 'SALE', '2017-07-24 14:51:54', 2, '销货', 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(3, 9, 'CG201707241458329', 1, '吴', 150501, 1115, 1115, 650, '2017-07-24', '', 465, 0, 0, 4, 0, 0, '', 0, 0, 0, 1, 'PUR', '2017-07-28 15:42:41', 1, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4, 8, 'XS201707241509264', 1, '吴', 150601, 1620, 1620, 1620, '2017-07-24', '', 0, 0, 0, 4, 0, 0, '', 0, 0, 0, 1, 'SALE', '2017-07-24 15:09:26', 2, '销货', 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(5, 9, 'CG201707281734457', 1, '吴', 150501, 33592, 33592, 33592, '2017-07-28', '', 0, 0, 0, 8, 0, 0, '', 0, 0, 0, 1, 'PUR', '2017-07-28 17:34:45', 2, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(6, 10, 'XS201707281737467', 1, '吴', 150601, 33592, 33592, 33592, '2017-07-28', '', 0, 0, 0, 8, 0, 0, '', 0, 0, 0, 1, 'SALE', '2017-08-02 09:48:58', 2, '销货', 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(7, 7, 'CG201707310957118', 1, '吴', 150501, 29500, 29500, 29500, '2017-07-31', '', 0, 0, 0, 1, 0, 0, '', 0, 0, 0, 1, 'PUR', '2017-07-31 09:57:11', 2, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(8, 11, 'XS201707310958002', 1, '吴', 150601, 29500, 29500, 29500, '2017-07-31', '', 0, 0, 0, 1, 0, 0, '', 0, 0, 0, 1, 'SALE', '2017-08-02 09:58:03', 2, '销货', 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(9, 7, 'CG201707311010221', 1, '吴', 150501, 9410, 9410, 9410, '2017-07-31', '', 0, 0, 0, 22, 0, 0, '', 0, 0, 0, 1, 'PUR', '2017-07-31 10:16:09', 2, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(10, 13, 'XS201707311018053', 1, '吴', 150601, 9410, 9410, 9410, '2017-07-31', '', 0, 0, 0, 22, 0, 0, '', 0, 0, 0, 1, 'SALE', '2017-08-02 09:55:13', 2, '销货', 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(11, 9, 'CG201707311034011', 1, '吴', 150501, 167346, 167346, 167346, '2017-07-31', '', 0, 0, 0, 25, 0, 0, '', 0, 0, 0, 1, 'PUR', '2017-07-31 10:34:01', 2, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(12, 12, 'XS201707311037066', 1, '吴', 150601, 167346, 167346, 167346, '2017-07-31', '', 0, 0, 0, 25, 0, 0, '', 0, 0, 0, 1, 'SALE', '2017-08-02 09:56:33', 2, '销货', 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(13, 7, 'CG201708020940071', 1, '吴', 150501, 6899, 6899, 6899, '2017-08-02', '', 0, 0, 0, 2, 0, 0, '', 0, 0, 0, 1, 'PUR', '2017-08-02 09:40:07', 2, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(14, 10, 'XS201708020941349', 1, '吴', 150601, 6899, 6899, 6899, '2017-08-02', '', 0, 0, 0, 2, 0, 0, '', 0, 0, 0, 1, 'SALE', '2017-08-02 09:41:34', 2, '销货', 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(15, 14, 'CG201708021102174', 6, '财务', 150501, 85200, 85200, 85200, '2017-08-02', '', 0, 0, 0, 30, 0, 0, '', 0, 0, 0, 1, 'PUR', '2017-08-02 11:02:17', 2, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(16, 15, 'CG201708021104599', 6, '财务', 150501, 4750, 4750, 4750, '2017-08-02', '', 0, 0, 0, 1, 0, 0, '', 0, 0, 0, 1, 'PUR', '2017-08-02 11:04:59', 2, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(17, 16, 'XS201708021117341', 6, '财务', 150601, 5699, 5699, 0, '2017-08-02', '', 5699, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2017-08-02 11:21:13', 0, '销货', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(18, 17, 'CG201708111549588', 9, '林建新', 150501, 7180, 7180, 7180, '2017-08-11', '', 0, 0, 0, 4, 0, 0, '', 0, 0, 0, 1, 'PUR', '2017-08-11 15:49:58', 2, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(19, 18, 'XS201708111553111', 9, '林建新', 150601, 8658, 8658, 0, '2017-08-11', '', 8658, 0, 0, 4, 0, 0, '', 0, 0, 0, 0, 'SALE', '2017-08-11 15:53:11', 0, '销货', 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(20, 7, 'CG201708141619119', 1, '吴哲帆', 150501, 88879, 88879, 0, '2017-08-14', '', 88879, 0, 0, 78, 0, 0, '', 0, 0, 0, 0, 'PUR', '2017-08-14 16:35:56', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(21, 13, 'XS201708141620214', 1, '吴哲帆', 150601, 66325, 66325, 0, '2017-08-14', '', 66325, 0, 0, 70, 0, 0, '', 0, 0, 0, 0, 'SALE', '2017-08-14 16:31:45', 0, '销货', 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(22, 19, 'XS201708141637595', 1, '吴哲帆', 150601, 22554, 22554, 0, '2017-08-14', '', 22554, 0, 0, 8, 0, 0, '', 0, 0, 0, 0, 'SALE', '2017-08-14 16:38:43', 0, '销货', 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(23, 7, 'CG201708141653402', 1, '吴哲帆', 150501, 3095, 3095, 0, '2017-08-14', '', 3095, 0, 0, 5, 0, 0, '', 0, 0, 0, 0, 'PUR', '2017-08-14 16:53:40', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(24, 11, 'XS201708141654157', 1, '吴哲帆', 150601, 3095, 3095, 0, '2017-08-14', '', 3095, 0, 0, 5, 0, 0, '', 0, 0, 0, 0, 'SALE', '2017-08-14 16:55:29', 0, '销货', 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(25, 17, 'CG201708221037164', 12, '张玉莉', 150501, 3560, 3560, 0, '2017-08-22', '', 3560, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'PUR', '2017-08-22 10:37:16', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(26, 20, 'CG201708221044350', 12, '张玉莉', 150501, 4984, 4984, 0, '2017-08-22', '', 4984, 0, 0, 2, 0, 0, '', 0, 0, 0, 0, 'PUR', '2017-08-22 10:44:35', 0, '购货', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(27, 13, 'XS201708221045371', 12, '张玉莉', 150601, 2300, 2300, 0, '2017-08-22', '', 2300, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2017-08-22 10:45:37', 0, '销货', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(28, 21, 'XS201708221046260', 12, '张玉莉', 150601, 4999, 4999, 0, '2017-08-22', '', 4999, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2017-08-22 10:46:26', 0, '销货', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(29, 22, 'XS201708221047204', 12, '张玉莉', 150601, 3360, 3360, 0, '2017-08-22', '', 3360, 0, 0, 1, 0, 0, '', 0, 0, 0, 0, 'SALE', '2017-08-22 10:47:20', 0, '销货', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ci_invoice_info`
--

CREATE TABLE IF NOT EXISTS `ci_invoice_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `transType` int(11) DEFAULT '0' COMMENT '150501采购 150502退货',
  `amount` double DEFAULT '0' COMMENT '购货金额',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(50) DEFAULT '' COMMENT '备注',
  `invId` int(11) DEFAULT '0' COMMENT '商品ID',
  `price` double DEFAULT '0' COMMENT '单价',
  `deduction` double DEFAULT '0' COMMENT '折扣额',
  `discountRate` double DEFAULT '0' COMMENT '折扣率',
  `qty` double DEFAULT '0' COMMENT '数量',
  `locationId` smallint(6) DEFAULT '0',
  `tax` double DEFAULT '0',
  `taxRate` double DEFAULT '0',
  `taxAmount` double DEFAULT '0',
  `unitId` smallint(6) DEFAULT '0',
  `skuId` int(11) DEFAULT '0',
  `entryId` tinyint(1) DEFAULT '1' COMMENT '区分调拨单  进和出',
  `transTypeName` varchar(25) DEFAULT '',
  `srcOrderEntryId` int(11) DEFAULT '0',
  `srcOrderId` int(11) DEFAULT '0',
  `srcOrderNo` varchar(25) DEFAULT '',
  `billType` varchar(20) DEFAULT '',
  `checked` tinyint(1) DEFAULT '0' COMMENT '0 1',
  `checkName` varchar(30) DEFAULT '',
  `salesId` smallint(6) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除 0正常',
  PRIMARY KEY (`id`),
  KEY `type` (`transType`),
  KEY `billdate` (`billDate`),
  KEY `invId` (`invId`) USING BTREE,
  KEY `transType` (`transType`),
  KEY `iid` (`iid`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=160 ;

--
-- 转存表中的数据 `ci_invoice_info`
--

INSERT INTO `ci_invoice_info` (`id`, `iid`, `buId`, `billNo`, `transType`, `amount`, `billDate`, `description`, `invId`, `price`, `deduction`, `discountRate`, `qty`, `locationId`, `tax`, `taxRate`, `taxAmount`, `unitId`, `skuId`, `entryId`, `transTypeName`, `srcOrderEntryId`, `srcOrderId`, `srcOrderNo`, `billType`, `checked`, `checkName`, `salesId`, `isDelete`) VALUES
(8, 2, 8, 'XS201707201353280', 150601, 45800, '2017-07-20', 'U盘399元', 6, 45800, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 4, 0),
(12, 4, 8, 'XS201707241509264', 150601, 780, '2017-07-24', '', 7, 780, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 4, 0),
(13, 4, 8, 'XS201707241509264', 150601, 840, '2017-07-24', '', 8, 280, 0, 0, -3, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 4, 0),
(14, 1, 7, 'CG201707201351082', 150501, 32500, '2017-07-20', '', 6, 32500, 0, 0, 1, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(17, 3, 9, 'CG201707241458329', 150501, 650, '2017-07-24', '', 7, 650, 0, 0, 1, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(18, 3, 9, 'CG201707241458329', 150501, 465, '2017-07-24', '', 8, 155, 0, 0, 3, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(19, 5, 9, 'CG201707281734457', 150501, 6597, '2017-07-28', '', 9, 2199, 0, 0, 3, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(20, 5, 9, 'CG201707281734457', 150501, 5999, '2017-07-28', '', 10, 5999, 0, 0, 1, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(21, 5, 9, 'CG201707281734457', 150501, 11998, '2017-07-28', '', 11, 5999, 0, 0, 2, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(22, 5, 9, 'CG201707281734457', 150501, 8998, '2017-07-28', '', 12, 4499, 0, 0, 2, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(31, 7, 7, 'CG201707310957118', 150501, 29500, '2017-07-31', '', 13, 29500, 0, 0, 1, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(35, 9, 7, 'CG201707311010221', 150501, 1620, '2017-07-31', '', 14, 135, 0, 0, 12, 1, 0, 0, 0, 10, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(36, 9, 7, 'CG201707311010221', 150501, 500, '2017-07-31', '', 15, 500, 0, 0, 1, 1, 0, 0, 0, 9, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(37, 9, 7, 'CG201707311010221', 150501, 1580, '2017-07-31', '', 16, 1580, 0, 0, 1, 1, 0, 0, 0, 9, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(38, 9, 7, 'CG201707311010221', 150501, 2560, '2017-07-31', '', 17, 1280, 0, 0, 2, 1, 0, 0, 0, 9, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(39, 9, 7, 'CG201707311010221', 150501, 2400, '2017-07-31', '', 18, 480, 0, 0, 5, 1, 0, 0, 0, 9, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(40, 9, 7, 'CG201707311010221', 150501, 750, '2017-07-31', '', 19, 750, 0, 0, 1, 1, 0, 0, 0, 9, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(47, 11, 9, 'CG201707311034011', 150501, 15800, '2017-07-31', '', 20, 7900, 0, 0, 2, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(48, 11, 9, 'CG201707311034011', 150501, 14997, '2017-07-31', '', 21, 4999, 0, 0, 3, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(49, 11, 9, 'CG201707311034011', 150501, 19999, '2017-07-31', '', 22, 19999, 0, 0, 1, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(50, 11, 9, 'CG201707311034011', 150501, 3998, '2017-07-31', '', 23, 1999, 0, 0, 2, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(51, 11, 9, 'CG201707311034011', 150501, 29700, '2017-07-31', '', 24, 29700, 0, 0, 1, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(52, 11, 9, 'CG201707311034011', 150501, 11560, '2017-07-31', '', 25, 2890, 0, 0, 4, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(53, 11, 9, 'CG201707311034011', 150501, 17400, '2017-07-31', '', 26, 5800, 0, 0, 3, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(54, 11, 9, 'CG201707311034011', 150501, 35994, '2017-07-31', '', 28, 5999, 0, 0, 6, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(55, 11, 9, 'CG201707311034011', 150501, 11998, '2017-07-31', '', 29, 5999, 0, 0, 2, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(56, 11, 9, 'CG201707311034011', 150501, 5900, '2017-07-31', '', 27, 5900, 0, 0, 1, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(77, 13, 7, 'CG201708020940071', 150501, 4999, '2017-08-02', '', 30, 4999, 0, 0, 1, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(78, 13, 7, 'CG201708020940071', 150501, 1900, '2017-08-02', '', 31, 1900, 0, 0, 1, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(79, 14, 10, 'XS201708020941349', 150601, 4999, '2017-08-02', '张新华单', 30, 4999, 0, 0, -1, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(80, 14, 10, 'XS201708020941349', 150601, 1900, '2017-08-02', '', 31, 1900, 0, 0, -1, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(81, 6, 10, 'XS201707281737467', 150601, 6597, '2017-07-28', '张新华 单', 9, 2199, 0, 0, -3, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(82, 6, 10, 'XS201707281737467', 150601, 5999, '2017-07-28', '', 10, 5999, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(83, 6, 10, 'XS201707281737467', 150601, 11998, '2017-07-28', '', 11, 5999, 0, 0, -2, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(84, 6, 10, 'XS201707281737467', 150601, 8998, '2017-07-28', '', 12, 4499, 0, 0, -2, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(97, 10, 13, 'XS201707311018053', 150601, 1620, '2017-07-31', '邹小姐 单', 14, 135, 0, 0, -12, 1, 0, 0, 0, 10, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(98, 10, 13, 'XS201707311018053', 150601, 500, '2017-07-31', '', 15, 500, 0, 0, -1, 1, 0, 0, 0, 9, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(99, 10, 13, 'XS201707311018053', 150601, 1580, '2017-07-31', '', 16, 1580, 0, 0, -1, 1, 0, 0, 0, 9, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(100, 10, 13, 'XS201707311018053', 150601, 2560, '2017-07-31', '', 17, 1280, 0, 0, -2, 1, 0, 0, 0, 9, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(101, 10, 13, 'XS201707311018053', 150601, 2400, '2017-07-31', '', 18, 480, 0, 0, -5, 1, 0, 0, 0, 9, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(102, 10, 13, 'XS201707311018053', 150601, 750, '2017-07-31', '', 19, 750, 0, 0, -1, 1, 0, 0, 0, 9, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(103, 12, 12, 'XS201707311037066', 150601, 15800, '2017-07-31', '张新华 单', 20, 7900, 0, 0, -2, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(104, 12, 12, 'XS201707311037066', 150601, 14997, '2017-07-31', '', 21, 4999, 0, 0, -3, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(105, 12, 12, 'XS201707311037066', 150601, 19999, '2017-07-31', '', 22, 19999, 0, 0, -1, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(106, 12, 12, 'XS201707311037066', 150601, 3998, '2017-07-31', '', 23, 1999, 0, 0, -2, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(107, 12, 12, 'XS201707311037066', 150601, 29700, '2017-07-31', '', 24, 29700, 0, 0, -1, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(108, 12, 12, 'XS201707311037066', 150601, 11560, '2017-07-31', '', 25, 2890, 0, 0, -4, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(109, 12, 12, 'XS201707311037066', 150601, 17400, '2017-07-31', '', 26, 5800, 0, 0, -3, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(110, 12, 12, 'XS201707311037066', 150601, 35994, '2017-07-31', '', 28, 5999, 0, 0, -6, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(111, 12, 12, 'XS201707311037066', 150601, 11998, '2017-07-31', '', 29, 5999, 0, 0, -2, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(112, 12, 12, 'XS201707311037066', 150601, 5900, '2017-07-31', '', 27, 5900, 0, 0, -1, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(114, 8, 11, 'XS201707310958002', 150601, 29500, '2017-07-31', '胡思程 单', 13, 29500, 0, 0, -1, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(115, 15, 14, 'CG201708021102174', 150501, 70800, '2017-08-02', '', 32, 11800, 0, 0, 6, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(116, 15, 14, 'CG201708021102174', 150501, 13200, '2017-08-02', '', 33, 2200, 0, 0, 6, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(117, 15, 14, 'CG201708021102174', 150501, 600, '2017-08-02', '', 34, 100, 0, 0, 6, 1, 0, 0, 0, 8, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(118, 15, 14, 'CG201708021102174', 150501, 600, '2017-08-02', '', 35, 100, 0, 0, 6, 1, 0, 0, 0, 8, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(119, 15, 14, 'CG201708021102174', 150501, 0, '2017-08-02', '', 36, 0, 0, 0, 6, 1, 0, 0, 0, 8, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(120, 16, 15, 'CG201708021104599', 150501, 4750, '2017-08-02', '', 37, 4750, 0, 0, 1, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(122, 17, 16, 'XS201708021117341', 150601, 5699, '2017-08-02', '', 37, 5699, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 2, 0),
(123, 18, 17, 'CG201708111549588', 150501, 650, '2017-08-11', '', 38, 650, 0, 0, 1, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(124, 18, 17, 'CG201708111549588', 150501, 1630, '2017-08-11', '', 39, 1630, 0, 0, 1, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(125, 18, 17, 'CG201708111549588', 150501, 4900, '2017-08-11', '', 40, 2450, 0, 0, 2, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(126, 19, 18, 'XS201708111553111', 150601, 780, '2017-08-11', '58速运42元', 38, 780, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 6, 0),
(127, 19, 18, 'XS201708111553111', 150601, 2080, '2017-08-11', '', 39, 2080, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 6, 0),
(128, 19, 18, 'XS201708111553111', 150601, 5798, '2017-08-11', '', 40, 2899, 0, 0, -2, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 6, 0),
(138, 21, 13, 'XS201708141620214', 150601, 10325, '2017-08-14', '郑丹琨单', 42, 295, 0, 0, -35, 1, 0, 0, 0, 7, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(139, 21, 13, 'XS201708141620214', 150601, 56000, '2017-08-14', '', 43, 1600, 0, 0, -35, 1, 0, 0, 0, 7, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(140, 20, 7, 'CG201708141619119', 150501, 10796, '2017-08-14', '', 41, 2699, 0, 0, 4, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(141, 20, 7, 'CG201708141619119', 150501, 10325, '2017-08-14', '', 42, 295, 0, 0, 35, 1, 0, 0, 0, 7, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(142, 20, 7, 'CG201708141619119', 150501, 56000, '2017-08-14', '', 43, 1600, 0, 0, 35, 1, 0, 0, 0, 7, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(143, 20, 7, 'CG201708141619119', 150501, 5798, '2017-08-14', '', 44, 2899, 0, 0, 2, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(144, 20, 7, 'CG201708141619119', 150501, 5960, '2017-08-14', '', 45, 2980, 0, 0, 2, 1, 0, 0, 0, 6, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(148, 22, 19, 'XS201708141637595', 150601, 5798, '2017-08-14', '胡思程单', 44, 2899, 0, 0, -2, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(149, 22, 19, 'XS201708141637595', 150601, 5960, '2017-08-14', '', 45, 2980, 0, 0, -2, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(150, 22, 19, 'XS201708141637595', 150601, 10796, '2017-08-14', '', 41, 2699, 0, 0, -4, 1, 0, 0, 0, 6, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(151, 23, 7, 'CG201708141653402', 150501, 3095, '2017-08-14', '', 46, 619, 0, 0, 5, 1, 0, 0, 0, 7, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(153, 24, 11, 'XS201708141654157', 150601, 3095, '2017-08-14', '胡思程单', 46, 619, 0, 0, -5, 1, 0, 0, 0, 7, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 7, 0),
(154, 25, 17, 'CG201708221037164', 150501, 3560, '2017-08-22', '', 47, 3560, 0, 0, 1, 1, 0, 0, 0, -1, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(155, 26, 20, 'CG201708221044350', 150501, 2960, '2017-08-22', '', 48, 2960, 0, 0, 1, 1, 0, 0, 0, 0, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(156, 26, 20, 'CG201708221044350', 150501, 2024, '2017-08-22', '', 49, 2024, 0, 0, 1, 1, 0, 0, 0, 0, -1, 1, '购货', 0, 0, '', 'PUR', 0, '', 0, 0),
(157, 27, 13, 'XS201708221045371', 150601, 2300, '2017-08-22', '', 49, 2300, 0, 0, -1, 1, 0, 0, 0, 0, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 3, 0),
(158, 28, 21, 'XS201708221046260', 150601, 4999, '2017-08-22', '', 47, 4999, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 3, 0),
(159, 29, 22, 'XS201708221047204', 150601, 3360, '2017-08-22', '', 48, 3360, 0, 0, -1, 1, 0, 0, 0, -1, -1, 1, '销货', 0, 0, '', 'SALE', 0, '', 3, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_invoice_type`
--

CREATE TABLE IF NOT EXISTS `ci_invoice_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `inout` tinyint(1) DEFAULT '1' COMMENT '1 入库  -1出库',
  `status` tinyint(1) DEFAULT '1',
  `type` varchar(10) DEFAULT '',
  `default` tinyint(1) DEFAULT '0',
  `number` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ci_invoice_type`
--

INSERT INTO `ci_invoice_type` (`id`, `name`, `inout`, `status`, `type`, `default`, `number`) VALUES
(1, '其他入库', 1, 1, 'in', 1, 150706),
(2, '盘盈', 1, 1, 'in', 0, 150701),
(3, '其他出库', -1, 1, 'out', 1, 150806),
(4, '盘亏', -1, 1, 'out', 0, 150801);

-- --------------------------------------------------------

--
-- 表的结构 `ci_invps`
--

CREATE TABLE IF NOT EXISTS `ci_invps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `uid` smallint(6) DEFAULT '0',
  `userName` varchar(50) DEFAULT '' COMMENT '制单人',
  `transType` int(11) DEFAULT '0' COMMENT '150501购货 150502退货 150601销售 150602退销 150706其他入库',
  `totalAmount` double DEFAULT '0' COMMENT '购货总金额',
  `amount` double DEFAULT '0' COMMENT '折扣后金额',
  `rpAmount` double DEFAULT '0' COMMENT '本次付款',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(100) DEFAULT '' COMMENT '备注',
  `arrears` double DEFAULT '0' COMMENT '本次欠款',
  `disRate` double DEFAULT '0' COMMENT '折扣率',
  `disAmount` double DEFAULT '0' COMMENT '折扣金额',
  `totalQty` double DEFAULT '0' COMMENT '总数量',
  `totalArrears` double DEFAULT '0',
  `billStatus` tinyint(1) DEFAULT '0' COMMENT '订单状态 0未入库  1 2全部入库',
  `checkName` varchar(50) DEFAULT '' COMMENT '采购单审核人',
  `totalTax` double DEFAULT '0',
  `totalTaxAmount` double DEFAULT '0',
  `checked` tinyint(1) DEFAULT '0' COMMENT '采购单状态',
  `accId` tinyint(4) DEFAULT '0' COMMENT '结算账户ID',
  `billType` varchar(20) DEFAULT '' COMMENT 'PO采购订单 OI其他入库 PUR采购入库 BAL初期余额',
  `modifyTime` datetime DEFAULT NULL COMMENT '更新时间',
  `hxStateCode` tinyint(4) DEFAULT '0' COMMENT '0未付款  1部分付款  2全部付款',
  `transTypeName` varchar(20) DEFAULT '',
  `totalDiscount` double DEFAULT '0',
  `salesId` smallint(6) DEFAULT '0' COMMENT '销售人员ID',
  `customerFree` double DEFAULT '0' COMMENT '客户承担费用',
  `hxAmount` double DEFAULT '0' COMMENT '本次核销金额',
  `hasCheck` double DEFAULT '0' COMMENT '已核销',
  `notCheck` double DEFAULT '0' COMMENT '未核销',
  `nowCheck` double DEFAULT '0' COMMENT '本次核销',
  `payment` double DEFAULT '0' COMMENT '本次预收款',
  `discount` double DEFAULT '0' COMMENT '整单折扣',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除  0正常',
  `deliveryDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accId` (`accId`),
  KEY `buId` (`buId`),
  KEY `salesId` (`salesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_invps_info`
--

CREATE TABLE IF NOT EXISTS `ci_invps_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `transType` int(11) DEFAULT '0' COMMENT '150501采购 150502退货',
  `amount` double DEFAULT '0' COMMENT '购货金额',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(50) DEFAULT '' COMMENT '备注',
  `invId` int(11) DEFAULT '0' COMMENT '商品ID',
  `price` double DEFAULT '0' COMMENT '单价',
  `deduction` double DEFAULT '0' COMMENT '折扣额',
  `discountRate` double DEFAULT '0' COMMENT '折扣率',
  `qty` double DEFAULT '0' COMMENT '数量',
  `locationId` smallint(6) DEFAULT '0',
  `tax` double DEFAULT '0',
  `taxRate` double DEFAULT '0',
  `taxAmount` double DEFAULT '0',
  `unitId` smallint(6) DEFAULT '0',
  `skuId` int(11) DEFAULT '0',
  `entryId` tinyint(1) DEFAULT '1' COMMENT '区分调拨单  进和出',
  `transTypeName` varchar(25) DEFAULT '',
  `srcOrderEntryId` int(11) DEFAULT '0',
  `srcOrderId` int(11) DEFAULT '0',
  `srcOrderNo` varchar(25) DEFAULT '',
  `billType` varchar(20) DEFAULT '',
  `checked` tinyint(1) DEFAULT '0' COMMENT '0 1',
  `checkName` varchar(30) DEFAULT '',
  `salesId` smallint(6) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除 0正常',
  PRIMARY KEY (`id`),
  KEY `type` (`transType`),
  KEY `billdate` (`billDate`),
  KEY `invId` (`invId`) USING BTREE,
  KEY `transType` (`transType`),
  KEY `iid` (`iid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_log`
--

CREATE TABLE IF NOT EXISTS `ci_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` smallint(6) DEFAULT '0' COMMENT '用户ID',
  `ip` varchar(25) DEFAULT '',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '姓名',
  `log` text COMMENT '日志内容',
  `type` tinyint(1) DEFAULT '1' COMMENT ' ',
  `loginName` varchar(50) DEFAULT '' COMMENT '用户名',
  `modifyTime` datetime DEFAULT NULL COMMENT '写入日期',
  `operateTypeName` varchar(50) DEFAULT '',
  `adddate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `adddate` (`adddate`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=614 ;

--
-- 转存表中的数据 `ci_log`
--

INSERT INTO `ci_log` (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES
(1, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-09-15 09:31:48', '', '2015-09-15'),
(2, 1, '127.0.0.1', '小阳', '备份与恢复,备份文件名:201509150931597.sql', 1, 'admin', '2015-09-15 09:31:59', '', '2015-09-15'),
(3, 1, '127.0.0.1', '小阳', '备份与恢复,删除文件名:201508191603041.sql', 1, 'admin', '2015-09-15 09:32:03', '', '2015-09-15'),
(4, 1, '127.0.0.1', '小阳', '备份与恢复,删除文件名:201508190955474.sql', 1, 'admin', '2015-09-15 09:32:04', '', '2015-09-15'),
(5, 1, '127.0.0.1', '小阳', '备份与恢复,删除文件名:201509150931597.sql', 1, 'admin', '2015-09-15 09:32:06', '', '2015-09-15'),
(6, 1, '127.0.0.1', '小阳', '备份与恢复,备份文件名:201509150932070.sql', 1, 'admin', '2015-09-15 09:32:07', '', '2015-09-15'),
(7, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-09-17 10:06:21', '', '2015-09-17'),
(8, 1, '127.0.0.1', '小阳', '新增商品类别:1111', 1, 'admin', '2015-09-17 10:30:51', '', '2015-09-17'),
(9, 1, '127.0.0.1', '小阳', '新增仓库:11', 1, 'admin', '2015-09-17 10:31:09', '', '2015-09-17'),
(10, 1, '127.0.0.1', '小阳', '新增单位:分', 1, 'admin', '2015-09-17 10:31:14', '', '2015-09-17'),
(11, 1, '127.0.0.1', '小阳', '新增单位:1312', 1, 'admin', '2015-09-17 10:38:49', '', '2015-09-17'),
(12, 1, '127.0.0.1', '小阳', '新增单位:123', 1, 'admin', '2015-09-17 10:39:55', '', '2015-09-17'),
(13, 1, '127.0.0.1', '小阳', '新增商品:小不点', 1, 'admin', '2015-09-17 10:45:32', '', '2015-09-17'),
(14, 1, '127.0.0.1', '小阳', '修改商品:ID=1名称:小不点', 1, 'admin', '2015-09-17 10:54:11', '', '2015-09-17'),
(15, 1, '127.0.0.1', '小阳', '修改商品:ID=1名称:小不点', 1, 'admin', '2015-09-17 11:01:29', '', '2015-09-17'),
(16, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-09-24 14:16:15', '', '2015-09-24'),
(17, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-09-28 09:27:57', '', '2015-09-28'),
(18, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-09-29 10:25:30', '', '2015-09-29'),
(19, 1, '127.0.0.1', '小阳', '新增购货 单据编号：CG201509291033157', 1, 'admin', '2015-09-29 10:33:15', '', '2015-09-29'),
(20, 1, '127.0.0.1', '小阳', '修改购货单 单据编号：CG201509291033157', 1, 'admin', '2015-09-29 10:37:24', '', '2015-09-29'),
(21, 1, '127.0.0.1', '小阳', '修改购货单 单据编号：CG201509291033157', 1, 'admin', '2015-09-29 10:37:38', '', '2015-09-29'),
(22, 1, '127.0.0.1', '小阳', '新增销货 单据编号：XS201509291048510', 1, 'admin', '2015-09-29 10:48:51', '', '2015-09-29'),
(23, 1, '127.0.0.1', '小阳', '修改销货 单据编号：XS201509291048510', 1, 'admin', '2015-09-29 10:49:02', '', '2015-09-29'),
(24, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-10-08 13:15:54', '', '2015-10-08'),
(25, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-10-08 16:43:39', '', '2015-10-08'),
(26, 1, '127.0.0.1', '小阳', '删除单位:ID=1 名称:分', 1, 'admin', '2015-10-08 16:44:21', '', '2015-10-08'),
(27, 1, '127.0.0.1', '小阳', '新增单位:分', 1, 'admin', '2015-10-08 16:44:25', '', '2015-10-08'),
(28, 1, '127.0.0.1', '小阳', '新增员工:编号001 名称111', 1, 'admin', '2015-10-08 16:44:34', '', '2015-10-08'),
(29, 1, '127.0.0.1', '小阳', '删除员工:ID=1 名称:111', 1, 'admin', '2015-10-08 16:44:40', '', '2015-10-08'),
(30, 1, '127.0.0.1', '小阳', '新增员工:编号001 名称111', 1, 'admin', '2015-10-08 16:44:45', '', '2015-10-08'),
(31, 1, '127.0.0.1', '小阳', '新增结算方式:001', 1, 'admin', '2015-10-08 16:44:59', '', '2015-10-08'),
(32, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-10-08 17:55:05', '', '2015-10-08'),
(33, 1, '127.0.0.1', '小阳', '采购明细表导出:pu_detail_20151008175652.xls', 1, 'admin', '2015-10-08 17:56:52', '', '2015-10-08'),
(34, 1, '127.0.0.1', '小阳', '删除客户类别:ID=2 名称:001', 1, 'admin', '2015-10-08 18:05:20', '', '2015-10-08'),
(35, 1, '127.0.0.1', '小阳', '新增结算方式:001', 1, 'admin', '2015-10-08 18:05:29', '', '2015-10-08'),
(36, 1, '127.0.0.1', '小阳', '新增结算方式:002', 1, 'admin', '2015-10-08 18:05:31', '', '2015-10-08'),
(37, 1, '127.0.0.1', '小阳', '新增客户类别:001', 1, 'admin', '2015-10-08 18:06:23', '', '2015-10-08'),
(38, 1, '127.0.0.1', '小阳', '新增供应商类别:001', 1, 'admin', '2015-10-08 18:06:28', '', '2015-10-08'),
(39, 1, '127.0.0.1', '小阳', '新增商品类别:001', 1, 'admin', '2015-10-08 18:06:34', '', '2015-10-08'),
(40, 1, '127.0.0.1', '小阳', '新增支出类别:001', 1, 'admin', '2015-10-08 18:06:39', '', '2015-10-08'),
(41, 1, '127.0.0.1', '小阳', '新增收入类别:001', 1, 'admin', '2015-10-08 18:06:43', '', '2015-10-08'),
(42, 1, '127.0.0.1', '小阳', '新增供应商:康志', 1, 'admin', '2015-10-08 18:07:06', '', '2015-10-08'),
(43, 1, '127.0.0.1', '小阳', '删除供应商:ID=1 名称:康志', 1, 'admin', '2015-10-08 18:07:14', '', '2015-10-08'),
(44, 1, '127.0.0.1', '小阳', '新增供应商:001', 1, 'admin', '2015-10-08 18:07:38', '', '2015-10-08'),
(45, 1, '127.0.0.1', '小阳', '修改供应商:0011', 1, 'admin', '2015-10-08 18:09:17', '', '2015-10-08'),
(46, 1, '127.0.0.1', '小阳', '修改供应商:0011', 1, 'admin', '2015-10-08 18:09:18', '', '2015-10-08'),
(47, 1, '127.0.0.1', '小阳', '修改供应商:0011', 1, 'admin', '2015-10-08 18:09:22', '', '2015-10-08'),
(48, 1, '127.0.0.1', '小阳', '修改供应商:0011', 1, 'admin', '2015-10-08 18:09:49', '', '2015-10-08'),
(49, 1, '127.0.0.1', '小阳', '修改商品:ID=1名称:小不点', 1, 'admin', '2015-10-08 18:10:04', '', '2015-10-08'),
(50, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-08 18:10:50', '', '2015-10-08'),
(51, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-10-10 08:56:57', '', '2015-10-10'),
(52, 1, '127.0.0.1', '小阳', '新增商品:25112', 1, 'admin', '2015-10-10 08:57:27', '', '2015-10-10'),
(53, 1, '127.0.0.1', '小阳', '新增商品:123', 1, 'admin', '2015-10-10 09:42:33', '', '2015-10-10'),
(54, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-10-11 10:14:18', '', '2015-10-11'),
(55, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-10-21 09:57:50', '', '2015-10-21'),
(56, 1, '127.0.0.1', '小阳', '新增客户:111', 1, 'admin', '2015-10-21 10:00:25', '', '2015-10-21'),
(57, 1, '127.0.0.1', '小阳', '新增购货 单据编号：CG201510211000285', 1, 'admin', '2015-10-21 10:00:28', '', '2015-10-21'),
(58, 1, '127.0.0.1', '小阳', '新增销货 单据编号：XS201510211000450', 1, 'admin', '2015-10-21 10:00:45', '', '2015-10-21'),
(59, 1, '127.0.0.1', '小阳', '修改购货单 单据编号：CG201510211000285', 1, 'admin', '2015-10-21 10:11:15', '', '2015-10-21'),
(60, 1, '127.0.0.1', '小阳', '新增其他出库 单据编号：QTCK201510211027058', 1, 'admin', '2015-10-21 10:27:05', '', '2015-10-21'),
(61, 1, '127.0.0.1', '小阳', '修改其他出库 单据编号：QTCK201510211027058', 1, 'admin', '2015-10-21 10:27:16', '', '2015-10-21'),
(62, 1, '127.0.0.1', '小阳', '修改其他出库 单据编号：QTCK201510211027058', 1, 'admin', '2015-10-21 10:27:40', '', '2015-10-21'),
(63, 1, '127.0.0.1', '小阳', '修改其他出库 单据编号：QTCK201510211027058', 1, 'admin', '2015-10-21 10:28:33', '', '2015-10-21'),
(64, 1, '127.0.0.1', '小阳', '新增购货 单据编号：CG201510211032557', 1, 'admin', '2015-10-21 10:32:55', '', '2015-10-21'),
(65, 1, '127.0.0.1', '小阳', '修改其他出库 单据编号：QTCK201510211027058', 1, 'admin', '2015-10-21 10:33:10', '', '2015-10-21'),
(66, 1, '127.0.0.1', '小阳', '商品收发汇总表导出:deliver_summary_20151021104252.xls', 1, 'admin', '2015-10-21 10:42:52', '', '2015-10-21'),
(67, 1, '127.0.0.1', '小阳', '商品收发汇总表导出:deliver_summary_20151021105459.xls', 1, 'admin', '2015-10-21 10:54:59', '', '2015-10-21'),
(68, 1, '127.0.0.1', '小阳', '商品收发汇总表导出:deliver_summary_20151021105631.xls', 1, 'admin', '2015-10-21 10:56:31', '', '2015-10-21'),
(69, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-10-25 16:11:10', '', '2015-10-25'),
(70, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:11:38', '', '2015-10-25'),
(71, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:14:42', '', '2015-10-25'),
(72, 1, '127.0.0.1', '小阳', '导出客户:customer_20151025161541.xls', 1, 'admin', '2015-10-25 16:15:41', '', '2015-10-25'),
(73, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:16:02', '', '2015-10-25'),
(74, 1, '127.0.0.1', '小阳', '导出客户:customer_20151025161605.xls', 1, 'admin', '2015-10-25 16:16:05', '', '2015-10-25'),
(75, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:16:13', '', '2015-10-25'),
(76, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:18:19', '', '2015-10-25'),
(77, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:18:24', '', '2015-10-25'),
(78, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:20:30', '', '2015-10-25'),
(79, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:20:33', '', '2015-10-25'),
(80, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:21:25', '', '2015-10-25'),
(81, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:21:38', '', '2015-10-25'),
(82, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:50:15', '', '2015-10-25'),
(83, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:50:20', '', '2015-10-25'),
(84, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 16:56:29', '', '2015-10-25'),
(85, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:00:37', '', '2015-10-25'),
(86, 1, '127.0.0.1', '小阳', '切换皮肤：green', 1, 'admin', '2015-10-25 17:10:19', '', '2015-10-25'),
(87, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:10:41', '', '2015-10-25'),
(88, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:11:06', '', '2015-10-25'),
(89, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:27:31', '', '2015-10-25'),
(90, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:27:41', '', '2015-10-25'),
(91, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:28:09', '', '2015-10-25'),
(92, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:29:09', '', '2015-10-25'),
(93, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:29:44', '', '2015-10-25'),
(94, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:30:01', '', '2015-10-25'),
(95, 1, '127.0.0.1', '小阳', '修改供应商:00111', 1, 'admin', '2015-10-25 17:30:09', '', '2015-10-25'),
(96, 1, '127.0.0.1', '小阳', '切换皮肤：green', 1, 'admin', '2015-11-06 09:59:25', '', '2015-11-06'),
(97, 1, '127.0.0.1', '小阳', '新增用户:qq123456', 1, 'admin', '2015-11-06 10:01:38', '', '2015-11-06'),
(98, 1, '127.0.0.1', '小阳', '更新权限:qq123456', 1, 'admin', '2015-11-06 10:01:42', '', '2015-11-06'),
(99, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-06 10:18:29', '', '2015-11-06'),
(100, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-06 11:31:03', '', '2015-11-06'),
(101, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-06 11:31:48', '', '2015-11-06'),
(102, 1, '127.0.0.1', '小阳', '新增销货 单据编号：XSDD201511070854553', 1, 'admin', '2015-11-07 08:54:55', '', '2015-11-07'),
(103, 1, '127.0.0.1', '小阳', '销货单编号：XSDD201511070854553的单据已被审核！', 1, 'admin', '2015-11-07 08:57:40', '', '2015-11-07'),
(104, 1, '127.0.0.1', '小阳', '销货订单：XSDD201511070854553的单据已被反审核！', 1, 'admin', '2015-11-07 08:57:41', '', '2015-11-07'),
(105, 1, '127.0.0.1', '小阳', '新增购货 单据编号：CG201511070859066', 1, 'admin', '2015-11-07 08:59:06', '', '2015-11-07'),
(106, 1, '127.0.0.1', '小阳', '新增销货 单据编号：XS201511070859106', 1, 'admin', '2015-11-07 08:59:10', '', '2015-11-07'),
(107, 1, '127.0.0.1', '小阳', '销货单编号：XS201511070859106的单据已被审核！', 1, 'admin', '2015-11-07 09:20:47', '', '2015-11-07'),
(108, 1, '127.0.0.1', '小阳', '销货单：XS201511070859106的单据已被反审核！', 1, 'admin', '2015-11-07 09:20:48', '', '2015-11-07'),
(109, 1, '127.0.0.1', '小阳', '销货单编号：XS201511070859106的单据已被审核！', 1, 'admin', '2015-11-07 09:20:50', '', '2015-11-07'),
(110, 1, '127.0.0.1', '小阳', '销货单：XS201511070859106的单据已被反审核！', 1, 'admin', '2015-11-07 09:20:50', '', '2015-11-07'),
(111, 1, '127.0.0.1', '小阳', '销货单编号：XS201511070859106的单据已被审核！', 1, 'admin', '2015-11-07 09:20:51', '', '2015-11-07'),
(112, 1, '127.0.0.1', '小阳', '销货单：XS201511070859106的单据已被反审核！', 1, 'admin', '2015-11-07 09:20:52', '', '2015-11-07'),
(113, 1, '127.0.0.1', '小阳', '更新权限:qq123456', 1, 'admin', '2015-11-07 09:31:43', '', '2015-11-07'),
(114, NULL, '127.0.0.1', NULL, '登陆成功 用户名：qq123456', 1, NULL, '2015-11-07 09:32:25', '', '2015-11-07'),
(115, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-07 17:27:54', '', '2015-11-07'),
(116, 1, '127.0.0.1', '小阳', '登陆成功 用户名：admin', 1, 'admin', '2015-11-07 17:42:50', '', '2015-11-07'),
(117, 1, '127.0.0.1', '小阳', '登陆成功 用户名：admin', 1, 'admin', '2015-11-07 17:42:56', '', '2015-11-07'),
(118, 1, '127.0.0.1', '小阳', '登陆成功 用户名：admin', 1, 'admin', '2015-11-07 17:44:43', '', '2015-11-07'),
(119, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-07 17:45:47', '', '2015-11-07'),
(120, NULL, '127.0.0.1', NULL, '登陆成功 用户名：qq123456', 1, NULL, '2015-11-07 17:46:03', '', '2015-11-07'),
(121, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-07 17:54:28', '', '2015-11-07'),
(122, 1, '127.0.0.1', '小阳', '更新权限:qq123456', 1, 'admin', '2015-11-07 17:55:44', '', '2015-11-07'),
(123, NULL, '127.0.0.1', NULL, '登陆成功 用户名：qq123456', 1, NULL, '2015-11-07 17:56:15', '', '2015-11-07'),
(124, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2015-11-10 10:23:02', '', '2015-11-10'),
(125, 1, '127.0.0.1', '小阳', '新增单位:23', 1, 'admin', '2015-11-18 16:00:13', '', '2015-11-18'),
(126, 1, '127.0.0.1', '小阳', '新增商品:123', 1, 'admin', '2015-11-18 16:00:48', '', '2015-11-18'),
(127, 1, '127.0.0.1', '小阳', '删除商品:ID=4 名称:123', 1, 'admin', '2015-11-18 16:03:08', '', '2015-11-18'),
(128, 1, '127.0.0.1', '小阳', '新增商品:123', 1, 'admin', '2015-11-18 16:05:38', '', '2015-11-18'),
(129, 1, '127.0.0.1', '小阳', '删除商品:ID=5 名称:123', 1, 'admin', '2015-11-18 16:05:46', '', '2015-11-18'),
(130, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-23 09:41:03', '', '2017-06-23'),
(131, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-23 09:57:50', '', '2017-06-23'),
(132, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-23 10:12:59', '', '2017-06-23'),
(133, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-26 10:14:28', '', '2017-06-26'),
(134, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-26 10:14:33', '', '2017-06-26'),
(135, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-26 10:17:17', '', '2017-06-26'),
(136, 1, '::1', '小阳', '新增购货 单据编号：CG201706261124554', 1, 'admin', '2017-06-26 11:24:55', '', '2017-06-26'),
(137, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-26 16:34:02', '', '2017-06-26'),
(138, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-29 11:25:36', '', '2017-06-29'),
(139, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-29 11:47:19', '', '2017-06-29'),
(140, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-29 14:49:29', '', '2017-06-29'),
(141, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-29 14:51:06', '', '2017-06-29'),
(142, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-30 09:43:51', '', '2017-06-30'),
(143, 1, '::1', '小阳', '新增购货 单据编号：CG201706301023257', 1, 'admin', '2017-06-30 10:23:25', '', '2017-06-30'),
(144, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-30 13:33:55', '', '2017-06-30'),
(145, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-30 14:48:17', '', '2017-06-30'),
(146, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-30 16:02:21', '', '2017-06-30'),
(147, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-30 16:05:52', '', '2017-06-30'),
(148, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-06-30 16:23:59', '', '2017-06-30'),
(149, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-12 10:29:16', '', '2017-07-12'),
(150, 1, '::1', '小阳', '新增购货 单据编号：CG201707121029358', 1, 'admin', '2017-07-12 10:29:35', '', '2017-07-12'),
(151, 1, '::1', '小阳', '新增购货 单据编号：CG201707121034392', 1, 'admin', '2017-07-12 10:34:39', '', '2017-07-12'),
(152, 1, '::1', '小阳', '新增购货 单据编号：CG201707121045266', 1, 'admin', '2017-07-12 10:45:26', '', '2017-07-12'),
(153, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-12 11:10:49', '', '2017-07-12'),
(154, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-12 11:11:33', '', '2017-07-12'),
(155, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-12 11:12:41', '', '2017-07-12'),
(156, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-12 11:24:59', '', '2017-07-12'),
(157, 1, '::1', '小阳', '新增购货 单据编号：CG201707121126096', 1, 'admin', '2017-07-12 11:26:10', '', '2017-07-12'),
(158, 1, '::1', '小阳', '新增购货 单据编号：CG201707121150596', 1, 'admin', '2017-07-12 11:50:59', '', '2017-07-12'),
(159, 1, '::1', '小阳', '修改购货单 单据编号：CG201707121150596', 1, 'admin', '2017-07-12 12:14:37', '', '2017-07-12'),
(160, 1, '::1', '小阳', '新增购货 单据编号：CG201707121308559', 1, 'admin', '2017-07-12 13:08:55', '', '2017-07-12'),
(161, 1, '::1', '小阳', '新增购货 单据编号：CG201707121314565', 1, 'admin', '2017-07-12 13:14:56', '', '2017-07-12'),
(162, 1, '::1', '小阳', '新增购货 单据编号：CG201707121322546', 1, 'admin', '2017-07-12 13:22:55', '', '2017-07-12'),
(163, 1, '::1', '小阳', '新增购货 单据编号：CG201707121326583', 1, 'admin', '2017-07-12 13:26:58', '', '2017-07-12'),
(164, 1, '::1', '小阳', '新增购货 单据编号：CG201707121330135', 1, 'admin', '2017-07-12 13:30:13', '', '2017-07-12'),
(165, 1, '::1', '小阳', '新增购货 单据编号：CG201707121330563', 1, 'admin', '2017-07-12 13:30:56', '', '2017-07-12'),
(166, 1, '::1', '小阳', '新增购货 单据编号：CG201707121333521', 1, 'admin', '2017-07-12 13:33:52', '', '2017-07-12'),
(167, 1, '::1', '小阳', '新增购货 单据编号：CG201707121336090', 1, 'admin', '2017-07-12 13:36:10', '', '2017-07-12'),
(168, 1, '::1', '小阳', '新增销货 单据编号：XS201707121630057', 1, 'admin', '2017-07-12 16:30:06', '', '2017-07-12'),
(169, 1, '::1', '小阳', '导出盘点单据:pdReport_20170712163047.xls', 1, 'admin', '2017-07-12 16:30:47', '', '2017-07-12'),
(170, 1, '::1', '小阳', '新增成本调整 单据编号：CBTZ201707121633262', 1, 'admin', '2017-07-12 16:33:26', '', '2017-07-12'),
(171, 1, '::1', '小阳', '新增销货 单据编号：XS201707121634083', 1, 'admin', '2017-07-12 16:34:08', '', '2017-07-12'),
(172, 1, '::1', '小阳', '新增账户:11qq中行11qq', 1, 'admin', '2017-07-12 16:44:10', '', '2017-07-12'),
(173, 1, '::1', '小阳', '新增收款单 单据编号：SKD201707121645115', 1, 'admin', '2017-07-12 16:45:11', '', '2017-07-12'),
(174, 1, '::1', '小阳', '新增销货 单据编号：XS201707121647211', 1, 'admin', '2017-07-12 16:47:21', '', '2017-07-12'),
(175, NULL, '192.168.0.111', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-13 14:43:21', '', '2017-07-13'),
(176, 1, '192.168.0.111', '小阳', '新增供应商:动易网路', 1, 'admin', '2017-07-13 14:55:22', '', '2017-07-13'),
(177, 1, '::1', '小阳', '新增用户:xudong', 1, 'admin', '2017-07-13 16:20:23', '', '2017-07-13'),
(178, 1, '::1', '小阳', '更新权限:xudong', 1, 'admin', '2017-07-13 16:20:40', '', '2017-07-13'),
(179, 1, '::1', '小阳', '新增用户:xuxiaodong', 1, 'admin', '2017-07-13 16:21:24', '', '2017-07-13'),
(180, 1, '::1', '小阳', '更新权限:xuxiaodong', 1, 'admin', '2017-07-13 16:21:34', '', '2017-07-13'),
(181, 1, '::1', '小阳', '更新权限:xuxiaodong', 1, 'admin', '2017-07-13 16:21:59', '', '2017-07-13'),
(182, 1, '::1', '小阳', '更新权限:xudong', 1, 'admin', '2017-07-13 16:22:16', '', '2017-07-13'),
(183, 1, '::1', '小阳', '用户停用:qq123456', 1, 'admin', '2017-07-13 16:22:31', '', '2017-07-13'),
(184, 1, '::1', '小阳', '密码修改成功 UID：1 真实姓名改为：吴', 1, 'admin', '2017-07-13 16:24:07', '', '2017-07-13'),
(185, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-13 16:24:27', '', '2017-07-13'),
(186, 1, '::1', '吴', '用户启用:qq123456', 1, 'admin', '2017-07-13 16:44:41', '', '2017-07-13'),
(187, 1, '::1', '吴', '用户停用:qq123456', 1, 'admin', '2017-07-13 16:44:41', '', '2017-07-13'),
(188, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-14 09:34:34', '', '2017-07-14'),
(189, 1, '::1', '吴', '新增单位:台', 1, 'admin', '2017-07-14 09:37:26', '', '2017-07-14'),
(190, 1, '::1', '吴', '修改商品:ID=3名称:测试商品', 1, 'admin', '2017-07-14 09:37:30', '', '2017-07-14'),
(191, 1, '::1', '吴', '新增单位:个', 1, 'admin', '2017-07-14 09:38:05', '', '2017-07-14'),
(192, 1, '::1', '吴', '修改商品:ID=2名称:测试商品2', 1, 'admin', '2017-07-14 09:38:23', '', '2017-07-14'),
(193, 1, '::1', '吴', '新增单位:套', 1, 'admin', '2017-07-14 09:39:08', '', '2017-07-14'),
(194, 1, '::1', '吴', '修改商品:ID=1名称:测试商品3', 1, 'admin', '2017-07-14 09:39:41', '', '2017-07-14'),
(195, 1, '::1', '吴', '修改商品:ID=1名称:测试商品3', 1, 'admin', '2017-07-14 09:39:52', '', '2017-07-14'),
(196, 1, '::1', '吴', '修改商品:ID=1名称:测试商品3', 1, 'admin', '2017-07-14 09:40:01', '', '2017-07-14'),
(197, 1, '::1', '吴', '修改类别:ID=1 名称:母测试类别', 1, 'admin', '2017-07-14 09:41:14', '', '2017-07-14'),
(198, 1, '::1', '吴', '修改类别:ID=7 名称:子测试类别', 1, 'admin', '2017-07-14 09:41:23', '', '2017-07-14'),
(199, 1, '::1', '吴', '新增商品类别:子测试类别2', 1, 'admin', '2017-07-14 09:41:39', '', '2017-07-14'),
(200, 1, '::1', '吴', '新增商品类别:子测试类别3', 1, 'admin', '2017-07-14 09:41:49', '', '2017-07-14'),
(201, 1, '::1', '吴', '修改类别:ID=7 名称:子测试类别1', 1, 'admin', '2017-07-14 09:41:53', '', '2017-07-14'),
(202, 1, '::1', '吴', '修改支出类别:电汇', 1, 'admin', '2017-07-14 09:42:07', '', '2017-07-14'),
(203, 1, '::1', '吴', '修改收入类别:电汇', 1, 'admin', '2017-07-14 09:42:15', '', '2017-07-14'),
(204, 1, '::1', '吴', '修改供应商类别:供应商测试1', 1, 'admin', '2017-07-14 09:42:25', '', '2017-07-14'),
(205, 1, '::1', '吴', '新增供应商类别:供应商测试2', 1, 'admin', '2017-07-14 09:42:33', '', '2017-07-14'),
(206, 1, '::1', '吴', '修改客户类别:测试客户1', 1, 'admin', '2017-07-14 09:42:41', '', '2017-07-14'),
(207, 1, '::1', '吴', '新增客户类别:测试客户2', 1, 'admin', '2017-07-14 09:42:50', '', '2017-07-14'),
(208, 1, '::1', '吴', '删除单位:ID=2 名称:1312', 1, 'admin', '2017-07-14 09:43:02', '', '2017-07-14'),
(209, 1, '::1', '吴', '删除单位:ID=3 名称:123', 1, 'admin', '2017-07-14 09:43:04', '', '2017-07-14'),
(210, 1, '::1', '吴', '删除单位:ID=5 名称:23', 1, 'admin', '2017-07-14 09:43:06', '', '2017-07-14'),
(211, 1, '::1', '吴', '修改结算方式:测试结算方式1', 1, 'admin', '2017-07-14 09:43:24', '', '2017-07-14'),
(212, 1, '::1', '吴', '修改结算方式:测试结算方式2', 1, 'admin', '2017-07-14 09:43:31', '', '2017-07-14'),
(213, 1, '::1', '吴', '更新账户:88888测试账户1', 1, 'admin', '2017-07-14 09:44:26', '', '2017-07-14'),
(214, 1, '::1', '吴', '新增账户:99999测试账户2', 1, 'admin', '2017-07-14 09:44:44', '', '2017-07-14'),
(215, 1, '::1', '吴', '更新员工:编号888 名称测试职员1', 1, 'admin', '2017-07-14 09:45:14', '', '2017-07-14'),
(216, 1, '::1', '吴', '新增员工:编号999 名称测试职员2', 1, 'admin', '2017-07-14 09:45:24', '', '2017-07-14'),
(217, 1, '::1', '吴', '更新仓库:测试仓库1', 1, 'admin', '2017-07-14 09:45:41', '', '2017-07-14'),
(218, 1, '::1', '吴', '新增仓库:测试仓库2', 1, 'admin', '2017-07-14 09:45:51', '', '2017-07-14'),
(219, 1, '::1', '吴', '修改供应商类别:供应商类别测试1', 1, 'admin', '2017-07-14 09:46:43', '', '2017-07-14'),
(220, 1, '::1', '吴', '修改供应商类别:供应商类别测试2', 1, 'admin', '2017-07-14 09:46:48', '', '2017-07-14'),
(221, 1, '::1', '吴', '修改客户:测试供应商1', 1, 'admin', '2017-07-14 09:47:21', '', '2017-07-14'),
(222, 1, '::1', '吴', '修改客户:测试供应商1', 1, 'admin', '2017-07-14 09:47:36', '', '2017-07-14'),
(223, 1, '::1', '吴', '新增客户:测试供应商2', 1, 'admin', '2017-07-14 09:48:13', '', '2017-07-14'),
(224, 1, '::1', '吴', '修改供应商:测试客户1', 1, 'admin', '2017-07-14 09:49:12', '', '2017-07-14'),
(225, 1, '::1', '吴', '修改客户类别:测试客户类别1', 1, 'admin', '2017-07-14 09:49:23', '', '2017-07-14'),
(226, 1, '::1', '吴', '修改客户类别:测试客户类别2', 1, 'admin', '2017-07-14 09:49:28', '', '2017-07-14'),
(227, 1, '::1', '吴', '修改供应商:测试客户2', 1, 'admin', '2017-07-14 09:49:45', '', '2017-07-14'),
(228, 1, '::1', '吴', '新增购货 单据编号：CG201707141001476', 1, 'admin', '2017-07-14 10:01:47', '', '2017-07-14'),
(229, 1, '::1', '吴', '修改商品:ID=3名称:测试商品', 1, 'admin', '2017-07-14 10:04:39', '', '2017-07-14'),
(230, 1, '::1', '吴', '修改商品:ID=2名称:测试商品2', 1, 'admin', '2017-07-14 10:04:44', '', '2017-07-14'),
(231, 1, '::1', '吴', '修改商品:ID=1名称:测试商品3', 1, 'admin', '2017-07-14 10:04:58', '', '2017-07-14'),
(232, 1, '::1', '吴', '新增销货 单据编号：XS201707141006168', 1, 'admin', '2017-07-14 10:06:16', '', '2017-07-14'),
(233, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-14 10:25:43', '', '2017-07-14'),
(234, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-14 10:26:22', '', '2017-07-14'),
(235, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-14 10:31:11', '', '2017-07-14'),
(236, NULL, '192.168.0.132', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-14 10:46:12', '', '2017-07-14'),
(237, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-14 10:48:41', '', '2017-07-14'),
(238, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-14 10:54:25', '', '2017-07-14'),
(239, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-14 10:55:16', '', '2017-07-14'),
(240, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-14 10:56:47', '', '2017-07-14'),
(241, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-14 11:01:30', '', '2017-07-14'),
(242, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-14 11:02:54', '', '2017-07-14'),
(243, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-14 11:15:14', '', '2017-07-14'),
(244, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-14 13:28:25', '', '2017-07-14'),
(245, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-14 14:02:35', '', '2017-07-14'),
(246, NULL, '192.168.0.143', NULL, '登陆成功 用户名：xudong', 1, NULL, '2017-07-14 15:27:07', '', '2017-07-14'),
(247, 3, '192.168.0.143', '徐东', '销售明细表导出:sales_detail_20170714152946.xls', 1, 'xudong', '2017-07-14 15:29:46', '', '2017-07-14'),
(248, NULL, '192.168.0.130', NULL, '登陆成功 用户名：xudong', 1, NULL, '2017-07-14 17:06:00', '', '2017-07-14'),
(249, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-17 13:40:51', '', '2017-07-17'),
(250, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-17 13:41:17', '', '2017-07-17'),
(251, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-19 14:08:19', '', '2017-07-19'),
(252, 1, '::1', '吴', '新增辅助属性:123', 1, 'admin', '2017-07-19 14:08:53', '', '2017-07-19'),
(253, 1, '::1', '吴', '删除辅助属性:ID=1 名称:123', 1, 'admin', '2017-07-19 14:09:06', '', '2017-07-19'),
(254, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-19 15:14:35', '', '2017-07-19'),
(255, NULL, '192.168.0.134', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-19 15:21:24', '', '2017-07-19'),
(256, NULL, '192.168.0.134', NULL, '登陆成功 用户名：xudong', 1, NULL, '2017-07-19 17:42:02', '', '2017-07-19'),
(257, NULL, '192.168.0.134', NULL, '登陆成功 用户名：xudong', 1, NULL, '2017-07-20 09:16:34', '', '2017-07-20'),
(258, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-20 09:25:37', '', '2017-07-20'),
(259, 1, '127.0.0.1', '吴', '切换皮肤：default', 1, 'admin', '2017-07-20 09:25:45', '', '2017-07-20'),
(260, 1, '127.0.0.1', '吴', '切换皮肤：green', 1, 'admin', '2017-07-20 09:26:20', '', '2017-07-20'),
(261, 1, '127.0.0.1', '吴', '切换皮肤：green', 1, 'admin', '2017-07-20 09:26:20', '', '2017-07-20'),
(262, 1, '127.0.0.1', '吴', '切换皮肤：green', 1, 'admin', '2017-07-20 09:26:20', '', '2017-07-20'),
(263, 1, '127.0.0.1', '吴', '切换皮肤：blue', 1, 'admin', '2017-07-20 09:26:20', '', '2017-07-20'),
(264, 1, '127.0.0.1', '吴', '切换皮肤：blue', 1, 'admin', '2017-07-20 09:26:21', '', '2017-07-20'),
(265, 1, '127.0.0.1', '吴', '切换皮肤：blue', 1, 'admin', '2017-07-20 09:26:21', '', '2017-07-20'),
(266, 1, '127.0.0.1', '吴', '切换皮肤：blue', 1, 'admin', '2017-07-20 09:26:21', '', '2017-07-20'),
(267, 1, '127.0.0.1', '吴', '切换皮肤：blue', 1, 'admin', '2017-07-20 09:26:21', '', '2017-07-20'),
(268, 1, '127.0.0.1', '吴', '切换皮肤：blue', 1, 'admin', '2017-07-20 09:26:21', '', '2017-07-20'),
(269, 1, '127.0.0.1', '吴', '切换皮肤：blue', 1, 'admin', '2017-07-20 09:26:43', '', '2017-07-20'),
(270, NULL, '192.168.0.134', NULL, '登陆成功 用户名：xudong', 1, NULL, '2017-07-20 09:26:56', '', '2017-07-20'),
(271, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-20 10:03:34', '', '2017-07-20'),
(272, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-20 10:05:54', '', '2017-07-20'),
(273, 1, '127.0.0.1', '吴', '修改客户:测试供应商1', 1, 'admin', '2017-07-20 10:06:53', '', '2017-07-20'),
(274, 1, '127.0.0.1', '吴', '删除客户:ID=3 名称:测试供应商1', 1, 'admin', '2017-07-20 10:07:04', '', '2017-07-20'),
(275, NULL, '192.168.0.134', NULL, '登陆成功 用户名：xudong', 1, NULL, '2017-07-20 10:11:25', '', '2017-07-20'),
(276, 3, '192.168.0.134', '徐东', '新增客户类别:商城过单', 1, 'xudong', '2017-07-20 10:28:20', '', '2017-07-20'),
(277, 3, '192.168.0.134', '徐东', '修改供应商:广佳过单', 1, 'xudong', '2017-07-20 10:28:28', '', '2017-07-20'),
(278, 3, '192.168.0.134', '徐东', '修改供应商:中国共产党广州市越秀区委员会老干部局', 1, 'xudong', '2017-07-20 10:29:16', '', '2017-07-20'),
(279, 3, '192.168.0.134', '徐东', '修改供应商:中国共产党广州市越秀区委员会老干部局', 1, 'xudong', '2017-07-20 10:29:25', '', '2017-07-20'),
(280, 3, '192.168.0.134', '徐东', '修改客户类别:政府单位', 1, 'xudong', '2017-07-20 10:29:49', '', '2017-07-20'),
(281, 3, '192.168.0.134', '徐东', '修改客户类别:学校', 1, 'xudong', '2017-07-20 10:29:59', '', '2017-07-20'),
(282, 3, '192.168.0.134', '徐东', '新增客户类别:医院', 1, 'xudong', '2017-07-20 10:30:09', '', '2017-07-20'),
(283, 3, '192.168.0.134', '徐东', '新增客户类别:医院', 1, 'xudong', '2017-07-20 10:30:09', '', '2017-07-20'),
(284, 3, '192.168.0.134', '徐东', '删除客户类别:ID=16 名称:医院', 1, 'xudong', '2017-07-20 10:30:23', '', '2017-07-20'),
(285, 3, '192.168.0.134', '徐东', '修改类别:ID=1 名称:办公设备', 1, 'xudong', '2017-07-20 10:30:52', '', '2017-07-20'),
(286, 3, '192.168.0.134', '徐东', '修改类别:ID=10 名称:打印机', 1, 'xudong', '2017-07-20 10:30:59', '', '2017-07-20'),
(287, 3, '192.168.0.134', '徐东', '修改类别:ID=11 名称:台式电脑', 1, 'xudong', '2017-07-20 10:31:12', '', '2017-07-20'),
(288, 3, '192.168.0.134', '徐东', '修改类别:ID=7 名称:笔记本电脑', 1, 'xudong', '2017-07-20 10:31:35', '', '2017-07-20'),
(289, 3, '192.168.0.134', '徐东', '修改供应商:中国共产党广州市越秀区委员会老干部局', 1, 'xudong', '2017-07-20 10:32:03', '', '2017-07-20'),
(290, 3, '192.168.0.134', '徐东', '修改商品:ID=3名称:联想 ThinkPad L450-86', 1, 'xudong', '2017-07-20 10:36:00', '', '2017-07-20'),
(291, 3, '192.168.0.134', '徐东', '删除仓库:ID=2 名称:测试仓库2', 1, 'xudong', '2017-07-20 11:27:26', '', '2017-07-20'),
(292, 3, '192.168.0.134', '徐东', '更新仓库:公司仓库', 1, 'xudong', '2017-07-20 11:27:39', '', '2017-07-20'),
(293, 3, '192.168.0.134', '徐东', '修改客户:双敏', 1, 'xudong', '2017-07-20 11:28:07', '', '2017-07-20'),
(294, 3, '192.168.0.134', '徐东', '修改供应商类别:打印机供应商', 1, 'xudong', '2017-07-20 11:28:22', '', '2017-07-20'),
(295, 3, '192.168.0.134', '徐东', '修改供应商类别:电脑供应商', 1, 'xudong', '2017-07-20 11:38:22', '', '2017-07-20'),
(296, NULL, '192.168.0.134', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-20 11:38:53', '', '2017-07-20'),
(297, 1, '192.168.0.134', '吴', '删除账户:ID=2 名称:测试账户2', 1, 'admin', '2017-07-20 11:39:13', '', '2017-07-20'),
(298, 1, '192.168.0.134', '吴', '更新账户:1公司账户', 1, 'admin', '2017-07-20 11:39:25', '', '2017-07-20'),
(299, 1, '192.168.0.134', '吴', '更新员工:编号1 名称张玉莉', 1, 'admin', '2017-07-20 11:39:47', '', '2017-07-20'),
(300, 1, '192.168.0.134', '吴', '更新员工:编号2 名称黎规城', 1, 'admin', '2017-07-20 11:39:56', '', '2017-07-20'),
(301, 1, '192.168.0.134', '吴', '新增员工:编号3 名称丁俊盛', 1, 'admin', '2017-07-20 11:40:12', '', '2017-07-20'),
(302, 1, '192.168.0.134', '吴', '新增员工:编号4 名称皮天午', 1, 'admin', '2017-07-20 11:40:19', '', '2017-07-20'),
(303, 1, '192.168.0.134', '吴', '新增员工:编号5 名称林建新', 1, 'admin', '2017-07-20 11:40:23', '', '2017-07-20'),
(304, 1, '192.168.0.134', '吴', '新增员工:编号6 名称吴哲帆', 1, 'admin', '2017-07-20 11:40:32', '', '2017-07-20'),
(305, 1, '192.168.0.134', '吴', '新增员工:编号7 名称杨清云', 1, 'admin', '2017-07-20 11:40:41', '', '2017-07-20'),
(306, 1, '192.168.0.134', '吴', '修改客户:双敏', 1, 'admin', '2017-07-20 11:41:54', '', '2017-07-20'),
(307, 1, '192.168.0.134', '吴', '新增客户:爱联', 1, 'admin', '2017-07-20 11:42:50', '', '2017-07-20'),
(308, 1, '192.168.0.134', '吴', '修改商品:ID=2名称:测试商品2', 1, 'admin', '2017-07-20 11:43:21', '', '2017-07-20'),
(309, 1, '192.168.0.134', '吴', '修改商品:ID=1名称:测试商品3', 1, 'admin', '2017-07-20 11:43:30', '', '2017-07-20'),
(310, 1, '192.168.0.134', '吴', '修改商品:ID=1名称:惠普HP ProDesk 480 G3', 1, 'admin', '2017-07-20 13:09:02', '', '2017-07-20'),
(311, 1, '192.168.0.134', '吴', '新增供应商类别:集成类供应商', 1, 'admin', '2017-07-20 13:44:40', '', '2017-07-20'),
(312, 1, '192.168.0.134', '吴', '新增客户:广佳', 1, 'admin', '2017-07-20 13:44:43', '', '2017-07-20'),
(313, 1, '192.168.0.134', '吴', '新增商品类别:复合机', 1, 'admin', '2017-07-20 13:48:57', '', '2017-07-20'),
(314, 1, '192.168.0.134', '吴', '新增商品:佳能彩色彩色数码中速复合机智简iR-ADV C3330', 1, 'admin', '2017-07-20 13:49:21', '', '2017-07-20'),
(315, 1, '192.168.0.134', '吴', '新增购货 单据编号：CG201707201351082', 1, 'admin', '2017-07-20 13:51:08', '', '2017-07-20'),
(316, 1, '192.168.0.134', '吴', '新增供应商:广州市海珠区房屋安全和物业二所', 1, 'admin', '2017-07-20 13:52:41', '', '2017-07-20'),
(317, 1, '192.168.0.134', '吴', '新增销货 单据编号：XS201707201353280', 1, 'admin', '2017-07-20 13:53:28', '', '2017-07-20'),
(318, 1, '192.168.0.134', '吴', '修改购货单 单据编号：CG201707201351082', 1, 'admin', '2017-07-20 13:55:56', '', '2017-07-20'),
(319, 1, '192.168.0.134', '吴', '修改销货 单据编号：XS201707201353280', 1, 'admin', '2017-07-20 13:56:02', '', '2017-07-20'),
(320, 1, '192.168.0.134', '吴', '更新仓库:丁俊盛仓库', 1, 'admin', '2017-07-20 15:05:36', '', '2017-07-20'),
(321, 1, '192.168.0.134', '吴', '新增仓库:张玉莉仓库', 1, 'admin', '2017-07-20 15:05:48', '', '2017-07-20'),
(322, 1, '192.168.0.134', '吴', '新增仓库:黎规城仓库', 1, 'admin', '2017-07-20 15:05:54', '', '2017-07-20'),
(323, 1, '192.168.0.134', '吴', '新增仓库:皮天午仓库', 1, 'admin', '2017-07-20 15:07:20', '', '2017-07-20'),
(324, 1, '192.168.0.134', '吴', '新增仓库:林建新仓库', 1, 'admin', '2017-07-20 15:07:51', '', '2017-07-20'),
(325, 1, '192.168.0.134', '吴', '新增仓库:杨清云仓库', 1, 'admin', '2017-07-20 15:09:23', '', '2017-07-20'),
(326, 1, '192.168.0.134', '吴', '新增仓库:吴哲帆仓库', 1, 'admin', '2017-07-20 15:09:27', '', '2017-07-20'),
(327, 1, '192.168.0.134', '吴', '销售明细表导出:sales_detail_20170720151410.xls', 1, 'admin', '2017-07-20 15:14:10', '', '2017-07-20'),
(328, NULL, '192.168.0.134', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-20 16:04:04', '', '2017-07-20'),
(329, 1, '192.168.0.134', '吴', '新增用户:zhangyuli', 1, 'admin', '2017-07-20 17:16:59', '', '2017-07-20'),
(330, 1, '192.168.0.134', '吴', '更新权限:zhangyuli', 1, 'admin', '2017-07-20 17:17:25', '', '2017-07-20'),
(331, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-21 10:42:01', '', '2017-07-21'),
(332, NULL, '192.168.0.134', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-21 10:43:01', '', '2017-07-21'),
(333, 1, '192.168.0.134', '吴', '密码修改成功 UID：1 真实姓名改为：吴', 1, 'admin', '2017-07-21 10:45:23', '', '2017-07-21'),
(334, NULL, '192.168.0.134', NULL, '登陆成功 用户名：15521030223', 1, NULL, '2017-07-21 10:45:51', '', '2017-07-21'),
(335, 1, '192.168.0.134', '吴', '用户停用:zhangyuli', 1, 'admin', '2017-07-21 10:46:00', '', '2017-07-21'),
(336, 1, '192.168.0.134', '吴', '用户启用:zhangyuli', 1, 'admin', '2017-07-21 10:46:04', '', '2017-07-21'),
(337, 1, '192.168.0.134', '吴', '用户停用:xudong', 1, 'admin', '2017-07-21 10:46:25', '', '2017-07-21'),
(338, 1, '192.168.0.134', '吴', '用户停用:xuxiaodong', 1, 'admin', '2017-07-21 10:46:26', '', '2017-07-21'),
(339, 1, '192.168.0.134', '吴', '用户停用:zhangyuli', 1, 'admin', '2017-07-21 10:46:26', '', '2017-07-21'),
(340, 1, '192.168.0.134', '吴', '新增用户:caiwu', 1, 'admin', '2017-07-21 10:49:12', '', '2017-07-21'),
(341, 1, '192.168.0.134', '吴', '更新权限:caiwu', 1, 'admin', '2017-07-21 10:50:46', '', '2017-07-21'),
(342, NULL, '192.168.0.134', NULL, '登陆成功 用户名：caiwu', 1, NULL, '2017-07-21 10:51:15', '', '2017-07-21'),
(343, NULL, '192.168.0.130', NULL, '登陆成功 用户名：caiwu', 1, NULL, '2017-07-21 10:53:50', '', '2017-07-21'),
(344, 6, '192.168.0.134', '财务', '修改销货 单据编号：XS201707201353280', 1, 'caiwu', '2017-07-21 10:55:58', '', '2017-07-21'),
(345, 6, '192.168.0.134', '财务', '修改销货 单据编号：XS201707201353280', 1, 'caiwu', '2017-07-21 10:56:34', '', '2017-07-21'),
(346, 6, '192.168.0.130', '财务', '修改客户:广州市广佳办公设备服务有限公司', 1, 'caiwu', '2017-07-21 10:59:25', '', '2017-07-21'),
(347, 6, '192.168.0.130', '财务', '修改客户:广州爱联科技有限公司', 1, 'caiwu', '2017-07-21 10:59:47', '', '2017-07-21'),
(348, 6, '192.168.0.130', '财务', '修改客户:广州市双敏电子产品有限公司', 1, 'caiwu', '2017-07-21 11:00:22', '', '2017-07-21'),
(349, 6, '192.168.0.130', '财务', '修改客户:广州市广佳办公设备服务有限公司', 1, 'caiwu', '2017-07-21 11:02:27', '', '2017-07-21'),
(350, 6, '192.168.0.130', '财务', '修改客户:广州市广佳办公设备服务有限公司', 1, 'caiwu', '2017-07-21 11:02:48', '', '2017-07-21'),
(351, 6, '192.168.0.130', '财务', '修改客户:广州市广佳办公设备服务有限公司', 1, 'caiwu', '2017-07-21 11:03:48', '', '2017-07-21'),
(352, 6, '192.168.0.130', '财务', '修改客户:广州市广佳办公设备服务有限公司', 1, 'caiwu', '2017-07-21 11:03:56', '', '2017-07-21'),
(353, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-24 09:58:19', '', '2017-07-24'),
(354, NULL, '192.168.0.134', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-24 12:46:55', '', '2017-07-24'),
(355, NULL, '192.168.0.134', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-24 13:04:57', '', '2017-07-24'),
(356, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-24 14:25:13', '', '2017-07-24'),
(357, NULL, '192.168.0.134', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-24 14:33:59', '', '2017-07-24'),
(358, NULL, '192.168.0.134', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-24 14:36:20', '', '2017-07-24'),
(359, 1, '192.168.0.134', '吴', '新增商品类别:办公耗材', 1, 'admin', '2017-07-24 14:48:04', '', '2017-07-24'),
(360, 1, '192.168.0.134', '吴', '新增商品类别:硒鼓墨盒', 1, 'admin', '2017-07-24 14:48:15', '', '2017-07-24'),
(361, 1, '192.168.0.134', '吴', '新增单位:盒', 1, 'admin', '2017-07-24 14:49:30', '', '2017-07-24'),
(362, 1, '192.168.0.134', '吴', '新增商品:佳能 NPG-67 BK墨粉', 1, 'admin', '2017-07-24 14:49:32', '', '2017-07-24'),
(363, 1, '192.168.0.134', '吴', '新增商品:佳能 NPG-28碳粉', 1, 'admin', '2017-07-24 14:49:47', '', '2017-07-24'),
(364, 1, '192.168.0.134', '吴', '修改商品:ID=6名称:佳能彩色彩色数码中速复合机智简iR-ADV C3330', 1, 'admin', '2017-07-24 14:50:12', '', '2017-07-24'),
(365, 1, '192.168.0.134', '吴', '删除仓库:ID=3 名称:张玉莉仓库', 1, 'admin', '2017-07-24 14:50:38', '', '2017-07-24'),
(366, 1, '192.168.0.134', '吴', '删除仓库:ID=4 名称:黎规城仓库', 1, 'admin', '2017-07-24 14:50:40', '', '2017-07-24'),
(367, 1, '192.168.0.134', '吴', '删除仓库:ID=5 名称:皮天午仓库', 1, 'admin', '2017-07-24 14:50:42', '', '2017-07-24'),
(368, 1, '192.168.0.134', '吴', '删除仓库:ID=6 名称:林建新仓库', 1, 'admin', '2017-07-24 14:50:44', '', '2017-07-24'),
(369, 1, '192.168.0.134', '吴', '删除仓库:ID=7 名称:杨清云仓库', 1, 'admin', '2017-07-24 14:50:46', '', '2017-07-24'),
(370, 1, '192.168.0.134', '吴', '删除仓库:ID=8 名称:吴哲帆仓库', 1, 'admin', '2017-07-24 14:50:47', '', '2017-07-24'),
(371, 1, '192.168.0.134', '吴', '更新仓库:公司仓库', 1, 'admin', '2017-07-24 14:51:00', '', '2017-07-24'),
(372, 1, '192.168.0.134', '吴', '修改商品:ID=8名称:佳能 NPG-28碳粉', 1, 'admin', '2017-07-24 14:51:13', '', '2017-07-24'),
(373, 1, '192.168.0.134', '吴', '修改商品:ID=7名称:佳能 NPG-67 BK墨粉', 1, 'admin', '2017-07-24 14:51:17', '', '2017-07-24'),
(374, 1, '192.168.0.134', '吴', '修改商品:ID=6名称:佳能彩色彩色数码中速复合机智简iR-ADV C3330', 1, 'admin', '2017-07-24 14:51:22', '', '2017-07-24'),
(375, 1, '192.168.0.134', '吴', '修改商品:ID=3名称:联想 ThinkPad L450-86', 1, 'admin', '2017-07-24 14:51:25', '', '2017-07-24'),
(376, 1, '192.168.0.134', '吴', '修改商品:ID=2名称:测试商品2', 1, 'admin', '2017-07-24 14:51:30', '', '2017-07-24'),
(377, 1, '192.168.0.134', '吴', '修改商品:ID=1名称:惠普HP ProDesk 480 G3', 1, 'admin', '2017-07-24 14:51:35', '', '2017-07-24'),
(378, 1, '192.168.0.134', '吴', '修改销货 单据编号：XS201707201353280', 1, 'admin', '2017-07-24 14:51:54', '', '2017-07-24'),
(379, 1, '192.168.0.134', '吴', '新增供应商类别:耗材供应商', 1, 'admin', '2017-07-24 14:56:01', '', '2017-07-24'),
(380, 1, '192.168.0.134', '吴', '新增客户:广东原色科技有限公司', 1, 'admin', '2017-07-24 14:56:29', '', '2017-07-24'),
(381, 1, '192.168.0.134', '吴', '新增购货 单据编号：CG201707241458329', 1, 'admin', '2017-07-24 14:58:33', '', '2017-07-24'),
(382, 1, '192.168.0.134', '吴', '修改购货单 单据编号：CG201707241458329', 1, 'admin', '2017-07-24 15:04:25', '', '2017-07-24'),
(383, 1, '192.168.0.134', '吴', '新增销货 单据编号：XS201707241509264', 1, 'admin', '2017-07-24 15:09:26', '', '2017-07-24'),
(384, 1, '192.168.0.134', '吴', '销售明细表导出:sales_detail_20170724151555.xls', 1, 'admin', '2017-07-24 15:15:55', '', '2017-07-24'),
(385, 1, '192.168.0.134', '吴', '销售明细表导出:sales_detail_20170724151619.xls', 1, 'admin', '2017-07-24 15:16:19', '', '2017-07-24'),
(386, NULL, '192.168.0.134', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-24 15:22:09', '', '2017-07-24'),
(387, 1, '192.168.0.134', '吴', '销售明细表导出:sales_detail_20170724152306.xls', 1, 'admin', '2017-07-24 15:23:06', '', '2017-07-24'),
(388, 1, '192.168.0.134', '吴', '用户启用:zhangyuli', 1, 'admin', '2017-07-24 15:40:50', '', '2017-07-24'),
(389, 1, '192.168.0.134', '吴', '用户启用:xuxiaodong', 1, 'admin', '2017-07-24 15:40:54', '', '2017-07-24'),
(390, 1, '192.168.0.134', '吴', '用户启用:xudong', 1, 'admin', '2017-07-24 15:40:56', '', '2017-07-24'),
(391, 1, '192.168.0.134', '吴', '新增用户:dingjunsheng', 1, 'admin', '2017-07-24 15:43:41', '', '2017-07-24'),
(392, 1, '192.168.0.134', '吴', '更新权限:dingjunsheng', 1, 'admin', '2017-07-24 15:46:38', '', '2017-07-24'),
(393, NULL, '127.0.0.1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-24 15:47:30', '', '2017-07-24'),
(394, 1, '192.168.0.134', '吴', '新增用户:pitianwu', 1, 'admin', '2017-07-24 15:54:44', '', '2017-07-24'),
(395, 1, '192.168.0.134', '吴', '更新权限:pitianwu', 1, 'admin', '2017-07-24 15:54:52', '', '2017-07-24'),
(396, 1, '192.168.0.134', '吴', '新增用户:linjianxin', 1, 'admin', '2017-07-24 16:04:50', '', '2017-07-24'),
(397, 1, '192.168.0.134', '吴', '新增用户:yangqingyun', 1, 'admin', '2017-07-24 16:08:27', '', '2017-07-24'),
(398, 1, '192.168.0.134', '吴', '新增用户:liguicheng', 1, 'admin', '2017-07-24 16:09:11', '', '2017-07-24'),
(399, NULL, '192.168.0.134', NULL, '登陆成功 用户名：dingjunsheng', 1, NULL, '2017-07-24 16:19:11', '', '2017-07-24'),
(400, NULL, '192.168.0.134', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-24 16:24:59', '', '2017-07-24'),
(401, NULL, '192.168.0.134', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-26 09:25:12', '', '2017-07-26'),
(402, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-28 15:37:49', '', '2017-07-28'),
(403, 1, '::1', '吴', '删除商品:ID=2 名称:测试商品2', 1, 'admin', '2017-07-28 15:38:17', '', '2017-07-28'),
(404, 1, '::1', '吴', '修改商品:ID=6名称:(32500)佳能彩色彩色数码中速复合机智简iR-ADV C3330', 1, 'admin', '2017-07-28 15:41:33', '', '2017-07-28'),
(405, 1, '::1', '吴', '修改商品:ID=7名称:(650)佳能 NPG-67 BK墨粉', 1, 'admin', '2017-07-28 15:41:58', '', '2017-07-28'),
(406, 1, '::1', '吴', '修改商品:ID=8名称:(155)佳能 NPG-28碳粉', 1, 'admin', '2017-07-28 15:42:09', '', '2017-07-28'),
(407, 1, '::1', '吴', '删除商品:ID=3 名称:联想 ThinkPad L450-86', 1, 'admin', '2017-07-28 15:42:15', '', '2017-07-28'),
(408, 1, '::1', '吴', '删除商品:ID=1 名称:惠普HP ProDesk 480 G3', 1, 'admin', '2017-07-28 15:42:17', '', '2017-07-28'),
(409, 1, '::1', '吴', '修改购货单 单据编号：CG201707201351082', 1, 'admin', '2017-07-28 15:42:34', '', '2017-07-28'),
(410, 1, '::1', '吴', '修改购货单 单据编号：CG201707241458329', 1, 'admin', '2017-07-28 15:42:38', '', '2017-07-28'),
(411, 1, '::1', '吴', '修改购货单 单据编号：CG201707241458329', 1, 'admin', '2017-07-28 15:42:41', '', '2017-07-28'),
(412, 1, '::1', '吴', '新增商品类别:过单专用', 1, 'admin', '2017-07-28 15:44:14', '', '2017-07-28'),
(413, 1, '::1', '吴', '新增商品类别:过单设备', 1, 'admin', '2017-07-28 15:44:46', '', '2017-07-28'),
(414, 1, '::1', '吴', '新增商品类别:过单耗材', 1, 'admin', '2017-07-28 15:44:54', '', '2017-07-28'),
(415, 1, '::1', '吴', '新增商品类别:打印机', 1, 'admin', '2017-07-28 15:46:02', '', '2017-07-28'),
(416, 1, '::1', '吴', '新增商品类别:台式电脑', 1, 'admin', '2017-07-28 15:46:12', '', '2017-07-28'),
(417, 1, '::1', '吴', '新增商品类别:笔记本电脑', 1, 'admin', '2017-07-28 15:46:23', '', '2017-07-28'),
(418, 1, '::1', '吴', '新增商品类别:复合机', 1, 'admin', '2017-07-28 15:46:33', '', '2017-07-28'),
(419, 1, '::1', '吴', '新增商品类别:硒鼓墨盒', 1, 'admin', '2017-07-28 15:46:47', '', '2017-07-28');
INSERT INTO `ci_log` (`id`, `userId`, `ip`, `name`, `log`, `type`, `loginName`, `modifyTime`, `operateTypeName`, `adddate`) VALUES
(420, 1, '::1', '吴', '新增商品类别:直单专用', 1, 'admin', '2017-07-28 15:47:30', '', '2017-07-28'),
(421, 1, '::1', '吴', '修改类别:ID=1 名称:办公设备', 1, 'admin', '2017-07-28 15:47:38', '', '2017-07-28'),
(422, 1, '::1', '吴', '修改类别:ID=19 名称:办公耗材', 1, 'admin', '2017-07-28 15:47:52', '', '2017-07-28'),
(423, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-07-28 16:54:57', '', '2017-07-28'),
(424, 1, '::1', '吴', '登陆成功 用户名：admin', 1, 'admin', '2017-07-28 17:18:24', '', '2017-07-28'),
(425, 1, '::1', '吴', '新增商品类别:摄像设备', 1, 'admin', '2017-07-28 17:29:19', '', '2017-07-28'),
(426, 1, '::1', '吴', '新增商品类别:数码相机', 1, 'admin', '2017-07-28 17:29:27', '', '2017-07-28'),
(427, 1, '::1', '吴', '新增商品类别:单反', 1, 'admin', '2017-07-28 17:29:32', '', '2017-07-28'),
(428, 1, '::1', '吴', '新增商品类别:微单', 1, 'admin', '2017-07-28 17:29:40', '', '2017-07-28'),
(429, 1, '::1', '吴', '新增商品类别:摄像配件', 1, 'admin', '2017-07-28 17:29:48', '', '2017-07-28'),
(430, 1, '::1', '吴', '新增商品类别:摄像设备', 1, 'admin', '2017-07-28 17:29:57', '', '2017-07-28'),
(431, 1, '::1', '吴', '新增商品类别:数码相机', 1, 'admin', '2017-07-28 17:30:04', '', '2017-07-28'),
(432, 1, '::1', '吴', '新增商品类别:单反', 1, 'admin', '2017-07-28 17:30:10', '', '2017-07-28'),
(433, 1, '::1', '吴', '新增商品类别:微单', 1, 'admin', '2017-07-28 17:30:16', '', '2017-07-28'),
(434, 1, '::1', '吴', '新增商品类别:摄像配件', 1, 'admin', '2017-07-28 17:30:24', '', '2017-07-28'),
(435, 1, '::1', '吴', '新增商品:<2199>佳能powershot SX620 HS数码相机', 1, 'admin', '2017-07-28 17:31:21', '', '2017-07-28'),
(436, 1, '::1', '吴', '新增商品:<5999>华硕P453UJ62084DS2笔记本电脑', 1, 'admin', '2017-07-28 17:32:33', '', '2017-07-28'),
(437, 1, '::1', '吴', '新增商品:<5999>华硕D520MT-156500台式电脑', 1, 'admin', '2017-07-28 17:33:29', '', '2017-07-28'),
(438, 1, '::1', '吴', '新增商品:<4499>华硕D520MT台式电脑', 1, 'admin', '2017-07-28 17:34:22', '', '2017-07-28'),
(439, 1, '::1', '吴', '新增购货 单据编号：CG201707281734457', 1, 'admin', '2017-07-28 17:34:45', '', '2017-07-28'),
(440, 1, '::1', '吴', '新增供应商:广州市黄浦区人民政府荔联街道办事处', 1, 'admin', '2017-07-28 17:35:57', '', '2017-07-28'),
(441, 1, '::1', '吴', '新增销货 单据编号：XS201707281737467', 1, 'admin', '2017-07-28 17:37:46', '', '2017-07-28'),
(442, 1, '::1', '吴', '修改销货 单据编号：XS201707281737467', 1, 'admin', '2017-07-28 17:38:43', '', '2017-07-28'),
(443, 1, '::1', '吴', '新增商品类别:复印机', 1, 'admin', '2017-07-31 09:48:46', '', '2017-07-31'),
(444, 1, '::1', '吴', '新增商品类别:移除', 1, 'admin', '2017-07-31 09:49:07', '', '2017-07-31'),
(445, 1, '::1', '吴', '修改类别:ID=22 名称:过单专用', 1, 'admin', '2017-07-31 09:49:16', '', '2017-07-31'),
(446, 1, '::1', '吴', '新增商品类别:测试', 1, 'admin', '2017-07-31 09:49:40', '', '2017-07-31'),
(447, 1, '::1', '吴', '新增商品类别:测试2222', 1, 'admin', '2017-07-31 09:49:51', '', '2017-07-31'),
(448, 1, '::1', '吴', '删除商品类别:ID=44 名称:测试2222', 1, 'admin', '2017-07-31 09:50:00', '', '2017-07-31'),
(449, 1, '::1', '吴', '删除商品类别:ID=43 名称:测试', 1, 'admin', '2017-07-31 09:50:03', '', '2017-07-31'),
(450, 1, '::1', '吴', '修改类别:ID=22 名称:过单专用', 1, 'admin', '2017-07-31 09:50:16', '', '2017-07-31'),
(451, 1, '::1', '吴', '修改类别:ID=30 名称:直单专用', 1, 'admin', '2017-07-31 09:50:25', '', '2017-07-31'),
(452, 1, '::1', '吴', '修改类别:ID=30 名称:直单专用', 1, 'admin', '2017-07-31 09:50:32', '', '2017-07-31'),
(453, 1, '::1', '吴', '修改类别:ID=30 名称:直单专用', 1, 'admin', '2017-07-31 09:50:39', '', '2017-07-31'),
(454, 1, '::1', '吴', '修改类别:ID=30 名称:直单专用★', 1, 'admin', '2017-07-31 09:51:39', '', '2017-07-31'),
(455, 1, '::1', '吴', '修改类别:ID=22 名称:过单专用', 1, 'admin', '2017-07-31 09:52:15', '', '2017-07-31'),
(456, 1, '::1', '吴', '修改类别:ID=23 名称:过单设备', 1, 'admin', '2017-07-31 09:52:39', '', '2017-07-31'),
(457, 1, '::1', '吴', '修改类别:ID=23 名称:过单设备', 1, 'admin', '2017-07-31 09:52:48', '', '2017-07-31'),
(458, 1, '::1', '吴', '修改类别:ID=23 名称:过单设备', 1, 'admin', '2017-07-31 09:53:22', '', '2017-07-31'),
(459, 1, '::1', '吴', '修改类别:ID=24 名称:过单耗材', 1, 'admin', '2017-07-31 09:53:30', '', '2017-07-31'),
(460, 1, '::1', '吴', '修改类别:ID=31 名称:过单摄像设备', 1, 'admin', '2017-07-31 09:53:47', '', '2017-07-31'),
(461, 1, '::1', '吴', '删除商品类别:ID=22 名称:过单专用', 1, 'admin', '2017-07-31 09:53:51', '', '2017-07-31'),
(462, 1, '::1', '吴', '修改类别:ID=42 名称:过单专用△', 1, 'admin', '2017-07-31 09:54:32', '', '2017-07-31'),
(463, 1, '::1', '吴', '修改类别:ID=23 名称:过单设备', 1, 'admin', '2017-07-31 09:54:42', '', '2017-07-31'),
(464, 1, '::1', '吴', '修改类别:ID=24 名称:过单耗材', 1, 'admin', '2017-07-31 09:54:46', '', '2017-07-31'),
(465, 1, '::1', '吴', '修改类别:ID=31 名称:过单摄像设备', 1, 'admin', '2017-07-31 09:54:55', '', '2017-07-31'),
(466, 1, '::1', '吴', '新增商品:富士施乐（FujiXerox）DocuCentre-V C2265 CPS 2T A3彩色复印机（工作台+传真组件）', 1, 'admin', '2017-07-31 09:55:52', '', '2017-07-31'),
(467, 1, '::1', '吴', '新增购货 单据编号：CG201707310957118', 1, 'admin', '2017-07-31 09:57:11', '', '2017-07-31'),
(468, 1, '::1', '吴', '新增供应商:广州市人民政府办公厅', 1, 'admin', '2017-07-31 09:57:38', '', '2017-07-31'),
(469, 1, '::1', '吴', '新增销货 单据编号：XS201707310958002', 1, 'admin', '2017-07-31 09:58:00', '', '2017-07-31'),
(470, 1, '::1', '吴', '修改商品:ID=13名称:<29500>富士施乐（FujiXerox）DocuCentre-V C2265 CPS 2T A3彩色复印机（工', 1, 'admin', '2017-07-31 09:58:32', '', '2017-07-31'),
(471, 1, '::1', '吴', '修改销货 单据编号：XS201707310958002', 1, 'admin', '2017-07-31 09:59:58', '', '2017-07-31'),
(472, 1, '::1', '吴', '新增商品类别:打印纸', 1, 'admin', '2017-07-31 10:08:54', '', '2017-07-31'),
(473, 1, '::1', '吴', '新增单位:箱', 1, 'admin', '2017-07-31 10:09:54', '', '2017-07-31'),
(474, 1, '::1', '吴', '新增商品:施乐（Xerox）捷印复印纸 80g A4（5包一箱）', 1, 'admin', '2017-07-31 10:09:59', '', '2017-07-31'),
(475, 1, '::1', '吴', '新增购货 单据编号：CG201707311010221', 1, 'admin', '2017-07-31 10:10:22', '', '2017-07-31'),
(476, 1, '::1', '吴', '新增商品:佳能 CRG-328 硒鼓', 1, 'admin', '2017-07-31 10:11:38', '', '2017-07-31'),
(477, 1, '::1', '吴', '新增商品:<1580>惠普 507A CE401A 青色原装硒鼓', 1, 'admin', '2017-07-31 10:12:37', '', '2017-07-31'),
(478, 1, '::1', '吴', '新增商品:<1280>惠普 507A CE400A 黑色原装硒鼓', 1, 'admin', '2017-07-31 10:13:12', '', '2017-07-31'),
(479, 1, '::1', '吴', '新增商品:<480>惠普 88A 原装硒鼓', 1, 'admin', '2017-07-31 10:13:45', '', '2017-07-31'),
(480, 1, '::1', '吴', '新增商品:<750>惠普 53A 黑色硒鼓（Q7553A）', 1, 'admin', '2017-07-31 10:15:38', '', '2017-07-31'),
(481, 1, '::1', '吴', '修改购货单 单据编号：CG201707311010221', 1, 'admin', '2017-07-31 10:16:09', '', '2017-07-31'),
(482, 1, '::1', '吴', '新增销货 单据编号：XS201707311018053', 1, 'admin', '2017-07-31 10:18:05', '', '2017-07-31'),
(483, 1, '::1', '吴', '新增商品类别:摄像机', 1, 'admin', '2017-07-31 10:25:03', '', '2017-07-31'),
(484, 1, '::1', '吴', '新增商品类别:销毁设备', 1, 'admin', '2017-07-31 10:25:47', '', '2017-07-31'),
(485, 1, '::1', '吴', '新增商品类别:多功能一体机', 1, 'admin', '2017-07-31 10:26:16', '', '2017-07-31'),
(486, 1, '::1', '吴', '新增商品:<7900>索尼（SONY）FDR-AX40 摄像机（64G高速内存卡+摄像包）', 1, 'admin', '2017-07-31 10:26:54', '', '2017-07-31'),
(487, 1, '::1', '吴', '新增商品:<4999>索尼 ILCE-6000L 数码微单相机（配16-50镜头）', 1, 'admin', '2017-07-31 10:27:42', '', '2017-07-31'),
(488, 1, '::1', '吴', '新增商品:<19999>佳能 EOS 5DS 数码单反相机（EF 24-105mm f/4L IS USM 镜头 ）', 1, 'admin', '2017-07-31 10:28:17', '', '2017-07-31'),
(489, 1, '::1', '吴', '新增商品:<1999>三木碎纸机MSD9620（刀具终生保修）', 1, 'admin', '2017-07-31 10:28:51', '', '2017-07-31'),
(490, 1, '::1', '吴', '新增商品:<29700>佳能IR2525I复印机（配内置式装订器-B1，50页自动角落装订，两点装订，双纸盒，工作台）', 1, 'admin', '2017-07-31 10:29:41', '', '2017-07-31'),
(491, 1, '::1', '吴', '新增商品:<2890>佳能（Canon）LBP6230dn激光打印机（3年上门服务）', 1, 'admin', '2017-07-31 10:30:26', '', '2017-07-31'),
(492, 1, '::1', '吴', '新增商品:<5800>佳能MF412DN一体机', 1, 'admin', '2017-07-31 10:31:14', '', '2017-07-31'),
(493, 1, '::1', '吴', '新增商品:<5900>HP Color LaserJet Pro MFP M277dw 彩色激光一体机（三年上门服务）', 1, 'admin', '2017-07-31 10:32:00', '', '2017-07-31'),
(494, 1, '::1', '吴', '新增商品:<5999>惠普（HP）ProDesk 480 G3 台式机电脑（I5-6500 8G 128G+1000G 2G独立显卡DVDRW 无系统 大客户优先服务 三年保修 21.5寸显示器+键盘鼠标）', 1, 'admin', '2017-07-31 10:32:53', '', '2017-07-31'),
(495, 1, '::1', '吴', '新增商品:<5999>惠普（HP）PROBOOK 430 G3 13.3寸笔记本（i5-6200u 4G 128G+1TB 集显 DOS）', 1, 'admin', '2017-07-31 10:33:40', '', '2017-07-31'),
(496, 1, '::1', '吴', '新增购货 单据编号：CG201707311034011', 1, 'admin', '2017-07-31 10:34:01', '', '2017-07-31'),
(497, 1, '::1', '吴', '新增销货 单据编号：XS201707311037066', 1, 'admin', '2017-07-31 10:37:06', '', '2017-07-31'),
(498, 1, '::1', '吴', '新增供应商:广州市黄埔区人民政府黄埔街道办事处', 1, 'admin', '2017-07-31 10:37:38', '', '2017-07-31'),
(499, 1, '::1', '吴', '修改销货 单据编号：XS201707311037066', 1, 'admin', '2017-07-31 10:37:44', '', '2017-07-31'),
(500, 1, '::1', '吴', '修改商品:ID=14名称:<135>施乐（Xerox）捷印复印纸 80g A4（5包一箱）', 1, 'admin', '2017-07-31 10:39:31', '', '2017-07-31'),
(501, 1, '::1', '吴', '修改商品:ID=15名称:<500>佳能 CRG-328 硒鼓', 1, 'admin', '2017-07-31 10:40:05', '', '2017-07-31'),
(502, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-01 09:42:48', '', '2017-08-01'),
(503, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-01 10:10:36', '', '2017-08-01'),
(504, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-02 09:34:00', '', '2017-08-02'),
(505, 1, '::1', '吴', '新增商品:<4999>联想启天M410-D002 i5-6500/4G/1T/集显/DVDRW/DOS/19.5', 1, 'admin', '2017-08-02 09:37:29', '', '2017-08-02'),
(506, 1, '::1', '吴', '新增商品:<1900>三木 MSD9520 碎纸机', 1, 'admin', '2017-08-02 09:38:25', '', '2017-08-02'),
(507, 1, '::1', '吴', '新增购货 单据编号：CG201708020940071', 1, 'admin', '2017-08-02 09:40:07', '', '2017-08-02'),
(508, 1, '::1', '吴', '新增销货 单据编号：XS201708020941349', 1, 'admin', '2017-08-02 09:41:34', '', '2017-08-02'),
(509, 1, '::1', '吴', '修改销货 单据编号：XS201707281737467', 1, 'admin', '2017-08-02 09:48:58', '', '2017-08-02'),
(510, 1, '::1', '吴', '新增供应商:广州市司法局', 1, 'admin', '2017-08-02 09:53:56', '', '2017-08-02'),
(511, 1, '::1', '吴', '修改销货 单据编号：XS201707311018053', 1, 'admin', '2017-08-02 09:53:59', '', '2017-08-02'),
(512, 1, '::1', '吴', '修改销货 单据编号：XS201707311018053', 1, 'admin', '2017-08-02 09:55:05', '', '2017-08-02'),
(513, 1, '::1', '吴', '修改销货 单据编号：XS201707311018053', 1, 'admin', '2017-08-02 09:55:13', '', '2017-08-02'),
(514, 1, '::1', '吴', '修改销货 单据编号：XS201707311037066', 1, 'admin', '2017-08-02 09:56:33', '', '2017-08-02'),
(515, 1, '::1', '吴', '修改销货 单据编号：XS201707310958002', 1, 'admin', '2017-08-02 09:57:13', '', '2017-08-02'),
(516, 1, '::1', '吴', '修改销货 单据编号：XS201707310958002', 1, 'admin', '2017-08-02 09:58:03', '', '2017-08-02'),
(517, NULL, '192.168.0.130', NULL, '登陆成功 用户名：caiwu', 1, NULL, '2017-08-02 10:43:45', '', '2017-08-02'),
(518, 6, '192.168.0.130', '财务', '新增客户:深圳市鸿合创新信息技术有限责任公司', 1, 'caiwu', '2017-08-02 10:46:52', '', '2017-08-02'),
(519, 6, '192.168.0.130', '财务', '修改客户:深圳市鸿合创新信息技术有限责任公司', 1, 'caiwu', '2017-08-02 10:47:05', '', '2017-08-02'),
(520, 6, '192.168.0.130', '财务', '新增客户:广州上乘信息科技有限公司', 1, 'caiwu', '2017-08-02 10:47:42', '', '2017-08-02'),
(521, 6, '192.168.0.130', '财务', '新增商品类别:过单系统软件', 1, 'caiwu', '2017-08-02 10:51:07', '', '2017-08-02'),
(522, 6, '192.168.0.130', '财务', '新增商品类别:操作系统', 1, 'caiwu', '2017-08-02 10:52:02', '', '2017-08-02'),
(523, 6, '192.168.0.130', '财务', '新增商品类别:办公软件', 1, 'caiwu', '2017-08-02 10:52:16', '', '2017-08-02'),
(524, 6, '192.168.0.130', '财务', '新增商品类别:触控一体机', 1, 'caiwu', '2017-08-02 10:53:01', '', '2017-08-02'),
(525, 6, '192.168.0.130', '财务', '新增商品类别:平板电脑', 1, 'caiwu', '2017-08-02 10:53:21', '', '2017-08-02'),
(526, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-02 10:55:27', '', '2017-08-02'),
(527, 1, '::1', '吴', '新增员工:编号8 名称韩国良', 1, 'admin', '2017-08-02 10:55:41', '', '2017-08-02'),
(528, 6, '192.168.0.130', '财务', '新增商品类别:触控一体机', 1, 'caiwu', '2017-08-02 10:57:35', '', '2017-08-02'),
(529, 6, '192.168.0.130', '财务', '新增商品:<11800>交互书写屏', 1, 'caiwu', '2017-08-02 10:57:54', '', '2017-08-02'),
(530, 6, '192.168.0.130', '财务', '新增商品:<2200>OPS电脑HO-361', 1, 'caiwu', '2017-08-02 10:58:57', '', '2017-08-02'),
(531, 6, '192.168.0.130', '财务', '新增商品:<100>操作系统WIN10', 1, 'caiwu', '2017-08-02 11:00:18', '', '2017-08-02'),
(532, 6, '192.168.0.130', '财务', '新增商品:<100>办公软件OFFICE', 1, 'caiwu', '2017-08-02 11:01:02', '', '2017-08-02'),
(533, 6, '192.168.0.130', '财务', '新增商品:<0>资源软件 人教版', 1, 'caiwu', '2017-08-02 11:01:52', '', '2017-08-02'),
(534, 6, '192.168.0.130', '财务', '新增购货 单据编号：CG201708021102174', 1, 'caiwu', '2017-08-02 11:02:17', '', '2017-08-02'),
(535, 6, '192.168.0.130', '财务', '新增商品:<4750>', 1, 'caiwu', '2017-08-02 11:04:17', '', '2017-08-02'),
(536, 6, '192.168.0.130', '财务', '新增购货 单据编号：CG201708021104599', 1, 'caiwu', '2017-08-02 11:04:59', '', '2017-08-02'),
(537, 6, '192.168.0.130', '财务', '修改商品:ID=37名称:<4750>华为平板电脑matebook M3 4G 128G 金色+键盘', 1, 'caiwu', '2017-08-02 11:05:42', '', '2017-08-02'),
(538, 6, '192.168.0.130', '财务', '修改商品:ID=32名称:<11800>交互书写屏HD-I757VE', 1, 'caiwu', '2017-08-02 11:06:10', '', '2017-08-02'),
(539, 6, '192.168.0.130', '财务', '登陆成功 用户名：caiwu', 1, 'caiwu', '2017-08-02 11:12:34', '', '2017-08-02'),
(540, 6, '192.168.0.130', '财务', '新增供应商:广州市花都区文化广电新闻出版局', 1, 'caiwu', '2017-08-02 11:16:15', '', '2017-08-02'),
(541, 6, '192.168.0.130', '财务', '修改商品:ID=37名称:<4750>华为平板电脑matebook M3 4G 128G 金色+键盘', 1, 'caiwu', '2017-08-02 11:16:51', '', '2017-08-02'),
(542, 6, '192.168.0.130', '财务', '新增销货 单据编号：XS201708021117341', 1, 'caiwu', '2017-08-02 11:17:34', '', '2017-08-02'),
(543, 6, '192.168.0.130', '财务', '修改销货 单据编号：XS201708021117341', 1, 'caiwu', '2017-08-02 11:21:13', '', '2017-08-02'),
(544, NULL, '192.168.0.130', NULL, '登陆成功 用户名：caiwu', 1, NULL, '2017-08-04 13:28:14', '', '2017-08-04'),
(545, NULL, '192.168.0.127', NULL, '登陆成功 用户名：caiwu', 1, NULL, '2017-08-04 13:29:20', '', '2017-08-04'),
(546, 6, '192.168.0.127', '财务', '登陆成功 用户名：caiwu', 1, 'caiwu', '2017-08-04 13:31:51', '', '2017-08-04'),
(547, 6, '192.168.0.127', '财务', '登陆成功 用户名：caiwu', 1, 'caiwu', '2017-08-04 13:33:44', '', '2017-08-04'),
(548, 6, '192.168.0.127', '财务', '登陆成功 用户名：caiwu', 1, 'caiwu', '2017-08-04 13:37:30', '', '2017-08-04'),
(549, 6, '192.168.0.127', '财务', '登陆成功 用户名：caiwu', 1, 'caiwu', '2017-08-04 13:40:38', '', '2017-08-04'),
(550, NULL, '192.168.0.138', NULL, '登陆成功 用户名：pitianwu', 1, NULL, '2017-08-10 16:11:08', '', '2017-08-10'),
(551, NULL, '192.168.0.110', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-11 14:25:25', '', '2017-08-11'),
(552, NULL, '192.168.0.126', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-11 14:43:43', '', '2017-08-11'),
(553, 1, '192.168.0.126', '吴', '密码修改成功 UID：1 真实姓名改为：吴哲帆', 1, 'admin', '2017-08-11 14:46:02', '', '2017-08-11'),
(554, 1, '192.168.0.126', '吴', '登陆成功 用户名：15521030223', 1, 'admin', '2017-08-11 14:54:12', '', '2017-08-11'),
(555, NULL, '192.168.0.138', NULL, '登陆成功 用户名：pitianwu', 1, NULL, '2017-08-11 15:33:59', '', '2017-08-11'),
(556, NULL, '192.168.0.144', NULL, '登陆成功 用户名：linjianxin', 1, NULL, '2017-08-11 15:36:17', '', '2017-08-11'),
(557, 9, '192.168.0.144', '林建新', '密码修改成功 UID：9 真实姓名改为：林健新', 1, 'linjianxin', '2017-08-11 15:37:22', '', '2017-08-11'),
(558, 9, '192.168.0.144', '林建新', '新增客户:广州精海电子科技有限公司', 1, 'linjianxin', '2017-08-11 15:39:28', '', '2017-08-11'),
(559, 9, '192.168.0.144', '林建新', '新增商品:(650)硒鼓CF228A', 1, 'linjianxin', '2017-08-11 15:42:04', '', '2017-08-11'),
(560, 9, '192.168.0.144', '林建新', '新增商品:(1630)惠普M403d', 1, 'linjianxin', '2017-08-11 15:43:48', '', '2017-08-11'),
(561, 9, '192.168.0.144', '林建新', '新增商品:(2450)惠普M252dw', 1, 'linjianxin', '2017-08-11 15:46:31', '', '2017-08-11'),
(562, 9, '192.168.0.144', '林建新', '新增购货 单据编号：CG201708111549588', 1, 'linjianxin', '2017-08-11 15:49:58', '', '2017-08-11'),
(563, 9, '192.168.0.144', '林建新', '新增供应商:广州市越秀区文化广电新闻出版局', 1, 'linjianxin', '2017-08-11 15:50:38', '', '2017-08-11'),
(564, 9, '192.168.0.144', '林建新', '新增销货 单据编号：XS201708111553111', 1, 'linjianxin', '2017-08-11 15:53:11', '', '2017-08-11'),
(565, NULL, '192.168.0.144', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-11 15:53:25', '', '2017-08-11'),
(566, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-11 15:57:48', '', '2017-08-11'),
(567, 1, '::1', '吴哲帆', '密码修改成功 UID：1 真实姓名改为：吴哲帆', 1, 'admin', '2017-08-11 15:58:01', '', '2017-08-11'),
(568, NULL, '192.168.0.124', NULL, '登陆成功 用户名：dingjunsheng', 1, NULL, '2017-08-11 16:08:37', '', '2017-08-11'),
(569, 1, '192.168.0.126', '吴哲帆', '登陆成功 用户名：admin', 1, 'admin', '2017-08-14 10:32:58', '', '2017-08-14'),
(570, NULL, '192.168.0.123', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-14 10:33:08', '', '2017-08-14'),
(571, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-14 16:13:38', '', '2017-08-14'),
(572, 1, '::1', '吴哲帆', '新增商品:<2699>惠普M226DN黑白双面一体机', 1, 'admin', '2017-08-14 16:16:08', '', '2017-08-14'),
(573, 1, '::1', '吴哲帆', '新增商品:<295>罗技 C525 高清摄像头', 1, 'admin', '2017-08-14 16:17:56', '', '2017-08-14'),
(574, 1, '::1', '吴哲帆', '新增商品:<1600>华旭 HX-FDX3S 身份证阅读器', 1, 'admin', '2017-08-14 16:18:51', '', '2017-08-14'),
(575, 1, '::1', '吴哲帆', '新增购货 单据编号：CG201708141619119', 1, 'admin', '2017-08-14 16:19:11', '', '2017-08-14'),
(576, 1, '::1', '吴哲帆', '新增销货 单据编号：XS201708141620214', 1, 'admin', '2017-08-14 16:20:21', '', '2017-08-14'),
(577, 1, '::1', '吴哲帆', '修改销货 单据编号：XS201708141620214', 1, 'admin', '2017-08-14 16:22:31', '', '2017-08-14'),
(578, 1, '::1', '吴哲帆', '修改销货 单据编号：XS201708141620214', 1, 'admin', '2017-08-14 16:31:45', '', '2017-08-14'),
(579, 1, '::1', '吴哲帆', '新增商品:<2899>惠普HP Color LaserJet Pro M252dw 彩色双面网络激光打印机', 1, 'admin', '2017-08-14 16:34:54', '', '2017-08-14'),
(580, 1, '::1', '吴哲帆', '新增商品:<2980>惠普黑白激光打印机 M403D 三年服务', 1, 'admin', '2017-08-14 16:35:43', '', '2017-08-14'),
(581, 1, '::1', '吴哲帆', '修改购货单 单据编号：CG201708141619119', 1, 'admin', '2017-08-14 16:35:56', '', '2017-08-14'),
(582, 1, '::1', '吴哲帆', '新增供应商:广州市潭岗强制隔离戒毒所', 1, 'admin', '2017-08-14 16:36:40', '', '2017-08-14'),
(583, 1, '::1', '吴哲帆', '新增销货 单据编号：XS201708141637595', 1, 'admin', '2017-08-14 16:37:59', '', '2017-08-14'),
(584, 1, '::1', '吴哲帆', '修改销货 单据编号：XS201708141637595', 1, 'admin', '2017-08-14 16:38:43', '', '2017-08-14'),
(585, 1, '::1', '吴哲帆', '新增商品:<619>闪迪（SanDisk）至尊高速（CZ48） 256GB USB3.0 U盘', 1, 'admin', '2017-08-14 16:53:26', '', '2017-08-14'),
(586, 1, '::1', '吴哲帆', '新增购货 单据编号：CG201708141653402', 1, 'admin', '2017-08-14 16:53:40', '', '2017-08-14'),
(587, 1, '::1', '吴哲帆', '新增销货 单据编号：XS201708141654157', 1, 'admin', '2017-08-14 16:54:15', '', '2017-08-14'),
(588, 1, '::1', '吴哲帆', '修改销货 单据编号：XS201708141654157', 1, 'admin', '2017-08-14 16:55:29', '', '2017-08-14'),
(589, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-17 11:58:51', '', '2017-08-17'),
(590, 1, '::1', '吴哲帆', '销售明细表导出:sales_detail_20170817115931.xls', 1, 'admin', '2017-08-17 11:59:31', '', '2017-08-17'),
(591, NULL, '192.168.0.146', NULL, '登陆成功 用户名：xudong', 1, NULL, '2017-08-17 15:15:51', '', '2017-08-17'),
(592, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-17 17:49:35', '', '2017-08-17'),
(593, NULL, '192.168.0.123', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-18 19:17:37', '', '2017-08-18'),
(594, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-22 10:24:15', '', '2017-08-22'),
(595, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-22 10:27:19', '', '2017-08-22'),
(596, 1, '::1', '吴哲帆', '新增用户:zhangyuli', 1, 'admin', '2017-08-22 10:28:25', '', '2017-08-22'),
(597, NULL, '192.168.0.136', NULL, '登陆成功 用户名：zhangyuli', 1, NULL, '2017-08-22 10:30:22', '', '2017-08-22'),
(598, 12, '192.168.0.136', '张玉莉', '登陆成功 用户名：zhangyuli', 1, 'zhangyuli', '2017-08-22 10:32:58', '', '2017-08-22'),
(599, 12, '192.168.0.136', '张玉莉', '新增商品:HP/惠普 Color LaserJet Pro M452dn', 1, 'zhangyuli', '2017-08-22 10:35:45', '', '2017-08-22'),
(600, 12, '192.168.0.136', '张玉莉', '修改商品:ID=47名称:(3560)HP/惠普 Color LaserJet Pro M452dn', 1, 'zhangyuli', '2017-08-22 10:36:27', '', '2017-08-22'),
(601, 12, '192.168.0.136', '张玉莉', '新增购货 单据编号：CG201708221037164', 1, 'zhangyuli', '2017-08-22 10:37:16', '', '2017-08-22'),
(602, 12, '192.168.0.136', '张玉莉', '新增供应商类别:空调冰箱应商', 1, 'zhangyuli', '2017-08-22 10:39:58', '', '2017-08-22'),
(603, 12, '192.168.0.136', '张玉莉', '新增客户:广州市东奔电器有限公司', 1, 'zhangyuli', '2017-08-22 10:40:37', '', '2017-08-22'),
(604, 1, '::1', '吴哲帆', '新增商品类别:空调冰箱家用电器', 1, 'admin', '2017-08-22 10:41:55', '', '2017-08-22'),
(605, 12, '192.168.0.136', '张玉莉', '新增商品:(2960)海尔 厨房操作台 冰柜 SP-330C2', 1, 'zhangyuli', '2017-08-22 10:42:25', '', '2017-08-22'),
(606, 12, '192.168.0.136', '张玉莉', '新增商品:(2024)海尔空调 大1匹 挂机 定频单冷 KF-26GW/06NCA12', 1, 'zhangyuli', '2017-08-22 10:44:05', '', '2017-08-22'),
(607, 12, '192.168.0.136', '张玉莉', '新增购货 单据编号：CG201708221044350', 1, 'zhangyuli', '2017-08-22 10:44:35', '', '2017-08-22'),
(608, 12, '192.168.0.136', '张玉莉', '新增销货 单据编号：XS201708221045371', 1, 'zhangyuli', '2017-08-22 10:45:37', '', '2017-08-22'),
(609, 12, '192.168.0.136', '张玉莉', '新增供应商:广州市光彩事业指导中心', 1, 'zhangyuli', '2017-08-22 10:46:04', '', '2017-08-22'),
(610, 12, '192.168.0.136', '张玉莉', '新增销货 单据编号：XS201708221046260', 1, 'zhangyuli', '2017-08-22 10:46:26', '', '2017-08-22'),
(611, 12, '192.168.0.136', '张玉莉', '新增供应商:广州医科大学附属口腔医院(广州医科大学羊城医院)', 1, 'zhangyuli', '2017-08-22 10:46:47', '', '2017-08-22'),
(612, 12, '192.168.0.136', '张玉莉', '新增销货 单据编号：XS201708221047204', 1, 'zhangyuli', '2017-08-22 10:47:20', '', '2017-08-22'),
(613, NULL, '::1', NULL, '登陆成功 用户名：admin', 1, NULL, '2017-08-22 10:50:27', '', '2017-08-22');

-- --------------------------------------------------------

--
-- 表的结构 `ci_menu`
--

CREATE TABLE IF NOT EXISTS `ci_menu` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `parentId` smallint(5) DEFAULT '0' COMMENT '上级栏目ID',
  `path` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目路径',
  `level` tinyint(2) DEFAULT '1' COMMENT '层次',
  `ordnum` smallint(6) DEFAULT '0' COMMENT '排序',
  `module` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `typeNumber` varchar(25) COLLATE utf8_unicode_ci DEFAULT '',
  `detail` tinyint(1) DEFAULT '1',
  `sortIndex` smallint(6) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parentId` (`parentId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=203 ;

--
-- 转存表中的数据 `ci_menu`
--

INSERT INTO `ci_menu` (`id`, `name`, `parentId`, `path`, `level`, `ordnum`, `module`, `status`, `typeNumber`, `detail`, `sortIndex`, `isDelete`, `remark`) VALUES
(1, '购货单', 0, '1', 1, 99, 'PU_QUERY', 1, 'trade', 1, 0, 0, ''),
(2, '新增', 1, '1,2', 2, 99, 'PU_ADD', 1, 'trade', 1, 0, 0, ''),
(3, '修改', 1, '1,3', 2, 99, 'PU_UPDATE', 1, 'trade', 1, 0, 0, ''),
(4, '删除', 1, '1,4', 2, 99, 'PU_DELETE', 1, 'trade', 1, 0, 0, ''),
(5, '导出', 1, '1,5', 2, 99, 'PU_EXPORT', 1, 'trade', 1, 0, 0, ''),
(6, '销货单', 0, '6', 1, 99, 'SA_QUERY', 1, 'trade', 1, 0, 0, ''),
(7, '新增', 6, '6,7', 2, 99, 'SA_ADD', 1, 'trade', 1, 0, 0, ''),
(8, '修改', 6, '6,8', 2, 99, 'SA_UPDATE', 1, 'trade', 1, 0, 0, ''),
(9, '删除', 6, '6,9', 2, 99, 'SA_DELETE', 1, 'trade', 1, 0, 0, ''),
(10, '导出', 6, '6,10', 2, 99, 'SA_EXPORT', 1, 'trade', 1, 0, 0, ''),
(11, '盘点', 0, '11', 1, 99, 'PD_GENPD', 1, 'trade', 1, 0, 0, ''),
(12, '生成盘点记录', 11, '11,12', 2, 99, 'PD_GENPD', 1, 'trade', 1, 0, 0, ''),
(13, '导出', 11, '11,13', 2, 99, 'PD_EXPORT', 1, 'trade', 1, 0, 0, ''),
(14, '其他入库单', 0, '14', 1, 99, 'IO_QUERY', 1, 'trade', 1, 0, 0, ''),
(15, '新增', 14, '14,15', 2, 99, 'IO_ADD', 1, 'trade', 1, 0, 0, ''),
(16, '修改', 14, '14,16', 2, 99, 'IO_UPDATE', 1, 'trade', 1, 0, 0, ''),
(17, '删除', 14, '14,17', 2, 99, 'IO_DELETE', 1, 'trade', 1, 0, 0, ''),
(18, '其他出库单', 0, '18', 1, 99, 'OO_QUERY', 1, 'trade', 1, 0, 0, ''),
(19, '新增', 18, '18,19', 2, 99, 'OO_ADD', 1, 'trade', 1, 0, 0, ''),
(20, '修改', 18, '18,20', 2, 99, 'OO_UPDATE', 1, 'trade', 1, 0, 0, ''),
(21, '删除', 18, '18,21', 2, 99, 'OO_DELETE', 1, 'trade', 1, 0, 0, ''),
(22, '采购明细表', 0, '22', 1, 99, 'PUREOORTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(23, '导出', 22, '22,23', 2, 99, 'PUREOORTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(24, '打印', 22, '22,24', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(25, '采购汇总表（按商品）', 0, '25', 1, 99, 'PUREPORTINV_QUERY', 1, 'trade', 1, 0, 0, ''),
(26, '导出', 25, '25,26', 2, 99, 'PUREPORTINV_QUERY', 1, 'trade', 1, 0, 0, ''),
(27, '打印', 25, '25,27', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(28, '采购汇总表（按供应商）', 0, '28', 1, 99, 'PUREPORTPUR_QUERY', 1, 'trade', 1, 0, 0, ''),
(29, '导出', 28, '28,29', 2, 99, 'PUREPORTPUR_QUERY', 1, 'trade', 1, 0, 0, ''),
(30, '打印', 28, '28,30', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(31, '销售明细表', 0, '31', 1, 99, 'SAREPORTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(32, '导出', 31, '31,32', 2, 99, 'SAREPORTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(33, '打印', 31, '31,33', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(34, '销售汇总表（按商品）', 0, '34', 1, 99, 'SAREPORTINV_QUERY', 1, 'trade', 1, 0, 0, ''),
(35, '导出', 34, '34,35', 2, 99, 'SAREPORTINV_QUERY', 1, 'trade', 1, 0, 0, ''),
(36, '打印', 34, '34,36', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(37, '销售汇总表（按客户）', 0, '37', 1, 99, 'SAREPORTBU_QUERY', 1, 'trade', 1, 0, 0, ''),
(38, '导出', 37, '37,38', 2, 99, 'SAREPORTBU_QUERY', 1, 'trade', 1, 0, 0, ''),
(39, '打印', 37, '37,39', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(40, '商品库存余额表', 0, '40', 1, 99, 'InvBalanceReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(41, '导出', 40, '40,41', 2, 99, 'InvBalanceReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(42, '打印', 40, '40,42', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(43, '商品收发明细表', 0, '43', 1, 99, 'DeliverDetailReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(44, '导出', 43, '43,44', 2, 99, 'DeliverDetailReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(45, '打印', 43, '43,45', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(46, '商品收发汇总表', 0, '46', 1, 99, 'DeliverSummaryReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(47, '导出', 46, '46,47', 2, 99, 'DeliverSummaryReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(48, '打印', 46, '46,48', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(49, '往来单位欠款表', 0, '49', 1, 99, 'ContactDebtReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(50, '导出', 49, '49,50', 2, 99, 'ContactDebtReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(51, '打印', 49, '49,51', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(52, '应付账款明细表', 0, '52', 1, 99, 'PAYMENTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(53, '导出', 52, '52,53', 2, 99, 'PAYMENTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(54, '打印', 52, '52,54', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(55, '应收账款明细表', 0, '55', 1, 99, 'RECEIPTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(56, '导出', 55, '55,56', 2, 99, 'RECEIPTDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(57, '打印', 55, '55,57', 2, 99, '', 0, 'trade', 1, 0, 0, ''),
(58, '客户管理', 0, '58', 1, 99, 'BU_QUERY', 1, 'trade', 1, 0, 0, ''),
(59, '新增', 58, '58,59', 2, 99, 'BU_ADD', 1, 'trade', 1, 0, 0, ''),
(60, '修改', 58, '58,60', 2, 99, 'BU_UPDATE', 1, 'trade', 1, 0, 0, ''),
(61, '删除', 58, '58,61', 2, 99, 'BU_DELETE', 1, 'trade', 1, 0, 0, ''),
(62, '导出', 58, '58,62', 2, 99, 'BU_EXPORT', 1, 'trade', 1, 0, 0, ''),
(63, '供应商管理', 0, '63', 1, 99, 'PUR_QUERY', 1, 'trade', 1, 0, 0, ''),
(64, '新增', 63, '63,64', 2, 99, 'PUR_ADD', 1, 'trade', 1, 0, 0, ''),
(65, '修改', 63, '63,65', 2, 99, 'PUR_UPDATE', 1, 'trade', 1, 0, 0, ''),
(66, '删除', 63, '63,66', 2, 99, 'PUR_DELETE', 1, 'trade', 1, 0, 0, ''),
(67, '导出', 63, '63,67', 2, 99, 'PUR_EXPORT', 1, 'trade', 1, 0, 0, ''),
(68, '商品管理', 0, '68', 1, 99, 'INVENTORY_QUERY', 1, 'trade', 1, 0, 0, ''),
(69, '新增', 68, '68,69', 2, 99, 'INVENTORY_ADD', 1, 'trade', 1, 0, 0, ''),
(70, '修改', 68, '68,70', 2, 99, 'INVENTORY_UPDATE', 1, 'trade', 1, 0, 0, ''),
(71, '删除', 68, '68,71', 2, 99, 'INVENTORY_DELETE', 1, 'trade', 1, 0, 0, ''),
(72, '导出', 68, '68,72', 2, 99, 'INVENTORY_EXPORT', 1, 'trade', 1, 0, 0, ''),
(73, '客户类别', 0, '73', 1, 99, 'BUTYPE_QUERY', 1, 'trade', 1, 0, 0, ''),
(74, '新增', 73, '73,74', 2, 99, 'BUTYPE_ADD', 1, 'trade', 1, 0, 0, ''),
(75, '修改', 73, '73,75', 2, 99, 'BUTYPE_UPDATE', 1, 'trade', 1, 0, 0, ''),
(76, '删除', 73, '73,76', 2, 99, 'BUTYPE_DELETE', 1, 'trade', 1, 0, 0, ''),
(77, '计量单位', 0, '77', 1, 99, 'UNIT_QUERY', 1, 'trade', 1, 0, 0, ''),
(78, '新增', 77, '77,78', 2, 99, 'UNIT_ADD', 1, 'trade', 1, 0, 0, ''),
(79, '修改', 77, '77,79', 2, 99, 'UNIT_UPDATE', 1, 'trade', 1, 0, 0, ''),
(80, '删除', 77, '77,80', 2, 99, 'UNIT_DELETE', 1, 'trade', 1, 0, 0, ''),
(81, '系统参数', 0, '81', 1, 99, '', 1, 'trade', 1, 0, 0, ''),
(82, '权限设置', 0, '82', 1, 99, '', 1, 'trade', 1, 0, 0, ''),
(83, '操作日志', 0, '83', 1, 99, 'OPERATE_QUERY', 1, 'trade', 1, 0, 0, ''),
(84, '数据备份', 0, '84', 1, 99, '', 0, 'trade', 1, 0, 0, ''),
(85, '打印', 1, '1,85', 2, 99, 'PU_PRINT', 1, 'trade', 1, 0, 0, ''),
(86, '审核', 1, '1,86', 2, 0, 'PU_CHECK', 1, 'trade', 1, 0, 0, ''),
(87, '反审核', 1, '1,87', 2, 0, 'PU_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(88, '打印', 6, '6,88', 2, 0, 'SA_PRINT', 1, 'trade', 1, 0, 0, ''),
(89, '审核', 6, '6,89', 2, 0, 'SA_CHECK', 1, 'trade', 1, 0, 0, ''),
(90, '反审核', 6, '6,90', 2, 0, 'SA_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(91, '禁用', 58, '58,91', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(92, '启用', 58, '58,92', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(93, '禁用', 63, '63,93', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(94, '启用', 63, '63,94', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(95, '禁用', 68, '68,95', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(96, '启用', 68, '68,96', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(97, '职员管理', 0, '97', 1, 0, '', 1, 'trade', 1, 0, 0, ''),
(98, '账号管理', 0, '98', 1, 0, 'SettAcct_QUERY', 1, 'trade', 1, 0, 0, ''),
(99, '导入', 11, '11,99', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(100, '审核', 14, '14,100', 2, 0, 'IO_CHECK', 1, 'trade', 1, 0, 0, ''),
(101, '反审核', 14, '14,101', 2, 0, 'IO_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(102, '导出', 14, '14,102', 2, 0, 'IO_EXPORT', 1, 'trade', 1, 0, 0, ''),
(103, '审核', 18, '18,103', 2, 0, 'OO_CHECK', 1, 'trade', 1, 0, 0, ''),
(104, '反审核', 18, '18,104', 2, 0, 'OO_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(105, '导出', 18, '18,105', 2, 0, 'OO_EXPORT', 1, 'trade', 1, 0, 0, ''),
(106, '现金银行报表', 0, '106', 1, 0, 'SettAcctReport_QUERY', 1, 'trade', 1, 0, 0, ''),
(107, '打印', 106, '106,107', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(108, '导出', 106, '106,108', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(109, '客户对账单', 0, '109', 1, 0, 'CUSTOMERBALANCE_QUERY', 1, 'trade', 1, 0, 0, ''),
(110, '打印', 109, '109,110', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(111, '导出', 109, '109,111', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(112, '供应商对账单', 0, '112', 1, 0, 'SUPPLIERBALANCE_QUERY', 1, 'trade', 1, 0, 0, ''),
(113, '打印', 112, '112,113', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(114, '导出', 112, '112,114', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(115, '其他收支明细表', 0, '115', 1, 0, 'ORIDETAIL_QUERY', 1, 'trade', 1, 0, 0, ''),
(116, '打印', 115, '115,116', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(117, '导出', 115, '115,117', 2, 0, '', 1, 'trade', 1, 0, 0, ''),
(118, '新增', 97, '97,118', 2, 0, 'INVLOCTION_ADD', 1, 'trade', 1, 0, 0, ''),
(119, '修改', 97, '97,119', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(120, '删除', 97, '97,120', 2, 0, 'INVLOCTION_DELETE', 1, 'trade', 1, 0, 0, ''),
(121, '新增', 98, '98,121', 2, 0, 'SettAcct_ADD', 1, 'trade', 1, 0, 0, ''),
(122, '修改', 98, '98,122', 2, 0, 'SettAcct_UPDATE', 1, 'trade', 1, 0, 0, ''),
(123, '删除', 98, '98,123', 2, 0, 'SettAcct_DELETE', 1, 'trade', 1, 0, 0, ''),
(124, '收款单', 0, '124', 1, 0, 'RECEIPT_QUERY', 1, 'trade', 1, 0, 0, ''),
(125, '新增', 124, '124,125', 2, 0, 'RECEIPT_ADD', 1, 'trade', 1, 0, 0, ''),
(126, '修改', 124, '124,126', 2, 0, 'RECEIPT_UPDATE', 1, 'trade', 1, 0, 0, ''),
(127, '删除', 124, '124,127', 2, 0, 'RECEIPT_DELETE', 1, 'trade', 1, 0, 0, ''),
(128, '导出', 124, '124,128', 2, 0, 'RECEIPT_EXPORT', 1, 'trade', 1, 0, 0, ''),
(129, '付款单', 0, '129', 1, 0, 'PAYMENT_QUERY', 1, 'trade', 1, 0, 0, ''),
(130, '新增', 129, '129,130', 2, 0, 'PAYMENT_ADD', 1, 'trade', 1, 0, 0, ''),
(131, '修改', 129, '129,131', 2, 0, 'PAYMENT_UPDATE', 1, 'trade', 1, 0, 0, ''),
(132, '删除', 129, '129,132', 2, 0, 'PAYMENT_DELETE', 1, 'trade', 1, 0, 0, ''),
(133, '导出', 129, '129,133', 2, 0, 'PAYMENT_EXPORT', 1, 'trade', 1, 0, 0, ''),
(134, '其他收入单', 0, '134', 1, 0, 'QTSR_QUERY', 1, 'trade', 1, 0, 0, ''),
(135, '新增', 134, '134,135', 2, 0, 'QTSR_ADD', 1, 'trade', 1, 0, 0, ''),
(136, '修改', 134, '134,136', 2, 0, 'QTSR_UPDATE', 1, 'trade', 1, 0, 0, ''),
(137, '删除', 134, '134,137', 2, 0, 'QTSR_DELETE', 1, 'trade', 1, 0, 0, ''),
(138, '导出', 134, '134,138', 2, 0, 'QTSR_EXPORT', 1, 'trade', 1, 0, 0, ''),
(139, '其他支出单', 0, '139', 1, 0, 'QTZC_QUERY', 1, 'trade', 1, 0, 0, ''),
(140, '新增', 139, '139,140', 2, 0, 'QTZC_ADD', 1, 'trade', 1, 0, 0, ''),
(141, '修改', 139, '139,141', 2, 0, 'QTZC_UPDATE', 1, 'trade', 1, 0, 0, ''),
(142, '删除', 139, '139,142', 2, 0, 'QTZC_DELETE', 1, 'trade', 1, 0, 0, ''),
(143, '导出', 139, '139,143', 2, 0, 'QTZC_EXPORT', 1, 'trade', 1, 0, 0, ''),
(144, '调拨单', 0, '144', 1, 0, 'TF_QUERY', 1, 'trade', 1, 0, 0, ''),
(145, '新增', 144, '144,145', 2, 0, 'TF_ADD', 1, 'trade', 1, 0, 0, ''),
(146, '修改', 144, '144,146', 2, 0, 'TF_UPDATE', 1, 'trade', 1, 0, 0, ''),
(147, '删除', 144, '144,147', 2, 0, 'TF_DELETE', 1, 'trade', 1, 0, 0, ''),
(148, '导出', 144, '144,148', 2, 0, 'TF_EXPORT', 1, 'trade', 1, 0, 0, ''),
(149, '重新初始化', 0, '149', 1, 0, '', 0, 'trade', 1, 0, 0, ''),
(151, '成本调整单', 0, '151', 1, 0, 'CADJ_QUERY', 1, 'trade', 1, 0, 0, ''),
(152, '新增', 151, '151,152', 2, 0, 'CADJ_ADD', 1, 'trade', 1, 0, 0, ''),
(153, '修改', 151, '151,153', 2, 0, 'CADJ_UPDATE', 1, 'trade', 1, 0, 0, ''),
(154, '删除', 151, '151,154', 2, 0, 'CADJ_DELETE', 1, 'trade', 1, 0, 0, ''),
(155, '仓库管理', 0, '155', 1, 0, 'INVLOCTION_QUERY', 1, 'trade', 1, 0, 0, ''),
(156, '新增', 155, '155,156', 2, 0, 'INVLOCTION_ADD', 1, 'trade', 1, 0, 0, ''),
(157, '修改', 155, '155,157', 2, 0, 'INVLOCTION_UPDATE', 1, 'trade', 1, 0, 0, ''),
(158, '删除', 155, '155,158', 2, 0, 'INVLOCTION_DELETE', 1, 'trade', 1, 0, 0, ''),
(159, '结算方式', 0, '159', 1, 0, 'Assist_QUERY', 1, 'trade', 1, 0, 0, ''),
(160, '新增', 159, '159,160', 2, 0, 'Assist_ADD', 1, 'trade', 1, 0, 0, ''),
(161, '修改', 159, '159,161', 2, 0, 'Assist_UPDATE', 1, 'trade', 1, 0, 0, ''),
(162, '删除', 159, '159,162', 2, 0, 'Assist_DELETE', 1, 'trade', 1, 0, 0, ''),
(163, '供应商类别', 0, '163', 1, 0, 'SUPPLYTYPE_QUERY', 1, 'trade', 1, 0, 0, ''),
(164, '新增', 163, '163,164', 2, 0, 'SUPPLYTYPE_ADD', 1, 'trade', 1, 0, 0, ''),
(165, '修改', 163, '163,165', 2, 0, 'SUPPLYTYPE_UPDATE', 1, 'trade', 1, 0, 0, ''),
(166, '删除', 163, '163,166', 2, 0, 'SUPPLYTYPE_DELETE', 1, 'trade', 1, 0, 0, ''),
(167, '商品类别', 0, '167', 1, 0, 'TRADETYPE_QUERY', 1, 'trade', 1, 0, 0, ''),
(168, '新增', 167, '167,168', 2, 0, 'TRADETYPE_ADD', 1, 'trade', 1, 0, 0, ''),
(169, '修改', 167, '167,169', 2, 0, 'TRADETYPE_UPDATE', 1, 'trade', 1, 0, 0, ''),
(170, '删除', 167, '167,170', 2, 0, 'TRADETYPE_DELETE', 1, 'trade', 1, 0, 0, ''),
(171, '支出类别', 0, '171', 1, 0, 'PACCTTYPE_QUERY', 1, 'trade', 1, 0, 0, ''),
(172, '新增', 171, '171,172', 2, 0, 'PACCTTYPE_ADD', 1, 'trade', 1, 0, 0, ''),
(173, '修改', 171, '171,173', 2, 0, 'PACCTTYPE_UPDATE', 1, 'trade', 1, 0, 0, ''),
(174, '删除', 171, '171,174', 2, 0, 'PACCTTYPE_DELETE', 1, 'trade', 1, 0, 0, ''),
(175, '收入类别', 0, '175', 1, 0, 'RACCTTYPE_QUERY', 1, 'trade', 1, 0, 0, ''),
(176, '新增', 175, '175,176', 2, 0, 'RACCTTYPE_ADD', 1, 'trade', 1, 0, 0, ''),
(177, '修改', 175, '175,177', 2, 0, 'RACCTTYPE_UPDATE', 1, 'trade', 1, 0, 0, ''),
(178, '删除', 175, '175,178', 2, 0, 'RACCTTYPE_DELETE', 1, 'trade', 1, 0, 0, ''),
(179, '打印', 144, '144,179', 2, 0, 'TF_PRINT', 1, 'trade', 1, 0, 0, ''),
(180, '采购订单', 0, '180', 1, 0, 'PO_QUERY', 1, 'trade', 1, 0, 0, ''),
(181, '新增', 180, '180,181', 2, 0, 'PO_ADD', 1, 'trade', 1, 0, 0, ''),
(182, '修改', 180, '180,182', 2, 0, 'PO_UPDATE', 1, 'trade', 1, 0, 0, ''),
(183, '删除', 180, '180,183', 2, 0, 'PO_DELETE', 1, 'trade', 1, 0, 0, ''),
(184, '导出', 180, '180,184', 2, 0, 'PO_EXPORT', 1, 'trade', 1, 0, 0, ''),
(185, '打印', 180, '180,185', 2, 0, 'PO_PRINT', 1, 'trade', 1, 0, 0, ''),
(186, '审核', 180, '180,186', 2, 0, 'PO_CHECK', 1, 'trade', 1, 0, 0, ''),
(187, '反审核', 180, '180,187', 2, 0, 'PO_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(188, '销售订单', 0, '188', 1, 0, 'SO_QUERY', 1, 'trade', 1, 0, 0, ''),
(189, '新增', 188, '188,189', 2, 0, 'SO_ADD', 1, 'trade', 1, 0, 0, ''),
(190, '修改', 188, '188,190', 2, 0, 'SO_UPDATE', 1, 'trade', 1, 0, 0, ''),
(191, '删除', 188, '188,191', 2, 0, 'SO_DELETE', 1, 'trade', 1, 0, 0, ''),
(192, '导出', 188, '188,192', 2, 0, 'SO_EXPORT', 1, 'trade', 1, 0, 0, ''),
(193, '打印', 188, '188,193', 2, 0, 'SO_PRINT', 1, 'trade', 1, 0, 0, ''),
(194, '审核', 188, '188,194', 2, 0, 'SO_CHECK', 1, 'trade', 1, 0, 0, ''),
(195, '反审核', 188, '188,195', 2, 0, 'SO_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(196, '审核', 144, '144,196', 2, 0, 'TF_CHECK', 1, 'trade', 1, 0, 0, ''),
(197, '反审核', 144, '144,197', 2, 0, 'TF_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(198, '审核', 124, '124,198', 2, 0, 'RECEIPT_CHECK', 1, 'trade', 1, 0, 0, ''),
(199, '反审核', 124, '124,199', 2, 0, 'RECEIPT_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(200, '审核', 129, '129,200', 2, 0, 'PAYMENT_CHECK', 1, 'trade', 1, 0, 0, ''),
(201, '反审核', 129, '129,201', 2, 0, 'PAYMENT_UNCHECK', 1, 'trade', 1, 0, 0, ''),
(202, '库存预警', 0, '202', 1, 0, 'INVENTORY_WARNING', 1, 'trade', 1, 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ci_options`
--

CREATE TABLE IF NOT EXISTS `ci_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `ci_options`
--

INSERT INTO `ci_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'system', 'a:10:{s:11:"companyName";s:18:"广州嘉磊元新信息科技有限公司";s:11:"companyAddr";s:6:"123213";s:5:"phone";s:5:"12312";s:3:"fax";s:3:"312";s:8:"postcode";s:4:"3123";s:9:"qtyPlaces";s:1:"1";s:11:"pricePlaces";s:1:"1";s:12:"amountPlaces";s:1:"2";s:10:"valMethods";s:13:"movingAverage";s:18:"requiredCheckStore";s:1:"1";}', 'yes'),
(2, 'sales', 's:3893:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":60,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","nameExt":"<span id=\\"barCodeInsert\\">扫描枪录入</span>","width":300,"classes":"goods","editable":true,"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"单位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"单位"},{"name":"unitId","label":"单位Id","hidden":true,"defLabel":"单位Id","defhidden":true},{"name":"locationName","label":"仓库","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"仓库"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生产日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生产日期","defhidden":true},{"name":"safeDays","label":"保质期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保质期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"数量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"数量"},{"name":"price","label":"销售单价","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":1},"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"销售单价","defhidden":false},{"name":"discountRate","label":"折扣率(%)","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"integer","editable":true,"defLabel":"折扣率(%)","defhidden":false},{"name":"deduction","label":"折扣额","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"折扣额","defhidden":false},{"name":"amount","label":"销售金额","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"销售金额","defhidden":false},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"},{"name":"srcOrderEntryId","label":"源单分录ID","width":0,"hidden":true,"defLabel":"源单分录ID","defhidden":true},{"name":"srcOrderId","label":"源单ID","width":0,"hidden":true,"defLabel":"源单ID","defhidden":true},{"name":"srcOrderNo","label":"源单号","width":120,"fixed":true,"hidden":true,"defLabel":"源单号","defhidden":true}],"colModel":[["operating"," ",null,60],["goods","商品",null,300],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["locationName","仓库",null,100],["batch","批次",true,90],["prodDate","生产日期",true,90],["safeDays","保质期(天)",true,90],["validDate","有效期至",true,90],["qty","数量",null,80],["price","销售单价",false,100],["discountRate","折扣率(%)",false,70],["deduction","折扣额",false,70],["amount","销售金额",false,100],["description","备注",null,150],["srcOrderEntryId","源单分录ID",true,0],["srcOrderId","源单ID",true,0],["srcOrderNo","源单号",true,120]],"isReg":true}}}";', 'yes'),
(3, 'purchase', 's:797:"{"grids":{"grid":{"colModel":[["operating"," ",null,60],["pic","商品图片",null,77],["goods","商品",null,300],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["locationName","仓库",null,100],["batch","批次",true,90],["prodDate","生产日期",true,90],["safeDays","保质期(天)",true,90],["validDate","有效期至",true,90],["qty","数量",null,80],["price","购货单价",false,100],["discountRate","折扣率(%)",false,70],["deduction","折扣额",false,70],["amount","购货金额",false,100],["description","备注",null,150],["srcOrderEntryId","源单分录ID",true,0],["srcOrderId","源单ID",true,0],["srcOrderNo","源单号",true,120]],"isReg":true}},"curTime":1441963732000,"modifyTime":1441963732000}";', 'yes'),
(4, 'transfers', 's:2702:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":40,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","width":318,"title":false,"classes":"goods","editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"单位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"单位"},{"name":"unitId","label":"单位Id","hidden":true,"defLabel":"单位Id","defhidden":true},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生产日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生产日期","defhidden":true},{"name":"safeDays","label":"保质期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保质期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"数量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"数量"},{"name":"outLocationName","label":"调出仓库","nameExt":"<small id=\\"batch-storageA\\">(批量)</small>","sortable":false,"width":100,"title":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"调出仓库"},{"name":"inLocationName","label":"调入仓库","nameExt":"<small id=\\"batch-storageB\\">(批量)</small>","width":100,"title":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"调入仓库"},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"}],"colModel":[["operating"," ",null,40],["goods","商品",null,318],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["batch","批次",true,90],["prodDate","生产日期",true,90],["safeDays","保质期(天)",true,90],["validDate","有效期至",true,90],["qty","数量",null,80],["outLocationName","调出仓库",null,100],["inLocationName","调入仓库",null,100],["description","备注",null,150]],"isReg":true}}}";', 'yes'),
(5, 'otherWarehouse', 's:2906:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":40,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","width":320,"title":true,"classes":"goods","editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"单位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"单位"},{"name":"unitId","label":"单位Id","hidden":true,"defLabel":"单位Id","defhidden":true},{"name":"locationName","label":"仓库","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"title":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"仓库"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生产日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生产日期","defhidden":true},{"name":"safeDays","label":"保质期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保质期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"数量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"数量"},{"name":"price","label":"入库单价","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":1},"editable":true,"defLabel":"入库单价","defhidden":false},{"name":"amount","label":"入库金额","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"入库金额","defhidden":false},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"}],"colModel":[["operating"," ",null,40],["goods","商品",null,320],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["locationName","仓库",null,100],["batch","批次",true,90],["prodDate","生产日期",true,90],["safeDays","保质期(天)",true,90],["validDate","有效期至",true,90],["qty","数量",null,80],["price","入库单价",false,100],["amount","入库金额",false,100],["description","备注",null,150]],"isReg":true}}}";', 'yes'),
(6, 'adjustment', 's:1337:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":40,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","width":320,"title":true,"classes":"goods","editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis disableSku"},"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"mainUnit","label":"单位","width":60,"defLabel":"单位"},{"name":"amount","label":"调整金额","hidden":false,"width":100,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"调整金额","defhidden":false},{"name":"locationName","label":"仓库<small id=\\"batchStorage\\">(批量)</small>","width":100,"title":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"仓库<small id=\\"batchStorage\\">(批量)</small>"},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"}],"colModel":[["operating"," ",null,40],["goods","商品",null,320],["skuId","属性ID",true,null],["mainUnit","单位",null,60],["amount","调整金额",false,100],["locationName","仓库<small id=\\"batchStorage\\">(批量)</small>",null,100],["description","备注",null,150]],"isReg":true}}}";', 'yes'),
(7, 'purchaseBack', 's:3824:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":60,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","nameExt":"<span id=\\"barCodeInsert\\">扫描枪录入</span>","width":300,"classes":"goods","editable":true,"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"单位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"单位"},{"name":"unitId","label":"单位Id","hidden":true,"defLabel":"单位Id","defhidden":true},{"name":"locationName","label":"仓库","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"仓库"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生产日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生产日期","defhidden":true},{"name":"safeDays","label":"保质期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保质期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"数量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":2},"editable":true,"defLabel":"数量"},{"name":"price","label":"购货单价","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"购货单价","defhidden":false},{"name":"discountRate","label":"折扣率(%)","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"integer","editable":true,"defLabel":"折扣率(%)","defhidden":false},{"name":"deduction","label":"折扣额","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"折扣额","defhidden":false},{"name":"amount","label":"购货金额","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"购货金额","defhidden":false},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"},{"name":"srcOrderEntryId","label":"源单分录ID","width":0,"hidden":true,"defLabel":"源单分录ID","defhidden":true},{"name":"srcOrderId","label":"源单ID","width":0,"hidden":true,"defLabel":"源单ID","defhidden":true},{"name":"srcOrderNo","label":"源单号","width":120,"fixed":true,"hidden":true,"defLabel":"源单号","defhidden":true}],"colModel":[["operating"," ",null,60],["goods","商品",null,300],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["locationName","仓库",null,100],["batch","批次",true,90],["prodDate","生产日期",true,90],["safeDays","保质期(天)",true,90],["validDate","有效期至",true,90],["qty","数量",null,80],["price","购货单价",false,100],["discountRate","折扣率(%)",false,70],["deduction","折扣额",false,70],["amount","购货金额",false,100],["description","备注",null,150],["srcOrderEntryId","源单分录ID",true,0],["srcOrderId","源单ID",true,0],["srcOrderNo","源单号",true,120]],"isReg":true}}}";', 'yes'),
(8, 'salesBack', 's:3893:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":60,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","nameExt":"<span id=\\"barCodeInsert\\">扫描枪录入</span>","width":300,"classes":"goods","editable":true,"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"单位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"单位"},{"name":"unitId","label":"单位Id","hidden":true,"defLabel":"单位Id","defhidden":true},{"name":"locationName","label":"仓库","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"仓库"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生产日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生产日期","defhidden":true},{"name":"safeDays","label":"保质期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保质期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"数量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":2},"editable":true,"defLabel":"数量"},{"name":"price","label":"销售单价","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"销售单价","defhidden":false},{"name":"discountRate","label":"折扣率(%)","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"integer","editable":true,"defLabel":"折扣率(%)","defhidden":false},{"name":"deduction","label":"折扣额","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"折扣额","defhidden":false},{"name":"amount","label":"销售金额","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"销售金额","defhidden":false},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"},{"name":"srcOrderEntryId","label":"源单分录ID","width":0,"hidden":true,"defLabel":"源单分录ID","defhidden":true},{"name":"srcOrderId","label":"源单ID","width":0,"hidden":true,"defLabel":"源单ID","defhidden":true},{"name":"srcOrderNo","label":"源单号","width":120,"fixed":true,"hidden":true,"defLabel":"源单号","defhidden":true}],"colModel":[["operating"," ",null,60],["goods","商品",null,300],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["locationName","仓库",null,100],["batch","批次",true,90],["prodDate","生产日期",true,90],["safeDays","保质期(天)",true,90],["validDate","有效期至",true,90],["qty","数量",null,80],["price","销售单价",false,100],["discountRate","折扣率(%)",false,70],["deduction","折扣额",false,70],["amount","销售金额",false,100],["description","备注",null,150],["srcOrderEntryId","源单分录ID",true,0],["srcOrderId","源单ID",true,0],["srcOrderNo","源单号",true,120]],"isReg":true}}}";', 'yes'),
(9, 'otherOutbound', 's:2892:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":40,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","width":320,"title":true,"classes":"goods","editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"单位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"单位"},{"name":"unitId","label":"单位Id","hidden":true,"defLabel":"单位Id","defhidden":true},{"name":"locationName","label":"仓库","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"title":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"仓库"},{"name":"batch","label":"批次","width":90,"classes":"ui-ellipsis batch","hidden":true,"title":false,"editable":true,"align":"left","edittype":"custom","editoptions":{"trigger":"ui-icon-ellipsis"},"defLabel":"批次","defhidden":true},{"name":"prodDate","label":"生产日期","width":90,"hidden":true,"title":false,"editable":true,"edittype":"custom","editoptions":{},"defLabel":"生产日期","defhidden":true},{"name":"safeDays","label":"保质期(天)","width":90,"hidden":true,"title":false,"align":"left","defLabel":"保质期(天)","defhidden":true},{"name":"validDate","label":"有效期至","width":90,"hidden":true,"title":false,"align":"left","defLabel":"有效期至","defhidden":true},{"name":"qty","label":"数量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"数量"},{"name":"price","label":"出库单位成本","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":1},"defLabel":"出库单位成本","defhidden":false},{"name":"amount","label":"出库成本","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"defLabel":"出库成本","defhidden":false},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"}],"colModel":[["operating"," ",null,40],["goods","商品",null,320],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["locationName","仓库",null,100],["batch","批次",true,90],["prodDate","生产日期",true,90],["safeDays","保质期(天)",true,90],["validDate","有效期至",true,90],["qty","数量",null,80],["price","出库单位成本",false,100],["amount","出库成本",false,100],["description","备注",null,150]],"isReg":true}}}";', 'yes'),
(10, 'purchaseOrder', 's:2682:"{"grids":{"grid":{"defColModel":[{"name":"operating","label":" ","width":60,"fixed":true,"align":"center","defLabel":" "},{"name":"goods","label":"商品","nameExt":"<span id=\\"barCodeInsert\\">扫描枪录入</span>","width":300,"classes":"goods","editable":true,"defLabel":"商品"},{"name":"skuId","label":"属性ID","hidden":true,"defLabel":"属性ID","defhidden":true},{"name":"skuName","label":"属性","width":100,"classes":"ui-ellipsis","hidden":true,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"属性","defhidden":true},{"name":"mainUnit","label":"单位","width":80,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"单位"},{"name":"unitId","label":"单位Id","hidden":true,"defLabel":"单位Id","defhidden":true},{"name":"locationName","label":"仓库","nameExt":"<small id=\\"batchStorage\\">(批量)</small>","width":100,"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"仓库"},{"name":"qty","label":"数量","width":80,"align":"right","formatter":"number","formatoptions":{"decimalPlaces":1},"editable":true,"defLabel":"数量"},{"name":"price","label":"购货单价","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":1},"editable":true,"edittype":"custom","editoptions":{"trigger":"ui-icon-triangle-1-s"},"defLabel":"购货单价","defhidden":false},{"name":"discountRate","label":"折扣率(%)","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"integer","editable":true,"defLabel":"折扣率(%)","defhidden":false},{"name":"deduction","label":"折扣额","hidden":false,"width":70,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"折扣额","defhidden":false},{"name":"amount","label":"购货金额","hidden":false,"width":100,"fixed":true,"align":"right","formatter":"currency","formatoptions":{"showZero":true,"decimalPlaces":2},"editable":true,"defLabel":"购货金额","defhidden":false},{"name":"description","label":"备注","width":150,"title":true,"editable":true,"defLabel":"备注"}],"colModel":[["operating"," ",null,60],["goods","商品",null,300],["skuId","属性ID",true,null],["skuName","属性",true,100],["mainUnit","单位",null,80],["unitId","单位Id",true,null],["locationName","仓库",null,100],["qty","数量",null,80],["price","购货单价",false,100],["discountRate","折扣率(%)",false,70],["deduction","折扣额",false,70],["amount","购货金额",false,100],["description","备注",null,150]],"isReg":true}}}";', 'yes'),
(11, 'salesOrderList', 's:606:"{"grids":{"grid":{"colModel":[["operating","操作",null,60],["billDate","订单日期",null,100],["billNo","订单编号",null,120],["transType","业务类别",null,100],["salesName","销售人员",null,80],["contactName","客户",null,101],["totalAmount","销售金额",false,100],["totalQty","数量",null,57],["billStatusName","订单状态",null,71],["deliveryDate","交货日期",null,100],["userName","制单人",null,80],["checkName","审核人",false,44],["description","备注",null,200],["disEditable","不可编辑",true,null]],"isReg":true}},"curTime":1438079315000,"modifyTime":1438079315000}";', 'yes');

-- --------------------------------------------------------

--
-- 表的结构 `ci_order`
--

CREATE TABLE IF NOT EXISTS `ci_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `uid` smallint(6) DEFAULT '0',
  `userName` varchar(50) DEFAULT '' COMMENT '制单人',
  `transType` int(11) DEFAULT '0' COMMENT '150501购货 150502退货 150601销售 150602退销 150706其他入库',
  `totalAmount` double DEFAULT '0' COMMENT '购货总金额',
  `amount` double DEFAULT '0' COMMENT '折扣后金额',
  `rpAmount` double DEFAULT '0' COMMENT '本次付款',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(100) DEFAULT '' COMMENT '备注',
  `arrears` double DEFAULT '0' COMMENT '本次欠款',
  `disRate` double DEFAULT '0' COMMENT '折扣率',
  `disAmount` double DEFAULT '0' COMMENT '折扣金额',
  `totalQty` double DEFAULT '0' COMMENT '总数量',
  `totalArrears` double DEFAULT '0',
  `billStatus` tinyint(1) DEFAULT '0' COMMENT '订单状态 ',
  `checkName` varchar(50) DEFAULT '' COMMENT '采购单审核人',
  `totalTax` double DEFAULT '0',
  `totalTaxAmount` double DEFAULT '0',
  `checked` tinyint(1) DEFAULT '0' COMMENT '采购单状态',
  `accId` tinyint(4) DEFAULT '0' COMMENT '结算账户ID',
  `billType` varchar(20) DEFAULT '' COMMENT 'PO采购订单 OI其他入库 PUR采购入库 BAL初期余额',
  `modifyTime` datetime DEFAULT NULL COMMENT '更新时间',
  `hxStateCode` tinyint(4) DEFAULT '0' COMMENT '0未付款  1部分付款  2全部付款',
  `transTypeName` varchar(20) DEFAULT '',
  `totalDiscount` double DEFAULT '0',
  `salesId` smallint(6) DEFAULT '0' COMMENT '销售人员ID',
  `customerFree` double DEFAULT '0' COMMENT '客户承担费用',
  `hxAmount` double DEFAULT '0' COMMENT '本次核销金额',
  `hasCheck` double DEFAULT '0' COMMENT '已核销',
  `notCheck` double DEFAULT '0' COMMENT '未核销',
  `nowCheck` double DEFAULT '0' COMMENT '本次核销',
  `payment` double DEFAULT '0' COMMENT '本次预收款',
  `discount` double DEFAULT '0' COMMENT '整单折扣',
  `postData` text COMMENT '提交订单明细 ',
  `locationId` varchar(255) DEFAULT '',
  `inLocationId` varchar(255) DEFAULT '' COMMENT '调入仓库ID多个,分割',
  `outLocationId` varchar(255) DEFAULT '' COMMENT '调出仓库ID多个,分割',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除  0正常',
  `deliveryDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accId` (`accId`),
  KEY `buId` (`buId`),
  KEY `salesId` (`salesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_order_info`
--

CREATE TABLE IF NOT EXISTS `ci_order_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `transType` int(11) DEFAULT '0' COMMENT '150501采购 150502退货',
  `amount` double DEFAULT '0' COMMENT '购货金额',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(50) DEFAULT '' COMMENT '备注',
  `invId` int(11) DEFAULT '0' COMMENT '商品ID',
  `price` double DEFAULT '0' COMMENT '单价',
  `deduction` double DEFAULT '0' COMMENT '折扣额',
  `discountRate` double DEFAULT '0' COMMENT '折扣率',
  `qty` double DEFAULT '0' COMMENT '数量',
  `locationId` smallint(6) DEFAULT '0',
  `tax` double DEFAULT '0',
  `taxRate` double DEFAULT '0',
  `taxAmount` double DEFAULT '0',
  `unitId` smallint(6) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `skuId` int(11) DEFAULT '0',
  `entryId` tinyint(1) DEFAULT '1' COMMENT '区分调拨单  进和出',
  `transTypeName` varchar(25) DEFAULT '',
  `srcOrderEntryId` int(11) DEFAULT '0',
  `srcOrderId` int(11) DEFAULT '0',
  `srcOrderNo` varchar(25) DEFAULT '',
  `billType` varchar(20) DEFAULT '',
  `salesId` smallint(6) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '1删除 0正常',
  PRIMARY KEY (`id`),
  KEY `type` (`transType`),
  KEY `billdate` (`billDate`),
  KEY `invId` (`invId`) USING BTREE,
  KEY `transType` (`transType`),
  KEY `iid` (`iid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_payment_info`
--

CREATE TABLE IF NOT EXISTS `ci_payment_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '客户ID',
  `billId` int(11) DEFAULT '0' COMMENT '销售单号ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '销售单编号',
  `billType` varchar(20) DEFAULT '',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `billPrice` double DEFAULT '0' COMMENT '单据金额',
  `hasCheck` double DEFAULT '0' COMMENT '已收款',
  `notCheck` double DEFAULT '0' COMMENT '未收款',
  `nowCheck` double DEFAULT '0' COMMENT '本次收款',
  `transType` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type,billdate` (`billDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_printtemplates`
--

CREATE TABLE IF NOT EXISTS `ci_printtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `info` text,
  `type` int(11) DEFAULT '0',
  `isDefault` tinyint(1) DEFAULT '0',
  `isSystem` tinyint(1) DEFAULT '0',
  `filePath` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_receipt_info`
--

CREATE TABLE IF NOT EXISTS `ci_receipt_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) DEFAULT '0' COMMENT '关联ID',
  `buId` smallint(6) DEFAULT '0' COMMENT '客户ID',
  `billId` int(11) DEFAULT '0' COMMENT '销售单号ID',
  `billNo` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '销售单编号',
  `billType` varchar(20) DEFAULT '',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `billPrice` double DEFAULT '0' COMMENT '单据金额',
  `hasCheck` double DEFAULT '0' COMMENT '已收款',
  `notCheck` double DEFAULT '0' COMMENT '未收款',
  `nowCheck` double DEFAULT '0' COMMENT '本次收款',
  `transType` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type,billdate` (`billDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ci_staff`
--

CREATE TABLE IF NOT EXISTS `ci_staff` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `number` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `disable` tinyint(1) DEFAULT '0' COMMENT '0启用  1禁用',
  `allowsms` tinyint(4) DEFAULT '0',
  `birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `commissionrate` tinyint(4) DEFAULT '0',
  `creatorId` int(11) DEFAULT '0',
  `deptId` int(11) DEFAULT '0',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `empId` int(11) DEFAULT '0',
  `empType` tinyint(4) DEFAULT '1',
  `fullId` int(11) DEFAULT '0',
  `leftDate` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `parentId` smallint(6) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `number` (`number`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `ci_staff`
--

INSERT INTO `ci_staff` (`id`, `name`, `number`, `disable`, `allowsms`, `birthday`, `commissionrate`, `creatorId`, `deptId`, `description`, `email`, `empId`, `empType`, `fullId`, `leftDate`, `mobile`, `parentId`, `sex`, `userName`, `isDelete`) VALUES
(1, '111', '001', 0, 0, '', 0, 0, 0, NULL, NULL, 0, 1, 0, '', '', NULL, NULL, '', 1),
(2, '黎规城', '2', 0, 0, '', 0, 0, 0, NULL, NULL, 0, 1, 0, '', '', NULL, NULL, '', 0),
(3, '张玉莉', '1', 0, 0, '', 0, 0, 0, NULL, NULL, 0, 1, 0, '', '', NULL, NULL, '', 0),
(4, '丁俊盛', '3', 0, 0, '', 0, 0, 0, NULL, NULL, 0, 1, 0, '', '', NULL, NULL, '', 0),
(5, '皮天午', '4', 0, 0, '', 0, 0, 0, NULL, NULL, 0, 1, 0, '', '', NULL, NULL, '', 0),
(6, '林建新', '5', 0, 0, '', 0, 0, 0, NULL, NULL, 0, 1, 0, '', '', NULL, NULL, '', 0),
(7, '吴哲帆', '6', 0, 0, '', 0, 0, 0, NULL, NULL, 0, 1, 0, '', '', NULL, NULL, '', 0),
(8, '杨清云', '7', 0, 0, '', 0, 0, 0, NULL, NULL, 0, 1, 0, '', '', NULL, NULL, '', 0),
(9, '韩国良', '8', 0, 0, '', 0, 0, 0, NULL, NULL, 0, 1, 0, '', '', NULL, NULL, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_storage`
--

CREATE TABLE IF NOT EXISTS `ci_storage` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `locationNo` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `disable` tinyint(1) DEFAULT '0' COMMENT '状态 0正常  1锁定',
  `allowNeg` tinyint(4) DEFAULT '0',
  `deptId` int(11) DEFAULT '0',
  `empId` int(11) DEFAULT '0',
  `groupx` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `locationNo` (`locationNo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `ci_storage`
--

INSERT INTO `ci_storage` (`id`, `name`, `locationNo`, `disable`, `allowNeg`, `deptId`, `empId`, `groupx`, `phone`, `type`, `address`, `isDelete`) VALUES
(1, '公司仓库', '1', 0, 0, 0, 0, NULL, NULL, 0, '', 0),
(2, '测试仓库2', '002', 0, 0, 0, 0, NULL, NULL, 0, '', 1),
(3, '张玉莉仓库', '2', 0, 0, 0, 0, NULL, NULL, 0, '', 1),
(4, '黎规城仓库', '3', 0, 0, 0, 0, NULL, NULL, 0, '', 1),
(5, '皮天午仓库', '4', 0, 0, 0, 0, NULL, NULL, 0, '', 1),
(6, '林建新仓库', '5', 0, 0, 0, 0, NULL, NULL, 0, '', 1),
(7, '杨清云仓库', '6', 0, 0, 0, 0, NULL, NULL, 0, '', 1),
(8, '吴哲帆仓库', '7', 0, 0, 0, 0, NULL, NULL, 0, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ci_unit`
--

CREATE TABLE IF NOT EXISTS `ci_unit` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '客户名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `unitTypeId` smallint(6) DEFAULT '0',
  `default` tinyint(1) DEFAULT '0',
  `rate` tinyint(1) DEFAULT '0',
  `guid` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `ci_unit`
--

INSERT INTO `ci_unit` (`id`, `name`, `status`, `unitTypeId`, `default`, `rate`, `guid`, `isDelete`) VALUES
(1, '分', 1, 0, 0, 0, '', 1),
(2, '1312', 1, 0, 0, 0, '', 1),
(3, '123', 1, 0, 0, 0, '', 1),
(4, '分', 1, 0, 0, 0, '', 0),
(5, '23', 1, 0, 0, 0, '', 1),
(6, '台', 1, 0, 0, 0, '', 0),
(7, '个', 1, 0, 0, 0, '', 0),
(8, '套', 1, 0, 0, 0, '', 0),
(9, '盒', 1, 0, 0, 0, '', 0),
(10, '箱', 1, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_unittype`
--

CREATE TABLE IF NOT EXISTS `ci_unittype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '客户名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
