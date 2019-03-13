/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : ecit

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 13/03/2019 12:31:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ecit_cart
-- ----------------------------
DROP TABLE IF EXISTS `ecit_cart`;
CREATE TABLE `ecit_cart`  (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
  `checked` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否选择ECIT.CHECKED,Y=已勾选,N=未勾选',
  `created_by` bigint(20) NULL DEFAULT -1 COMMENT '创建人员',
  `creation_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_updated_by` bigint(20) NULL DEFAULT -1 COMMENT '上次更改人员',
  `last_update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ecit_category
-- ----------------------------
DROP TABLE IF EXISTS `ecit_category`;
CREATE TABLE `ecit_category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别Id',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父类别id当id=0时说明是根节点,一级类别',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '类别状态ECIT.STATUS   NORMAL-正常,OBSOLETE-已废弃',
  `sort_order` int(4) NULL DEFAULT NULL COMMENT '排序编号,同类展示顺序,数值相等则自然排序',
  `created_by` bigint(20) NULL DEFAULT -1 COMMENT '创建人员',
  `creation_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_updated_by` bigint(20) NULL DEFAULT -1 COMMENT '上次更改人员',
  `last_update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ecit_category
-- ----------------------------
INSERT INTO `ecit_category` VALUES (100032, 0, 'MOBLIE_GAME', '手游', 'NORMAL', NULL, -1, '2019-03-01 12:52:55', -1, '2019-03-01 12:53:15');
INSERT INTO `ecit_category` VALUES (100033, 0, 'PC_GAME', '端游', 'NORMAL', NULL, -1, '2019-03-01 12:52:59', -1, '2019-03-01 12:53:17');
INSERT INTO `ecit_category` VALUES (100034, 0, 'VIP_VIDEO', '视频', 'NORMAL', NULL, -1, '2019-03-01 12:53:01', -1, '2019-03-01 12:53:19');
INSERT INTO `ecit_category` VALUES (100035, 100032, 'KING_HONOR', '王者荣耀', 'NORMAL', NULL, -1, '2019-03-01 12:53:04', -1, '2019-03-01 12:53:21');
INSERT INTO `ecit_category` VALUES (100036, 100032, 'MOBIE_CS', '穿越火线', 'NORMAL', NULL, -1, '2019-03-01 12:53:08', -1, '2019-03-01 12:53:23');
INSERT INTO `ecit_category` VALUES (100037, 100034, 'AQIYI', '爱奇艺', 'NORMAL', NULL, NULL, '2019-03-01 13:01:32', NULL, '2019-03-01 13:01:32');
INSERT INTO `ecit_category` VALUES (100038, 100035, 'ANDROID_QQ', '安卓QQ', 'NORMAL', NULL, NULL, '2019-03-01 13:26:40', NULL, '2019-03-01 13:26:40');
INSERT INTO `ecit_category` VALUES (100039, 100035, 'IOS_QQ', '苹果QQ', 'NORMAL', NULL, NULL, '2019-03-01 13:26:50', NULL, '2019-03-01 13:26:50');

-- ----------------------------
-- Table structure for ecit_order
-- ----------------------------
DROP TABLE IF EXISTS `ecit_order`;
CREATE TABLE `ecit_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` bigint(20) NULL DEFAULT NULL COMMENT '订单号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `shipping_id` int(11) NULL DEFAULT NULL COMMENT '(虚拟物品无地址 则存储 product_id产品id）\r\n',
  `payment` decimal(20, 2) NULL DEFAULT NULL COMMENT '实际付款金额,单位是元,保留两位小数',
  `payment_type` int(4) NULL DEFAULT NULL COMMENT '支付类型ECIT.PAYMENT_TYPE ,ONLINE-在线支付',
  `postage` int(10) NULL DEFAULT NULL COMMENT '运费,单位是元',
  `order_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态:ECIT.ORDER_STATUS ---  \r\nCANCEL-已取消\r\nNO_PAY-未付款\r\nPAID-已付款，\r\nSHIPPED-已发货，\r\nSUCCESS-交易成功\r\nCLOSED-交易关闭',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime(0) NULL DEFAULT NULL COMMENT '交易关闭时间',
  `created_by` bigint(20) NULL DEFAULT -1 COMMENT '创建人员',
  `creation_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_updated_by` bigint(20) NULL DEFAULT -1 COMMENT '上次更改人员',
  `last_update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `order_no_index`(`order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 267 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ecit_order_item
-- ----------------------------
DROP TABLE IF EXISTS `ecit_order_item`;
CREATE TABLE `ecit_order_item`  (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单子表id',
  `user_id` int(11) NULL DEFAULT NULL,
  `order_no` bigint(20) NULL DEFAULT NULL,
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片地址',
  `current_unit_price` decimal(20, 2) NULL DEFAULT NULL COMMENT '生成订单时的商品单价，单位是元,保留两位小数',
  `quantity` int(10) NULL DEFAULT NULL COMMENT '商品数量(2：代表2个小时）',
  `total_price` decimal(20, 2) NULL DEFAULT NULL COMMENT '商品总价,单位是元,保留两位小数',
  `created_by` bigint(20) NULL DEFAULT -1 COMMENT '创建人员',
  `creation_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_updated_by` bigint(20) NULL DEFAULT -1 COMMENT '上次更改人员',
  `last_update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`order_item_id`) USING BTREE,
  INDEX `order_no_index`(`order_no`) USING BTREE,
  INDEX `order_no_user_id_index`(`user_id`, `order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 272 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ecit_pay_info
-- ----------------------------
DROP TABLE IF EXISTS `ecit_pay_info`;
CREATE TABLE `ecit_pay_info`  (
  `pay_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `order_no` bigint(20) NULL DEFAULT NULL COMMENT '订单号',
  `pay_platform` int(10) NULL DEFAULT NULL COMMENT '支付平台:1-支付宝,2-微信',
  `platform_number` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝支付流水号',
  `platform_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝支付状态',
  `created_by` bigint(20) NULL DEFAULT -1 COMMENT '创建人员',
  `creation_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_updated_by` bigint(20) NULL DEFAULT -1 COMMENT '上次更改人员',
  `last_update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pay_info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ecit_product
-- ----------------------------
DROP TABLE IF EXISTS `ecit_product`;
CREATE TABLE `ecit_product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `category_id` int(11) NOT NULL COMMENT '分类id,关联ecit_category表',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `subtitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品副标题',
  `main_image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品主图,url相对地址',
  `sub_images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片地址,json格式,扩展用',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情',
  `price` decimal(20, 2) NOT NULL COMMENT '价格,单位-元保留两位小数',
  `stock` int(11) NULL DEFAULT NULL COMMENT '时长',
  `status` int(6) NULL DEFAULT 1 COMMENT '商品状态.1-在售 2-下架 3-删除 4-出租中(ECIT.PRODUCT_STATUS)',
  `created_by` bigint(20) NULL DEFAULT -1 COMMENT '创建人员',
  `creation_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_updated_by` bigint(20) NULL DEFAULT -1 COMMENT '上次更改人员',
  `last_update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `account` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ecit_shipping
-- ----------------------------
DROP TABLE IF EXISTS `ecit_shipping`;
CREATE TABLE `ecit_shipping`  (
  `shipping_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `receiver_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货姓名',
  `receiver_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货固定电话',
  `receiver_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货移动电话',
  `receiver_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `receiver_zip` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `created_by` bigint(20) NULL DEFAULT -1 COMMENT '创建人员',
  `creation_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_updated_by` bigint(20) NULL DEFAULT -1 COMMENT '上次更改人员',
  `last_update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`shipping_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ecit_user
-- ----------------------------
DROP TABLE IF EXISTS `ecit_user`;
CREATE TABLE `ecit_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码，MD5加密',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '找回密码问题',
  `answer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '找回密码答案',
  `role` int(4) NOT NULL COMMENT '角色0-管理员,1-普通用户',
  `created_by` bigint(20) NULL DEFAULT -1 COMMENT '创建人员',
  `creation_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_updated_by` bigint(20) NULL DEFAULT -1 COMMENT '上次更改人员',
  `last_update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_name_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ecit_user
-- ----------------------------
INSERT INTO `ecit_user` VALUES (22, 'admin', '61CA1916200F4F166713D13FFB228EBB', '1354831622@qq.com', '15798030882', 'admin', 'admin', 2, NULL, '2019-03-03 10:53:09', NULL, '2019-03-03 08:59:32');

-- ----------------------------
-- Table structure for sys_code
-- ----------------------------
DROP TABLE IF EXISTS `sys_code`;
CREATE TABLE `sys_code`  (
  `code_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_by` bigint(20) NULL DEFAULT -1 COMMENT '创建人员',
  `creation_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_updated_by` bigint(20) NULL DEFAULT -1 COMMENT '上次更改人员',
  `last_update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`code_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_code
-- ----------------------------
INSERT INTO `sys_code` VALUES (1, 'ECIT.CHECKED', '选中', -1, '2019-02-21 10:26:37', -1, '2019-02-21 10:26:40');
INSERT INTO `sys_code` VALUES (2, 'ECIT.STATUS', '类别状态', -1, '2019-02-21 10:31:30', -1, '2019-02-21 10:31:34');
INSERT INTO `sys_code` VALUES (3, 'ECIT.PAYMENT_TYPE', '支付类型', -1, '2019-02-21 10:35:05', -1, '2019-02-21 10:35:07');
INSERT INTO `sys_code` VALUES (4, 'ECIT.ORDER_STATUS', '订单状态', -1, '2019-02-21 10:44:14', -1, '2019-02-21 10:44:17');
INSERT INTO `sys_code` VALUES (5, 'ECIT.PRODUCT_STATUS', '商品状态', -1, '2019-03-10 21:49:22', -1, '2019-03-10 21:49:24');

-- ----------------------------
-- Table structure for sys_code_value
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_value`;
CREATE TABLE `sys_code_value`  (
  `code_value_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `code_id` bigint(20) NOT NULL COMMENT 'code_id',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `meaning` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '意思',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `CREATED_BY` bigint(20) NULL DEFAULT -1 COMMENT '创建人员',
  `CREATION_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `LAST_UPDATED_BY` bigint(20) NULL DEFAULT -1 COMMENT '上次更改人员',
  `LAST_UPDATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`code_value_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_code_value
-- ----------------------------
INSERT INTO `sys_code_value` VALUES (1, 1, 'Y', '选中', NULL, -1, '2019-02-21 10:28:14', -1, '2019-02-21 10:28:24');
INSERT INTO `sys_code_value` VALUES (2, 1, 'N', '未选中', NULL, -1, '2019-02-21 10:28:17', -1, '2019-02-21 10:28:28');
INSERT INTO `sys_code_value` VALUES (3, 2, 'NORMAL-', '正常', NULL, -1, '2019-02-21 10:32:53', -1, '2019-02-21 10:32:57');
INSERT INTO `sys_code_value` VALUES (4, 2, 'OBSOLETE', '废弃', NULL, -1, '2019-02-21 10:32:55', -1, '2019-02-21 10:33:01');
INSERT INTO `sys_code_value` VALUES (5, 3, 'ONLINE', '在线支付', NULL, -1, '2019-02-21 10:45:13', -1, '2019-02-21 10:45:17');
INSERT INTO `sys_code_value` VALUES (6, 4, 'CANCEL', '已取消', NULL, -1, '2019-02-21 10:47:43', -1, '2019-02-21 10:48:02');
INSERT INTO `sys_code_value` VALUES (7, 4, 'UNPAID', '未付款', NULL, -1, '2019-02-21 10:47:45', -1, '2019-02-21 10:48:04');
INSERT INTO `sys_code_value` VALUES (8, 4, 'PAID', '已付款', NULL, -1, '2019-02-21 10:47:49', -1, '2019-02-21 10:48:09');
INSERT INTO `sys_code_value` VALUES (9, 4, 'SHIPPED', '已发货', NULL, -1, '2019-02-21 10:47:52', -1, '2019-02-21 10:48:10');
INSERT INTO `sys_code_value` VALUES (10, 4, 'SUCCESS', '交易成功', NULL, -1, '2019-02-21 10:47:55', -1, '2019-02-21 10:48:14');
INSERT INTO `sys_code_value` VALUES (11, 4, 'CLOSED', '交易关闭', NULL, -1, '2019-02-21 10:47:57', -1, '2019-02-21 10:48:16');
INSERT INTO `sys_code_value` VALUES (12, 5, '1', '在售', NULL, -1, '2019-03-10 21:51:08', -1, '2019-03-13 12:30:25');
INSERT INTO `sys_code_value` VALUES (13, 5, '2', '已下架', NULL, -1, '2019-03-13 12:30:18', -1, '2019-03-13 12:30:28');
INSERT INTO `sys_code_value` VALUES (14, 5, '3', '已删除', NULL, -1, '2019-03-13 12:30:21', -1, '2019-03-13 12:30:30');
INSERT INTO `sys_code_value` VALUES (15, 5, '4', '出租中', NULL, -1, '2019-03-13 12:30:23', -1, '2019-03-13 12:30:32');

-- ----------------------------
-- View structure for product_order_update_v
-- ----------------------------
DROP VIEW IF EXISTS `product_order_update_v`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `product_order_update_v` AS select now() AS `now()`,`eo`.`order_status` AS `order_status`,`eo`.`end_time` AS `end_time`,`eo`.`close_time` AS `close_time`,(select `ecit_product`.`status` from `ecit_product` where (`ecit_product`.`product_id` = `oei`.`product_id`)) AS `status`,`oei`.`product_id` AS `product_id` from (`ecit_order` `eo` join `ecit_order_item` `oei`) where (`eo`.`order_no` = `oei`.`order_no`);

-- ----------------------------
-- View structure for sys_code_value_v
-- ----------------------------
DROP VIEW IF EXISTS `sys_code_value_v`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `sys_code_value_v` AS select `c`.`code_id` AS `code_id`,`c`.`code` AS `code`,`c`.`description` AS `description`,`cv`.`value` AS `value`,`cv`.`meaning` AS `meaning` from (`sys_code` `c` join `sys_code_value` `cv`) where (`c`.`code_id` = `cv`.`code_id`);

-- ----------------------------
-- Procedure structure for listen_order
-- ----------------------------
DROP PROCEDURE IF EXISTS `listen_order`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listen_order`()
BEGIN
	DECLARE l_order_no BIGINT;
	DECLARE l_creation_date datetime;
	DECLARE l_order_status VARCHAR(20);
	DECLARE done INT DEFAULT 0; 
	DECLARE cur_order CURSOR
	for SELECT order_no,creation_date,order_status from ecit_order
	WHERE order_status='NO_PAY';
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  

     OPEN cur_order;  
     order_loop: LOOP  
         FETCH cur_order INTO l_order_no, l_creation_date,l_order_status;  
         IF done=1 THEN  
             LEAVE order_loop;  
         END IF;  
				 if l_creation_date<Date_Add(now(),INTERVAL-30 MINUTE) then
					#更新订单为交易取消
					update ecit_order 
					set order_status='CANCEL',close_time=now(),last_update_date=now() 
					where order_no=l_order_no;
					
				 end if;
     END LOOP order_loop;  
     CLOSE cur_order; 
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for order_finish_proc
-- ----------------------------
DROP PROCEDURE IF EXISTS `order_finish_proc`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `order_finish_proc`()
BEGIN
     DECLARE l_order_no bigint;  
     DECLARE l_end_time datetime;  
     DECLARE l_order_status varchar(20); 
		 DECLARE l_product_id INTEGER; 
     DECLARE done INT DEFAULT 0;  
     DECLARE cur1 CURSOR 
		 FOR 
		 SELECT order_no, end_time,order_status 
		 FROM ecit_order 
		 where order_status='PAID';  
     DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  

     OPEN cur1;  
     emp_loop: LOOP  
         FETCH cur1 INTO l_order_no, l_end_time,l_order_status;  
         IF done=1 THEN  
             LEAVE emp_loop;  
         END IF;  
				 if l_end_time<=now() then
					#更新订单为交易完成
					update ecit_order 
					set order_status='SUCCESS',close_time=now(),last_update_date=now() 
					where order_no=l_order_no;
					#更新对应产品为上架状态
					SELECT product_id into l_product_id 
					from ecit_order_item
					where order_no=l_order_no;
					update ecit_product 
					set status=1,last_update_date=now()
					where product_id=l_product_id;
				 end if;
     END LOOP emp_loop;  
     CLOSE cur1;  
END
;;
delimiter ;

-- ----------------------------
-- Event structure for event_order
-- ----------------------------
DROP EVENT IF EXISTS `event_order`;
delimiter ;;
CREATE DEFINER = `root`@`localhost` EVENT `event_order`
ON SCHEDULE
EVERY '1' SECOND STARTS '2019-03-11 13:53:38'
ON COMPLETION PRESERVE
DO call listen_order()
;;
delimiter ;

-- ----------------------------
-- Event structure for second_event
-- ----------------------------
DROP EVENT IF EXISTS `second_event`;
delimiter ;;
CREATE DEFINER = `root`@`localhost` EVENT `second_event`
ON SCHEDULE
EVERY '1' SECOND STARTS '2019-03-08 14:05:45'
ON COMPLETION PRESERVE
DO call order_finish_proc()
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
