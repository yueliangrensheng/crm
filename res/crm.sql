/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-05-12 00:07:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for base_dict
-- ----------------------------
DROP TABLE IF EXISTS `base_dict`;
CREATE TABLE `base_dict` (
  `dict_id` varchar(32) NOT NULL COMMENT '数据字典id(主键)',
  `dict_type_code` varchar(10) NOT NULL COMMENT '数据字典类别代码',
  `dict_type_name` varchar(64) NOT NULL COMMENT '数据字典类别名称',
  `dict_item_name` varchar(64) NOT NULL COMMENT '数据字典项目名称',
  `dict_item_code` varchar(10) DEFAULT NULL COMMENT '数据字典项目代码(可为空)',
  `dict_sort` int(10) DEFAULT NULL COMMENT '排序字段',
  `dict_enable` char(1) NOT NULL COMMENT '1:使用 0:停用',
  `dict_memo` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_dict
-- ----------------------------
INSERT INTO `base_dict` VALUES ('1', '001', '客户行业', '教育培训 ', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('10', '003', '公司性质', '民企', null, '3', '1', null);
INSERT INTO `base_dict` VALUES ('12', '004', '年营业额', '1-10万', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('13', '004', '年营业额', '10-20万', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('14', '004', '年营业额', '20-50万', null, '3', '1', null);
INSERT INTO `base_dict` VALUES ('15', '004', '年营业额', '50-100万', null, '4', '1', null);
INSERT INTO `base_dict` VALUES ('16', '004', '年营业额', '100-500万', null, '5', '1', null);
INSERT INTO `base_dict` VALUES ('17', '004', '年营业额', '500-1000万', null, '6', '1', null);
INSERT INTO `base_dict` VALUES ('2', '001', '客户行业', '电子商务', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('22', '006', '客户级别', '普通客户', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('23', '006', '客户级别', 'VIP客户', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('3', '001', '客户行业', '对外贸易', null, '3', '1', null);
INSERT INTO `base_dict` VALUES ('4', '001', '客户行业', '酒店旅游', null, '4', '1', null);
INSERT INTO `base_dict` VALUES ('5', '001', '客户行业', '房地产', null, '5', '1', null);
INSERT INTO `base_dict` VALUES ('6', '002', '客户信息来源', '电话营销', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('7', '002', '客户信息来源', '网络营销', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('8', '003', '公司性质', '合资', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('9', '003', '公司性质', '国企', null, '2', '1', null);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `cust_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '客户编号(主键)',
  `cust_name` varchar(32) NOT NULL COMMENT '客户名称(公司名称)',
  `cust_user_id` bigint(32) DEFAULT NULL COMMENT '负责人id',
  `cust_create_id` bigint(32) DEFAULT NULL COMMENT '创建人id',
  `cust_source` varchar(32) DEFAULT NULL COMMENT '客户信息来源',
  `cust_industry` varchar(32) DEFAULT NULL COMMENT '客户所属行业',
  `cust_level` varchar(32) DEFAULT NULL COMMENT '客户级别',
  `cust_linkman` varchar(64) DEFAULT NULL COMMENT '联系人',
  `cust_phone` varchar(64) DEFAULT NULL COMMENT '固定电话',
  `cust_mobile` varchar(16) DEFAULT NULL COMMENT '移动电话',
  `cust_zipcode` varchar(10) DEFAULT NULL,
  `cust_address` varchar(100) DEFAULT NULL,
  `cust_createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`cust_id`),
  KEY `FK_cst_customer_source` (`cust_source`),
  KEY `FK_cst_customer_industry` (`cust_industry`),
  KEY `FK_cst_customer_level` (`cust_level`),
  KEY `FK_cst_customer_user_id` (`cust_user_id`),
  KEY `FK_cst_customer_create_id` (`cust_create_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('15', '北京黑马程序员', null, null, '6', '1', '23', '老黎', '0108888887', '13888888888', '123456', '北京', '2016-04-08 16:32:01');
INSERT INTO `customer` VALUES ('16', '北京传智播客', null, null, '6', '1', '23', '老黎', '0108888887', '13888888888', '123456', '北京', '2016-04-08 16:32:01');
INSERT INTO `customer` VALUES ('17', '上海黑马程序员', null, null, '6', '1', '22', '老黎', '0108888887', '13888888888', '123456', '上海', '2016-04-08 16:32:02');
INSERT INTO `customer` VALUES ('22', '广州黑马程序员', null, null, '6', '1', '22', '老黎', '0108888887', '13888888888', '123456', '广州', '2016-04-08 16:32:03');
INSERT INTO `customer` VALUES ('24', '深圳黑马程序员', null, null, '6', '1', '22', '老黎', '0108888887', '13888888888', '123456', '深圳', '2016-04-08 16:32:03');
INSERT INTO `customer` VALUES ('25', '厦门黑马程序员', null, null, '6', '1', '22', '老黎', '0108888887', '13888888888', '123456', '厦门', '2016-04-08 16:32:03');
INSERT INTO `customer` VALUES ('26', '长沙黑马程序员', null, null, '6', '1', '22', '老黎', '0108888887', '13888888888', '123456', '长沙', '2016-04-08 16:32:03');
INSERT INTO `customer` VALUES ('28', '西安黑马程序员', null, null, '6', '1', '22', '老黎', '0108888887', '13888888888', '123456', '西安', '2016-04-08 16:32:04');
INSERT INTO `customer` VALUES ('29', '济南黑马程序员', null, null, '7', '1', '23', '老黎', '0108888886', '13888888886', '6123456', '济南', '2016-04-08 16:32:04');
INSERT INTO `customer` VALUES ('30', '小米科技', null, null, '6', '2', '22', '雷军', '0108888887', '13888888888', '123456', '北京', '2016-04-08 16:32:04');
INSERT INTO `customer` VALUES ('31', '京东集团', null, null, '6', '2', '22', '刘强东', '0108888887', '13888888888', '123456', '北京', '2016-04-08 16:32:04');
INSERT INTO `customer` VALUES ('32', '腾讯集团', null, null, '6', '2', '23', '马化腾', '0108888887', '13888888888', '12132', '深圳', null);
INSERT INTO `customer` VALUES ('33', '百度科技', null, null, '6', '2', '23', '李彦宏', '0108888887', '13888888888', '123456', '北京', '2016-04-08 16:32:04');
INSERT INTO `customer` VALUES ('34', '阿里集团', null, null, '6', '2', '23', '马云', '0108888887', '13888888888', '123456', '北京', '2016-04-08 16:32:05');
INSERT INTO `customer` VALUES ('35', '创新工场', null, null, '6', '2', '23', '李开复', '0108888887', '13888888888', '123456', '北京', '2016-04-08 16:32:05');
INSERT INTO `customer` VALUES ('36', '恒大集团', null, null, '7', '5', '22', '许家印', '0108888887', '13888888888', '123456', '北京', '2016-04-08 16:32:05');
INSERT INTO `customer` VALUES ('37', '保利集团', null, null, '7', '5', '23', '贺平', '0108888887', '13888888888', '123456', '北京', '2016-04-08 16:32:05');
INSERT INTO `customer` VALUES ('38', '远洋集团', null, null, '7', '5', '22', '魏家福', '0108888887', '13888888888', '123456', '北京', '2016-04-08 16:32:05');
INSERT INTO `customer` VALUES ('39', '万科集团', null, null, '7', '5', '23', '王石', '0108888887', '13888888888', '123456', '北京', '2016-04-08 16:32:06');
-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_code` varchar(32) NOT NULL COMMENT '用户账号',
  `user_name` varchar(64) NOT NULL COMMENT '用户名称',
  `user_password` varchar(32) NOT NULL COMMENT '用户密码',
  `user_state` char(1) NOT NULL COMMENT '1:正常,0:暂停',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('5', 'm0003', '小军', '123', '1');
INSERT INTO `sys_user` VALUES ('6', 'm0001', '小红', '123', '1');
INSERT INTO `sys_user` VALUES ('7', 'm0001', '小明', '123', '1');
INSERT INTO `sys_user` VALUES ('8', 'm0001', '小红', '123', '1');
