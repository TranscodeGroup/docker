/*
 Navicat Premium Data Transfer

 Source Server         : 219.138.167.86-咸宁
 Source Server Type    : MySQL
 Source Server Version : 50732 (5.7.32-log)
 Source Host           : 219.138.167.86:8560
 Source Schema         : tms

 Target Server Type    : MySQL
 Target Server Version : 50732 (5.7.32-log)
 File Encoding         : 65001

 Date: 06/06/2025 16:19:46
*/

-- 保证tms数据库存在， 并且默认字符集正确
CREATE DATABASE IF NOT EXISTS tms;
ALTER DATABASE tms DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
-- 初始化脚本显式选择 tms 库，避免使用 Flyway 默认的 maintain 库
USE tms;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_cargo
-- ----------------------------
DROP TABLE IF EXISTS `base_cargo`;
CREATE TABLE `base_cargo`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `cargo_group` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品类型',
  `cargo_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品编号',
  `cargo_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `cargo_unit` smallint(5) UNSIGNED ZEROFILL NOT NULL COMMENT '单位 0件 1箱 2桶 3袋 4kg 5L',
  `cargo_weight` decimal(10, 2) NOT NULL COMMENT '单件重量Kg',
  `cargo_volume` decimal(10, 2) NOT NULL COMMENT '单件体积m',
  `cargo_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单位价格（可选，用于成本计算）',
  `creator_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建用户',
  `creator_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建用户名称',
  `created_unix` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for base_customer
-- ----------------------------
DROP TABLE IF EXISTS `base_customer`;
CREATE TABLE `base_customer`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `customer_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户ID',
  `customer_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户编码',
  `customer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户名称',
  `industry` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属行业',
  `customer_level` smallint(6) NOT NULL DEFAULT 0 COMMENT '客户级别',
  `customer_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '客户标签',
  `region` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域，省市区',
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `postal_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态',
  `contact_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `contact_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `contact_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人邮箱',
  `contact_department` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人部门',
  `contact_position` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人职位',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `creator_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建用户名称',
  `created_unix` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_customer_id`(`customer_id`) USING BTREE,
  UNIQUE INDEX `uk_customer_code`(`customer_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'TMS联系人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for base_road
-- ----------------------------
DROP TABLE IF EXISTS `base_road`;
CREATE TABLE `base_road`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `road_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路书ID',
  `road_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路书名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '预设-车辆编号',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '预设-车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '预设-车牌号码 License Plate Number',
  `driver_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预设-驾驶员账号',
  `driver_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预设-预设驾驶员姓名',
  `path_points` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '运输路线，lng,lat|...',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建用户',
  `creator_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建用户名称',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_transport`(`organize_id`, `road_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'TMS订单联系人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for base_road_point
-- ----------------------------
DROP TABLE IF EXISTS `base_road_point`;
CREATE TABLE `base_road_point`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `road_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路书ID',
  `road_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路书名称',
  `fence_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自编码',
  `fence_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站台名称',
  `arrival_time` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划到达',
  `departure_time` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划到达',
  `cross_day` smallint(5) UNSIGNED ZEROFILL NOT NULL COMMENT '跨天',
  `time_zone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  `creator_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建用户',
  `creator_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建用户名称',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_transport`(`organize_id`, `road_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'TMS订单联系人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for base_workflow
-- ----------------------------
DROP TABLE IF EXISTS `base_workflow`;
CREATE TABLE `base_workflow`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `delivery_method` smallint(6) UNSIGNED ZEROFILL NOT NULL COMMENT '配送方式',
  `step_event` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '事件类型, 枚举类型',
  `step_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '事件名称',
  `step_order` smallint(6) NOT NULL DEFAULT 0 COMMENT '步骤排序',
  `created_unix` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_cargo
-- ----------------------------
DROP TABLE IF EXISTS `order_cargo`;
CREATE TABLE `order_cargo`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `cargo_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商品编号',
  `order_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `cargo_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `cargo_quantity` int(11) NOT NULL DEFAULT 0 COMMENT '运输数量',
  `cargo_unit` smallint(5) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000 COMMENT '单位 0件 1箱 2桶 3袋 4kg 5L',
  `cargo_weight` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '单件重量Kg',
  `cargo_volume` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '单件体积m',
  `cargo_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单位价格（可选，用于成本计算）',
  `creator_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建用户',
  `creator_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建用户名称',
  `created_unix` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_contact
-- ----------------------------
DROP TABLE IF EXISTS `order_contact`;
CREATE TABLE `order_contact`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `order_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `fence_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自编码',
  `fence_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站台名称',
  `contact_type` smallint(6) NOT NULL COMMENT '1=发货人，2=收货人',
  `contact_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系人姓名',
  `contact_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `plan_time` datetime NULL DEFAULT NULL COMMENT '计划发货/收货时间',
  `province_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份编码',
  `province_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份名称',
  `city_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市编码',
  `city_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  `district_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区县编码',
  `district_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区县名称',
  `detail_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细的地址',
  `center_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '中心点经纬度',
  `center_lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '中心点经纬度',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_number`(`organize_id`, `order_number`, `contact_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'TMS订单联系人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `order_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `order_status` int(11) NOT NULL COMMENT '订单状态',
  `customer_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户ID',
  `customer_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户编码',
  `customer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户名称',
  `transport_type` int(11) UNSIGNED NOT NULL COMMENT '运输类型 0整车运输FTL；1拼车运输LTL',
  `cargo_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货物类型，水果，食品等',
  `delivery_method` smallint(6) UNSIGNED NOT NULL COMMENT '配送方式 0自提配送 1送货上门',
  `contract_info` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同信息',
  `order_source` smallint(6) UNSIGNED NOT NULL COMMENT '订单来源',
  `vehicle_requirements` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆需求',
  `shipping_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货单号',
  `shipping_total` smallint(6) NOT NULL DEFAULT 1 COMMENT '默认只有一个批次',
  `shipping_index` smallint(6) NOT NULL DEFAULT 1 COMMENT '默认只有一个批次',
  `waybill_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运输单',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建用户',
  `creator_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建用户名称',
  `created_unix` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order`(`organize_id`, `order_number`) USING BTREE,
  INDEX `idx_transport`(`organize_id`, `waybill_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'TMS订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_timeline
-- ----------------------------
DROP TABLE IF EXISTS `order_timeline`;
CREATE TABLE `order_timeline`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `order_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `event_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '事件类型, 枚举类型',
  `before_status` int(1) NOT NULL DEFAULT 0 COMMENT '之前订单状态',
  `after_status` int(1) NOT NULL DEFAULT 0 COMMENT '之后订单状态',
  `is_workflow` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否核心的业务流程, 创建订单生成, 后续业务只更新',
  `creator_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建用户ID',
  `creator_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建用户名称',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_event`(`organize_id`, `order_number`, `event_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '运输单时间线' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_waypoint
-- ----------------------------
DROP TABLE IF EXISTS `order_waypoint`;
CREATE TABLE `order_waypoint`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `order_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `fence_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自编码',
  `fence_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站台名称',
  `waypoint_type` smallint(6) NOT NULL COMMENT '1=发货人，2=收货人',
  `contact_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系人姓名',
  `contact_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `plan_time` datetime NULL DEFAULT NULL COMMENT '计划发货/收货时间',
  `province_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份编码',
  `province_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份名称',
  `city_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市编码',
  `city_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  `district_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区县编码',
  `district_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区县名称',
  `detail_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细的地址',
  `center_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '中心点经纬度',
  `center_lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '中心点经纬度',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_number`(`organize_id`, `order_number`, `waypoint_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 177 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'TMS订单联系人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for waybill_info
-- ----------------------------
DROP TABLE IF EXISTS `waybill_info`;
CREATE TABLE `waybill_info`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `waybill_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运输单',
  `waybill_status` int(16) UNSIGNED NOT NULL DEFAULT 0 COMMENT '运输单状态',
  `waybill_paths` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '运输路线，lng,lat|...',
  `path_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '常用路线ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆编号',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌号码 License Plate Number',
  `driver_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '工号',
  `driver_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `cargo_quantity` int(11) NOT NULL DEFAULT 0 COMMENT '运输数量',
  `cargo_weight` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '单件重量Kg',
  `cargo_volume` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '单件体积m',
  `creator_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建用户ID',
  `creator_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建用户名称',
  `created_unix` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_transport`(`organize_id`, `waybill_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'TMS订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for waybill_timeline
-- ----------------------------
DROP TABLE IF EXISTS `waybill_timeline`;
CREATE TABLE `waybill_timeline`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `waybill_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单编号 唯一值，供客户查询',
  `event_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '状态机事件ID',
  `before_status` int(1) NOT NULL DEFAULT 0 COMMENT '之前订单状态',
  `after_status` int(1) NOT NULL DEFAULT 0 COMMENT '之后订单状态',
  `change_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '变更信息,JSON对象',
  `creator_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建用户ID',
  `creator_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建用户名称',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transport_number`(`waybill_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '运输单时间线' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for waybill_waypoint
-- ----------------------------
DROP TABLE IF EXISTS `waybill_waypoint`;
CREATE TABLE `waybill_waypoint`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `waybill_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运输单',
  `serial_number` int(11) NOT NULL COMMENT '序号, 先到哪里再去哪里',
  `fence_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '围栏ID',
  `fence_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '围栏名称',
  `order_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '订单编号',
  `waypoint_type` smallint(6) NOT NULL COMMENT '0=装货或卸货,10=途经点, 20=返程点',
  `plan_arrival` datetime NULL DEFAULT NULL COMMENT '计划到达时间',
  `real_arrival` datetime NULL DEFAULT NULL COMMENT '实际到达时间',
  `start_work` datetime NULL DEFAULT NULL COMMENT '开始工作时间',
  `end_work` datetime NULL DEFAULT NULL COMMENT '结束工作时间',
  `real_departure` datetime NULL DEFAULT NULL COMMENT '实际出发时间',
  `center_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '中心点经纬度',
  `center_lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '中心点经纬度',
  `creator_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建用户ID',
  `creator_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建用户名称',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_transport`(`organize_id`, `waybill_number`, `fence_id`) USING BTREE,
  INDEX `idx_order`(`organize_id`, `order_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'TMS订单联系人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for waybill_waypoint_order
-- ----------------------------
DROP TABLE IF EXISTS `waybill_waypoint_order`;
CREATE TABLE `waybill_waypoint_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `waybill_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '运输单',
  `serial_number` int(11) NOT NULL COMMENT '序号, 先到哪里再去哪里',
  `order_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `load_type` smallint(6) NOT NULL COMMENT '装货或者卸货：1=装货，2=卸货',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_transport`(`organize_id`, `waybill_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'TMS订单联系人' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
