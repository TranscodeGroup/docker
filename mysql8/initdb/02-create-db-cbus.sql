/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1_广西恭城
 Source Server Type    : MySQL
 Source Server Version : 50730 (5.7.30)
 Source Host           : 127.0.0.1:3366
 Source Schema         : cbus

 Target Server Type    : MySQL
 Target Server Version : 50730 (5.7.30)
 File Encoding         : 65001

 Date: 13/05/2025 19:57:19
*/

CREATE DATABASE IF NOT EXISTS cbus DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE cbus;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for basic_ad_banner
-- ----------------------------
DROP TABLE IF EXISTS `basic_ad_banner`;
CREATE TABLE `basic_ad_banner`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公交公司id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `link` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容链接',
  `is_show` int(11) NOT NULL DEFAULT 0 COMMENT '是否展示，0不展示，1展示',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `release_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of basic_ad_banner
-- ----------------------------

-- ----------------------------
-- Table structure for basic_ad_passenger_info
-- ----------------------------
DROP TABLE IF EXISTS `basic_ad_passenger_info`;
CREATE TABLE `basic_ad_passenger_info`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公交公司id',
  `template_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `info_serial` int(11) NOT NULL DEFAULT 0 COMMENT '取值范围1～10',
  `info_content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息内容 最长1024',
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `info_priority` int(11) NOT NULL DEFAULT 0 COMMENT '信息优先级',
  `display_method` int(11) NOT NULL DEFAULT 0 COMMENT '表47 信息显示方式',
  `display_position` int(11) NOT NULL DEFAULT 0 COMMENT '表48 信息显示位置定义',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of basic_ad_passenger_info
-- ----------------------------

-- ----------------------------
-- Table structure for basic_ad_passenger_publish
-- ----------------------------
DROP TABLE IF EXISTS `basic_ad_passenger_publish`;
CREATE TABLE `basic_ad_passenger_publish`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公交公司id',
  `template_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `template_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '取值范围1～10',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '终端IMEI  自定义输入 不通过系统编码',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路名称',
  `published_status` int(11) NOT NULL DEFAULT 0 COMMENT '发布状态 1发布中  2成功 3失败',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of basic_ad_passenger_publish
-- ----------------------------

-- ----------------------------
-- Table structure for basic_ad_passenger_template
-- ----------------------------
DROP TABLE IF EXISTS `basic_ad_passenger_template`;
CREATE TABLE `basic_ad_passenger_template`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公交公司id',
  `template_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `template_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `template_type` int(11) NOT NULL DEFAULT 0 COMMENT '1预置信息 2即时信息',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of basic_ad_passenger_template
-- ----------------------------

-- ----------------------------
-- Table structure for basic_alarm_device
-- ----------------------------
DROP TABLE IF EXISTS `basic_alarm_device`;
CREATE TABLE `basic_alarm_device`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_alarm_id` int(11) NOT NULL COMMENT '报警类型 前端输入 校验唯一',
  `device_alarm_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform_alarm_id` int(11) NULL DEFAULT NULL COMMENT '对应平台报警ID',
  `protocol` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '协议名称',
  `sort_id` int(11) NULL DEFAULT NULL COMMENT '排序字段',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ak_aid`(`device_alarm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_alarm_device
-- ----------------------------

-- ----------------------------
-- Table structure for basic_alarm_platform
-- ----------------------------
DROP TABLE IF EXISTS `basic_alarm_platform`;
CREATE TABLE `basic_alarm_platform`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform_alarm_id` int(11) NOT NULL COMMENT '报警类型 前端输入 校验唯一',
  `platform_alarm_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `group_id` int(11) NULL DEFAULT NULL COMMENT '报警分组ID',
  `sort_id` int(11) NULL DEFAULT NULL COMMENT '排序字段',
  `push_name_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `push_name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `push_name_th` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `turn_off_push` int(11) NULL DEFAULT 0 COMMENT '是否关闭报警0开启 1关闭',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ak_aid`(`platform_alarm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_alarm_platform
-- ----------------------------

-- ----------------------------
-- Table structure for basic_announcement
-- ----------------------------
DROP TABLE IF EXISTS `basic_announcement`;
CREATE TABLE `basic_announcement`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公交公司id',
  `author` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布者',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公告标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告内容',
  `is_show` int(11) NOT NULL DEFAULT 0 COMMENT '是否展示，0不展示，1展示',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `release_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日期',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建账号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of basic_announcement
-- ----------------------------

-- ----------------------------
-- Table structure for basic_announcement_flag
-- ----------------------------
DROP TABLE IF EXISTS `basic_announcement_flag`;
CREATE TABLE `basic_announcement_flag`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `announcement_id` int(11) NOT NULL DEFAULT 0 COMMENT '公告id',
  `user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of basic_announcement_flag
-- ----------------------------

-- ----------------------------
-- Table structure for basic_busstop
-- ----------------------------
DROP TABLE IF EXISTS `basic_busstop`;
CREATE TABLE `basic_busstop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `stop_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自编码',
  `stop_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站台编号',
  `stop_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站台名称',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '0暂未开通 10运营 20停运',
  `lng` decimal(10, 6) NULL DEFAULT 0.000000 COMMENT '站台经纬度',
  `lat` decimal(10, 6) NULL DEFAULT 0.000000 COMMENT '站台经纬度',
  `azimuth` smallint(6) NULL DEFAULT 0 COMMENT '方位角',
  `icon` int(11) NULL DEFAULT 0 COMMENT '图标 0默认站台 1BRT站台 2船舶',
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站台图片URL',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `nearby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '靠近位置',
  `open_time` datetime NULL DEFAULT NULL COMMENT '开通时间',
  `stop_time` datetime NULL DEFAULT NULL COMMENT '停运时间',
  `goby` int(11) NULL DEFAULT 0 COMMENT '途径线路',
  `is_share` tinyint(4) NOT NULL DEFAULT 0 COMMENT '企业内共享 0私有 1公用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_stop_id`(`stop_id`) USING BTREE,
  UNIQUE INDEX `uk_stop_code`(`company_id`, `stop_code`, `is_deleted`) USING BTREE,
  INDEX `idx_stop`(`company_id`, `stop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_busstop
-- ----------------------------

-- ----------------------------
-- Table structure for basic_car
-- ----------------------------
DROP TABLE IF EXISTS `basic_car`;
CREATE TABLE `basic_car`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '自编号码',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `car_state` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态 0正常 10维修  20扣车 100报废',
  `vin` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆识别代码',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `lpn_color` int(11) NULL DEFAULT 9 COMMENT '车牌颜色 1蓝色 2黄色 3黑色 4白色 9其他',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '企业内组织分组',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路',
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/file/static/images/image-48.png' COMMENT '车辆图片',
  `icon` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'bus' COMMENT '图标索引',
  `register_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登记日期',
  `expire_time` datetime NOT NULL COMMENT '平台到期时间',
  `expire_verify` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '过期验证',
  `approved_number` int(11) NULL DEFAULT 50 COMMENT '核载人数',
  `fuel_km` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '百公里耗油',
  `fuel_hours` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '每小时油耗',
  `fuel_tank` decimal(11, 3) NULL DEFAULT 60.000 COMMENT '油箱容量',
  `iode_fine` varchar(368) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IO自定义',
  `has_ac` int(11) NOT NULL DEFAULT 0 COMMENT '是否空调车',
  `mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '里程 km',
  `contract_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `equipment_count` int(11) NULL DEFAULT 0 COMMENT '车速安装设备数量',
  `seat_map` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '座位表[z1-x1-y1, z2-x2-y2]',
  `vehicle_provider` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆供应商',
  `vehicle_type_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车型',
  `vehicle_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车型，车辆标准',
  `vehicle_source` int(11) NOT NULL DEFAULT 0 COMMENT '车辆来源 0购买 1租赁',
  `fixed_emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定驾驶员编号',
  `fixed_emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定驾驶员姓名',
  `driving_license_time` datetime NULL DEFAULT NULL COMMENT '行驶证到期时间',
  `compulsory_insurance_time` datetime NULL DEFAULT NULL COMMENT '交强险到期时间',
  `commercial_insurance_time` datetime NULL DEFAULT NULL COMMENT '商业保险时间',
  `next_inspection_time` datetime NULL DEFAULT NULL COMMENT '下一次年检时间',
  `next_maintenance_time` datetime NULL DEFAULT NULL COMMENT '下一次保养时间',
  `registration_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '车辆注册号',
  `vehicle_model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆型号(泰国项目)',
  `tax_due_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税到期日',
  `contract_expiration_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同到期日',
  `unit_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '序列号',
  `vehicle_options` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '车辆附加信息JSON等',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_car_id`(`car_id`) USING BTREE,
  UNIQUE INDEX `uk_car_name`(`company_id`, `car_name`, `is_deleted`) USING BTREE,
  INDEX `idx_car`(`company_id`, `car_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_car
-- ----------------------------
INSERT INTO `basic_car` VALUES (1, '10001', 'CAR000001', '18270240064', 0, '', '18270240064', 5, 'GRP000001', 'ROU000001', '', 'car', '2025-05-13 08:54:21', '2026-05-13 08:54:21', '0sz5OkypkZl50iIUiTJyNA==', 0, 0.000, 0.000, 60.000, '', 0, 0.000, '', 0, NULL, NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '{}', '', 0, 'UID010001', '2025-05-13 08:54:43', '2025-05-13 08:54:43');

-- ----------------------------
-- Table structure for basic_car_insurance
-- ----------------------------
DROP TABLE IF EXISTS `basic_car_insurance`;
CREATE TABLE `basic_car_insurance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆保险',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '自编号码',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `vin` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆识别代码',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车牌号码 License Plate Number',
  `effective_time` datetime NOT NULL COMMENT '发证时间',
  `expire_time` datetime NOT NULL COMMENT '到期时间',
  `insurance_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保险单号',
  `insurance_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保险类型',
  `insurance_company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司',
  `agent` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理人',
  `phone_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险联系电话',
  `original_price` decimal(11, 3) NULL DEFAULT NULL COMMENT '原保险价格',
  `discount` decimal(10, 0) NULL DEFAULT NULL COMMENT '折扣',
  `actual_price` decimal(11, 3) NULL DEFAULT NULL COMMENT '实际保险价格',
  `insurance_claims` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险理赔',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_car`(`company_id`, `car_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_car_insurance
-- ----------------------------

-- ----------------------------
-- Table structure for basic_car_license
-- ----------------------------
DROP TABLE IF EXISTS `basic_car_license`;
CREATE TABLE `basic_car_license`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆行驶证',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `vin` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆识别代码',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '自编号码',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车牌号码 License Plate Number',
  `lpn_color` int(11) NOT NULL DEFAULT 1 COMMENT '车牌颜色 1蓝色 2黄色 3黑色 4白色 9其他',
  `engine_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行驶证号',
  `effective_time` datetime NOT NULL COMMENT '发证时间',
  `expire_time` datetime NOT NULL COMMENT '到期时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_car`(`company_id`, `car_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_car_license
-- ----------------------------

-- ----------------------------
-- Table structure for basic_car_renewal
-- ----------------------------
DROP TABLE IF EXISTS `basic_car_renewal`;
CREATE TABLE `basic_car_renewal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆行驶证',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '自编号码',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `lpn_color` int(11) NULL DEFAULT 1 COMMENT '车牌颜色 1蓝色 2黄色 3黑色 4白色 9其他',
  `vin` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆识别代码',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业内组织分组',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '公司或车队名称',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '线路名称',
  `renewal_duration` int(11) NOT NULL COMMENT '续约时长月份',
  `expire_time_before` datetime NOT NULL COMMENT '到期时间',
  `expire_time_after` datetime NOT NULL COMMENT '到期时时(续期后)',
  `cost` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '单个车辆支付金额',
  `total_cost` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '总支付金额',
  `renewal_status` smallint(6) NOT NULL DEFAULT 0 COMMENT '0创建 1已审批 2已取消',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `review_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核用户ID',
  `review_account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order`(`order_id`, `car_id`) USING BTREE,
  UNIQUE INDEX `uk_expire_time`(`car_id`, `company_id`, `expire_time_before`, `renewal_duration`) USING BTREE,
  INDEX `idx_order`(`company_id`, `order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of basic_car_renewal
-- ----------------------------

-- ----------------------------
-- Table structure for basic_car_type
-- ----------------------------
DROP TABLE IF EXISTS `basic_car_type`;
CREATE TABLE `basic_car_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公交公司id',
  `vehicle_type_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车型ID',
  `vehicle_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车型描述',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_vehicle_type`(`company_id`, `vehicle_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of basic_car_type
-- ----------------------------

-- ----------------------------
-- Table structure for basic_device
-- ----------------------------
DROP TABLE IF EXISTS `basic_device`;
CREATE TABLE `basic_device`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '102' COMMENT '企业id',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '终端IMEI  自定义输入 不通过系统编码',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组id 关联t_group',
  `type_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备类型 关联t_devtype表',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `register_time` datetime NULL DEFAULT NULL COMMENT '激活日期',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '到期时间',
  `time_zone` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '+08:00' COMMENT '设备台账时区',
  `character_set` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'GBK' COMMENT '字符集GBK或UTF-8',
  `channel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '通道列表',
  `is_slave` tinyint(4) NULL DEFAULT 0 COMMENT '是否备机',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `firmware` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固件版本',
  `ban_hint` int(11) NOT NULL DEFAULT 0 COMMENT '过期提示 0表提示 1表禁用提示',
  `bind_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定账号',
  `connect_state` int(11) NULL DEFAULT 0 COMMENT '连接状态 0离线  1在线',
  `first_connect_time` datetime NULL DEFAULT NULL COMMENT '第一次连接时间',
  `last_connect_time` datetime NULL DEFAULT NULL COMMENT '最后连接时间',
  `attached` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加JSON',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`imei`, `is_deleted`) USING BTREE,
  INDEX `idx_imei`(`company_id`, `imei`) USING BTREE,
  INDEX `idx_car`(`company_id`, `car_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_device
-- ----------------------------
INSERT INTO `basic_device` VALUES (1, '10001', '18270240064', 'GRP000001', 'DTY000124', 'CAR000001', NULL, NULL, '+08:00', 'GBK', 'CH1,CH2,CH3,CH4,CH5,CH6,CH7,CH8', 0, NULL, '2.3.21 r1 K3|2025-04-11_13-42-51', 0, NULL, 1, '2025-05-13 09:11:23', '2025-05-13 10:52:36', NULL, NULL, 0, '2025-05-13 08:54:43', '2025-05-13 10:52:36');

-- ----------------------------
-- Table structure for basic_device_request
-- ----------------------------
DROP TABLE IF EXISTS `basic_device_request`;
CREATE TABLE `basic_device_request`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '司机手动命令',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `request_code` int(11) NOT NULL COMMENT '终端司机请求命令ID',
  `request_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '终端司机请求命令名称',
  `event_code` int(11) NOT NULL COMMENT '事件代码',
  `bind_run_state` int(11) NOT NULL DEFAULT 0 COMMENT '事件代码=其他的时候, 绑定的车辆运营状态',
  `bind_task_state` int(11) NOT NULL DEFAULT 0 COMMENT '事件代码=其他的时候, 绑定的车辆任务状态',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终端司机请求命令名称',
  `function_key` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能键 F8  F9',
  `hot_key` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快捷键 F0~F7',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '逻辑删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_device_request
-- ----------------------------

-- ----------------------------
-- Table structure for basic_device_type
-- ----------------------------
DROP TABLE IF EXISTS `basic_device_type`;
CREATE TABLE `basic_device_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一编码',
  `type_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '终端型号',
  `factory` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备生产厂商',
  `protocol` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通讯协议类型',
  `support` int(11) NULL DEFAULT 255 COMMENT '支持功能 低位 第1位在线 2定位 3ACC 4外接电源',
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'motor/static/images/image-48.png' COMMENT '设备类型图片',
  `sort_id` int(11) NULL DEFAULT 100 COMMENT '排序',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `tags` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固件过滤标签',
  `notice` smallint(6) NULL DEFAULT 0 COMMENT '1控制指令升级 2通过远程升级通知升级 100自定义',
  `two_in_one` int(11) NOT NULL DEFAULT 0 COMMENT '二合一设备',
  `alarm_mapping` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主动安全报警映射',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_type`(`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_device_type
-- ----------------------------
INSERT INTO `basic_device_type` VALUES (110, 'DTY000113', 'TG-MDVR', 'Transcodegroup', '808&1078', 1535, 'files/img/devtype/4be52d46ecf84d79b10de8f7c3e2b230.jpg', 41, '支持国标808/1078设备，通用类型', 'k3u;k8vu;stu;zip', 2, 0, NULL, '2019-08-23 07:43:12', '2021-01-11 09:17:58');
INSERT INTO `basic_device_type` VALUES (114, 'DTY000117', 'TG-T8', 'Transcodegroup', '808&1078&bus', 1151, '', 31, '刷卡，报站，4CH视频', 'k8hu;k8vu', 2, 1, NULL, '2019-08-23 07:43:12', '2021-03-04 08:57:27');
INSERT INTO `basic_device_type` VALUES (115, 'DTY000118', 'TG-T3', 'Transcodegroup', '808&1078&bus', 1055, '', 30, '刷卡，报站', 'k3u', 2, 0, NULL, '2019-08-23 07:43:12', '2021-01-11 09:17:53');
INSERT INTO `basic_device_type` VALUES (118, 'DTY000121', 'TG-SD', 'Transcodegroup', '808&1078', 1535, '', 50, 'SD卡录像', 'MR9704C;CONFIG', 1, 0, NULL, '2019-08-23 07:43:12', '2021-01-11 09:17:39');
INSERT INTO `basic_device_type` VALUES (119, 'DTY000122', 'TG-HD', 'Transcodegroup', '808&1078', 1535, '', 51, '硬盘录像', 'MR9704C;CONFIG', 1, 0, NULL, '2019-08-23 07:43:12', '2021-01-11 09:17:41');
INSERT INTO `basic_device_type` VALUES (120, 'DTY000124', 'K3&MDVR', 'Transcodegroup', '808&1078&bus', 67056, '', 61, 'K3&MDVR配套使用', 'k3u;k8vu;stu;zip', 2, 1, NULL, '2020-12-17 07:25:54', '2021-01-11 09:17:47');
INSERT INTO `basic_device_type` VALUES (121, 'DTY000125', 'TG_BUS', 'STM', '808&1078&bus&stm', 0, '', 71, '扩展协议，0x16,0x17,0x18是公交数据的设备,GPS站序错误忽略\n', 'sw;zip', 2, 0, NULL, '2020-12-24 11:36:04', '2021-02-25 02:00:06');
INSERT INTO `basic_device_type` VALUES (122, 'DTY000126', 'TG-K3', 'Transcodegroup', '808&1078', 1520, '', 72, '刷卡，报站，文本下发', 'k3u;stu;zip', 2, 0, NULL, '2021-01-25 05:41:52', '2021-01-29 08:27:40');
INSERT INTO `basic_device_type` VALUES (123, 'DTY000127', 'L12', 'L12', 'LTY', 0, '', NULL, 'lty的设备升级', 'sw', 101, 0, NULL, '2021-06-02 07:23:52', '2021-06-04 02:44:19');

-- ----------------------------
-- Table structure for basic_display
-- ----------------------------
DROP TABLE IF EXISTS `basic_display`;
CREATE TABLE `basic_display`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `display_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '显示屏ID,和IMEI一样手工输入',
  `display_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '显示屏名称',
  `display_state` int(11) NOT NULL DEFAULT 0 COMMENT '0暂未开通 10开通 20维护',
  `display_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子站牌类型',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `stop_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安装的站台',
  `region_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应自定义区域ID',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '站台经纬度',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '站台经纬度',
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子站牌图片URL',
  `install_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安装时间',
  `next_maintain_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下一次维护日期',
  `next_maintain_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下一次维护内容',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_display_id`(`company_id`, `display_id`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_display
-- ----------------------------

-- ----------------------------
-- Table structure for basic_display_ad
-- ----------------------------
DROP TABLE IF EXISTS `basic_display_ad`;
CREATE TABLE `basic_display_ad`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父标题',
  `subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子标题',
  `display_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指定电子站牌ID',
  `is_published` smallint(6) NOT NULL DEFAULT 0 COMMENT '已发布 1已发布 0未发布',
  `publish_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`publish_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_display_ad
-- ----------------------------

-- ----------------------------
-- Table structure for basic_display_maintain
-- ----------------------------
DROP TABLE IF EXISTS `basic_display_maintain`;
CREATE TABLE `basic_display_maintain`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `display_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '显示屏ID,和IMEI一样手工输入',
  `maintain_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维护内容',
  `maintain_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维护时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_display_date`(`display_id`, `maintain_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_display_maintain
-- ----------------------------

-- ----------------------------
-- Table structure for basic_display_route
-- ----------------------------
DROP TABLE IF EXISTS `basic_display_route`;
CREATE TABLE `basic_display_route`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `display_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '显示屏ID,和IMEI一样手工输入',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '显示屏名称',
  `direction` int(11) NULL DEFAULT 0 COMMENT '方向 0全部 1上行 2下行 3环线',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_display_id`(`company_id`, `display_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_display_route
-- ----------------------------

-- ----------------------------
-- Table structure for basic_employee
-- ----------------------------
DROP TABLE IF EXISTS `basic_employee`;
CREATE TABLE `basic_employee`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `nick_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `emp_type` smallint(6) NOT NULL DEFAULT 1 COMMENT '员工类型 0默认1 驾驶员 2乘务员 3站务',
  `emp_state` smallint(6) NULL DEFAULT 0 COMMENT '状态 0在职 10请假  100离职',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队 关联t_fleet',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路 关联t_route',
  `quit_time` datetime NULL DEFAULT NULL COMMENT '停职时间',
  `entry_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入职时间',
  `personal` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `birthday` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `sex` int(8) NULL DEFAULT NULL COMMENT '性别 0未知 1男 2女',
  `license` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶证',
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶证类型',
  `expire` datetime NULL DEFAULT NULL COMMENT '驾驶证有效期',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `spell` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母拼写',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `emp_provider` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方服务企业',
  `open_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开放平台ID',
  `is_deleted` int(11) NULL DEFAULT 0 COMMENT '逻辑删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_emp`(`company_id`, `emp_id`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_employee
-- ----------------------------

-- ----------------------------
-- Table structure for basic_employee_card
-- ----------------------------
DROP TABLE IF EXISTS `basic_employee_card`;
CREATE TABLE `basic_employee_card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `card_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物理卡号',
  `physical_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物理卡号',
  `register_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '逻辑删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_emp`(`company_id`, `card_id`, `is_deleted`) USING BTREE,
  UNIQUE INDEX `uk_physical`(`company_id`, `physical_number`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_employee_card
-- ----------------------------

-- ----------------------------
-- Table structure for basic_fault_area
-- ----------------------------
DROP TABLE IF EXISTS `basic_fault_area`;
CREATE TABLE `basic_fault_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司ID',
  `area_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域ID',
  `area_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域名称',
  `parent_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主区域ID',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int(11) NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_fault_area`(`company_id`, `area_id`, `parent_id`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of basic_fault_area
-- ----------------------------

-- ----------------------------
-- Table structure for basic_fault_description
-- ----------------------------
DROP TABLE IF EXISTS `basic_fault_description`;
CREATE TABLE `basic_fault_description`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司ID',
  `module_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块ID',
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块名称',
  `parent_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主模块ID',
  `is_deleted` int(11) NULL DEFAULT 0,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_fault_description`(`company_id`, `module_id`, `parent_id`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_fault_description
-- ----------------------------

-- ----------------------------
-- Table structure for basic_fault_history
-- ----------------------------
DROP TABLE IF EXISTS `basic_fault_history`;
CREATE TABLE `basic_fault_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自编号',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `event_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据编号',
  `fault_status` int(11) NULL DEFAULT NULL COMMENT '状态 0=创建, 1=审核, 2=确认, 3=指派, 4=误报, 5=解决, 255=关闭',
  `history_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主标签',
  `history_children` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签明细',
  `is_deleted` int(11) NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_history`(`company_id`, `event_id`, `fault_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_fault_history
-- ----------------------------

-- ----------------------------
-- Table structure for basic_fault_part
-- ----------------------------
DROP TABLE IF EXISTS `basic_fault_part`;
CREATE TABLE `basic_fault_part`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fault_part_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fault_part_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_deleted` int(11) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_part`(`company_id`, `fault_part_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_fault_part
-- ----------------------------

-- ----------------------------
-- Table structure for basic_fault_repair
-- ----------------------------
DROP TABLE IF EXISTS `basic_fault_repair`;
CREATE TABLE `basic_fault_repair`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `event_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事件编号',
  `fault_type` int(11) NOT NULL COMMENT '故障类型',
  `description_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '故障描述ID',
  `description_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '故障描述',
  `module_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主模块ID',
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主模块名称',
  `sub_module_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子模块ID',
  `sub_module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子模块名称',
  `current_assignment` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前指派ID',
  `current_assignment_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前指派人名称',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域ID',
  `fleet_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  `sub_fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子区域ID',
  `sub_fleet_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子区域名称',
  `fault_status` int(11) NULL DEFAULT 0 COMMENT '状态 0=创建, 1=审核, 2=确认, 3=指派, 4=误报, 5=解决, 255=关闭',
  `repair_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报修人ID',
  `repair_user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报修人名称',
  `repair_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '报修时间',
  `parking_space` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '停车位',
  `residence_time` datetime NULL DEFAULT NULL COMMENT '停留时间',
  `parking_time` datetime NULL DEFAULT NULL COMMENT '停车时间',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `steps_reproduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重现步骤',
  `attachment` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件',
  `file_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件文件名称',
  `fault_part_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '故障部件',
  `fault_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '故障原因',
  `resolution_time` datetime NULL DEFAULT NULL COMMENT '解决时间',
  `fault_solution_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解决方案',
  `fault_solution_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解决方案名称',
  `close_time` datetime NULL DEFAULT NULL COMMENT '关闭时间',
  `history_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '历史记录',
  `report_type` smallint(6) NULL DEFAULT 0 COMMENT '报告上报类型 0=内部，1=外部',
  `description_type` smallint(6) NULL DEFAULT 0 COMMENT '故障描述类型 0=控制室，1=车上的设备',
  `fault_solution_status` smallint(6) NULL DEFAULT 0 COMMENT '解决状态 0=正常或未处理，1=已解决',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_fault_repair`(`company_id`, `event_id`, `create_time`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_fault_repair
-- ----------------------------

-- ----------------------------
-- Table structure for basic_fault_solution
-- ----------------------------
DROP TABLE IF EXISTS `basic_fault_solution`;
CREATE TABLE `basic_fault_solution`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fault_solution_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fault_solution_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_deleted` int(11) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_solution`(`company_id`, `fault_solution_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_fault_solution
-- ----------------------------

-- ----------------------------
-- Table structure for basic_firmware
-- ----------------------------
DROP TABLE IF EXISTS `basic_firmware`;
CREATE TABLE `basic_firmware`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `firmware_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '固件ID',
  `firmware_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '固件名称',
  `firmware_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '固件类型 1固件 2报站文件 3系统配置',
  `firmware_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '版本号',
  `firmware_tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '固件标签，采用;分割',
  `notify_type` int(255) NOT NULL DEFAULT 1 COMMENT '1文件升级  2文本通知',
  `file_dir` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/files/ota/bus/' COMMENT '文件目录',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'FTP文件名称',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报站文件车队id',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `ota_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本升级，升级类型=文本的时候生效',
  `device_tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '2合1设备, 同IMEI设备过滤项, ITS MDVR等',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记,删除改ID',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_firmware`(`firmware_id`) USING BTREE,
  INDEX `uk_cid_firmware`(`company_id`, `firmware_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_firmware
-- ----------------------------

-- ----------------------------
-- Table structure for basic_firmware_ota
-- ----------------------------
DROP TABLE IF EXISTS `basic_firmware_ota`;
CREATE TABLE `basic_firmware_ota`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备ID',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路名称',
  `notice_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '对应设备类型 1控制指令升级 2通过远程升级通知升级 50文本升级 100自定义',
  `ota_state` smallint(6) NOT NULL DEFAULT 0 COMMENT '-1已取消 0未执行 1执行中 2已完成 3失败',
  `progress_code` int(11) NULL DEFAULT 0 COMMENT '当前进度状态码',
  `ota_progress` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前进度',
  `firmware_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '固件ID',
  `firmware_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '固件名称',
  `firmware_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '固件类型 1固件 2报站文件',
  `file_dir` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/bus/' COMMENT '文件目录',
  `ota_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本升级，升级类型=文本的时候生效',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `device_tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '2合1设备, 同IMEI设备过滤项, ITS MDVR等',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记,删除改ID',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_firmware_ota`(`company_id`, `is_deleted`, `imei`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_firmware_ota
-- ----------------------------

-- ----------------------------
-- Table structure for basic_fleet
-- ----------------------------
DROP TABLE IF EXISTS `basic_fleet`;
CREATE TABLE `basic_fleet`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织ID/分组ID',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司或车队名称',
  `parent_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父组织ID',
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'al-icon-genderless' COMMENT '图标',
  `category` int(11) NOT NULL DEFAULT 0 COMMENT '0 默认 1总公司 2分公司 3车队 4调度站 100调度中心 200其他',
  `computer_count` int(11) NULL DEFAULT 0 COMMENT '调度室电脑数量',
  `sort_id` int(11) NULL DEFAULT 100,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`company_id`, `fleet_name`) USING BTREE,
  UNIQUE INDEX `uk_id`(`fleet_id`) USING BTREE,
  INDEX `idx_fleet`(`company_id`, `fleet_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_fleet
-- ----------------------------
INSERT INTO `basic_fleet` VALUES (1, '10001', 'GRP000001', '恭城公交', '', 'al-icon-genderless', 0, 0, 100, '', 'UID010001', '2025-05-13 08:53:55', '2025-05-13 08:53:55');

-- ----------------------------
-- Table structure for basic_illegal_score
-- ----------------------------
DROP TABLE IF EXISTS `basic_illegal_score`;
CREATE TABLE `basic_illegal_score`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `illegal_type` int(11) NOT NULL DEFAULT 0 COMMENT '违规类型',
  `reduce_score` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '一次违规扣分多少',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '违规扣分配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of basic_illegal_score
-- ----------------------------

-- ----------------------------
-- Table structure for basic_lost_found
-- ----------------------------
DROP TABLE IF EXISTS `basic_lost_found`;
CREATE TABLE `basic_lost_found`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '失物id',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公交公司id',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失物图片',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发布失物标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布失物内容',
  `is_show` int(11) NOT NULL DEFAULT 0 COMMENT '是否展示，0不展示，1展示',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '完结删除标记',
  `release_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日期',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of basic_lost_found
-- ----------------------------

-- ----------------------------
-- Table structure for basic_maintain
-- ----------------------------
DROP TABLE IF EXISTS `basic_maintain`;
CREATE TABLE `basic_maintain`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆保养',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `maintain_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保养编码',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路名称',
  `maintain_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '保养时间',
  `maintain_mileage` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '保养里程',
  `next_interval_month` smallint(6) NOT NULL DEFAULT 3 COMMENT '下一次间隔(月份）',
  `next_interval_mileage` decimal(10, 3) NOT NULL DEFAULT 5000.000 COMMENT '下一次间隔里程(公里)',
  `remind_status` int(11) NOT NULL DEFAULT 0 COMMENT '0不提醒 1提醒',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_car`(`company_id`, `car_id`) USING BTREE,
  INDEX `idx_maintain`(`company_id`, `maintain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_maintain
-- ----------------------------

-- ----------------------------
-- Table structure for basic_maintain_item
-- ----------------------------
DROP TABLE IF EXISTS `basic_maintain_item`;
CREATE TABLE `basic_maintain_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆保养',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `maintain_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保养编码',
  `maintain_item` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维护内容',
  `maintain_cost` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '维护费用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_maintain`(`company_id`, `maintain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_maintain_item
-- ----------------------------

-- ----------------------------
-- Table structure for basic_region
-- ----------------------------
DROP TABLE IF EXISTS `basic_region`;
CREATE TABLE `basic_region`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `region_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自编码',
  `region_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站台名称',
  `region_code` int(11) NULL DEFAULT NULL COMMENT '定点编号',
  `region_type` int(11) NOT NULL DEFAULT 0 COMMENT '0POI 1圆 2矩形 3多边形 4路径点',
  `region_category` smallint(6) NOT NULL DEFAULT 0 COMMENT '0常规 10行政区域 ',
  `use_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '区域用途，0默认1停车场2加油充电站3维修点',
  `center_lat` decimal(10, 6) NOT NULL COMMENT '中心点经纬度',
  `center_lng` decimal(10, 6) NOT NULL COMMENT '中心点经纬度',
  `icon` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标索引',
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `region_point` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径点 lat1,lng1|lat2,lng2',
  `region_option` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义样式，json字符串',
  `is_share` tinyint(4) NOT NULL DEFAULT 0 COMMENT '企业内共享 0私有 1公用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_region
-- ----------------------------

-- ----------------------------
-- Table structure for basic_region_rule
-- ----------------------------
DROP TABLE IF EXISTS `basic_region_rule`;
CREATE TABLE `basic_region_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '禁入，禁出等',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `rule_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rule_type` int(11) NOT NULL DEFAULT 0 COMMENT '10禁止进入 20禁止出去 30区域限速 40停车超时',
  `rule_option` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'rule_type的二级选项',
  `region_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '映射basic_region表',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_stop`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_region_rule
-- ----------------------------

-- ----------------------------
-- Table structure for basic_region_rule_car
-- ----------------------------
DROP TABLE IF EXISTS `basic_region_rule_car`;
CREATE TABLE `basic_region_rule_car`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `rule_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_stop`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_region_rule_car
-- ----------------------------

-- ----------------------------
-- Table structure for basic_route
-- ----------------------------
DROP TABLE IF EXISTS `basic_route`;
CREATE TABLE `basic_route`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路id',
  `route_code` int(11) NOT NULL COMMENT '线路编码',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路名称',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车队ID',
  `subsidiary_fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级分公司级别车队ID,映射车队表',
  `way_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点方案',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '0暂未开通 10运营 20停运',
  `category` smallint(6) NOT NULL DEFAULT 0 COMMENT '线路类别,0双向线路 1单向环线 2双向环线',
  `travel` smallint(6) NOT NULL DEFAULT 0 COMMENT '行驶类型 0全部站点 1支线 2区间 3大站',
  `ticket` smallint(6) NOT NULL DEFAULT 0 COMMENT '0无人售票 1有人售票',
  `trunk` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区间大站支线时对应主线',
  `loop_default_value` int(11) NULL DEFAULT 1 COMMENT '环线默认值1, 可选项1上行, 2下行, 3环线',
  `open_time` datetime NULL DEFAULT NULL COMMENT '线路第一次建立时间',
  `stop_time` datetime NULL DEFAULT NULL COMMENT '停运时间',
  `sort_id` int(11) NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`route_id`) USING BTREE,
  INDEX `uk_name`(`company_id`, `route_name`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_route
-- ----------------------------
INSERT INTO `basic_route` VALUES (1, '10001', 'ROU000001', 11, '1路', 'GRP000001', '', NULL, 10, 0, 0, 0, NULL, 1, '2025-05-13 08:54:06', NULL, 11, '', 'UID010001', '2025-05-13 08:54:12', '2025-05-13 08:54:12', 0);

-- ----------------------------
-- Table structure for basic_route_change
-- ----------------------------
DROP TABLE IF EXISTS `basic_route_change`;
CREATE TABLE `basic_route_change`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路名称',
  `route_code` int(11) NOT NULL COMMENT '线路编码',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '0暂未开通 10运营 20停运 100关闭',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_route_change
-- ----------------------------

-- ----------------------------
-- Table structure for basic_route_control
-- ----------------------------
DROP TABLE IF EXISTS `basic_route_control`;
CREATE TABLE `basic_route_control`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '调度台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `control_bit` int(11) NOT NULL DEFAULT 0 COMMENT '控制位 换线|切换运营|计划到车辆|计划到调度屏|下发文本',
  `is_depart_check` smallint(6) NOT NULL DEFAULT 1 COMMENT '是否发车考核',
  `depart_allow_fast` int(11) NOT NULL DEFAULT 2 COMMENT '发车允许快2分钟',
  `depart_allow_slow` int(11) NOT NULL DEFAULT 3 COMMENT '发车允许慢3分钟',
  `plan_send_early` int(11) NOT NULL DEFAULT 15 COMMENT '提前15min下发计划',
  `sign_in_change_vehicle` int(11) NOT NULL DEFAULT 0 COMMENT '签到更换司机计划到新车辆',
  `sign_in_change_driver` int(11) NOT NULL DEFAULT 0 COMMENT '签到车辆更新新司机',
  `auto_handle_request` int(11) NOT NULL DEFAULT 1 COMMENT '自动处理司机请求',
  `sign_in_advance_time` int(11) NOT NULL DEFAULT 0 COMMENT '签到提前多少分钟提醒,0不提醒',
  `plan_notice_attach` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下发计划附加信息',
  `plan_notice_text` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下发计划附加信息',
  `plan_cancel_attach` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消计划附加信息',
  `plan_cancel_text` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消计划追加文本信息',
  `check_in_text` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到追加文本',
  `check_out_text` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签退追加文本',
  `request_agree_text` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司机请求同意文本应答',
  `request_reject_text` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司机请求拒绝文本应答',
  `check_in_create_plan` int(11) NOT NULL DEFAULT 0 COMMENT '签到自动创建计划',
  `middle_station_create_plan` int(11) NOT NULL DEFAULT 0 COMMENT '中间站点允许补传自动创建计划',
  `min_stop_minute` int(11) NULL DEFAULT 1 COMMENT '终点最小停留时长',
  `min_departure_long` int(11) NULL DEFAULT 10 COMMENT '最小发车时长',
  `max_departure_long` int(11) NULL DEFAULT 20 COMMENT '最大发车时长',
  `nearby_field` decimal(11, 1) NULL DEFAULT 0.5 COMMENT '场站附近范围',
  `auto_agree_request` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自动同意参数',
  `station_completion_rate` int(11) NULL DEFAULT 0 COMMENT '站点完成率0-100， 默认0不考核',
  `apply_time_max_delay_minutes` int(11) NOT NULL DEFAULT 5 COMMENT '派班允许查找超时多少分钟的计划，默认最大允许超时5分钟',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `allow_move_serial` smallint(11) NOT NULL DEFAULT 0 COMMENT '取消整班计划时，是否允许移动班次',
  `station_text` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Stop' COMMENT '站点文本',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`route_id`) USING BTREE,
  INDEX `idx_service`(`company_id`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_route_control
-- ----------------------------

-- ----------------------------
-- Table structure for basic_route_direction
-- ----------------------------
DROP TABLE IF EXISTS `basic_route_direction`;
CREATE TABLE `basic_route_direction`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '线路行驶方向',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `way_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路站点方案',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路id',
  `direction` smallint(6) NOT NULL COMMENT '方向 1上行 2下行',
  `origin` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主站,站点导入时同步',
  `terminal` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '副站',
  `distance` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '全长km',
  `first_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '首班发车时间',
  `last_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '末班发车时间',
  `intervals` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发车间隔',
  `price` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '价格区间',
  `sort_id` int(11) NULL DEFAULT NULL,
  `path` varchar(18000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径点 lat1,lng1|lat2,lng2',
  `style` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义样式',
  `non_linear` decimal(11, 3) NULL DEFAULT NULL COMMENT '非直线系数',
  `avg_station_km` decimal(11, 3) NULL DEFAULT NULL COMMENT '平均站距',
  `station_count` int(11) NULL DEFAULT NULL COMMENT '站点数量',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_direction`(`company_id`, `way_id`, `route_id`, `direction`, `is_deleted`) USING BTREE,
  INDEX `idx_way`(`way_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_route_direction
-- ----------------------------

-- ----------------------------
-- Table structure for basic_route_station
-- ----------------------------
DROP TABLE IF EXISTS `basic_route_station`;
CREATE TABLE `basic_route_station`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站点',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `way_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路站点方案',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路自编码',
  `route_code` int(11) NOT NULL COMMENT '线路id',
  `direction` smallint(6) NOT NULL COMMENT '方向',
  `serial` smallint(6) UNSIGNED NOT NULL COMMENT '站序，不能为负数',
  `station_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点名称',
  `abridge` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩写',
  `flag` smallint(6) NOT NULL DEFAULT 0 COMMENT '0中间站 1起点 255终点',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `azimuth` smallint(6) NULL DEFAULT NULL COMMENT '方位角',
  `distance` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '距离起点的距离km',
  `distance_previous` decimal(11, 3) NULL DEFAULT NULL COMMENT '与前一站的距离',
  `duration` int(11) NULL DEFAULT 0 COMMENT '距离起点的时间,秒',
  `parking` int(11) NULL DEFAULT 0 COMMENT '停车时长',
  `stop_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应站台id',
  `identifier` bigint(20) NULL DEFAULT NULL COMMENT '标识符,创建的时间戳,废弃',
  `is_opposite` smallint(6) NULL DEFAULT 0 COMMENT '单向环线标识为对边显示的站点',
  `previous_station_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前一站点名称',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_station`(`way_id`, `route_id`, `direction`, `serial`, `is_deleted`) USING BTREE,
  INDEX `idx_way`(`company_id`, `way_id`) USING BTREE,
  INDEX `idx_stop_id`(`company_id`, `stop_id`) USING BTREE,
  INDEX `idx_route_direction`(`company_id`, `route_id`, `direction`, `way_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_route_station
-- ----------------------------

-- ----------------------------
-- Table structure for basic_route_way
-- ----------------------------
DROP TABLE IF EXISTS `basic_route_way`;
CREATE TABLE `basic_route_way`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '线路行驶方向',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路id',
  `route_code` int(11) NULL DEFAULT NULL COMMENT '线路编码',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `way_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路方案ID',
  `way_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主站,站点导入时同步',
  `category` smallint(6) NOT NULL DEFAULT 0 COMMENT '线路类别,0双向线路 1单向环线 2双向环线',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `check_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `active_time` datetime NULL DEFAULT NULL COMMENT '生效日期',
  `is_checked` int(11) NOT NULL DEFAULT 0 COMMENT '审核',
  `is_actived` int(11) NOT NULL DEFAULT 0 COMMENT '当前在用的',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_way_id`(`way_id`) USING BTREE,
  INDEX `idx_route_id`(`company_id`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_route_way
-- ----------------------------

-- ----------------------------
-- Table structure for basic_safety_score
-- ----------------------------
DROP TABLE IF EXISTS `basic_safety_score`;
CREATE TABLE `basic_safety_score`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主动安全报警',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `alarm_type` int(11) NOT NULL DEFAULT 0 COMMENT '报警/事件类型',
  `reduce_score1` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '一次违规扣分多少',
  `reduce_score2` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '一次违规扣分多少',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_company_id`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主动安全报警扣分标准' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of basic_safety_score
-- ----------------------------

-- ----------------------------
-- Table structure for basic_sim
-- ----------------------------
DROP TABLE IF EXISTS `basic_sim`;
CREATE TABLE `basic_sim`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业',
  `sim_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT 'Sim卡唯一编码',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sim卡手机号码',
  `iccid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'iccid',
  `register_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `installed_imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安装设备id',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_phone`(`phone`) USING BTREE,
  UNIQUE INDEX `uk_iccid`(`iccid`) USING BTREE,
  UNIQUE INDEX `uk_sim`(`sim_id`) USING BTREE,
  INDEX `idx_sim`(`company_id`, `sim_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_sim
-- ----------------------------

-- ----------------------------
-- Table structure for basic_subscribe_car
-- ----------------------------
DROP TABLE IF EXISTS `basic_subscribe_car`;
CREATE TABLE `basic_subscribe_car`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subscribe_topic` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ADAS DSM等',
  `subscribe_type` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '具体的报警ID',
  `subscribe_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_stop`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of basic_subscribe_car
-- ----------------------------

-- ----------------------------
-- Table structure for basic_subscribe_topic
-- ----------------------------
DROP TABLE IF EXISTS `basic_subscribe_topic`;
CREATE TABLE `basic_subscribe_topic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '禁入，禁出等',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `subscribe_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订阅自编码',
  `subscribe_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订阅名称',
  `subscribe_topic` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DSM' COMMENT '订阅主题 ADAS DSM等',
  `subscribe_type` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '主题对应的KEY集合，如主动安全的类型',
  `subscribe_lang` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'en' COMMENT '多语言 en zh th',
  `subscribe_emails` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'JSON格式订阅邮箱数组，最多10个',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_stop`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of basic_subscribe_topic
-- ----------------------------

-- ----------------------------
-- Table structure for config_common_template
-- ----------------------------
DROP TABLE IF EXISTS `config_common_template`;
CREATE TABLE `config_common_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `template_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板ID',
  `template_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `server_info` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Json服务器信息',
  `maintenance_manage` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Json维护管理',
  `alarm_enable` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Json告警使能',
  `encode_param` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Json编码参数',
  `common_config` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Json通用配置',
  `driver_config` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Json司机配置',
  `screen_display` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JsonOSD参数设置',
  `system_config` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Json系统设置',
  `is_deleted` int(11) NULL DEFAULT 0,
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端升级通用模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_common_template
-- ----------------------------

-- ----------------------------
-- Table structure for config_field_station
-- ----------------------------
DROP TABLE IF EXISTS `config_field_station`;
CREATE TABLE `config_field_station`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `region_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域ID',
  `region_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  `region_type` int(6) NULL DEFAULT NULL COMMENT '区域类型',
  `region_point` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径点',
  `is_deleted` int(11) NULL DEFAULT 0,
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端升级的站场配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_field_station
-- ----------------------------

-- ----------------------------
-- Table structure for config_remote_upgrade
-- ----------------------------
DROP TABLE IF EXISTS `config_remote_upgrade`;
CREATE TABLE `config_remote_upgrade`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `upgrade_content` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布内容',
  `common_upgrade` smallint(6) NULL DEFAULT NULL COMMENT '升级通用配置   0 升级， 1 不升级',
  `event_upgrade` smallint(6) NULL DEFAULT NULL COMMENT '升级司机命令   0 升级， 1 不升级',
  `field_upgrade` smallint(6) NULL DEFAULT NULL COMMENT '升级车场配置   0 升级， 1 不升级',
  `file_path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本',
  `is_deleted` int(11) NULL DEFAULT 0,
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端升级包发布记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_remote_upgrade
-- ----------------------------

-- ----------------------------
-- Table structure for config_voice_basic
-- ----------------------------
DROP TABLE IF EXISTS `config_voice_basic`;
CREATE TABLE `config_voice_basic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `voice_type` int(11) NULL DEFAULT NULL COMMENT '类型',
  `voice_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `use_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用途',
  `use_type` int(11) NULL DEFAULT NULL COMMENT '用途类型',
  `usefulness` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用途说明',
  `is_deleted` int(11) NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端升级公共、站点基础配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_voice_basic
-- ----------------------------

-- ----------------------------
-- Table structure for config_voice_library
-- ----------------------------
DROP TABLE IF EXISTS `config_voice_library`;
CREATE TABLE `config_voice_library`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `voice_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语音文件ID',
  `voice_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语音文件名称',
  `voice_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '语音类型 1公共语音 2站点语音 3线路语音',
  `language_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '语言类型 1普通话 2英语 3方言',
  `voice_format` smallint(6) NOT NULL DEFAULT 0 COMMENT '音频格式 先默认0，0:wav, 1:avi',
  `relative_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/files/config/$cid/voice/' COMMENT '文件路径',
  `file_size` int(11) NULL DEFAULT NULL COMMENT '文件大小',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记,删除改ID',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_firmware`(`voice_id`) USING BTREE,
  INDEX `uk_cid_firmware`(`company_id`, `voice_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端升级用的语音库' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_voice_library
-- ----------------------------

-- ----------------------------
-- Table structure for config_voice_line
-- ----------------------------
DROP TABLE IF EXISTS `config_voice_line`;
CREATE TABLE `config_voice_line`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `route_code` int(11) NULL DEFAULT NULL COMMENT '线路代码',
  `route_state` int(11) NULL DEFAULT NULL COMMENT '线路状态',
  `announce_way` int(11) NULL DEFAULT NULL COMMENT '报站方式',
  `full_limit` int(11) NULL DEFAULT NULL COMMENT '全程限速',
  `up_limit` int(11) NULL DEFAULT NULL COMMENT '上行限速',
  `down_limit` int(11) NULL DEFAULT NULL COMMENT '下行限速',
  `non_limit` int(11) NULL DEFAULT NULL COMMENT '非运营限速',
  `mandarin` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '普通话',
  `mandarin_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '普通话名称',
  `mandarin_path` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `english` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英语',
  `english_path` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `english_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英语名称',
  `dialect` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方言',
  `dialect_name` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方言名称',
  `dialect_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `is_deleted` int(11) NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ix_line_voice`(`company_id`, `route_id`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端升级的线路配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_voice_line
-- ----------------------------

-- ----------------------------
-- Table structure for config_voice_public
-- ----------------------------
DROP TABLE IF EXISTS `config_voice_public`;
CREATE TABLE `config_voice_public`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `voice_type` int(11) NOT NULL COMMENT '语音类型 0 进站 1 出站 2 起点 3 终站 4服务用语 5 提示语音',
  `use_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用途',
  `use_type` int(11) NULL DEFAULT NULL COMMENT '用途类型',
  `usefulness` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用途说明',
  `mandarin` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '普通话',
  `mandarin_path` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `mandarin_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `english` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英语',
  `english_path` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `english_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `dialect` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方言',
  `dialect_path` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `dialect_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `is_deleted` int(11) NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ix_public_voice`(`company_id`, `route_id`, `voice_type`, `usefulness`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端升级的公共配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_voice_public
-- ----------------------------

-- ----------------------------
-- Table structure for config_voice_station
-- ----------------------------
DROP TABLE IF EXISTS `config_voice_station`;
CREATE TABLE `config_voice_station`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `stop_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站台编号',
  `station_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点序号',
  `serial` int(11) NULL DEFAULT NULL COMMENT '站点编号',
  `station_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点名称',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `angle` int(11) NULL DEFAULT NULL COMMENT '方位角',
  `radius` int(11) NULL DEFAULT NULL COMMENT '半径',
  `limit_speed` int(11) NULL DEFAULT NULL COMMENT '限速',
  `is_big` bit(1) NULL DEFAULT b'0' COMMENT '大站',
  `direction` int(11) NULL DEFAULT NULL COMMENT '方向',
  `mandarin` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '普通话',
  `mandarin_path` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `mandarin_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `english` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英语',
  `english_path` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `english_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `dialect` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方言',
  `dialect_path` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `dialect_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `advert_one` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展用语1',
  `advert_one_path` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `advert_one_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展用语1',
  `advert_two` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展用语2',
  `advert_two_path` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `advert_two_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展用语2',
  `advert_three` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展用语3',
  `advert_three_path` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `advert_three_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展用语3',
  `advert_en_one` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展用语英语1',
  `advert_en_two` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展用语英语2',
  `advert_en_three` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展用语英语3',
  `is_deleted` int(11) NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `way_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leave_station` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enter_station` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_station_voice`(`company_id`, `route_id`, `station_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端升级的站点配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_voice_station
-- ----------------------------

-- ----------------------------
-- Table structure for device_alarm
-- ----------------------------
DROP TABLE IF EXISTS `device_alarm`;
CREATE TABLE `device_alarm`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备编号',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `alarm_id` int(11) NULL DEFAULT 0 COMMENT '删除，采用下面字段',
  `device_alarm_id` int(11) NULL DEFAULT NULL,
  `platform_alarm_id` int(11) NULL DEFAULT NULL COMMENT '对应平台报警ID',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度，一般指北纬',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度，一般指东经',
  `speed` int(11) NULL DEFAULT 0 COMMENT '速度，1/10km',
  `angle` int(11) NULL DEFAULT 0 COMMENT '方向角，0是正北，360度',
  `height` int(11) NULL DEFAULT 0 COMMENT '海拔',
  `state` int(11) NULL DEFAULT 0 COMMENT '状态',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `is_readed` int(11) NULL DEFAULT 0 COMMENT '读取状态，0未读',
  `operator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '已读备注',
  `route_code` int(11) NULL DEFAULT NULL COMMENT '线路编号',
  `direction` smallint(6) NULL DEFAULT NULL COMMENT '方向',
  `serial` smallint(6) NULL DEFAULT NULL COMMENT '站序',
  `attached` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加JSON',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `event_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `event_time`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `event_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (TO_DAYS(event_time))
PARTITIONS 38
(PARTITION `p_202108` VALUES LESS THAN (738399) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202109` VALUES LESS THAN (738429) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202205` VALUES LESS THAN (738672) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202206` VALUES LESS THAN (738702) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202207` VALUES LESS THAN (738733) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202208` VALUES LESS THAN (738764) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202209` VALUES LESS THAN (738794) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202210` VALUES LESS THAN (738825) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202211` VALUES LESS THAN (738855) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202212` VALUES LESS THAN (738886) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202301` VALUES LESS THAN (738917) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202302` VALUES LESS THAN (738945) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202303` VALUES LESS THAN (738976) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202304` VALUES LESS THAN (739006) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202305` VALUES LESS THAN (739037) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202306` VALUES LESS THAN (739067) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202307` VALUES LESS THAN (739098) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202308` VALUES LESS THAN (739129) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202310` VALUES LESS THAN (739190) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202312` VALUES LESS THAN (739251) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202401` VALUES LESS THAN (739282) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202402` VALUES LESS THAN (739311) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202403` VALUES LESS THAN (739342) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202404` VALUES LESS THAN (739372) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202405` VALUES LESS THAN (739403) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202406` VALUES LESS THAN (739433) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202407` VALUES LESS THAN (739464) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202408` VALUES LESS THAN (739495) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202409` VALUES LESS THAN (739525) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202410` VALUES LESS THAN (739556) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202411` VALUES LESS THAN (739586) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202412` VALUES LESS THAN (739617) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202501` VALUES LESS THAN (739648) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202502` VALUES LESS THAN (739676) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202503` VALUES LESS THAN (739707) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202504` VALUES LESS THAN (739737) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202505` VALUES LESS THAN (739768) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202506` VALUES LESS THAN (739798) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of device_alarm
-- ----------------------------

-- ----------------------------
-- Table structure for device_alarm_file
-- ----------------------------
DROP TABLE IF EXISTS `device_alarm_file`;
CREATE TABLE `device_alarm_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备最新版本信息',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备id',
  `file_server` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'file-server' COMMENT '文件服务器',
  `alarm_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台给报警分配的唯一编号',
  `relative_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件路径',
  `file_size` int(11) NOT NULL COMMENT '文件大小',
  `file_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '文件类型0图片1音频2视频3文本4其他',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务器时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_alarm_key`(`company_id`, `alarm_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_alarm_file
-- ----------------------------

-- ----------------------------
-- Table structure for device_alarm_safety
-- ----------------------------
DROP TABLE IF EXISTS `device_alarm_safety`;
CREATE TABLE `device_alarm_safety`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主动安全报警',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备编号',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营线路员工ID',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营线路员工名称',
  `alarm_id` int(11) NOT NULL DEFAULT 0 COMMENT '报警自增ID',
  `device_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外设类型',
  `flag_status` smallint(6) NOT NULL DEFAULT 0 COMMENT '标志状态',
  `alarm_type` int(11) NOT NULL DEFAULT 0 COMMENT '报警/事件类型',
  `alarm_level` smallint(6) NOT NULL DEFAULT 0 COMMENT '报警级别',
  `alarm_info` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警详情',
  `alarm_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警唯一编号',
  `speed` int(11) NULL DEFAULT 0 COMMENT '速度，km/h',
  `height` int(11) NULL DEFAULT 0 COMMENT '海拔米',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度，一般指东经',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `event_time` datetime NULL DEFAULT NULL COMMENT '事件时间',
  `vehicle_state` int(11) NULL DEFAULT 0 COMMENT '车辆状态',
  `terminal_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终端 ID',
  `mark_time` datetime NULL DEFAULT NULL COMMENT '标识内部时间',
  `serial_number` int(11) NULL DEFAULT 0 COMMENT '同一时间报警序号',
  `attached_count` smallint(6) NULL DEFAULT 0 COMMENT '附件数量',
  `read_status` int(11) NOT NULL DEFAULT 0 COMMENT '读取状态，0未读 1自动  100人为',
  `update_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `update_account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理内容',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业对应时区的日期字符串',
  `time_zone` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应时区',
  `period_time` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '落在的分时段区间 例如：08:00 ~ 08:30',
  `reduce_score` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '一次违规扣分多少',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `event_time`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `event_time`) USING BTREE,
  INDEX `idx_work_date`(`company_id`, `work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_alarm_safety
-- ----------------------------

-- ----------------------------
-- Table structure for device_card
-- ----------------------------
DROP TABLE IF EXISTS `device_card`;
CREATE TABLE `device_card`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '终端唯一码',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `card_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡号',
  `card_info` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '刷卡数据',
  `check_in` smallint(6) NULL DEFAULT NULL COMMENT '0签退 1签到',
  `is_valid` smallint(6) NULL DEFAULT NULL COMMENT '0非法 1合法',
  `last_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓',
  `first_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名',
  `mister` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尊称',
  `country` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家代码',
  `personal` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `expire` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效期',
  `birthday` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `card_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡类型',
  `sex` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `place_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域代码',
  `lng` decimal(11, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(11, 6) NULL DEFAULT NULL COMMENT '纬度',
  `mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '累计里程 km',
  `receive_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '接收时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_card_time`(`company_id`, `car_id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `event_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_card
-- ----------------------------

-- ----------------------------
-- Table structure for device_cmd_request
-- ----------------------------
DROP TABLE IF EXISTS `device_cmd_request`;
CREATE TABLE `device_cmd_request`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '终端唯一码',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `route_code` int(11) NOT NULL COMMENT '线路编号',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_code` int(11) NOT NULL DEFAULT 0 COMMENT '终端司机请求命令ID',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_card`(`imei`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_cmd_request
-- ----------------------------

-- ----------------------------
-- Table structure for device_connect
-- ----------------------------
DROP TABLE IF EXISTS `device_connect`;
CREATE TABLE `device_connect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备最新版本信息',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备id',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `connect_flag` int(11) NOT NULL DEFAULT 0 COMMENT '0断开连接 1建立连接 ',
  `connect_time` datetime NOT NULL COMMENT '连接时间',
  `disconnect_time` datetime NULL DEFAULT NULL COMMENT '断开时间',
  `connect_duration` int(11) NULL DEFAULT NULL COMMENT '持续时长秒',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务器时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `connect_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `connect_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `connect_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_connect
-- ----------------------------

-- ----------------------------
-- Table structure for device_depart_arrive
-- ----------------------------
DROP TABLE IF EXISTS `device_depart_arrive`;
CREATE TABLE `device_depart_arrive`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '终端唯一码',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `flag` smallint(6) NOT NULL DEFAULT 10 COMMENT '1到站 2离站',
  `route_code` int(11) NOT NULL DEFAULT 0 COMMENT '运行线路编号',
  `direction` smallint(6) NOT NULL DEFAULT 0 COMMENT '方向 1下行 2上行',
  `serial` smallint(6) NOT NULL COMMENT '车站序号 上下行从1开始',
  `station_id` bigint(20) NULL DEFAULT NULL COMMENT '对应站点表的唯一ID',
  `station_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `station_flag` smallint(6) NULL DEFAULT 0 COMMENT '0中间站 1起点 255终点',
  `stop_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站台编码',
  `stop_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点编号',
  `state` int(11) NULL DEFAULT NULL COMMENT '标志字段',
  `lat` decimal(11, 6) NULL DEFAULT NULL COMMENT '纬度',
  `lng` decimal(11, 6) NULL DEFAULT NULL COMMENT '经度',
  `height` smallint(6) NULL DEFAULT NULL COMMENT '高度',
  `speed` smallint(6) NULL DEFAULT NULL COMMENT '速度',
  `azimuth` smallint(6) NULL DEFAULT NULL COMMENT '方位角',
  `mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '里程 km',
  `passenger` smallint(11) NULL DEFAULT NULL COMMENT '车厢内人数',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `receive_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '接收时间',
  `way_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点方案ID',
  `depart_time` datetime NULL DEFAULT NULL COMMENT '起点出发时间',
  `expected_duration` int(11) NULL DEFAULT NULL COMMENT '预期从起点耗时,秒',
  `actual_duration` int(11) NULL DEFAULT NULL COMMENT '实际从起点耗时,秒',
  `expected_mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '预期里程',
  `actual_mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '实际里程',
  `attached` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加数据',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `event_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `event_time`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_code`, `event_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (TO_DAYS(event_time))
PARTITIONS 43
(PARTITION `p_201912` VALUES LESS THAN (737790) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202001` VALUES LESS THAN (737821) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202002` VALUES LESS THAN (737850) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202003` VALUES LESS THAN (737881) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202004` VALUES LESS THAN (737911) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202005` VALUES LESS THAN (737942) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202006` VALUES LESS THAN (737972) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202007` VALUES LESS THAN (738003) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202008` VALUES LESS THAN (738034) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202009` VALUES LESS THAN (738064) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202010` VALUES LESS THAN (738095) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202011` VALUES LESS THAN (738125) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202012` VALUES LESS THAN (738156) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202101` VALUES LESS THAN (738187) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202102` VALUES LESS THAN (738215) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202103` VALUES LESS THAN (738246) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202104` VALUES LESS THAN (738276) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202105` VALUES LESS THAN (738307) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202106` VALUES LESS THAN (738337) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202107` VALUES LESS THAN (738368) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202308` VALUES LESS THAN (739129) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202309` VALUES LESS THAN (739159) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202310` VALUES LESS THAN (739190) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202311` VALUES LESS THAN (739220) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202312` VALUES LESS THAN (739251) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202401` VALUES LESS THAN (739282) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202402` VALUES LESS THAN (739311) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202403` VALUES LESS THAN (739342) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202404` VALUES LESS THAN (739372) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202405` VALUES LESS THAN (739403) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202406` VALUES LESS THAN (739433) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202407` VALUES LESS THAN (739464) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202408` VALUES LESS THAN (739495) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202409` VALUES LESS THAN (739525) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202410` VALUES LESS THAN (739556) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202411` VALUES LESS THAN (739586) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202412` VALUES LESS THAN (739617) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202501` VALUES LESS THAN (739648) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202502` VALUES LESS THAN (739676) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202503` VALUES LESS THAN (739707) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202504` VALUES LESS THAN (739737) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202505` VALUES LESS THAN (739768) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202506` VALUES LESS THAN (739798) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of device_depart_arrive
-- ----------------------------

-- ----------------------------
-- Table structure for device_display
-- ----------------------------
DROP TABLE IF EXISTS `device_display`;
CREATE TABLE `device_display`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `display_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '终端唯一码',
  `warning` int(11) NULL DEFAULT NULL COMMENT '报警',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `origin` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APP或WEB',
  `response_data` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应答数据',
  `display_time` datetime NULL DEFAULT NULL,
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`, `event_time`) USING BTREE,
  INDEX `ix_imei_time`(`display_id`, `event_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_display
-- ----------------------------

-- ----------------------------
-- Table structure for device_file_upload
-- ----------------------------
DROP TABLE IF EXISTS `device_file_upload`;
CREATE TABLE `device_file_upload`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件上传id',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备号',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `chn` int(11) NOT NULL COMMENT '通道',
  `start_time` datetime NOT NULL COMMENT '文件开始时间',
  `end_time` datetime NOT NULL COMMENT '文件结束时间',
  `warning` int(11) NULL DEFAULT NULL COMMENT '报警状态',
  `file_type` int(11) NOT NULL DEFAULT 0 COMMENT '0音视频 1音频 2视频 3视频或音频',
  `stream_type` int(11) NOT NULL DEFAULT 0 COMMENT '0主或次码流 1主码流 2次码流',
  `storage_type` int(11) NOT NULL DEFAULT 0 COMMENT '1主存储器 2灾备存储',
  `wlan` smallint(6) NULL DEFAULT 0 COMMENT '下载条件',
  `size` int(11) NULL DEFAULT 0 COMMENT '文件大小',
  `upload_state` smallint(6) NOT NULL DEFAULT 0 COMMENT '-1 取消 0等待执行 1下载中 2完成 3失败',
  `request_origin` int(11) NOT NULL DEFAULT 0 COMMENT '数据来源 0平台指令 1SOS',
  `request_state` smallint(6) NOT NULL DEFAULT 0 COMMENT '0执行中 1暂停 2继续 3取消',
  `relative_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `upload_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `serial` int(11) NULL DEFAULT 0 COMMENT '应答流水号',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求用户',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_file_upload`(`company_id`, `start_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_file_upload
-- ----------------------------

-- ----------------------------
-- Table structure for device_illegal
-- ----------------------------
DROP TABLE IF EXISTS `device_illegal`;
CREATE TABLE `device_illegal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备违规报警',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应时区的日期字符串',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备id',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `route_code` int(11) NULL DEFAULT NULL COMMENT '线路编码',
  `illegal_flag` int(11) NOT NULL DEFAULT 0 COMMENT '预留，0开始 1结束',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶员id',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶员姓名',
  `illegal_type` int(11) NULL DEFAULT 0 COMMENT '违规类型',
  `illegal_value` int(11) NULL DEFAULT NULL,
  `standard_value` int(11) NULL DEFAULT NULL,
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度，一般指北纬',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度，一般指东经',
  `speed` int(11) NULL DEFAULT 0 COMMENT '速度，1/10km',
  `azimuth` int(11) NULL DEFAULT 0 COMMENT '方向角，0是正北，360度',
  `height` int(11) NULL DEFAULT 0 COMMENT '海拔',
  `make_up` int(11) NULL DEFAULT 0 COMMENT '状态',
  `event_time` datetime NULL DEFAULT NULL COMMENT '事件时间',
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `station_id` int(11) NULL DEFAULT NULL COMMENT '站点表ID',
  `station_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `reduce_score` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '违规扣分',
  `time_zone` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应时区',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务器时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `event_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `event_time`) USING BTREE,
  INDEX `device_illegal_company_id_IDX`(`company_id`, `work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of device_illegal
-- ----------------------------

-- ----------------------------
-- Table structure for device_over_speed
-- ----------------------------
DROP TABLE IF EXISTS `device_over_speed`;
CREATE TABLE `device_over_speed`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '持续超速-自增长id',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备编号',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `over_type` int(11) NOT NULL DEFAULT 0 COMMENT '0开始超速 1结束超速',
  `start_state` int(11) NULL DEFAULT NULL COMMENT '开始超速的状态',
  `start_time` datetime NULL DEFAULT NULL COMMENT '起点时间',
  `start_station_id` int(11) NULL DEFAULT NULL COMMENT '开始超速的站点ID',
  `start_station_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始超速的站点名称',
  `start_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '起点纬度，一般指北纬',
  `start_lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '起点经度，一般指东经',
  `start_mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '开始里程',
  `end_state` int(11) NULL DEFAULT NULL COMMENT '结束超速的状态',
  `end_time` datetime NULL DEFAULT NULL COMMENT '终点时间',
  `end_station_id` int(11) NULL DEFAULT NULL COMMENT '结束超速的站点ID',
  `end_station_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束超速的站点名称',
  `end_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '终点纬度，一般指北纬',
  `end_lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '终点经度，一般指东经',
  `end_mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '结束里程',
  `limit_speed` int(11) NULL DEFAULT 0 COMMENT '限速值 km/h',
  `max_speed` int(11) NULL DEFAULT 0 COMMENT '最大速度，km/h',
  `avg_speed` int(11) NULL DEFAULT 0 COMMENT '平均速度，km/h',
  `duration` int(11) NULL DEFAULT 0 COMMENT '超速持续时长，单位秒',
  `mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '里程 km',
  `remark` varchar(64) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `run_route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `run_route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`company_id`, `start_time`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `start_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `start_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_over_speed
-- ----------------------------

-- ----------------------------
-- Table structure for device_passenger
-- ----------------------------
DROP TABLE IF EXISTS `device_passenger`;
CREATE TABLE `device_passenger`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备最新版本信息',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备id',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `up_number` int(11) NOT NULL DEFAULT 0 COMMENT '上车人数',
  `down_number` int(11) NOT NULL DEFAULT 0 COMMENT '下车人数',
  `in_car_number` int(11) NOT NULL DEFAULT 0 COMMENT '车厢内人数',
  `approved_number` int(11) NULL DEFAULT 0 COMMENT '核载人数',
  `full_load_rate` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '满载率',
  `total_today` int(11) NULL DEFAULT 0 COMMENT '当天累计上车',
  `upload_time` datetime NOT NULL COMMENT '上报时间',
  `lng` decimal(11, 6) NULL DEFAULT NULL COMMENT '缓存中的最近经度',
  `lat` decimal(11, 6) NULL DEFAULT NULL COMMENT '缓存中的最近纬度',
  `gps_time` datetime NULL DEFAULT NULL COMMENT '事件时间',
  `route_code` int(11) NULL DEFAULT 0 COMMENT '运行线路编号',
  `direction` smallint(6) NULL DEFAULT NULL COMMENT '方向',
  `serial` smallint(6) NULL DEFAULT NULL COMMENT '车站序号 上下行从1开始',
  `station_id` int(11) NULL DEFAULT NULL COMMENT '站点表唯一ID',
  `station_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `station_flag` int(11) NULL DEFAULT 0 COMMENT '0中间站 1起点 255终点',
  `stop_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站台ID',
  `stop_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点编号',
  `way_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路方案',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务器时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_code`, `upload_time`) USING BTREE,
  INDEX `idx_stop_time`(`company_id`, `stop_id`, `upload_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `upload_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_passenger
-- ----------------------------

-- ----------------------------
-- Table structure for device_poi
-- ----------------------------
DROP TABLE IF EXISTS `device_poi`;
CREATE TABLE `device_poi`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '终端唯一码',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `stop_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站台ID',
  `stop_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站台名称',
  `flag` smallint(6) NOT NULL DEFAULT 0 COMMENT '1到站 2离站',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路名称',
  `station_id` bigint(20) NULL DEFAULT NULL COMMENT '对应站点表的唯一ID',
  `station_flag` smallint(6) NOT NULL DEFAULT 0 COMMENT '0中间站 1起点 255终点',
  `lat` decimal(11, 6) NULL DEFAULT NULL COMMENT '纬度',
  `lng` decimal(11, 6) NULL DEFAULT NULL COMMENT '经度',
  `mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '里程 km',
  `up_number` int(11) NULL DEFAULT 0 COMMENT '上车人数',
  `down_number` int(11) NULL DEFAULT 0 COMMENT '下车人数',
  `passenger` int(11) NULL DEFAULT 0 COMMENT '车厢内人数',
  `passenger1` int(11) NULL DEFAULT 0 COMMENT '画面1客流',
  `passenger2` int(11) NULL DEFAULT 0 COMMENT '画面2客流',
  `passenger3` int(11) NULL DEFAULT 0 COMMENT '画面3客流',
  `operating_status` smallint(6) NULL DEFAULT 0 COMMENT '操作员审核状态0未审核 1审核',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `change_type` smallint(6) NULL DEFAULT 0 COMMENT '10起点 20进站  30行驶 40静止 100站序变化 ',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `event_time`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `event_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_poi
-- ----------------------------

-- ----------------------------
-- Table structure for device_position
-- ----------------------------
DROP TABLE IF EXISTS `device_position`;
CREATE TABLE `device_position`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '终端唯一码',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `lng` decimal(11, 6) NOT NULL COMMENT '经度',
  `lat` decimal(11, 6) NOT NULL COMMENT '纬度',
  `height` smallint(6) NULL DEFAULT NULL COMMENT '高度',
  `speed` smallint(6) NULL DEFAULT NULL COMMENT '速度',
  `azimuth` smallint(6) NULL DEFAULT NULL COMMENT '方位角',
  `warning` int(11) NULL DEFAULT NULL COMMENT '报警状态',
  `state` int(11) NULL DEFAULT NULL COMMENT '车辆状态',
  `mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '里程 km',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `receive_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '接收时间',
  `route_code` int(11) NULL DEFAULT NULL COMMENT '线路编号',
  `direction` smallint(6) NULL DEFAULT NULL COMMENT '方向',
  `serial` smallint(6) NULL DEFAULT NULL COMMENT '站序',
  `next_distance` double(11, 3) NULL DEFAULT NULL COMMENT '下一站距离',
  `station_id` int(11) NULL DEFAULT NULL COMMENT '站点表唯一ID',
  `attached` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加数据',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `event_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `event_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (TO_DAYS(event_time))
PARTITIONS 43
(PARTITION `p_201912` VALUES LESS THAN (737790) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202001` VALUES LESS THAN (737821) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202002` VALUES LESS THAN (737850) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202003` VALUES LESS THAN (737881) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202004` VALUES LESS THAN (737911) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202005` VALUES LESS THAN (737942) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202006` VALUES LESS THAN (737972) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202007` VALUES LESS THAN (738003) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202008` VALUES LESS THAN (738034) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202009` VALUES LESS THAN (738064) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202010` VALUES LESS THAN (738095) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202011` VALUES LESS THAN (738125) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202012` VALUES LESS THAN (738156) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202101` VALUES LESS THAN (738187) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202102` VALUES LESS THAN (738215) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202103` VALUES LESS THAN (738246) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202104` VALUES LESS THAN (738276) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202105` VALUES LESS THAN (738307) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202106` VALUES LESS THAN (738337) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202107` VALUES LESS THAN (738368) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202308` VALUES LESS THAN (739129) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202309` VALUES LESS THAN (739159) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202310` VALUES LESS THAN (739190) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202311` VALUES LESS THAN (739220) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202312` VALUES LESS THAN (739251) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202401` VALUES LESS THAN (739282) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202402` VALUES LESS THAN (739311) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202403` VALUES LESS THAN (739342) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202404` VALUES LESS THAN (739372) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202405` VALUES LESS THAN (739403) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202406` VALUES LESS THAN (739433) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202407` VALUES LESS THAN (739464) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202408` VALUES LESS THAN (739495) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202409` VALUES LESS THAN (739525) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202410` VALUES LESS THAN (739556) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202411` VALUES LESS THAN (739586) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202412` VALUES LESS THAN (739617) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202501` VALUES LESS THAN (739648) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202502` VALUES LESS THAN (739676) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202503` VALUES LESS THAN (739707) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202504` VALUES LESS THAN (739737) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202505` VALUES LESS THAN (739768) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202506` VALUES LESS THAN (739798) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of device_position
-- ----------------------------

-- ----------------------------
-- Table structure for device_region
-- ----------------------------
DROP TABLE IF EXISTS `device_region`;
CREATE TABLE `device_region`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '终端唯一码',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `route_code` int(11) NULL DEFAULT NULL COMMENT '线路编号',
  `event_type` int(11) NULL DEFAULT NULL COMMENT '1:进；2:出',
  `business_type` int(11) NULL DEFAULT NULL COMMENT '业务类型 见表13',
  `region_code` int(11) NULL DEFAULT NULL COMMENT '定点编号',
  `region_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自编码',
  `region_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站台名称',
  `flag_field` int(11) NULL DEFAULT NULL COMMENT '表23 标志字段定义 ',
  `lng` decimal(11, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(11, 6) NULL DEFAULT NULL COMMENT '纬度',
  `height` smallint(6) NULL DEFAULT NULL COMMENT '高度',
  `speed` smallint(6) NULL DEFAULT NULL COMMENT '速度',
  `azimuth` smallint(6) NULL DEFAULT NULL COMMENT '方位角',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `use_type` smallint(6) NULL DEFAULT 0 COMMENT '区域用途，0默认1停车场2加油充电站3维修点',
  `mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '里程 km',
  `receive_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '接收时间',
  `attached` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加数据',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`company_id`, `event_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `event_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of device_region
-- ----------------------------

-- ----------------------------
-- Table structure for device_seat
-- ----------------------------
DROP TABLE IF EXISTS `device_seat`;
CREATE TABLE `device_seat`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主动安全报警',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备编号',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `lng` decimal(11, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(11, 6) NULL DEFAULT NULL COMMENT '纬度',
  `seat_id` int(11) NULL DEFAULT NULL COMMENT '安全带唯一ID',
  `seat_num` int(11) NULL DEFAULT NULL COMMENT '座椅编号',
  `seat_state` int(11) NULL DEFAULT NULL COMMENT ' 安全带工作状态 0=匹配状态 1=无人状态 2=有人但没系安全带 3=操作不当 4=正常 32=设置成功 40=发射板失联 80=电池电量低',
  `equipment_status` int(11) NULL DEFAULT NULL COMMENT '安全带匹配状态 0=新增 1=更新 2=停用',
  `last_update_time` datetime NULL DEFAULT NULL COMMENT '安全带设备状态最后修改时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`) USING BTREE,
  INDEX `idx_time`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of device_seat
-- ----------------------------

-- ----------------------------
-- Table structure for device_seat_last
-- ----------------------------
DROP TABLE IF EXISTS `device_seat_last`;
CREATE TABLE `device_seat_last`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主动安全报警',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备编号',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `seat_map` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '座位表[z1-x1-y1, z2-x2-y2]',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `lng` decimal(11, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(11, 6) NULL DEFAULT NULL COMMENT '纬度',
  `speed` smallint(6) NULL DEFAULT NULL COMMENT '速度',
  `azimuth` smallint(6) NULL DEFAULT NULL COMMENT '方位角',
  `json_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '安全带设备状态最后修改时间',
  `last_update_time` datetime NULL DEFAULT NULL COMMENT '安全带设备状态最后修改时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_imei`(`company_id`, `imei`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of device_seat_last
-- ----------------------------

-- ----------------------------
-- Table structure for device_self_check
-- ----------------------------
DROP TABLE IF EXISTS `device_self_check`;
CREATE TABLE `device_self_check`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备最新版本信息',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备id',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `rsp_serial` int(11) NULL DEFAULT NULL COMMENT '应答流水号',
  `info_length` int(11) NULL DEFAULT NULL COMMENT '自检信息长度',
  `record_chn_number` int(11) NULL DEFAULT NULL COMMENT '录像通道数 ',
  `record_status` int(11) NULL DEFAULT NULL COMMENT '录像状态 ',
  `wireless_type` int(11) NULL DEFAULT NULL COMMENT '无限模块类型',
  `wireless_status` int(11) NULL DEFAULT NULL COMMENT '无线模块状态',
  `gps_status` int(11) NULL DEFAULT NULL COMMENT 'gps模块状态',
  `power_status` int(11) NULL DEFAULT NULL COMMENT '电源状态',
  `screen_status` int(11) NULL DEFAULT NULL COMMENT '调度屏状态',
  `storage_number` int(11) NULL DEFAULT NULL COMMENT '存储信息列表数',
  `storage_list` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储信息列表数,json',
  `upload_time` datetime NULL DEFAULT NULL COMMENT '终端上报时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务器时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `upload_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `upload_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `upload_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_self_check
-- ----------------------------

-- ----------------------------
-- Table structure for device_snap
-- ----------------------------
DROP TABLE IF EXISTS `device_snap`;
CREATE TABLE `device_snap`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备id',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `chn` smallint(6) NULL DEFAULT NULL COMMENT '通道号',
  `snap_type` int(8) NOT NULL DEFAULT 0 COMMENT '0 平台指令抓拍 参照808协议，扩展100+',
  `snap_time` datetime NOT NULL COMMENT '拍照时间',
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件存储路径',
  `lng` decimal(11, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(11, 6) NULL DEFAULT NULL COMMENT '纬度',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `direction` smallint(6) NULL DEFAULT NULL COMMENT '方向',
  `station_id` int(11) NULL DEFAULT NULL COMMENT '站点表唯一ID',
  `stop_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站台ID',
  `media_id` int(11) NULL DEFAULT NULL COMMENT '抓拍到的多媒体ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `snap_time`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `snap_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `snap_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_snap
-- ----------------------------

-- ----------------------------
-- Table structure for device_snap_list
-- ----------------------------
DROP TABLE IF EXISTS `device_snap_list`;
CREATE TABLE `device_snap_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `snap_id` int(11) NULL DEFAULT NULL COMMENT '抓拍表ID',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备id',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `media_id` int(11) NULL DEFAULT NULL COMMENT '抓拍到的多媒体ID',
  `snap_type` int(8) NOT NULL DEFAULT 0 COMMENT '0 平台指令抓拍 参照808协议，扩展100+',
  `chn` smallint(6) NULL DEFAULT NULL COMMENT '通道号',
  `lng` decimal(11, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(11, 6) NULL DEFAULT NULL COMMENT '纬度',
  `snap_time` datetime NOT NULL COMMENT '拍照时间',
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件存储路径',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `snap_time`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `snap_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `snap_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of device_snap_list
-- ----------------------------

-- ----------------------------
-- Table structure for device_version
-- ----------------------------
DROP TABLE IF EXISTS `device_version`;
CREATE TABLE `device_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备id',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `protocol` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '协议版本',
  `firmware` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固件版本',
  `site` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报站文件版本',
  `guid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备唯一ID',
  `upload_time` datetime NOT NULL COMMENT '上报时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_version`(`company_id`, `car_id`, `upload_time`) USING BTREE,
  INDEX `idx_imei`(`imei`, `upload_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `upload_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_version
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_daily_car
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_car`;
CREATE TABLE `ledger_daily_car`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序列',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司ID',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '归属日期',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '归属线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属线路名称',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆编码',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `run_route_set` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行线路名称',
  `plan_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '计划趟次',
  `real_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '实际趟次',
  `abnormal_count` int(11) NULL DEFAULT NULL COMMENT '异常趟次',
  `trip_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '趟次兑现率',
  `emp_use_count` int(11) NULL DEFAULT 0 COMMENT '出勤人数',
  `total_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '运营+包车+非运营总里程',
  `plan_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '原计划运营总里程',
  `operating_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '运营里程',
  `contract_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '包车里程',
  `idle_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '辅助里程',
  `gps_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT 'GPS总里程, 来源计划表和非运营表',
  `device_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '设备总里程, 来源GPS表',
  `first_last_count` int(11) NULL DEFAULT 0 COMMENT '首末班考核次数',
  `first_last_on_time` int(11) NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int(11) NULL DEFAULT 0 COMMENT '发车次数',
  `depart_on_time` int(11) NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int(11) NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int(11) NULL DEFAULT 0 COMMENT '大站正点次数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int(11) NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int(11) NULL DEFAULT 0 COMMENT '全程正点次数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `over_speed_count` int(11) NULL DEFAULT 0 COMMENT '超速次数',
  `device_boot_time` datetime NULL DEFAULT NULL COMMENT '设备启动时间',
  `device_shutdown_time` datetime NULL DEFAULT NULL COMMENT '设备关机时间',
  `device_time` int(11) NULL DEFAULT NULL COMMENT '设备运行时长,单位小时',
  `work_start_time` datetime NULL DEFAULT NULL COMMENT '开始工作时间(计划和非运营最早一笔)',
  `work_end_time` datetime NULL DEFAULT NULL COMMENT '结束工作时间(计划和非运营最晚一笔)',
  `work_time` int(11) NOT NULL DEFAULT 0 COMMENT '一天工作总时长(秒)',
  `plan_first_departure_time` datetime NULL DEFAULT NULL COMMENT '行车计划-第一班实际发车时间',
  `plan_last_arrival_time` datetime NULL DEFAULT NULL COMMENT '行车计划-最后一班实际到达时间',
  `plan_time` int(11) NULL DEFAULT 0 COMMENT '运营工作时长=最晚行车记录到达-最早行车记录发车',
  `operational_time_expected` int(11) NULL DEFAULT 0 COMMENT '计划总时长(秒), 计划到达-计划发车',
  `operational_time_actual` int(11) NULL DEFAULT 0 COMMENT '实际总时长(秒), 实际到达-实际发车',
  `non_operational_time` int(11) NULL DEFAULT 0 COMMENT '非运营时长(秒)',
  `rest_time` int(11) NULL DEFAULT 0 COMMENT '休息时长(秒)',
  `run_time` int(11) NOT NULL DEFAULT 0 COMMENT '运营时长(秒)，使用operational_time替代，后续删除20220324',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `sort_id` int(11) NULL DEFAULT NULL COMMENT '排序',
  `is_deleted` int(11) NULL DEFAULT 0,
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_date_route`(`company_id`, `work_date`, `route_id`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ledger_daily_car
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_daily_company
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_company`;
CREATE TABLE `ledger_daily_company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '基础数据日台账',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期,规避多时区',
  `vehicle_count` int(11) NOT NULL DEFAULT 0 COMMENT '车辆档案总数',
  `vehicle_0` int(11) NOT NULL DEFAULT 0 COMMENT '运营车辆',
  `vehicle_10` int(11) NOT NULL DEFAULT 0 COMMENT '故障车辆',
  `vehicle_20` int(11) NOT NULL DEFAULT 0 COMMENT '扣押车辆',
  `vehicle_100` int(11) NOT NULL DEFAULT 0 COMMENT '报废车辆',
  `employee_count` int(11) NOT NULL DEFAULT 0 COMMENT '人员档案总数',
  `driver_count` int(11) NOT NULL DEFAULT 0 COMMENT '驾驶员数量',
  `conductor_count` int(11) NOT NULL DEFAULT 0 COMMENT '乘务员数量',
  `employee_0` int(11) NOT NULL DEFAULT 0 COMMENT '正常',
  `employee_10` int(11) NOT NULL DEFAULT 0 COMMENT '请假',
  `employee_100` int(11) NOT NULL DEFAULT 0 COMMENT '离职',
  `stop_count` int(11) NOT NULL DEFAULT 0 COMMENT '站台数量',
  `route_count` int(11) NOT NULL DEFAULT 0 COMMENT '线路总数',
  `dispatch_count` int(11) NOT NULL DEFAULT 0 COMMENT '调度线路数',
  `distance_10` int(11) NULL DEFAULT 0 COMMENT '10km以下线路数',
  `distance_20` int(11) NULL DEFAULT 0 COMMENT '20km以下线路数',
  `distance_30` int(11) NULL DEFAULT 0 COMMENT '30km以下线路数',
  `distance_other` int(11) NULL DEFAULT 0 COMMENT '30km以上线路数',
  `passenger_count` int(11) NOT NULL DEFAULT 0 COMMENT '客流总数',
  `car_own_count` int(11) NOT NULL DEFAULT 0 COMMENT '配车数量',
  `car_use_count` int(11) NOT NULL DEFAULT 0 COMMENT '出勤车辆',
  `car_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '车辆出勤率',
  `emp_own_count` int(11) NOT NULL DEFAULT 0 COMMENT '企业员工配额',
  `emp_use_count` int(11) NOT NULL DEFAULT 0 COMMENT '出勤员工',
  `emp_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '员工出勤率',
  `plan_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '计划趟次',
  `real_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '实际趟次',
  `trip_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '趟次兑现率',
  `total_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '企业单日总里程',
  `plan_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '计划里程',
  `real_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '实际里程',
  `contract_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '包车公里',
  `idle_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '辅助公里',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `first_last_count` int(11) NULL DEFAULT 0 COMMENT '首末班考核次数',
  `first_last_on_time` int(11) NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '首末班正点率',
  `depart_count` int(11) NULL DEFAULT 0 COMMENT '发车考核次数',
  `depart_on_time` int(11) NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '发车正点率',
  `big_station_count` int(11) NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int(11) NULL DEFAULT 0 COMMENT '大站正点次数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '大站正点率',
  `full_time_count` int(11) NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int(11) NULL DEFAULT 0 COMMENT '全程正点次数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '全程正点率',
  `over_speed_count` int(11) NULL DEFAULT 0 COMMENT '超速次数',
  `monitor_large_interval` int(11) NULL DEFAULT 0 COMMENT '发车大间隔',
  `monitor_bunching_count` int(11) NULL DEFAULT 0 COMMENT '串车次数',
  `monitor_scatter_count` int(11) NULL DEFAULT 0 COMMENT '行车大间隔',
  `monitor_long_wait` int(11) NULL DEFAULT 0 COMMENT '长时间等待',
  `monitor_long_parking` int(11) NULL DEFAULT 0 COMMENT '长时间停靠',
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `except_count` int(11) NULL DEFAULT NULL COMMENT '行车异常次数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_workdate`(`company_id`, `work_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ledger_daily_company
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_daily_company_alarm
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_company_alarm`;
CREATE TABLE `ledger_daily_company_alarm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '基础数据日台账',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期,规避多时区',
  `vehicle_count` int(11) NOT NULL DEFAULT 0 COMMENT '车辆档案总数',
  `alarm_type` int(11) NOT NULL DEFAULT 0 COMMENT '报警/事件类型',
  `alarm_count` int(11) NOT NULL DEFAULT 0 COMMENT '报警次数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_workdate`(`company_id`, `work_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ledger_daily_company_alarm
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_daily_detail
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_detail`;
CREATE TABLE `ledger_daily_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单人单车日台账',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `company_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业名称',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营线路名称',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营线路车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营线路车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营线路员工ID',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营线路员工名称',
  `emp_type` int(11) NULL DEFAULT 1 COMMENT '员工类型 0默认1 驾驶员 2乘务员 3站务',
  `emp_state` int(11) NULL DEFAULT NULL COMMENT '司机状态0正常, 10请假 100机动',
  `plan_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '计划趟次',
  `real_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '实际趟次',
  `gps_deviation_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT 'GPS里程偏差趟次',
  `trip_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '趟次兑现率',
  `plan_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '计划里程',
  `real_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '实际里程',
  `gps_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT 'GPS里程',
  `contract_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '包车里程',
  `idle_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '非运营里程',
  `start_time` datetime NULL DEFAULT NULL COMMENT '最早时间记录时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '最晚记录时间',
  `check_time` datetime NULL DEFAULT NULL COMMENT '签到时间',
  `work_time` int(11) NOT NULL DEFAULT 0 COMMENT '工作时长(秒)',
  `trave_time` int(11) NOT NULL DEFAULT 0 COMMENT 'travel行驶时长(秒)',
  `is_late` smallint(6) NOT NULL DEFAULT 0 COMMENT '司机是否迟到',
  `record_count` int(11) NOT NULL DEFAULT 0 COMMENT '记录数',
  `except_count` int(11) NOT NULL DEFAULT 0 COMMENT '行车异常记录数',
  `over_speed_count` int(11) NOT NULL DEFAULT 0 COMMENT '超速次数',
  `first_last_count` int(11) NULL DEFAULT 0 COMMENT '首末班考核次数',
  `first_last_on_time` int(11) NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int(11) NULL DEFAULT 0 COMMENT '发车考核次数',
  `depart_on_time` int(11) NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int(11) NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int(11) NULL DEFAULT 0 COMMENT '大站正点次数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int(11) NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int(11) NULL DEFAULT 0 COMMENT '全程正点次数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `work_start_time` datetime NULL DEFAULT NULL COMMENT '开始工作时间(计划和非运营最早一笔)',
  `work_end_time` datetime NULL DEFAULT NULL COMMENT '结束工作时间(计划和非运营最晚一笔)',
  `plan_first_departure_time` datetime NULL DEFAULT NULL COMMENT '行车计划-第一班实际发车时间',
  `plan_last_arrival_time` datetime NULL DEFAULT NULL COMMENT '行车计划-最后一班实际到达时间',
  `operational_time_expected` int(11) NULL DEFAULT 0 COMMENT '计划总时长(秒), 计划到达-计划发车',
  `operational_time_actual` int(11) NULL DEFAULT 0 COMMENT '实际总时长(秒), 实际到达-实际发车',
  `non_operational_time` int(11) NULL DEFAULT 0 COMMENT '非运营时长(秒)',
  `rest_time` int(11) NULL DEFAULT 0 COMMENT '休息时长(秒)',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `sort_id` int(11) NULL DEFAULT NULL COMMENT '排序',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cwr`(`company_id`, `work_date`, `route_id`) USING BTREE,
  INDEX `idx_crw`(`company_id`, `route_id`, `work_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ledger_daily_detail
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_daily_employee
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_employee`;
CREATE TABLE `ledger_daily_employee`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序列',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司ID',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '归属日期',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属线路名称',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `emp_type` smallint(6) NOT NULL DEFAULT 1 COMMENT '员工类型 0默认1 驾驶员 2乘务员 3站务',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业归属员工ID',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业归属员工名称',
  `plan_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '计划趟次',
  `real_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '实际趟次',
  `abnormal_count` int(11) NULL DEFAULT 0 COMMENT '异常趟次',
  `trip_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '趟次兑现率',
  `car_use_count` int(11) NULL DEFAULT 0 COMMENT '配班数',
  `total_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '运营+包车+非运营总里程',
  `plan_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '原计划运营总里程',
  `operating_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '运营里程',
  `contract_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '包车里程',
  `idle_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '辅助里程',
  `gps_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT 'GPS总里程, 来源计划表和非运营表',
  `first_last_count` int(11) NULL DEFAULT 0 COMMENT '首末班考核次数',
  `first_last_on_time` int(11) NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int(11) NULL DEFAULT 0 COMMENT '发车次数',
  `depart_on_time` int(11) NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int(11) NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int(11) NULL DEFAULT 0 COMMENT '大站正点次数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int(11) NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int(11) NULL DEFAULT 0 COMMENT '全程正点次数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `over_speed_count` int(11) NULL DEFAULT 0 COMMENT '超速次数',
  `start_time` datetime NULL DEFAULT NULL COMMENT '最早上班时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '最晚下班时间',
  `work_time` int(11) NULL DEFAULT 0 COMMENT '工作时长',
  `run_time` int(11) NULL DEFAULT 0 COMMENT '运营时长',
  `rest_time` int(11) NULL DEFAULT 0 COMMENT '休息时长',
  `operational_time_expected` int(11) NULL DEFAULT 0 COMMENT '计划总时长(秒), 计划到达-计划发车',
  `operational_time_actual` int(11) NULL DEFAULT 0 COMMENT '实际总时长(秒), 实际到达-实际发车',
  `non_operational_time` int(11) NULL DEFAULT 0 COMMENT '非运营时长(秒)',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `run_route_set` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行线路名称',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_deleted` int(11) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_date_route`(`company_id`, `work_date`, `route_id`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ledger_daily_employee
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_daily_illegal
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_illegal`;
CREATE TABLE `ledger_daily_illegal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '违规信息日台账',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营线路名称',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营线路车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营线路车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营线路员工ID',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营线路员工名称',
  `illegal_type` int(11) NULL DEFAULT 0 COMMENT '违规类型',
  `standard_value` int(11) NULL DEFAULT NULL COMMENT '违规阀值',
  `illegal_count` int(11) NULL DEFAULT 0 COMMENT '违规次数',
  `reduce_score` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '违规扣分',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_daily_illegal
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_daily_mileage
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_mileage`;
CREATE TABLE `ledger_daily_mileage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '归属日期',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司编号',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号编号',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路名称',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆自编号',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备编号',
  `mileage` decimal(11, 3) NOT NULL COMMENT '当天总公里数',
  `is_abnormal` smallint(6) NULL DEFAULT 0 COMMENT '是否异常',
  `is_reissue` smallint(6) NULL DEFAULT 0 COMMENT '补传标识 0自动台账 1自动补录 2手工台账',
  `start_time` datetime NOT NULL COMMENT '最小开始里程',
  `start_mileage` decimal(11, 3) NOT NULL COMMENT '最早上线时间',
  `end_time` datetime NOT NULL COMMENT '最大结束里程',
  `end_mileage` decimal(11, 3) NOT NULL COMMENT '最晚关机时间',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否有效',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_date_route`(`company_id`, `work_date`, `route_id`) USING BTREE,
  INDEX `ix_date_car`(`company_id`, `work_date`, `car_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ledger_daily_mileage
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_daily_route
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_route`;
CREATE TABLE `ledger_daily_route`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `company_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业名称',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路名称',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `is_dispatch` smallint(6) NOT NULL DEFAULT 0 COMMENT '当天是否调度',
  `car_own_count` int(11) NOT NULL DEFAULT 0 COMMENT '配车',
  `car_use_count` int(11) NOT NULL DEFAULT 0 COMMENT '出车',
  `car_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '车辆出勤率',
  `emp_own_count` int(11) NOT NULL DEFAULT 0 COMMENT '司机配额',
  `emp_use_count` int(11) NOT NULL DEFAULT 0 COMMENT '出勤员工',
  `emp_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '员工出勤率',
  `plan_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '计划趟次',
  `real_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '实际趟次',
  `abnormal_count` int(11) NULL DEFAULT 0 COMMENT '异常趟次',
  `trip_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '趟次兑现率',
  `total_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '全部里程',
  `plan_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '计划里程',
  `real_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '实际里程',
  `gps_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT 'GPS里程',
  `contract_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '包车里程',
  `idle_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '非运营里程',
  `record_count` int(11) NOT NULL DEFAULT 0 COMMENT '计划完成记录数',
  `except_count` int(11) NOT NULL DEFAULT 0 COMMENT '行车异常记录数',
  `work_time` int(11) NOT NULL DEFAULT 0 COMMENT '工作时长',
  `trave_time` int(11) NOT NULL DEFAULT 0 COMMENT '行驶时长',
  `operational_time_expected` int(11) NULL DEFAULT 0 COMMENT '计划总时长(秒), 计划到达-计划发车',
  `operational_time_actual` int(11) NULL DEFAULT 0 COMMENT '实际总时长(秒), 实际到达-实际发车',
  `non_operational_time` int(11) NULL DEFAULT 0 COMMENT '非运营时长(秒)',
  `rest_time` int(11) NULL DEFAULT 0 COMMENT '休息时长(秒)',
  `first_last_count` int(11) NULL DEFAULT 0 COMMENT '首班考核次数',
  `first_last_on_time` int(11) NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int(11) NULL DEFAULT 0 COMMENT '发车考核次数',
  `depart_on_time` int(11) NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int(11) NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int(11) NULL DEFAULT 0 COMMENT '大站考核准点数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int(11) NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int(11) NULL DEFAULT 0 COMMENT '全程用时准点记录数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `over_speed_count` int(11) NOT NULL DEFAULT 0 COMMENT '超速记录次数',
  `monitor_large_interval` int(11) NOT NULL DEFAULT 0 COMMENT '发车大间隔',
  `monitor_bunching_count` int(11) NOT NULL DEFAULT 0 COMMENT '串车次数',
  `monitor_scatter_count` int(11) NOT NULL DEFAULT 0 COMMENT '大间隔',
  `monitor_long_wait` int(11) NOT NULL DEFAULT 0 COMMENT '长时间等待',
  `monitor_long_parking` int(11) NOT NULL DEFAULT 0 COMMENT '长时间停靠',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `sort_id` int(11) NULL DEFAULT NULL COMMENT '排序',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核账号',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cwr`(`company_id`, `work_date`, `route_id`) USING BTREE,
  INDEX `idx_crw`(`company_id`, `route_id`, `work_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ledger_daily_route
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_daily_station
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_station`;
CREATE TABLE `ledger_daily_station`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单天峰段全程耗时',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营线路名称',
  `route_code` int(11) NULL DEFAULT NULL COMMENT '线路编号',
  `way_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营线路车辆ID',
  `utc_hour` int(11) NOT NULL COMMENT 'UTC小时',
  `direction` int(11) NOT NULL DEFAULT 0 COMMENT '方向',
  `expected_mileage` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '额定里程',
  `actual_mileage` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '行驶GPS里程',
  `expected_duration` int(11) NOT NULL COMMENT '预期时长秒',
  `actual_duration` int(11) NOT NULL COMMENT '实际时长秒',
  `max_duration` int(11) NOT NULL COMMENT '最大耗时秒',
  `min_duration` int(11) NOT NULL COMMENT '最小耗时秒',
  `trip_count` int(11) NOT NULL COMMENT '统计次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `work_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_daily_station
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_driver_trip_level
-- ----------------------------
DROP TABLE IF EXISTS `ledger_driver_trip_level`;
CREATE TABLE `ledger_driver_trip_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '驾驶员趟次工资',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `work_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `route_fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路归属车队',
  `route_fleet_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路归宿车队名称',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶员工号',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶员姓名',
  `emp_fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工归宿车队',
  `emp_fleet_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶员归属车队名称',
  `plan_depart` datetime NULL DEFAULT NULL COMMENT '计划发车',
  `real_depart` datetime NULL DEFAULT NULL COMMENT '计划到达',
  `trips` decimal(10, 1) NULL DEFAULT NULL COMMENT '趟次',
  `time_period_id` smallint(6) NULL DEFAULT NULL COMMENT '时段',
  `subsidy_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '时段工资',
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ix_driver_record`(`company_id`, `work_date`, `route_fleet_id`, `route_id`, `car_id`, `emp_id`, `plan_depart`, `is_deleted`) USING BTREE,
  INDEX `ix_trip_level`(`company_id`, `work_date`, `emp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_driver_trip_level
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_fault_data_check
-- ----------------------------
DROP TABLE IF EXISTS `ledger_fault_data_check`;
CREATE TABLE `ledger_fault_data_check`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `work_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属日期',
  `archive_time` datetime NULL DEFAULT NULL COMMENT '归属时间-->故障报修单报修时间',
  `year` smallint(6) NULL DEFAULT NULL COMMENT '年份',
  `month` smallint(6) NULL DEFAULT NULL COMMENT '月份',
  `event_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事件编号',
  `fault_type` int(11) NOT NULL COMMENT '故障类型',
  `description_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '故障描述ID',
  `description_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '故障描述',
  `module_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主模块ID',
  `module_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主模块名称',
  `sub_module_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子模块ID',
  `sub_module_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子模块名称',
  `current_assignment` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前指派ID',
  `current_assignment_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前指派人名称',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `side_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆边号，如：2-46789，边号=46789',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `sub_fleet_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下级车队ID',
  `sub_fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下级车队名称',
  `fault_status` int(11) NULL DEFAULT 0 COMMENT '状态 0=创建, 1=审核, 2=确认, 3=指派, 4=误报, 5=解决, 255=关闭',
  `repair_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报修人ID',
  `repair_user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报修人名称',
  `repair_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '报修时间',
  `parking_space` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '停车位',
  `residence_time` datetime NULL DEFAULT NULL COMMENT '停留时间',
  `parking_time` datetime NULL DEFAULT NULL COMMENT '停车时间',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `steps_reproduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重现步骤',
  `resolution_time` datetime NULL DEFAULT NULL COMMENT '解决时间',
  `fault_solution_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解决方案',
  `fault_solution_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解决方案名称',
  `action_result` smallint(6) NULL DEFAULT NULL COMMENT '处理结果 0未处理，1已处理',
  `close_time` datetime NULL DEFAULT NULL COMMENT '关闭时间',
  `total_time_long` decimal(18, 2) NULL DEFAULT NULL COMMENT '从报修到关闭用时',
  `resolution_time_long` decimal(18, 2) NULL DEFAULT NULL COMMENT '从报修解决故障用时',
  `close_time_long` decimal(18, 2) NULL DEFAULT NULL COMMENT '从解决到关闭用时',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `criteria_type` smallint(6) NULL DEFAULT NULL COMMENT '考核标准 0未超出阈值，1超出阈值',
  `contract_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `report_category` smallint(6) NULL DEFAULT NULL COMMENT '上报类别',
  `report_type` smallint(6) NULL DEFAULT NULL COMMENT '上报类型 0内部，1外部',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `fault_solution_status` smallint(6) NULL DEFAULT NULL COMMENT '解决状态 0=正常或未处理，1=已解决',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_fault_repair`(`company_id`, `event_id`, `is_deleted`) USING BTREE,
  INDEX `uk_company_time`(`company_id`, `archive_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_fault_data_check
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_monthly_car
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_car`;
CREATE TABLE `ledger_monthly_car`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `month` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '月度',
  `start_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开始日期',
  `end_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结束日期',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属线路名称',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `check_days` int(11) NOT NULL DEFAULT 0 COMMENT '考核天数',
  `use_days` int(11) NOT NULL DEFAULT 0 COMMENT '出车天数',
  `days_ratio` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '出车率',
  `work_time` int(11) NOT NULL DEFAULT 0 COMMENT '工作总时长',
  `trave_time` int(11) NOT NULL DEFAULT 0 COMMENT '运营总时长',
  `plan_time` int(11) NULL DEFAULT 0 COMMENT '运营工作时长=最晚行车记录到达-最早行车记录发车',
  `operational_time_expected` int(11) NULL DEFAULT 0 COMMENT '计划总时长(秒), 计划到达-计划发车',
  `operational_time_actual` int(11) NULL DEFAULT 0 COMMENT '实际总时长(秒), 实际到达-实际发车',
  `non_operational_time` int(11) NULL DEFAULT 0 COMMENT '非运营时长(秒)',
  `rest_time` int(11) NULL DEFAULT 0 COMMENT '休息时长',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `plan_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '计划总趟次',
  `real_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '实际总趟次',
  `trip_ratio` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '趟次兑现率',
  `total_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '运营+包车+非运营总里程',
  `plan_mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '计划运营总里程',
  `trave_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '实际运营总里程',
  `contract_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '包车总里程',
  `idle_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '辅助里程',
  `gps_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT 'GPS总里程, 来源GPS表，非计划表',
  `device_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '设备总里程, 来源GPS表',
  `first_last_count` int(11) NULL DEFAULT 0 COMMENT '首末班考核次数',
  `first_last_on_time` int(11) NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int(11) NULL DEFAULT 0 COMMENT '发车次数',
  `depart_on_time` int(11) NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int(11) NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int(11) NULL DEFAULT 0 COMMENT '大站正点次数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int(11) NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int(11) NULL DEFAULT 0 COMMENT '全程正点次数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `over_speed_count` int(11) NULL DEFAULT 0 COMMENT '超速次数',
  `sort_id` int(11) NULL DEFAULT NULL COMMENT '排序',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_monthly_car`(`company_id`, `month`, `route_id`, `car_id`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ledger_monthly_car
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_monthly_company
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_company`;
CREATE TABLE `ledger_monthly_company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '基础数据日台账',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业',
  `month` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期,规避多时区',
  `days` smallint(6) NOT NULL DEFAULT 0 COMMENT '天数',
  `vehicle_count` int(11) NOT NULL DEFAULT 0 COMMENT '车辆数量',
  `employee_count` int(11) NOT NULL DEFAULT 0 COMMENT '人员数量',
  `driver_count` int(11) NOT NULL DEFAULT 0 COMMENT '驾驶员数量',
  `conductor_count` int(11) NOT NULL DEFAULT 0 COMMENT '乘务员数量',
  `stop_count` int(11) NOT NULL COMMENT '站台数量',
  `route_count` int(11) NOT NULL DEFAULT 0 COMMENT '线路总数',
  `dispatch_count` int(11) NOT NULL DEFAULT 0 COMMENT '调度线路数',
  `passenger_count` int(11) NOT NULL DEFAULT 0 COMMENT '客流总数',
  `car_own_count` int(11) NOT NULL DEFAULT 0 COMMENT '配车数量',
  `car_use_count` int(11) NOT NULL DEFAULT 0 COMMENT '出勤车辆',
  `car_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '车辆出勤率',
  `emp_own_count` int(11) NOT NULL DEFAULT 0 COMMENT '驾驶员配额',
  `emp_use_count` int(11) NOT NULL DEFAULT 0 COMMENT '出勤驾驶员',
  `emp_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '员工出勤率',
  `plan_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '计划趟次',
  `real_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '实际趟次',
  `trip_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '趟次兑现率',
  `total_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '总里程',
  `plan_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '计划里程',
  `real_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '实际里程',
  `contract_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '包车公里',
  `idle_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '辅助公里',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `first_last_count` int(11) NULL DEFAULT 0 COMMENT '首末班考核次数',
  `first_last_on_time` int(11) NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '首末班正点率',
  `depart_count` int(11) NULL DEFAULT 0 COMMENT '发车考核次数',
  `depart_on_time` int(11) NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '发车正点率',
  `big_station_count` int(11) NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int(11) NULL DEFAULT 0 COMMENT '大站正点次数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '大站正点率',
  `full_time_count` int(11) NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int(11) NULL DEFAULT 0 COMMENT '全程正点次数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '全程正点率',
  `over_speed_count` int(11) NULL DEFAULT 0 COMMENT '超速次数',
  `monitor_large_interval` int(11) NULL DEFAULT 0 COMMENT '发车大间隔',
  `monitor_bunching_count` int(11) NULL DEFAULT 0 COMMENT '串车次数',
  `monitor_scatter_count` int(11) NULL DEFAULT 0 COMMENT '行车大间隔',
  `monitor_long_wait` int(11) NULL DEFAULT 0 COMMENT '长时间等待',
  `monitor_long_parking` int(11) NULL DEFAULT 0 COMMENT '长时间停靠',
  `is_deleted` int(11) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_monthly_company`(`company_id`, `month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ledger_monthly_company
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_monthly_employee
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_employee`;
CREATE TABLE `ledger_monthly_employee`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `month` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '月度',
  `start_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开始日期',
  `end_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结束日期',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `emp_type` smallint(6) NOT NULL DEFAULT 1 COMMENT '员工类型 0默认1 驾驶员 2乘务员 3站务',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '司机ID',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '司机名称',
  `check_days` int(11) NOT NULL DEFAULT 0 COMMENT '考核天数',
  `use_days` int(11) NOT NULL DEFAULT 0 COMMENT '出车天数',
  `days_ratio` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '出车率',
  `work_time` int(11) NOT NULL DEFAULT 0 COMMENT '工作总时长',
  `trave_time` int(11) NOT NULL DEFAULT 0 COMMENT '运营总时长',
  `plan_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '计划总趟次',
  `real_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '实际总趟次',
  `trip_ratio` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '趟次兑现率',
  `total_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '调度运营总里程',
  `plan_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '计划里程',
  `trave_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '运营总里程',
  `contract_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '包车总里程',
  `idle_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '辅助里程',
  `gps_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT 'GPS总里程, 来源GPS表，非计划表',
  `first_last_count` int(11) NULL DEFAULT 0 COMMENT '首班考核次数',
  `first_last_on_time` int(11) NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int(11) NULL DEFAULT 0 COMMENT '发车考核次数',
  `depart_on_time` int(11) NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int(11) NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int(11) NULL DEFAULT 0 COMMENT '大站考核准点数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int(11) NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int(11) NULL DEFAULT 0 COMMENT '全程用时准点记录数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `over_speed_count` int(11) NULL DEFAULT 0 COMMENT '超速记录次数',
  `operational_time_expected` int(11) NULL DEFAULT 0 COMMENT '计划总时长(秒), 计划到达-计划发车',
  `operational_time_actual` int(11) NULL DEFAULT 0 COMMENT '实际总时长(秒), 实际到达-实际发车',
  `non_operational_time` int(11) NULL DEFAULT 0 COMMENT '非运营时长(秒)',
  `rest_time` int(11) NULL DEFAULT 0 COMMENT '休息时长(秒)',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `is_deleted` int(11) NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_monthly_car`(`company_id`, `month`, `route_id`, `emp_id`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ledger_monthly_employee
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_monthly_fault_contract
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_fault_contract`;
CREATE TABLE `ledger_monthly_fault_contract`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `month` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月份',
  `contract_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `gps_vehicles_count` int(11) NULL DEFAULT NULL COMMENT '配备 GPS 的车辆数量',
  `on_vehicle_devices_count` int(11) NULL DEFAULT NULL COMMENT '车辆上的设备总数（个）',
  `computer_count` int(11) NULL DEFAULT 0 COMMENT '电脑数量',
  `computer_total` int(11) NOT NULL DEFAULT 0 COMMENT '电脑设备总数（个）',
  `equipmnet_total` int(11) NULL DEFAULT 0 COMMENT '所有设备总数=车辆上的设备总数+电脑设备总数',
  `report_count` int(11) NULL DEFAULT 0 COMMENT '故障上报次数',
  `fault_rate` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '故障率',
  `devices_report_count` int(11) NULL DEFAULT 0 COMMENT '车上故障上报次数',
  `devices_specified_time_complete` int(11) NULL DEFAULT 0 COMMENT '规定时间内完成的维修次数（次）',
  `devices_over_hours24` int(11) NULL DEFAULT 0 COMMENT '24小时以上维修次数（次',
  `network_devices_count` int(11) NULL DEFAULT 0 COMMENT '计算机网络设备的故障上报次数',
  `network_devices_corrected_hours3` int(11) NULL DEFAULT 0 COMMENT '3小时内完成即时更正次数（次）',
  `network_devices_overdue_count` int(11) NULL DEFAULT 0 COMMENT '逾期修改次数（次）',
  `app_report_count` int(11) NULL DEFAULT 0 COMMENT 'app故障上报次数',
  `app_corrected_hours3` int(11) NULL DEFAULT 0 COMMENT '3小时内临时修复次数（次）',
  `app_permanent_fix_days3` int(11) NULL DEFAULT 0 COMMENT '3天内完成的永久修复次数（次）',
  `app_over_hours3` int(11) NULL DEFAULT 0 COMMENT '3小时以上维修次数（次）',
  `cloud_report_count` int(11) NULL DEFAULT 0 COMMENT '信息系统和云修复通知',
  `cloud_corrected_hours3` int(11) NULL DEFAULT 0 COMMENT '3小时内临时修复次数（次）',
  `cloud_permanent_fix_days3` int(11) NULL DEFAULT 0 COMMENT '3天内完成的永久修复次数（次）',
  `cloud_overdue_count` int(11) NULL DEFAULT 0 COMMENT '逾期修改次数（次）',
  `is_deleted` int(11) NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_index`(`company_id`, `month`, `fleet_id`, `contract_no`, `is_deleted`) USING BTREE,
  INDEX `nk_index`(`company_id`, `month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_monthly_fault_contract
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_monthly_fault_module
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_fault_module`;
CREATE TABLE `ledger_monthly_fault_module`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `month` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月份',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `report_count` int(11) NULL DEFAULT NULL COMMENT '故障上报次数',
  `no_vehicle_info` int(11) NULL DEFAULT NULL COMMENT '没有车辆信息',
  `cable_inch_7` int(11) NULL DEFAULT NULL COMMENT '7\" 电缆',
  `app` int(11) NULL DEFAULT NULL COMMENT '应用程序',
  `camera_1` int(11) NULL DEFAULT NULL COMMENT '相机#1',
  `camera_2` int(11) NULL DEFAULT NULL COMMENT '相机#2',
  `camera_3` int(11) NULL DEFAULT NULL COMMENT '相机#3',
  `camera_4` int(11) NULL DEFAULT NULL COMMENT '相机#4',
  `gps` int(11) NULL DEFAULT NULL COMMENT '全球定位系统',
  `gps_antenna` int(11) NULL DEFAULT NULL COMMENT 'GPS天线',
  `gsm` int(11) NULL DEFAULT NULL COMMENT 'GSM',
  `gsm_antenna` int(11) NULL DEFAULT NULL COMMENT 'GSM天线',
  `harddisk` int(11) NULL DEFAULT NULL COMMENT '硬盘',
  `monitor_pole_inch_22` int(11) NULL DEFAULT NULL COMMENT '显示器 22\" 杆',
  `pcc_1` int(11) NULL DEFAULT NULL COMMENT 'PCC#1',
  `pcc_2` int(11) NULL DEFAULT NULL COMMENT 'PCC#2',
  `rfid` int(11) NULL DEFAULT NULL COMMENT '射频识别',
  `driver_license` int(11) NULL DEFAULT NULL COMMENT '驾驶执照',
  `gsm_antenna_3g` int(11) NULL DEFAULT NULL COMMENT '3G(GSM)天线',
  `server_box` int(11) NULL DEFAULT NULL COMMENT '服务器箱',
  `led_screen_inch_22` int(11) NULL DEFAULT NULL COMMENT '22寸LED屏',
  `drive_screen_inch_7` int(11) NULL DEFAULT NULL COMMENT '驱动屏幕 7\"',
  `dataset_problem` int(11) NULL DEFAULT NULL COMMENT '数据集有问题',
  `car_power_system` int(11) NULL DEFAULT NULL COMMENT '汽车动力系统',
  `is_deleted` int(11) NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_index`(`company_id`, `month`, `fleet_id`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_monthly_fault_module
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_monthly_fault_platform
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_fault_platform`;
CREATE TABLE `ledger_monthly_fault_platform`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `month` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月份',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `report_count` int(11) NULL DEFAULT NULL COMMENT '故障维护通知',
  `desktop_computer` int(11) NULL DEFAULT NULL COMMENT '台式电脑',
  `screen_inch43` int(11) NULL DEFAULT NULL COMMENT '43寸屏幕',
  `computer_monitor` int(11) NULL DEFAULT NULL COMMENT '电脑显示器',
  `ups` int(11) NULL DEFAULT NULL COMMENT 'ups',
  `modem_router` int(11) NULL DEFAULT NULL COMMENT '调制解调器路由器',
  `mouse` int(11) NULL DEFAULT NULL COMMENT '鼠标',
  `keyboard` int(11) NULL DEFAULT NULL COMMENT '键盘',
  `internet_signal` int(11) NULL DEFAULT NULL COMMENT '网络信号',
  `is_deleted` int(11) NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_index`(`company_id`, `month`, `fleet_id`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_monthly_fault_platform
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_monthly_fault_rate
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_fault_rate`;
CREATE TABLE `ledger_monthly_fault_rate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `month` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月份',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `contract_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属合同',
  `vehicles_count` int(11) NULL DEFAULT NULL COMMENT '车辆总数',
  `devices_count` int(11) NULL DEFAULT NULL COMMENT '车上设备总数',
  `report_count` int(11) NULL DEFAULT NULL COMMENT '故障报修通知数量',
  `fault_rate` decimal(18, 2) NULL DEFAULT NULL COMMENT '故障率',
  `corrected_count` int(11) NULL DEFAULT NULL COMMENT '上报后处理过的数量',
  `corrected_percentage` decimal(18, 2) NULL DEFAULT NULL COMMENT '上报故障处理了的占比',
  `normal_count` int(11) NULL DEFAULT NULL COMMENT '上报后但是正常的数量',
  `normal_percentage` decimal(18, 2) NULL DEFAULT NULL COMMENT '上报故障是正常的占比',
  `is_deleted` int(11) NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nk_index`(`company_id`, `month`, `fleet_id`) USING BTREE,
  INDEX `ik_index`(`company_id`, `month`, `fleet_id`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_monthly_fault_rate
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_monthly_fault_report
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_fault_report`;
CREATE TABLE `ledger_monthly_fault_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `month` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月份',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `contract_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属合同',
  `report_count` int(11) NULL DEFAULT NULL COMMENT '上报次数',
  `solved` int(11) NULL DEFAULT NULL COMMENT '已解决',
  `unsolved` int(11) NULL DEFAULT NULL COMMENT '未解决',
  `all_devices` int(11) NULL DEFAULT NULL COMMENT '总设备数量',
  `all_solved` int(11) NULL DEFAULT NULL COMMENT '已解决设备数量',
  `all_unsolved` int(11) NULL DEFAULT NULL COMMENT '未解决设备数据',
  `is_deleted` int(11) NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_index`(`company_id`, `month`, `fleet_id`, `contract_no`, `is_deleted`) USING BTREE,
  INDEX `normal_index`(`company_id`, `month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_monthly_fault_report
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_monthly_route
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_route`;
CREATE TABLE `ledger_monthly_route`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `start_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '开始日期',
  `end_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '结束日期',
  `day_count` smallint(6) NOT NULL COMMENT '当月天数',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `company_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业名称',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路名称',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `car_own_count` int(11) NOT NULL DEFAULT 0 COMMENT '配车',
  `car_use_count` int(11) NOT NULL DEFAULT 0 COMMENT '出车',
  `car_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '车辆出勤率',
  `emp_own_count` int(11) NOT NULL COMMENT ' 司机配额',
  `emp_use_count` int(11) NOT NULL DEFAULT 0 COMMENT '出勤员工',
  `emp_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '员工出勤率',
  `plan_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '计划趟次',
  `real_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '实际趟次',
  `trip_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '趟次兑现率',
  `total_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '全部里程',
  `plan_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '计划里程',
  `real_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '实际里程',
  `gps_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT 'GPS里程',
  `contract_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '包车里程',
  `idle_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '非运营里程',
  `record_count` int(11) NOT NULL DEFAULT 0 COMMENT '计划完成记录数',
  `except_count` int(11) NOT NULL DEFAULT 0 COMMENT '行车异常记录数',
  `work_time` int(11) NOT NULL DEFAULT 0 COMMENT '工作时长',
  `trave_time` int(11) NOT NULL DEFAULT 0 COMMENT '行驶时长',
  `first_last_count` int(11) NOT NULL DEFAULT 0 COMMENT '首班考核次数',
  `first_last_on_time` int(11) NOT NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int(11) NOT NULL DEFAULT 0 COMMENT '发车考核次数',
  `depart_on_time` int(11) NOT NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int(11) NOT NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int(11) NOT NULL DEFAULT 0 COMMENT '大站考核准点数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int(11) NOT NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int(11) NOT NULL DEFAULT 0 COMMENT '全程用时准点记录数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `over_speed_count` int(11) NOT NULL DEFAULT 0 COMMENT '超速记录次数',
  `monitor_large_interval` int(11) NOT NULL DEFAULT 0 COMMENT '发车大间隔',
  `monitor_bunching_count` int(11) NOT NULL DEFAULT 0 COMMENT '串车次数',
  `monitor_scatter_count` int(11) NOT NULL DEFAULT 0 COMMENT '大间隔次数',
  `monitor_long_wait` int(11) NOT NULL DEFAULT 0 COMMENT '长时间等待',
  `monitor_long_parking` int(11) NOT NULL DEFAULT 0 COMMENT '长时间停靠',
  `operational_time_expected` int(11) NULL DEFAULT 0 COMMENT '计划总时长(秒), 计划到达-计划发车',
  `operational_time_actual` int(11) NULL DEFAULT 0 COMMENT '实际总时长(秒), 实际到达-实际发车',
  `non_operational_time` int(11) NULL DEFAULT 0 COMMENT '非运营时长(秒)',
  `rest_time` int(11) NULL DEFAULT 0 COMMENT '休息时长(秒)',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `sort_id` int(11) NULL DEFAULT NULL COMMENT '排序',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cwr`(`company_id`, `month`, `route_id`) USING BTREE,
  INDEX `idx_crw`(`company_id`, `route_id`, `month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ledger_monthly_route
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_monthly_safety_score
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_safety_score`;
CREATE TABLE `ledger_monthly_safety_score`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '企业驾驶员主动安全评分台账',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `month` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '月度',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '车牌号',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '归属线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属线路名称',
  `vehicle_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '车型',
  `fixed_emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '固定驾驶员编号',
  `fixed_emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '固定驾驶员姓名',
  `fixed_emp_phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '联系电话',
  `speeding_times` int(11) NULL DEFAULT 0 COMMENT '超速次数',
  `abnormal_times` int(11) NULL DEFAULT NULL COMMENT '异常次数',
  `monthly_mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '月度里程',
  `check_days` int(11) NOT NULL DEFAULT 0 COMMENT '考核天数',
  `use_days` int(11) NOT NULL DEFAULT 0 COMMENT '出车天数',
  `final_score` decimal(11, 1) NOT NULL DEFAULT 100.0 COMMENT '最终评分',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '月度申述详情',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_company_emp`(`company_id`, `month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单人月度台账' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_monthly_safety_score
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_time_route
-- ----------------------------
DROP TABLE IF EXISTS `ledger_time_route`;
CREATE TABLE `ledger_time_route`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `company_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业名称',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路名称',
  `event_time` datetime NOT NULL COMMENT '记录时间段',
  `is_dispatch` smallint(6) NOT NULL DEFAULT 0 COMMENT '当天是否调度',
  `car_own_count` int(11) NOT NULL DEFAULT 0 COMMENT '配车',
  `car_use_count` int(11) NOT NULL DEFAULT 0 COMMENT '出车',
  `car_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '车辆出勤率',
  `emp_own_count` int(11) NOT NULL DEFAULT 0 COMMENT '司机配额',
  `emp_use_count` int(11) NOT NULL DEFAULT 0 COMMENT '出勤员工',
  `emp_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '员工出勤率',
  `plan_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '计划趟次',
  `real_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '实际趟次',
  `trip_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '趟次兑现率',
  `total_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '全部里程',
  `plan_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '计划里程',
  `real_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '实际里程',
  `gps_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT 'GPS里程',
  `contract_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '包车里程',
  `idle_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '非运营里程',
  `record_count` int(11) NOT NULL DEFAULT 0 COMMENT '计划完成记录数',
  `except_count` int(11) NOT NULL DEFAULT 0 COMMENT '行车异常记录数',
  `work_time` int(11) NOT NULL DEFAULT 0 COMMENT '工作时长',
  `trave_time` int(11) NOT NULL DEFAULT 0 COMMENT '行驶时长',
  `first_last_count` int(11) NULL DEFAULT 0 COMMENT '首班考核次数',
  `first_last_on_time` int(11) NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int(11) NULL DEFAULT 0 COMMENT '发车考核次数',
  `depart_on_time` int(11) NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int(11) NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int(11) NULL DEFAULT 0 COMMENT '大站考核准点数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int(11) NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int(11) NULL DEFAULT 0 COMMENT '全程用时准点记录数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `over_speed_count` int(11) NOT NULL DEFAULT 0 COMMENT '超速记录次数',
  `monitor_large_interval` int(11) NOT NULL DEFAULT 0 COMMENT '发车大间隔',
  `monitor_bunching_count` int(11) NOT NULL DEFAULT 0 COMMENT '串车次数',
  `monitor_scatter_count` int(11) NOT NULL DEFAULT 0 COMMENT '大间隔',
  `monitor_long_wait` int(11) NOT NULL DEFAULT 0 COMMENT '长时间等待',
  `monitor_long_parking` int(11) NOT NULL DEFAULT 0 COMMENT '长时间停靠',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cwr`(`company_id`, `work_date`, `route_id`) USING BTREE,
  INDEX `idx_crw`(`company_id`, `route_id`, `work_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_time_route
-- ----------------------------

-- ----------------------------
-- Table structure for log_attendance
-- ----------------------------
DROP TABLE IF EXISTS `log_attendance`;
CREATE TABLE `log_attendance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考勤签到记录',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'yyyy-mm-dd日期 忽略时区',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `check_flag` smallint(6) NOT NULL DEFAULT 0 COMMENT '1签到 2签退',
  `check_time` datetime NOT NULL COMMENT '签到/签退时间',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到车辆',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到车辆归属线路',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到设备',
  `physical_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡片ID',
  `sign_in_type` smallint(6) NULL DEFAULT NULL COMMENT '1上班 2下班 3签到 4签退 5例检',
  `sign_in_origin` smallint(6) NULL DEFAULT NULL COMMENT '考勤方式 1员工卡考勤 2输工号考勤 自定义200=GPS附加, 210透传 255调度员签到',
  `create_account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_date_route`(`company_id`, `work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_attendance
-- ----------------------------

-- ----------------------------
-- Table structure for log_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `log_dispatch`;
CREATE TABLE `log_dispatch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '调度操作日志',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `cmd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调度指令',
  `content` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指令内容',
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_date_route`(`company_id`, `work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_dispatch
-- ----------------------------

-- ----------------------------
-- Table structure for log_dsp
-- ----------------------------
DROP TABLE IF EXISTS `log_dsp`;
CREATE TABLE `log_dsp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日期',
  `event_id` smallint(6) NOT NULL DEFAULT 0 COMMENT '事件ID',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路名称',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `run_state` int(11) NOT NULL DEFAULT 0 COMMENT '0运营 1包车 10短休 >10加油  100退出运营等',
  `in_field` smallint(6) NOT NULL DEFAULT 1 COMMENT '在场内 0场外 1场内',
  `direction` smallint(6) NOT NULL DEFAULT 1 COMMENT '方向',
  `plan_id` int(11) NULL DEFAULT NULL COMMENT '计划表ID',
  `plan_depart` datetime NULL DEFAULT NULL COMMENT '计划发车',
  `log_text` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time_route`(`company_id`, `event_time`, `route_id`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `event_time`) USING BTREE,
  INDEX `idx_work_date`(`company_id`, `work_date`, `route_id`, `car_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_dsp
-- ----------------------------
INSERT INTO `log_dsp` VALUES (1, '10001', '2025-05-13', 1, '2025-05-13 09:15:42', 'ROU000001', '1路', 'CAR000001', '18270240064', 100, 0, 1, 0, NULL, '{\"remark\":\"\"}', '2025-05-13 09:15:42', '2025-05-13 09:15:42');
INSERT INTO `log_dsp` VALUES (2, '10001', '2025-05-13', 1, '2025-05-13 10:51:56', 'ROU000001', '1路', 'CAR000001', '18270240064', 100, 0, 1, 0, NULL, '{\"remark\":\"\"}', '2025-05-13 10:51:55', '2025-05-13 10:51:55');

-- ----------------------------
-- Table structure for log_event
-- ----------------------------
DROP TABLE IF EXISTS `log_event`;
CREATE TABLE `log_event`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆事件日志',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备ID',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `event_id` smallint(6) NOT NULL COMMENT '1上线 2下线 3签到 4签退 ',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `direction` smallint(6) NULL DEFAULT NULL COMMENT '方向 1下行2上行',
  `serial` smallint(6) NULL DEFAULT NULL COMMENT '站序',
  `event_time` datetime NULL DEFAULT NULL COMMENT '发生时间OccurTime',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `route_code` int(11) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_date_route`(`company_id`, `work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_event
-- ----------------------------

-- ----------------------------
-- Table structure for log_login
-- ----------------------------
DROP TABLE IF EXISTS `log_login`;
CREATE TABLE `log_login`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆成功uid',
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆成功令牌',
  `login_in` datetime NOT NULL COMMENT '登陆时间',
  `login_out` datetime NULL DEFAULT NULL COMMENT '退出时间',
  `login_out_type` smallint(6) NULL DEFAULT NULL COMMENT '过期退出标识, 1过期退出',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `origin` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APP或WEB',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_token`(`token`) USING BTREE,
  INDEX `idx_login`(`company_id`, `login_in`) USING BTREE,
  INDEX `idx_user`(`user_id`, `login_in`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_login
-- ----------------------------
INSERT INTO `log_login` VALUES (1, '100', 'UID000001', 'sysadmin', 'TOKEN:BUS:e0ab839a03274313871968b29602c3b6', '2025-05-13 08:46:16', '2025-05-13 08:48:57', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 08:46:15', '2025-05-13 08:48:56');
INSERT INTO `log_login` VALUES (2, '10001', 'UID010001', 'gongcheng@admin', 'TOKEN:BUS:e3709a35289e4ceba8b8f0b8a197108d', '2025-05-13 08:49:04', '2025-05-13 08:49:21', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 08:49:03', '2025-05-13 08:49:20');
INSERT INTO `log_login` VALUES (3, '100', 'UID000001', 'sysadmin', 'TOKEN:BUS:57d44636e3304ab99c4d1a856f35d5d2', '2025-05-13 08:49:29', '2025-05-13 08:53:39', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 08:49:29', '2025-05-13 08:53:38');
INSERT INTO `log_login` VALUES (4, '10001', 'UID010001', 'gongcheng@admin', 'TOKEN:BUS:6c0b0769885b428e947f1a0b6b96452b', '2025-05-13 08:53:44', '2025-05-13 10:34:23', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 08:53:44', '2025-05-13 10:34:23');
INSERT INTO `log_login` VALUES (5, '100', 'UID000001', 'sysadmin', 'TOKEN:BUS:ff498e60bde64771b226f7bfc9ebc5a3', '2025-05-13 10:34:29', '2025-05-13 10:34:44', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 10:34:28', '2025-05-13 10:34:44');
INSERT INTO `log_login` VALUES (6, '10001', 'UID010001', 'gongcheng@admin', 'TOKEN:BUS:84da15c64b6f437cace42b6166c0fb7c', '2025-05-13 10:34:51', '2025-05-13 10:34:59', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 10:34:50', '2025-05-13 10:34:59');
INSERT INTO `log_login` VALUES (7, '100', 'UID000001', 'sysadmin', 'TOKEN:BUS:f3e664c9625f4d2985a404ffd3d16b67', '2025-05-13 10:35:04', '2025-05-13 10:38:11', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 10:35:04', '2025-05-13 10:38:11');
INSERT INTO `log_login` VALUES (8, '10001', 'UID010001', 'gongcheng@admin', 'TOKEN:BUS:c97ce9b062a94b9486b804d8f269395c', '2025-05-13 10:38:16', '2025-05-13 10:38:31', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 10:38:16', '2025-05-13 10:38:31');
INSERT INTO `log_login` VALUES (9, '100', 'UID000001', 'sysadmin', 'TOKEN:BUS:38568bb0bd694c23882fde2da8319c85', '2025-05-13 10:38:37', '2025-05-13 10:50:36', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 10:38:36', '2025-05-13 10:50:35');
INSERT INTO `log_login` VALUES (10, '10001', 'UID010001', 'gongcheng@admin', 'TOKEN:BUS:476d9e9207884d54aca96c0f24b87e7d', '2025-05-13 10:50:41', '2025-05-13 11:42:48', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 10:50:41', '2025-05-13 11:42:48');
INSERT INTO `log_login` VALUES (11, '10001', 'UID010001', 'gongcheng@admin', 'TOKEN:BUS:0553e659b60b42c484ad8cf449173025', '2025-05-13 11:04:12', NULL, NULL, '119.28.86.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-13 11:04:12', '2025-05-13 11:04:12');
INSERT INTO `log_login` VALUES (12, '10001', 'UID010001', 'gongcheng@admin', 'TOKEN:BUS:e497d62f6c6546f286608a33a3c0e3ba', '2025-05-13 11:12:39', '2025-05-13 11:28:53', 1, '113.84.129.167', 'Dart/3.3 (dart:io)', '2025-05-13 11:12:39', '2025-05-13 11:28:52');
INSERT INTO `log_login` VALUES (13, '10001', 'UID010001', 'gongcheng@admin', 'TOKEN:BUS:9a813cad7ff4438da30cca78d48f8ba4', '2025-05-13 11:42:54', '2025-05-13 11:43:02', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 11:42:54', '2025-05-13 11:43:01');
INSERT INTO `log_login` VALUES (14, '100', 'UID000001', 'sysadmin', 'TOKEN:BUS:67305e2b65c64ea8a45efd938b345bdc', '2025-05-13 11:43:06', '2025-05-13 11:48:42', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 11:43:06', '2025-05-13 11:48:42');
INSERT INTO `log_login` VALUES (15, '10001', 'UID010001', 'gongcheng@admin', 'TOKEN:BUS:4ee2294855fc45619efd1c6bea067170', '2025-05-13 11:48:49', '2025-05-13 11:50:59', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 11:48:48', '2025-05-13 11:50:59');
INSERT INTO `log_login` VALUES (16, '100', 'UID000001', 'sysadmin', 'TOKEN:BUS:924eb1ae41a844c2a87cc66601298619', '2025-05-13 11:51:08', '2025-05-13 11:51:25', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 11:51:07', '2025-05-13 11:51:25');
INSERT INTO `log_login` VALUES (17, '10001', 'UID010001', 'gongcheng@admin', 'TOKEN:BUS:4996ef4dfe1444cbb163de9bfe6ec6b5', '2025-05-13 11:51:30', '2025-05-13 11:54:19', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 11:51:30', '2025-05-13 11:54:19');
INSERT INTO `log_login` VALUES (18, '100', 'UID000001', 'sysadmin', 'TOKEN:BUS:e9d876ae87b24cd4bfe16b98998e5370', '2025-05-13 11:54:25', '2025-05-13 11:54:38', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 11:54:24', '2025-05-13 11:54:37');
INSERT INTO `log_login` VALUES (19, '10001', 'UID010001', 'gongcheng@admin', 'TOKEN:BUS:4b12fea059514c28b03a91fc743958da', '2025-05-13 11:54:43', '2025-05-13 11:55:03', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 11:54:42', '2025-05-13 11:55:02');
INSERT INTO `log_login` VALUES (20, '100', 'UID000001', 'sysadmin', 'TOKEN:BUS:d387418f1bbc4c53b7c3373a627bc1c2', '2025-05-13 11:55:09', '2025-05-13 11:55:22', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 11:55:09', '2025-05-13 11:55:22');
INSERT INTO `log_login` VALUES (21, '10001', 'UID010001', 'gongcheng@admin', 'TOKEN:BUS:ffcf8de0b675443e8065065a961393ff', '2025-05-13 11:55:26', '2025-05-13 11:56:02', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 11:55:26', '2025-05-13 11:56:02');
INSERT INTO `log_login` VALUES (22, '100', 'UID000001', 'sysadmin', 'TOKEN:BUS:639e7f49e1a34b1497059c2001c46a5c', '2025-05-13 11:56:07', '2025-05-13 11:56:21', NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 11:56:07', '2025-05-13 11:56:21');
INSERT INTO `log_login` VALUES (23, '10001', 'UID010001', 'gongcheng@admin', 'TOKEN:BUS:6cd4d6245de441838048fdbb94bec19c', '2025-05-13 11:56:28', NULL, NULL, '183.14.31.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-13 11:56:28', '2025-05-13 11:56:28');

-- ----------------------------
-- Table structure for log_message
-- ----------------------------
DROP TABLE IF EXISTS `log_message`;
CREATE TABLE `log_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '自编号码',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `msg` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息',
  `send_time` datetime NOT NULL COMMENT '发送时间',
  `send_state` smallint(6) NOT NULL DEFAULT 0 COMMENT '应答结果 0默认 1发送中 2已发送',
  `reply_time` datetime NULL DEFAULT NULL,
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `character_set` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字符集',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端下发唯一标识',
  `flag` int(11) NULL DEFAULT NULL COMMENT '发送标志位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_send_time`(`company_id`, `send_time`) USING BTREE,
  INDEX `idx_date_car`(`company_id`, `work_date`, `car_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_message
-- ----------------------------

-- ----------------------------
-- Table structure for log_open_platform
-- ----------------------------
DROP TABLE IF EXISTS `log_open_platform`;
CREATE TABLE `log_open_platform`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '开放平台开发者账号',
  `company_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `app_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开发ID',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_service`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '开放平台开发者账号' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_open_platform
-- ----------------------------

-- ----------------------------
-- Table structure for log_plan_change
-- ----------------------------
DROP TABLE IF EXISTS `log_plan_change`;
CREATE TABLE `log_plan_change`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `plan_id` int(10) UNSIGNED NOT NULL COMMENT '计划表的ID',
  `before_plan_json` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作前的计划对象',
  `after_plan_json` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改后的计划ID',
  `action_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户ID',
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作账号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_plan_id`(`plan_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_company`(`company_id`, `work_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_plan_change
-- ----------------------------

-- ----------------------------
-- Table structure for log_station
-- ----------------------------
DROP TABLE IF EXISTS `log_station`;
CREATE TABLE `log_station`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆进出站',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` smallint(6) NOT NULL DEFAULT 0 COMMENT '1进站 2出站',
  `route_code` int(11) NULL DEFAULT NULL,
  `direction` smallint(6) NULL DEFAULT NULL COMMENT '方向 1下行2上行',
  `station_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `serial` smallint(6) NULL DEFAULT NULL COMMENT '站序',
  `lng` decimal(11, 6) NULL DEFAULT NULL,
  `lat` decimal(11, 6) NULL DEFAULT NULL,
  `mileage` decimal(11, 3) NULL DEFAULT NULL,
  `event_time` datetime NULL DEFAULT NULL COMMENT '发生时间OccurTime',
  `plan_id` int(11) NULL DEFAULT NULL COMMENT '执行中的计划ID',
  `plan_depart` datetime NULL DEFAULT NULL COMMENT '计划发车',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_station`(`company_id`, `work_date`, `route_id`, `car_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_station
-- ----------------------------

-- ----------------------------
-- Table structure for log_system
-- ----------------------------
DROP TABLE IF EXISTS `log_system`;
CREATE TABLE `log_system`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `action_url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `change_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '变化部分JSON',
  `location` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行模块',
  `methods` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行方法',
  `code` int(11) NULL DEFAULT NULL COMMENT 'api返回code',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `origin` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APP或WEB',
  `user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`company_id`, `create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_system
-- ----------------------------
INSERT INTO `log_system` VALUES (1, '100', '/api/system/company', NULL, 'SystemCompanyController', 'POST', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"param\":{\"id\":2,\"company_name\":\"gongcheng\",\"title\":\"恭城公交\",\"logo\":\"\",\"remark\":\"\",\"account\":\"gongcheng@admin\",\"level\":20,\"sort_id\":0,\"create_user_id\":\"UID000001\",\"archive_time\":7,\"monthly_start_date\":1,\"lng\":110.817484,\"lat\":24.838551,\"language\":\"zh\",\"company_config\":{\"disable_auto_schedule\":false,\"multiple_search_limit\":60,\"alarm_safety_list\":[],\"gps_deviation_excluded\":false},\"time_zone\":\"+08:00\",\"morning_peak\":\"07:00-09:00\",\"late_peak\":\"17:00-19:00\",\"authorized_vehicle_count\":100,\"gid\":\"10001\",\"pid\":\"100\"}}', '2025-05-13 08:48:45', '2025-05-13 08:48:45');
INSERT INTO `log_system` VALUES (2, '100', '/api/system/company', NULL, 'SystemCompanyController', 'PUT', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"param\":{\"id\":2,\"create_time\":1747126124000,\"update_time\":1747126124000,\"company_name\":\"恭城公交\",\"title\":\"恭城公交\",\"logo\":\"\",\"remark\":\"\",\"account\":\"gongcheng@admin\",\"level\":20,\"sort_id\":0,\"create_user_id\":\"UID000001\",\"archive_time\":7,\"monthly_start_date\":1,\"lng\":110.817484,\"lat\":24.838551,\"language\":\"zh\",\"company_config\":{\"disable_auto_schedule\":false,\"multiple_search_limit\":60,\"alarm_safety_list\":[],\"gps_deviation_excluded\":false},\"time_zone\":\"+08:00\",\"morning_peak\":\"07:00-09:00\",\"late_peak\":\"17:00-19:00\",\"authorized_vehicle_count\":100,\"gid\":\"10001\",\"pid\":\"100\"}}', '2025-05-13 08:48:52', '2025-05-13 08:48:52');
INSERT INTO `log_system` VALUES (3, '100', '/api/system/company/module', NULL, 'SystemCompanyModuleController', 'POST', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"param\":{\"company_id\":\"10001\",\"module_list\":[\"MOD000130\",\"MOD000115\",\"MOD000137\",\"MOD000138\",\"MOD000129\",\"MOD000114\",\"MOD000001\",\"MOD000002\",\"MOD000004\",\"MOD000014\",\"MOD000006\",\"MOD000008\",\"MOD000098\",\"MOD000009\",\"MOD000010\",\"MOD000012\",\"MOD000013\",\"MOD000005\",\"MOD000016\",\"MOD000017\",\"MOD000069\",\"MOD000085\",\"MOD000086\",\"MOD000105\",\"MOD000087\",\"MOD000135\",\"MOD000146\",\"MOD000088\",\"MOD000147\",\"MOD000089\",\"MOD000090\",\"MOD000091\",\"MOD000018\",\"MOD000019\",\"MOD000020\",\"MOD000021\",\"MOD000022\",\"MOD000023\",\"MOD000064\",\"MOD000065\",\"MOD000107\",\"MOD000120\",\"MOD000121\",\"MOD000123\",\"MOD000125\",\"MOD000126\",\"MOD000127\",\"MOD000128\",\"MOD000024\",\"MOD000025\",\"MOD000026\",\"MOD000027\",\"MOD000028\",\"MOD000029\",\"MOD000030\",\"MOD000104\",\"MOD000031\",\"MOD000059\",\"MOD000060\",\"MOD000071\",\"MOD000061\",\"MOD000119\",\"MOD000077\",\"MOD000101\",\"MOD000122\",\"MOD000075\",\"MOD000051\",\"MOD000058\",\"MOD000053\",\"MOD000054\",\"MOD000106\",\"MOD000078\",\"MOD000109\",\"MOD000111\",\"MOD000072\",\"MOD000110\",\"MOD000073\",\"MOD000080\",\"MOD000139\",\"MOD000140\",\"MOD000141\",\"MOD000142\",\"MOD000092\",\"MOD000094\",\"MOD000102\",\"MOD000103\",\"MOD000095\",\"MOD000099\",\"MOD000074\",\"MOD000052\",\"MOD000046\",\"MOD000047\",\"MOD000048\",\"MOD000049\",\"MOD000050\",\"MOD000079\",\"MOD000081\",\"MOD000082\",\"MOD000083\",\"MOD000113\",\"MOD000148\",\"MOD000032\",\"MOD000044\",\"MOD000045\",\"MOD000093\",\"MOD000096\",\"MOD000097\",\"MOD000033\",\"MOD000038\",\"MOD000134\",\"MOD000133\",\"MOD000136\",\"MOD000149\",\"MOD000150\",\"MOD000034\",\"MOD000035\",\"MOD000036\",\"MOD000037\",\"MOD000062\",\"MOD000063\",\"MOD000143\",\"MOD000144\",\"MOD000145\"],\"check_list\":[1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,0,0,0,0,1,1,1,1,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,0,0,0]}}', '2025-05-13 08:50:29', '2025-05-13 08:50:29');
INSERT INTO `log_system` VALUES (4, '100', '/api/system/company/module', NULL, 'SystemCompanyModuleController', 'POST', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"param\":{\"company_id\":\"10001\",\"module_list\":[\"MOD000130\",\"MOD000115\",\"MOD000137\",\"MOD000129\",\"MOD000114\",\"MOD000001\",\"MOD000002\",\"MOD000004\",\"MOD000014\",\"MOD000006\",\"MOD000176\",\"MOD000008\",\"MOD000098\",\"MOD000009\",\"MOD000177\",\"MOD000010\",\"MOD000012\",\"MOD000013\",\"MOD000116\",\"MOD000117\",\"MOD000118\",\"MOD000172\",\"MOD000178\",\"MOD000179\",\"MOD000183\",\"MOD000005\",\"MOD000016\",\"MOD000017\",\"MOD000069\",\"MOD000085\",\"MOD000086\",\"MOD000105\",\"MOD000087\",\"MOD000175\",\"MOD000135\",\"MOD000146\",\"MOD000088\",\"MOD000147\",\"MOD000089\",\"MOD000159\",\"MOD000090\",\"MOD000091\",\"MOD000160\",\"MOD000018\",\"MOD000019\",\"MOD000188\",\"MOD000020\",\"MOD000021\",\"MOD000022\",\"MOD000023\",\"MOD000064\",\"MOD000065\",\"MOD000107\",\"MOD000120\",\"MOD000121\",\"MOD000123\",\"MOD000125\",\"MOD000126\",\"MOD000127\",\"MOD000128\",\"MOD000151\",\"MOD000157\",\"MOD000024\",\"MOD000025\",\"MOD000026\",\"MOD000027\",\"MOD000028\",\"MOD000029\",\"MOD000030\",\"MOD000104\",\"MOD000155\",\"MOD000031\",\"MOD000059\",\"MOD000060\",\"MOD000071\",\"MOD000061\",\"MOD000119\",\"MOD000077\",\"MOD000101\",\"MOD000122\",\"MOD000075\",\"MOD000051\",\"MOD000058\",\"MOD000053\",\"MOD000054\",\"MOD000106\",\"MOD000078\",\"MOD000109\",\"MOD000111\",\"MOD000112\",\"MOD000072\",\"MOD000110\",\"MOD000073\",\"MOD000080\",\"MOD000139\",\"MOD000140\",\"MOD000141\",\"MOD000142\",\"MOD000092\",\"MOD000094\",\"MOD000102\",\"MOD000103\",\"MOD000152\",\"MOD000153\",\"MOD000095\",\"MOD000173\",\"MOD000181\",\"MOD000186\",\"MOD000099\",\"MOD000156\",\"MOD000164\",\"MOD000074\",\"MOD000052\",\"MOD000046\",\"MOD000047\",\"MOD000048\",\"MOD000049\",\"MOD000050\",\"MOD000079\",\"MOD000081\",\"MOD000082\",\"MOD000083\",\"MOD000113\",\"MOD000133\",\"MOD000148\",\"MOD000182\",\"MOD000184\",\"MOD000185\",\"MOD000032\",\"MOD000044\",\"MOD000045\",\"MOD000093\",\"MOD000096\",\"MOD000097\",\"MOD000033\",\"MOD000038\",\"MOD000134\",\"MOD000136\",\"MOD000149\",\"MOD000154\",\"MOD000161\",\"MOD000162\",\"MOD000034\",\"MOD000035\",\"MOD000036\",\"MOD000037\",\"MOD000062\",\"MOD000163\",\"MOD000063\",\"MOD000041\",\"MOD000143\",\"MOD000138\",\"MOD000187\",\"MOD000144\",\"MOD000145\"],\"check_list\":[1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,0,1,0,0,0,0,0,0,1,0,1,1,0,1,1,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,0,0,0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0]}}', '2025-05-13 08:52:46', '2025-05-13 08:52:46');
INSERT INTO `log_system` VALUES (5, '100', '/api/system/module', NULL, 'SystemModuleController', 'PUT', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"param\":{\"id\":235,\"create_time\":1641959076000,\"update_time\":1641959076000,\"title\":\"device_alarm\",\"name\":\"DeviceAlarm\",\"icon\":\"al-icon-genderless\",\"path\":\"device-alarm\",\"vue\":\"views/set/menu/device-alarm\",\"opt\":15,\"is_ctrl\":1,\"is_hide\":0,\"api\":\"/api/data/device-alarm\",\"sort_id\":51060,\"remark\":\"终端报警\",\"perms\":[],\"gid\":\"MOD000161\",\"pid\":\"MOD000038\"}}', '2025-05-13 08:53:04', '2025-05-13 08:53:04');
INSERT INTO `log_system` VALUES (6, '100', '/api/system/module', NULL, 'SystemModuleController', 'PUT', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"param\":{\"id\":227,\"create_time\":1629876224000,\"update_time\":1629876224000,\"title\":\"platform_alarm\",\"name\":\"PlatformAlarm\",\"icon\":\"al-icon-genderless\",\"path\":\"platform-alarm\",\"vue\":\"views/set/menu/platform-alarm\",\"opt\":15,\"is_ctrl\":1,\"is_hide\":0,\"api\":\"/api/data/platform-alarm\",\"sort_id\":51050,\"remark\":\"平台报警\",\"perms\":[],\"gid\":\"MOD000154\",\"pid\":\"MOD000038\"}}', '2025-05-13 08:53:07', '2025-05-13 08:53:07');
INSERT INTO `log_system` VALUES (7, '100', '/api/system/company/module', NULL, 'SystemCompanyModuleController', 'POST', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"param\":{\"company_id\":\"10001\",\"module_list\":[\"MOD000130\",\"MOD000115\",\"MOD000137\",\"MOD000129\",\"MOD000114\",\"MOD000001\",\"MOD000002\",\"MOD000004\",\"MOD000014\",\"MOD000006\",\"MOD000176\",\"MOD000008\",\"MOD000098\",\"MOD000009\",\"MOD000177\",\"MOD000010\",\"MOD000012\",\"MOD000013\",\"MOD000116\",\"MOD000117\",\"MOD000118\",\"MOD000172\",\"MOD000178\",\"MOD000179\",\"MOD000183\",\"MOD000005\",\"MOD000016\",\"MOD000017\",\"MOD000069\",\"MOD000085\",\"MOD000086\",\"MOD000105\",\"MOD000087\",\"MOD000175\",\"MOD000135\",\"MOD000146\",\"MOD000088\",\"MOD000147\",\"MOD000089\",\"MOD000159\",\"MOD000090\",\"MOD000091\",\"MOD000160\",\"MOD000018\",\"MOD000019\",\"MOD000188\",\"MOD000020\",\"MOD000021\",\"MOD000022\",\"MOD000023\",\"MOD000064\",\"MOD000065\",\"MOD000107\",\"MOD000120\",\"MOD000121\",\"MOD000123\",\"MOD000125\",\"MOD000126\",\"MOD000127\",\"MOD000128\",\"MOD000151\",\"MOD000157\",\"MOD000024\",\"MOD000025\",\"MOD000026\",\"MOD000027\",\"MOD000028\",\"MOD000029\",\"MOD000030\",\"MOD000104\",\"MOD000155\",\"MOD000031\",\"MOD000059\",\"MOD000060\",\"MOD000071\",\"MOD000061\",\"MOD000119\",\"MOD000077\",\"MOD000101\",\"MOD000122\",\"MOD000075\",\"MOD000051\",\"MOD000058\",\"MOD000053\",\"MOD000054\",\"MOD000106\",\"MOD000078\",\"MOD000109\",\"MOD000111\",\"MOD000112\",\"MOD000072\",\"MOD000110\",\"MOD000073\",\"MOD000080\",\"MOD000139\",\"MOD000140\",\"MOD000141\",\"MOD000142\",\"MOD000092\",\"MOD000094\",\"MOD000102\",\"MOD000103\",\"MOD000152\",\"MOD000153\",\"MOD000095\",\"MOD000173\",\"MOD000181\",\"MOD000186\",\"MOD000099\",\"MOD000156\",\"MOD000164\",\"MOD000074\",\"MOD000052\",\"MOD000046\",\"MOD000047\",\"MOD000048\",\"MOD000049\",\"MOD000050\",\"MOD000079\",\"MOD000081\",\"MOD000082\",\"MOD000083\",\"MOD000113\",\"MOD000133\",\"MOD000148\",\"MOD000182\",\"MOD000184\",\"MOD000185\",\"MOD000032\",\"MOD000044\",\"MOD000045\",\"MOD000093\",\"MOD000096\",\"MOD000097\",\"MOD000033\",\"MOD000038\",\"MOD000134\",\"MOD000136\",\"MOD000149\",\"MOD000162\",\"MOD000034\",\"MOD000035\",\"MOD000036\",\"MOD000037\",\"MOD000062\",\"MOD000163\",\"MOD000063\",\"MOD000041\",\"MOD000143\",\"MOD000138\",\"MOD000187\",\"MOD000144\",\"MOD000145\"],\"check_list\":[1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,0,1,0,0,0,0,0,0,1,0,1,1,0,1,1,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,0,0,0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,0,1,0,0,0,0,0,0,0]}}', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `log_system` VALUES (8, '10001', '/api/basic/fleets', NULL, 'BasicFleetController', 'POST', 0, '183.14.31.32', NULL, 'UID010001', 'gongcheng@admin', '{\"param\":{\"id\":1,\"company_id\":\"10001\",\"create_user_id\":\"UID010001\",\"fleet_name\":\"恭城公交\",\"computer_count\":0,\"remark\":\"\",\"category\":0,\"gid\":\"GRP000001\",\"pid\":\"\"}}', '2025-05-13 08:53:55', '2025-05-13 08:53:55');
INSERT INTO `log_system` VALUES (9, '10001', '/api/basic/routes', NULL, 'BasicRouteController', 'POST', 0, '183.14.31.32', NULL, 'UID010001', 'gongcheng@admin', '{\"param\":{\"id\":1,\"company_id\":\"10001\",\"create_user_id\":\"UID010001\",\"route_id\":\"ROU000001\",\"route_code\":11,\"route_name\":\"1路\",\"fleet_id\":\"GRP000001\",\"subsidiary_fleet_id\":\"\",\"state\":10,\"category\":0,\"travel\":0,\"ticket\":0,\"open_time\":1747126446003,\"sort_id\":11,\"remark\":\"\"}}', '2025-05-13 08:54:12', '2025-05-13 08:54:12');
INSERT INTO `log_system` VALUES (10, '10001', '/api/basic/cars', NULL, 'BasicCarController', 'POST', 0, '183.14.31.32', NULL, 'UID010001', 'gongcheng@admin', '{\"param\":{\"id\":1,\"company_id\":\"10001\",\"create_user_id\":\"UID010001\",\"car_id\":\"CAR000001\",\"car_name\":\"18270240064\",\"car_state\":0,\"vin\":\"\",\"lpn\":\"18270240064\",\"lpn_color\":5,\"fleet_id\":\"GRP000001\",\"route_id\":\"ROU000001\",\"img_url\":\"\",\"icon\":\"car\",\"register_time\":1747126461400,\"expire_time\":1778662461400,\"expire_verify\":\"0sz5OkypkZl50iIUiTJyNA==\",\"approved_number\":0,\"iode_fine\":\"\",\"contract_no\":\"\",\"equipment_count\":0,\"remark\":\"\",\"vehicle_type\":\"\",\"vehicle_type_id\":\"\",\"registration_number\":\"\",\"vehicle_model\":\"\",\"tax_due_date\":\"\",\"contract_expiration_date\":\"\",\"unit_id\":\"\",\"vehicle_options\":{},\"imei\":\"18270240064\",\"channel\":\"CH1,CH2,CH3,CH4,CH5,CH6,CH7,CH8\",\"time_zone\":\"GMT+08:00\",\"type_id\":\"DTY000124\"}}', '2025-05-13 08:54:43', '2025-05-13 08:54:43');
INSERT INTO `log_system` VALUES (11, '10001', '/api/system/av/srs', NULL, 'SystemAvSrsController', 'POST', 0, '183.14.31.32', NULL, 'UID010001', 'gongcheng@admin', '{\"systemAvSrs\":{\"id\":8,\"company_id\":\"10001\",\"node_id\":\"860731\",\"node_name\":\"gc\",\"push_rtmp_wan\":\"rtmp://36.212.31.166:9005/\",\"pull_rtmp_wan\":\"rtmp://36.212.31.166:9005/\",\"pull_http_wan\":\"http://36.212.31.166:9084/mdvr,http://36.212.31.166:9085/mdvr,http://36.212.31.166:9086/mdvr,http://36.212.31.166:9087/mdvr,http://36.212.31.166:9088/mdvr,http://36.212.31.166:9089/mdvr\",\"is_active\":1,\"sort_id\":100,\"rtp_tcp_port\":\"0\"}}', '2025-05-13 09:25:16', '2025-05-13 09:25:16');
INSERT INTO `log_system` VALUES (12, '10001', '/api/system/av/srs', NULL, 'SystemAvSrsController', 'PUT', 0, '183.14.31.32', NULL, 'UID010001', 'gongcheng@admin', '{\"systemAvSrs\":{\"id\":8,\"create_time\":1747128316000,\"update_time\":1747128316000,\"company_id\":\"10001\",\"node_id\":\"860731\",\"node_name\":\"gc\",\"push_rtmp_wan\":\"rtmp://36.212.31.166:9005/\",\"pull_rtmp_wan\":\"rtmp://36.212.31.166:9005/\",\"pull_http_wan\":\"http://36.212.31.166:9085/mdvr,http://36.212.31.166:9086/mdvr,http://36.212.31.166:9087/mdvr,http://36.212.31.166:9088/mdvr,http://36.212.31.166:9089/mdvr\",\"is_active\":1,\"sort_id\":100,\"rtp_tcp_port\":\"0\"}}', '2025-05-13 09:26:05', '2025-05-13 09:26:05');
INSERT INTO `log_system` VALUES (13, '10001', '/api/system/av/srs', NULL, 'SystemAvSrsController', 'PUT', 0, '183.14.31.32', NULL, 'UID010001', 'gongcheng@admin', '{\"systemAvSrs\":{\"id\":8,\"create_time\":1747128316000,\"update_time\":1747128365000,\"company_id\":\"10001\",\"node_id\":\"36.212.31.166\",\"node_name\":\"gc\",\"push_rtmp_wan\":\"rtmp://36.212.31.166:9005/\",\"pull_rtmp_wan\":\"rtmp://36.212.31.166:9005/\",\"pull_http_wan\":\"http://36.212.31.166:9085/mdvr,http://36.212.31.166:9086/mdvr,http://36.212.31.166:9087/mdvr,http://36.212.31.166:9088/mdvr,http://36.212.31.166:9089/mdvr\",\"is_active\":1,\"sort_id\":100,\"rtp_tcp_port\":\"0\"}}', '2025-05-13 09:29:28', '2025-05-13 09:29:28');
INSERT INTO `log_system` VALUES (14, '100', '/api/upload', NULL, 'UploadController', 'POST', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"data\":\"{\\\"path\\\":\\\"/img/company\\\",\\\"rename\\\":1}\"}', '2025-05-13 10:34:40', '2025-05-13 10:34:40');
INSERT INTO `log_system` VALUES (15, '100', '/api/system/company', NULL, 'SystemCompanyController', 'PUT', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"param\":{\"id\":2,\"create_time\":1747126124000,\"update_time\":1747126132000,\"company_name\":\"恭城公交\",\"title\":\"恭城公交\",\"logo\":\"/files/img/company/c68ff2f40cd54bb1850792de2599fee6.png\",\"remark\":\"\",\"account\":\"gongcheng@admin\",\"level\":20,\"sort_id\":0,\"create_user_id\":\"UID000001\",\"archive_time\":7,\"monthly_start_date\":1,\"lng\":110.817484,\"lat\":24.838551,\"language\":\"zh\",\"company_config\":{\"disable_auto_schedule\":false,\"multiple_search_limit\":60,\"alarm_safety_list\":[],\"gps_deviation_excluded\":false},\"time_zone\":\"+08:00\",\"morning_peak\":\"07:00-09:00\",\"late_peak\":\"17:00-19:00\",\"authorized_vehicle_count\":100,\"gid\":\"10001\",\"pid\":\"100\"}}', '2025-05-13 10:34:41', '2025-05-13 10:34:41');
INSERT INTO `log_system` VALUES (16, '100', '/api/upload', NULL, 'UploadController', 'POST', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"data\":\"{\\\"path\\\":\\\"/img/company\\\",\\\"rename\\\":1}\"}', '2025-05-13 10:35:15', '2025-05-13 10:35:15');
INSERT INTO `log_system` VALUES (17, '100', '/api/system/company', NULL, 'SystemCompanyController', 'PUT', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"param\":{\"id\":2,\"create_time\":1747126124000,\"update_time\":1747132481000,\"company_name\":\"恭城公交\",\"title\":\"恭城公交\",\"logo\":\"/files/img/company/775a6c0dbd72407ba8c2512100477b87.png\",\"remark\":\"\",\"account\":\"gongcheng@admin\",\"level\":20,\"sort_id\":0,\"create_user_id\":\"UID000001\",\"archive_time\":7,\"monthly_start_date\":1,\"lng\":110.817484,\"lat\":24.838551,\"language\":\"zh\",\"company_config\":{\"disable_auto_schedule\":false,\"multiple_search_limit\":60,\"alarm_safety_list\":[],\"gps_deviation_excluded\":false},\"time_zone\":\"+08:00\",\"morning_peak\":\"07:00-09:00\",\"late_peak\":\"17:00-19:00\",\"authorized_vehicle_count\":100,\"gid\":\"10001\",\"pid\":\"100\"}}', '2025-05-13 10:35:23', '2025-05-13 10:35:23');
INSERT INTO `log_system` VALUES (18, '100', '/api/upload', NULL, 'UploadController', 'POST', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"data\":\"{\\\"path\\\":\\\"/img/company\\\",\\\"rename\\\":1}\"}', '2025-05-13 10:36:16', '2025-05-13 10:36:16');
INSERT INTO `log_system` VALUES (19, '100', '/api/system/company', NULL, 'SystemCompanyController', 'PUT', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"param\":{\"id\":2,\"create_time\":1747126124000,\"update_time\":1747132523000,\"company_name\":\"恭城公交\",\"title\":\"恭城公交\",\"logo\":\"/files/img/company/1dec817dcd9e4a079f77dfa5acfccede.png\",\"remark\":\"\",\"account\":\"gongcheng@admin\",\"level\":20,\"sort_id\":0,\"create_user_id\":\"UID000001\",\"archive_time\":7,\"monthly_start_date\":1,\"lng\":110.817484,\"lat\":24.838551,\"language\":\"zh\",\"company_config\":{\"disable_auto_schedule\":false,\"multiple_search_limit\":60,\"alarm_safety_list\":[],\"gps_deviation_excluded\":false},\"time_zone\":\"+08:00\",\"morning_peak\":\"07:00-09:00\",\"late_peak\":\"17:00-19:00\",\"authorized_vehicle_count\":100,\"gid\":\"10001\",\"pid\":\"100\"}}', '2025-05-13 10:36:32', '2025-05-13 10:36:32');
INSERT INTO `log_system` VALUES (20, '10001', '/api/upload', NULL, 'UploadController', 'POST', 0, '119.28.86.14', NULL, 'UID010001', 'gongcheng@admin', '{\"data\":\"{\\\"path\\\":\\\"/img/user\\\",\\\"rename\\\":1}\"}', '2025-05-13 11:04:43', '2025-05-13 11:04:43');
INSERT INTO `log_system` VALUES (21, '10001', '/api/owner/user', NULL, 'OwnerUserController', 'PUT', 0, '119.28.86.14', NULL, 'UID010001', 'gongcheng@admin', '{\"ownerUserVo\":{\"id\":4,\"create_time\":1747126124000,\"update_time\":1747134252000,\"company_id\":\"10001\",\"create_user_id\":\"UID010001\",\"is_deleted\":0,\"parent_id\":\"\",\"account\":\"gongcheng@admin\",\"user_name\":\"gongcheng@admin\",\"role_flag\":1,\"img_url\":\"/files/img/user/96ca154acb7841ac9b50a18906aba703.jpg\",\"remark\":\"auto create\",\"password_change_time\":1747126125000,\"password_expire_days\":0,\"last_login_in_time\":1747134252000,\"max_login_allow\":3,\"encrypt\":0,\"role_id\":\"RID000001\",\"old_role_id\":\"\"}}', '2025-05-13 11:04:46', '2025-05-13 11:04:46');
INSERT INTO `log_system` VALUES (22, '10001', '/api/app/ad/banner', NULL, 'AppAdBannerController', 'POST', 0, '113.84.129.167', NULL, 'UID010001', 'gongcheng@admin', '{\"basicAdBanner\":{}}', '2025-05-13 11:12:39', '2025-05-13 11:12:39');
INSERT INTO `log_system` VALUES (23, '10001', '/api/app/position', NULL, 'AppGpsController', 'POST', 0, '113.84.129.167', NULL, 'UID010001', 'gongcheng@admin', '{\"param\":{\"imei\":\"\"}}', '2025-05-13 11:12:41', '2025-05-13 11:12:41');
INSERT INTO `log_system` VALUES (24, '10001', '/api/app/position', NULL, 'AppGpsController', 'POST', 0, '113.84.129.167', NULL, 'UID010001', 'gongcheng@admin', '{\"param\":{\"imei\":\"\"}}', '2025-05-13 11:12:41', '2025-05-13 11:12:41');
INSERT INTO `log_system` VALUES (25, '10001', '/api/upload', NULL, 'UploadController', 'POST', 0, '183.14.31.32', NULL, 'UID010001', 'gongcheng@admin', '{\"data\":\"{\\\"path\\\":\\\"/img/user\\\",\\\"rename\\\":1}\"}', '2025-05-13 11:42:32', '2025-05-13 11:42:32');
INSERT INTO `log_system` VALUES (26, '10001', '/api/owner/user', NULL, 'OwnerUserController', 'PUT', 0, '183.14.31.32', NULL, 'UID010001', 'gongcheng@admin', '{\"ownerUserVo\":{\"id\":4,\"create_time\":1747126124000,\"update_time\":1747134759000,\"company_id\":\"10001\",\"create_user_id\":\"UID010001\",\"is_deleted\":0,\"parent_id\":\"\",\"account\":\"gongcheng@admin\",\"user_name\":\"gongcheng@admin\",\"role_flag\":1,\"img_url\":\"/files/img/user/336e793aaf154bf1bd5d203e3788c385.png\",\"remark\":\"auto create\",\"password_change_time\":1747126125000,\"password_expire_days\":0,\"last_login_in_time\":1747134759000,\"max_login_allow\":3,\"encrypt\":0,\"role_id\":\"RID000001\",\"old_role_id\":\"RID000001\"}}', '2025-05-13 11:42:33', '2025-05-13 11:42:33');
INSERT INTO `log_system` VALUES (27, '10001', '/api/upload', NULL, 'UploadController', 'POST', 0, '183.14.31.32', NULL, 'UID010001', 'gongcheng@admin', '{\"data\":\"{\\\"path\\\":\\\"/img/user\\\",\\\"rename\\\":1}\"}', '2025-05-13 11:42:39', '2025-05-13 11:42:39');
INSERT INTO `log_system` VALUES (28, '10001', '/api/owner/user', NULL, 'OwnerUserController', 'PUT', 0, '183.14.31.32', NULL, 'UID010001', 'gongcheng@admin', '{\"ownerUserVo\":{\"id\":5,\"create_time\":1747126125000,\"update_time\":1747126125000,\"company_id\":\"10001\",\"create_user_id\":\"UID010001\",\"is_deleted\":0,\"parent_id\":\"\",\"account\":\"gongcheng@tg\",\"user_name\":\"gongcheng@tg\",\"role_flag\":1,\"img_url\":\"/files/img/user/0217e9561c6544178d2c2e3f377654c7.png\",\"remark\":\"auto create\",\"password_change_time\":1747126125000,\"password_expire_days\":0,\"max_login_allow\":3,\"encrypt\":0,\"role_id\":\"RID000001\",\"old_role_id\":\"\"}}', '2025-05-13 11:42:42', '2025-05-13 11:42:42');
INSERT INTO `log_system` VALUES (29, '100', '/api/upload', NULL, 'UploadController', 'POST', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"data\":\"{\\\"path\\\":\\\"/img/company\\\",\\\"rename\\\":1}\"}', '2025-05-13 11:51:21', '2025-05-13 11:51:21');
INSERT INTO `log_system` VALUES (30, '100', '/api/system/company', NULL, 'SystemCompanyController', 'PUT', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"param\":{\"id\":2,\"create_time\":1747126124000,\"update_time\":1747133457000,\"company_name\":\"恭城公交\",\"title\":\"恭城公交\",\"logo\":\"/files/img/company/5ab93ebb101b42c89fb8db61092673dd.png\",\"remark\":\"\",\"account\":\"gongcheng@admin\",\"level\":20,\"sort_id\":0,\"create_user_id\":\"UID000001\",\"archive_time\":7,\"monthly_start_date\":1,\"lng\":110.817484,\"lat\":24.838551,\"language\":\"zh\",\"company_config\":{\"disable_auto_schedule\":false,\"multiple_search_limit\":60,\"alarm_safety_list\":[],\"gps_deviation_excluded\":false},\"time_zone\":\"+08:00\",\"morning_peak\":\"07:00-09:00\",\"late_peak\":\"17:00-19:00\",\"authorized_vehicle_count\":100,\"gid\":\"10001\",\"pid\":\"100\"}}', '2025-05-13 11:51:22', '2025-05-13 11:51:22');
INSERT INTO `log_system` VALUES (31, '100', '/api/upload', NULL, 'UploadController', 'POST', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"data\":\"{\\\"path\\\":\\\"/img/company\\\",\\\"rename\\\":1}\"}', '2025-05-13 11:54:33', '2025-05-13 11:54:33');
INSERT INTO `log_system` VALUES (32, '100', '/api/system/company', NULL, 'SystemCompanyController', 'PUT', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"param\":{\"id\":2,\"create_time\":1747126124000,\"update_time\":1747137082000,\"company_name\":\"恭城公交\",\"title\":\"恭城公交\",\"logo\":\"/files/img/company/1dcf4bd114404e769207da28a0213219.png\",\"remark\":\"\",\"account\":\"gongcheng@admin\",\"level\":20,\"sort_id\":0,\"create_user_id\":\"UID000001\",\"archive_time\":7,\"monthly_start_date\":1,\"lng\":110.817484,\"lat\":24.838551,\"language\":\"zh\",\"company_config\":{\"disable_auto_schedule\":false,\"multiple_search_limit\":60,\"alarm_safety_list\":[],\"gps_deviation_excluded\":false},\"time_zone\":\"+08:00\",\"morning_peak\":\"07:00-09:00\",\"late_peak\":\"17:00-19:00\",\"authorized_vehicle_count\":100,\"gid\":\"10001\",\"pid\":\"100\"}}', '2025-05-13 11:54:34', '2025-05-13 11:54:34');
INSERT INTO `log_system` VALUES (33, '100', '/api/upload', NULL, 'UploadController', 'POST', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"data\":\"{\\\"path\\\":\\\"/img/company\\\",\\\"rename\\\":1}\"}', '2025-05-13 11:55:18', '2025-05-13 11:55:18');
INSERT INTO `log_system` VALUES (34, '100', '/api/system/company', NULL, 'SystemCompanyController', 'PUT', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"param\":{\"id\":2,\"create_time\":1747126124000,\"update_time\":1747137274000,\"company_name\":\"恭城公交\",\"title\":\"恭城公交\",\"logo\":\"/files/img/company/7c4adaacede54c889b405c89d92d792e.png\",\"remark\":\"\",\"account\":\"gongcheng@admin\",\"level\":20,\"sort_id\":0,\"create_user_id\":\"UID000001\",\"archive_time\":7,\"monthly_start_date\":1,\"lng\":110.817484,\"lat\":24.838551,\"language\":\"zh\",\"company_config\":{\"disable_auto_schedule\":false,\"multiple_search_limit\":60,\"alarm_safety_list\":[],\"gps_deviation_excluded\":false},\"time_zone\":\"+08:00\",\"morning_peak\":\"07:00-09:00\",\"late_peak\":\"17:00-19:00\",\"authorized_vehicle_count\":100,\"gid\":\"10001\",\"pid\":\"100\"}}', '2025-05-13 11:55:19', '2025-05-13 11:55:19');
INSERT INTO `log_system` VALUES (35, '100', '/api/upload', NULL, 'UploadController', 'POST', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"data\":\"{\\\"path\\\":\\\"/img/company\\\",\\\"rename\\\":1}\"}', '2025-05-13 11:56:15', '2025-05-13 11:56:15');
INSERT INTO `log_system` VALUES (36, '100', '/api/system/company', NULL, 'SystemCompanyController', 'PUT', 0, '183.14.31.32', NULL, 'UID000001', 'sysadmin', '{\"param\":{\"id\":2,\"create_time\":1747126124000,\"update_time\":1747137319000,\"company_name\":\"恭城公交\",\"title\":\"恭城公交\",\"logo\":\"/files/img/company/5e7a5dabf76e4fcdaa91d257d3cd12d4.png\",\"remark\":\"\",\"account\":\"gongcheng@admin\",\"level\":20,\"sort_id\":0,\"create_user_id\":\"UID000001\",\"archive_time\":7,\"monthly_start_date\":1,\"lng\":110.817484,\"lat\":24.838551,\"language\":\"zh\",\"company_config\":{\"disable_auto_schedule\":false,\"multiple_search_limit\":60,\"alarm_safety_list\":[],\"gps_deviation_excluded\":false},\"time_zone\":\"+08:00\",\"morning_peak\":\"07:00-09:00\",\"late_peak\":\"17:00-19:00\",\"authorized_vehicle_count\":100,\"gid\":\"10001\",\"pid\":\"100\"}}', '2025-05-13 11:56:15', '2025-05-13 11:56:15');

-- ----------------------------
-- Table structure for log_web_socket
-- ----------------------------
DROP TABLE IF EXISTS `log_web_socket`;
CREATE TABLE `log_web_socket`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `authorization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证码',
  `x_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名时间',
  `x_sign` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名',
  `x_reason` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名结果',
  `socket_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'socket唯一ID',
  `socket_uuid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'socket参数会话ID',
  `socket_account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'socket参数带的账号',
  `login_out` datetime NULL DEFAULT NULL COMMENT '退出时间',
  `logout_remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登出原因',
  `socket_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'socket的IP',
  `socket_headers` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'socket里面的消息头',
  `token_model` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'socket_uuid附加的登录会话信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`company_id`, `create_time`) USING BTREE,
  INDEX `log_web_socket_socket_uuid_IDX`(`socket_uuid`) USING BTREE,
  INDEX `log_web_socket_socket_id_IDX`(`socket_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_web_socket
-- ----------------------------
INSERT INTO `log_web_socket` VALUES (1, '100', 'Basic eyJ1aWQiOiJlMGFiODM5YTAzMjc0MzEzODcxOTY4YjI5NjAyYzNiNiIsImtleSI6ImUwYWI4MzlhMDMyNzQzMTM4NzE5NjhiMjk2MDJjM2I2IiwidGltZSI6MTc0NzEyNTk4MSwic2lnbiI6IjUzM2NkMGNiMTAwNTY4OTZhMDJmOGI3ZWIwODY4NDY3In0=', '1747125981201', '0nNtNSYnZlhVRwUkZx8mfDIM', 'OK但是uuid不一致', 'rlwohnwz', 'e0ab839a03274313871968b29602c3b6', 'sysadmin', '2025-05-13 08:48:57', NULL, '/172.22.0.5:59896', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=e0ab839a03274313871968b29602c3b6-8f05c3946e204181a93db80d86d6b2af\"],\"sec-websocket-key\":[\"dcI4efZpmOYFs/Y2OAQHDQ==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID000001\",\"uuid\":\"e0ab839a03274313871968b29602c3b6\",\"account\":\"sysadmin\",\"company_id\":\"100\",\"role_flag\":100,\"role_id\":null,\"key\":\"TOKEN:BUS:e0ab839a03274313871968b29602c3b6\",\"token\":\"8f05c3946e204181a93db80d86d6b2af\",\"time\":1747125981,\"last_api_millis\":1747125975649,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 08:46:16', '2025-05-13 08:48:56');
INSERT INTO `log_web_socket` VALUES (2, '10001', 'Basic eyJ1aWQiOiJlMzcwOWEzNTI4OWU0Y2ViYThiOGYwYjhhMTk3MTA4ZCIsImtleSI6ImUzNzA5YTM1Mjg5ZTRjZWJhOGI4ZjBiOGExOTcxMDhkIiwidGltZSI6MTc0NzEyNjE0OSwic2lnbiI6IjkyNjNiOGNkZWIzY2Y0MGI0MzJiMjdkZmIxNjEwYTIyIn0=', '1747126149123', 'FylLDjc1VEh/MGhBZDcEVlFR', 'OK但是uuid不一致', 'oei1b0qv', 'e3709a35289e4ceba8b8f0b8a197108d', 'gongcheng@admin', '2025-05-13 08:49:21', NULL, '/172.22.0.5:33442', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=e3709a35289e4ceba8b8f0b8a197108d-29c2183517fe4f658f30d1eaa46532db\"],\"sec-websocket-key\":[\"o0G38PdeVqZU1CGii1Da0Q==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"e3709a35289e4ceba8b8f0b8a197108d\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:e3709a35289e4ceba8b8f0b8a197108d\",\"token\":\"29c2183517fe4f658f30d1eaa46532db\",\"time\":1747126149,\"last_api_millis\":1747126143838,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 08:49:04', '2025-05-13 08:49:20');
INSERT INTO `log_web_socket` VALUES (3, '100', 'Basic eyJ1aWQiOiI1N2Q0NDYzNmUzMzA0YWI5OWM0ZDFhODU2ZjM1ZDVkMiIsImtleSI6IjU3ZDQ0NjM2ZTMzMDRhYjk5YzRkMWE4NTZmMzVkNWQyIiwidGltZSI6MTc0NzEyNjE3NSwic2lnbiI6ImM1ZmExNTA0NGQ2OWIwOGM3NjQyOWQ0NGE5OTRiMWVjIn0=', '1747126174659', '0mQGAhY+TSpPXVJDAGc7YSQM', 'OK但是uuid不一致', 'funpobsw', '57d44636e3304ab99c4d1a856f35d5d2', 'sysadmin', '2025-05-13 08:51:34', NULL, '/172.22.0.5:33498', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=57d44636e3304ab99c4d1a856f35d5d2-46ed2e843477407d849cdf9886a0afff\"],\"sec-websocket-key\":[\"65+JGzjM3R3isT6pUpg5ow==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID000001\",\"uuid\":\"57d44636e3304ab99c4d1a856f35d5d2\",\"account\":\"sysadmin\",\"company_id\":\"100\",\"role_flag\":100,\"role_id\":null,\"key\":\"TOKEN:BUS:57d44636e3304ab99c4d1a856f35d5d2\",\"token\":\"46ed2e843477407d849cdf9886a0afff\",\"time\":1747126175,\"last_api_millis\":1747126169377,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 08:49:29', '2025-05-13 08:51:34');
INSERT INTO `log_web_socket` VALUES (4, '100', 'Basic eyJ1aWQiOiI1N2Q0NDYzNmUzMzA0YWI5OWM0ZDFhODU2ZjM1ZDVkMiIsImtleSI6IjU3ZDQ0NjM2ZTMzMDRhYjk5YzRkMWE4NTZmMzVkNWQyIiwidGltZSI6MTc0NzEyNjMwMCwic2lnbiI6ImUyMzY4MTlmZTYyODY1M2E4NWE3ZjE5ZjU4ZjM4NjQ0In0=', '1747126300152', '0WxTWwYpQyQiNzk2cDscaCoL', 'OK但是uuid不一致', 'ijtiwun0', '57d44636e3304ab99c4d1a856f35d5d2', 'sysadmin', '2025-05-13 08:53:39', NULL, '/172.22.0.5:39268', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=57d44636e3304ab99c4d1a856f35d5d2-46ed2e843477407d849cdf9886a0afff\"],\"sec-websocket-key\":[\"m9zdXKe2CT51mVLorNZEew==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID000001\",\"uuid\":\"57d44636e3304ab99c4d1a856f35d5d2\",\"account\":\"sysadmin\",\"company_id\":\"100\",\"role_flag\":100,\"role_id\":null,\"key\":\"TOKEN:BUS:57d44636e3304ab99c4d1a856f35d5d2\",\"token\":\"46ed2e843477407d849cdf9886a0afff\",\"time\":1747126175,\"last_api_millis\":1747126289673,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 08:51:35', '2025-05-13 08:53:38');
INSERT INTO `log_web_socket` VALUES (5, '10001', 'Basic eyJ1aWQiOiI2YzBiMDc2OTg4NWI0MjhlOTQ3ZjFhMGI2Yjk2NDUyYiIsImtleSI6IjZjMGIwNzY5ODg1YjQyOGU5NDdmMWEwYjZiOTY0NTJiIiwidGltZSI6MTc0NzEyNjQzMCwic2lnbiI6ImM2ZGM0NDBkMDk3MDkxZWNkODg2YmZjNmY5NzcxZDdiIn0=', '1747126429684', '5F1DT19zDWZZWURbIHEDBBwe', 'OK但是uuid不一致', '0nukb2b4', '6c0b0769885b428e947f1a0b6b96452b', 'gongcheng@admin', '2025-05-13 08:54:46', NULL, '/172.22.0.5:37050', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=6c0b0769885b428e947f1a0b6b96452b-a2f9d3cf2cd7467f8d4ea0145dbef904\"],\"sec-websocket-key\":[\"QjCMAtfTbq9P5VcqSS63xg==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"6c0b0769885b428e947f1a0b6b96452b\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:6c0b0769885b428e947f1a0b6b96452b\",\"token\":\"a2f9d3cf2cd7467f8d4ea0145dbef904\",\"time\":1747126430,\"last_api_millis\":1747126424410,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 08:53:44', '2025-05-13 08:54:46');
INSERT INTO `log_web_socket` VALUES (6, '10001', 'Basic eyJ1aWQiOiI2YzBiMDc2OTg4NWI0MjhlOTQ3ZjFhMGI2Yjk2NDUyYiIsImtleSI6IjZjMGIwNzY5ODg1YjQyOGU5NDdmMWEwYjZiOTY0NTJiIiwidGltZSI6MTc0NzEyNjQ5Miwic2lnbiI6ImRiYTU4M2VlMWFhODRhMDUwY2Y4MDQyZmE3MzFjMjEyIn0=', '1747126492039', '+SguKnFaFXIeMCFKUxssBVcz', 'OK但是uuid不一致', 'r2vf3jpk', '6c0b0769885b428e947f1a0b6b96452b', 'gongcheng@admin', '2025-05-13 09:49:06', NULL, '/172.22.0.5:49870', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=6c0b0769885b428e947f1a0b6b96452b-a2f9d3cf2cd7467f8d4ea0145dbef904\"],\"sec-websocket-key\":[\"x+WkiVUWhVglPtM6kcpwFQ==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"6c0b0769885b428e947f1a0b6b96452b\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:6c0b0769885b428e947f1a0b6b96452b\",\"token\":\"a2f9d3cf2cd7467f8d4ea0145dbef904\",\"time\":1747126430,\"last_api_millis\":1747126484718,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 08:54:47', '2025-05-13 09:49:06');
INSERT INTO `log_web_socket` VALUES (7, '10001', 'Basic eyJ1aWQiOiI2YzBiMDc2OTg4NWI0MjhlOTQ3ZjFhMGI2Yjk2NDUyYiIsImtleSI6IjZjMGIwNzY5ODg1YjQyOGU5NDdmMWEwYjZiOTY0NTJiIiwidGltZSI6MTc0NzEyOTc1Miwic2lnbiI6ImM1ZDFlZGIzNGM5YjMyODg2MmUwM2RmZmQxZjJkZTlkIn0=', '1747129752409', '6wkwD2hqMS1KcmsYSip0NkIl', 'OK但是uuid不一致', 'n5nukxke', '6c0b0769885b428e947f1a0b6b96452b', 'gongcheng@admin', '2025-05-13 10:19:43', NULL, '/172.22.0.5:35204', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=6c0b0769885b428e947f1a0b6b96452b-a2f9d3cf2cd7467f8d4ea0145dbef904\"],\"sec-websocket-key\":[\"PWnu5Az3loVmMQdFlfMl2Q==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"6c0b0769885b428e947f1a0b6b96452b\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:6c0b0769885b428e947f1a0b6b96452b\",\"token\":\"a2f9d3cf2cd7467f8d4ea0145dbef904\",\"time\":1747126430,\"last_api_millis\":1747129742765,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 09:49:07', '2025-05-13 10:19:43');
INSERT INTO `log_web_socket` VALUES (8, '10001', 'Basic eyJ1aWQiOiI2YzBiMDc2OTg4NWI0MjhlOTQ3ZjFhMGI2Yjk2NDUyYiIsImtleSI6IjZjMGIwNzY5ODg1YjQyOGU5NDdmMWEwYjZiOTY0NTJiIiwidGltZSI6MTc0NzEzMTU4OSwic2lnbiI6IjU5NjUwZDhjNmIzYWM1NDI1MWU5OTkxMGIwNzRjMWQ2In0=', '1747131589292', 'Kz06JldXCHdyCRl2JnRNYHBl', 'OK但是uuid不一致', 'tdzxft4t', '6c0b0769885b428e947f1a0b6b96452b', 'gongcheng@admin', '2025-05-13 10:28:59', NULL, '/172.22.0.5:46120', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=6c0b0769885b428e947f1a0b6b96452b-a2f9d3cf2cd7467f8d4ea0145dbef904\"],\"sec-websocket-key\":[\"XfWLjmHJqOJzoghT6b88vw==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"6c0b0769885b428e947f1a0b6b96452b\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:6c0b0769885b428e947f1a0b6b96452b\",\"token\":\"a2f9d3cf2cd7467f8d4ea0145dbef904\",\"time\":1747126430,\"last_api_millis\":1747131563910,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 10:19:44', '2025-05-13 10:28:59');
INSERT INTO `log_web_socket` VALUES (9, '10001', 'Basic eyJ1aWQiOiI2YzBiMDc2OTg4NWI0MjhlOTQ3ZjFhMGI2Yjk2NDUyYiIsImtleSI6IjZjMGIwNzY5ODg1YjQyOGU5NDdmMWEwYjZiOTY0NTJiIiwidGltZSI6MTc0NzEzMjE0Niwic2lnbiI6IjJjM2YwNTA1Y2IzZDk1OWQ4MGRlOGFhNTAxMTVlNDlmIn0=', '1747132145522', 'OgxXWisraGw3Xk8JSSprA3B0', 'OK但是uuid不一致', 'dv2kc2r2', '6c0b0769885b428e947f1a0b6b96452b', 'gongcheng@admin', '2025-05-13 10:32:16', NULL, '/172.22.0.5:54622', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=6c0b0769885b428e947f1a0b6b96452b-a2f9d3cf2cd7467f8d4ea0145dbef904\"],\"sec-websocket-key\":[\"3u33C6GYSOvODyYU5wV2Gw==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"6c0b0769885b428e947f1a0b6b96452b\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:6c0b0769885b428e947f1a0b6b96452b\",\"token\":\"a2f9d3cf2cd7467f8d4ea0145dbef904\",\"time\":1747126430,\"last_api_millis\":1747132124943,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 10:29:00', '2025-05-13 10:32:16');
INSERT INTO `log_web_socket` VALUES (10, '10001', 'Basic eyJ1aWQiOiI2YzBiMDc2OTg4NWI0MjhlOTQ3ZjFhMGI2Yjk2NDUyYiIsImtleSI6IjZjMGIwNzY5ODg1YjQyOGU5NDdmMWEwYjZiOTY0NTJiIiwidGltZSI6MTc0NzEzMjM4Niwic2lnbiI6IjQzODVkOWRjNGFhNmZlZTE4ZDRlZjUxNWMwOTU4MTkzIn0=', '1747132385542', '90k0OGNPGQU4FEwHHHwTFAQx', 'OK但是uuid不一致', 'qpspga5b', '6c0b0769885b428e947f1a0b6b96452b', 'gongcheng@admin', '2025-05-13 10:33:52', NULL, '/172.23.0.3:37766', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=6c0b0769885b428e947f1a0b6b96452b-a2f9d3cf2cd7467f8d4ea0145dbef904\"],\"sec-websocket-key\":[\"E0F2qcLGKMtfSW3TroJ2Fg==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"6c0b0769885b428e947f1a0b6b96452b\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:6c0b0769885b428e947f1a0b6b96452b\",\"token\":\"a2f9d3cf2cd7467f8d4ea0145dbef904\",\"time\":1747126430,\"last_api_millis\":1747132320684,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 10:33:00', '2025-05-13 10:33:51');
INSERT INTO `log_web_socket` VALUES (11, '10001', 'Basic eyJ1aWQiOiI2YzBiMDc2OTg4NWI0MjhlOTQ3ZjFhMGI2Yjk2NDUyYiIsImtleSI6IjZjMGIwNzY5ODg1YjQyOGU5NDdmMWEwYjZiOTY0NTJiIiwidGltZSI6MTc0NzEzMjQzOCwic2lnbiI6IjkzM2U0NWI4Y2E4YmQzOTJiNmY0MDRiMjE1MWU0YjkzIn0=', '1747132437517', 'DURfH0doFlNtNyNUAlYWHQpH', 'OK但是uuid不一致', 'qcnm0byj', '6c0b0769885b428e947f1a0b6b96452b', 'gongcheng@admin', '2025-05-13 10:34:23', NULL, '/172.23.0.3:55484', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=6c0b0769885b428e947f1a0b6b96452b-a2f9d3cf2cd7467f8d4ea0145dbef904\"],\"sec-websocket-key\":[\"ulRP2OsWnI5mgP0GNUTgpA==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"6c0b0769885b428e947f1a0b6b96452b\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:6c0b0769885b428e947f1a0b6b96452b\",\"token\":\"a2f9d3cf2cd7467f8d4ea0145dbef904\",\"time\":1747126430,\"last_api_millis\":1747132410792,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 10:33:52', '2025-05-13 10:34:23');
INSERT INTO `log_web_socket` VALUES (12, '100', 'Basic eyJ1aWQiOiJmZjQ5OGU2MGJkZTY0NzcxYjIyNmY3YmZjOWViYzVhMyIsImtleSI6ImZmNDk4ZTYwYmRlNjQ3NzFiMjI2ZjdiZmM5ZWJjNWEzIiwidGltZSI6MTc0NzEzMjQ3NCwic2lnbiI6IjcyMjY0M2JkMWMxODczOTRlMzNkODFkNzQ1ODNkMGQwIn0=', '1747132474165', '0ygNWD4XVmg8L3YzXSYKI2oN', 'OK但是uuid不一致', '0yi4cjvj', 'ff498e60bde64771b226f7bfc9ebc5a3', 'sysadmin', '2025-05-13 10:34:44', NULL, '/172.23.0.3:58552', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=ff498e60bde64771b226f7bfc9ebc5a3-a8941e3b3ae340e49e19232748d38983\"],\"sec-websocket-key\":[\"gKfW4pFCWYvyYNWYSsj8XQ==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID000001\",\"uuid\":\"ff498e60bde64771b226f7bfc9ebc5a3\",\"account\":\"sysadmin\",\"company_id\":\"100\",\"role_flag\":100,\"role_id\":null,\"key\":\"TOKEN:BUS:ff498e60bde64771b226f7bfc9ebc5a3\",\"token\":\"a8941e3b3ae340e49e19232748d38983\",\"time\":1747132474,\"last_api_millis\":1747132468774,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 10:34:29', '2025-05-13 10:34:44');
INSERT INTO `log_web_socket` VALUES (13, '10001', 'Basic eyJ1aWQiOiI4NGRhMTVjNjRiNmY0MzdjYWNlNDJiNjE2NmMwZmI3YyIsImtleSI6Ijg0ZGExNWM2NGI2ZjQzN2NhY2U0MmI2MTY2YzBmYjdjIiwidGltZSI6MTc0NzEzMjQ5Niwic2lnbiI6IjQzOTcwZGJmNzE3YmM5OWMyZmE0OWI4NDViNDEzNGM4In0=', '1747132496264', 'xxx2bRwwRDc4JDsWDll/XlYB', 'OK但是uuid不一致', '0i14lqww', '84da15c64b6f437cace42b6166c0fb7c', 'gongcheng@admin', '2025-05-13 10:34:59', NULL, '/172.23.0.3:34966', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=84da15c64b6f437cace42b6166c0fb7c-16611aef2a5e4b04937c249431547e5e\"],\"sec-websocket-key\":[\"R+hm5bJ279X2/Jg2LvZmZg==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"84da15c64b6f437cace42b6166c0fb7c\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:84da15c64b6f437cace42b6166c0fb7c\",\"token\":\"16611aef2a5e4b04937c249431547e5e\",\"time\":1747132496,\"last_api_millis\":1747132490906,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 10:34:51', '2025-05-13 10:34:59');
INSERT INTO `log_web_socket` VALUES (14, '100', 'Basic eyJ1aWQiOiJmM2U2NjRjOTYyNWY0ZDI5ODVhNDA0ZmZkM2QxNmI2NyIsImtleSI6ImYzZTY2NGM5NjI1ZjRkMjk4NWE0MDRmZmQzZDE2YjY3IiwidGltZSI6MTc0NzEzMjUxMCwic2lnbiI6IjQzMTNmNjg3NzAxYjAyYjdlYmVjYmVjN2UxZmNmYjUyIn0=', '1747132509884', '3TB3czgTQlJmb2wiP1oBPHIX', 'OK但是uuid不一致', 'ozes55rj', 'f3e664c9625f4d2985a404ffd3d16b67', 'sysadmin', '2025-05-13 10:38:11', NULL, '/172.23.0.3:35368', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=f3e664c9625f4d2985a404ffd3d16b67-225c699e210643648c12fc918549b517\"],\"sec-websocket-key\":[\"/HRy5PAPEKcUtdza4InGuw==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID000001\",\"uuid\":\"f3e664c9625f4d2985a404ffd3d16b67\",\"account\":\"sysadmin\",\"company_id\":\"100\",\"role_flag\":100,\"role_id\":null,\"key\":\"TOKEN:BUS:f3e664c9625f4d2985a404ffd3d16b67\",\"token\":\"225c699e210643648c12fc918549b517\",\"time\":1747132510,\"last_api_millis\":1747132504277,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 10:35:05', '2025-05-13 10:38:11');
INSERT INTO `log_web_socket` VALUES (15, '10001', 'Basic eyJ1aWQiOiJjOTdjZTliMDYyYTk0Yjk0ODZiODA0ZDhmMjY5Mzk1YyIsImtleSI6ImM5N2NlOWIwNjJhOTRiOTQ4NmI4MDRkOGYyNjkzOTVjIiwidGltZSI6MTc0NzEzMjcwMiwic2lnbiI6IjM0MThmYWY2ODVjYzI2ZWJjMzJlYTQ1MzRkN2IzYmYwIn0=', '1747132701697', 'DDEub1ZTEyERSRAqCnQNaURG', 'OK但是uuid不一致', 'pljkwblq', 'c97ce9b062a94b9486b804d8f269395c', 'gongcheng@admin', '2025-05-13 10:38:31', NULL, '/172.23.0.3:38846', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=c97ce9b062a94b9486b804d8f269395c-2ad8e8dc09144d519f14b414b4378dc2\"],\"sec-websocket-key\":[\"dgpGnwNmZZ/PI86SGyor6g==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"c97ce9b062a94b9486b804d8f269395c\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:c97ce9b062a94b9486b804d8f269395c\",\"token\":\"2ad8e8dc09144d519f14b414b4378dc2\",\"time\":1747132702,\"last_api_millis\":1747132696324,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 10:38:16', '2025-05-13 10:38:31');
INSERT INTO `log_web_socket` VALUES (16, '100', 'Basic eyJ1aWQiOiIzODU2OGJiMGJkNjk0YzIzODgyZmRlMmRhODMxOWM4NSIsImtleSI6IjM4NTY4YmIwYmQ2OTRjMjM4ODJmZGUyZGE4MzE5Yzg1IiwidGltZSI6MTc0NzEzMjcyMiwic2lnbiI6ImEzNTdlOGU2Y2Y4MDFhNDI5YTRkMThlZGY4ZmVlYmFmIn0=', '1747132722026', 'L2l5PFh1JTU9SVhpcCAsTBVp', 'OK但是uuid不一致', 'f3m5bblx', '38568bb0bd694c23882fde2da8319c85', 'sysadmin', '2025-05-13 10:38:50', NULL, '/172.23.0.3:46318', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=38568bb0bd694c23882fde2da8319c85-6445fe6a35244f9b9c0c89a299e462b7\"],\"sec-websocket-key\":[\"sY75khpzS8oaRWHgjbUUMA==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID000001\",\"uuid\":\"38568bb0bd694c23882fde2da8319c85\",\"account\":\"sysadmin\",\"company_id\":\"100\",\"role_flag\":100,\"role_id\":null,\"key\":\"TOKEN:BUS:38568bb0bd694c23882fde2da8319c85\",\"token\":\"6445fe6a35244f9b9c0c89a299e462b7\",\"time\":1747132722,\"last_api_millis\":1747132716669,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 10:38:37', '2025-05-13 10:38:50');
INSERT INTO `log_web_socket` VALUES (17, '100', 'Basic eyJ1aWQiOiIzODU2OGJiMGJkNjk0YzIzODgyZmRlMmRhODMxOWM4NSIsImtleSI6IjM4NTY4YmIwYmQ2OTRjMjM4ODJmZGUyZGE4MzE5Yzg1IiwidGltZSI6MTc0NzEzMzQzNSwic2lnbiI6ImY4NmZlMTA2MmY4OTc5ODNiZGE4MmYwZDQ2ZDNlNjU5In0=', '1747133435173', 'K0RCUm5HBhoRanA9NmVnXgxl', 'OK但是uuid不一致', 'reytasqj', '38568bb0bd694c23882fde2da8319c85', 'sysadmin', '2025-05-13 10:50:36', NULL, '/172.24.0.7:58308', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=38568bb0bd694c23882fde2da8319c85-6445fe6a35244f9b9c0c89a299e462b7\"],\"sec-websocket-key\":[\"PPzz/YRQNDfpNtyQ1puJbA==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID000001\",\"uuid\":\"38568bb0bd694c23882fde2da8319c85\",\"account\":\"sysadmin\",\"company_id\":\"100\",\"role_flag\":100,\"role_id\":null,\"key\":\"TOKEN:BUS:38568bb0bd694c23882fde2da8319c85\",\"token\":\"6445fe6a35244f9b9c0c89a299e462b7\",\"time\":1747132722,\"last_api_millis\":1747132716669,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 10:50:30', '2025-05-13 10:50:35');
INSERT INTO `log_web_socket` VALUES (18, '10001', 'Basic eyJ1aWQiOiI0NzZkOWU5MjA3ODg0ZDU0YWNhOTZjMGYyNGI4N2U3ZCIsImtleSI6IjQ3NmQ5ZTkyMDc4ODRkNTRhY2E5NmMwZjI0Yjg3ZTdkIiwidGltZSI6MTc0NzEzMzQ0Nywic2lnbiI6ImZjNmIzMzUyYzBhMjQwMTAwZjdmMzMyZGM5OGNjMzI0In0=', '1747133446782', '/y0PGFFWMHUsCA0Tfh9ILG45', 'OK但是uuid不一致', 'lourrlw3', '476d9e9207884d54aca96c0f24b87e7d', 'gongcheng@admin', '2025-05-13 10:50:59', NULL, '/172.24.0.7:52230', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=476d9e9207884d54aca96c0f24b87e7d-cf33fcff3fe14b0fb91799815be2ab58\"],\"sec-websocket-key\":[\"UzmnJZgO1vxKiDsRass+yg==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"476d9e9207884d54aca96c0f24b87e7d\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:476d9e9207884d54aca96c0f24b87e7d\",\"token\":\"cf33fcff3fe14b0fb91799815be2ab58\",\"time\":1747133446,\"last_api_millis\":1747133441291,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 10:50:42', '2025-05-13 10:50:59');
INSERT INTO `log_web_socket` VALUES (19, '10001', 'Basic eyJ1aWQiOiI0NzZkOWU5MjA3ODg0ZDU0YWNhOTZjMGYyNGI4N2U3ZCIsImtleSI6IjQ3NmQ5ZTkyMDc4ODRkNTRhY2E5NmMwZjI0Yjg3ZTdkIiwidGltZSI6MTc0NzEzMzQ2NSwic2lnbiI6IjYxMjUzOTdiOGIxNjdmMzQxNzA3MjViZjIwZmE3Y2Y2In0=', '1747133465315', 'zVd4NW1pHXoXDkUfO2trXhgH', 'OK但是uuid不一致', 'prkkk1tb', '476d9e9207884d54aca96c0f24b87e7d', 'gongcheng@admin', '2025-05-13 10:51:01', NULL, '/172.24.0.7:51832', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=476d9e9207884d54aca96c0f24b87e7d-cf33fcff3fe14b0fb91799815be2ab58\"],\"sec-websocket-key\":[\"BMliakiampoo0+9ftpwMlQ==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"476d9e9207884d54aca96c0f24b87e7d\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:476d9e9207884d54aca96c0f24b87e7d\",\"token\":\"cf33fcff3fe14b0fb91799815be2ab58\",\"time\":1747133446,\"last_api_millis\":1747133441291,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 10:51:00', '2025-05-13 10:51:01');
INSERT INTO `log_web_socket` VALUES (20, '10001', 'Basic eyJ1aWQiOiI0NzZkOWU5MjA3ODg0ZDU0YWNhOTZjMGYyNGI4N2U3ZCIsImtleSI6IjQ3NmQ5ZTkyMDc4ODRkNTRhY2E5NmMwZjI0Yjg3ZTdkIiwidGltZSI6MTc0NzEzMzQ2Nywic2lnbiI6IjY0ZDU0ZWNjZmFhZjM2N2U2M2ZjMmQxM2Y3Yjg5NjkzIn0=', '1747133467168', '7zchNlFWJE99SQccdiE8SEMp', 'OK但是uuid不一致', 'p5wgwnsl', '476d9e9207884d54aca96c0f24b87e7d', 'gongcheng@admin', '2025-05-13 11:03:07', NULL, '/172.24.0.7:51854', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=476d9e9207884d54aca96c0f24b87e7d-cf33fcff3fe14b0fb91799815be2ab58\"],\"sec-websocket-key\":[\"YMhWHm8sNB/a7ctt50M49g==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"476d9e9207884d54aca96c0f24b87e7d\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:476d9e9207884d54aca96c0f24b87e7d\",\"token\":\"cf33fcff3fe14b0fb91799815be2ab58\",\"time\":1747133446,\"last_api_millis\":1747133441291,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 10:51:02', '2025-05-13 11:03:07');
INSERT INTO `log_web_socket` VALUES (21, '10001', 'Basic eyJ1aWQiOiIwNTUzZTY1OWI2MGI0MmM0ODRhZDhjZjQ0OTE3MzAyNSIsImtleSI6IjA1NTNlNjU5YjYwYjQyYzQ4NGFkOGNmNDQ5MTczMDI1IiwidGltZSI6MTc0NzEzNDI1OCwic2lnbiI6ImNjMjJmOTU1ZWRhMTA2NjkxNTI0Y2UyYzE4NmUwYmZiIn0=', '1747134257849', 'yW0eRGttOTFif3sUD28rKCQD', 'OK但是uuid不一致', 'dqg1yuss', '0553e659b60b42c484ad8cf449173025', 'gongcheng@admin', '2025-05-13 11:04:50', NULL, '/172.24.0.7:58020', '{\"x-real-ip\":[\"119.28.86.14\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"119.28.86.14\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en;q=0.8\"],\"cookie\":[\"SESSION=OGIwMzQ2OGUtNTBiMi00MTgyLWIzMzctYjA3NTBlYjQzZjM0; %C3%A1fk%C3%B4en%C3%A1knEd=0553e659b60b42c484ad8cf449173025-8632239258d7418eaa94776c9c82b315\"],\"sec-websocket-key\":[\"gcQmwJL6rMtbTYcTzLrElw==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"119.28.86.14\",\"user_id\":\"UID010001\",\"uuid\":\"0553e659b60b42c484ad8cf449173025\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:0553e659b60b42c484ad8cf449173025\",\"token\":\"8632239258d7418eaa94776c9c82b315\",\"time\":1747134258,\"last_api_millis\":1747134252374,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 11:04:12', '2025-05-13 11:04:49');
INSERT INTO `log_web_socket` VALUES (22, '10001', 'Basic eyJ1aWQiOiIwNTUzZTY1OWI2MGI0MmM0ODRhZDhjZjQ0OTE3MzAyNSIsImtleSI6IjA1NTNlNjU5YjYwYjQyYzQ4NGFkOGNmNDQ5MTczMDI1IiwidGltZSI6MTc0NzEzNDI5Niwic2lnbiI6IjI5YjhmMjc4ZTE2NThhZTkyNTQ2MTBiMDgyYzgzOTk2In0=', '1747134295893', 'FV0jL2RgBBgjcXAQNmAAMSZP', 'OK但是uuid不一致', 'hfjxrqhf', '0553e659b60b42c484ad8cf449173025', 'gongcheng@admin', '2025-05-13 11:18:43', NULL, '/172.24.0.7:60922', '{\"x-real-ip\":[\"119.28.86.14\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"119.28.86.14\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en;q=0.8\"],\"cookie\":[\"SESSION=OGIwMzQ2OGUtNTBiMi00MTgyLWIzMzctYjA3NTBlYjQzZjM0; %C3%A1fk%C3%B4en%C3%A1knEd=0553e659b60b42c484ad8cf449173025-8632239258d7418eaa94776c9c82b315\"],\"sec-websocket-key\":[\"qUQuZhgxaQKdoiwT6spdDw==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"119.28.86.14\",\"user_id\":\"UID010001\",\"uuid\":\"0553e659b60b42c484ad8cf449173025\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:0553e659b60b42c484ad8cf449173025\",\"token\":\"8632239258d7418eaa94776c9c82b315\",\"time\":1747134258,\"last_api_millis\":1747134282778,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 11:04:51', '2025-05-13 11:18:43');
INSERT INTO `log_web_socket` VALUES (23, '10001', 'Basic eyJ1aWQiOiI0NzZkOWU5MjA3ODg0ZDU0YWNhOTZjMGYyNGI4N2U3ZCIsImtleSI6IjQ3NmQ5ZTkyMDc4ODRkNTRhY2E5NmMwZjI0Yjg3ZTdkIiwidGltZSI6MTc0NzEzNDY1Nywic2lnbiI6IjlkNTViYWFlNDA5YzZlOTc0NjM0ZjRjOWE1YjE4MzAyIn0=', '1747134656948', '9W9ueUVtNAYLOnsHHn4VQygv', 'OK但是uuid不一致', 'nraq2agl', '476d9e9207884d54aca96c0f24b87e7d', 'gongcheng@admin', '2025-05-13 11:11:14', NULL, '/172.24.0.7:43904', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=476d9e9207884d54aca96c0f24b87e7d-cf33fcff3fe14b0fb91799815be2ab58\"],\"sec-websocket-key\":[\"0apY/ycbKIKmeKBe8JwQag==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"476d9e9207884d54aca96c0f24b87e7d\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:476d9e9207884d54aca96c0f24b87e7d\",\"token\":\"cf33fcff3fe14b0fb91799815be2ab58\",\"time\":1747133446,\"last_api_millis\":1747134651704,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 11:11:14', '2025-05-13 11:11:14');
INSERT INTO `log_web_socket` VALUES (24, '10001', 'Basic eyJ1aWQiOiI0NzZkOWU5MjA3ODg0ZDU0YWNhOTZjMGYyNGI4N2U3ZCIsImtleSI6IjQ3NmQ5ZTkyMDc4ODRkNTRhY2E5NmMwZjI0Yjg3ZTdkIiwidGltZSI6MTc0NzEzNDY3OSwic2lnbiI6IjNmMjcwZTVhMzcwMDljMzgwMmMzZWJjNGY2NjBkMGU4In0=', '1747134679399', '2nh5N1dRGWoLAhh/K31jOQQU', 'OK但是uuid不一致', '3uulhsjb', '476d9e9207884d54aca96c0f24b87e7d', 'gongcheng@admin', '2025-05-13 11:18:43', NULL, '/172.24.0.7:43920', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=476d9e9207884d54aca96c0f24b87e7d-cf33fcff3fe14b0fb91799815be2ab58\"],\"sec-websocket-key\":[\"p6XNYv+7o1NjzlqxN/HkVQ==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"476d9e9207884d54aca96c0f24b87e7d\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:476d9e9207884d54aca96c0f24b87e7d\",\"token\":\"cf33fcff3fe14b0fb91799815be2ab58\",\"time\":1747133446,\"last_api_millis\":1747134651704,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 11:11:14', '2025-05-13 11:18:43');
INSERT INTO `log_web_socket` VALUES (25, '10001', 'Basic eyJ1aWQiOiIwNTUzZTY1OWI2MGI0MmM0ODRhZDhjZjQ0OTE3MzAyNSIsImtleSI6IjA1NTNlNjU5YjYwYjQyYzQ4NGFkOGNmNDQ5MTczMDI1IiwidGltZSI6MTc0NzEzNTEzNiwic2lnbiI6ImM1OGFlMmE2NmQxZDJkYWZjZDRiNTIzZGYyM2RlYjYzIn0=', '1747135135894', 'NVAiax0ZUVVkFR5LVQRwMhxv', 'OK但是uuid不一致', 'irtphyyg', '0553e659b60b42c484ad8cf449173025', 'gongcheng@admin', '2025-05-13 11:29:00', NULL, '/172.24.0.7:54834', '{\"x-real-ip\":[\"119.28.86.14\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"119.28.86.14\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en;q=0.8\"],\"cookie\":[\"SESSION=OGIwMzQ2OGUtNTBiMi00MTgyLWIzMzctYjA3NTBlYjQzZjM0; %C3%A1fk%C3%B4en%C3%A1knEd=0553e659b60b42c484ad8cf449173025-8632239258d7418eaa94776c9c82b315; sidebarStatus=0\"],\"sec-websocket-key\":[\"BdSWm/iNiujGeJuiUW2AyA==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"119.28.86.14\",\"user_id\":\"UID010001\",\"uuid\":\"0553e659b60b42c484ad8cf449173025\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:0553e659b60b42c484ad8cf449173025\",\"token\":\"8632239258d7418eaa94776c9c82b315\",\"time\":1747134258,\"last_api_millis\":1747135124755,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 11:18:50', '2025-05-13 11:28:59');
INSERT INTO `log_web_socket` VALUES (26, '10001', 'Basic eyJ1aWQiOiI0NzZkOWU5MjA3ODg0ZDU0YWNhOTZjMGYyNGI4N2U3ZCIsImtleSI6IjQ3NmQ5ZTkyMDc4ODRkNTRhY2E5NmMwZjI0Yjg3ZTdkIiwidGltZSI6MTc0NzEzNTE0OCwic2lnbiI6ImVhNjBiNWI0N2VkMGRiM2U3ZjkyZjc3NGUwNmI3YjljIn0=', '1747135147886', 'BEQSAUpmPjZefnIkFG4QSjk+', 'OK但是uuid不一致', 'ti2prldt', '476d9e9207884d54aca96c0f24b87e7d', 'gongcheng@admin', '2025-05-13 11:29:00', NULL, '/172.24.0.7:40374', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=476d9e9207884d54aca96c0f24b87e7d-cf33fcff3fe14b0fb91799815be2ab58\"],\"sec-websocket-key\":[\"iHK1VkFvRTf8bxjeMpdFWw==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"476d9e9207884d54aca96c0f24b87e7d\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:476d9e9207884d54aca96c0f24b87e7d\",\"token\":\"cf33fcff3fe14b0fb91799815be2ab58\",\"time\":1747133446,\"last_api_millis\":1747135136695,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 11:19:04', '2025-05-13 11:29:00');
INSERT INTO `log_web_socket` VALUES (27, '10001', 'Basic eyJ1aWQiOiI0NzZkOWU5MjA3ODg0ZDU0YWNhOTZjMGYyNGI4N2U3ZCIsImtleSI6IjQ3NmQ5ZTkyMDc4ODRkNTRhY2E5NmMwZjI0Yjg3ZTdkIiwidGltZSI6MTc0NzEzNTc0OCwic2lnbiI6ImQ4NzJkYjQ0ZTEwMDBjZDA5NjZlYTAxOGIyNTgyYjhkIn0=', '1747135747889', 'AXwPADwVbh1yVxZuKHohXQw7', 'OK但是uuid不一致', 'fdjtpdcq', '476d9e9207884d54aca96c0f24b87e7d', 'gongcheng@admin', '2025-05-13 11:42:18', NULL, '/172.24.0.7:37728', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=476d9e9207884d54aca96c0f24b87e7d-cf33fcff3fe14b0fb91799815be2ab58\"],\"sec-websocket-key\":[\"stpt4ujQhNjTWkqV76wP2w==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"476d9e9207884d54aca96c0f24b87e7d\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:476d9e9207884d54aca96c0f24b87e7d\",\"token\":\"cf33fcff3fe14b0fb91799815be2ab58\",\"time\":1747133446,\"last_api_millis\":1747135708494,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 11:29:09', '2025-05-13 11:42:17');
INSERT INTO `log_web_socket` VALUES (28, '10001', 'Basic eyJ1aWQiOiIwNTUzZTY1OWI2MGI0MmM0ODRhZDhjZjQ0OTE3MzAyNSIsImtleSI6IjA1NTNlNjU5YjYwYjQyYzQ4NGFkOGNmNDQ5MTczMDI1IiwidGltZSI6MTc0NzEzNTc2MCwic2lnbiI6ImZmMDQ1NTVkMGRhNTg0YWM4ZDkwODViOTVkNzIwYjkxIn0=', '1747135759663', 'xjwIAGdLFVxXSQArbAxOPk4A', 'OK但是uuid不一致', '0vu0zqoe', '0553e659b60b42c484ad8cf449173025', 'gongcheng@admin', '2025-05-13 11:50:54', NULL, '/172.24.0.7:37738', '{\"x-real-ip\":[\"119.28.86.14\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"119.28.86.14\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en;q=0.8\"],\"cookie\":[\"SESSION=OGIwMzQ2OGUtNTBiMi00MTgyLWIzMzctYjA3NTBlYjQzZjM0; %C3%A1fk%C3%B4en%C3%A1knEd=0553e659b60b42c484ad8cf449173025-8632239258d7418eaa94776c9c82b315; sidebarStatus=0\"],\"sec-websocket-key\":[\"Hv/mQdBT8PDrwnVGvgiTmA==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"119.28.86.14\",\"user_id\":\"UID010001\",\"uuid\":\"0553e659b60b42c484ad8cf449173025\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:0553e659b60b42c484ad8cf449173025\",\"token\":\"8632239258d7418eaa94776c9c82b315\",\"time\":1747134258,\"last_api_millis\":1747135754379,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 11:29:14', '2025-05-13 11:50:54');
INSERT INTO `log_web_socket` VALUES (29, '10001', 'Basic eyJ1aWQiOiI0NzZkOWU5MjA3ODg0ZDU0YWNhOTZjMGYyNGI4N2U3ZCIsImtleSI6IjQ3NmQ5ZTkyMDc4ODRkNTRhY2E5NmMwZjI0Yjg3ZTdkIiwidGltZSI6MTc0NzEzNjU0NCwic2lnbiI6IjhkNzg3MTE4ZjhhY2Y5Y2JmNWE0M2Q4MTI4Y2MxNWZkIn0=', '1747136543666', '93Q8YE9jCxcbN3EBMHgUYDkx', 'OK但是uuid不一致', 'kuq34ssk', '476d9e9207884d54aca96c0f24b87e7d', 'gongcheng@admin', '2025-05-13 11:42:46', NULL, '/172.24.0.7:45270', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=476d9e9207884d54aca96c0f24b87e7d-cf33fcff3fe14b0fb91799815be2ab58\"],\"sec-websocket-key\":[\"ahRrX6q9WKFCufrrn4HC/A==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"476d9e9207884d54aca96c0f24b87e7d\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:476d9e9207884d54aca96c0f24b87e7d\",\"token\":\"cf33fcff3fe14b0fb91799815be2ab58\",\"time\":1747133446,\"last_api_millis\":1747136511658,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 11:42:18', '2025-05-13 11:42:45');
INSERT INTO `log_web_socket` VALUES (30, '10001', 'Basic eyJ1aWQiOiI0NzZkOWU5MjA3ODg0ZDU0YWNhOTZjMGYyNGI4N2U3ZCIsImtleSI6IjQ3NmQ5ZTkyMDc4ODRkNTRhY2E5NmMwZjI0Yjg3ZTdkIiwidGltZSI6MTc0NzEzNjU3MSwic2lnbiI6ImQ4MTEzMjE3ZDg0MTMxNjQxMzVjYmQyNWFkMGM3ZGEzIn0=', '1747136571453', 'I291bmpBBEFDAANgM2AaXCxd', 'OK但是uuid不一致', 'l1mno231', '476d9e9207884d54aca96c0f24b87e7d', 'gongcheng@admin', '2025-05-13 11:42:48', NULL, '/172.24.0.7:34532', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=476d9e9207884d54aca96c0f24b87e7d-cf33fcff3fe14b0fb91799815be2ab58\"],\"sec-websocket-key\":[\"9e9OF2S9TU7a/rCQ1Y0ybw==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"476d9e9207884d54aca96c0f24b87e7d\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:476d9e9207884d54aca96c0f24b87e7d\",\"token\":\"cf33fcff3fe14b0fb91799815be2ab58\",\"time\":1747133446,\"last_api_millis\":1747136511658,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 11:42:46', '2025-05-13 11:42:48');
INSERT INTO `log_web_socket` VALUES (31, '10001', 'Basic eyJ1aWQiOiI5YTgxM2NhZDdmZjQ0MzhkYTMwY2NhNzhkNDhmOGJhNCIsImtleSI6IjlhODEzY2FkN2ZmNDQzOGRhMzBjY2E3OGQ0OGY4YmE0IiwidGltZSI6MTc0NzEzNjU3OSwic2lnbiI6IjlmZDA0YmE4NzgwNjk5MTlkNjc3M2M5ODc2ZGQyNzU4In0=', '1747136579470', 'KlxnIzA2XnR8Bl13eQJzYBhk', 'OK但是uuid不一致', 'wpcw2znh', '9a813cad7ff4438da30cca78d48f8ba4', 'gongcheng@admin', '2025-05-13 11:43:02', NULL, '/172.24.0.7:57660', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=9a813cad7ff4438da30cca78d48f8ba4-8153fb3d6d104eaf9070fab02c8ab36b\"],\"sec-websocket-key\":[\"i3juOM+3ugOWk8kjK7fakQ==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"9a813cad7ff4438da30cca78d48f8ba4\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:9a813cad7ff4438da30cca78d48f8ba4\",\"token\":\"8153fb3d6d104eaf9070fab02c8ab36b\",\"time\":1747136579,\"last_api_millis\":1747136574112,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":0}', '2025-05-13 11:42:54', '2025-05-13 11:43:01');
INSERT INTO `log_web_socket` VALUES (32, '100', 'Basic eyJ1aWQiOiI2NzMwNWUyYjY1YzY0ZWE4YTQ1ZWZkOTM4YjM0NWJkYyIsImtleSI6IjY3MzA1ZTJiNjVjNjRlYThhNDVlZmQ5MzhiMzQ1YmRjIiwidGltZSI6MTc0NzEzNjU5Miwic2lnbiI6IjMwMjI4OWY0MDljOTIzMzgwOTllZmI2OTE2YTQ0YTU2In0=', '1747136592193', 'CiI/M3pVDwdsNmpzIXNLN2VE', 'OK但是uuid不一致', '4jv0swba', '67305e2b65c64ea8a45efd938b345bdc', 'sysadmin', '2025-05-13 11:48:42', NULL, '/172.24.0.7:49230', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=67305e2b65c64ea8a45efd938b345bdc-28009d10e41a465886baadad60e07f97\"],\"sec-websocket-key\":[\"99Jn197AxR1gawyg7QIlxw==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID000001\",\"uuid\":\"67305e2b65c64ea8a45efd938b345bdc\",\"account\":\"sysadmin\",\"company_id\":\"100\",\"role_flag\":100,\"role_id\":null,\"key\":\"TOKEN:BUS:67305e2b65c64ea8a45efd938b345bdc\",\"token\":\"28009d10e41a465886baadad60e07f97\",\"time\":1747136592,\"last_api_millis\":1747136586367,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 11:43:07', '2025-05-13 11:48:42');
INSERT INTO `log_web_socket` VALUES (33, '10001', 'Basic eyJ1aWQiOiI0ZWUyMjk0ODU1ZmM0NTYxOWVmZDFjNmJlYTA2NzE3MCIsImtleSI6IjRlZTIyOTQ4NTVmYzQ1NjE5ZWZkMWM2YmVhMDY3MTcwIiwidGltZSI6MTc0NzEzNjkzNCwic2lnbiI6IjA4OGJlMjZlNTA2NjliZWNiMzI0NGExM2ZhOGZmOWViIn0=', '1747136933923', 'JFdcERIWVH5EB00ZdwtQVxZe', 'OK但是uuid不一致', 'fjffkj1j', '4ee2294855fc45619efd1c6bea067170', 'gongcheng@admin', '2025-05-13 11:50:59', NULL, '/172.24.0.7:56050', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=4ee2294855fc45619efd1c6bea067170-ba5e47831d4e4043aaa67eece76f298c\"],\"sec-websocket-key\":[\"aBQj4NBz5Mvkm9MT6XTKsw==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"4ee2294855fc45619efd1c6bea067170\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:4ee2294855fc45619efd1c6bea067170\",\"token\":\"ba5e47831d4e4043aaa67eece76f298c\",\"time\":1747136934,\"last_api_millis\":1747136928561,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":0}', '2025-05-13 11:48:48', '2025-05-13 11:50:59');
INSERT INTO `log_web_socket` VALUES (34, '100', 'Basic eyJ1aWQiOiI5MjRlYjFhZTQxYTg0NGMyYTg3Y2M2NjYwMTI5ODYxOSIsImtleSI6IjkyNGViMWFlNDFhODQ0YzJhODdjYzY2NjAxMjk4NjE5IiwidGltZSI6MTc0NzEzNzA3Mywic2lnbiI6IjM3N2UyN2RkOTQwMWYzOTNiMmM4MTA5MDNhZDA2MThiIn0=', '1747137073339', 'yAZ2GH54PHlwb2wiXiYcSn8C', 'OK但是uuid不一致', 'itwtlcc5', '924eb1ae41a844c2a87cc66601298619', 'sysadmin', '2025-05-13 11:51:25', NULL, '/172.24.0.7:50686', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=924eb1ae41a844c2a87cc66601298619-b7a5694dbf0a46e79e49cd3d90e5ebbe\"],\"sec-websocket-key\":[\"8ingBbOX8EiEFxEuMjSd2w==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID000001\",\"uuid\":\"924eb1ae41a844c2a87cc66601298619\",\"account\":\"sysadmin\",\"company_id\":\"100\",\"role_flag\":100,\"role_id\":null,\"key\":\"TOKEN:BUS:924eb1ae41a844c2a87cc66601298619\",\"token\":\"b7a5694dbf0a46e79e49cd3d90e5ebbe\",\"time\":1747137073,\"last_api_millis\":1747137067947,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 11:51:08', '2025-05-13 11:51:25');
INSERT INTO `log_web_socket` VALUES (35, '10001', 'Basic eyJ1aWQiOiI0OTk2ZWY0ZGZlMTQ0NGNiYjE2M2RlOWJmZTZlYzZiNSIsImtleSI6IjQ5OTZlZjRkZmUxNDQ0Y2JiMTYzZGU5YmZlNmVjNmI1IiwidGltZSI6MTc0NzEzNzA5Niwic2lnbiI6IjBmYTQ3NDdmOTY3YmU1MmJhZDYzYzQ1MWMzNTIyNTQ0In0=', '1747137095616', 'AmJVMlRXBk9LaSM3ZzNLSCM8', 'OK但是uuid不一致', 'sujbrtpv', '4996ef4dfe1444cbb163de9bfe6ec6b5', 'gongcheng@admin', '2025-05-13 11:54:19', NULL, '/172.24.0.7:36336', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=4996ef4dfe1444cbb163de9bfe6ec6b5-aeed5ad807d04d7fa8f6b9902a79325a\"],\"sec-websocket-key\":[\"XN4Njsq3qHZrwAK5QI+Nyw==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"4996ef4dfe1444cbb163de9bfe6ec6b5\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:4996ef4dfe1444cbb163de9bfe6ec6b5\",\"token\":\"aeed5ad807d04d7fa8f6b9902a79325a\",\"time\":1747137095,\"last_api_millis\":1747137090217,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":0}', '2025-05-13 11:51:30', '2025-05-13 11:54:19');
INSERT INTO `log_web_socket` VALUES (36, '100', 'Basic eyJ1aWQiOiJlOWQ4NzZhZTg3YjI0Y2Q0YmZlMTZiOTg5OThlNTM3MCIsImtleSI6ImU5ZDg3NmFlODdiMjRjZDRiZmUxNmI5ODk5OGU1MzcwIiwidGltZSI6MTc0NzEzNzI3MCwic2lnbiI6IjE2Y2ZjNzNiMjlkODlmYzk4YjNmYjNhMzMxNGI4NDczIn0=', '1747137270059', '3hUNI2xDEVhWUEsVN2RjaGgY', 'OK但是uuid不一致', 'i2y23uud', 'e9d876ae87b24cd4bfe16b98998e5370', 'sysadmin', '2025-05-13 11:54:38', NULL, '/172.24.0.7:43286', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=e9d876ae87b24cd4bfe16b98998e5370-9d861dc2d5144e56bcf19de40dff507a\"],\"sec-websocket-key\":[\"FvxlEK//nhkcrCXwCR6qbA==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID000001\",\"uuid\":\"e9d876ae87b24cd4bfe16b98998e5370\",\"account\":\"sysadmin\",\"company_id\":\"100\",\"role_flag\":100,\"role_id\":null,\"key\":\"TOKEN:BUS:e9d876ae87b24cd4bfe16b98998e5370\",\"token\":\"9d861dc2d5144e56bcf19de40dff507a\",\"time\":1747137270,\"last_api_millis\":1747137264694,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 11:54:25', '2025-05-13 11:54:37');
INSERT INTO `log_web_socket` VALUES (37, '10001', 'Basic eyJ1aWQiOiI0YjEyZmVhMDU5NTE0YzI4YjAzYTkxZmM3NDM5NThkYSIsImtleSI6IjRiMTJmZWEwNTk1MTRjMjhiMDNhOTFmYzc0Mzk1OGRhIiwidGltZSI6MTc0NzEzNzI4OCwic2lnbiI6IjgwYTFmNTM5ZjhjYjI5YTVhZTM4MmY3Zjg1ODFiNDQ4In0=', '1747137288257', '7WwPPRcUcU92TBBdJkJ6bS8n', 'OK但是uuid不一致', '2zormn2g', '4b12fea059514c28b03a91fc743958da', 'gongcheng@admin', '2025-05-13 11:55:03', NULL, '/172.24.0.7:36322', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=4b12fea059514c28b03a91fc743958da-4f9cc032005e49d69fb423d33195747c\"],\"sec-websocket-key\":[\"KvDT61D0XOjo3DaujDgm9w==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"4b12fea059514c28b03a91fc743958da\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:4b12fea059514c28b03a91fc743958da\",\"token\":\"4f9cc032005e49d69fb423d33195747c\",\"time\":1747137288,\"last_api_millis\":1747137282896,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":0}', '2025-05-13 11:54:43', '2025-05-13 11:55:02');
INSERT INTO `log_web_socket` VALUES (38, '100', 'Basic eyJ1aWQiOiJkMzg3NDE4ZjFiYmM0YzUzYjdjMzM3M2E2MjdiYzFjMiIsImtleSI6ImQzODc0MThmMWJiYzRjNTNiN2MzMzczYTYyN2JjMWMyIiwidGltZSI6MTc0NzEzNzMxNSwic2lnbiI6ImMwMWVlYjM0OTVjMjg2ZDQ4OTg3ZjM2ZGJhYTk2N2I0In0=', '1747137314507', 'NzcALnd1EBgbd3hTSS5UMHlx', 'OK但是uuid不一致', '0uf21hg3', 'd387418f1bbc4c53b7c3373a627bc1c2', 'sysadmin', '2025-05-13 11:55:22', NULL, '/172.24.0.7:56568', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=d387418f1bbc4c53b7c3373a627bc1c2-1bd1e55c325e4bb18ac5c1a22b05a3b3\"],\"sec-websocket-key\":[\"7o6Eb6BRHFWWmg2iFHaz7g==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID000001\",\"uuid\":\"d387418f1bbc4c53b7c3373a627bc1c2\",\"account\":\"sysadmin\",\"company_id\":\"100\",\"role_flag\":100,\"role_id\":null,\"key\":\"TOKEN:BUS:d387418f1bbc4c53b7c3373a627bc1c2\",\"token\":\"1bd1e55c325e4bb18ac5c1a22b05a3b3\",\"time\":1747137314,\"last_api_millis\":1747137309141,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 11:55:09', '2025-05-13 11:55:22');
INSERT INTO `log_web_socket` VALUES (39, '10001', 'Basic eyJ1aWQiOiJmZmNmOGRlMGI2NzU0NDNlODA2NTA2NWE5NjEzOTNmZiIsImtleSI6ImZmY2Y4ZGUwYjY3NTQ0M2U4MDY1MDY1YTk2MTM5M2ZmIiwidGltZSI6MTc0NzEzNzMzMiwic2lnbiI6Ijc5YjlhODUzNjc5NDIzMjQ2ZmZmYjVmMmM0YWFlMjY3In0=', '1747137331660', '3StvTU9lFiRIQVMTRhJaOlkX', 'OK但是uuid不一致', 'imcfme1x', 'ffcf8de0b675443e8065065a961393ff', 'gongcheng@admin', '2025-05-13 11:56:02', NULL, '/172.24.0.7:39028', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=ffcf8de0b675443e8065065a961393ff-08c6bd4a2c864e2aa69ab12b6f4635bc\"],\"sec-websocket-key\":[\"JvpMFOlRMqfrIdvGj/soXw==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"ffcf8de0b675443e8065065a961393ff\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:ffcf8de0b675443e8065065a961393ff\",\"token\":\"08c6bd4a2c864e2aa69ab12b6f4635bc\",\"time\":1747137332,\"last_api_millis\":1747137326293,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":0}', '2025-05-13 11:55:26', '2025-05-13 11:56:02');
INSERT INTO `log_web_socket` VALUES (40, '100', 'Basic eyJ1aWQiOiI2MzllN2Y0OWUxYTM0YjE0OTcwNTljMjAwMWM0NmE1YyIsImtleSI6IjYzOWU3ZjQ5ZTFhMzRiMTQ5NzA1OWMyMDAxYzQ2YTVjIiwidGltZSI6MTc0NzEzNzM3Mywic2lnbiI6ImQzM2JlMjc3MDU2NjMxYzQyYWExMTM5ZGIyZWU5OGMzIn0=', '1747137372777', 'K2BdfzQccXl1DV9yClkrXyNl', 'OK但是uuid不一致', 't0wyzw3y', '639e7f49e1a34b1497059c2001c46a5c', 'sysadmin', '2025-05-13 11:56:21', NULL, '/172.24.0.7:52710', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=639e7f49e1a34b1497059c2001c46a5c-e721e8ac62c74324aaea34f2e1f28e64\"],\"sec-websocket-key\":[\"5fXopjFLDXNFGIhdEgV5mg==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID000001\",\"uuid\":\"639e7f49e1a34b1497059c2001c46a5c\",\"account\":\"sysadmin\",\"company_id\":\"100\",\"role_flag\":100,\"role_id\":null,\"key\":\"TOKEN:BUS:639e7f49e1a34b1497059c2001c46a5c\",\"token\":\"e721e8ac62c74324aaea34f2e1f28e64\",\"time\":1747137373,\"last_api_millis\":1747137367417,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":null}', '2025-05-13 11:56:07', '2025-05-13 11:56:21');
INSERT INTO `log_web_socket` VALUES (41, '10001', 'Basic eyJ1aWQiOiI2Y2Q0ZDYyNDVkZTQ0MTgzODA0OGZkYmI5NGJlYzE5YyIsImtleSI6IjZjZDRkNjI0NWRlNDQxODM4MDQ4ZmRiYjk0YmVjMTljIiwidGltZSI6MTc0NzEzNzM5NCwic2lnbiI6ImIwYTM1MGMzMjc5NTZmZGIzNzcyYzVlOWQyYzg1ZGFiIn0=', '1747137393633', '4nwLZAIsag0HBVwuGUo4DTQc', 'OK但是uuid不一致', 'mfxdtk2k', '6cd4d6245de441838048fdbb94bec19c', 'gongcheng@admin', NULL, NULL, '/172.24.0.7:40440', '{\"x-real-ip\":[\"183.14.31.32\"],\"host\":[\"36.212.31.166:9080\"],\"x-forwarded-for\":[\"183.14.31.32\"],\"upgrade\":[\"websocket\"],\"connection\":[\"upgrade\"],\"pragma\":[\"no-cache\"],\"cache-control\":[\"no-cache\"],\"user-agent\":[\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"],\"origin\":[\"http://36.212.31.166:9080\"],\"sec-websocket-version\":[\"13\"],\"accept-encoding\":[\"gzip, deflate\"],\"accept-language\":[\"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,th;q=0.6\"],\"cookie\":[\"SESSION=MWExOTgwMTUtOGI2ZC00ZTllLWIwM2ItODg4ZTNiNjBjZTRj; %C3%A1fk%C3%B4en%C3%A1knEd=6cd4d6245de441838048fdbb94bec19c-ba21a1a71bc34dc4bedd959715bab955\"],\"sec-websocket-key\":[\"D/+smUNZknXvhbBfUbh1Vg==\"],\"sec-websocket-extensions\":[\"permessage-deflate; client_max_window_bits\"]}', '{\"ip\":\"183.14.31.32\",\"user_id\":\"UID010001\",\"uuid\":\"6cd4d6245de441838048fdbb94bec19c\",\"account\":\"gongcheng@admin\",\"company_id\":\"10001\",\"role_flag\":1,\"role_id\":null,\"key\":\"TOKEN:BUS:6cd4d6245de441838048fdbb94bec19c\",\"token\":\"ba21a1a71bc34dc4bedd959715bab955\",\"time\":1747137393,\"last_api_millis\":1747137388221,\"last_app_millis\":null,\"user_agent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\",\"build_time\":\"2025-05-13T01:28:02.877Z\",\"lang\":null,\"encrypt\":0}', '2025-05-13 11:56:28', '2025-05-13 11:56:28');

-- ----------------------------
-- Table structure for operation_fuel
-- ----------------------------
DROP TABLE IF EXISTS `operation_fuel`;
CREATE TABLE `operation_fuel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '加油加气，充电',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路企业',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期 yyyy-mm-dd',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0.000' COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0.000' COMMENT '车辆名称',
  `type_id` smallint(6) NOT NULL DEFAULT 0 COMMENT '1加油 2加气 3充电',
  `event_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '事件时间',
  `quantity` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '加油量',
  `total_price` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '总价',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_wr`(`work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_fuel
-- ----------------------------

-- ----------------------------
-- Table structure for operation_ic_card
-- ----------------------------
DROP TABLE IF EXISTS `operation_ic_card`;
CREATE TABLE `operation_ic_card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '线路当天运营参数',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路企业',
  `terminal_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IC卡终端ID',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `card_type` int(11) NOT NULL DEFAULT 0 COMMENT '磁卡类型 1普通卡 2学生卡 3老人卡 4系统卡',
  `event_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '刷卡时间',
  `original_price` decimal(10, 2) NOT NULL COMMENT '原票价',
  `discount` decimal(10, 0) NOT NULL DEFAULT 100 COMMENT '折扣',
  `consume` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实际价格',
  `balance` decimal(10, 2) NULL DEFAULT NULL COMMENT '余额',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_ic_card
-- ----------------------------

-- ----------------------------
-- Table structure for operation_income
-- ----------------------------
DROP TABLE IF EXISTS `operation_income`;
CREATE TABLE `operation_income`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '票款收入',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路企业',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期 yyyy-mm-dd',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路名称',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶员',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶员',
  `income` decimal(11, 3) NOT NULL COMMENT '总收入',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique`(`route_id`, `work_date`, `car_id`, `emp_id`, `is_deleted`) USING BTREE,
  INDEX `ix_cwr`(`company_id`, `work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_income
-- ----------------------------

-- ----------------------------
-- Table structure for owner_console
-- ----------------------------
DROP TABLE IF EXISTS `owner_console`;
CREATE TABLE `owner_console`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '调度台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `console_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度台id',
  `console_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dispatch`(`company_id`, `console_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of owner_console
-- ----------------------------

-- ----------------------------
-- Table structure for owner_console_route
-- ----------------------------
DROP TABLE IF EXISTS `owner_console_route`;
CREATE TABLE `owner_console_route`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '调度台关联线路',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `console_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度台id',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_dispatch_route`(`company_id`, `console_id`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of owner_console_route
-- ----------------------------

-- ----------------------------
-- Table structure for owner_console_user
-- ----------------------------
DROP TABLE IF EXISTS `owner_console_user`;
CREATE TABLE `owner_console_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '调度台关联用户',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度台id',
  `console_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_dispatch_user`(`company_id`, `console_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of owner_console_user
-- ----------------------------

-- ----------------------------
-- Table structure for owner_role
-- ----------------------------
DROP TABLE IF EXISTS `owner_role`;
CREATE TABLE `owner_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `role_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_flag` smallint(6) NOT NULL DEFAULT 0 COMMENT '0普通 1管理员 100系统管理员',
  `function_group` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '功能组JSON数组 [“A”,\"B\"]',
  `editable_days` int(6) NULL DEFAULT 7 COMMENT '数据封存多少天',
  `is_share` smallint(6) NOT NULL DEFAULT 0 COMMENT '平台共享',
  `sort_id` int(11) NULL DEFAULT 100 COMMENT '排序',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '0=正常 1=删除',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`company_id`, `role_name`, `is_deleted`) USING BTREE,
  UNIQUE INDEX `uk_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of owner_role
-- ----------------------------
INSERT INTO `owner_role` VALUES (1, '100', 'RID000000', 'System', 100, NULL, 7, 1, 100, '100', 0, NULL, '2019-08-23 07:45:42', '2019-11-01 02:18:17');
INSERT INTO `owner_role` VALUES (2, '100', 'RID000001', 'Admin', 1, NULL, 7, 1, 1, '1', 0, NULL, '2019-08-23 07:45:42', '2019-11-01 02:17:57');
INSERT INTO `owner_role` VALUES (3, '100', 'RID000002', 'User', 0, NULL, 7, 1, 0, '0', 0, NULL, '2019-08-23 07:45:42', '2019-11-01 02:18:03');

-- ----------------------------
-- Table structure for owner_role_perm
-- ----------------------------
DROP TABLE IF EXISTS `owner_role_perm`;
CREATE TABLE `owner_role_perm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `role_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `module_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块id',
  `perm` int(11) NOT NULL DEFAULT 0 COMMENT '权限',
  `module_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '0默认 1datav',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ix_role_module`(`company_id`, `role_id`, `module_id`) USING BTREE,
  INDEX `idx_role`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of owner_role_perm
-- ----------------------------

-- ----------------------------
-- Table structure for owner_user
-- ----------------------------
DROP TABLE IF EXISTS `owner_user`;
CREATE TABLE `owner_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '上级id，用于用户树，保留',
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '21218CCA77804D2BA1922C33E0151105' COMMENT '密码，默认888888',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '名称',
  `role_flag` int(11) NOT NULL DEFAULT 0 COMMENT '是否管理员 0=不是 1=企业管理员 100超级管理员',
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'static/images/user-boy.png' COMMENT '用户头像 默认在 static下 注意字符串最左边没有 /',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '到期时间',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `password_change_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次修改密码时间',
  `password_expire_days` int(11) NULL DEFAULT 0 COMMENT '定期修改密码天数 0不需要',
  `last_login_in_time` datetime NULL DEFAULT NULL COMMENT '最后登陆时间',
  `union_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户统一标识',
  `max_login_allow` int(11) NULL DEFAULT 3 COMMENT '最大允许同时登陆',
  `encrypt` smallint(6) NULL DEFAULT NULL COMMENT '数据加密方式',
  `user_config` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户一些自定义配置文件',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_account`(`account`, `is_deleted`) USING BTREE,
  UNIQUE INDEX `uk_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of owner_user
-- ----------------------------
INSERT INTO `owner_user` VALUES (1, '100', 'UID000001', '', 'sysadmin', '21218CCA77804D2BA1922C33E0151105', '平台管理员', 100, 'static/images/user-boy.png', '', '', '平台管理员', NULL, NULL, 0, '2025-05-13 06:44:32', 0, '2025-05-13 11:56:07', NULL, 3, NULL, NULL, '2019-08-23 07:49:08', '2025-05-13 11:56:07');
INSERT INTO `owner_user` VALUES (2, '100', 'UID000002', '', 'lin', '21218CCA77804D2BA1922C33E0151105', '林工', 100, 'static/images/user-boy.png', '', 'lin557@126.com', '系统测试', NULL, NULL, 0, '2025-05-13 06:44:32', 0, NULL, NULL, 3, NULL, NULL, '2019-08-23 07:49:08', '2021-06-29 01:57:21');
INSERT INTO `owner_user` VALUES (3, '100', 'UID000003', '', 'eason', '21218CCA77804D2BA1922C33E0151105', '聂工', 100, 'static/images/user-boy.png', '', '330811792@qq.com', '系统测试', NULL, NULL, 0, '2025-05-13 06:44:32', 0, NULL, NULL, 3, NULL, NULL, '2019-08-23 07:49:08', '2021-06-29 01:57:22');
INSERT INTO `owner_user` VALUES (4, '10001', 'UID010001', '', 'gongcheng@admin', '5E28E1C011ED5A673F708B6DD5634507', 'gongcheng@admin', 1, '/files/img/user/336e793aaf154bf1bd5d203e3788c385.png', NULL, NULL, 'auto create', NULL, NULL, 0, '2025-05-13 08:48:45', 0, '2025-05-13 11:56:28', NULL, 3, 0, NULL, '2025-05-13 08:48:44', '2025-05-13 11:56:28');
INSERT INTO `owner_user` VALUES (5, '10001', 'UID010002', '', 'gongcheng@tg', '8204A34D6CAA61C262DADE8CC9633C9E', 'gongcheng@tg', 1, '/files/img/user/0217e9561c6544178d2c2e3f377654c7.png', NULL, NULL, 'auto create', NULL, NULL, 0, '2025-05-13 08:48:45', 0, NULL, NULL, 3, 0, NULL, '2025-05-13 08:48:45', '2025-05-13 11:42:42');

-- ----------------------------
-- Table structure for owner_user_alarm
-- ----------------------------
DROP TABLE IF EXISTS `owner_user_alarm`;
CREATE TABLE `owner_user_alarm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户关联角色表',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应t_company的company_id',
  `user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应owner_user的user_id',
  `platform_alarm_id` int(11) NULL DEFAULT NULL COMMENT '对应平台报警ID',
  `web_notice` int(11) NOT NULL DEFAULT 0 COMMENT 'web是否接收 0接收 1拒绝',
  `app_notice` int(11) NOT NULL DEFAULT 0 COMMENT 'app是否接收 0接收 1拒绝',
  `mail_notice` int(11) NOT NULL DEFAULT 0 COMMENT 'mail是否接收 0接收 1拒绝',
  `is_show` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否开启报警弹窗',
  `duration` int(11) NOT NULL DEFAULT 30 COMMENT '弹窗显示时长(s)',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_alarm`(`company_id`, `user_id`, `platform_alarm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of owner_user_alarm
-- ----------------------------

-- ----------------------------
-- Table structure for owner_user_app
-- ----------------------------
DROP TABLE IF EXISTS `owner_user_app`;
CREATE TABLE `owner_user_app`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户敏感信息之昵称',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户敏感信息之联系电话',
  `avatar` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户敏感信息之头像',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of owner_user_app
-- ----------------------------

-- ----------------------------
-- Table structure for owner_user_auth_app
-- ----------------------------
DROP TABLE IF EXISTS `owner_user_auth_app`;
CREATE TABLE `owner_user_auth_app`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录类型(手机号/邮箱) 或第三方应用名称 (微信/微博等)',
  `identifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号/邮箱/第三方的唯一标识',
  `credential` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码凭证 (自建账号的保存密码, 第三方的保存 token)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_account`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of owner_user_auth_app
-- ----------------------------

-- ----------------------------
-- Table structure for owner_user_company
-- ----------------------------
DROP TABLE IF EXISTS `owner_user_company`;
CREATE TABLE `owner_user_company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户关联角色表',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应t_company的company_id',
  `user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应own_user的user_id',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_userrole`(`user_id`, `company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of owner_user_company
-- ----------------------------

-- ----------------------------
-- Table structure for owner_user_organize
-- ----------------------------
DROP TABLE IF EXISTS `owner_user_organize`;
CREATE TABLE `owner_user_organize`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户关联角色表',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应t_company的company_id',
  `user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应owner_user的user_id',
  `org_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应fleet和roule的guid',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_org`(`user_id`, `org_id`) USING BTREE,
  INDEX `idx_user_org`(`company_id`, `user_id`, `org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of owner_user_organize
-- ----------------------------

-- ----------------------------
-- Table structure for owner_user_role
-- ----------------------------
DROP TABLE IF EXISTS `owner_user_role`;
CREATE TABLE `owner_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户关联角色表',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应owner_user的user_id',
  `role_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应own_role的role_id',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_userrole`(`company_id`, `user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of owner_user_role
-- ----------------------------
INSERT INTO `owner_user_role` VALUES (2, '10001', 'UID010001', 'RID000001', 'UID010001', '2025-05-13 11:42:33', '2025-05-13 11:42:33');
INSERT INTO `owner_user_role` VALUES (3, '10001', 'UID010002', 'RID000001', 'UID010001', '2025-05-13 11:42:42', '2025-05-13 11:42:42');

-- ----------------------------
-- Table structure for owner_user_third
-- ----------------------------
DROP TABLE IF EXISTS `owner_user_third`;
CREATE TABLE `owner_user_third`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '第三方登陆验证',
  `open_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `third_origin` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联的用户ID',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联的用户企业',
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联账号',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关联用户姓名',
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'static/images/user-boy.png' COMMENT '第三方图片',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_account`(`account`, `is_deleted`) USING BTREE,
  UNIQUE INDEX `uk_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of owner_user_third
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_attendance
-- ----------------------------
DROP TABLE IF EXISTS `schedule_attendance`;
CREATE TABLE `schedule_attendance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '当天司机签到情况',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'yyyy-mm-dd日期 忽略时区',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `emp_type` smallint(6) NOT NULL DEFAULT 1 COMMENT '员工类型 0默认1 驾驶员 2乘务员 3站务',
  `emp_state` smallint(6) NOT NULL DEFAULT 100 COMMENT '司机状态0正常, 10请假 100机动 1000当天没排班',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `archives_route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '档案线路ID',
  `archives_route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆档案线路名称',
  `plan_serial` smallint(6) NULL DEFAULT NULL COMMENT '计划班次',
  `plan_work_time` datetime NULL DEFAULT NULL COMMENT '计划上班时间',
  `plan_car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划签到车辆车辆id',
  `plan_car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划签到车辆名称',
  `plan_lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `origin_station` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '起点站',
  `check_flag` smallint(6) NOT NULL DEFAULT 0 COMMENT '最后状态0未签到 1签到 2签退',
  `check_time` datetime NULL DEFAULT NULL COMMENT '签到时间',
  `check_route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实际签到线路',
  `check_route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实际签到线路名称',
  `check_car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到车辆ID',
  `check_car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到车辆名称',
  `check_lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `is_work_late` int(11) NULL DEFAULT 0 COMMENT '上班迟到',
  `is_leave_early` int(11) NULL DEFAULT 0 COMMENT '下班早退',
  `spell` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母拼写',
  `first_check_time` datetime NULL DEFAULT NULL COMMENT '当天第一次刷卡时间',
  `last_check_time` datetime NULL DEFAULT NULL COMMENT '当天最后一次刷卡时间',
  `plan_table_id` int(11) NULL DEFAULT NULL COMMENT '计划调度主表schedule_plan_table的ID',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '1 表示删除，0 表示未删除',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_attendance`(`company_id`, `work_date`, `emp_id`, `is_deleted`) USING BTREE,
  INDEX `idx_attendance`(`work_date`, `route_id`) USING BTREE,
  INDEX `idx_date_route`(`company_id`, `work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_attendance
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_idle
-- ----------------------------
DROP TABLE IF EXISTS `schedule_idle`;
CREATE TABLE `schedule_idle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆id',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `idle_type` smallint(6) NULL DEFAULT NULL COMMENT '非运营类型 0其他 1空放 2加油 3修车 4保养 5洗车 6事故 7年审 8通勤',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `start_mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT 'GPS里程',
  `end_mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT 'GPS里程',
  `real_mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '实际里程,默认值=计划里程',
  `gps_mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT 'GPS里程',
  `state` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态 0未执行 1执行中 2完成 3取消',
  `origin` smallint(6) NOT NULL DEFAULT 0 COMMENT '来源 0调度 1导入 100补录 200排班',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `serial` smallint(6) NOT NULL DEFAULT 0 COMMENT '当前班次,行号',
  `series` smallint(6) NOT NULL DEFAULT 0 COMMENT '当前趟次，列号',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '1 表示删除，0 表示未删除',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_routename`(`company_id`, `car_id`) USING BTREE,
  INDEX `idx_routeid`(`company_id`) USING BTREE,
  INDEX `idx_workdate`(`company_id`, `work_date`, `car_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_idle
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_master
-- ----------------------------
DROP TABLE IF EXISTS `schedule_master`;
CREATE TABLE `schedule_master`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日程安排表',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'yyyy-mm-dd日期 忽略时区',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `scheme_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营方案',
  `scheme_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方案名称',
  `serial` smallint(6) NOT NULL COMMENT '班次',
  `class_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '班次类型 0正班 100机动',
  `first_time` datetime NULL DEFAULT NULL COMMENT '早班上班时间',
  `first_plan` datetime NULL DEFAULT NULL COMMENT '早班司机第一班发车时间',
  `first_direction` smallint(6) NULL DEFAULT NULL COMMENT '早班方向 1上行2下行',
  `first_car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班车辆',
  `first_car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班司机工号',
  `first_emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班司机姓名',
  `first_conductor_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班乘务员工号',
  `first_conductor_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班乘务员姓名',
  `second_time` datetime NULL DEFAULT NULL COMMENT '中班上班时间',
  `second_plan` datetime NULL DEFAULT NULL COMMENT '中班第一班发车时间',
  `second_direction` smallint(6) NULL DEFAULT NULL COMMENT '中班方向 1下行2上行',
  `second_car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班车辆',
  `second_car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `second_emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班司机工号',
  `second_emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班司机姓名',
  `second_conductor_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班乘务员工号',
  `second_conductor_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班乘务员姓名',
  `third_time` datetime NULL DEFAULT NULL COMMENT '晚班上班时间',
  `third_plan` datetime NULL DEFAULT NULL COMMENT '晚班第一班发车时间',
  `third_direction` smallint(6) NULL DEFAULT NULL COMMENT '晚班方向 1下行2上行',
  `third_car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班车辆',
  `third_car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `third_emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班司机工号',
  `third_emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班司机姓名',
  `third_conductor_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班乘务员工号',
  `third_conductor_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班乘务员姓名',
  `is_night` smallint(6) NOT NULL DEFAULT 0 COMMENT '夜班',
  `is_across` smallint(6) NOT NULL DEFAULT 0 COMMENT '跨天',
  `attach` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他附加 预留JSON',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ws`(`work_date`, `scheme_id`) USING BTREE,
  INDEX `idx_wr`(`work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_master
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_plan
-- ----------------------------
DROP TABLE IF EXISTS `schedule_plan`;
CREATE TABLE `schedule_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `run_route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行线路id',
  `run_route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `plan_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '计划类型 0正常 1临时线路 2区间 3大站 4延长线 100包车',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆id',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `conductor_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售票员工号',
  `conductor_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售票号姓名',
  `direction` smallint(6) NOT NULL COMMENT '方向',
  `table_depart` datetime NULL DEFAULT NULL COMMENT '原运营方案计划发车',
  `plan_depart` datetime NOT NULL COMMENT '计划发车',
  `real_depart` datetime NULL DEFAULT NULL COMMENT '实际发车',
  `table_arrive` datetime NULL DEFAULT NULL COMMENT '原运营方案计划到达',
  `plan_arrive` datetime NOT NULL COMMENT '计划到达',
  `real_arrive` datetime NULL DEFAULT NULL COMMENT '实际到达',
  `plan_mileage` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '计划里程',
  `real_mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '实际里程,默认值=计划里程',
  `gps_mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT 'GPS里程',
  `state` smallint(6) NOT NULL DEFAULT 0 COMMENT '计划状态 0未执行  1执行中 2完成 3取消',
  `is_scheduled` smallint(6) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0未排班 1已排班',
  `send_bus` smallint(6) NULL DEFAULT 0 COMMENT '通知车辆',
  `send_screen` smallint(6) NULL DEFAULT 0 COMMENT '通知调度屏',
  `add_id` smallint(6) NULL DEFAULT NULL COMMENT '添加原因',
  `change_id` smallint(6) NULL DEFAULT NULL COMMENT '变更原因',
  `cancel_id` smallint(6) NULL DEFAULT NULL COMMENT '取消原因',
  `trips` decimal(11, 3) NOT NULL DEFAULT 1.000 COMMENT '趟次',
  `origin` smallint(6) NOT NULL DEFAULT 0 COMMENT '来源 0排班 1进场排班 2请求排班 3立即排班 50调度添加 100补录',
  `table_serial` smallint(6) NULL DEFAULT NULL COMMENT '原运营方案计划班次',
  `serial` smallint(6) NOT NULL DEFAULT 0 COMMENT '当前班次',
  `series` smallint(6) NOT NULL DEFAULT 0 COMMENT '当前趟次',
  `class_id` smallint(6) NULL DEFAULT 0 COMMENT '班别  1早班  2中班  3晚班',
  `abnormal_id` smallint(6) NULL DEFAULT NULL COMMENT '异常',
  `abnormal_time` datetime NULL DEFAULT NULL,
  `abnormal_stop` varchar(196) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `origin_station` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '起点站',
  `terminal_station` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终点站',
  `attach` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他数据',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_time_out` smallint(6) NOT NULL DEFAULT 0 COMMENT '超时标识 10预计发车超时 20发车已超时 30预计到达超时 40到达已超时',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '1 表示删除，0 表示未删除',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_crw`(`company_id`, `route_id`, `work_date`) USING BTREE,
  INDEX `idx_wr`(`work_date`, `route_id`) USING BTREE,
  INDEX `idx_cwe`(`company_id`, `work_date`, `emp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_plan
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_plan_table
-- ----------------------------
DROP TABLE IF EXISTS `schedule_plan_table`;
CREATE TABLE `schedule_plan_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `run_code` int(11) NULL DEFAULT NULL COMMENT '运行线路id,废弃',
  `run_route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行线路id',
  `run_route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行线路名称',
  `scheme_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营方案',
  `plan_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '计划类型 0正常 1包车 2区间 3大站',
  `trips` decimal(11, 3) NOT NULL DEFAULT 1.000 COMMENT '趟次',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆id',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `conductor_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售票员工号',
  `conductor_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售票员姓名',
  `direction` smallint(6) NOT NULL COMMENT '方向 1下行2上行',
  `plan_depart` datetime NOT NULL COMMENT '计划发车',
  `plan_arrive` datetime NOT NULL COMMENT '计划到达',
  `plan_mileage` decimal(11, 3) NOT NULL COMMENT '计划里程',
  `serial` smallint(6) NULL DEFAULT NULL COMMENT '当前班次',
  `series` smallint(6) NULL DEFAULT NULL COMMENT '当前趟次',
  `state` smallint(6) NULL DEFAULT 0 COMMENT '状态',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `class_id` smallint(6) NOT NULL DEFAULT 1 COMMENT '班次1早2中3晚',
  `schedule_plan_id` int(11) NULL DEFAULT NULL COMMENT '计划调度主表schedule_plan的ID',
  `origin_station` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '起点站',
  `terminal_station` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终点站',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `old_plan_depart` datetime NULL DEFAULT NULL COMMENT '原计划发车',
  `old_car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原车辆id',
  `old_car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原车辆名称',
  `old_emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原工号',
  `old_emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原姓名',
  `old_lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原车牌号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_work_date`(`company_id`, `route_id`, `work_date`) USING BTREE,
  INDEX `idx_plan_id`(`company_id`, `work_date`, `schedule_plan_id`) USING BTREE,
  INDEX `idx_date_emp`(`company_id`, `work_date`, `emp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_plan_table
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_request
-- ----------------------------
DROP TABLE IF EXISTS `schedule_request`;
CREATE TABLE `schedule_request`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '终端唯一码',
  `request_code` int(11) NOT NULL DEFAULT 0 COMMENT '终端司机请求命令ID',
  `request_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终端司机请求命令名称',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `event_code` int(11) NOT NULL DEFAULT 0 COMMENT '事件代码',
  `bind_run_state` int(11) NOT NULL DEFAULT 0 COMMENT '事件代码=其他的时候, 绑定的车辆运营状态',
  `bind_task_state` int(11) NOT NULL DEFAULT 0 COMMENT '事件代码=其他的时候, 绑定的车辆任务状态',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `handle_code` int(11) NULL DEFAULT 0 COMMENT '0未处理 1自动同意 2自动拒绝  100同意 200拒绝',
  `handle_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理账号',
  `handle_account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理账号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `event_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_request
-- ----------------------------
INSERT INTO `schedule_request` VALUES (1, '10001', '2025-05-13', '18270240064', 1, NULL, '2025-03-12 19:56:27', 0, 0, 0, 'ROU000001', '1路', 'CAR000001', '18270240064', NULL, NULL, NULL, 0, NULL, NULL, NULL, '2025-05-13 09:15:46', '2025-05-13 09:15:46');

-- ----------------------------
-- Table structure for schedule_resource
-- ----------------------------
DROP TABLE IF EXISTS `schedule_resource`;
CREATE TABLE `schedule_resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `run_route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '运行线路id',
  `run_route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `archives_route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '档案线路ID',
  `archives_route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆档案线路名称',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆id',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '调度模式, 0计划调 1灵活调',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安装设备id',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `conductor_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `conductor_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `check_in` smallint(6) NOT NULL DEFAULT 0 COMMENT '司机是否已签到',
  `run_state` int(11) NOT NULL DEFAULT 100 COMMENT '0运营 1包车 10短休 >10加油  100退出运营等',
  `real_state` int(11) NOT NULL DEFAULT 0 COMMENT '在线不在线等状态位',
  `in_field` smallint(6) NOT NULL DEFAULT 1 COMMENT '在场内 0场外 1场内',
  `direction` smallint(6) NOT NULL DEFAULT 1 COMMENT '方向',
  `serial` smallint(6) NOT NULL DEFAULT 0 COMMENT '排班班次',
  `trips` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '当天完成运次',
  `total_trips` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '当天车辆总趟次',
  `use_id` int(11) NOT NULL DEFAULT 0 COMMENT '当天运营计划ID',
  `plan_depart` datetime NULL DEFAULT NULL COMMENT '计划发车',
  `real_depart` datetime NULL DEFAULT NULL COMMENT '实际发车',
  `plan_arrive` datetime NULL DEFAULT NULL COMMENT '计划到达',
  `real_arrive` datetime NULL DEFAULT NULL COMMENT '实际到达',
  `depart_km` decimal(11, 3) NULL DEFAULT NULL COMMENT '出发时候的GPS里程',
  `on_time` smallint(6) NOT NULL DEFAULT 0 COMMENT '发车0默认 1准点 2早发 3晚发',
  `task_id` smallint(6) NOT NULL DEFAULT 0 COMMENT '回场任务',
  `user_time` datetime NULL DEFAULT NULL COMMENT '定点计划',
  `expect_station_count` smallint(6) NULL DEFAULT 0 COMMENT '预期进站数量',
  `actual_station_count` smallint(6) NULL DEFAULT 0 COMMENT '实际进站数量',
  `last_station_code` int(11) NULL DEFAULT NULL COMMENT '最后进站编号',
  `last_station_direction` smallint(6) NULL DEFAULT NULL COMMENT '最后进站方向',
  `last_station_serial` smallint(6) NULL DEFAULT NULL COMMENT '最后进站站序',
  `last_station_time` datetime NULL DEFAULT NULL COMMENT '最后进站时间',
  `on_off_time` datetime NULL DEFAULT NULL COMMENT '上下线时间',
  `last_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后位置',
  `last_address_time` datetime NULL DEFAULT NULL COMMENT '最后位置更新时间',
  `previous_km` decimal(11, 3) NULL DEFAULT NULL COMMENT '过去5分钟行驶里程',
  `previous_km_time` datetime NULL DEFAULT NULL COMMENT '上一次时间戳',
  `plan_table_id` int(11) NULL DEFAULT NULL COMMENT '计划调度主表schedule_plan_table的ID',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '1 表示删除，0 表示未删除',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_resource`(`company_id`, `work_date`, `car_id`, `is_deleted`) USING BTREE,
  INDEX `idx_resource`(`work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_resource
-- ----------------------------
INSERT INTO `schedule_resource` VALUES (1, '10001', '2025-05-13', 'ROU000001', '1路', 'ROU000001', '1路', 'ROU000001', '1路', 'CAR000001', '18270240064', NULL, '18270240064', NULL, NULL, NULL, NULL, 0, 100, 1, 0, 1, 0, 0.000, 0.000, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '2025-05-13 10:51:55', '', '2025-05-13 09:15:28', NULL, NULL, NULL, NULL, 0, NULL, '2025-05-13 09:13:02', '2025-05-13 10:51:55');

-- ----------------------------
-- Table structure for schedule_suggestion
-- ----------------------------
DROP TABLE IF EXISTS `schedule_suggestion`;
CREATE TABLE `schedule_suggestion`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '司机ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司机ID',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司机姓名',
  `event_code` int(11) NOT NULL DEFAULT 0 COMMENT '事件代码',
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `handle_code` int(11) NULL DEFAULT 0 COMMENT '0未处理 1处理 2忽略关闭',
  `handle_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理账号',
  `handle_account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理账号',
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加JSON信息',
  `plan_id` int(11) NULL DEFAULT NULL COMMENT '计划表ID',
  `plan_depart` datetime NULL DEFAULT NULL COMMENT '计划发车',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_suggestion`(`company_id`, `work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_suggestion
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_table
-- ----------------------------
DROP TABLE IF EXISTS `schedule_table`;
CREATE TABLE `schedule_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日程安排表',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业Id',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'yyyy-mm-dd日期 忽略时区',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `scheme_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营方案',
  `serial` smallint(6) NOT NULL COMMENT '班次',
  `class_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '班次类型 0正班 100机动',
  `first_time` datetime NULL DEFAULT NULL COMMENT '早班上班时间',
  `first_plan` datetime NULL DEFAULT NULL COMMENT '早班司机第一班发车时间',
  `first_direction` smallint(6) NULL DEFAULT NULL COMMENT '早班方向 1下行2上行',
  `first_car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班车辆',
  `first_car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班车辆',
  `first_car_name_expect` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班车辆',
  `first_emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班司机工号',
  `first_emp_id_expect` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班司机工号',
  `first_emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班司机姓名',
  `first_emp_name_expect` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班司机姓名',
  `second_time` datetime NULL DEFAULT NULL COMMENT '中班上班时间',
  `second_plan` datetime NULL DEFAULT NULL COMMENT '中班第一班发车时间',
  `second_direction` smallint(6) NULL DEFAULT NULL COMMENT '中班方向 1下行2上行',
  `second_car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班车辆',
  `second_car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班车辆',
  `second_car_name_expect` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班车辆',
  `second_emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班司机工号',
  `second_emp_id_expect` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班司机工号',
  `second_emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班司机姓名',
  `second_emp_name_except` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班司机姓名',
  `third_time` datetime NULL DEFAULT NULL COMMENT '晚班上班时间',
  `third_plan` datetime NULL DEFAULT NULL COMMENT '晚班第一班发车时间',
  `third_direction` smallint(6) NULL DEFAULT NULL COMMENT '晚班方向 1下行2上行',
  `third_car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班车辆',
  `third_car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班车辆',
  `third_car_name_expect` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班车辆',
  `third_emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班司机工号',
  `third_emp_id_except` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班司机工号',
  `third_emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班司机姓名',
  `third_emp_name_except` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班司机姓名',
  `is_night` smallint(6) NOT NULL DEFAULT 0 COMMENT '夜班',
  `is_across` smallint(6) NOT NULL DEFAULT 0 COMMENT '跨天',
  `attach` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他附加 预留JSON',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ws`(`company_id`, `work_date`, `scheme_id`) USING BTREE,
  INDEX `idx_wr`(`company_id`, `work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_table
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_vacation
-- ----------------------------
DROP TABLE IF EXISTS `schedule_vacation`;
CREATE TABLE `schedule_vacation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工请假表',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `vacation_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自编号',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `vacation_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '休假类型',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请假原因',
  `start_time` datetime NOT NULL COMMENT '休假开始日期',
  `end_time` datetime NULL DEFAULT NULL COMMENT '休假截止日期',
  `vacation_days` smallint(6) NULL DEFAULT NULL COMMENT '休假的工作日天数',
  `state` smallint(6) NOT NULL DEFAULT 0 COMMENT '0 初始化  1 提交申请  2审批通过  3审批拒绝',
  `target` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指定审批人',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cid_starttime`(`company_id`, `start_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_vacation
-- ----------------------------

-- ----------------------------
-- Table structure for scheme_date
-- ----------------------------
DROP TABLE IF EXISTS `scheme_date`;
CREATE TABLE `scheme_date`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '线路当天运营参数',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路企业',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期 yyyy-mm-dd',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `scheme_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营方案id',
  `scheme_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '运营方案名称',
  `way_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点ID',
  `scheme_work_time` int(11) NOT NULL DEFAULT 0 COMMENT '方案计划工作时长',
  `schedule_work_time` int(11) NOT NULL DEFAULT 0 COMMENT '排班工作时长',
  `scheme_plan_mileage` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '方案计划运营里程',
  `own_car_count` int(11) NOT NULL DEFAULT 0 COMMENT '线路配车数量',
  `schedule_car_count` int(11) NOT NULL DEFAULT 0 COMMENT '排班车辆',
  `own_emp_count` int(11) NOT NULL DEFAULT 0 COMMENT '司机配额',
  `schedule_emp_count` int(11) NOT NULL DEFAULT 0 COMMENT '排班司机',
  `scheme_plan_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '方案计划趟次',
  `schedule_plan_count` int(11) NOT NULL DEFAULT 0 COMMENT '排班趟次',
  `scheme_serial_count` int(11) NOT NULL DEFAULT 0 COMMENT '方案计划出勤班次',
  `schedule_serial_count` int(11) NOT NULL DEFAULT 0 COMMENT '排班出勤班次',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_route_date`(`company_id`, `work_date`, `route_id`, `is_deleted`) USING BTREE,
  INDEX `idx_route_route`(`company_id`, `route_id`, `work_date`) USING BTREE,
  INDEX `idx_route_date`(`work_date`, `company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scheme_date
-- ----------------------------

-- ----------------------------
-- Table structure for scheme_direction
-- ----------------------------
DROP TABLE IF EXISTS `scheme_direction`;
CREATE TABLE `scheme_direction`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '线路行驶方向',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业Id',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路id',
  `scheme_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营方案id',
  `run_route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行支线线路id',
  `run_direction` smallint(6) NULL DEFAULT 0 COMMENT '调度方向 1上行 2下行(暂时不用)',
  `direction` smallint(6) NULL DEFAULT NULL COMMENT '采用调度方向 1上行 2下行 3环行',
  `origin` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主站,站点导入时同步',
  `terminal` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副站',
  `second_station` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '辅助第二站',
  `distance` decimal(11, 3) NULL DEFAULT NULL COMMENT '全长km',
  `first_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '首班发车时间',
  `last_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '末班发车时间',
  `first_shifts` int(11) NULL DEFAULT 0 COMMENT '首发班次',
  `intervals` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发车间隔',
  `price` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '价格区间',
  `shifts` smallint(6) NULL DEFAULT NULL COMMENT '发车班次',
  `total_trips` int(11) NULL DEFAULT 0 COMMENT '预期单边总车次',
  `turning_time` int(11) NULL DEFAULT 0 COMMENT '抵达停留时长后立即发车',
  `sort_id` int(11) NULL DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_scheme_direction`(`company_id`, `scheme_id`, `direction`) USING BTREE,
  INDEX `idx_route_scheme`(`company_id`, `route_id`, `scheme_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scheme_direction
-- ----------------------------

-- ----------------------------
-- Table structure for scheme_first
-- ----------------------------
DROP TABLE IF EXISTS `scheme_first`;
CREATE TABLE `scheme_first`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '首班发车时间',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业Id',
  `scheme_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营方案ID',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `serial` int(11) NOT NULL COMMENT '班次',
  `first_direction` smallint(6) NULL DEFAULT NULL COMMENT '首班方向',
  `first_time` datetime NULL DEFAULT NULL COMMENT '首班上班时间',
  `first_plan` datetime NULL DEFAULT NULL COMMENT '首班发车时间',
  `second_direction` smallint(6) NULL DEFAULT NULL COMMENT '中班上班时间',
  `second_time` datetime NULL DEFAULT NULL COMMENT '中班上班时间',
  `second_plan` datetime NULL DEFAULT NULL COMMENT '中班发车时间',
  `third_direction` smallint(6) NULL DEFAULT NULL COMMENT '晚班发车方向',
  `third_time` datetime NULL DEFAULT NULL COMMENT '晚班上班时间',
  `third_plan` datetime NULL DEFAULT NULL COMMENT '晚班发车时间',
  `is_night` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否夜班',
  `is_across` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否跨天',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_scheme`(`company_id`, `scheme_id`) USING BTREE,
  INDEX `idx_route_scheme`(`company_id`, `route_id`, `scheme_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scheme_first
-- ----------------------------

-- ----------------------------
-- Table structure for scheme_group
-- ----------------------------
DROP TABLE IF EXISTS `scheme_group`;
CREATE TABLE `scheme_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '企业ID',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '线路ID',
  `start_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '开始日期',
  `scheme_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方案ID',
  `group_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '班组ID',
  `group_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '班组名称',
  `serial_shift_id` int(11) NOT NULL DEFAULT 0 COMMENT '轮换顺序 0班次  1司机',
  `serial_shift_interval` int(11) NOT NULL DEFAULT 0 COMMENT '几天变换一次',
  `shift_offset` int(11) NOT NULL DEFAULT 0 COMMENT '班次偏移量, 负数前移，正数后移',
  `shifts_type` int(11) NOT NULL DEFAULT 1 COMMENT '轮班 1单班 2双班 3三班',
  `reserved_count` int(11) NOT NULL DEFAULT 0 COMMENT '顶班数量',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `emp_offset` int(11) NULL DEFAULT NULL COMMENT '司机偏移量,废弃',
  `emp_shift_id` int(11) NOT NULL DEFAULT 0 COMMENT '司机轮换规则,,废弃',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_group`(`company_id`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scheme_group
-- ----------------------------

-- ----------------------------
-- Table structure for scheme_group_member
-- ----------------------------
DROP TABLE IF EXISTS `scheme_group_member`;
CREATE TABLE `scheme_group_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 序列号',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司ID',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `scheme_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方案ID',
  `group_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '班组ID',
  `serial_id` smallint(6) NOT NULL DEFAULT 0 COMMENT '班次',
  `serial_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '班次类型 0正班 100机动',
  `first_car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班车辆',
  `first_car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班车辆',
  `first_emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班司机工号',
  `first_emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班司机姓名',
  `first_conductor_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班乘务员工号',
  `first_conductor_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '早班乘务员姓名',
  `second_car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班车辆',
  `second_car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班车辆',
  `second_emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班司机工号',
  `second_emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班司机姓名',
  `second_conductor_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班乘务员工号',
  `second_conductor_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中班乘务员姓名',
  `third_car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班车辆',
  `third_car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班车辆',
  `third_emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班司机工号',
  `third_emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班司机姓名',
  `third_conductor_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班乘务员工号',
  `third_conductor_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '晚班乘务员姓名',
  `emp_shift_id` int(11) NOT NULL DEFAULT 0 COMMENT '偏移量 0固定 <0左移 >0右移',
  `emp_shift_interval` int(11) NOT NULL DEFAULT 0 COMMENT '几天变换一次',
  `reserved_emp_id1` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顶班司机工号1',
  `reserved_emp_name1` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顶班司机1',
  `reserved_car_id1` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顶班车辆1',
  `reserved_car_name1` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顶班车辆1',
  `reserved_emp_id2` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顶班驾驶员2',
  `reserved_emp_name2` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顶班司机2',
  `reserved_car_id2` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顶班车辆2',
  `reserved_car_name2` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顶班车辆2',
  `sort_id` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member`(`company_id`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scheme_group_member
-- ----------------------------

-- ----------------------------
-- Table structure for scheme_idle
-- ----------------------------
DROP TABLE IF EXISTS `scheme_idle`;
CREATE TABLE `scheme_idle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '非运营里程',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业Id',
  `scheme_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营方案id',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `serial` smallint(6) NOT NULL DEFAULT 0 COMMENT '班次',
  `first_empty` decimal(10, 4) NULL DEFAULT NULL COMMENT '空放里程',
  `first_oil` decimal(10, 4) NULL DEFAULT NULL COMMENT '加油里程',
  `second_empty` decimal(10, 4) NULL DEFAULT NULL COMMENT '空放里程',
  `second_oil` decimal(10, 4) NULL DEFAULT NULL COMMENT '加油里程',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_scheme`(`company_id`, `scheme_id`) USING BTREE,
  INDEX `idx_route_scheme`(`company_id`, `route_id`, `scheme_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scheme_idle
-- ----------------------------

-- ----------------------------
-- Table structure for scheme_master
-- ----------------------------
DROP TABLE IF EXISTS `scheme_master`;
CREATE TABLE `scheme_master`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `scheme_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营方案id',
  `scheme_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方案编码',
  `scheme_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方案名称',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `way_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '线路方案ID',
  `way_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主站,站点导入时同步',
  `dispatch_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '调度模式, 0计划调 1灵活调',
  `distribute_type` smallint(6) NOT NULL DEFAULT 2 COMMENT '派发计划1单边派发 2两边派发',
  `single_direction` smallint(6) NOT NULL DEFAULT 1 COMMENT '单边固定方向 1上行 2下行',
  `shifts_type` smallint(6) NOT NULL DEFAULT 1 COMMENT '轮班 1单班 2双班 3三班',
  `open_time` datetime NOT NULL COMMENT '开通时间',
  `stop_time` datetime NULL DEFAULT NULL COMMENT '禁用时间',
  `tags` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `ticket` smallint(6) NOT NULL DEFAULT 0 COMMENT '0无人售票 1有人售票',
  `state` smallint(6) NOT NULL DEFAULT 0 COMMENT '0 初始化  1 提交申请  2审批通过  3审批拒绝',
  `plan_start` datetime NULL DEFAULT NULL COMMENT '计划调开始时间',
  `plan_end` datetime NULL DEFAULT NULL COMMENT '计划调恢复时间',
  `time_zone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '+08:00' COMMENT '设备台账时区',
  `trip_unit` decimal(11, 3) NULL DEFAULT 1.000 COMMENT '一趟的单位',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `check_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `check_account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核账号',
  `is_checked` int(11) NULL DEFAULT 0 COMMENT '审核',
  `is_disable` smallint(6) NOT NULL DEFAULT 0 COMMENT '禁用标记',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_default` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_scheme`(`company_id`, `scheme_id`) USING BTREE,
  INDEX `idx_route`(`company_id`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scheme_master
-- ----------------------------

-- ----------------------------
-- Table structure for scheme_param
-- ----------------------------
DROP TABLE IF EXISTS `scheme_param`;
CREATE TABLE `scheme_param`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业Id',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `scheme_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营方案id',
  `direction` smallint(6) NOT NULL COMMENT '方向 1上行 2下行 3环行',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `val1` smallint(6) NOT NULL DEFAULT 1 COMMENT '间隔1',
  `val2` smallint(6) NULL DEFAULT NULL COMMENT '间隔2',
  `val3` smallint(6) NULL DEFAULT NULL COMMENT '间隔3',
  `val4` smallint(6) NULL DEFAULT NULL COMMENT '间隔4',
  `val5` smallint(6) NULL DEFAULT NULL COMMENT '间隔5',
  `duration` smallint(6) NOT NULL COMMENT '耗时 分钟',
  `peak_id` smallint(6) NOT NULL DEFAULT 1 COMMENT '1平峰 2高峰 3低峰',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_scheme`(`company_id`, `scheme_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scheme_param
-- ----------------------------

-- ----------------------------
-- Table structure for scheme_param_temp
-- ----------------------------
DROP TABLE IF EXISTS `scheme_param_temp`;
CREATE TABLE `scheme_param_temp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当天日期',
  `direction` smallint(6) NOT NULL COMMENT '方向 1上行 2下行 3环行',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `val1` smallint(6) NOT NULL DEFAULT 1 COMMENT '间隔1',
  `val2` smallint(6) NULL DEFAULT NULL COMMENT '间隔2',
  `val3` smallint(6) NULL DEFAULT NULL COMMENT '间隔3',
  `val4` smallint(6) NULL DEFAULT NULL COMMENT '间隔4',
  `val5` smallint(6) NULL DEFAULT NULL COMMENT '间隔5',
  `turning_time` int(11) NULL DEFAULT 0 COMMENT '进终点换向时长,发车时间=进站+换向停留,大于0生效',
  `duration` smallint(6) NOT NULL COMMENT '耗时 分钟',
  `peak_id` smallint(6) NOT NULL DEFAULT 1 COMMENT '1平峰 2高峰 3低峰',
  `change_id` smallint(6) NULL DEFAULT 0 COMMENT '调整原因',
  `is_enable` smallint(6) NOT NULL DEFAULT 1 COMMENT '是否启用 1启用',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_scheme`(`work_date`, `company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scheme_param_temp
-- ----------------------------

-- ----------------------------
-- Table structure for scheme_route_time_period
-- ----------------------------
DROP TABLE IF EXISTS `scheme_route_time_period`;
CREATE TABLE `scheme_route_time_period`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '时段参数',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业ID',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路名称',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `time_period_id` smallint(6) NOT NULL DEFAULT 0 COMMENT '11=早1, 12=早2,  31=晚1, 32=晚2, 33=晚3, 34=晚4 ',
  `unit_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '时段单趟金额',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`company_id`, `work_date`, `route_id`, `time_period_id`, `is_deleted`) USING BTREE,
  INDEX `idx_service`(`company_id`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scheme_route_time_period
-- ----------------------------

-- ----------------------------
-- Table structure for scheme_station
-- ----------------------------
DROP TABLE IF EXISTS `scheme_station`;
CREATE TABLE `scheme_station`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站点',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业Id',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路自编码',
  `scheme_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营方案id',
  `run_route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行支线线路id',
  `run_direction` smallint(6) NULL DEFAULT 0 COMMENT '调度方向 1上行 2下行',
  `route_code` int(11) NOT NULL COMMENT '线路编号,与车载统一',
  `direction` smallint(6) NOT NULL COMMENT '线路站点方向 1下行2上行',
  `serial` smallint(6) UNSIGNED NOT NULL COMMENT '站序，不能为负数',
  `station_id` int(11) NULL DEFAULT NULL COMMENT '映射站点表的主键ID',
  `station_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点名称',
  `abridge` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩写',
  `flag` smallint(6) NOT NULL DEFAULT 0 COMMENT '0中间站 1起点 255终点',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `azimuth` smallint(6) NULL DEFAULT NULL COMMENT '方位角',
  `distance` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '距离起点的距离',
  `stop_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应站台id',
  `check_in` smallint(6) NOT NULL DEFAULT 0 COMMENT '签到点',
  `big` smallint(6) NULL DEFAULT 0 COMMENT '大站',
  `normal` smallint(6) NULL DEFAULT NULL COMMENT '平峰考核到站时长',
  `peak` smallint(6) NULL DEFAULT NULL COMMENT '高峰考核到站时长',
  `low` smallint(6) NULL DEFAULT NULL COMMENT '低峰考核到站时长',
  `slow` smallint(6) NULL DEFAULT 3 COMMENT '允许慢多少分钟',
  `fast` smallint(6) NULL DEFAULT 3 COMMENT '允许快多少分钟',
  `depart` smallint(6) NOT NULL DEFAULT 0 COMMENT '离开执行计划 0不检测 1进站检测 2出站检测 3进出站检测',
  `arrive` smallint(6) NOT NULL DEFAULT 0 COMMENT '抵达完成计划 0不检测 1进站检测 2出站检测 3进出站检测',
  `is_deleted` int(11) NULL DEFAULT 0,
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_scheme`(`company_id`, `route_id`, `scheme_id`) USING BTREE,
  INDEX `idx_scheme`(`company_id`, `scheme_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scheme_station
-- ----------------------------

-- ----------------------------
-- Table structure for scheme_table
-- ----------------------------
DROP TABLE IF EXISTS `scheme_table`;
CREATE TABLE `scheme_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业Id',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `scheme_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营方案id',
  `serial` smallint(6) NULL DEFAULT NULL COMMENT '行',
  `series` smallint(6) NULL DEFAULT NULL COMMENT '列',
  `route_code` int(11) NOT NULL DEFAULT 0 COMMENT '运行线路编码,废弃',
  `run_route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行线路id',
  `run_route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行线路名称',
  `direction` smallint(6) NULL DEFAULT NULL COMMENT '行驶方向',
  `depart_time` datetime NULL DEFAULT NULL COMMENT '出发时间',
  `arrive_time` datetime NULL DEFAULT NULL COMMENT '抵达时间',
  `parking` int(11) NULL DEFAULT NULL COMMENT '停靠时长',
  `intervals` int(11) NULL DEFAULT NULL COMMENT '上一趟的发车间隔',
  `trips` decimal(11, 3) NULL DEFAULT NULL COMMENT '单位趟次',
  `distance` decimal(11, 3) NULL DEFAULT NULL COMMENT '全长km',
  `class_id` smallint(6) NOT NULL DEFAULT 1 COMMENT '班次1早2中3晚',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_scheme`(`company_id`, `scheme_id`) USING BTREE,
  INDEX `idx_route_scheme`(`company_id`, `route_id`, `scheme_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scheme_table
-- ----------------------------

-- ----------------------------
-- Table structure for service_abnormal
-- ----------------------------
DROP TABLE IF EXISTS `service_abnormal`;
CREATE TABLE `service_abnormal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运营服务之预警',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scheme_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运营方案id',
  `scheme_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当天方案名称',
  `check_time` datetime NOT NULL COMMENT '检测到的时间',
  `abnormal_type` int(11) NOT NULL DEFAULT 0 COMMENT '考核类型 1发车大间隔 2串车 3大间隔 4站点久候 5长时间停车',
  `abnormal_content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'JSON内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '事件utc时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_logevent`(`work_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_abnormal
-- ----------------------------

-- ----------------------------
-- Table structure for service_illegal
-- ----------------------------
DROP TABLE IF EXISTS `service_illegal`;
CREATE TABLE `service_illegal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上报设备',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `vehicle_type_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车型描述 来自basic_car_type表',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶员id',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶员姓名',
  `illegal_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '违规类型: 疲劳驾驶',
  `illegal_value` int(11) NULL DEFAULT NULL COMMENT '违规值',
  `standard_value` int(11) NULL DEFAULT NULL COMMENT '违规阀值',
  `start_time` datetime NOT NULL COMMENT '起点时间',
  `start_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '起点纬度,',
  `start_lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '起点经度',
  `start_mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '开始时的里程',
  `end_time` datetime NOT NULL COMMENT '终点时间',
  `end_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '终点纬度',
  `end_lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '终点经度',
  `end_mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '结束时的里程',
  `duration` int(11) NULL DEFAULT 0 COMMENT '持续时长，单位秒',
  `parking_duration` int(11) NULL DEFAULT 0 COMMENT '停车休息时长 s',
  `mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '里程 km',
  `speed` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '速度，km/h',
  `reduce_score` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '违规扣分',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_wr`(`work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_illegal
-- ----------------------------

-- ----------------------------
-- Table structure for service_on_time
-- ----------------------------
DROP TABLE IF EXISTS `service_on_time`;
CREATE TABLE `service_on_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运营服务之大站考核',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scheme_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营方案id',
  `check_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 首末班 2发车正点 3大站 4全程',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `station_id` int(11) NULL DEFAULT NULL COMMENT '站点表唯一ID',
  `station_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `route_code` int(11) NULL DEFAULT NULL COMMENT '线路编码',
  `direction` smallint(6) NULL DEFAULT NULL COMMENT '方向 1上行2下行',
  `serial` smallint(6) NULL DEFAULT NULL COMMENT '站序',
  `use_plan_id` int(11) NULL DEFAULT NULL COMMENT '计划表ID',
  `use_plan_state` smallint(6) NOT NULL DEFAULT 0 COMMENT '计划状态 0未执行  1执行中 2完成 3取消',
  `plan_depart` datetime NULL DEFAULT NULL COMMENT '从起点计划发车时间',
  `real_depart` datetime NULL DEFAULT NULL COMMENT '从起点实际发车时间',
  `peak_id` smallint(6) NOT NULL DEFAULT 1 COMMENT '1平峰 2高峰 3低峰',
  `plan_run_time` smallint(6) NULL DEFAULT NULL COMMENT '计划用时(分)',
  `real_run_time` smallint(6) NULL DEFAULT NULL COMMENT '实际用时(分)',
  `allow_slow` smallint(6) NULL DEFAULT NULL COMMENT '允许慢(分)',
  `allow_fast` smallint(6) NULL DEFAULT NULL COMMENT '允许快(分)',
  `result` smallint(6) NULL DEFAULT NULL COMMENT '结果差值(分)',
  `plan_arrive` datetime NULL DEFAULT NULL COMMENT '计划抵达时间',
  `real_arrive` datetime NULL DEFAULT NULL COMMENT '实际抵达时间',
  `check_value` smallint(6) NOT NULL DEFAULT 0 COMMENT '考核结果 1准点 2早到 3晚到',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '事件utc时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_company_data`(`company_id`, `work_date`) USING BTREE,
  INDEX `idx_data_company`(`work_date`, `company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_on_time
-- ----------------------------

-- ----------------------------
-- Table structure for service_over_speed
-- ----------------------------
DROP TABLE IF EXISTS `service_over_speed`;
CREATE TABLE `service_over_speed`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '持续超速-自增长id',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `imei` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上报设备',
  `car_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `fleet_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `emp_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶员工号',
  `emp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶员姓名',
  `start_time` datetime NOT NULL COMMENT '起点时间',
  `start_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '起点纬度，一般指北纬',
  `start_lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '起点经度，一般指东经',
  `end_time` datetime NOT NULL COMMENT '终点时间',
  `end_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '终点纬度，一般指北纬',
  `end_lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '终点经度，一般指东经',
  `limit_speed` int(11) NULL DEFAULT 0 COMMENT '限速值 km/h',
  `max_speed` int(11) NULL DEFAULT 0 COMMENT '最大速度，km/h',
  `avg_speed` int(11) NULL DEFAULT 0 COMMENT '平均速度，km/h',
  `duration` int(11) NULL DEFAULT 0 COMMENT '超速持续时长，单位秒',
  `mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '里程 km',
  `station_id` int(11) NULL DEFAULT NULL COMMENT '站点表唯一ID',
  `station_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `run_route_code` int(11) NULL DEFAULT NULL COMMENT '运行线路|方向|站点',
  `run_route_direction` smallint(6) NULL DEFAULT NULL,
  `run_route_serial` smallint(6) NULL DEFAULT NULL,
  `run_state` int(11) NOT NULL DEFAULT 0 COMMENT '运营状态 0运营 1包车 10短休 >10加油  100退出运营等',
  `depart_time` datetime NULL DEFAULT NULL COMMENT '发车时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_wr`(`work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_over_speed
-- ----------------------------

-- ----------------------------
-- Table structure for system_av_rtp
-- ----------------------------
DROP TABLE IF EXISTS `system_av_rtp`;
CREATE TABLE `system_av_rtp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业id',
  `node_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `node_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `protocol` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频协议',
  `rtp_host` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'RTP定向服务器地址',
  `rtp_tcp_port` int(11) NULL DEFAULT NULL COMMENT 'RTP服务器定向端口',
  `pull_http_flv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拉流地址',
  `pull_rtmp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `talk_web_socket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对讲服务器客户端',
  `is_active` int(11) NOT NULL DEFAULT 1 COMMENT '活跃的',
  `sort_id` int(11) NULL DEFAULT 100 COMMENT '排序',
  `remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_av_rtp
-- ----------------------------

-- ----------------------------
-- Table structure for system_av_srs
-- ----------------------------
DROP TABLE IF EXISTS `system_av_srs`;
CREATE TABLE `system_av_srs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业id',
  `node_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `node_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `protocol` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频协议',
  `push_rtmp_wan` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pull_rtmp_wan` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `push_rtmp_lan` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pull_http_wan` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拉流地址',
  `pull_rtmp_lan` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pull_http_lan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拉流地址',
  `is_active` int(11) NOT NULL DEFAULT 1 COMMENT '活跃的',
  `rtp_host` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'RTP定向服务器地址',
  `rtp_tcp_port` int(11) NULL DEFAULT NULL COMMENT 'RTP服务器定向端口',
  `sort_id` int(11) NULL DEFAULT 100 COMMENT '排序',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ak_prefix`(`company_id`, `node_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_av_srs
-- ----------------------------
INSERT INTO `system_av_srs` VALUES (8, '10001', 'live-36.212.31.166', 'gc', NULL, 'rtmp://36.212.31.166:9005/', 'rtmp://36.212.31.166:9005/', NULL, 'http://36.212.31.166:9085/mdvr,http://36.212.31.166:9086/mdvr,http://36.212.31.166:9087/mdvr,http://36.212.31.166:9088/mdvr,http://36.212.31.166:9089/mdvr', NULL, NULL, 1, NULL, 0, 100, '2025-05-13 09:25:16', '2025-05-13 11:46:32');

-- ----------------------------
-- Table structure for system_company
-- ----------------------------
DROP TABLE IF EXISTS `system_company`;
CREATE TABLE `system_company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业id',
  `parent_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级id',
  `company_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业名称',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '左侧栏标题',
  `logo` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'citybus' COMMENT '主页logo',
  `home_page` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司网站主页',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业管理账号',
  `level` int(11) NOT NULL DEFAULT 10 COMMENT '销售层级 10代理商 20分销商 30总经销 100平台',
  `archive_time` smallint(6) NULL DEFAULT 7 COMMENT '数据封存多少天',
  `monthly_start_date` smallint(6) NULL DEFAULT 1 COMMENT '月度报表起始日期',
  `module_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选择的模块列表',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '城市中心经纬度',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '城市中心经纬度',
  `time_zone` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '+08:00' COMMENT '设备台账时区',
  `language` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'zh' COMMENT '默认语言,与登陆页面对应',
  `map_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地图key,JSON格式, type=地图类型,key=地图key',
  `push_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APP推送配置KEY',
  `push_secret` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APP推送配置秘钥',
  `company_config` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业级别的自定义配置 内容json形式',
  `morning_peak` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '07:00-09:00' COMMENT '早高峰时段',
  `late_peak` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '17:00-19:00' COMMENT '晚高峰时段',
  `authorized_vehicle_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '授权车辆数量，默认100',
  `sort_id` int(11) NULL DEFAULT 100 COMMENT '排序id',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`company_id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`company_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_company
-- ----------------------------
INSERT INTO `system_company` VALUES (1, '100', '', 'CityBus', 'CityBus', NULL, NULL, '默认企业', NULL, 30, NULL, 1, NULL, NULL, NULL, '+08:00', 'zh', NULL, NULL, NULL, NULL, '07:00-09:00', '17:00-19:00', '', 0, NULL, '2019-08-14 12:01:15', '2021-06-29 02:00:41');
INSERT INTO `system_company` VALUES (2, '10001', '100', '恭城公交', '恭城公交', '/files/img/company/5e7a5dabf76e4fcdaa91d257d3cd12d4.png', NULL, '', 'gongcheng@admin', 20, 7, 1, NULL, 110.817484, 24.838551, '+08:00', 'zh', NULL, NULL, NULL, '{\"disable_auto_schedule\":false,\"multiple_search_limit\":60,\"alarm_safety_list\":[],\"gps_deviation_excluded\":false}', '07:00-09:00', '17:00-19:00', 'iheCxAgUe7psEqq/5VmVxw==', 0, 'UID000001', '2025-05-13 08:48:44', '2025-05-13 11:56:15');

-- ----------------------------
-- Table structure for system_company_module
-- ----------------------------
DROP TABLE IF EXISTS `system_company_module`;
CREATE TABLE `system_company_module`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业id',
  `module_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块id',
  `allow_access` smallint(6) NOT NULL DEFAULT 0 COMMENT '0禁止访问 1允许访问',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`company_id`, `module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 432 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_company_module
-- ----------------------------
INSERT INTO `system_company_module` VALUES (279, '10001', 'MOD000130', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (280, '10001', 'MOD000115', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (281, '10001', 'MOD000137', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (282, '10001', 'MOD000129', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (283, '10001', 'MOD000114', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (284, '10001', 'MOD000001', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (285, '10001', 'MOD000002', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (286, '10001', 'MOD000004', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (287, '10001', 'MOD000014', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (288, '10001', 'MOD000006', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (289, '10001', 'MOD000176', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (290, '10001', 'MOD000008', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (291, '10001', 'MOD000098', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (292, '10001', 'MOD000009', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (293, '10001', 'MOD000177', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (294, '10001', 'MOD000010', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (295, '10001', 'MOD000012', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (296, '10001', 'MOD000013', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (297, '10001', 'MOD000116', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (298, '10001', 'MOD000117', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (299, '10001', 'MOD000118', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (300, '10001', 'MOD000172', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (301, '10001', 'MOD000178', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (302, '10001', 'MOD000179', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (303, '10001', 'MOD000183', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (304, '10001', 'MOD000005', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (305, '10001', 'MOD000016', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (306, '10001', 'MOD000017', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (307, '10001', 'MOD000069', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (308, '10001', 'MOD000085', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (309, '10001', 'MOD000086', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (310, '10001', 'MOD000105', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (311, '10001', 'MOD000087', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (312, '10001', 'MOD000175', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (313, '10001', 'MOD000135', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (314, '10001', 'MOD000146', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (315, '10001', 'MOD000088', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (316, '10001', 'MOD000147', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (317, '10001', 'MOD000089', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (318, '10001', 'MOD000159', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (319, '10001', 'MOD000090', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (320, '10001', 'MOD000091', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (321, '10001', 'MOD000160', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (322, '10001', 'MOD000018', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (323, '10001', 'MOD000019', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (324, '10001', 'MOD000188', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (325, '10001', 'MOD000020', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (326, '10001', 'MOD000021', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (327, '10001', 'MOD000022', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (328, '10001', 'MOD000023', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (329, '10001', 'MOD000064', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (330, '10001', 'MOD000065', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (331, '10001', 'MOD000107', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (332, '10001', 'MOD000120', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (333, '10001', 'MOD000121', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (334, '10001', 'MOD000123', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (335, '10001', 'MOD000125', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (336, '10001', 'MOD000126', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (337, '10001', 'MOD000127', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (338, '10001', 'MOD000128', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (339, '10001', 'MOD000151', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (340, '10001', 'MOD000157', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (341, '10001', 'MOD000024', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (342, '10001', 'MOD000025', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (343, '10001', 'MOD000026', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (344, '10001', 'MOD000027', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (345, '10001', 'MOD000028', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (346, '10001', 'MOD000029', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (347, '10001', 'MOD000030', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (348, '10001', 'MOD000104', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (349, '10001', 'MOD000155', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (350, '10001', 'MOD000031', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (351, '10001', 'MOD000059', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (352, '10001', 'MOD000060', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (353, '10001', 'MOD000071', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (354, '10001', 'MOD000061', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (355, '10001', 'MOD000119', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (356, '10001', 'MOD000077', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (357, '10001', 'MOD000101', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (358, '10001', 'MOD000122', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (359, '10001', 'MOD000075', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (360, '10001', 'MOD000051', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (361, '10001', 'MOD000058', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (362, '10001', 'MOD000053', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (363, '10001', 'MOD000054', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (364, '10001', 'MOD000106', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (365, '10001', 'MOD000078', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (366, '10001', 'MOD000109', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (367, '10001', 'MOD000111', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (368, '10001', 'MOD000112', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (369, '10001', 'MOD000072', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (370, '10001', 'MOD000110', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (371, '10001', 'MOD000073', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (372, '10001', 'MOD000080', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (373, '10001', 'MOD000139', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (374, '10001', 'MOD000140', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (375, '10001', 'MOD000141', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (376, '10001', 'MOD000142', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (377, '10001', 'MOD000092', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (378, '10001', 'MOD000094', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (379, '10001', 'MOD000102', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (380, '10001', 'MOD000103', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (381, '10001', 'MOD000152', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (382, '10001', 'MOD000153', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (383, '10001', 'MOD000095', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (384, '10001', 'MOD000173', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (385, '10001', 'MOD000181', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (386, '10001', 'MOD000186', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (387, '10001', 'MOD000099', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (388, '10001', 'MOD000156', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (389, '10001', 'MOD000164', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (390, '10001', 'MOD000074', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (391, '10001', 'MOD000052', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (392, '10001', 'MOD000046', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (393, '10001', 'MOD000047', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (394, '10001', 'MOD000048', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (395, '10001', 'MOD000049', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (396, '10001', 'MOD000050', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (397, '10001', 'MOD000079', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (398, '10001', 'MOD000081', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (399, '10001', 'MOD000082', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (400, '10001', 'MOD000083', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (401, '10001', 'MOD000113', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (402, '10001', 'MOD000133', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (403, '10001', 'MOD000148', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (404, '10001', 'MOD000182', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (405, '10001', 'MOD000184', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (406, '10001', 'MOD000185', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (407, '10001', 'MOD000032', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (408, '10001', 'MOD000044', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (409, '10001', 'MOD000045', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (410, '10001', 'MOD000093', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (411, '10001', 'MOD000096', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (412, '10001', 'MOD000097', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (413, '10001', 'MOD000033', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (414, '10001', 'MOD000038', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (415, '10001', 'MOD000134', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (416, '10001', 'MOD000136', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (417, '10001', 'MOD000149', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (418, '10001', 'MOD000162', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (419, '10001', 'MOD000034', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (420, '10001', 'MOD000035', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (421, '10001', 'MOD000036', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (422, '10001', 'MOD000037', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (423, '10001', 'MOD000062', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (424, '10001', 'MOD000163', 1, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (425, '10001', 'MOD000063', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (426, '10001', 'MOD000041', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (427, '10001', 'MOD000143', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (428, '10001', 'MOD000138', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (429, '10001', 'MOD000187', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (430, '10001', 'MOD000144', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');
INSERT INTO `system_company_module` VALUES (431, '10001', 'MOD000145', 0, 'UID000001', '2025-05-13 08:53:35', '2025-05-13 08:53:35');

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '平台版本信息',
  `config_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置key',
  `config_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置值',
  `config_prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置前缀, 比如spring.mail',
  `config_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置秘钥',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注描述',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_config
-- ----------------------------

-- ----------------------------
-- Table structure for system_holidays
-- ----------------------------
DROP TABLE IF EXISTS `system_holidays`;
CREATE TABLE `system_holidays`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '优先查询本企业，没数据查询=0的企业',
  `work_date` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `holidays_type` int(11) NULL DEFAULT 0 COMMENT '0默认 100工作日 110补班 200周末 210法定节假',
  `holidays_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '假期描述。如元旦，春节等',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_company_date`(`company_id`, `work_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_holidays
-- ----------------------------

-- ----------------------------
-- Table structure for system_module
-- ----------------------------
DROP TABLE IF EXISTS `system_module`;
CREATE TABLE `system_module`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块id',
  `parent_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '上级id',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单标题',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名称',
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'al-icon-genderless' COMMENT '图标',
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url路径',
  `vue` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'vue文件路径 可以空',
  `redirect` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重定向',
  `opt` int(11) NOT NULL DEFAULT 0 COMMENT '可用权限',
  `api` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受控API',
  `is_ctrl` int(11) NOT NULL DEFAULT 0 COMMENT '是否受控 0=普通用户、管理员可见 1=超级管理员可见',
  `is_hide` int(11) NOT NULL DEFAULT 0 COMMENT '是否隐藏 0=否 1=是',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `category` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别,主动安全,电子站牌等',
  `sort_id` int(11) NULL DEFAULT 100 COMMENT '排序',
  `fix_company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指定企业可见',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除位 1已删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_path`(`path`) USING BTREE,
  UNIQUE INDEX `uk_id`(`module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_module
-- ----------------------------
INSERT INTO `system_module` VALUES (1, 'MOD000001', '', 'basic', '/basic', 'el-icon-menu', '/basic', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '基础数据', NULL, 10000, NULL, 0, '2019-08-23 07:44:35', '2020-09-21 10:51:54');
INSERT INTO `system_module` VALUES (2, 'MOD000002', 'MOD000001', 'org', 'Org', 'al-icon-genderless', 'org', 'views/basic/org/index', 'noRedirect', 1, NULL, 0, 0, '组织结构', NULL, 11000, NULL, 0, '2019-08-23 07:44:35', '2019-10-25 02:50:27');
INSERT INTO `system_module` VALUES (3, 'MOD000003', 'MOD000002', 'company', 'Company', 'al-icon-genderless', 'company', 'views/basic/org/company', NULL, 15, '/api/data/company', 1, 0, '企业管理', NULL, 11010, '', 0, '2019-08-23 07:44:35', '2023-06-29 03:17:58');
INSERT INTO `system_module` VALUES (4, 'MOD000004', 'MOD000002', 'fleet', 'Fleet', 'al-icon-genderless', 'fleet', 'views/basic/org/fleet', NULL, 63, '/api/data/fleet', 0, 0, '车队管理', NULL, 11020, NULL, 0, '2019-08-23 07:44:35', '2019-10-25 02:50:27');
INSERT INTO `system_module` VALUES (5, 'MOD000005', 'MOD000001', 'person', 'Person', 'al-icon-genderless', 'person', 'views/basic/person/index', 'noRedirect', 1, NULL, 0, 0, '人员管理', NULL, 14000, NULL, 0, '2019-08-23 07:44:35', '2020-07-24 06:54:44');
INSERT INTO `system_module` VALUES (6, 'MOD000006', 'MOD000005', 'staff', 'Staff', 'al-icon-genderless', 'staff', 'views/basic/person/staff', NULL, 63, NULL, 0, 0, '员工管理', NULL, 12010, NULL, 0, '2019-08-23 07:44:35', '2019-10-28 09:45:13');
INSERT INTO `system_module` VALUES (7, 'MOD000007', 'MOD000005', 'jobs', 'Jobs', 'al-icon-genderless', 'jobs', 'views/basic/person/jobs', NULL, 1, '/api/data/jobs', 0, 1, '员工类型', NULL, 12020, NULL, 0, '2019-08-23 07:44:35', '2019-10-25 02:50:27');
INSERT INTO `system_module` VALUES (8, 'MOD000008', 'MOD000005', 'iccard', 'ICCard', 'al-icon-genderless', 'iccard', 'views/basic/person/iccard', NULL, 63, NULL, 0, 0, 'IC卡管理', NULL, 12030, NULL, 0, '2019-08-23 07:44:35', '2020-02-27 02:06:57');
INSERT INTO `system_module` VALUES (9, 'MOD000009', 'MOD000001', 'goods', 'Goods', 'al-icon-genderless', 'goods', 'views/basic/goods/index', 'noRedirect', 1, NULL, 0, 0, '车辆管理', NULL, 13000, NULL, 0, '2019-08-23 07:44:35', '2019-10-25 02:50:27');
INSERT INTO `system_module` VALUES (10, 'MOD000010', 'MOD000009', 'vehicle', 'Vehicle', 'al-icon-genderless', 'vehicle', 'views/basic/goods/vehicle', NULL, 63, NULL, 0, 0, '车辆档案', NULL, 13010, NULL, 0, '2019-08-23 07:44:35', '2019-10-25 02:50:27');
INSERT INTO `system_module` VALUES (11, 'MOD000011', 'MOD000009', 'devtype', 'Devtype', 'al-icon-genderless', 'device-type', 'views/basic/goods/devtype', NULL, 63, '/api/data/devtype', 1, 0, '设备类型', NULL, 13020, NULL, 0, '2019-08-23 07:44:35', '2020-04-07 01:07:31');
INSERT INTO `system_module` VALUES (12, 'MOD000012', 'MOD000009', 'sim', 'Sim', 'al-icon-genderless', 'sim', 'views/basic/goods/sim', NULL, 255, '/api/data/sim', 0, 0, 'SIM卡管理', NULL, 13030, NULL, 0, '2019-08-23 07:44:35', '2019-11-18 01:20:19');
INSERT INTO `system_module` VALUES (13, 'MOD000013', 'MOD000009', 'device', 'Device', 'al-icon-genderless', 'device', 'views/basic/goods/device', NULL, 63, NULL, 0, 0, '设备管理', NULL, 13040, NULL, 0, '2019-08-23 07:44:35', '2020-02-25 08:27:37');
INSERT INTO `system_module` VALUES (14, 'MOD000014', 'MOD000001', 'place', 'Place', 'al-icon-genderless', 'place', 'views/basic/place/index', 'noRedirect', 1, NULL, 0, 0, '路站管理', NULL, 12000, NULL, 0, '2019-08-23 07:44:35', '2020-07-24 06:54:40');
INSERT INTO `system_module` VALUES (15, 'MOD000015', 'MOD000014', 'road', 'Road', 'al-icon-genderless', 'road', 'views/basic/place/road', NULL, 1, NULL, 0, 1, '道路管理', NULL, 14010, NULL, 0, '2019-08-23 07:44:35', '2019-10-31 06:03:25');
INSERT INTO `system_module` VALUES (16, 'MOD000016', 'MOD000014', 'busstop', 'Busstop', 'al-icon-genderless', 'busstop', 'views/basic/place/busstop', NULL, 63, NULL, 0, 0, '站台管理', NULL, 14020, NULL, 0, '2019-08-23 07:44:35', '2020-02-26 01:15:44');
INSERT INTO `system_module` VALUES (17, 'MOD000017', 'MOD000014', 'route', 'Route', 'al-icon-genderless', 'route', 'views/basic/place/route', NULL, 63, NULL, 0, 0, '线路站点', NULL, 14030, NULL, 0, '2019-08-23 07:44:35', '2020-02-26 02:43:34');
INSERT INTO `system_module` VALUES (18, 'MOD000018', '', 'plan', '/plan', 'al-icon-plan', '/plan', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '运营数据', NULL, 20000, NULL, 0, '2019-08-23 07:44:35', '2020-09-21 10:52:21');
INSERT INTO `system_module` VALUES (19, 'MOD000019', 'MOD000018', 'scheme', 'SchemeMaster', 'al-icon-genderless', 'scheme', 'views/plan/scheme', NULL, 1023, NULL, 0, 0, '运营方案', NULL, 21000, NULL, 0, '2019-08-23 07:44:35', '2020-06-28 06:13:57');
INSERT INTO `system_module` VALUES (20, 'MOD000020', 'MOD000018', 'workplan', 'WorkPlan', 'al-icon-genderless', 'workplan', 'views/plan/workplan', NULL, 1023, NULL, 0, 0, '线路挂牌', NULL, 22000, '', 0, '2019-08-23 07:44:35', '2025-01-16 08:37:30');
INSERT INTO `system_module` VALUES (21, 'MOD000021', 'MOD000018', 'vacation', 'Vacation', 'al-icon-genderless', 'vacation', 'views/plan/vacation', NULL, 47, NULL, 0, 0, '请假管理', NULL, 23000, NULL, 0, '2019-08-23 07:44:35', '2020-02-19 06:16:36');
INSERT INTO `system_module` VALUES (22, 'MOD000022', 'MOD000018', 'maintain', 'Maintain', 'al-icon-genderless', 'maintain', 'views/plan/maintain', NULL, 47, NULL, 0, 0, '保养计划', NULL, 24000, NULL, 0, '2019-08-23 07:44:35', '2020-12-04 01:18:02');
INSERT INTO `system_module` VALUES (23, 'MOD000023', 'MOD000018', 'repair', 'Repair', 'al-icon-genderless', 'repair', 'views/plan/repair/index', NULL, 1, NULL, 0, 0, '数据补录', NULL, 25000, NULL, 0, '2019-08-23 07:44:35', '2019-10-25 02:50:27');
INSERT INTO `system_module` VALUES (24, 'MOD000024', '', 'real', '/real', 'el-icon-view', '/real', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '实时数据', NULL, 30000, NULL, 0, '2019-08-23 07:44:35', '2020-09-21 10:52:28');
INSERT INTO `system_module` VALUES (25, 'MOD000025', 'MOD000024', 'dispatch', 'Dispatch', 'al-icon-genderless', 'dispatch', 'views/real/dispatch', NULL, 1023, NULL, 0, 0, '智能调度', NULL, 31000, '', 0, '2019-08-23 07:44:35', '2025-01-02 03:38:33');
INSERT INTO `system_module` VALUES (26, 'MOD000026', 'MOD000024', 'map', 'Map', 'al-icon-genderless', 'map', 'views/real/map', NULL, 1023, NULL, 0, 0, '电子地图', NULL, 32000, NULL, 0, '2019-08-23 07:44:35', '2020-12-25 11:42:18');
INSERT INTO `system_module` VALUES (27, 'MOD000027', 'MOD000024', 'emu', 'Emu', 'al-icon-genderless', 'emu', 'views/real/emu', NULL, 1023, NULL, 0, 0, '模拟地图', NULL, 33000, '', 0, '2019-08-23 07:44:35', '2025-04-30 01:48:53');
INSERT INTO `system_module` VALUES (28, 'MOD000028', 'MOD000024', 'video', 'Video', 'al-icon-genderless', 'video', 'views/real/video', NULL, 1, NULL, 0, 0, '视频监控', NULL, 34000, NULL, 0, '2019-08-23 07:44:35', '2019-10-25 02:50:27');
INSERT INTO `system_module` VALUES (29, 'MOD000029', 'MOD000024', 'track', 'TrackMap', 'al-icon-genderless', 'track', 'views/real/track', NULL, 1, NULL, 0, 0, '轨迹回放', NULL, 35000, NULL, 0, '2019-08-23 07:44:35', '2019-12-04 10:14:02');
INSERT INTO `system_module` VALUES (30, 'MOD000030', 'MOD000024', 'record', 'Record', 'al-icon-genderless', 'record', 'views/real/record', NULL, 33, NULL, 0, 0, '录像回放', NULL, 36000, '', 0, '2019-08-23 07:44:35', '2023-04-10 02:17:19');
INSERT INTO `system_module` VALUES (31, 'MOD000031', '', 'data', '/data', 'al-icon-excel', '/data', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '统计分析', NULL, 40000, NULL, 0, '2019-08-23 07:44:35', '2020-09-21 10:52:35');
INSERT INTO `system_module` VALUES (32, 'MOD000032', 'MOD000031', 'logger', 'Logger', 'al-icon-genderless', 'logger', 'views/data/logger/index', 'noRedirect', 1, NULL, 0, 0, '日志报表', NULL, 49000, NULL, 0, '2019-08-23 07:44:35', '2020-11-25 01:08:13');
INSERT INTO `system_module` VALUES (33, 'MOD000033', '', 'set', '/set', 'el-icon-setting', '/set', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '系统设置', NULL, 50000, NULL, 0, '2019-08-23 07:44:35', '2020-09-21 10:52:43');
INSERT INTO `system_module` VALUES (34, 'MOD000034', 'MOD000033', 'auth', 'Auth', 'al-icon-genderless', 'auth', 'views/set/auth/index', NULL, 1, NULL, 0, 0, '权限管理', NULL, 52000, NULL, 0, '2019-08-23 07:44:35', '2019-10-25 02:50:27');
INSERT INTO `system_module` VALUES (35, 'MOD000035', 'MOD000034', 'user', 'User', 'al-icon-genderless', 'user', 'views/set/auth/user', NULL, 15, '/api/data/user', 0, 0, '用户管理', NULL, 52010, NULL, 0, '2019-08-23 07:44:35', '2019-10-25 02:50:27');
INSERT INTO `system_module` VALUES (36, 'MOD000036', 'MOD000034', 'role', 'Role', 'al-icon-genderless', 'role', 'views/set/auth/role', NULL, 15, '/api/data/role', 0, 0, '角色管理', NULL, 52020, NULL, 0, '2019-08-23 07:44:35', '2019-10-25 02:50:27');
INSERT INTO `system_module` VALUES (37, 'MOD000037', 'MOD000034', 'grant', 'Grant', 'al-icon-genderless', 'grant', 'views/set/auth/grant', NULL, 65, NULL, 0, 0, '角色权限', NULL, 52030, NULL, 0, '2019-08-23 07:44:35', '2019-11-01 01:39:46');
INSERT INTO `system_module` VALUES (38, 'MOD000038', 'MOD000033', 'menu', 'Menu', 'al-icon-genderless', 'menu', 'views/set/menu/index', NULL, 1, NULL, 0, 0, '功能配置', NULL, 51000, NULL, 0, '2019-08-23 07:44:35', '2021-01-08 11:12:25');
INSERT INTO `system_module` VALUES (39, 'MOD000039', 'MOD000038', 'module', 'Module', 'al-icon-genderless', 'module', 'views/set/menu/module', NULL, 15, '/api/data/module', 1, 0, '菜单模块', NULL, 51010, NULL, 0, '2019-08-23 07:44:35', '2019-10-31 02:04:03');
INSERT INTO `system_module` VALUES (40, 'MOD000040', 'MOD000038', 'rule', 'Rule', 'al-icon-genderless', 'rule', 'views/set/menu/rule', NULL, 7, '/api/data/rule', 1, 0, '编码规则', NULL, 51020, NULL, 0, '2019-08-23 07:44:35', '2019-10-31 02:04:06');
INSERT INTO `system_module` VALUES (41, 'MOD000041', 'MOD000033', 'doc', 'Doc', 'al-icon-genderless', 'doc', 'views/set/doc/index', NULL, 1, NULL, 0, 0, '开发文档', NULL, 53000, '', 0, '2019-08-23 07:44:35', '2021-02-22 10:37:57');
INSERT INTO `system_module` VALUES (42, 'MOD000042', 'MOD000041', 'i18n', 'I18n', 'al-icon-genderless', 'i18n', 'views/set/doc/i18n', NULL, 1, NULL, 1, 0, '国际化', NULL, 53010, NULL, 0, '2019-08-23 07:44:35', '2019-10-25 02:50:27');
INSERT INTO `system_module` VALUES (43, 'MOD000043', 'MOD000041', 'icon', 'Icon', 'al-icon-genderless', 'icon', 'views/set/doc/icon', NULL, 1, NULL, 1, 0, '图标', NULL, 53020, NULL, 0, '2019-08-23 07:44:35', '2019-10-25 02:50:27');
INSERT INTO `system_module` VALUES (44, 'MOD000044', 'MOD000032', 'system', 'SysLog', 'al-icon-genderless', 'system', 'views/data/logger/system', NULL, 33, NULL, 0, 0, '系统日志', NULL, 49010, NULL, 0, '2019-08-23 07:44:35', '2019-12-24 03:36:23');
INSERT INTO `system_module` VALUES (45, 'MOD000045', 'MOD000032', 'signin', 'SingIn', 'al-icon-genderless', 'signin', 'views/data/logger/signin', NULL, 33, NULL, 0, 0, '登录日志', NULL, 49020, NULL, 0, '2019-09-01 04:18:40', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (46, 'MOD000046', 'MOD000031', 'upload', 'Upload', 'al-icon-genderless', 'upload', 'views/data/upload/index', 'noRedirect', 1, NULL, 0, 0, '终端上报', NULL, 48000, NULL, 0, '2019-09-02 00:28:22', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (47, 'MOD000047', 'MOD000046', 'gps', 'Position', 'al-icon-genderless', 'gps', 'views/data/upload/gps', NULL, 33, NULL, 0, 0, '终端GPS上报', NULL, 48010, '', 0, '2019-09-02 00:35:35', '2021-02-03 05:49:42');
INSERT INTO `system_module` VALUES (48, 'MOD000048', 'MOD000046', 'depart_arrive', 'DepartArrive', 'al-icon-genderless', 'depart-arrive', 'views/data/upload/depart-arrive', NULL, 33, NULL, 0, 0, '车辆进出车站', NULL, 48020, NULL, 0, '2019-09-02 00:36:20', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (49, 'MOD000049', 'MOD000046', 'overspeed', 'OverSpeed', 'al-icon-genderless', 'over-speed', 'views/data/upload/over-speed', NULL, 33, NULL, 0, 0, '车辆超速', NULL, 48030, NULL, 0, '2019-09-02 00:37:11', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (50, 'MOD000050', 'MOD000046', 'card', 'Card', 'al-icon-genderless', 'card', 'views/data/upload/card', NULL, 33, NULL, 0, 0, '司机刷卡', NULL, 48040, NULL, 0, '2019-09-02 00:37:42', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (51, 'MOD000051', 'MOD000031', 'by_vehicle', 'ByVehicle', 'al-icon-genderless', 'by-vehicle', 'views/data/by-vehicle/index', 'noRedirect', 1, NULL, 0, 0, '按车辆汇总', NULL, 42000, NULL, 0, '2019-09-02 00:44:22', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (52, 'MOD000052', 'MOD000031', 'appraise', 'Appraise', 'al-icon-genderless', 'appraise', 'views/data/appraise/index', 'noRedirect', 1, NULL, 0, 0, '运营服务类', NULL, 45000, NULL, 0, '2019-09-02 00:49:31', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (53, 'MOD000053', 'MOD000052', 'dispatch_exception', 'DispatchException', 'al-icon-genderless', 'dispatch-exception', 'views/data/appraise/dispatch-exception', NULL, 33, NULL, 0, 0, '调度异常，包含串车，大间隔站点久候，中途停车，发车大间隔', NULL, 42010, NULL, 0, '2019-09-02 00:57:32', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (54, 'MOD000054', 'MOD000052', 'dispatch_over_speed', 'DispatchOverSpeed', 'al-icon-genderless', 'dispatch-over-speed', 'views/data/appraise/dispatch-over-speed', NULL, 33, NULL, 0, 0, '车辆超速', NULL, 42020, NULL, 0, '2019-09-02 01:00:58', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (55, 'MOD000055', 'MOD000052', 'apart', 'Apart', 'al-icon-genderless', 'apart', 'views/data/appraise/apart', NULL, 33, NULL, 0, 1, '行车大间隔', NULL, 42030, NULL, 0, '2019-09-02 01:03:04', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (56, 'MOD000056', 'MOD000052', 'await', 'Await', 'al-icon-genderless', 'await', 'views/data/appraise/await', NULL, 33, NULL, 0, 1, '长时间候车', NULL, 42040, NULL, 0, '2019-09-02 01:10:13', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (57, 'MOD000057', 'MOD000052', 'stop', 'Stop', 'al-icon-genderless', 'stop', 'views/data/appraise/stop', NULL, 33, NULL, 0, 1, '运营途中停车，可分析到抛锚或拥堵', NULL, 42050, NULL, 0, '2019-09-02 01:14:18', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (58, 'MOD000058', 'MOD000052', 'dispatch_on_time', 'DispatchOnTime', 'al-icon-genderless', 'dispatch-on-time', 'views/data/appraise/dispatch-on-time', NULL, 33, NULL, 0, 0, '发车准点，包含首末班发车准点，发车准点，大站准点，到达准点', NULL, 42005, NULL, 0, '2019-09-02 02:53:38', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (59, 'MOD000059', 'MOD000031', 'by_company', 'ByCompany', 'al-icon-genderless', 'by-company', 'views/data/by-company/index', 'noRedirect', 1, NULL, 0, 0, '按企业汇总', NULL, 40000, NULL, 0, '2019-09-02 02:59:41', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (60, 'MOD000060', 'MOD000031', 'by_route', 'ByRoute', 'al-icon-genderless', 'by-route', 'views/data/by-route/index', 'noRedirect', 1, NULL, 0, 0, '按线路汇总', NULL, 41000, NULL, 0, '2019-09-02 03:03:05', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (61, 'MOD000061', 'MOD000059', 'company_monthly', 'CompanyMonthly', 'al-icon-genderless', 'company-monthly', 'views/data/by-company/company-monthly', NULL, 545, NULL, 0, 0, '企业月度同比环比', NULL, 41013, NULL, 0, '2019-09-02 03:03:36', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (62, 'MOD000062', 'MOD000034', 'console', 'Console', 'al-icon-genderless', 'console', 'views/set/auth/console', NULL, 15, NULL, 0, 0, '控制台', NULL, 52040, NULL, 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (63, 'MOD000063', 'MOD000034', 'service', 'Service', 'al-icon-genderless', 'service', 'views/set/auth/service', NULL, 7, NULL, 0, 0, '服务台', NULL, 52050, NULL, 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (64, 'MOD000064', 'MOD000023', 'repair_plan', 'RepairPlan', 'al-icon-genderless', 'repair-plan', 'views/plan/repair/plan', '', 1023, NULL, 0, 0, '行车计划维护', NULL, 25010, NULL, 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (65, 'MOD000065', 'MOD000023', 'repair_idle', 'RepairIdle', 'al-icon-genderless', 'repair-idle', 'views/plan/repair/idle', '', 1023, NULL, 0, 0, '非运营数据维护', NULL, 25020, NULL, 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (66, 'MOD000069', 'MOD000014', 'station', 'RouteWay', 'al-icon-genderless', 'station', 'views/basic/place/station', NULL, 575, NULL, 0, 0, '线路站点管理', NULL, 14040, NULL, 0, '2019-11-05 13:49:05', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (67, 'MOD000070', 'MOD000059', 'company_weekly', 'CompanyWeekly', 'al-icon-genderless', 'company-weekly', 'views/data/by-company/company-weekly', NULL, 49, NULL, 1, 0, '企业一周同比环比', NULL, 41012, NULL, 0, '2019-12-05 09:32:32', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (68, 'MOD000071', 'MOD000059', 'company_daily', 'CompanyDaily', 'al-icon-genderless', 'company-daily', 'views/data/by-company/company-daily', NULL, 545, NULL, 0, 0, '企业每天明细数据', NULL, 41011, NULL, 0, '2019-12-05 09:41:00', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (69, 'MOD000072', 'MOD000074', 'detail_trip', 'DetailTrip', 'al-icon-genderless', 'detail-trip', 'views/data/by-detail/detail-trip', NULL, 33, NULL, 0, 0, '线路当天行程', NULL, 43020, '', 0, '2019-12-05 09:41:00', '2022-05-06 06:44:28');
INSERT INTO `system_module` VALUES (70, 'MOD000073', 'MOD000074', 'detail_idle', 'DetailIdle', 'al-icon-genderless', 'detail-idle', 'views/data/by-detail/detail-idle', NULL, 33, NULL, 0, 0, '线路当天非运营', NULL, 43030, NULL, 0, '2019-12-05 09:41:00', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (71, 'MOD000074', 'MOD000031', 'by_detail', 'ByDetail', 'al-icon-genderless', 'by-detail', 'views/data/by-detail/index', 'noRedirect', 1, NULL, 0, 0, '按明细', NULL, 44000, NULL, 0, '2019-09-02 03:03:05', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (72, 'MOD000075', 'MOD000060', 'route_monthly', 'RouteMonthly', 'al-icon-genderless', 'route-monthly', 'views/data/by-route/route-monthly', NULL, 545, NULL, 0, 0, '线路月度同比环比', NULL, 41099, NULL, 0, '2019-12-05 09:41:00', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (73, 'MOD000076', 'MOD000060', 'route_weekly', 'RouteWeekly', 'al-icon-genderless', 'route-weekly', 'views/data/by-route/route-weekly', NULL, 33, NULL, 1, 0, '线路一周同比环比', NULL, 41022, NULL, 0, '2019-12-05 09:41:00', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (74, 'MOD000077', 'MOD000060', 'route_daily', 'RouteDaily', 'al-icon-genderless', 'route-daily', 'views/data/by-route/route-daily', NULL, 545, NULL, 0, 0, '线路按天概况', NULL, 41021, NULL, 0, '2019-12-05 09:41:00', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (75, 'MOD000078', 'MOD000074', 'detail_summary', 'DetailSummary', 'al-icon-genderless', 'detail-summary', 'views/data/by-detail/detail-summary', NULL, 33, NULL, 0, 0, '线路当天台账', NULL, 43010, NULL, 0, '2019-12-05 09:41:00', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (76, 'MOD000079', 'MOD000046', 'alarm_details', 'AlarmDetails', 'al-icon-genderless', 'alarm-details', 'views/data/upload/alarm-details', NULL, 33, NULL, 0, 0, '报警明细', NULL, 48050, NULL, 0, '2019-12-11 01:49:40', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (77, 'MOD000080', 'MOD000074', 'detail_passenger', 'DetailPassenger', 'al-icon-genderless', 'detail-passenger', 'views/data/by-detail/detail-passenger', NULL, 33, NULL, 0, 0, '	\r\ndevice-seat', NULL, 43040, '', 0, '2019-12-05 09:41:00', '2021-12-06 02:00:31');
INSERT INTO `system_module` VALUES (78, 'MOD000081', 'MOD000046', 'device_snap', 'DeviceSnap', 'al-icon-genderless', 'device-snap', 'views/data/upload/device-snap', NULL, 33, NULL, 0, 0, '设备抓拍', NULL, 48060, NULL, 0, '2019-09-02 00:37:11', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (79, 'MOD000082', 'MOD000046', 'device_passenger', 'DevicePassenger', 'al-icon-genderless', 'device-passenger', 'views/data/upload/device-passenger', NULL, 33, NULL, 0, 0, '设备客流', NULL, 48070, '', 0, '2019-09-02 00:37:11', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (80, 'MOD000083', 'MOD000046', 'device_poi', 'DevicePoi', 'al-icon-genderless', 'device-poi', 'views/data/upload/device-poi', NULL, 33, NULL, 0, 0, '设备进出围栏', NULL, 48070, NULL, 0, '2019-09-02 00:37:11', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (81, 'MOD000084', 'MOD000041', 'version', 'Version', 'al-icon-genderless', 'version', 'views/set/doc/version', NULL, 1, NULL, 1, 0, '版本更新', NULL, 53030, NULL, 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (82, 'MOD000085', 'MOD000014', 'basic_region', 'BasicRegion', 'al-icon-genderless', 'basic-region', 'views/basic/place/basic-region', NULL, 63, NULL, 0, 0, '自定义区域(点,圆，矩形，多边形，路径点)', NULL, 14050, NULL, 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (83, 'MOD000086', 'MOD000088', 'basic_display', 'BasicDisplay', 'al-icon-genderless', 'basic-display', 'views/basic/display/basic-display', NULL, 63, NULL, 0, 0, '电子站牌', NULL, 14060, NULL, 0, '2020-02-20 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (84, 'MOD000087', 'MOD000088', 'basic_display_ad', 'BasicDisplayAd', 'al-icon-genderless', 'basic-display-ad', 'views/basic/display/basic-display-ad', NULL, 15, NULL, 0, 0, '电子站牌(广告)', NULL, 14070, NULL, 0, '2020-02-20 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (85, 'MOD000088', 'MOD000001', 'display', 'Display', 'al-icon-genderless', 'display', 'views/basic/display/index', 'noRedirect', 1, NULL, 0, 0, '电子站牌', NULL, 15000, '', 0, '2019-08-23 07:44:35', '2021-03-03 01:20:26');
INSERT INTO `system_module` VALUES (86, 'MOD000089', 'MOD000001', 'firmware', 'Firmware', 'al-icon-genderless', 'firmware', 'views/basic/firmware/index', 'noRedirect', 1, NULL, 0, 0, '版本管理', NULL, 16000, '', 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (87, 'MOD000090', 'MOD000089', 'basic_firmware', 'BasicFirmware', 'al-icon-genderless', 'basic-firmware', 'views/basic/firmware/basic-firmware', '', 15, NULL, 0, 0, '固件列表', NULL, 16010, NULL, 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (88, 'MOD000091', 'MOD000089', 'basic_firmware_ota', 'BasicFirmwareOta', 'al-icon-genderless', 'basic-firmware-ota', 'views/basic/firmware/basic-firmware-ota', '', 15, NULL, 0, 0, 'OTA任务', NULL, 16020, NULL, 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (89, 'MOD000092', 'MOD000074', 'ledger_trip', 'LedgerTrip', 'al-icon-genderless', 'ledger-trip', 'views/data/by-detail/ledger-trip', NULL, 33, NULL, 0, 0, 'POI行程', NULL, 43050, NULL, 0, '2019-12-05 09:41:00', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (90, 'MOD000093', 'MOD000032', 'dsp_log', 'DspLog', 'al-icon-genderless', 'dsp-log', 'views/data/logger/dsp-log', NULL, 33, NULL, 0, 0, '调度后台日志', NULL, 49030, NULL, 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (91, 'MOD000094', 'MOD000074', 'daily_dispatch', 'DailyDispatch', 'al-icon-genderless', 'daily-dispatch', 'views/data/by-detail/daily-dispatch', NULL, 33, NULL, 0, 0, '调度日统计报表', NULL, 43060, NULL, 0, '2020-03-17 08:46:50', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (92, 'MOD000095', 'MOD000051', 'daily_mileage', 'DailyMileage', 'al-icon-genderless', 'daily-mileage', 'views/data/by-vehicle/daily-mileage', NULL, 545, NULL, 0, 0, '车辆单日行驶总里程', NULL, 43080, '', 0, '2020-03-24 02:47:59', '2021-10-18 10:32:10');
INSERT INTO `system_module` VALUES (93, 'MOD000096', 'MOD000032', 'message_log', 'MessageLog', 'al-icon-genderless', 'message-log', 'views/data/logger/message-log', NULL, 33, NULL, 0, 0, '发送消息日志', NULL, 49040, NULL, 0, '2020-03-26 09:16:10', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (94, 'MOD000097', 'MOD000032', 'event_log', 'EventLog', 'al-icon-genderless', 'event-log', 'views/data/logger/event-log', NULL, 33, NULL, 0, 0, '车辆事件日志', NULL, 49050, NULL, 0, '2020-03-27 02:02:09', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (95, 'MOD000098', 'MOD000005', 'device_request', 'DeviceRequest', 'al-icon-genderless', 'device-request', 'views/basic/person/device-request', NULL, 47, NULL, 0, 0, '司机手动命令', NULL, 12040, NULL, 0, '2020-03-30 03:13:00', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (96, 'MOD000099', 'MOD000051', 'month_mileage', 'MonthMileage', 'al-icon-genderless', 'month-mileage', 'views/data/by-vehicle/month-mileage', NULL, 33, NULL, 0, 0, '车辆单月行驶总里程', NULL, 43090, NULL, 0, '2020-03-31 09:37:24', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (97, 'MOD000100', 'MOD000018', 'autoworkplan', 'AutoWorkPlan', 'al-icon-genderless', 'autoworkplan', 'views/plan/scheme-group', NULL, 1, NULL, 1, 0, '自动排班', NULL, 22001, NULL, 0, '2020-04-02 10:23:09', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (98, 'MOD000101', 'MOD000106', 'route_attendance', 'RouteAttendance', 'al-icon-genderless', 'route-attendance', 'views/data/by-route/route-attendance', NULL, 33, NULL, 0, 0, '线路考勤汇总', NULL, 41022, NULL, 0, '2020-04-07 07:17:07', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (99, 'MOD000102', 'MOD000106', 'employee_daily', 'EmployeeDaily', 'al-icon-genderless', 'employee-daily', 'views/data/by-staff/employee-daily', NULL, 33, NULL, 0, 0, '单人单日报表', NULL, 43072, NULL, 0, '2020-04-15 01:03:56', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (100, 'MOD000103', 'MOD000106', 'employee_monthly', 'EmployeeMonthly', 'al-icon-genderless', 'employee-monthly', 'views/data/by-staff/employee-monthly', NULL, 33, NULL, 0, 0, '单人月度报表', NULL, 43073, NULL, 0, '2020-04-15 02:52:52', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (101, 'MOD000104', 'MOD000024', 'navigation', 'Navigation', 'al-icon-genderless', 'navigation', 'views/real/navigation', NULL, 1, NULL, 0, 0, '地图导航', NULL, 37000, NULL, 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (102, 'MOD000105', 'MOD000014', 'region_rule', 'RegionRule', 'al-icon-genderless', 'region-rule', 'views/basic/place/region-rule', NULL, 15, NULL, 0, 0, '区域规则', NULL, 14060, NULL, 0, '2020-05-09 06:17:14', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (103, 'MOD000106', 'MOD000031', 'by_staff', 'ByStaff', 'al-icon-genderless', 'by-staff', 'views/data/by-staff/index', 'noRedirect', 1, NULL, 0, 0, '按人员汇总', NULL, 43000, NULL, 0, '2019-09-02 00:44:22', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (104, 'MOD000107', 'MOD000023', 'operation_income', 'OperationIncome', 'al-icon-genderless', 'operation-income', 'views/plan/operation/income', '', 1023, NULL, 0, 0, '票款营收', NULL, 25030, NULL, 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (105, 'MOD000109', 'MOD000051', 'by_daily_car', 'CarDaily', 'al-icon-genderless', 'car-daily', 'views/data/by-vehicle/car-daily', NULL, 33, NULL, 0, 0, '单车日统计', NULL, 43010, NULL, 0, '2020-03-24 02:47:59', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (106, 'MOD000110', 'MOD000051', 'by_month_car', 'CarMonth', 'al-icon-genderless', 'car-month', 'views/data/by-vehicle/car-month', NULL, 33, NULL, 0, 0, '单车月统计', NULL, 43020, NULL, 0, '2020-03-24 02:47:59', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (107, 'MOD000111', 'MOD000106', 'detail_daily', 'DetailDaily', 'al-icon-genderless', 'detail-daily', 'views/data/by-detail/detail-daily', NULL, 33, NULL, 0, 0, '运营日报', NULL, 43010, '', 0, '2020-05-25 03:03:24', '2024-11-05 03:16:13');
INSERT INTO `system_module` VALUES (108, 'MOD000112', 'MOD000106', 'detail_month', 'DetailMonth', 'al-icon-genderless', 'detail-month', 'views/data/by-detail/detail-daily/LedgerDailyDetailSummary', NULL, 33, NULL, 0, 0, '运营月报', NULL, 43010, '', 0, '2020-05-25 03:06:29', '2024-11-05 03:16:14');
INSERT INTO `system_module` VALUES (109, 'MOD000113', 'MOD000046', 'device_alarm_safety', 'DeviceAlarmSafety', 'al-icon-genderless', 'device-alarm-safety', 'views/data/upload/device-alarm-safety', NULL, 33, NULL, 0, 0, '主动安全报警', NULL, 48080, NULL, 0, '2020-05-27 00:37:11', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (110, 'MOD000114', '', 'console', 'console', 'el-icon-monitor', '/console', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '控制台', NULL, 2000, NULL, 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (111, 'MOD000115', 'MOD000114', 'safety_monitor', 'SafetyMonitor', 'el-icon-message-solid', 'safety-monitor', 'views/dashboard/alarm/index.vue', '', 1, NULL, 0, 0, '主动安全-监控', NULL, 20, NULL, 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (112, 'MOD000116', 'MOD000009', 'basic_car_insurance', 'BasicCarInsurance', 'al-icon-genderless', 'basic-car-insurance', 'views/basic/goods/basic-car-insurance', NULL, 15, NULL, 0, 0, '车辆保险', NULL, 13050, '', 0, '2019-08-23 07:44:35', '2021-12-15 07:34:48');
INSERT INTO `system_module` VALUES (113, 'MOD000117', 'MOD000009', 'basic_car_license', 'BasicCarLicense', 'al-icon-genderless', 'basic-car-license', 'views/basic/goods/basic-car-license', NULL, 15, NULL, 0, 0, '车辆行驶证', NULL, 13060, '', 0, '2019-08-23 07:44:35', '2021-12-15 07:34:47');
INSERT INTO `system_module` VALUES (114, 'MOD000118', 'MOD000009', 'basic_car_expire', 'BasicCarExpire', 'al-icon-genderless', 'basic-car-expire', 'views/basic/goods/basic-car-expire', NULL, 33, NULL, 0, 0, '车辆过期', NULL, 13070, '', 0, '2020-06-03 02:24:36', '2021-12-15 07:34:46');
INSERT INTO `system_module` VALUES (115, 'MOD000119', 'MOD000060', 'route_daily_detail', 'RouteDailyDetail', 'al-icon-genderless', 'route-daily-detail', 'views/data/by-route/route-daily-detail', NULL, 545, NULL, 0, 0, '线路日报', NULL, 41020, NULL, 0, '2020-06-18 02:13:00', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (116, 'MOD000120', 'MOD000023', 'operation_ic_card', 'OperationIcCard', 'al-icon-genderless', 'operation-ic-card', 'views/plan/operation/ic-card', '', 1023, NULL, 0, 0, 'IC卡收入', NULL, 25031, NULL, 0, '2020-06-19 06:04:26', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (117, 'MOD000121', 'MOD000023', 'operation_fuel', 'OperationFuel', 'al-icon-genderless', 'operation-fuel', 'views/plan/operation/operation-fuel', '', 1023, NULL, 0, 0, '能源管理', NULL, 25032, NULL, 0, '2020-06-19 09:32:30', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (118, 'MOD000122', 'MOD000060', 'route_monthly_detail', 'RouteMonthlyDetail', 'al-icon-genderless', 'route-monthly-detail', 'views/data/by-route/route-monthly-detail', NULL, 545, NULL, 0, 0, '线路月报', NULL, 41030, NULL, 0, '2020-06-24 08:23:09', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (119, 'MOD000123', 'MOD000001', 'basic_fault_repair', 'BasicFault', 'al-icon-genderless', 'basic-fault', 'views/basic/fault/index', 'noRedirect', 1023, NULL, 0, 0, '故障报修', NULL, 25033, '', 0, '2020-07-02 06:35:51', '2021-10-11 10:28:49');
INSERT INTO `system_module` VALUES (120, 'MOD000124', 'MOD000024', 'board', 'Board', 'al-icon-genderless', 'board', 'views/real/board', NULL, 1, NULL, 1, 0, '电子站牌监控', NULL, 38000, NULL, 0, '2020-07-10 09:52:29', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (121, 'MOD000125', 'MOD000123', 'basic_fault_repair', 'BasicFaultRepair', 'al-icon-genderless', 'basic-fault-repair', 'views/basic/fault/basic-fault-repair', '', 63, NULL, 0, 0, '故障报修', NULL, 25033, NULL, 0, '2020-07-02 06:35:51', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (122, 'MOD000126', 'MOD000123', 'basic_fault_description', 'BasicFaultDescription', 'al-icon-genderless', 'basic-fault-description', 'views/basic/fault/basic-fault-description', '', 15, NULL, 0, 0, '故障描述', NULL, 25033, NULL, 0, '2020-07-02 06:35:51', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (123, 'MOD000127', 'MOD000123', 'basic_fault_part', 'BasicFaultPart', 'al-icon-genderless', 'basic-fault-part', 'views/basic/fault/basic-fault-part', '', 15, NULL, 0, 0, '故障部件', NULL, 25033, NULL, 0, '2020-07-02 06:35:51', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (124, 'MOD000128', 'MOD000123', 'basic_fault_solution', 'BasicFaultSolution', 'al-icon-genderless', 'basic-fault-solution', 'views/basic/fault/basic-fault-solution', '', 15, NULL, 0, 0, '解决方案', NULL, 25033, NULL, 0, '2020-07-02 06:35:51', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (125, 'MOD000129', 'MOD000032', 'manual_command_log', 'ManualCommandLog', 'al-icon-genderless', 'manual-command', 'views/data/logger/manual-command-log', NULL, 33, NULL, 0, 0, '司机手动命令日志', NULL, 100, NULL, 0, '2020-10-27 06:45:26', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (126, 'MOD000130', 'MOD000114', 'smart_cloud_screen', 'SmartCloudScreen', 'el-icon-s-platform', 'smart-cloud-screen', 'views/real/exhibit', '', 1, NULL, 0, 0, '智慧云屏', NULL, 10, '', 0, '2019-08-23 07:44:35', '2022-12-26 10:53:53');
INSERT INTO `system_module` VALUES (127, 'MOD000134', 'MOD000038', 'open_platform', 'OpenPlatform', 'al-icon-genderless', 'open-platform', 'views/set/menu/open-platform', NULL, 15, '/api/data/open-platform', 0, 0, '开放平台', NULL, 51030, NULL, 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (128, 'MOD000131', 'MOD000074', 'acc_parking', 'AccParking', 'al-icon-genderless', 'acc-parking', 'views/data/by-detail/acc-parking', '', 1, NULL, 1, 0, 'ACC停车', NULL, 43050, NULL, 0, '2019-08-23 07:44:35', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (129, 'MOD000132', 'MOD000038', 'regular_clean', 'ReaularClean', 'al-icon-genderless', 'regalar-clean', 'views/set/menu/regular-clean', NULL, 15, '/api/data/regular-clean', 1, 0, '菜单模块', NULL, 51030, '', 0, '2019-08-23 07:44:35', '2022-10-10 09:20:25');
INSERT INTO `system_module` VALUES (130, 'MOD000133', 'MOD000046', 'device_illegal', 'DeviceIllegal', 'al-icon-genderless', 'device-illegal', 'views/data/upload/device-illegal', NULL, 33, '/api/data/device-illegal', 0, 0, '违规违章', NULL, 48090, '', 0, '2019-08-23 07:44:35', '2021-05-21 07:53:00');
INSERT INTO `system_module` VALUES (131, 'MOD000135', 'MOD000088', 'basic_ad_banner', 'BasicAdBanner', 'al-icon-genderless', 'basic-ad-banner', 'views/basic/display/basic-ad-banner', NULL, 527, NULL, 0, 0, '公交广告', NULL, 14080, NULL, 0, '2021-01-04 07:51:40', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (132, 'MOD000136', 'MOD000038', 'system_av_srs', 'SystemAvSrs', 'al-icon-genderless', 'system-av-srs', 'views/set/menu/system-av-srs', NULL, 15, '/api/data/system-av-srs', 0, 0, 'SRS服务', NULL, 51030, NULL, 0, '2021-01-15 01:14:42', '2021-01-18 08:23:26');
INSERT INTO `system_module` VALUES (133, 'MOD000137', 'MOD000114', 'real_vehicle', 'RealVehicle', 'al-icon-bus', 'dashboard-car', 'views/dashboard/car/index.vue', '', 1, NULL, 0, 0, '实时车辆', NULL, 30, NULL, 0, '2021-01-18 02:21:55', '2024-01-02 10:03:07');
INSERT INTO `system_module` VALUES (204, 'MOD000138', 'MOD000143', 'config_voice', 'ConfigVoice', 'al-icon-genderless', 'config-voice', 'views/set/config/config-voice', '', 15, '/api/data/config-voice', 0, 0, '语音库管理', NULL, 54010, '', 0, '2021-01-18 02:21:55', '2021-02-24 00:55:58');
INSERT INTO `system_module` VALUES (206, 'MOD000139', 'MOD000031', 'analysis_passenger', 'AnalysisPassenger', 'al-icon-genderless', 'analysis-passenger', 'views/data/analysis-passenger', '', 33, '', 0, 0, '客流分析', NULL, 43040, NULL, 0, '2021-01-18 02:21:55', '2021-01-27 07:36:03');
INSERT INTO `system_module` VALUES (207, 'MOD000140', 'MOD000139', 'over_load', 'OverLoad', 'al-icon-genderless', 'over-load', 'views/data/analysis-passenger/over-load', '', 1, '', 0, 0, '超载客流', NULL, 43040, NULL, 0, '2021-01-18 02:21:55', '2021-01-28 10:03:08');
INSERT INTO `system_module` VALUES (208, 'MOD000141', 'MOD000139', 'passenger_top10', 'PassengerTopTen', 'al-icon-genderless', 'passenger-top-ten', 'views/data/analysis-passenger/passenger-top-ten', '', 33, '', 0, 0, '客流TOP10', NULL, 43040, '', 0, '2021-01-18 02:21:55', '2025-04-02 01:51:20');
INSERT INTO `system_module` VALUES (214, 'MOD000142', 'MOD000074', 'detail_attendance', 'DetailAttendance', 'al-icon-genderless', 'detail-attendance', 'views/data/by-detail/detail-attendance', '', 33, '', 0, 0, '考勤明细', NULL, 43040, NULL, 0, '2021-01-18 02:21:55', '2021-01-27 10:31:53');
INSERT INTO `system_module` VALUES (215, 'MOD000143', 'MOD000033', 'config', 'Config', 'al-icon-genderless', 'config', 'views/set/config/index', '', 1, '', 0, 0, '终端配置', NULL, 54000, NULL, 0, '2021-01-18 02:21:55', '2021-02-22 10:37:53');
INSERT INTO `system_module` VALUES (217, 'MOD000144', 'MOD000143', 'device_data', 'DeviceData', 'al-icon-genderless', 'device-data', 'views/set/config/device-data', '', 15, '/api/data/config-voice', 0, 0, '终端数据', NULL, 54020, NULL, 0, '2021-01-18 02:21:55', '2021-03-04 07:59:00');
INSERT INTO `system_module` VALUES (218, 'MOD000145', 'MOD000143', 'remote_publish', 'RemotePublish', 'al-icon-genderless', 'remote-publish', 'views/set/config/remote-publish', '', 15, '/api/data/config-voice', 0, 0, '远程发布', NULL, 54030, NULL, 0, '2021-01-18 02:21:55', '2021-02-22 10:53:23');
INSERT INTO `system_module` VALUES (219, 'MOD000146', 'MOD000088', 'basic_announcement', 'BasicAnnouncement', 'al-icon-genderless', 'basic-announcement', 'views/basic/display/basic-announcement', NULL, 527, NULL, 0, 0, '公告发布', NULL, 14090, NULL, 0, '2021-04-13 01:19:48', '2021-04-13 01:19:48');
INSERT INTO `system_module` VALUES (220, 'MOD000147', 'MOD000088', 'basic_lost_found', 'BasicLostFound', 'al-icon-genderless', 'basic-lost-found', 'views/basic/display/basic-lost-found', NULL, 527, NULL, 0, 0, '失物认领', NULL, 15000, NULL, 0, '2021-04-14 03:21:42', '2021-04-14 03:21:42');
INSERT INTO `system_module` VALUES (221, 'MOD000148', 'MOD000046', 'device_region', 'DeviceRegion', 'al-icon-genderless', 'device-region', 'views/data/upload/device-region', NULL, 33, NULL, 0, 0, '进出区域', NULL, 48100, NULL, 0, '2021-05-19 01:03:35', '2021-05-19 01:03:35');
INSERT INTO `system_module` VALUES (222, 'MOD000149', 'MOD000038', 'system_av_rtp', 'SystemAvRtp', 'al-icon-genderless', 'system-av-rtp', 'views/set/menu/system-av-rtp', NULL, 15, '/api/data/system-av-rtp', 0, 0, 'RTP服务', NULL, 51040, NULL, 0, '2021-05-28 03:04:30', '2021-05-28 03:04:30');
INSERT INTO `system_module` VALUES (223, 'MOD000150', 'MOD000123', 'basic_fault_area', 'BasicFaultArea', 'al-icon-genderless', 'basic-fault-area', 'views/basic/fault/basic-fault-area', NULL, 0, '', 1, 0, '区域管理', NULL, 51040, '', 0, '2021-05-28 03:04:30', '2021-10-13 08:34:25');
INSERT INTO `system_module` VALUES (224, 'MOD000151', 'MOD000023', 'route_time_period', 'RouteTimePeriod', 'al-icon-genderless', 'route-time-period', 'views/plan/operation/route-time-period', '', 47, NULL, 0, 0, '时段金额', NULL, 25033, '', 0, '2021-08-19 03:44:27', '2021-08-19 06:12:40');
INSERT INTO `system_module` VALUES (225, 'MOD000152', 'MOD000106', 'driver_trip_level', 'DriverTripLevel', 'al-icon-genderless', 'driver-trip-level', 'views/data/by-staff/driver-trip-level', NULL, 545, NULL, 0, 0, '司机趟次等级明细表', NULL, 43074, '', 0, '2021-08-20 02:08:01', '2021-08-24 09:32:58');
INSERT INTO `system_module` VALUES (226, 'MOD000153', 'MOD000106', 'driver_trip_total', 'DriverTripTotal', 'al-icon-genderless', 'driver-trip-total', 'views/data/by-staff/driver-trip-total', NULL, 545, NULL, 0, 0, '司机趟次等级统计表', NULL, 43075, '', 0, '2021-08-24 03:38:28', '2021-08-24 09:33:04');
INSERT INTO `system_module` VALUES (227, 'MOD000154', 'MOD000038', 'platform_alarm', 'PlatformAlarm', 'al-icon-genderless', 'platform-alarm', 'views/set/menu/platform-alarm', NULL, 15, '/api/data/platform-alarm', 1, 0, '平台报警', NULL, 51050, '', 0, '2021-08-25 07:23:44', '2025-05-13 08:53:07');
INSERT INTO `system_module` VALUES (228, 'MOD000155', 'MOD000024', 'device_seat', 'DeviceSeat', 'al-icon-genderless', 'device-seat', 'views/real/device-seat', NULL, 1, NULL, 0, 0, '车辆安全带信息', NULL, 38000, '', 0, '2021-09-02 06:13:32', '2021-09-02 06:14:05');
INSERT INTO `system_module` VALUES (229, 'MOD000156', 'MOD000051', 'car_trip_total', 'CarTripTotal', 'al-icon-genderless', 'car-trip-total', 'views/data/by-vehicle/car-trip-total', NULL, 545, NULL, 0, 0, '车辆趟次等级统计', NULL, 43100, '', 0, '2021-09-06 08:51:06', '2021-09-07 01:31:08');
INSERT INTO `system_module` VALUES (230, 'MOD000157', 'MOD000018', 'system_holidays', 'SystemHolidays', 'al-icon-genderless', 'system-holidays', 'views/plan/operation/system-holidays', '', 47, NULL, 0, 0, '节假日', NULL, 25034, '', 0, '2021-10-09 01:50:17', '2021-12-06 02:04:18');
INSERT INTO `system_module` VALUES (231, 'MOD000158', 'MOD000009', 'car_renewal_examine', 'Renewal', 'al-icon-genderless', 'CarRenewalExamine', 'views/basic/goods/vehicle/CarRenewalExamine', NULL, 545, NULL, 1, 0, '车辆续费', NULL, 13050, '', 0, '2021-12-02 10:15:56', '2023-02-17 07:04:21');
INSERT INTO `system_module` VALUES (233, 'MOD000159', 'MOD000088', 'basic_ad_passenger', 'BasicAdPassenger', 'al-icon-genderless', 'basic-ad-passenger', 'views/basic/display/basic-ad-passenger', NULL, 527, NULL, 0, 0, '乘客信息模板', NULL, 16000, '', 0, '2021-12-27 08:52:08', '2021-12-31 01:05:15');
INSERT INTO `system_module` VALUES (234, 'MOD000160', 'MOD000088', 'basic_ad_passenger_publish', 'BasicAdPassengerPublish', 'al-icon-genderless', 'basic-ad-passenger-publish', 'views/basic/display/basic-ad-passenger-publish', NULL, 527, NULL, 0, 0, '乘客信息发布', NULL, 17000, '', 0, '2021-12-30 01:49:02', '2021-12-30 01:49:02');
INSERT INTO `system_module` VALUES (235, 'MOD000161', 'MOD000038', 'device_alarm', 'DeviceAlarm', 'al-icon-genderless', 'device-alarm', 'views/set/menu/device-alarm', NULL, 15, '/api/data/device-alarm', 1, 0, '终端报警', NULL, 51060, '', 0, '2022-01-12 03:44:36', '2025-05-13 08:53:04');
INSERT INTO `system_module` VALUES (236, 'MOD000162', 'MOD000038', 'system_config', 'SystemConfig', 'al-icon-genderless', 'system-config', 'views/set/menu/system-config', NULL, 15, '/api/data/system-config', 0, 0, '配置维护', NULL, 51070, '', 0, '2022-02-11 06:28:21', '2022-02-11 06:28:21');
INSERT INTO `system_module` VALUES (237, 'MOD000163', 'MOD000034', 'grant_datav', 'GrantDatav', 'al-icon-genderless', 'grant-datav', 'views/set/auth/grant-datav', NULL, 65, NULL, 0, 0, 'datav角色权限', NULL, 52040, '', 0, '2022-03-07 06:46:57', '2022-03-07 06:46:57');
INSERT INTO `system_module` VALUES (238, 'MOD000164', 'MOD000051', 'car_work_time_detail', 'CarWorkTimeDetail', 'al-icon-genderless', 'car-work-time-detail', 'views/data/by-vehicle/car-work-time-detail', NULL, 33, NULL, 0, 0, '车辆工作时长明细表', NULL, 43110, '', 0, '2022-03-25 03:14:59', '2022-03-25 03:14:59');
INSERT INTO `system_module` VALUES (239, 'MOD000173', 'MOD000074', 'monthly_safety_score', 'MonthlySafetyScore', 'al-icon-genderless', 'monthly-safety-score', 'views/data/by-vehicle/MonthlySafetyScore', NULL, 33, NULL, 0, 0, '主动安全评分月报', NULL, 43081, '', 0, '2022-12-16 10:25:45', '2022-12-16 10:25:45');
INSERT INTO `system_module` VALUES (240, 'MOD000172', 'MOD000009', 'basic_safety_score', 'BasicSafetyScore', 'al-icon-genderless', 'basic-safety-score', 'views/basic/goods/basic-safety-score', NULL, 15, NULL, 0, 0, '主动安全评分标准', NULL, 13080, '', 0, '2022-12-23 01:51:21', '2022-12-23 01:51:21');
INSERT INTO `system_module` VALUES (241, 'MOD000175', 'MOD000014', 'route2', 'Route2', 'al-icon-genderless', 'route2', 'views/basic/place/route2', NULL, 47, NULL, 0, 0, '简易线路', NULL, 14070, '', 0, '2023-02-04 07:40:02', '2023-02-04 08:10:22');
INSERT INTO `system_module` VALUES (242, 'MOD000176', 'MOD000005', 'staff', 'StaffLite', 'al-icon-genderless', 'staff-lite', 'views/basic/person/staff/StaffLite.vue', NULL, 63, NULL, 0, 0, '员工管理', NULL, 12020, '', 0, '2023-02-04 08:29:23', '2023-02-04 08:29:23');
INSERT INTO `system_module` VALUES (243, 'MOD000177', 'MOD000009', 'vehicle_manage', 'VehicleManage', 'al-icon-genderless', 'vehicle-manage', 'views/basic/goods/vehicle/VehicleManage.vue', NULL, 15, NULL, 0, 0, '车辆管理（三合一）', NULL, 13001, NULL, 0, '2023-02-06 09:44:06', '2023-03-06 07:09:36');
INSERT INTO `system_module` VALUES (244, 'MOD000178', 'MOD000009', 'basic_subscribe_topic', 'BasicSubscribeTopic', 'al-icon-genderless', 'basic-subscribe-topic', 'views/basic/goods/basic-subscribe-topic', NULL, 15, NULL, 0, 0, '主动安全订阅规则', NULL, 13090, '', 0, '2023-03-06 07:07:59', '2023-03-06 07:18:58');
INSERT INTO `system_module` VALUES (245, 'MOD000179', 'MOD000009', 'basic_car_type', 'BasicCarType', 'al-icon-genderless', 'basic-car-type', 'views/basic/goods/basic-car-type', NULL, 15, NULL, 0, 0, '车型管理', NULL, 13090, '', 0, '2023-06-27 06:46:46', '2023-07-04 03:27:44');
INSERT INTO `system_module` VALUES (247, 'MOD000180', 'MOD000018', 'workPlanNew', 'WorkPlanNew', 'al-icon-genderless', 'workplan-new', 'views/plan/workplan-new', NULL, 1023, NULL, 1, 1, '线路挂牌-新', NULL, 22000, '', 0, '2019-08-23 07:44:35', '2024-10-30 07:17:59');
INSERT INTO `system_module` VALUES (248, 'MOD000181', 'MOD000074', 'over_speed_count', 'OverSpeedCount', 'al-icon-genderless', 'over-speed-count', 'views/data/by-detail/over-speed-count', NULL, 33, NULL, 0, 0, '超速统计', NULL, 43082, NULL, 0, '2024-02-29 02:12:00', '2024-02-29 02:37:48');
INSERT INTO `system_module` VALUES (249, 'MOD000182', 'MOD000074', 'device_offline', 'DeviceOffline', 'al-icon-genderless', 'device-offline', 'views/data/by-detail/detail-offline', NULL, 33, NULL, 0, 0, '脱机设备', NULL, 48100, NULL, 0, '2021-05-19 01:03:35', '2024-02-29 09:41:09');
INSERT INTO `system_module` VALUES (251, 'MOD000183', 'MOD000009', 'basic_illegal_score', 'BasicSIlegalScore', 'al-icon-genderless', 'basic-Illegae-score', 'views/basic/goods/basic-illegal-score', NULL, 15, NULL, 0, 0, '违规扣分标准', NULL, 13091, NULL, 0, '2024-03-05 08:12:29', '2024-03-05 08:29:34');
INSERT INTO `system_module` VALUES (252, 'MOD000184', 'MOD000074', 'ledger_illegal_count', 'LedgerIllegalCount', 'al-icon-genderless', 'ledger-illegal-count', 'views/data/by-detail/ledger-illegal-count', NULL, 33, NULL, 0, 0, '违规汇总', NULL, 48200, NULL, 0, '2024-03-06 09:45:56', '2024-03-06 09:45:56');
INSERT INTO `system_module` VALUES (253, 'MOD000185', 'MOD000074', 'fatigue_driving', 'FatigueDriving', 'al-icon-genderless', 'service-illegal', 'views/data/by-detail/FatigueDriving', NULL, 33, NULL, 0, 0, '疲劳驾驶', NULL, 48201, NULL, 0, '2024-03-07 09:41:34', '2024-03-07 09:41:34');
INSERT INTO `system_module` VALUES (254, 'MOD000186', 'MOD000074', 'over_speed_region', 'OverSpeedRegion', 'al-icon-genderless', 'over-speed-region', 'views/data/by-detail/over-speed-region', NULL, 33, NULL, 0, 0, '超速区域统计', NULL, 43083, NULL, 0, '2024-03-11 01:38:45', '2024-03-11 01:43:17');
INSERT INTO `system_module` VALUES (255, 'MOD000187', 'MOD000143', 'config_common', 'ConfigCommon', 'al-icon-genderless', 'config-common', 'views/set/config/config-common', '', 15, '/api/data/config-common', 0, 0, '通用配置', NULL, 54010, NULL, 0, '2021-01-18 02:21:55', '2024-04-20 05:39:02');
INSERT INTO `system_module` VALUES (257, 'MOD000188', 'MOD000018', 'ledger_check', 'LedgerCheck', 'al-icon-genderless', 'ledger-check', 'views/plan/check', NULL, 1, NULL, 0, 0, '线路台账审核', NULL, 22000, '', 0, '2024-12-26 08:25:57', '2024-12-26 08:48:47');

-- ----------------------------
-- Table structure for system_module_datav
-- ----------------------------
DROP TABLE IF EXISTS `system_module_datav`;
CREATE TABLE `system_module_datav`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块id',
  `parent_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '上级id',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单标题',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名称',
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'al-icon-genderless' COMMENT '图标',
  `path` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url路径',
  `vue` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'vue文件路径 可以空',
  `redirect` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重定向',
  `opt` int(11) NOT NULL DEFAULT 0 COMMENT '可用权限',
  `api` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受控API',
  `is_ctrl` int(11) NOT NULL DEFAULT 0 COMMENT '是否受控 0=普通用户、管理员可见 1=超级管理员可见',
  `is_hide` int(11) NOT NULL DEFAULT 0 COMMENT '是否隐藏 0=否 1=是',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `category` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别,主动安全,电子站牌等',
  `sort_id` int(11) NULL DEFAULT 100 COMMENT '排序',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除位 1已删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_path`(`path`) USING BTREE,
  UNIQUE INDEX `uk_id`(`module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 606001 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_module_datav
-- ----------------------------
INSERT INTO `system_module_datav` VALUES (100000, '10-00-00', '', 'smart_cloud_screen', 'Screen', 'el-icon-s-platform', '/screen', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '公交大屏', NULL, 100000, 0, '2019-08-23 07:44:35', '2021-10-11 06:54:52');
INSERT INTO `system_module_datav` VALUES (101000, '10-10-00', '10-00-00', 'big_screen_operation', 'BigScreenOperation', 'al-icon-genderless', 'big-screen-operation', 'views/dashboard/operation', '', 1, NULL, 0, 0, '公交大屏-运营数据', NULL, 101000, 0, '2019-08-23 07:44:35', '2021-10-11 08:57:54');
INSERT INTO `system_module_datav` VALUES (102000, '10-20-00', '10-00-00', 'safety', 'BigScreenSafety', 'al-icon-genderless', 'big-screen-safety', 'views/dashboard/safety', '', 1, NULL, 0, 0, '公交大屏-主动安全', NULL, 102000, 0, '2019-08-23 07:44:35', '2021-10-28 06:34:49');
INSERT INTO `system_module_datav` VALUES (103000, '10-30-00', '10-00-00', 'analysis_passenger', 'BigScreenPassnger', 'al-icon-genderless', 'big-screen-passnger', 'views/dashboard/passenger', '', 1, NULL, 0, 0, '公交大屏-客流分析', NULL, 103000, 0, '2019-08-23 07:44:35', '2021-10-11 06:58:03');
INSERT INTO `system_module_datav` VALUES (200000, '20-00-00', '', 'line', 'Line', 'el-icon-share', '/line', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '公交线网', NULL, 200000, 0, '2019-08-23 07:44:35', '2021-10-11 07:03:42');
INSERT INTO `system_module_datav` VALUES (201000, '20-10-00', '20-00-00', 'line_net_route', 'LineNetRoute', 'el-icon-menu', '/line-net-route', 'views/line/line-net-route', 'noRedirect', 1, NULL, 0, 0, '公交线网-线路', NULL, 201000, 0, '2019-08-23 07:44:35', '2021-10-27 06:25:22');
INSERT INTO `system_module_datav` VALUES (201010, '20-10-10', '20-10-00', 'line_net_route_list', 'LineNetRouteList', 'al-icon-genderless', '/line-net-route-list', 'views/line/line-net-route/line-net-route-list', NULL, 33, NULL, 0, 0, '公交线路-线路分析-线路列表', NULL, 201010, 0, '2021-06-09 00:46:00', '2021-10-11 07:24:24');
INSERT INTO `system_module_datav` VALUES (201020, '20-10-20', '20-10-00', 'line_net_route_chart', 'LineNetRouteChart', 'al-icon-genderless', '/line-net-route-chart', 'views/line/line-net-route/line-net-route-chart', '', 33, NULL, 0, 0, '公交线网-线路分析-线路分布', NULL, 201020, 0, '2019-08-23 07:44:35', '2021-10-11 07:24:34');
INSERT INTO `system_module_datav` VALUES (201030, '20-10-30', '20-10-00', 'line_net_route_union', 'LineNetRouteUnion', 'al-icon-genderless', '/line-net-route-union', 'views/line/line-net-route/line-net-route-union', '', 0, NULL, 0, 0, '公交线网-线路分析-线路重复系数', NULL, 201030, 1, '2019-08-23 07:44:35', '2021-11-08 02:44:37');
INSERT INTO `system_module_datav` VALUES (202000, '20-20-00', '20-00-00', 'line_net_station', 'LineNetStation', 'el-icon-menu', '/line-net-station', 'views/line/line-net-station', 'noRedirect', 1, NULL, 0, 0, '公交线网-站点', NULL, 202000, 0, '2019-08-23 07:44:35', '2021-10-27 06:25:23');
INSERT INTO `system_module_datav` VALUES (202010, '20-20-10', '20-20-00', 'line_net_station_list', 'LineNetStationList', 'al-icon-genderless', '/line-net-station-list', 'views/line/line-net-station/line-net-station-list', '', 33, NULL, 0, 0, '公交线网-站点分析-站点列表', NULL, 202010, 0, '2019-08-23 07:44:35', '2021-10-11 07:21:00');
INSERT INTO `system_module_datav` VALUES (202020, '20-20-20', '20-20-00', 'line_net_station_union', 'LineNetStationUnion', 'al-icon-genderless', '/line-net-station-union', 'views/line/line-net-station/line-net-station-union', '', 0, NULL, 0, 0, '公交线网-站点分析-覆盖率地图', NULL, 202020, 0, '2019-08-23 07:44:35', '2021-10-11 07:29:00');
INSERT INTO `system_module_datav` VALUES (202030, '20-20-30', '20-20-00', 'line_net_station_distance', 'LineNetStationDistance', 'al-icon-genderless', '/line-net-station-distance', 'views/line/line-net-station/line-net-station-distance', '', 1, NULL, 0, 0, '公交线网-站点分析-站间距排行', NULL, 202030, 0, '2019-08-23 07:44:35', '2021-10-11 07:29:22');
INSERT INTO `system_module_datav` VALUES (203000, '20-30-00', '20-00-00', 'line_net_map', 'LineNetMap', 'el-icon-menu', '/line-net-map', 'views/line/line-net-map', '', 1, NULL, 0, 0, '公交线网-地图', NULL, 203000, 0, '2019-08-23 07:44:35', '2021-10-19 01:01:05');
INSERT INTO `system_module_datav` VALUES (300000, '30-00-00', '', 'road_operation', 'Road', 'al-icon-bus', '/road', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '公交畅行', NULL, 300000, 0, '2019-08-23 07:44:35', '2021-10-11 07:41:06');
INSERT INTO `system_module_datav` VALUES (301000, '30-10-00', '30-00-00', 'road_speed_time', 'RoadSpeedTime', 'al-icon-genderless', '/road-speed-time', 'views/road/road-speed-time', '', 1, NULL, 0, 0, '公交畅行-时段车速', NULL, 301000, 0, '2019-08-23 07:44:35', '2021-10-19 00:59:14');
INSERT INTO `system_module_datav` VALUES (302000, '30-20-00', '30-00-00', 'road_speed_day', 'RoadySpeedDay', 'al-icon-genderless', '/road-speed-day', 'views/road/road-speed-day', '', 1, NULL, 0, 0, '公交畅行-日期车速', NULL, 302000, 0, '2019-08-23 07:44:35', '2021-10-19 00:59:14');
INSERT INTO `system_module_datav` VALUES (303000, '30-30-00', '30-00-00', 'road_speed_line', 'RoadSpeedLine', 'al-icon-genderless', '/road-speed-line', 'views/road/road-speed-line', '', 33, NULL, 0, 0, '公交畅行-线路车速', NULL, 303000, 0, '2019-08-23 07:44:35', '2021-10-19 00:59:14');
INSERT INTO `system_module_datav` VALUES (304000, '30-40-00', '30-00-00', 'road_speed_station', 'RoadSpeedStation', 'al-icon-genderless', '/road-speed-station', 'views/road/road-speed-station', '', 1, NULL, 0, 0, '公交畅行-站间车速', NULL, 304000, 0, '2019-08-23 07:44:35', '2021-10-19 00:59:14');
INSERT INTO `system_module_datav` VALUES (305000, '30-50-00', '30-00-00', 'road_speed_blocking', 'RoadSpeedBlocking', 'al-icon-genderless', '/road-speed-blocking', 'views/road/road-speed-blocking', '', 1, NULL, 0, 0, '公交畅行-拥堵分析', NULL, 305000, 0, '2019-08-23 07:44:35', '2021-10-19 00:59:14');
INSERT INTO `system_module_datav` VALUES (306000, '30-60-00', '30-00-00', 'road_speed_stay', 'RoadSpeedStay', 'al-icon-genderless', '/road-speed-stay', 'views/road/road-speed-stay', '', 1, NULL, 0, 0, '公交畅行-滞站分析', NULL, 306000, 0, '2019-08-23 07:44:35', '2021-10-19 00:59:14');
INSERT INTO `system_module_datav` VALUES (400000, '40-00-00', '', 'passenger', 'Passenger', 'el-icon-s-custom', '/passenger', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '公交客流', NULL, 400000, 0, '2019-08-23 07:44:35', '2021-10-11 08:58:45');
INSERT INTO `system_module_datav` VALUES (401000, '40-10-00', '40-00-00', 'passenger_route_list', 'PassengerRouteList', 'al-icon-genderless', '/passenger-route-list', 'views/passenger/passenger-route-list', '', 1, NULL, 0, 0, '公交客流-线路客流', NULL, 401000, 0, '2019-08-23 07:44:35', '2021-10-28 06:15:32');
INSERT INTO `system_module_datav` VALUES (402000, '40-20-00', '40-00-00', 'passenger_route_daily', 'PassengerRouteDaily', 'al-icon-genderless', '/passenger-route-daily', 'views/passenger/passenger-route-daily', '', 1, NULL, 0, 0, '公交客流-线路日期客流', NULL, 402000, 0, '2019-08-23 07:44:35', '2021-10-11 08:58:56');
INSERT INTO `system_module_datav` VALUES (403000, '40-30-00', '40-00-00', 'passenger_route_time', 'PassengerRouteTime', 'al-icon-genderless', '/passenger-route-time', 'views/passenger/passenger-route-time', '', 1, NULL, 0, 0, '公交客流-线路时段客流', NULL, 403000, 0, '2019-08-23 07:44:35', '2021-10-11 08:59:11');
INSERT INTO `system_module_datav` VALUES (404000, '40-40-00', '40-00-00', 'passenger_route_top', 'PassengerRouteTop', 'al-icon-genderless', '/passenger-route-top', 'views/passenger/passenger-route-top', '', 1, NULL, 0, 0, '公交客流-线站点客流', NULL, 404000, 0, '2019-08-23 07:44:35', '2021-10-11 06:48:19');
INSERT INTO `system_module_datav` VALUES (405000, '40-50-00', '40-00-00', 'passenger_stop_top', 'PassengerStopTop', 'al-icon-genderless', '/passenger-stop-top', 'views/passenger/passenger-stop-top', '', 1, NULL, 0, 0, '公交客流-站点客流', NULL, 405000, 0, '2021-09-26 10:48:24', '2021-10-11 08:59:19');
INSERT INTO `system_module_datav` VALUES (406000, '40-60-00', '40-00-00', 'passenger_stop_daily', 'PassengerStopDaily', 'al-icon-genderless', '/passenger-stop-daily', 'views/passenger/passenger-stop-daily', '', 1, NULL, 0, 0, '公交客流-站台客流日期趋势', NULL, 406000, 0, '2019-08-23 07:44:35', '2021-10-11 08:59:24');
INSERT INTO `system_module_datav` VALUES (407000, '40-70-00', '40-00-00', 'passenger_stop_time', 'PassengerStopTime', 'al-icon-genderless', '/passenger-stop-time', 'views/passenger/passenger-stop-time', '', 1, NULL, 0, 0, '公交客流-站台客流时段趋势', NULL, 407000, 0, '2019-08-23 07:44:35', '2021-10-11 08:59:26');
INSERT INTO `system_module_datav` VALUES (500000, '50-00-00', '', 'operation', 'Operation', 'el-icon-s-data', '/operation', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '公交运营', NULL, 500000, 0, '2021-06-09 00:17:51', '2021-10-11 08:52:57');
INSERT INTO `system_module_datav` VALUES (501000, '50-10-00', '50-00-00', 'operation_schedule_plan', 'OperationSchedulePlan', 'al-icon-genderless', '/operation-schedule-plan', 'views/operation/operation-schedule-plan', '', 33, NULL, 0, 0, '公交运营-运营记录', NULL, 501000, 0, '2019-08-23 07:44:35', '2021-10-28 06:18:34');
INSERT INTO `system_module_datav` VALUES (502000, '50-20-00', '50-00-00', 'operation_schedule_idle', 'OperationScheduleIdle', 'al-icon-genderless', '/operation-schedule-idle', 'views/operation/operation-schedule-idle', '', 33, NULL, 0, 0, '公交运营-非营运记录', NULL, 502000, 0, '2019-08-23 07:44:35', '2021-10-28 06:18:43');
INSERT INTO `system_module_datav` VALUES (503000, '50-30-00', '50-00-00', 'operation_daily_route', 'OperationDailyRoute', 'al-icon-genderless', '/operation-daily-route', 'views/operation/operation-daily-route', '', 33, NULL, 0, 0, '公交运营-单线路日报', NULL, 503000, 0, '2019-08-23 07:44:35', '2021-10-19 06:09:47');
INSERT INTO `system_module_datav` VALUES (504000, '50-40-00', '50-00-00', 'operation_daily_car', 'OperationDailyCar', 'al-icon-genderless', '/operation-daily-car', 'views/operation/operation-daily-car', '', 33, NULL, 0, 0, '公交运营-单车辆日报', NULL, 504000, 0, '2019-08-23 07:44:35', '2021-10-19 06:09:51');
INSERT INTO `system_module_datav` VALUES (505000, '50-50-00', '50-00-00', 'operation_daily_employee', 'OperationDailyEmployee', 'al-icon-genderless', '/operation-daily-employee', 'views/operation/operation-daily-employee', '', 1, NULL, 0, 0, '公交运营-单人日报', NULL, 505000, 0, '2019-08-23 07:44:35', '2021-10-19 01:33:45');
INSERT INTO `system_module_datav` VALUES (506000, '50-60-00', '50-00-00', 'operation_daily_trend_chart', 'OperationDailyTrendChart', 'al-icon-genderless', '/operation-daily-trend-chart', 'views/operation/operation-daily-trend-chart', '', 1, NULL, 0, 0, '公交运营-日趋势对比图', NULL, 506000, 0, '2019-08-23 07:44:35', '2021-10-19 01:33:48');
INSERT INTO `system_module_datav` VALUES (507000, '50-70-00', '50-00-00', 'operation_trips_rank', 'OperationTripsRank', 'al-icon-genderless', '/operation-trips-rank', 'views/operation/operation-trips-rank', '', 1, NULL, 0, 0, '公交运营-运营排名图', NULL, 507000, 0, '2019-08-23 07:44:35', '2021-10-19 01:33:53');
INSERT INTO `system_module_datav` VALUES (508000, '50-80-00', '50-00-00', 'operation_trips_distributed', 'OperationTripsDistributed', 'al-icon-genderless', '/operation-trips-distributed', 'views/operation/operation-trips-distributed', '', 1, NULL, 0, 0, '公交运营-运营分布图', NULL, 508000, 0, '2019-08-23 07:44:35', '2021-10-19 01:33:56');
INSERT INTO `system_module_datav` VALUES (509000, '50-90-00', '50-00-00', 'operation_route_online', 'OperationRouteOnline', 'al-icon-genderless', '/operation-route-online', 'views/operation/operation-route-online', '', 33, NULL, 0, 0, '公交运营-线路上线车辆月报', NULL, 509000, 0, '2021-11-12 09:07:01', '2021-11-16 06:24:53');
INSERT INTO `system_module_datav` VALUES (600000, '60-00-00', '', 'safety', 'Safety', 'el-icon-message-solid', '/safety', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '主动安全', NULL, 600000, 0, '2021-06-09 00:17:51', '2021-10-28 06:39:13');
INSERT INTO `system_module_datav` VALUES (601000, '60-10-00', '60-00-00', 'safety_alarm_list', 'SafetyAlarmList', 'al-icon-genderless', '/safety-alarm-list', 'views/safety/safety-alarm-list', NULL, 1, NULL, 0, 0, '主动安全-明细列表', NULL, 601000, 0, '2021-10-28 06:15:04', '2021-10-28 08:33:14');
INSERT INTO `system_module_datav` VALUES (602000, '60-20-00', '60-00-00', 'safety_alarm_rank_route', 'SafetyAlarmRankRoute', 'al-icon-genderless', '/safety-alarm-rank-route', 'views/safety/safety-alarm-rank-route', NULL, 1, NULL, 0, 0, '主动安全-统计排名-线路', NULL, 602000, 0, '2021-10-28 06:15:04', '2021-11-08 05:49:23');
INSERT INTO `system_module_datav` VALUES (603000, '60-30-00', '60-00-00', 'safety_alarm_rank_car', 'SafetyAlarmRankCar', 'al-icon-genderless', '/safety-alarm-rank-car', 'views/safety/safety-alarm-rank-car', NULL, 1, NULL, 0, 0, '主动安全-统计排名-车辆', NULL, 603000, 0, '2021-10-28 06:15:04', '2021-11-08 05:49:23');
INSERT INTO `system_module_datav` VALUES (604000, '60-40-00', '60-00-00', 'safety_alarm_trend_daily', 'SafetyAlarmTrendDaily', 'al-icon-genderless', '/safety-alarm-trend-daily', 'views/safety/safety-alarm-trend-daily', NULL, 1, NULL, 0, 0, '主动安全-日趋势对比图', NULL, 604000, 0, '2021-10-28 06:15:04', '2021-11-08 09:40:19');
INSERT INTO `system_module_datav` VALUES (605000, '60-50-00', '60-00-00', 'safety_alarm_trend_time', 'SafetyAlarmTrendTime', 'al-icon-genderless', '/safety-alarm-trend-time', 'views/safety/safety-alarm-trend-time', NULL, 1, NULL, 0, 0, '主动安全-日均时段趋势图', NULL, 605000, 0, '2021-10-28 06:15:04', '2021-11-08 09:40:19');
INSERT INTO `system_module_datav` VALUES (606000, '60-60-00', '60-00-00', 'safety_alarm_distributed', 'SafetyAlarmDistributed', 'al-icon-genderless', '/safety-alarm-distributed', 'views/safety/safety-alarm-distributed', NULL, 1, NULL, 0, 0, '主动安全-统计分布图', NULL, 606000, 0, '2021-10-28 06:15:04', '2021-11-08 09:41:52');

-- ----------------------------
-- Table structure for system_open_platform
-- ----------------------------
DROP TABLE IF EXISTS `system_open_platform`;
CREATE TABLE `system_open_platform`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '开放平台开发者账号',
  `app_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开发ID',
  `app_secret` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开发秘钥',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `api_version` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `white_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'API请求白名单',
  `minute_request_frequency` int(11) NULL DEFAULT 0 COMMENT '每分钟允许请求次数',
  `delay_size` int(11) NULL DEFAULT 0 COMMENT '延迟多少个请求才给数据',
  `delay_filter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据过滤器',
  `last_ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后IP',
  `last_time` datetime NULL DEFAULT NULL COMMENT '最后时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_service`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_open_platform
-- ----------------------------

-- ----------------------------
-- Table structure for system_regular_clean
-- ----------------------------
DROP TABLE IF EXISTS `system_regular_clean`;
CREATE TABLE `system_regular_clean`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '定时清理',
  `database_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '库名',
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  `data_rows` bigint(20) NOT NULL DEFAULT 0 COMMENT '数据行',
  `data_length` bigint(20) NOT NULL DEFAULT 0 COMMENT '数据长度(bit)',
  `index_length` bigint(20) NOT NULL DEFAULT 0 COMMENT '索引长度',
  `is_backup` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否备份',
  `auto_backup_interval_days` smallint(6) NOT NULL DEFAULT 3 COMMENT '备份间隔',
  `auto_backup_last_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '被执行时间',
  `is_clean` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否已经定期清理，启用和keep_data_days配合使用',
  `auto_clean_keep_days` int(11) UNSIGNED NOT NULL DEFAULT 30 COMMENT '保留多少天数据, 只针对日志和循环覆盖数据，最小三天',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ix_table_name`(`database_name`, `table_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_regular_clean
-- ----------------------------

-- ----------------------------
-- Table structure for system_rule
-- ----------------------------
DROP TABLE IF EXISTS `system_rule`;
CREATE TABLE `system_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `suffix` int(11) NOT NULL DEFAULT 1,
  `remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ak_prefix`(`prefix`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_rule
-- ----------------------------
INSERT INTO `system_rule` VALUES (1, 'UID', 10002, '用户ID', '2019-08-23 07:47:46', '2025-05-13 08:48:44');
INSERT INTO `system_rule` VALUES (2, 'CID', 10001, '企业ID ทดสอบ', '2019-08-23 07:47:46', '2025-05-13 08:48:44');
INSERT INTO `system_rule` VALUES (3, 'RID', 10000, '角色ID', '2019-08-23 07:47:46', '2021-06-29 02:03:20');
INSERT INTO `system_rule` VALUES (4, 'DTY', 10000, '设备类型1', '2019-08-23 07:47:46', '2021-06-29 02:03:21');
INSERT INTO `system_rule` VALUES (5, 'MOD', 10000, '模块编码', '2019-08-26 13:05:49', '2021-06-29 02:03:22');
INSERT INTO `system_rule` VALUES (6, 'GRP', 1, 'auto create', '2025-05-13 08:53:55', '2025-05-13 08:53:55');
INSERT INTO `system_rule` VALUES (7, 'ROU', 1, 'auto create', '2025-05-13 08:54:12', '2025-05-13 08:54:12');
INSERT INTO `system_rule` VALUES (8, 'CAR', 1, 'auto create', '2025-05-13 08:54:43', '2025-05-13 08:54:43');

-- ----------------------------
-- Table structure for system_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `system_schema_history`;
CREATE TABLE `system_schema_history`  (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `script` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `checksum` int(11) NULL DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`) USING BTREE,
  INDEX `system_schema_history_s_idx`(`success`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_schema_history
-- ----------------------------

-- ----------------------------
-- Table structure for system_service
-- ----------------------------
DROP TABLE IF EXISTS `system_service`;
CREATE TABLE `system_service`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '调度台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应system_company的company_id',
  `service_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应system_service的service_id',
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度后台服务名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`service_id`) USING BTREE,
  INDEX `idx_service`(`company_id`, `service_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_service
-- ----------------------------

-- ----------------------------
-- Table structure for system_service_route
-- ----------------------------
DROP TABLE IF EXISTS `system_service_route`;
CREATE TABLE `system_service_route`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户关联角色表',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `service_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务台ID',
  `route_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应basic_route的route_id',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_service_route`(`service_id`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_service_route
-- ----------------------------

-- ----------------------------
-- Table structure for system_shedlock
-- ----------------------------
DROP TABLE IF EXISTS `system_shedlock`;
CREATE TABLE `system_shedlock`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '定时器分布式锁',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_until` timestamp(3) NULL DEFAULT NULL,
  `locked_at` timestamp(3) NULL DEFAULT NULL,
  `locked_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_shedlock
-- ----------------------------
INSERT INTO `system_shedlock` VALUES (1, 'correctionLogout', '2025-05-13 12:00:00.000', '2025-05-13 11:55:00.000', '1a1cc665cde6', '2025-05-13 06:45:00', '2025-05-13 11:55:00');
INSERT INTO `system_shedlock` VALUES (2, 'testJob1', '2025-05-13 11:57:30.000', '2025-05-13 11:57:00.001', '1a1cc665cde6', '2025-05-13 06:46:00', '2025-05-13 11:57:00');
INSERT INTO `system_shedlock` VALUES (3, 'checkDeviceFileUpload', '2025-05-13 11:55:29.153', '2025-05-13 11:50:29.153', '1a1cc665cde6', '2025-05-13 06:48:43', '2025-05-13 11:50:29');
INSERT INTO `system_shedlock` VALUES (4, 'checkOta', '2025-05-13 12:00:29.175', '2025-05-13 11:55:29.175', '1a1cc665cde6', '2025-05-13 06:53:43', '2025-05-13 11:55:29');

-- ----------------------------
-- Table structure for system_snippet
-- ----------------------------
DROP TABLE IF EXISTS `system_snippet`;
CREATE TABLE `system_snippet`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '调度台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应system_company的company_id',
  `snippet` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息模板',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_service`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_snippet
-- ----------------------------

-- ----------------------------
-- Table structure for system_todo
-- ----------------------------
DROP TABLE IF EXISTS `system_todo`;
CREATE TABLE `system_todo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '调度台',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应system_company的company_id',
  `todo_title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '待办时间标题',
  `todo_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '待办描述',
  `todo_time` datetime NOT NULL COMMENT '任务时间',
  `reminder_time` datetime NOT NULL COMMENT '提醒时间',
  `reminder_type` int(11) NULL DEFAULT NULL COMMENT '平台|邮件|短信',
  `create_user_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`todo_title`) USING BTREE,
  INDEX `idx_service`(`company_id`, `todo_title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_todo
-- ----------------------------

-- ----------------------------
-- Table structure for system_version
-- ----------------------------
DROP TABLE IF EXISTS `system_version`;
CREATE TABLE `system_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '平台版本信息',
  `company_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应system_company的company_id',
  `version` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息模板',
  `update_date` date NOT NULL COMMENT '更新日期',
  `update_info` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'JSON信息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_service`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_version
-- ----------------------------

-- ----------------------------
-- View structure for gateway_device
-- ----------------------------
DROP VIEW IF EXISTS `gateway_device`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `gateway_device` AS select `t1`.`id` AS `id`,`t1`.`company_id` AS `company_id`,`t1`.`imei` AS `imei`,`t1`.`time_zone` AS `time_zone`,`t1`.`character_set` AS `character_set`,`t2`.`type_id` AS `type_id`,`t2`.`type_name` AS `type_name`,`t2`.`protocol` AS `protocol`,`t2`.`two_in_one` AS `two_in_one`,`t3`.`car_id` AS `car_id`,`t3`.`car_name` AS `car_name`,`t3`.`lpn` AS `lpn`,`t3`.`lpn_color` AS `lpn_color` from ((`basic_device` `t1` left join `basic_device_type` `t2` on((`t1`.`type_id` = `t2`.`type_id`))) left join `basic_car` `t3` on(((`t1`.`company_id` = `t3`.`company_id`) and (`t1`.`car_id` = `t3`.`car_id`))));

-- ----------------------------
-- View structure for view_api_device
-- ----------------------------
DROP VIEW IF EXISTS `view_api_device`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_api_device` AS select `t1`.`company_id` AS `company_id`,`t1`.`id` AS `id`,`t1`.`imei` AS `imei`,`t2`.`lpn` AS `lpn`,`t2`.`has_ac` AS `has_ac`,`t2`.`mileage` AS `mileage`,`t2`.`create_time` AS `create_time`,`t2`.`update_time` AS `update_time` from (`basic_device` `t1` left join `basic_car` `t2` on(((`t1`.`car_id` = `t2`.`car_id`) and (`t1`.`company_id` = `t2`.`company_id`)))) where (`t1`.`is_deleted` = 0);

-- ----------------------------
-- View structure for view_api_direction
-- ----------------------------
DROP VIEW IF EXISTS `view_api_direction`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_api_direction` AS select `basic_route_direction`.`id` AS `id`,`basic_route_direction`.`company_id` AS `company_id`,`basic_route_direction`.`route_id` AS `route_id`,`basic_route`.`route_code` AS `route_code`,`basic_route_direction`.`direction` AS `direction`,`basic_route_direction`.`origin` AS `origin`,`basic_route_direction`.`terminal` AS `terminal`,`basic_route_direction`.`distance` AS `distance`,`basic_route_direction`.`first_time` AS `first_time`,`basic_route_direction`.`last_time` AS `last_time`,`basic_route_direction`.`intervals` AS `intervals`,`basic_route_direction`.`price` AS `price`,`basic_route_direction`.`create_time` AS `create_time`,`basic_route_direction`.`update_time` AS `update_time` from (`basic_route` join `basic_route_direction`) where ((`basic_route`.`company_id` = `basic_route_direction`.`company_id`) and (`basic_route`.`route_id` = `basic_route_direction`.`route_id`) and (`basic_route`.`way_id` = `basic_route_direction`.`way_id`) and (`basic_route`.`is_deleted` = 0) and (`basic_route_direction`.`is_deleted` = 0));

-- ----------------------------
-- View structure for view_api_route
-- ----------------------------
DROP VIEW IF EXISTS `view_api_route`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_api_route` AS select `basic_route`.`id` AS `id`,`basic_route`.`company_id` AS `company_id`,`basic_route`.`route_code` AS `route_code`,`basic_route`.`route_id` AS `route_id`,`basic_route`.`route_name` AS `route_name`,`basic_route`.`category` AS `category`,`basic_route`.`create_time` AS `create_time`,`basic_route`.`update_time` AS `update_time` from `basic_route` where (`basic_route`.`is_deleted` = 0);

-- ----------------------------
-- View structure for view_api_station
-- ----------------------------
DROP VIEW IF EXISTS `view_api_station`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_api_station` AS select `basic_route_station`.`id` AS `id`,`basic_route_station`.`company_id` AS `company_id`,`basic_route_station`.`route_id` AS `route_id`,`basic_route_station`.`route_code` AS `route_code`,`basic_route_station`.`direction` AS `direction`,`basic_route_station`.`serial` AS `serial`,`basic_route_station`.`station_name` AS `station_name`,`basic_route_station`.`flag` AS `flag`,`basic_route_station`.`lng` AS `lng`,`basic_route_station`.`lat` AS `lat`,`basic_route_station`.`create_time` AS `create_time`,`basic_route_station`.`update_time` AS `update_time` from (`basic_route` join `basic_route_station`) where ((`basic_route`.`company_id` = `basic_route_station`.`company_id`) and (`basic_route`.`route_id` = `basic_route_station`.`route_id`) and (`basic_route`.`way_id` = `basic_route_station`.`way_id`) and (`basic_route`.`is_deleted` = 0) and (`basic_route_station`.`is_deleted` = 0));

-- ----------------------------
-- View structure for view_basic_car
-- ----------------------------
DROP VIEW IF EXISTS `view_basic_car`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_basic_car` AS select `t1`.`id` AS `id`,`t1`.`company_id` AS `company_id`,`t1`.`car_id` AS `car_id`,`t1`.`car_name` AS `car_name`,`t1`.`car_state` AS `car_state`,`t1`.`vin` AS `vin`,`t1`.`lpn` AS `lpn`,`t1`.`lpn_color` AS `lpn_color`,`t1`.`fleet_id` AS `fleet_id`,`t5`.`fleet_name` AS `fleet_name`,`t1`.`route_id` AS `route_id`,`t1`.`img_url` AS `img_url`,`t1`.`icon` AS `icon`,`t1`.`register_time` AS `register_time`,`t1`.`expire_time` AS `expire_time`,`t1`.`expire_verify` AS `expire_verify`,`t1`.`approved_number` AS `approved_number`,`t1`.`fuel_km` AS `fuel_km`,`t1`.`fuel_hours` AS `fuel_hours`,`t1`.`fuel_tank` AS `fuel_tank`,`t1`.`iode_fine` AS `iode_fine`,`t1`.`has_ac` AS `has_ac`,`t1`.`mileage` AS `mileage`,`t1`.`contract_no` AS `contract_no`,`t1`.`equipment_count` AS `equipment_count`,`t1`.`seat_map` AS `seat_map`,`t1`.`remark` AS `remark`,`t1`.`vehicle_provider` AS `vehicle_provider`,`t1`.`vehicle_type` AS `vehicle_type`,`t1`.`vehicle_type_id` AS `vehicle_type_id`,`t1`.`vehicle_source` AS `vehicle_source`,`t1`.`fixed_emp_id` AS `fixed_emp_id`,`t1`.`fixed_emp_name` AS `fixed_emp_name`,`t1`.`driving_license_time` AS `driving_license_time`,`t1`.`compulsory_insurance_time` AS `compulsory_insurance_time`,`t1`.`commercial_insurance_time` AS `commercial_insurance_time`,`t1`.`next_inspection_time` AS `next_inspection_time`,`t1`.`next_maintenance_time` AS `next_maintenance_time`,`t1`.`registration_number` AS `registration_number`,`t1`.`vehicle_model` AS `vehicle_model`,`t1`.`tax_due_date` AS `tax_due_date`,`t1`.`contract_expiration_date` AS `contract_expiration_date`,`t1`.`unit_id` AS `unit_id`,`t1`.`vehicle_options` AS `vehicle_options`,`t1`.`is_deleted` AS `is_deleted`,`t1`.`create_user_id` AS `create_user_id`,`t1`.`create_time` AS `create_time`,`t1`.`update_time` AS `update_time`,`t2`.`route_name` AS `route_name`,`t3`.`imei` AS `imei`,`t3`.`type_id` AS `type_id`,`t3`.`channel` AS `channel`,`t3`.`connect_state` AS `connect_state`,`t3`.`last_connect_time` AS `last_connect_time`,`t4`.`vehicle_type` AS `vehicle_type_name` from ((((`basic_car` `t1` left join `basic_route` `t2` on(((`t1`.`company_id` = `t2`.`company_id`) and (`t1`.`route_id` = `t2`.`route_id`)))) left join `basic_device` `t3` on(((`t1`.`company_id` = `t3`.`company_id`) and (`t1`.`car_id` = `t3`.`car_id`) and (`t3`.`is_slave` = 0)))) left join `basic_car_type` `t4` on(((`t1`.`vehicle_type_id` = `t4`.`vehicle_type_id`) and (`t1`.`company_id` = `t4`.`company_id`)))) left join `basic_fleet` `t5` on((`t1`.`fleet_id` = `t5`.`fleet_id`))) where (`t1`.`is_deleted` = 0);

-- ----------------------------
-- View structure for view_basic_device
-- ----------------------------
DROP VIEW IF EXISTS `view_basic_device`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_basic_device` AS select `t1`.`id` AS `id`,`t1`.`company_id` AS `company_id`,`t1`.`imei` AS `imei`,`t1`.`fleet_id` AS `fleet_id`,`t1`.`type_id` AS `type_id`,`t1`.`car_id` AS `car_id`,`t1`.`register_time` AS `register_time`,`t1`.`expire_time` AS `expire_time`,`t1`.`time_zone` AS `time_zone`,`t1`.`character_set` AS `character_set`,`t1`.`channel` AS `channel`,`t1`.`is_slave` AS `is_slave`,`t1`.`remark` AS `remark`,`t1`.`firmware` AS `firmware`,`t1`.`ban_hint` AS `ban_hint`,`t1`.`bind_user_id` AS `bind_user_id`,`t1`.`connect_state` AS `connect_state`,`t1`.`first_connect_time` AS `first_connect_time`,`t1`.`last_connect_time` AS `last_connect_time`,`t1`.`create_user_id` AS `create_user_id`,`t1`.`is_deleted` AS `is_deleted`,`t1`.`create_time` AS `create_time`,`t1`.`update_time` AS `update_time`,`t1`.`attached` AS `attached`,`t2`.`type_name` AS `type_name`,`t2`.`support` AS `support`,`t2`.`notice` AS `notice`,`t2`.`tags` AS `tags`,`t3`.`fleet_name` AS `fleet_name`,`t4`.`car_name` AS `car_name`,`t4`.`lpn` AS `lpn`,`t4`.`vehicle_type` AS `vehicle_type`,`t5`.`route_id` AS `route_id`,`t5`.`route_name` AS `route_name` from ((((`basic_device` `t1` left join `basic_device_type` `t2` on((`t1`.`type_id` = `t2`.`type_id`))) left join `basic_fleet` `t3` on(((`t1`.`company_id` = `t3`.`company_id`) and (`t1`.`fleet_id` = `t3`.`fleet_id`)))) left join `basic_car` `t4` on(((`t1`.`company_id` = `t4`.`company_id`) and (`t1`.`car_id` = `t4`.`car_id`)))) left join `basic_route` `t5` on(((`t4`.`company_id` = `t5`.`company_id`) and (`t4`.`route_id` = `t5`.`route_id`)))) where (`t1`.`is_deleted` = 0);

-- ----------------------------
-- View structure for view_basic_employee
-- ----------------------------
DROP VIEW IF EXISTS `view_basic_employee`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_basic_employee` AS select `t1`.`id` AS `id`,`t1`.`company_id` AS `company_id`,`t1`.`emp_id` AS `emp_id`,`t1`.`emp_name` AS `emp_name`,`t1`.`nick_name` AS `nick_name`,`t1`.`emp_type` AS `emp_type`,`t1`.`emp_state` AS `emp_state`,`t1`.`fleet_id` AS `fleet_id`,`t1`.`route_id` AS `route_id`,`t1`.`quit_time` AS `quit_time`,`t1`.`entry_time` AS `entry_time`,`t1`.`personal` AS `personal`,`t1`.`birthday` AS `birthday`,`t1`.`sex` AS `sex`,`t1`.`license` AS `license`,`t1`.`category` AS `category`,`t1`.`expire` AS `expire`,`t1`.`phone` AS `phone`,`t1`.`img_url` AS `img_url`,`t1`.`address` AS `address`,`t1`.`remark` AS `remark`,`t1`.`spell` AS `spell`,`t1`.`open_id` AS `open_id`,`t1`.`is_deleted` AS `is_deleted`,`t1`.`create_user_id` AS `create_user_id`,`t1`.`create_time` AS `create_time`,`t1`.`update_time` AS `update_time`,`t1`.`emp_provider` AS `emp_provider`,`t2`.`fleet_name` AS `fleet_name`,`t3`.`route_name` AS `route_name`,`t4`.`company_name` AS `company_name`,`t4`.`title` AS `company_title` from (((`basic_employee` `t1` left join `basic_fleet` `t2` on(((`t1`.`company_id` = `t2`.`company_id`) and (`t1`.`fleet_id` = `t2`.`fleet_id`)))) left join `basic_route` `t3` on(((`t1`.`company_id` = `t3`.`company_id`) and (`t1`.`route_id` = `t3`.`route_id`)))) join `system_company` `t4` on((`t1`.`company_id` = `t4`.`company_id`))) where (`t1`.`is_deleted` = 0);

-- ----------------------------
-- View structure for view_basic_route
-- ----------------------------
DROP VIEW IF EXISTS `view_basic_route`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_basic_route` AS select `t1`.`id` AS `id`,`t1`.`company_id` AS `company_id`,`t1`.`route_id` AS `route_id`,`t1`.`route_code` AS `route_code`,`t1`.`route_name` AS `route_name`,`t1`.`fleet_id` AS `fleet_id`,`t1`.`subsidiary_fleet_id` AS `subsidiary_fleet_id`,`t1`.`way_id` AS `way_id`,`t1`.`state` AS `state`,`t1`.`category` AS `category`,`t1`.`travel` AS `travel`,`t1`.`ticket` AS `ticket`,`t1`.`trunk` AS `trunk`,`t1`.`loop_default_value` AS `loop_default_value`,`t1`.`open_time` AS `open_time`,`t1`.`stop_time` AS `stop_time`,`t1`.`sort_id` AS `sort_id`,`t1`.`remark` AS `remark`,`t1`.`create_user_id` AS `create_user_id`,`t1`.`create_time` AS `create_time`,`t1`.`update_time` AS `update_time`,`t1`.`is_deleted` AS `is_deleted`,`t2`.`fleet_name` AS `fleet_name`,`t3`.`way_name` AS `way_name` from ((`basic_route` `t1` left join `basic_fleet` `t2` on(((`t1`.`fleet_id` = `t2`.`fleet_id`) and (`t1`.`company_id` = `t2`.`company_id`)))) left join `basic_route_way` `t3` on(((`t1`.`route_id` = `t3`.`route_id`) and (`t1`.`way_id` = `t3`.`way_id`) and (`t1`.`company_id` = `t3`.`company_id`)))) where (`t1`.`is_deleted` = 0);

-- ----------------------------
-- View structure for view_basic_route_station
-- ----------------------------
DROP VIEW IF EXISTS `view_basic_route_station`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_basic_route_station` AS select `t1`.`id` AS `id`,`t1`.`company_id` AS `company_id`,`t1`.`way_id` AS `way_id`,`t1`.`route_id` AS `route_id`,`t1`.`route_code` AS `route_code`,`t1`.`direction` AS `direction`,`t1`.`serial` AS `serial`,`t1`.`station_name` AS `station_name`,`t1`.`abridge` AS `abridge`,`t1`.`flag` AS `flag`,`t1`.`lng` AS `lng`,`t1`.`lat` AS `lat`,`t1`.`azimuth` AS `azimuth`,`t1`.`distance` AS `distance`,`t1`.`distance_previous` AS `distance_previous`,`t1`.`duration` AS `duration`,`t1`.`parking` AS `parking`,`t1`.`stop_id` AS `stop_id`,`t1`.`identifier` AS `identifier`,`t1`.`is_opposite` AS `is_opposite`,`t1`.`previous_station_name` AS `previous_station_name`,`t1`.`create_user_id` AS `create_user_id`,`t1`.`is_deleted` AS `is_deleted`,`t1`.`create_time` AS `create_time`,`t1`.`update_time` AS `update_time`,`t2`.`stop_code` AS `stop_code`,`t2`.`stop_name` AS `stop_name`,`t3`.`route_name` AS `route_name` from ((`basic_route_station` `t1` left join `basic_busstop` `t2` on(((`t1`.`company_id` = `t2`.`company_id`) and (`t1`.`stop_id` = `t2`.`stop_id`) and (`t2`.`is_deleted` = 0)))) join `basic_route` `t3` on(((`t1`.`company_id` = `t3`.`company_id`) and (`t1`.`route_id` = `t3`.`route_id`) and (`t3`.`is_deleted` = 0)))) where (`t1`.`is_deleted` = 0);

-- ----------------------------
-- View structure for view_basic_sim
-- ----------------------------
DROP VIEW IF EXISTS `view_basic_sim`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_basic_sim` AS select `t1`.`id` AS `id`,`t1`.`company_id` AS `company_id`,`t1`.`sim_id` AS `sim_id`,`t1`.`phone` AS `phone`,`t1`.`iccid` AS `iccid`,`t1`.`register_time` AS `register_time`,`t1`.`remark` AS `remark`,`t1`.`installed_imei` AS `installed_imei`,`t1`.`create_user_id` AS `create_user_id`,`t1`.`create_time` AS `create_time`,`t1`.`update_time` AS `update_time`,`t3`.`car_name` AS `car_name`,`t3`.`route_id` AS `route_id` from ((`basic_sim` `t1` left join `basic_device` `t2` on(((`t1`.`company_id` = `t2`.`company_id`) and (`t1`.`installed_imei` = `t2`.`imei`)))) left join `basic_car` `t3` on(((`t2`.`company_id` = `t3`.`company_id`) and (`t2`.`car_id` = `t3`.`car_id`))));

-- ----------------------------
-- View structure for view_car
-- ----------------------------
DROP VIEW IF EXISTS `view_car`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_car` AS select `t1`.`company_id` AS `company_id`,`t1`.`car_id` AS `car_id`,`t1`.`car_name` AS `car_name`,`t1`.`lpn` AS `lpn`,`t1`.`fleet_id` AS `fleet_id`,`t1`.`route_id` AS `route_id`,`t2`.`imei` AS `imei`,`t2`.`time_zone` AS `time_zone`,`t2`.`character_set` AS `character_set` from (`basic_car` `t1` left join `basic_device` `t2` on(((`t1`.`company_id` = `t2`.`company_id`) and (`t1`.`car_id` = `t2`.`car_id`) and (`t2`.`is_slave` = 0)))) where ((`t1`.`is_deleted` = 0) and (`t2`.`is_deleted` = 0));

-- ----------------------------
-- View structure for view_car_route
-- ----------------------------
DROP VIEW IF EXISTS `view_car_route`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_car_route` AS select `t1`.`id` AS `id`,`t1`.`company_id` AS `company_id`,`t1`.`car_id` AS `car_id`,`t1`.`car_name` AS `car_name`,`t1`.`icon` AS `car_type`,`t1`.`route_id` AS `route_id`,`t1`.`fleet_id` AS `fleet_id`,`t1`.`lpn` AS `lpn`,`t1`.`approved_number` AS `approved_number`,`t1`.`vehicle_type_id` AS `vehicle_type_id`,`t5`.`vehicle_type` AS `vehicle_type_name`,`t2`.`route_code` AS `route_code`,`t2`.`route_name` AS `route_name`,`t3`.`imei` AS `imei`,`t3`.`channel` AS `channel`,`t3`.`connect_state` AS `connect_state`,`t4`.`protocol` AS `protocol`,`t4`.`support` AS `support`,`t1`.`expire_time` AS `expire_time` from ((((`basic_car` `t1` left join `basic_route` `t2` on(((`t1`.`company_id` = `t2`.`company_id`) and (`t1`.`route_id` = `t2`.`route_id`)))) left join `basic_device` `t3` on(((`t1`.`company_id` = `t3`.`company_id`) and (`t1`.`car_id` = `t3`.`car_id`) and (`t3`.`is_slave` = 0)))) left join `basic_device_type` `t4` on((`t3`.`type_id` = `t4`.`type_id`))) left join `basic_car_type` `t5` on(((`t1`.`company_id` = `t5`.`company_id`) and (`t1`.`vehicle_type_id` = `t5`.`vehicle_type_id`)))) where (`t1`.`is_deleted` = 0);

-- ----------------------------
-- View structure for view_device
-- ----------------------------
DROP VIEW IF EXISTS `view_device`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_device` AS select `t1`.`id` AS `id`,`t1`.`imei` AS `imei`,`t2`.`car_id` AS `car_id`,`t2`.`car_name` AS `car_name`,`t2`.`lpn` AS `lpn`,`t2`.`company_id` AS `company_id`,`t2`.`route_id` AS `route_id`,`t2`.`vehicle_type` AS `vehicle_type`,`t2`.`vehicle_type_id` AS `vehicle_type_id`,`bct`.`vehicle_type` AS `vehicle_standard` from ((`basic_device` `t1` left join `basic_car` `t2` on(((`t1`.`company_id` = `t2`.`company_id`) and (`t1`.`car_id` = `t2`.`car_id`)))) left join `basic_car_type` `bct` on(((`t2`.`company_id` = `bct`.`company_id`) and (`t2`.`vehicle_type_id` = `bct`.`vehicle_type_id`)))) where (`t1`.`is_deleted` = 0);

-- ----------------------------
-- View structure for view_device_route
-- ----------------------------
DROP VIEW IF EXISTS `view_device_route`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_device_route` AS select `basic_device`.`id` AS `id`,`basic_device`.`company_id` AS `company_id`,`basic_device`.`imei` AS `imei`,`basic_device`.`time_zone` AS `time_zone`,`basic_device`.`character_set` AS `character_set`,`basic_device`.`attached` AS `attached`,`basic_car`.`car_id` AS `car_id`,`basic_car`.`car_name` AS `car_name`,`basic_car`.`lpn` AS `lpn`,`basic_car`.`approved_number` AS `approved_number`,`basic_route`.`route_id` AS `route_id`,`basic_route`.`route_name` AS `route_name`,`basic_route`.`route_code` AS `route_code`,`basic_fleet`.`fleet_id` AS `fleet_id`,`basic_fleet`.`fleet_name` AS `fleet_name`,`basic_device_type`.`protocol` AS `protocol`,`basic_device_type`.`alarm_mapping` AS `alarm_mapping`,`basic_car_type`.`vehicle_type` AS `vehicle_type_name` from (((((`basic_device` left join `basic_car` on(((`basic_device`.`company_id` = `basic_car`.`company_id`) and (`basic_device`.`car_id` = `basic_car`.`car_id`)))) left join `basic_route` on(((`basic_device`.`company_id` = `basic_route`.`company_id`) and (`basic_car`.`route_id` = `basic_route`.`route_id`)))) left join `basic_fleet` on(((`basic_route`.`company_id` = `basic_fleet`.`company_id`) and (`basic_route`.`fleet_id` = `basic_fleet`.`fleet_id`)))) left join `basic_device_type` on((`basic_device`.`type_id` = `basic_device_type`.`type_id`))) left join `basic_car_type` on(((`basic_device`.`company_id` = `basic_car_type`.`company_id`) and (`basic_car`.`vehicle_type_id` = `basic_car_type`.`vehicle_type_id`)))) where (`basic_device`.`is_deleted` = 0);

-- ----------------------------
-- View structure for view_display
-- ----------------------------
DROP VIEW IF EXISTS `view_display`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_display` AS select `t1`.`id` AS `id`,`t1`.`company_id` AS `company_id`,`t1`.`display_id` AS `display_id`,`t1`.`display_name` AS `display_name`,`t3`.`route_id` AS `route_id`,`t5`.`route_name` AS `route_name`,`t3`.`way_id` AS `way_id`,`t3`.`id` AS `station_id`,`t3`.`route_code` AS `route_code`,`t3`.`direction` AS `direction`,`t3`.`serial` AS `serial`,`t4`.`origin` AS `origin`,`t4`.`terminal` AS `terminal` from ((((`basic_display` `t1` join `basic_busstop` `t2` on(((`t1`.`company_id` = `t2`.`company_id`) and (`t1`.`stop_id` = `t2`.`stop_id`)))) join `basic_route_station` `t3` on(((`t1`.`company_id` = `t3`.`company_id`) and (`t1`.`stop_id` = `t3`.`stop_id`) and (`t3`.`is_deleted` = 0)))) join `basic_route_direction` `t4` on(((`t1`.`company_id` = `t4`.`company_id`) and (`t3`.`route_id` = `t4`.`route_id`) and (`t3`.`way_id` = `t4`.`way_id`) and (`t3`.`direction` = `t4`.`direction`) and (`t4`.`is_deleted` = 0)))) join `basic_route` `t5` on(((`t1`.`company_id` = `t5`.`company_id`) and (`t3`.`route_id` = `t5`.`route_id`) and (`t3`.`way_id` = `t5`.`way_id`) and (`t5`.`is_deleted` = 0)))) where (`t1`.`is_deleted` = 0) order by `t1`.`display_id`,`t5`.`sort_id`;

-- ----------------------------
-- View structure for view_gateway_device
-- ----------------------------
DROP VIEW IF EXISTS `view_gateway_device`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_gateway_device` AS select `t1`.`id` AS `id`,`t1`.`company_id` AS `company_id`,`t1`.`imei` AS `imei`,`t1`.`time_zone` AS `time_zone`,`t1`.`character_set` AS `character_set`,`t2`.`type_id` AS `type_id`,`t2`.`type_name` AS `type_name`,`t2`.`protocol` AS `protocol`,`t3`.`car_id` AS `car_id`,`t3`.`car_name` AS `car_name` from ((`basic_device` `t1` left join `basic_device_type` `t2` on((`t1`.`type_id` = `t2`.`type_id`))) left join `basic_car` `t3` on(((`t1`.`company_id` = `t3`.`company_id`) and (`t1`.`car_id` = `t3`.`car_id`))));

-- ----------------------------
-- View structure for view_plan
-- ----------------------------
DROP VIEW IF EXISTS `view_plan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_plan` AS select `schedule_plan`.`id` AS `id`,`schedule_plan`.`company_id` AS `company_id`,`schedule_plan`.`work_date` AS `work_date`,`schedule_plan`.`route_id` AS `route_id`,`schedule_plan`.`route_name` AS `route_name`,`schedule_plan`.`run_route_id` AS `run_route_id`,`schedule_plan`.`run_route_name` AS `run_route_name`,`schedule_plan`.`plan_type` AS `plan_type`,`schedule_plan`.`car_id` AS `car_id`,`schedule_plan`.`car_name` AS `car_name`,`schedule_plan`.`lpn` AS `lpn`,`schedule_plan`.`emp_id` AS `emp_id`,`schedule_plan`.`emp_name` AS `emp_name`,`schedule_plan`.`direction` AS `direction`,`schedule_plan`.`plan_depart` AS `plan_depart`,`schedule_plan`.`real_depart` AS `real_depart`,`schedule_plan`.`plan_arrive` AS `plan_arrive`,`schedule_plan`.`real_arrive` AS `real_arrive`,`schedule_plan`.`plan_mileage` AS `plan_mileage`,`schedule_plan`.`real_mileage` AS `real_mileage`,`schedule_plan`.`gps_mileage` AS `gps_mileage`,`schedule_plan`.`origin_station` AS `origin_station`,`schedule_plan`.`terminal_station` AS `terminal_station`,`schedule_plan`.`trips` AS `trips`,timestampdiff(MINUTE,`schedule_plan`.`real_depart`,`schedule_plan`.`real_arrive`) AS `real_duration` from `schedule_plan` where ((`schedule_plan`.`is_deleted` = 0) and (`schedule_plan`.`state` = 2));

-- ----------------------------
-- View structure for view_route
-- ----------------------------
DROP VIEW IF EXISTS `view_route`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_route` AS select `t1`.`id` AS `id1`,`t1`.`company_id` AS `company_id`,`t1`.`way_id` AS `way_id`,`t1`.`route_id` AS `route_id`,`t1`.`route_code` AS `route_code`,`t1`.`route_name` AS `route_name`,`t1`.`state` AS `state`,`t1`.`category` AS `category`,`t2`.`id` AS `id2`,`t2`.`direction` AS `direction`,`t2`.`origin` AS `origin`,`t2`.`terminal` AS `terminal`,`t2`.`first_time` AS `first_time`,`t2`.`last_time` AS `last_time`,`t2`.`distance` AS `distance`,`t2`.`price` AS `price`,`t2`.`intervals` AS `intervals`,`t2`.`path` AS `path`,`t2`.`style` AS `style`,`t2`.`non_linear` AS `non_linear`,`t2`.`avg_station_km` AS `avg_station_km`,`t2`.`station_count` AS `station_count` from (`basic_route` `t1` join `basic_route_direction` `t2`) where ((`t1`.`company_id` = `t2`.`company_id`) and (`t1`.`route_id` = `t2`.`route_id`) and (`t1`.`way_id` = `t2`.`way_id`) and (`t1`.`is_deleted` = 0) and (`t2`.`is_deleted` = 0)) order by `t1`.`sort_id`;

-- ----------------------------
-- View structure for view_route_station
-- ----------------------------
DROP VIEW IF EXISTS `view_route_station`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_route_station` AS select `br`.`id` AS `id1`,`br`.`company_id` AS `company_id`,`br`.`route_id` AS `route_id`,`br`.`route_name` AS `route_name`,`br`.`route_code` AS `route_code`,`brd`.`id` AS `id2`,`brd`.`direction` AS `direction`,`brd`.`distance` AS `distance_all`,`brd`.`origin` AS `origin`,`brd`.`terminal` AS `terminal`,`brs`.`id` AS `id3`,`brs`.`serial` AS `serial`,`brs`.`lat` AS `lat`,`brs`.`lng` AS `lng`,`brs`.`duration` AS `duration`,`brs`.`distance` AS `distance_origin`,`brs`.`distance_previous` AS `distance_previous`,`brs`.`station_name` AS `station_name`,`brs`.`abridge` AS `abridge`,`brs`.`stop_id` AS `stop_id`,`brs`.`previous_station_name` AS `previous_station_name`,(select `brw`.`way_name` from `basic_route_way` `brw` where (`brw`.`way_id` = `brs`.`way_id`) limit 1) AS `way_name` from ((`basic_route` `br` join `basic_route_direction` `brd`) join `basic_route_station` `brs`) where ((`br`.`company_id` = `brd`.`company_id`) and (`br`.`company_id` = `brs`.`company_id`) and (`br`.`route_id` = `brd`.`route_id`) and (`br`.`route_id` = `brs`.`route_id`) and (`br`.`way_id` = `brd`.`way_id`) and (`br`.`way_id` = `brs`.`way_id`) and (`brd`.`direction` = `brs`.`direction`) and (`br`.`is_deleted` = 0) and (`brd`.`is_deleted` = 0) and (`brs`.`is_deleted` = 0));

-- ----------------------------
-- View structure for view_station
-- ----------------------------
DROP VIEW IF EXISTS `view_station`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_station` AS select `br`.`id` AS `id1`,`br`.`company_id` AS `company_id`,`br`.`route_id` AS `route_id`,`br`.`route_name` AS `route_name`,`br`.`route_code` AS `route_code`,`brw`.`category` AS `category`,`brd`.`id` AS `id2`,`brd`.`direction` AS `direction`,`brd`.`distance` AS `distance1`,`brd`.`origin` AS `origin`,`brd`.`terminal` AS `terminal`,`brs`.`id` AS `id3`,`brs`.`serial` AS `serial`,`brs`.`lat` AS `lat`,`brs`.`lng` AS `lng`,`brs`.`duration` AS `duration`,`brs`.`distance` AS `distance`,`brs`.`distance_previous` AS `distance_previous`,`brs`.`station_name` AS `station_name`,`brs`.`abridge` AS `abridge`,`brs`.`stop_id` AS `stop_id`,`brs`.`is_opposite` AS `is_opposite` from (((`basic_route` `br` join `basic_route_way` `brw` on(((`br`.`company_id` = `brw`.`company_id`) and (`br`.`route_id` = `brw`.`route_id`) and (`br`.`way_id` = `brw`.`way_id`) and (`brw`.`is_deleted` = 0)))) join `basic_route_direction` `brd` on(((`br`.`company_id` = `brd`.`company_id`) and (`br`.`route_id` = `brd`.`route_id`) and (`brw`.`way_id` = `brd`.`way_id`) and (`brd`.`is_deleted` = 0)))) join `basic_route_station` `brs` on(((`br`.`company_id` = `brs`.`company_id`) and (`br`.`route_id` = `brs`.`route_id`) and (`brd`.`way_id` = `brs`.`way_id`) and (`brd`.`direction` = `brs`.`direction`) and (`brs`.`is_deleted` = 0)))) where (`br`.`is_deleted` = 0) order by `br`.`sort_id`,`brd`.`direction`,`brs`.`serial`;

-- ----------------------------
-- View structure for view_station_stop
-- ----------------------------
DROP VIEW IF EXISTS `view_station_stop`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_station_stop` AS select `t1`.`id` AS `id`,`t2`.`company_id` AS `company_id`,`t1`.`route_id` AS `route_id`,`t2`.`route_name` AS `route_name`,`t1`.`way_id` AS `way_id`,`t1`.`route_code` AS `route_code`,`t1`.`direction` AS `direction`,`t1`.`serial` AS `serial`,`t1`.`flag` AS `station_flag`,`t1`.`station_name` AS `station_name`,`t1`.`stop_id` AS `stop_id`,`t3`.`stop_code` AS `stop_code`,`t3`.`stop_name` AS `stop_name`,`t3`.`lat` AS `stop_lat`,`t3`.`lng` AS `stop_lng`,`t1`.`lat` AS `lat`,`t1`.`lng` AS `lng`,`t1`.`distance` AS `distance`,`t1`.`duration` AS `duration` from (((`basic_route_station` `t1` join `basic_route` `t2` on(((`t1`.`company_id` = `t2`.`company_id`) and (`t1`.`route_id` = `t2`.`route_id`) and (`t1`.`way_id` = `t2`.`way_id`) and (`t2`.`is_deleted` = 0)))) left join `basic_busstop` `t3` on(((`t1`.`company_id` = `t3`.`company_id`) and (`t1`.`stop_id` = `t3`.`stop_id`)))) left join `basic_route_direction` `t4` on(((`t1`.`company_id` = `t4`.`company_id`) and (`t1`.`way_id` = `t4`.`way_id`) and (`t1`.`direction` = `t4`.`direction`) and (`t1`.`route_id` = `t4`.`route_id`) and (`t4`.`is_deleted` = 0)))) where (`t1`.`is_deleted` = 0);

-- ----------------------------
-- View structure for view_stop_across
-- ----------------------------
DROP VIEW IF EXISTS `view_stop_across`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_stop_across` AS select `station`.`id` AS `id`,`route`.`company_id` AS `company_id`,`route`.`route_id` AS `route_id`,`route`.`route_name` AS `route_name`,`route`.`way_id` AS `way_id`,`route`.`state` AS `state`,`direction`.`origin` AS `origin`,`direction`.`terminal` AS `terminal`,`direction`.`first_time` AS `first_time`,`direction`.`last_time` AS `last_time`,`direction`.`direction` AS `direction`,`direction`.`distance` AS `distance`,`direction`.`intervals` AS `intervals`,`direction`.`price` AS `price`,`station`.`serial` AS `serial`,`station`.`stop_id` AS `stop_id` from ((`basic_route` `route` join `basic_route_direction` `direction`) join `basic_route_station` `station`) where ((`route`.`company_id` = `station`.`company_id`) and (`route`.`route_id` = `station`.`route_id`) and (`route`.`way_id` = `station`.`way_id`) and (`route`.`company_id` = `direction`.`company_id`) and (`route`.`route_id` = `direction`.`route_id`) and (`route`.`way_id` = `direction`.`way_id`) and (`direction`.`direction` = `station`.`direction`) and (`route`.`is_deleted` = 0) and (`direction`.`is_deleted` = 0) and (`station`.`is_deleted` = 0));

-- ----------------------------
-- View structure for v_device
-- ----------------------------
DROP VIEW IF EXISTS `v_device`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_device` AS select `t1`.`id` AS `id`,`t1`.`company_id` AS `cid`,`t1`.`imei` AS `devid`,`t1`.`time_zone` AS `timezone`,`t1`.`character_set` AS `character_set`,`t2`.`protocol` AS `protocol`,`t2`.`type_id` AS `typeid`,`t2`.`type_name` AS `typename`,`t2`.`two_in_one` AS `twoinone`,`t2`.`two_in_one` AS `two_in_one` from (`basic_device` `t1` left join `basic_device_type` `t2` on((`t1`.`type_id` = `t2`.`type_id`)));

-- ----------------------------
-- Procedure structure for create_partition_by_month
-- ----------------------------
DROP PROCEDURE IF EXISTS `create_partition_by_month`;
delimiter ;;
CREATE PROCEDURE `create_partition_by_month`(IN_SCHEMANAME VARCHAR(64), IN_TABLENAME VARCHAR(64))
BEGIN

    # 需要创建的分区的个数
    DECLARE ROWS_CNT INT UNSIGNED;
    # 目前日期
    DECLARE TARGET_DATE TIMESTAMP;
    # 分区的名称，格式为p_201806
    DECLARE PARTITIONNAME VARCHAR(8);
    # 当前分区名称的分区值上限，即为 PARTITIONNAME + 1
    DECLARE PARTITION_ADD_MONTH VARCHAR(10);

    # 当前时间 + 一个月 表下个月
    SET TARGET_DATE = NOW() + INTERVAL 1 MONTH;
    # 需要新建的分区名 格式为p_201806
    SET PARTITIONNAME = DATE_FORMAT( TARGET_DATE, 'p_%Y%m' );
    
    # 新分区参数需要再加一个月 如 p_201806 对应的是 2018-07-01 表示小于2018-07-01的数据存放p_201806
    SET TARGET_DATE = TARGET_DATE + INTERVAL 1 MONTH;
    # LESS THAN 后的参数, 格式为2018-07-01
    SET PARTITION_ADD_MONTH = DATE_FORMAT( TARGET_DATE, '%Y-%m-01' );

    # 检查要建的分区是否存在
    SELECT COUNT(*) INTO ROWS_CNT FROM 
        information_schema.partitions
    WHERE table_schema = IN_SCHEMANAME AND table_name = IN_TABLENAME AND partition_name = PARTITIONNAME;
		# 表存在并未创建分区
    IF ROWS_CNT = 0 AND EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=IN_SCHEMANAME AND TABLE_NAME=IN_TABLENAME) THEN
        # 要建的分区不存在就创建
        SET @SQL = CONCAT( 'ALTER TABLE `', IN_SCHEMANAME, '`.`', IN_TABLENAME, '`',
            ' ADD PARTITION (PARTITION `', PARTITIONNAME, "` VALUES LESS THAN (TO_DAYS('",
            PARTITION_ADD_MONTH ,"')));" );
        SELECT @SQL;
        PREPARE STMT FROM @SQL;
        EXECUTE STMT;
        DEALLOCATE PREPARE STMT;
    ELSE
        SELECT CONCAT("partition `", PARTITIONNAME, "` for table `",IN_SCHEMANAME, ".", IN_TABLENAME, "` already exists OR table not exists") AS result;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_dispatch_init
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_dispatch_init`;
delimiter ;;
CREATE PROCEDURE `procedure_dispatch_init`(IN `$workDate` VARCHAR(10), `$companyId` VARCHAR(16))
BEGIN

	# 当天派班运营方案使用的站点方案, 同步线路表
	UPDATE basic_route t1, scheme_master t2, scheme_date t3
	SET t1.way_id = t2.way_id
	WHERE t1.company_id = t2.company_id
		AND t1.route_id = t2.route_id
		AND t1.company_id = t3.company_id
		AND t1.route_id = t3.route_id
		AND t2.scheme_id = t3.scheme_id
		AND t3.work_date = $workDate
		AND (t1.company_id = $companyId OR IFNULL($companyId,'') = '')
		AND t3.is_deleted = 0
		AND t1.is_deleted = 0
		AND t2.is_deleted = 0;


	# 当天派班运营方案使用的站点方案首末班, 同步线路表方向首末班
	UPDATE scheme_date t1, scheme_master t2, scheme_direction t3, basic_route_direction t4	
	SET t4.first_time = t3.first_time, t4.last_time = t3.last_time
	WHERE t1.work_date = $workDate
		AND (t1.route_id = $companyId OR IFNULL($companyId,'') = '') 
		AND t1.company_id = t2.company_id
		AND t1.company_id = t3.company_id
		AND t1.company_id = t4.company_id
		AND t1.route_id = t2.route_id
		AND t1.route_id = t3.route_id
		AND t1.route_id = t4.route_id
		AND t1.scheme_id = t2.scheme_id
		AND t1.scheme_id = t3.scheme_id
		AND t3.direction = t4.direction
		AND t2.way_id = t4.way_id
		AND t1.is_deleted = 0
		AND t2.is_deleted = 0
		AND t3.is_deleted = 0
		AND t4.is_deleted = 0
		AND (t3.first_time <> t4.first_time OR t3.last_time <> t4.last_time);
		
	# 机动司机
	INSERT INTO schedule_attendance(company_id, route_id, plan_serial, emp_id, emp_name, emp_type, spell, work_date, route_name)
	SELECT company_id, route_id, 0, emp_id, emp_name, emp_type, spell, $workdate,
				 (select route_name From basic_route t3 where t1.route_id = t3.route_id and t3.is_deleted = 0 LIMIT 1) AS route_name
	FROM basic_employee t1
	WHERE (t1.company_id = $companyid OR IFNULL($companyId,'') = '')
		AND t1.is_deleted = 0
		AND NOT EXISTS(SELECT 1 FROM schedule_attendance t2
	                 WHERE t2.company_id = t1.company_id
	                   AND t2.work_date = $workdate
										 AND t1.emp_id = t2.emp_id
										 AND t2.is_deleted = 0);
		
	#机动车资源
	INSERT INTO schedule_resource(company_id, route_id, route_name, run_route_id, run_route_name, imei, car_id, car_name, work_date)
	SELECT company_id, route_id, route_name, route_id, route_name, imei, car_id, car_name, $workdate
	FROM view_car_route t1
	WHERE (t1.company_id = $companyId OR IFNULL($companyId,'') = '')
	  AND NOT EXISTS (SELECT 1 FROM schedule_resource r
										WHERE r.company_id = t1.company_id
										AND car_id = t1.car_id
										AND work_date = $workdate
										AND is_deleted = 0);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_ledger_daily_car
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_ledger_daily_car`;
delimiter ;;
CREATE PROCEDURE `procedure_ledger_daily_car`(IN `$companyId` VARCHAR(16),IN `$workDate` VARCHAR(10),  IN `$routeId` VARCHAR(16))
BEGIN
	#删除和新增记录=基础数据		
	UPDATE ledger_daily_car
	SET is_deleted = id
	WHERE work_date = $workDate
	  AND company_id = $companyId
		AND (route_id = $routeId OR IFNULL($routeId, '') = '')
		AND is_deleted = 0;
	
	# 删除30天前的无效数据
	DELETE FROM ledger_daily_car
	WHERE  company_id = $companyId
		AND work_date > DATE_SUB(CURDATE(), INTERVAL 40 DAY)
		AND work_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY)
		AND (route_id = $routeId OR IFNULL($routeId, '') = '')
		AND IFNULL(is_deleted, 0) <> 0;
		
	#更新计划=计划趟次,计划里程、实际趟次,里程、（运营、休息、工作）时长
		INSERT INTO ledger_daily_car
		(
			work_date,
			company_id,
			route_id,
			route_name,
			car_id,
			car_name,
			lpn,
			emp_use_count,
			plan_count,
			real_count,
			abnormal_count,
			trip_ratio,
			operating_mileage,
			contract_mileage,
			idle_mileage,
			gps_mileage,
			work_time,
			run_time,
			rest_time,
			over_speed_count,
			first_last_count,
			first_last_on_time,
			first_last_ratio,
			depart_count,
			depart_on_time,
			depart_ratio,
			big_station_count,
			big_station_on_time,
			big_station_ratio,
			full_time_count,
			full_time_on_time,
			full_time_ratio,
			sort_id
		)
		SELECT 
			$workDate AS work_date,
			$companyId AS company_id,
			route_id,
			route_name,
			car_id,
			car_name,
			lpn,
			COUNT(emp_id) AS emp_use_count,
			SUM(plan_count) AS plan_count,
			SUM(real_count) AS real_count,
			SUM(except_count) AS abnormal_count,
			IF(SUM(real_count) <> 0 && SUM(plan_count) <> 0, ROUND(SUM(real_count) / SUM(plan_count) * 100, 2), 0),
			SUM(real_mileage) AS real_mileage,
			SUM(contract_mileage) AS contract_mileage,
			SUM(idle_mileage) AS idle_mileage,
			SUM(gps_mileage) AS gps_mileage,
			SUM(work_time) AS work_time,
			SUM(trave_time) AS trave_time,
			IF(SUM(work_time - trave_time) > 0, SUM(work_time - trave_time), 0) AS rest_time,
			SUM(over_speed_count) AS over_speed_count,
			SUM(first_last_count) AS first_last_count,
			SUM(first_last_on_time) AS first_last_on_time, 
			IF(SUM(first_last_on_time) <> 0 && SUM(first_last_count) <> 0, ROUND(SUM(first_last_on_time) / SUM(first_last_count) * 100, 2), 0),
			SUM(depart_count) AS depart_count,
			SUM(depart_on_time) AS depart_on_time, 
			IF(SUM(depart_on_time) <> 0 && SUM(depart_count) <> 0, ROUND(SUM(depart_on_time) / SUM(depart_count) * 100, 2), 0),
			SUM(big_station_count) AS big_station_count,
			SUM(big_station_on_time) AS big_station_on_time, 
			IF(SUM(big_station_count) <> 0 && SUM(big_station_on_time) <> 0, ROUND(SUM(big_station_on_time) / SUM(big_station_count) * 100, 2), 0),
			SUM(full_time_count) AS full_time_count,
			SUM(full_time_on_time) AS full_time_on_time,
			IF(SUM(full_time_count) <> 0 && SUM(full_time_on_time) <> 0, ROUND(SUM(full_time_on_time) / SUM(full_time_count) * 100, 2), 0),
			sort_id
		FROM ledger_daily_detail
		WHERE work_date = $workDate
			AND company_id = $companyId
			AND (route_id = $routeId OR IFNULL($routeId, '') = '')
			AND is_deleted = 0
		GROUP BY car_id;
	
	# 关联单车日里程
	UPDATE ledger_daily_car t1, ledger_daily_mileage t2
	SET t1.device_mileage = t2.mileage, 
			t1.total_mileage = t1.operating_mileage + t1.contract_mileage + t1.idle_mileage
	WHERE t1.company_id = t2.company_id
		AND t1.car_id = t2.car_id
		AND t1.is_deleted = 0
	  AND t2.is_deleted = 0
		AND t1.company_id = $companyId
		AND t2.company_id = $companyId
		AND t1.work_date = $workDate
		AND t2.work_date = $workDate;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_ledger_daily_company
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_ledger_daily_company`;
delimiter ;;
CREATE PROCEDURE `procedure_ledger_daily_company`(IN `$companyId` VARCHAR(10), IN `$workDate` VARCHAR(10))
BEGIN
	#Routine body goes here...
	/* 企业单日台账
	 * Author: XTITXSS
	 * Date：2020-05-11
	 */
	 
	DECLARE $startTime DATETIME;
	DECLARE $endTime DATETIME;
	
	SELECT time_zone
	INTO @timeZone
	FROM system_company WHERE company_id = $companyId;
	
	SET $startTime = CONVERT_TZ($workDate, @timeZone, '+00:00');
	SET $endTime = DATE_ADD(DATE_ADD($startTime,INTERVAL 1 DAY),INTERVAL -1 SECOND);
	 
	UPDATE ledger_daily_company
	SET is_deleted = id
	WHERE work_date = $workDate
	  AND company_id = $companyId
		AND is_deleted = 0;
		
	# 删除30天前的无效数据
	DELETE FROM ledger_daily_company
	WHERE company_id = $companyId
		AND work_date > DATE_SUB(CURDATE(), INTERVAL 40 DAY)
		AND work_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY)
		AND IFNULL(is_deleted, 0) <> 0;
	 
	 # 企业车辆总数、0正常 10维修  20扣车 100报废
	 SELECT COUNT(1),
					SUM(IF(car_state = 0, 1, 0)),
					SUM(IF(car_state = 10, 1, 0)),
					SUM(IF(car_state = 20, 1, 0)),
					SUM(IF(car_state = 100, 1, 0))
	 INTO @vehicle_count, @vehicle_0, @vehicle_10, @vehicle_20, @vehicle_100
	 FROM basic_car
	 WHERE company_id = $companyId;
	 
	 # 企业人员总数
	 SELECT COUNT(1),
					SUM(IF(emp_type = 1 && emp_state < 100, 1, 0)),
					SUM(IF(emp_type = 2 && emp_state < 100, 1, 0)),
					SUM(IF(emp_state = 0, 1, 0)),
					SUM(IF(emp_state = 10, 1, 0)),
					SUM(IF(emp_state = 100, 1, 0))
	 INTO @employee_count, @driver_count, @conductor_count, @employee_0, @employee_10, @employee_100
	 FROM basic_employee
	 WHERE company_id = $companyId AND is_deleted = 0;
	 	 
	 # 企业已开通站台总数
	 SELECT COUNT(1)
	 INTO @stop_count
	 FROM basic_busstop
	 WHERE state = 10
	   AND company_id = $companyId;
	 
	 # 企业已开通线路总数
	 SELECT COUNT(1)
	 INTO @route_count
	 FROM basic_route
	 WHERE company_id = $companyId;
	 
	 DROP TEMPORARY TABLE IF EXISTS tmp_distance;
	 CREATE TEMPORARY TABLE tmp_distance(
		 SELECT route_id, MAX(distance) AS distance
		 FROM
			 basic_route_direction
		 WHERE
			 way_id IN ( SELECT way_id FROM basic_route WHERE company_id = $companyId GROUP BY way_id )
		 GROUP BY route_id
	 );
	 
	 SELECT SUM(IF(distance <= 10, 1, 0)),
					SUM(IF(distance > 10 && distance <= 20, 1, 0)),
					SUM(IF(distance > 20 && distance <= 30, 1, 0)),
					SUM(IF(distance > 30, 1, 0))
	 INTO @distance_10, @distance_20, @distance_30, @distance_other
	 FROM tmp_distance;
	 
	 # 企业调度线路汇总
	 SELECT SUM(is_dispatch), SUM(except_count)
	 INTO @dispatch_count, @except_count
	 FROM ledger_daily_route
	 WHERE company_id = $companyId
	   AND work_date = $workDate
		 AND is_deleted = 0;
	 
	 # 企业出勤司机
	 SELECT COUNT(DISTINCT(emp_id))
	 INTO @emp_use_count
	 FROM ledger_daily_detail
	 WHERE company_id = $companyId
	   AND work_date = $workDate
		 AND is_deleted = 0;
	 
	 # 企业出车数量
	 SELECT COUNT(DISTINCT(car_id))
	 INTO @car_use_count
	 FROM ledger_daily_detail
	 WHERE company_id = $companyId
	   AND work_date = $workDate
		 AND is_deleted = 0;
		 
	 # 企业配车数量
	 SELECT COUNT(1)
	 INTO @car_own_count
	 FROM basic_car
	 WHERE company_id = $companyId
	   AND car_state < 100;
		 
	 # 企业单日上客数
	 IF EXISTS(SELECT * FROM information_schema.TABLES WHERE table_schema = 'gps' AND table_name = 'device_passenger') THEN
			SELECT COUNT(up_number)
			INTO @passenger_count
			FROM gps.device_passenger
			WHERE upload_time between $startTime AND $endTime
				AND company_id = $companyId;
	 ELSE
			SELECT COUNT(up_number)
			INTO @passenger_count
			FROM device_passenger
			WHERE upload_time between $startTime AND $endTime
				AND company_id = $companyId;
	 END IF;
	 
	 # 企业单日运营数据
	 SELECT SUM(plan_count),
					SUM(real_count),
					SUM(plan_mileage),
					SUM(real_mileage),
					SUM(contract_mileage),
					SUM(idle_mileage),
					SUM(over_speed_count),
					SUM(first_last_count),
					SUM(first_last_on_time), 
					SUM(depart_count),
					SUM(depart_on_time), 
					SUM(big_station_count),
					SUM(big_station_on_time), 
					SUM(full_time_count),
					SUM(full_time_on_time)
	 INTO @plan_count, @real_count, @plan_mileage, @real_mileage, @contract_mileage, @idle_mileage, @overspeed_count,
				@first_last_count, @first_last_on_time, @depart_count, @depart_on_time, @big_station_count,  @big_station_on_time, @full_time_count, @full_time_on_time
	 FROM ledger_daily_detail
	 WHERE company_id = $companyId
	   AND work_date = $workDate
		 AND is_deleted = 0;

	 INSERT INTO ledger_daily_company(
			company_id,
			work_date, 
			vehicle_count, 
			vehicle_0, 
			vehicle_10, 
			vehicle_20, 
			vehicle_100,
			employee_count, 
			driver_count, 
			conductor_count, 
			employee_0, 
			employee_10, 
			employee_100,
			stop_count, 
			route_count, 
			dispatch_count,
			except_count,
			distance_10, 
			distance_20, 
			distance_30, 
			distance_other, 
			passenger_count, 
			car_own_count,
			car_use_count,
			car_ratio,
			emp_own_count,
			emp_use_count,
			emp_ratio,
			plan_count,
			real_count,
			trip_ratio,
			total_mileage,
			plan_mileage,
			real_mileage,
			contract_mileage,
			idle_mileage,
			first_last_count,
			first_last_on_time,
			first_last_ratio,
			depart_count,
			depart_on_time,
			depart_ratio,
			big_station_count,
			big_station_on_time,
			big_station_ratio,
			full_time_count,
			full_time_on_time,
			full_time_ratio,
			over_speed_count)
	 SELECT
			$companyId, $workDate,
			IFNULL(@vehicle_count, 0), 
			IFNULL(@vehicle_0, 0), 
			IFNULL(@vehicle_10, 0), 
			IFNULL(@vehicle_20, 0), 
			IFNULL(@vehicle_100, 0),
			IFNULL(@employee_count, 0), 
			IFNULL(@driver_count, 0), 
			IFNULL(@conductor_count, 0), 
			IFNULL(@employee_0, 0), 
			IFNULL(@employee_10, 0), 
			IFNULL(@employee_100, 0),
			IFNULL(@stop_count, 0), 
			IFNULL(@route_count, 0), 
			IFNULL(@dispatch_count, 0),
			IFNULL(@except_count, 0),
			IFNULL(@distance_10, 0), 
			IFNULL(@distance_20, 0), 
			IFNULL(@distance_30, 0), 
			IFNULL(@distance_other, 0),
			IFNULL(@passenger_count, 0), 
			IFNULL(@car_own_count, 0),
			IFNULL(@car_use_count, 0),
			IF(@car_use_count <> 0 && @car_own_count <> 0, ROUND(@car_use_count / @car_own_count * 100, 2), 0),
			IFNULL(@driver_count, 0),
			IFNULL(@emp_use_count, 0),
			IF(@emp_use_count <> 0 && @employee_count <> 0, ROUND(@emp_use_count / @employee_count * 100, 2), 0),
			IFNULL(@plan_count, 0),
			IFNULL(@real_count, 0),
			IF(@real_count <> 0 && @plan_count <> 0, ROUND(@real_count / @plan_count * 100, 2), 0),
			IFNULL(@real_mileage, 0) + IFNULL(@contract_mileage, 0) + IFNULL(@idle_mileage, 0),
			IFNULL(@plan_mileage, 0),
			IFNULL(@real_mileage, 0),
			IFNULL(@contract_mileage, 0),
			IFNULL(@idle_mileage, 0),
			IFNULL(@first_last_count, 0),
			IFNULL(@first_last_on_time, 0),
			IF(@first_last_on_time <> 0 && @first_last_count <> 0, ROUND(@first_last_on_time / @first_last_count * 100, 2), 0),
			IFNULL(@depart_count, 0),
			IFNULL(@depart_on_time, 0),
			IF(@depart_on_time <> 0 && @depart_count <> 0, ROUND(@depart_on_time / @depart_count * 100, 2), 0),
			IFNULL(@big_station_count, 0),
			IFNULL(@big_station_on_time, 0),
			IF(@big_station_on_time <> 0 && @big_station_count <> 0, ROUND(@big_station_on_time / @big_station_count * 100, 2), 0),
			IFNULL(@full_time_count, 0),
			IFNULL(@full_time_on_time, 0),
			IF(@full_time_on_time <> 0 && @full_time_count <> 0, ROUND(@full_time_on_time / @full_time_count * 100, 2), 0),
			IFNULL(@overspeed_count, 0);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_ledger_daily_detail
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_ledger_daily_detail`;
delimiter ;;
CREATE PROCEDURE `procedure_ledger_daily_detail`(IN `$companyId` VARCHAR(16), IN `$workDate` varchar(10),IN `$routeId` varchar(16))
BEGIN
	# 明细
	DROP TEMPORARY TABLE IF EXISTS tmp_daily_detail;
	CREATE TEMPORARY TABLE tmp_daily_detail (
		car_id VARCHAR (16) NOT NULL, # '车辆ID',
		emp_id VARCHAR (16) NULL, # '员工ID',
		plan_count DECIMAL (11, 3) NOT NULL DEFAULT '0.000' , # '计划趟次',
		real_count DECIMAL (11, 3) NOT NULL DEFAULT '0.000' , # '实际趟次',
		plan_mileage DECIMAL (11, 3) NOT NULL DEFAULT '0.000' , # '计划里程',
		real_mileage DECIMAL (11, 3) NOT NULL DEFAULT '0.000' , # '实际里程',
		gps_mileage DECIMAL (11, 3) NULL DEFAULT '0.000' , # 'GPS里程',
		contract_mileage DECIMAL (11, 3) NULL DEFAULT '0.000' , # '包车里程',
		idle_mileage DECIMAL (11, 3) NULL DEFAULT '0.000', # '非运营里程',
		work_time INT NOT NULL DEFAULT '0', # '工作时长(秒)',
		trave_time INT NOT NULL DEFAULT '0', # '行驶时长(秒)',
		record_count INT NOT NULL DEFAULT '0', # '记录数',
		except_count INT NOT NULL DEFAULT '0', # '行车异常记录数',
		over_speed_count INT NOT NULL DEFAULT '0', # '超速次数',
		first_last_count	INT, #首末班考核次数,
		first_last_on_time INT, #首末班正点次数,
		depart_count INT, #发车考核次数,
		depart_on_time INT, #发车正点次数,
		big_station_count	INT, #大站考核次数,
		big_station_on_time INT, #大站正点次数,
		full_time_count INT, #全程考核次数,
		full_time_on_time INT #全程正点次数,
	) DEFAULT CHARSET = utf8;

	# 分组
	DROP TEMPORARY TABLE IF EXISTS tmp_daily_group;
	CREATE TEMPORARY TABLE tmp_daily_group (
		work_date varchar(10), # '日期',
		company_id varchar(16), # '企业ID',
		company_name varchar(64), # '企业名称',
		route_id varchar(16), # '线路ID',
		route_name varchar(128), # '线路名称',
		car_id VARCHAR (16) NOT NULL, # '车辆ID',
		car_name varchar(64), # '车辆名称
		lpn varchar(64), # '车牌
		emp_id VARCHAR (16) NULL, # '员工ID',
		emp_name varchar(64), # '员工名称',
		plan_count DECIMAL (11, 3) NOT NULL DEFAULT '0.000' , # '计划趟次',
		real_count DECIMAL (11, 3) NOT NULL DEFAULT '0.000' , # '实际趟次',
		plan_mileage DECIMAL (11, 3) NOT NULL DEFAULT '0.000' , # '计划里程',
		real_mileage DECIMAL (11, 3) NOT NULL DEFAULT '0.000' , # '实际里程',
		gps_mileage DECIMAL (11, 3) NULL DEFAULT '0.000' , # 'GPS里程',
		contract_mileage DECIMAL (11, 3) NULL DEFAULT '0.000' , # '包车里程',
		idle_mileage DECIMAL (11, 3) NULL DEFAULT '0.000', # '非运营里程',
		work_time INT NOT NULL DEFAULT '0', # '工作时长(秒)',
		trave_time INT NOT NULL DEFAULT '0', # '行驶时长(秒)',
		record_count INT NOT NULL DEFAULT '0', # '记录数',
		except_count INT NOT NULL DEFAULT '0', # '行车异常记录数',
		over_speed_count INT NOT NULL DEFAULT '0', # '超速次数',
		first_last_count	INT, #首末班考核次数,
		first_last_on_time INT, #首末班正点次数,
		depart_count INT, #发车考核次数,
		depart_on_time INT, #发车正点次数,
		big_station_count	INT, #大站考核次数,
		big_station_on_time INT, #大站正点次数,
		full_time_count INT, #全程考核次数,
		full_time_on_time INT #全程正点次数,
	) DEFAULT CHARSET = utf8;
	
	-- 运营记录
	DROP TEMPORARY TABLE IF EXISTS tmp_schedule_plan;
	CREATE TEMPORARY TABLE tmp_schedule_plan (
		SELECT *
		FROM schedule_plan
		WHERE company_id = $companyId
			AND	work_date = $workDate
			AND route_id = $routeId
			-- AND state = 2
			AND is_deleted = 0
	);

	# 非运营记录
	DROP TEMPORARY TABLE IF EXISTS tmp_schedule_idle;
	CREATE TEMPORARY TABLE tmp_schedule_idle (
		SELECT *
		FROM schedule_idle
		WHERE company_id = $companyId
			AND work_date = $workDate
			AND route_id = $routeId
			AND state = 2
			AND is_deleted = 0
	);
	
  # 工作时长、运营时长统计
	DROP TEMPORARY TABLE IF EXISTS tmp_workandruntime;
	CREATE TEMPORARY TABLE tmp_workandruntime (
		SELECT *
		FROM tmp_schedule_plan
		WHERE work_date = $workDate
			AND route_id = $routeId
			AND is_deleted = 0
	);
		
	# 运营里程趟次
	INSERT INTO tmp_daily_detail(car_id, emp_id, plan_count, real_count, plan_mileage, real_mileage, gps_mileage)
	SELECT car_id, emp_id,
		SUM(trips) plan_count,
		SUM(IF(state = 2, trips, 0)) real_count,
		SUM(plan_mileage) plan_mileage,
		SUM(IF(state = 2, real_mileage, 0)) real_mileage,
		SUM(IF(state = 2, gps_mileage, 0)) gps_mileage
	FROM tmp_schedule_plan
	WHERE plan_type <> 10
	GROUP BY car_id, emp_id;
	
	# 包车里程
	INSERT INTO tmp_daily_detail(car_id, emp_id, contract_mileage)
	SELECT car_id, emp_id,
		SUM(real_mileage) real_mileage
	FROM tmp_schedule_plan
	WHERE plan_type = 10 AND state = 2
	GROUP BY car_id, emp_id;

	# 非运营里程
	INSERT INTO tmp_daily_detail(car_id, emp_id, idle_mileage, contract_mileage)
	SELECT car_id, emp_id,
		SUM(IF(idle_type <> 10, real_mileage, 0)) idle_mileage,
		SUM(IF(idle_type = 10, real_mileage, 0)) contract_mileage
	FROM tmp_schedule_idle
	GROUP BY car_id, emp_id;
	
	# 运营时长
  INSERT INTO tmp_daily_detail(car_id, emp_id, trave_time)
	SELECT car_id, emp_id,
				 SUM(TIMESTAMPDIFF(SECOND, plan_depart, plan_arrive))
	FROM tmp_workandruntime
	GROUP BY car_id, emp_id;
		
	# 工作时长
  INSERT INTO tmp_daily_detail(car_id, emp_id, work_time)
	SELECT car_id, emp_id,
				 TIMESTAMPDIFF(SECOND, MIN(plan_depart), MAX(plan_arrive))
	FROM tmp_workandruntime
	GROUP BY car_id, emp_id;
		
	# 异常次数
  INSERT INTO tmp_daily_detail(car_id, emp_id, record_count, except_count)
	SELECT car_id, emp_id,
				 COUNT(1), SUM(IF(abnormal_id = 0, 1, 0))
	FROM tmp_workandruntime
	GROUP BY car_id, emp_id;
			
	# 超速
	INSERT INTO tmp_daily_detail(car_id, emp_id, over_speed_count)
	SELECT t1.car_id, IFNULL(t1.emp_id, ''), COUNT(1)
	FROM service_over_speed t1, basic_car t2
	WHERE  t1.company_id = $companyId 
		AND t1.work_date = $workDate
	  AND t1.route_id = $routeId
		AND t1.car_id = t2.car_id
		AND t1.company_id = t2.company_id
	GROUP BY t1.company_id, t1.car_id, t1.emp_id;
	
	# 汇总考核
	INSERT INTO tmp_daily_detail(car_id, emp_id,
		first_last_count, first_last_on_time, 
		depart_count, depart_on_time, 
		big_station_count, big_station_on_time, 
		full_time_count, full_time_on_time)
	SELECT car_id, emp_id,
		SUM(IF(check_type = 1, 1, 0)) AS first_last_count, -- 首末班
		SUM(IF(check_type = 1 AND check_value = 1, 1, 0)) AS first_last_on_time, -- 首末班正点
		SUM(IF(check_type = 2, 1, 0)) AS depart_count, -- 发车
		SUM(IF(check_type = 2 AND check_value = 1, 1, 0)) AS depart_on_time, -- 发车正点
		SUM(IF(check_type = 3, 1, 0)) AS big_station_count, -- 大站
		SUM(IF(check_type = 3 AND check_value = 1, 1, 0)) AS big_station_on_time, -- 大站正点
		SUM(IF(check_type = 4, 1, 0)) AS full_time_count, -- 全程
		SUM(IF(check_type = 4 AND check_value = 1, 1, 0)) AS full_time_on_time -- 全程正点
	FROM service_on_time
	WHERE company_id = $companyId 
		AND work_date = $workDate
		AND route_id = $routeId
	GROUP BY company_id, car_id, emp_id;
	
	# 汇总里程, 趟次
	INSERT INTO tmp_daily_group
	(
		car_id, emp_id, plan_count, real_count,
		plan_mileage, real_mileage, gps_mileage, contract_mileage, idle_mileage,
		work_time, trave_time, record_count, except_count, over_speed_count,
		first_last_count, first_last_on_time, depart_count, depart_on_time, 
		big_station_count, big_station_on_time, full_time_count, full_time_on_time
	)
	SELECT 
		car_id, emp_id,
		SUM(plan_count),
		SUM(real_count),
		SUM(plan_mileage),
		SUM(real_mileage),
		SUM(IFNULL(gps_mileage, 0)),
		SUM(IFNULL(contract_mileage, 0)),
		SUM(IFNULL(idle_mileage, 0)),
		SUM(work_time),
		SUM(trave_time),
		SUM(record_count),
		SUM(except_count),
		SUM(over_speed_count),
		SUM(first_last_count),
		SUM(first_last_on_time), 
		SUM(depart_count),
		SUM(depart_on_time), 
		SUM(big_station_count),
		SUM(big_station_on_time), 
		SUM(full_time_count),
		SUM(full_time_on_time)
	FROM tmp_daily_detail 
	GROUP BY car_id, emp_id;
 
	#数据修复
	SELECT route_name, sort_id, company_id 
	INTO @routeName, @sortId, @companyId 
	FROM basic_route 
	where company_id = $companyId AND route_id = $routeId AND is_deleted = 0;
	
	SELECT company_name 
	INTO @companyName
	FROM system_company 
	WHERE company_id = @companyId;
	
	#修复企业和线路
	UPDATE tmp_daily_group SET work_date = $workDate, company_id = @companyId, company_name = @companyName, route_id = $routeId, route_name = @routeName;
	
	#修复车辆名称	
	UPDATE tmp_daily_group detail, basic_car car 
	SET detail.car_name = car.car_name,detail.lpn = car.lpn 
	WHERE detail.car_id = car.car_id
	  AND car.company_id = @companyId;
	
	#修复员工信息
	UPDATE tmp_daily_group detail, basic_employee employee
	SET detail.emp_name = employee.emp_name 
	WHERE detail.emp_id = employee.emp_id
	  AND employee.company_id = @companyId
		AND employee.is_deleted = 0;

	# 删除与新增
	DELETE FROM ledger_daily_detail WHERE company_id = $companyId AND work_date = $workDate AND route_id = $routeId; 
	
	# 删除30天前的无效数据
	DELETE FROM ledger_daily_detail
	WHERE company_id = $companyId 
		AND work_date > DATE_SUB(CURDATE(), INTERVAL 60 DAY)
		AND work_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY)
	  AND company_id = @companyId
		AND (route_id = $routeId OR IFNULL($routeId, '') = '')
		AND IFNULL(is_deleted, 0) <> 0;
	
	INSERT INTO ledger_daily_detail 
	(
		work_date, company_id, company_name, route_id, route_name, sort_id, car_id, car_name, emp_id, emp_name, 
		plan_count, real_count, plan_mileage, real_mileage, gps_mileage, contract_mileage, idle_mileage, 
		work_time,trave_time,record_count,except_count,over_speed_count, lpn,
		first_last_count, first_last_on_time, depart_count, depart_on_time, 
		big_station_count, big_station_on_time, full_time_count, full_time_on_time
	)
	SELECT 
		work_date, company_id, company_name, IFNULL(route_id, ''), IFNULL(route_name, ''), @sortId, IFNULL(car_id, ''), IFNULL(car_name, ''), IFNULL(emp_id, ''), IFNULL(emp_name, ''),
		plan_count, real_count, plan_mileage, real_mileage, IFNULL(gps_mileage, 0), IFNULL(contract_mileage, 0), IFNULL(idle_mileage, 0),
		work_time,trave_time, record_count, except_count, over_speed_count, lpn,
		first_last_count, first_last_on_time, depart_count, depart_on_time, 
		big_station_count, big_station_on_time, full_time_count, full_time_on_time
	FROM tmp_daily_group;

	# 售票员
	DROP TEMPORARY TABLE IF EXISTS tmp_conductor;
  CREATE TEMPORARY TABLE tmp_conductor(
		SELECT work_date, company_id, route_id, route_name, car_id, car_name, conductor_id, conductor_name, 2 AS emp_type,
				MIN(case when IFNULL(real_depart, '') = '' then plan_depart else real_depart end) AS start_time,
				MAX(case when IFNULL(real_arrive, '') = '' then plan_arrive else real_arrive end) AS end_time,
				TIMESTAMPDIFF(SECOND, MIN(plan_depart), MAX(plan_arrive)) AS work_time, SUM(TIMESTAMPDIFF(SECOND, plan_depart, plan_arrive)) AS trave_time
		FROM schedule_plan
		WHERE company_id = $companyId
			AND work_date = $workDate
			AND route_id = $routeId
			AND company_id = @companyId
-- 			AND state = 2
			AND is_deleted = 0
		GROUP BY route_id, route_name, car_id, car_name, conductor_id, conductor_name
	);
	
	INSERT INTO ledger_daily_detail 
	(
		work_date, company_id, company_name, route_id, route_name, sort_id, car_id, car_name, emp_id, emp_name,
		work_time,trave_time, start_time, end_time, check_time, plan_count, real_count, plan_mileage, real_mileage,
		gps_mileage, contract_mileage, idle_mileage, record_count, except_count,over_speed_count, lpn,
		first_last_count, first_last_on_time, depart_count, depart_on_time, big_station_count,
		big_station_on_time, full_time_count, full_time_on_time
	)
	SELECT 
		work_date, @companyId, @companyName, IFNULL(route_id, ''), IFNULL(route_name, ''), @sortId,
		IFNULL(car_id, ''), IFNULL(car_name, ''),IFNULL(conductor_id, ''), IFNULL(conductor_name, ''),
		work_time, trave_time, start_time, end_time, start_time,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	FROM tmp_conductor
	WHERE IFNULL(conductor_id, '') <> '';
		
	# 最早上班时间、最晚下班时间
	DROP TEMPORARY TABLE IF EXISTS tmp_start_end_time;
  CREATE TEMPORARY TABLE tmp_start_end_time(
		SELECT work_date, car_id, emp_id,
		       MIN(plan_depart) AS start_time,
					 MAX(plan_arrive) AS end_time
		FROM tmp_workandruntime
		GROUP BY car_id, emp_id
	);
	
	UPDATE ledger_daily_detail t1, tmp_start_end_time t2
	SET t1.start_time = t2.start_time,
	    t1.end_time = t2.end_time,
			t1.check_time = t2.start_time
	WHERE t1.work_date = t2.work_date
	  AND t1.car_id = t2.car_id
		AND t1.emp_id = t2.emp_id
		AND t1.company_id = @companyId
		AND t1.work_date = $workDate
	  AND t1.route_id = $routeId
		AND t1.is_deleted = 0;
	
	# 取考勤数据纠正计划上班时间
	DROP TEMPORARY TABLE IF EXISTS tmp_attendance;
	CREATE TEMPORARY TABLE tmp_attendance(
		SELECT company_id, work_date, check_car_id AS car_id, emp_id, MIN(plan_work_time) AS on_work_time
		FROM schedule_attendance
		WHERE company_id = @companyId
			AND work_date = $workDate
			AND is_deleted = 0
		GROUP BY company_id, work_date, check_car_id, emp_id
	);
	
	UPDATE ledger_daily_detail t1, tmp_attendance t2
	SET t1.start_time = t2.on_work_time
	WHERE t1.company_id = t2.company_id
		AND t1.work_date = t2.work_date
		AND t1.car_id = t2.car_id
		AND t1.emp_id = t2.emp_id
		AND t1.company_id = @companyId
		AND t1.work_date = $workDate
	  AND t1.route_id = $routeId
		AND t1.is_deleted = 0;

	# 纠正最早、最晚刷卡时间
	SELECT DATE_ADD(DATE_ADD(str_to_date(DATE_FORMAT($workDate,'%Y-%m-%d'),'%Y-%m-%d %H:%i:%s'),INTERVAL -1 DAY), INTERVAL 57600 SECOND),
				 DATE_ADD(DATE_ADD(str_to_date(DATE_FORMAT($workDate,'%Y-%m-%d'),'%Y-%m-%d %H:%i:%s'),INTERVAL 1 DAY), INTERVAL -28800 SECOND)
	INTO @start_time, @end_time;

  IF EXISTS(SELECT * FROM information_schema.TABLES WHERE table_schema = 'gps' AND table_name = 'device_card') THEN
		DROP TEMPORARY TABLE IF EXISTS tmp_device_card;
		CREATE TEMPORARY TABLE tmp_device_card(
			SELECT t1.company_id, $workDate As work_date, t1.route_id, t1.car_id, t2.emp_id,
					 MIN(t1.event_time) AS check_in, MAX(t1.event_time) AS check_out
			FROM gps.device_card t1, basic_employee_card t2, basic_employee t3
			WHERE t1.event_time BETWEEN @start_time AND @end_time
				AND t1.company_id = t2.company_id
				AND t1.card_id = t2.physical_number
				AND t1.company_id = t3.company_id
				AND t2.emp_id = t3.emp_id
				AND t1.company_id = @companyId
				AND t1.route_id = $routeId
				AND t1.card_id is not null
				AND t3.is_deleted = 0
			GROUP BY t1.route_id, t1.car_id
			ORDER BY t1.route_id, t1.car_id, t1.event_time);
	ELSE
	  DROP TEMPORARY TABLE IF EXISTS tmp_device_card;
		CREATE TEMPORARY TABLE tmp_device_card(
			SELECT t1.company_id, $workDate As work_date, t1.route_id, t1.car_id, t2.emp_id,
					 MIN(t1.event_time) AS check_in, MAX(t1.event_time) AS check_out
			FROM device_card t1, basic_employee_card t2, basic_employee t3
			WHERE t1.event_time BETWEEN @start_time AND @end_time
				AND t1.company_id = t2.company_id
				AND t1.card_id = t2.physical_number
				AND t1.company_id = t3.company_id
				AND t2.emp_id = t3.emp_id
				AND t1.company_id = @companyId
				AND t1.route_id = $routeId
				AND t1.card_id is not null
				AND t3.is_deleted = 0
			GROUP BY t1.route_id, t1.car_id
			ORDER BY t1.route_id, t1.car_id, t1.event_time);
	END IF;
	
	UPDATE ledger_daily_detail t1, tmp_device_card t2
	SET t1.check_time = t2.check_in
	WHERE t1.company_id = t2.company_id
		AND t1.work_date = t2.work_date
		AND t1.car_id = t2.car_id
		AND t1.emp_id = t2.emp_id
		AND t1.company_id = @companyId
		AND t1.work_date = $workDate
	  AND t1.route_id = $routeId
		AND t1.is_deleted = 0;
		
	# 车队
	UPDATE ledger_daily_detail t1, basic_car t2, basic_fleet t3
	SET t1.fleet_id = t2.fleet_id, t1.fleet_name = t3.fleet_name
	WHERE t1.company_id = t2.company_id
	  AND t1.company_id = t3.company_id
		AND t1.car_id = t2.car_id
		AND t2.fleet_id = t3.fleet_id
		AND t1.is_deleted = t2.is_deleted
		AND t1.company_id = @companyId
		AND t1.work_date = $workDate
	  AND t1.route_id = $routeId
		AND t1.is_deleted = 0;
		
  # 员工类型
	UPDATE ledger_daily_detail t1, basic_employee t2
	SET t1.emp_type = t2.emp_type
	WHERE t1.company_id = t2.company_id
    AND t1.emp_id = t2.emp_id
		AND t1.company_id = @companyId
		AND t1.work_date = $workDate
	  AND t1.route_id = $routeId
		AND IFNULL(t1.emp_id, '') <> ''
		AND t1.is_deleted = 0
		AND t2.is_deleted = 0;
		
	# 员工状态
	UPDATE ledger_daily_detail t1, schedule_attendance t2
	SET t1.emp_state = t2.emp_state
	WHERE t1.company_id = t2.company_id
	  AND t1.work_date = t2.work_date
    AND t1.emp_id = t2.emp_id
		AND t1.company_id = @companyId
		AND t1.work_date = $workDate
	  AND t1.route_id = $routeId
		AND IFNULL(t1.emp_id, '') <> ''
		AND t1.is_deleted = 0;
		
	#修复车辆名称	
	UPDATE ledger_daily_detail detail, basic_car car 
	SET detail.car_name = car.car_name,detail.lpn = car.lpn 
	WHERE detail.company_id = car.company_id
	  AND detail.car_id = car.car_id
	  AND detail.work_date = $workDate
	  AND detail.route_id = $routeId
	  AND car.company_id = @companyId;
	
	# 趟次兑现率  正点率
	UPDATE ledger_daily_detail
	SET trip_ratio = IF(plan_count <> 0 && real_count <> 0, ROUND(real_count / plan_count * 100, 2), 0),
	    first_last_ratio = IF(first_last_count <> 0 && first_last_on_time <> 0, ROUND(first_last_on_time / first_last_count * 100, 2), 0),
			depart_ratio = IF(depart_count <> 0 && depart_on_time <> 0, ROUND(depart_on_time / depart_count * 100, 2), 0),
			big_station_ratio = IF(big_station_count <> 0 && big_station_on_time <> 0, ROUND(big_station_on_time / big_station_count * 100, 2), 0),
			full_time_ratio = IF(full_time_count <> 0 && full_time_on_time <> 0, ROUND(full_time_on_time / full_time_count * 100, 2), 0)
	WHERE company_id = $companyId 
		AND work_date = $workDate
	  AND route_id = $routeId
		AND is_deleted = 0;

	DROP TEMPORARY TABLE IF EXISTS tmp_schedule_idle;
	DROP TEMPORARY TABLE IF EXISTS tmp_schedule_plan;
	DROP TEMPORARY TABLE IF EXISTS tmp_daily_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_daily_group;
	DROP TEMPORARY TABLE IF EXISTS tmp_workandruntime;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_ledger_daily_employee
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_ledger_daily_employee`;
delimiter ;;
CREATE PROCEDURE `procedure_ledger_daily_employee`(IN `$companyId` varchar(16), IN `$workDate` VARCHAR(10), IN `$routeId` VARCHAR(16))
BEGIN
  #删除和新增记录=基础数据
	UPDATE ledger_daily_employee
	SET is_deleted = id
	WHERE work_date = $workDate
	  AND company_id = $companyId
		AND (route_id = $routeId or IFNULL($routeId, '') = '')
		AND is_deleted = 0;
		
	# 删除30天前的无效数据
	DELETE FROM ledger_daily_employee
	WHERE  company_id = $companyId
		AND work_date > DATE_SUB(CURDATE(), INTERVAL 40 DAY)
		AND work_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY)
		AND (route_id = $routeId OR IFNULL($routeId, '') = '')
		AND IFNULL(is_deleted, 0) <> 0;
		
	#更新计划=计划趟次,计划里程、实际趟次,里程、（运营、休息、工作）时长
		INSERT INTO ledger_daily_employee
		(
			work_date,
			company_id,
			route_id,
			route_name,
			emp_id,
			emp_name,
			car_use_count,
			plan_count,
			real_count,
			trip_ratio,
			operating_mileage,
			contract_mileage,
			idle_mileage,
			gps_mileage,
			work_time,
			run_time,
			rest_time,
			start_time,
			end_time,
			over_speed_count,
			first_last_count,
			first_last_on_time,
			first_last_ratio,
			depart_count,
			depart_on_time,
			depart_ratio,
			big_station_count,
			big_station_on_time,
			big_station_ratio,
			full_time_count,
			full_time_on_time,
			full_time_ratio
		)
		SELECT
			$workDate AS work_date,
			$companyId AS company_id,
			route_id,
			route_name,
			emp_id,
			emp_name,
			COUNT(car_id) AS car_use_count,
			SUM(plan_count) AS plan_count,
			SUM(real_count) AS real_count,
			IF(real_count <> 0 && plan_count <> 0, ROUND(SUM(real_count) / SUM(plan_count) * 100, 2), 0) AS trip_ratio,
			SUM(real_mileage) AS real_mileage,
			SUM(contract_mileage) AS contract_mileage,
			SUM(idle_mileage) AS idle_mileage,
			SUM(gps_mileage) AS gps_mileage,
			SUM(work_time) AS work_time,
			SUM(trave_time) AS trave_time,
			IF(SUM(work_time - trave_time) > 0, SUM(work_time - trave_time), 0) AS rest_time,
			MIN(start_time) AS start_time,
			MAX(end_time) AS end_time,
			SUM(over_speed_count) AS over_speed_count,
			SUM(first_last_count) AS first_last_count,
			SUM(first_last_on_time) AS first_last_on_time, 
			IF(SUM(first_last_on_time) <> 0 && SUM(first_last_count) <> 0, ROUND(SUM(first_last_on_time) / SUM(first_last_count) * 100, 2), 0) AS first_last_ratio,
			SUM(depart_count) AS depart_count,
			SUM(depart_on_time) AS depart_on_time, 
			IF(SUM(depart_count) <> 0 && SUM(depart_on_time) <> 0, ROUND(SUM(depart_on_time) / SUM(depart_count) * 100, 2), 0) AS depart_ratio,
			SUM(big_station_count) AS big_station_count,
			SUM(big_station_on_time) AS big_station_on_time, 
			IF(SUM(big_station_on_time) <> 0 && SUM(big_station_count) <> 0, ROUND(SUM(big_station_on_time) / SUM(big_station_count) * 100, 2), 0) AS big_station_ratio,
			SUM(full_time_count) AS full_time_count,
			SUM(full_time_on_time) AS full_time_on_time,
			IF(SUM(full_time_on_time) <> 0 && SUM(full_time_count) <> 0, ROUND(SUM(full_time_on_time) / SUM(full_time_count) * 100, 2), 0) AS full_time_ratio
		FROM ledger_daily_detail
		WHERE work_date = $workDate
			AND company_id = $companyId
			AND (route_id = $routeId or IFNULL($routeId, '') = '')
			AND is_deleted = 0
		GROUP BY emp_id;
		
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_ledger_daily_route
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_ledger_daily_route`;
delimiter ;;
CREATE PROCEDURE `procedure_ledger_daily_route`(IN `$companyId` VARCHAR(16), IN `$work_date` varchar(10),IN `$route_id` varchar(16))
BEGIN
	#删除和新增记录=基础数据
	UPDATE ledger_daily_route
	SET is_deleted = id
	WHERE 
		company_id = $companyId
		AND work_date = $work_date
	  AND route_id = $route_id
		AND is_deleted = 0;
		
	# 删除30天前的无效数据
	DELETE FROM ledger_daily_route
	WHERE company_id = $companyId
		AND work_date > DATE_SUB(CURDATE(), INTERVAL 40 DAY)
		AND work_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY)
		AND route_id = $route_id
	  AND is_deleted <> 0;

	SELECT company_name 
	INTO @companyName
	FROM system_company 
	WHERE company_id = $companyId;

	INSERT INTO ledger_daily_route (
		work_date, company_id, company_name, route_id, route_name) 
	SELECT
		$work_date, company_id, @companyName, route_id, route_name
	FROM
		basic_route
	WHERE company_id = $companyId AND route_id = $route_id;
	
	# 修复线路名称
	UPDATE ledger_daily_route t1, basic_route t2
	SET t1.route_name = t2.route_name, t1.sort_id = t2.sort_id
	WHERE t1.company_id = t2.company_id
		AND	t1.route_id = t2.route_id
		AND t1.company_id = $companyId
	  AND t1.work_date = $work_date
		AND t1.route_id = $route_id
		AND t1.is_deleted = 0
	  AND t2.is_deleted = 0;
		
	#更新计划=配车,计划趟次,计划里程
	UPDATE ledger_daily_route ledger, scheme_date scheme 
	SET 
		ledger.car_own_count = scheme.own_car_count,
		ledger.emp_own_count = IFNULL(scheme.own_emp_count, 0),
		ledger.plan_count = scheme_plan_count,
		ledger.plan_mileage = scheme_plan_mileage,
		ledger.is_dispatch = 1
	WHERE ledger.company_id = scheme.company_id 
		AND ledger.work_date = scheme.work_date 
		AND ledger.route_id = scheme.route_id
		AND ledger.company_id = $companyId
		AND ledger.work_date = $work_date
		AND ledger.route_id = $route_id
		AND ledger.is_deleted = 0
		AND scheme.is_deleted = 0;

	#更新实际=出车,考勤,趟次,里程
	DROP TEMPORARY TABLE IF EXISTS tmp_daily_group;
	CREATE TEMPORARY TABLE tmp_daily_group(
		SELECT 
			COUNT(DISTINCT(detail.car_id)) car_use_count,
			COUNT(DISTINCT(detail.emp_id)) emp_use_count,
			SUM(detail.real_count) real_count,
			SUM(detail.real_mileage) real_mileage,
			SUM(detail.contract_mileage) contract_mileage,
			SUM(detail.idle_mileage) idle_mileage,
			SUM(detail.gps_mileage) gps_mileage,
			SUM(detail.real_mileage) + SUM(detail.contract_mileage) + SUM(detail.idle_mileage) AS total_mileage,
			SUM(record_count) AS record_count,
			SUM(except_count) AS except_count,
			SUM(work_time) AS work_time,
			SUM(trave_time) AS trave_time,
			SUM(first_last_count) AS first_last_count,
			SUM(first_last_on_time) AS first_last_on_time,
			IF(SUM(first_last_on_time) <> 0 && SUM(first_last_count) <> 0, ROUND(SUM(first_last_on_time) / SUM(first_last_count) * 100, 2), 0) AS first_last_ratio,
			SUM(depart_count) AS depart_count,
			SUM(depart_on_time) AS depart_on_time,
			IF(SUM(depart_on_time) <> 0 && SUM(depart_count) <> 0, ROUND(SUM(depart_on_time) / SUM(depart_count) * 100, 2), 0) AS depart_ratio,
			SUM(big_station_count) AS big_station_count,
			SUM(big_station_on_time) AS big_station_on_time,
			IF(SUM(big_station_on_time) <> 0 && SUM(big_station_count) <> 0, ROUND(SUM(big_station_on_time) / SUM(big_station_count) * 100, 2), 0) AS big_station_ratio,
			SUM(full_time_count) AS full_time_count,
			SUM(full_time_on_time) AS full_time_on_time,
			IF(SUM(full_time_on_time) <> 0 && SUM(full_time_count) <> 0, ROUND(SUM(full_time_on_time) / SUM(full_time_count) * 100, 2), 0) AS full_time_ratio,
			SUM(over_speed_count) over_speed_count
		FROM 
			ledger_daily_detail detail 
		WHERE detail.company_id = $companyId
			AND detail.work_date = $work_date
		  AND detail.route_id = $route_id
			AND detail.is_deleted = 0
	);
	

	#更新运营里程,趟次,时长
	UPDATE ledger_daily_route route, tmp_daily_group daily
	SET 
		route.car_use_count = IFNULL(daily.car_use_count, 0),
		route.car_ratio = IFNULL(IF(route.car_own_count <> 0 && daily.car_use_count <> 0, ROUND(daily.car_use_count / route.car_own_count * 100, 2), 0), 0),
		route.emp_use_count = IFNULL(daily.emp_use_count, 0),
		route.emp_ratio = IFNULL(IF(route.emp_own_count <> 0 && daily.emp_use_count <> 0, ROUND(daily.emp_use_count / route.emp_own_count * 100, 2), 0), 0),
		route.real_count = IFNULL(daily.real_count, 0),
		route.trip_ratio = IFNULL(IF(route.plan_count <> 0 && daily.real_count <> 0, ROUND(daily.real_count / route.plan_count * 100, 2), 0), 0),
		route.real_mileage = IFNULL(daily.real_mileage, 0),
		route.contract_mileage = IFNULL(daily.contract_mileage, 0),
		route.idle_mileage = IFNULL(daily.idle_mileage, 0),
		route.gps_mileage = IFNULL(daily.gps_mileage, 0),
		route.total_mileage = IFNULL(daily.total_mileage, 0),
		route.record_count = IFNULL(daily.record_count, 0),
		route.except_count = IFNULL(daily.except_count, 0),
		route.work_time = IFNULL(daily.work_time, 0),
		route.trave_time = IFNULL(daily.trave_time, 0),
		route.over_speed_count = IFNULL(daily.over_speed_count, 0),
		route.first_last_count = IFNULL(daily.first_last_count, 0),
		route.first_last_on_time = IFNULL(daily.first_last_on_time, 0),
		route.first_last_ratio = IFNULL(daily.first_last_ratio, 0),
		route.depart_count = IFNULL(daily.depart_count, 0),
		route.depart_on_time = IFNULL(daily.depart_on_time, 0), 
		route.depart_ratio = IFNULL(daily.depart_ratio, 0),
		route.big_station_count = IFNULL(daily.big_station_count,  0),
		route.big_station_on_time = IFNULL(daily.big_station_on_time,  0),
		route.big_station_ratio = IFNULL(daily.big_station_ratio, 0),
		route.full_time_count = IFNULL(daily.full_time_count,  0),
		route.full_time_on_time = IFNULL(daily.full_time_on_time, 0),
		route.full_time_ratio = IFNULL(daily.full_time_ratio, 0),
		route.over_speed_count = IFNULL(daily.over_speed_count, 0)
	WHERE route.company_id = $companyId
		AND route.work_date = $work_date
	  AND route.route_id = $route_id
		AND route.is_deleted = 0;

	DROP TEMPORARY TABLE IF EXISTS tmp_daily_group;
	END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_ledger_monthly_car
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_ledger_monthly_car`;
delimiter ;;
CREATE PROCEDURE `procedure_ledger_monthly_car`(IN `$companyId` VARCHAR(16), IN `$monthly` VARCHAR(10))
BEGIN
	#删除和新增记录=基础数据
	DECLARE $startDate VARCHAR(10);
	DECLARE $endDate VARCHAR(10);
	
	SET $startDate = CONCAT($monthly,'-01');
	SET $endDate = CONCAT($monthly, CONCAT('-', DAY(LAST_DAY($startDate))));
	SELECT DATEDIFF(CURDATE(), $startDate)
	INTO @check_days;
	
	UPDATE ledger_monthly_car
	SET is_deleted = id
	WHERE company_id = $companyId
	  AND `month` = $monthly
		AND is_deleted = 0;
	
	INSERT INTO ledger_monthly_car(
		company_id,
		month,
		start_date,
		end_date,
		route_id,
		route_name,
		car_id,
		car_name,
		lpn,
		check_days,
		use_days,
		days_ratio,
		work_time,
		trave_time,
		rest_time,
		plan_count,
		real_count,
		trip_ratio,
		device_mileage,
		gps_mileage,
		total_mileage,
		trave_mileage,
		contract_mileage,
		idle_mileage
	)
	SELECT company_id,
		$monthly AS `month`,
		$startDate AS start_date,
		$endDate AS end_date,
		route_id,
		route_name,
		car_id,
		car_name,
		lpn,
		@check_days AS check_days,
		COUNT(DISTINCT(work_date)) AS use_days,
		IF(COUNT(DISTINCT(work_date)) <> 0 && DAY(LAST_DAY($startDate)) <> 0, ROUND(COUNT(DISTINCT(work_date)) / DAY(LAST_DAY($startDate)) * 100, 2), 0) AS days_ratio,
		SUM(work_time) AS work_time,
		SUM(run_time) AS trave_time,
		SUM(work_time) - SUM(run_time) AS rest_time,
		SUM(plan_count) AS plan_count,
		SUM(real_count) AS real_count,
		IF(SUM(real_count) <> 0 && SUM(plan_count) <> 0, ROUND(SUM(real_count) / SUM(plan_count) * 100, 2), 0) AS count_ratio,
		SUM(device_mileage) AS device_mileage,
		SUM(gps_mileage) AS gps_mileage,
		SUM(total_mileage) AS total_mileage,
		SUM(operating_mileage) AS trave_mileage,
		SUM(contract_mileage) AS contract_mileage,
		SUM(idle_mileage) AS idle_mileage
	FROM ledger_daily_car
	WHERE company_id = $companyId
	  AND work_date BETWEEN $startDate AND $endDate
		AND is_deleted = 0
	GROUP By company_id, car_id;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_ledger_monthly_company
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_ledger_monthly_company`;
delimiter ;;
CREATE PROCEDURE `procedure_ledger_monthly_company`(IN `$companyId` varchar(16), IN `$monthly` varchar(10))
BEGIN
	#Routine body goes here...
	/* 企业月度台账
	 * Author: XTITXSS
	 * Date：2020-05-11
	 */
	 DECLARE $startDate VARCHAR(10);
	 DECLARE $endDate VARCHAR(10);
	 SET $startDate = CONCAT($monthly,'-01');
	 SET $endDate = CONCAT($monthly, CONCAT('-', DAY(LAST_DAY($startDate))));

	 UPDATE ledger_monthly_company
	 SET is_deleted = id
	 WHERE company_id = $companyId
	   AND `month` = $monthly
		 AND is_deleted = 0;
		
	 INSERT INTO ledger_monthly_company(
	   company_id,
		 `month`,
		 days,
		 vehicle_count,
		 employee_count,
		 driver_count,
		 conductor_count,
		 stop_count,
		 route_count,
		 dispatch_count,
		 passenger_count,
		 car_own_count,
		 car_use_count,
		 car_ratio,
		 emp_own_count,
		 emp_use_count,
		 emp_ratio,
		 plan_count,
		 real_count,
		 trip_ratio,
		 total_mileage,
		 plan_mileage,
		 real_mileage,
		 contract_mileage,
		 idle_mileage,
		 first_last_count,
		 first_last_on_time,
		 first_last_ratio,
		 depart_count,
		 depart_on_time,
		 depart_ratio,
		 big_station_count,
		 big_station_on_time,
		 big_station_ratio,
		 full_time_count,
		 full_time_on_time,
		 full_time_ratio,
		 over_speed_count,
		 monitor_large_interval,
		 monitor_bunching_count,
		 monitor_scatter_count,
		 monitor_long_wait,
		 monitor_long_parking
	 )
	 SELECT
	    company_id,
			$monthly AS `month`,
			COUNT(DISTINCT(work_date)) As days,
	    SUM(vehicle_count) / COUNT(DISTINCT(work_date)) AS vehicle_count, 
			SUM(employee_count) / COUNT(DISTINCT(work_date)) AS employee_count, 
			SUM(driver_count) / COUNT(DISTINCT(work_date))  AS driver_count, 
			SUM(conductor_count) / COUNT(DISTINCT(work_date)) AS conductor_count,
			SUM(stop_count) / COUNT(DISTINCT(work_date)) AS stop_count, 
			SUM(route_count) / COUNT(DISTINCT(work_date)) AS route_count, 
			SUM(dispatch_count) AS dispatch_count,
			SUM(passenger_count) / COUNT(DISTINCT(work_date)) AS passenger_count, 
			SUM(car_own_count) / COUNT(DISTINCT(work_date)) AS car_own_count,
			SUM(car_use_count) / COUNT(DISTINCT(work_date)) AS car_use_count,
			IF(SUM(car_use_count) <> 0 && SUM(car_own_count) <> 0, ROUND(SUM(car_use_count) / SUM(car_own_count) * 100, 2), 0),
			SUM(emp_own_count) / COUNT(DISTINCT(work_date)) AS emp_own_count,
			SUM(emp_use_count) / COUNT(DISTINCT(work_date)) AS emp_use_count,
			IF(SUM(emp_use_count) <> 0 && SUM(emp_own_count) <> 0, ROUND(SUM(emp_use_count) / SUM(emp_own_count) * 100, 2), 0),
			SUM(plan_count) AS plan_count,
			SUM(real_count) AS real_count,
			IF(SUM(real_count) <> 0 && SUM(plan_count) <> 0, ROUND(SUM(real_count) / SUM(plan_count) * 100, 2), 0),
			SUM(total_mileage) AS total_mileage,
			SUM(plan_mileage) AS plan_mileage,
			SUM(real_mileage) AS real_mileage,
			SUM(contract_mileage) AS contract_mileage,
			SUM(idle_mileage) AS idle_mileage,
			SUM(first_last_count),
			SUM(first_last_on_time),
			IF(SUM(first_last_on_time) <> 0 && SUM(first_last_count) <> 0, ROUND(SUM(first_last_on_time) / SUM(first_last_count) * 100, 2), 0),
			SUM(depart_count),
			SUM(depart_on_time),
			IF(SUM(depart_on_time) <> 0 && SUM(depart_count) <> 0, ROUND(SUM(depart_on_time) / SUM(depart_count) * 100, 2), 0),
			SUM(big_station_count),
			SUM(big_station_on_time),
			IF(SUM(big_station_on_time) <> 0 && SUM(big_station_count) <> 0, ROUND(SUM(big_station_on_time) / SUM(big_station_count) * 100, 2), 0),
			SUM(full_time_count),
			SUM(full_time_on_time),
			IF(SUM(full_time_on_time) <> 0 && SUM(full_time_count) <> 0, ROUND(SUM(full_time_on_time) / SUM(full_time_count) * 100, 2), 0),
			SUM(over_speed_count) / COUNT(DISTINCT(work_date)) AS over_speed_count,
			SUM(monitor_large_interval) AS monitor_large_interval,
			SUM(monitor_bunching_count) AS monitor_bunching_count,
			SUM(monitor_scatter_count) AS monitor_scatter_count,
			SUM(monitor_long_wait) AS monitor_long_wait,
			SUM(monitor_long_parking) AS monitor_long_parking
	 FROM ledger_daily_company
	 WHERE company_id = $companyId
	   AND work_date BETWEEN $startDate AND $endDate
		 AND is_deleted = 0
	 GROUP BY company_id;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_ledger_monthly_employee
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_ledger_monthly_employee`;
delimiter ;;
CREATE PROCEDURE `procedure_ledger_monthly_employee`(IN `$companyId` varchar(16), IN `$monthly` VARCHAR(10))
BEGIN
  #删除和新增记录=基础数据
	DECLARE $startDate VARCHAR(10);
	DECLARE $endDate VARCHAR(10);
	SET $startDate = CONCAT($monthly,'-01');
	SET $endDate = CONCAT($monthly, CONCAT('-', DAY(LAST_DAY($startDate))));
		
	UPDATE ledger_monthly_employee
	 SET is_deleted = id
	 WHERE company_id = $companyId
	   AND `month` = $monthly
		 AND is_deleted = 0;	
	
	INSERT INTO ledger_monthly_employee(
		company_id,
		month,
		start_date,
		end_date,
		route_id,
		route_name,
		emp_id,
		emp_name,
		check_days,
		use_days,
		days_ratio,
		work_time,
		trave_time,
		plan_count,
		real_count,
		trip_ratio,
		total_mileage,
		trave_mileage,
		contract_mileage,
		idle_mileage,
		gps_mileage,
		first_last_count,
		first_last_on_time,
		first_last_ratio,
		depart_count,
		depart_on_time,
		depart_ratio,
		big_station_count,
		big_station_on_time,
		big_station_ratio,
		full_time_count,
		full_time_on_time,
		full_time_ratio,
		over_speed_count
	)
	SELECT company_id,
		$monthly AS `month`,
		$startDate AS start_date,
		$endDate AS end_date,
		route_id,
		route_name,
		emp_id,
		emp_name,
		DAY(LAST_DAY($startDate)) AS check_days,
		COUNT(DISTINCT(work_date)) AS use_days,
		IF(COUNT(DISTINCT(work_date)) <> 0 && DAY(LAST_DAY($startDate)) <> 0, ROUND(COUNT(DISTINCT(work_date)) / DAY(LAST_DAY($startDate)) * 100, 2), 0) AS days_ratio,
		SUM(work_time) AS work_time,
		SUM(run_time) AS trave_time,
		SUM(plan_count) AS plan_count,
		SUM(real_count) AS real_count,
		IF(SUM(real_count) <> 0 && SUM(plan_count) <> 0, ROUND(SUM(real_count) / SUM(plan_count) * 100, 2), 0) AS trip_ratio,
		SUM(operating_mileage + contract_mileage + idle_mileage) AS total_mileage,
		SUM(operating_mileage) AS trave_mileage,
		SUM(contract_mileage) AS contract_mileage,
		SUM(idle_mileage) AS idle_mileage,
		SUM(gps_mileage) AS gps_mileage,
		SUM(first_last_count),
		SUM(first_last_on_time),
		IF(SUM(first_last_on_time) <> 0 && SUM(first_last_count) <> 0, ROUND(SUM(first_last_on_time) / SUM(first_last_count) * 100, 2), 0),
		SUM(depart_count),
		SUM(depart_on_time),
		IF(SUM(depart_on_time) <> 0 && SUM(depart_count) <> 0, ROUND(SUM(depart_on_time) / SUM(depart_count) * 100, 2), 0),
		SUM(big_station_count),
		SUM(big_station_on_time),
		IF(SUM(big_station_on_time) <> 0 && SUM(big_station_count) <> 0, ROUND(SUM(big_station_on_time) / SUM(big_station_count) * 100, 2), 0),
		SUM(full_time_count),
		SUM(full_time_on_time),
		IF(SUM(full_time_on_time) <> 0 && SUM(full_time_count) <> 0, ROUND(SUM(full_time_on_time) / SUM(full_time_count) * 100, 2), 0),
		SUM(over_speed_count)
	FROM ledger_daily_employee
	WHERE company_id = $companyId
	  AND work_date BETWEEN $startDate AND $endDate
		AND is_deleted = 0
	GROUP By emp_id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_ledger_monthly_route
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_ledger_monthly_route`;
delimiter ;;
CREATE PROCEDURE `procedure_ledger_monthly_route`(IN `$company_id` varchar(16), IN `$monthly` varchar(7))
BEGIN
	#
  # 月度线路数据汇总,用于同比和环比
	# XTITXSS 2019-12-13
	DECLARE $startDate VARCHAR(10);
	DECLARE $endDate VARCHAR(10);
	SET $startDate = CONCAT($monthly,'-01');
	SET $endDate = CONCAT($monthly, CONCAT('-', DAY(LAST_DAY($startDate))));

	UPDATE ledger_monthly_route
	SET is_deleted = id
	WHERE company_id = $company_id
		AND `month` = $monthly
		AND is_deleted = 0;
	
	INSERT INTO ledger_monthly_route
	(
		month,               # 月度
		day_count,           # 当月天数
		company_id,          # 企业ID
		company_name,        # 企业名称
		route_id,             # 线路ID
		route_name,          # 线路名称
		car_own_count,                # 配车
		car_use_count,                # 出车
		car_ratio,           #车辆利用率
		emp_own_count,       # 司机配额
		emp_use_count,                # 出勤员工
		emp_ratio,           #出勤率
		plan_count,                   # 计划趟次
		real_count,                   # 实际趟次
		trip_ratio,
		total_mileage,     # 全部里程
		plan_mileage,      # 计划里程
		real_mileage,      # 实际里程
		gps_mileage,       # GPS里程
		contract_mileage,  # 包车里程
		idle_mileage,      # 非运营里程
		record_count,          				# 计划完成记录数
		except_count,          				# 行车异常记录数
		work_time,          					# 工作时长
		trave_time,         				  # 行驶时长
		first_last_count,							# 首班考核次数
		first_last_on_time,          	# 首末班正点次数
		first_last_ratio,
		depart_count,          				# 发车考核次数
		depart_on_time,          			# 发车正点次数
		depart_ratio,
		big_station_count,          	# 大站考核次数
		big_station_on_time,          # 大站考核准点数
		big_station_ratio,
		full_time_count,          		# 全程考核次数
		full_time_on_time,          	# 全程用时准点记录数
		full_time_ratio,
		over_speed_count,          		# 超速记录次数
		monitor_large_interval,       # 发车大间隔
		monitor_bunching_count,       # 串车次数
		monitor_scatter_count,        # 大间隔次数
		monitor_long_wait,            # 长时间等待
		monitor_long_parking,
		sort_id
	)
	SELECT $monthly,
		COUNT(DISTINCT(work_date)),
		company_id,
		company_name,
		route_id,
		route_name,
		SUM(car_own_count),
		SUM(car_use_count),
		IF(SUM(car_use_count) <> 0 && SUM(car_own_count) <> 0, ROUND(SUM(car_use_count) / SUM(car_own_count) * 100, 2), 0),
		SUM(emp_own_count),
		SUM(emp_use_count),
		IF(SUM(emp_use_count) <> 0 && SUM(emp_own_count) <> 0, ROUND(SUM(emp_use_count) / SUM(emp_own_count) * 100, 2), 0),
		SUM(plan_count),
		SUM(real_count),
		IF(SUM(plan_count) <> 0 && SUM(real_count) <> 0, ROUND(SUM(real_count) / SUM(plan_count) * 100, 2), 0),
		SUM(total_mileage),
		SUM(plan_mileage),
		SUM(real_mileage),
		SUM(gps_mileage),
		SUM(contract_mileage),
		SUM(idle_mileage),
		SUM(record_count),
		SUM(except_count),
		SUM(work_time),
		SUM(trave_time),
		SUM(first_last_count),
		SUM(first_last_on_time),
		IF(SUM(first_last_on_time) <> 0 && SUM(first_last_count) <> 0, ROUND(SUM(first_last_on_time) / SUM(first_last_count) * 100, 2), 0),
		SUM(depart_count),
		SUM(depart_on_time),
		IF(SUM(depart_on_time) <> 0 && SUM(depart_count) <> 0, ROUND(SUM(depart_on_time) / SUM(depart_count) * 100, 2), 0),
		SUM(big_station_count),
		SUM(big_station_on_time),
		IF(SUM(big_station_on_time) <> 0 && SUM(big_station_count) <> 0, ROUND(SUM(big_station_on_time) / SUM(big_station_count) * 100, 2), 0),
		SUM(full_time_count),
		SUM(full_time_on_time),
		IF(SUM(full_time_on_time) <> 0 && SUM(full_time_count) <> 0, ROUND(SUM(full_time_on_time) / SUM(full_time_count) * 100, 2), 0),
		SUM(over_speed_count),
		SUM(monitor_large_interval),
		SUM(monitor_bunching_count),
		SUM(monitor_scatter_count),
		SUM(monitor_long_wait),
		SUM(monitor_long_parking),
		sort_id
	FROM ledger_daily_route
	WHERE work_date BETWEEN $startDate AND $endDate
		AND company_id = $company_id
		AND is_deleted = 0
	GROUP BY company_id, company_name, route_id, route_name;
		
	END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_plan_attendance
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_plan_attendance`;
delimiter ;;
CREATE PROCEDURE `procedure_plan_attendance`(IN `$companyId` varchar(16), IN `$workDate` varchar(16), IN `$schemeId` varchar(16))
BEGIN
	
	/*  生成司机资源
		-- @_workdata 日期
		-- @$schemeId 方案ID
	 */

	DROP TEMPORARY TABLE IF EXISTS tmp_attendance;
	DROP TEMPORARY TABLE IF EXISTS tmp_emp;

	# 司机和车辆
	CREATE TEMPORARY TABLE tmp_attendance(
		route_id varchar(16),  -- 线路
		serial INT, -- 班次
		plan_work_time DATETIME, -- 计划上班时间
		emp_id varchar(32), -- 工号
		emp_name varchar(64), -- 司机
		emp_type int
	);

	CREATE TEMPORARY TABLE tmp_emp(
		emp_id varchar(16) -- 司机
	);

	DROP TEMPORARY TABLE IF EXISTS tmp_workplan;

	CREATE TEMPORARY TABLE tmp_workplan (
		SELECT * FROM schedule_master 
		WHERE company_id = $companyId
		  and scheme_id = $schemeId 
		  AND work_date = $workDate 
			AND is_deleted = 0
	);

	# 早班司机
	INSERT INTO tmp_attendance(route_id, serial, plan_work_time, emp_id, emp_name, emp_type) 
	SELECT t1.route_id, t1.serial, t1.first_time, t1.first_emp_id, t1.first_emp_name, t2.emp_type
	FROM tmp_workplan t1, basic_employee t2
	WHERE t1.first_emp_id = t2.emp_id
	  AND t2.company_id = $companyId
		AND t2.is_deleted = 0
	GROUP BY first_emp_id;
	
	INSERT INTO tmp_emp SELECT emp_id FROM tmp_attendance;

	# 中班司机
	INSERT INTO tmp_attendance(route_id, serial, plan_work_time, emp_id, emp_name, emp_type) 
	SELECT t1.route_id, t1.serial, t1.second_time, t1.second_emp_id, t1.second_emp_name, t2.emp_type
	FROM tmp_workplan t1, basic_employee t2
	WHERE t1.second_emp_id = t2.emp_id AND t2.company_id = $companyId
	  AND NOT EXISTS (SELECT emp_id FROM tmp_emp WHERE t1.second_emp_id = emp_id)
		AND t2.is_deleted = 0
	GROUP BY second_emp_id;

	INSERT INTO tmp_emp SELECT emp_id FROM tmp_attendance;

	# 晚班司机
	INSERT INTO tmp_attendance(route_id, serial, plan_work_time, emp_id, emp_name, emp_type) 
	SELECT t1.route_id, t1.serial, t1.third_time, t1.third_emp_id, t1.third_emp_name, t2.emp_type
	FROM tmp_workplan t1, basic_employee t2
	WHERE t1.third_emp_id = t2.emp_id AND t2.company_id = $companyId
		AND NOT EXISTS (SELECT emp_id FROM tmp_emp WHERE t1.third_emp_id = emp_id)
		AND t2.is_deleted = 0
	GROUP BY third_emp_id;	

    INSERT INTO tmp_emp SELECT emp_id FROM tmp_attendance;

	# 早班售票员
	INSERT INTO tmp_attendance(route_id, serial, plan_work_time, emp_id, emp_name, emp_type) 
	SELECT t1.route_id, t1.serial, t1.first_time, t1.first_conductor_id, t1.first_conductor_name, t2.emp_type
	FROM tmp_workplan t1, basic_employee t2
	WHERE t1.first_conductor_id = t2.emp_id
	  AND t2.company_id = $companyId
	  AND NOT EXISTS (SELECT emp_id FROM tmp_emp WHERE t1.first_conductor_id = emp_id)
		AND t2.is_deleted = 0;
	
	INSERT INTO tmp_emp SELECT emp_id FROM tmp_attendance;

	# 中班售票员
	INSERT INTO tmp_attendance(route_id, serial, plan_work_time, emp_id, emp_name, emp_type) 
	SELECT t1.route_id, t1.serial, t1.second_time, t1.second_conductor_id, t1.second_conductor_name, t2.emp_type
	FROM tmp_workplan t1, basic_employee t2
	WHERE t1.second_conductor_id = t2.emp_id AND t2.company_id = $companyId
	  AND NOT EXISTS (SELECT emp_id FROM tmp_emp WHERE t1.second_conductor_id = emp_id)
		AND t2.is_deleted = 0;

	INSERT INTO tmp_emp SELECT emp_id FROM tmp_attendance;

	# 晚班售票员
	INSERT INTO tmp_attendance(route_id, serial, plan_work_time, emp_id, emp_name, emp_type) 
	SELECT t1.route_id, t1.serial, t1.third_time, t1.third_conductor_id, t1.third_conductor_name, t2.emp_type
	FROM tmp_workplan t1, basic_employee t2
	WHERE t1.third_conductor_id = t2.emp_id AND t2.company_id = $companyId
		AND NOT EXISTS (SELECT emp_id FROM tmp_emp WHERE t1.third_conductor_id = emp_id)
		AND t2.is_deleted = 0;

  # 剔除存在于排班中的机动司机
  DELETE FROM schedule_attendance
	WHERE company_id = $companyId
	  AND work_date = $workDate 
	  AND emp_id IN(SELECT emp_id FROM tmp_attendance)
		AND emp_state >= 100
		AND is_deleted = 0;
		
	# 生成司机资源
	INSERT INTO schedule_attendance
		(company_id, route_id, route_name, plan_serial, plan_work_time, emp_id, emp_name, emp_type, emp_state, work_date, spell)
	SELECT $companyId, route_id, 
		(select route_name From basic_route t2 where t1.route_id = t2.route_id and t2.is_deleted = 0 LIMIT 1), 
		serial, MIN(plan_work_time) AS plan_work_time, IFNULL(emp_id, ''), IFNULL(emp_name, ''), emp_type, 0, $workDate,
		(SELECT spell FROM basic_employee t2 WHERE t2.company_id = $companyId AND t2.emp_id = t1.emp_id and t2.is_deleted = 0 LIMIT 1) AS spell
	FROM tmp_attendance t1
	WHERE NOT EXISTS (SELECT 1 FROM schedule_attendance where company_id = $companyId and emp_id = t1.emp_id AND work_date = $workDate AND is_deleted = 0)
	GROUP BY route_id, emp_id, serial, emp_type;

	# 机动司机
	INSERT INTO schedule_attendance
		(company_id, route_id, route_name, plan_serial, plan_work_time, emp_id, emp_name, emp_type, spell, work_date, emp_state)
	SELECT $companyId, route_id, 
		(select route_name From basic_route t3 where t1.route_id = t3.route_id and t3.is_deleted = 0 LIMIT 1), 
		0, NULL, emp_id, emp_name, emp_type, spell, $workDate, 1000
	FROM basic_employee t1
	WHERE NOt EXISTS(SELECT 1 FROM schedule_attendance t2 WHERE t2.company_id = $companyId AND t2.work_date = $workDate AND t1.emp_id = t2.emp_id AND t2.is_deleted = 0)
		AND t1.company_id = $companyId
		AND t1.is_deleted = 0;
		
	# 重新生成资源后，恢复当天刷卡数据
	DROP TEMPORARY TABLE IF EXISTS tmp_swipe_earliest;
	CREATE TEMPORARY TABLE tmp_swipe_earliest(
		SELECT company_id, work_date, emp_id, check_flag, MIN(first_check_time) AS check_in, MAX(last_check_time) AS check_out
		FROM schedule_attendance
		WHERE company_id = $companyId
			AND	work_date = $workDate
			AND check_time IS NOT NULL
			AND is_deleted <> 0
		GROUP BY company_id, work_date, emp_id
	);
	
	UPDATE schedule_attendance t1, tmp_swipe_earliest t2
	SET t1.check_time = t2.check_out, t1.first_check_time = t2.check_in, t1.last_check_time = t2.check_out,
	    t1.check_flag = t2.check_flag
	WHERE t1.company_id = t2.company_id
	  AND t1.work_date = t2.work_date
		AND t1.emp_id = t2.emp_id
		AND t1.is_deleted = 0;
		
	UPDATE schedule_resource t1, tmp_swipe_earliest t2
	SET t1.check_in = case when t2.check_flag = 1 then 1 else 0 end
	WHERE t1.company_id = t2.company_id
	  AND t1.work_date = t2.work_date
		AND t1.emp_id = t2.emp_id
		AND t1.is_deleted = 0;

	# 更新对应线路名称
	UPDATE schedule_attendance t1, view_basic_employee t2
	SET t1.archives_route_id = t2.route_id,
	    t1.archives_route_name = t2.route_name
	WHERE t1.company_id = t2.company_id
		AND t1.emp_id = t2.emp_id
		AND t1.company_id = $companyId
		AND t1.work_date = $workDate
	  AND	t1.is_deleted = 0;
		
	DROP TEMPORARY TABLE IF EXISTS tmp_attendance;
	DROP TEMPORARY TABLE IF EXISTS tmp_emp;
	DROP TEMPORARY TABLE IF EXISTS tmp_workplan;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_plan_clean
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_plan_clean`;
delimiter ;;
CREATE PROCEDURE `procedure_plan_clean`(IN `$company_id` varchar(16), IN `$work_date` varchar(16), IN `$scheme_id` varchar(16))
BEGIN

	/*  删除旧的调度资源
			-- @_work_data 日期
			-- $scheme_id 方案ID
	 */
  DECLARE $startWorkDate VARCHAR(10) DEFAULT date_add($work_date, interval -7 day);
	DECLARE $endWorkDate VARCHAR(10) DEFAULT date_add($work_date, interval -3 day);

	SELECT route_id
	INTO @routeId
	FROM scheme_master
	WHERE company_id = $company_id
	  AND scheme_id = $scheme_id
		AND is_deleted = 0;

	#取消线路当天使用参数
	UPDATE scheme_date
	SET is_deleted = id
	WHERE company_id = $company_id
	  AND work_date = $work_date
		AND route_id = @routeId
		AND is_deleted <= 0;

	#取消车辆资源
	UPDATE schedule_resource
	SET is_deleted = id
	WHERE company_id = $company_id
		AND work_date = $work_date
	  AND route_id = @routeId
		AND is_deleted = 0;

	DELETE FROM schedule_resource
	WHERE company_id = $company_id
	  AND work_date BETWEEN $startWorkDate AND $endWorkDate
		AND route_id = @routeId
		AND is_deleted = id;

	#取消考勤数据
	UPDATE schedule_attendance
	SET is_deleted = id
	WHERE company_id = $company_id
	  AND work_date = $work_date
	  AND route_id = @routeId
		AND is_deleted = 0;

	DELETE FROM schedule_attendance
	WHERE company_id = $company_id
	  AND work_date BETWEEN $startWorkDate AND $endWorkDate
		AND route_id = @routeId
		AND is_deleted = id;

	#取消计划
	UPDATE schedule_plan
	SET is_deleted = id
	WHERE company_id = $company_id
	  AND work_date = $work_date
		AND route_id = @routeId;
		
	DELETE FROM schedule_plan
	WHERE company_id = $company_id
	  AND work_date BETWEEN $startWorkDate AND $endWorkDate
		AND route_id = @routeId
		AND is_deleted = id;
		
	#取消挂班-行车计划
	UPDATE schedule_plan_table
	SET is_deleted = id
	WHERE company_id = $company_id
    AND work_date = $work_date
	  AND route_id = @routeId;
		
	DELETE FROM schedule_plan_table
	WHERE company_id = $company_id
	  AND work_date BETWEEN $startWorkDate AND $endWorkDate
		AND route_id = @routeId
		AND is_deleted = id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_plan_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_plan_data`;
delimiter ;;
CREATE PROCEDURE `procedure_plan_data`(IN `_data` varchar(1024))
BEGIN
	
	/*  初始化调度数据
			-- @_workdata 日期
			-- @_schemeid 方案ID
	 */

	SELECT JSON_UNQUOTE(json_extract(_data, '$.company_id')) INTO @companyId;	
	SELECT JSON_UNQUOTE(json_extract(_data, '$.work_date')) INTO @workDate;
	SELECT JSON_UNQUOTE(json_extract(_data, '$.scheme_id')) INTO @schemeId;
	
	# 获取方案参数
	SELECT dispatch_type, route_id, scheme_name, way_id
	INTO @dispatchType, @routeId, @schemeName, @wayId
	FROM scheme_master
	WHERE company_id = @companyId
	  AND scheme_id = @schemeId
		AND is_deleted = 0;

	SELECT route_name
	INTO @routeName
	FROM basic_route
	WHERE company_id = @companyId
	  AND route_id = @routeId
	  AND is_deleted = 0;

	# 删除旧的
	CALL procedure_plan_clean(@companyId, @workDate, @schemeId);

	# 当天使用运营方案
	INSERT INTO	scheme_date(company_id, work_date, route_id, scheme_id, scheme_name, way_id)
	SELECT @companyId, @workDate, @routeId, @schemeId, @schemeName, @wayId;

	# 生成车辆资源
	CALL procedure_plan_resource(@companyId, @workDate, @schemeId, @routeId);

	# 生成司机考勤
	CALL procedure_plan_attendance(@companyId, @workDate, @schemeId);

	IF @dispatchType = 0 THEN
		# 行车记录-计划调度
		CALL procedure_plan_fix(@companyId, @workDate, @schemeId, @routeId);
	ELSE
	  # 行车记录-灵活调度
		CALL procedure_plan_free(@companyId, @workDate, @schemeId, @routeId);	
	END IF;

	# 统计线路总计划趟次 START
	SELECT SUM(trips), SUM(trips * distance)
	INTO @plan_count, @plan_mileage
	FROM scheme_table
	WHERE scheme_id = @schemeId
		AND route_id = @routeId;

	SELECT COUNT(1)
	INTO @car_own_count
	FROM basic_car
  WHERE	route_id = @routeId
	  AND car_state < 100;
	
	SELECT COUNT(1)
	INTO @emp_own_count
	FROM basic_employee
	WHERE route_id = @routeId
	  AND emp_type = 1
		AND is_deleted = 0
		AND emp_state < 100;

  UPDATE scheme_date t1
	SET scheme_plan_count = IFNULL(@plan_count,0),
	    scheme_plan_mileage = IFNULL(@plan_mileage,0),
			own_car_count = @car_own_count,
			own_emp_count = IFNULL(@emp_own_count, 0),
			route_name = IFNULL(@routeName, ''),
			scheme_name = IFNULL(@schemeName, '')
	WHERE company_id = @companyId 
		AND scheme_id = @schemeId 
		AND route_id = @routeId
		AND work_date = @workDate
		AND is_deleted = 0;
	
	# 统计线路总计划趟次 END
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_plan_first
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_plan_first`;
delimiter ;;
CREATE PROCEDURE `procedure_plan_first`(IN `$workDate` VARCHAR(10), IN `$companyId` varchar(16),IN `$schemeId` varchar(16), IN`$routeId` VARCHAR(16))
BEGIN
	
	/*  
			从时刻表中分析出首班时间
			-- @$schemeId 方案ID
	 */
	IF $routeId > '' THEN
		-- 删除首班
		DELETE FROM scheme_first
		WHERE company_id = $companyId
	  AND scheme_id = $schemeId;
		
		-- 时刻表
		DROP TEMPORARY TABLE IF EXISTS tmp_scheme_table;
		CREATE TEMPORARY TABLE tmp_scheme_table(
			SELECT id, serial, class_id, depart_time, direction
			FROM scheme_table
			WHERE company_id = $companyId
	      AND scheme_id = $schemeId
		);

		-- 按车辆班次和司机早晚班求最早上班时间点
		DROP TEMPORARY TABLE IF EXISTS tmp_scheme_first;
		CREATE TEMPORARY TABLE tmp_scheme_first(
			SELECT
				$companyId AS company_id,
				$schemeId AS scheme_id,
				serial,
				class_id,
				MIN(depart_time) AS depart_time,
				0 AS direction
			FROM tmp_scheme_table
			GROUP BY serial, class_id
		);

		-- 更新上班时间点的方向
		UPDATE tmp_scheme_first t1, tmp_scheme_table t2
		SET t1.direction = t2.direction
		WHERE t1.serial = t2.serial AND t1.depart_time = t2.depart_time;
				
		-- 增加班次
		INSERT INTO scheme_first (company_id, scheme_id, route_id, serial)
		SELECT DISTINCT $companyId, $schemeId, $routeId, serial FROM tmp_scheme_first;
		
		-- 更新早班
		UPDATE scheme_first t1, tmp_scheme_first t2
		SET t1.first_plan = t2.depart_time, t1.first_direction = t2.direction, t1.first_time = date_add(t2.depart_time, interval -15 minute)
		WHERE t1.scheme_id = t2.scheme_id AND t1.serial = t2.serial AND t2.class_id = 1;

		-- 更新中班
		UPDATE scheme_first t1, tmp_scheme_first t2
		SET t1.second_plan = t2.depart_time, t1.second_direction = t2.direction, t1.second_time = date_add(t2.depart_time, interval -15 minute)
		WHERE t1.scheme_id = t2.scheme_id AND t1.serial = t2.serial AND t2.class_id = 2;

    -- 更新晚班
		UPDATE scheme_first t1, tmp_scheme_first t2
		SET t1.third_plan = t2.depart_time, t1.third_direction = t2.direction, t1.third_time = date_add(t2.depart_time, interval -15 minute)
		WHERE t1.scheme_id = t2.scheme_id AND t1.serial = t2.serial AND t2.class_id = 3;
			
		-- 班次首末班时间更新成当天时间
		UPDATE  scheme_first
		SET	first_time = IF(ISNULL(first_time), NULL, date_add(first_time, interval unix_timestamp($workDate) SECOND)),
			first_plan = IF(ISNULL(first_plan), NULL, date_add(first_plan, interval unix_timestamp($workDate) SECOND)),
			second_time = IF(ISNULL(second_time), NULL, date_add(second_time, interval unix_timestamp($workDate) SECOND)),
			second_plan = IF(ISNULL(second_plan), NULL, date_add(second_plan, interval unix_timestamp($workDate) SECOND)),
			third_time = IF(ISNULL(third_time), NULL, date_add(third_time, interval unix_timestamp($workDate) SECOND)),
			third_plan = IF(ISNULL(third_plan), NULL, date_add(third_plan, interval unix_timestamp($workDate) SECOND))
		WHERE scheme_id = $schemeId;

		-- 删除本线路挂班
		UPDATE schedule_master
		SET is_deleted = 1
		WHERE company_id = $companyId
	    AND work_date = $workDate AND route_id = $routeId;
		# 删除30天前的无效数据
		DELETE FROM schedule_master
		WHERE company_id = $companyId
	    AND work_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY)
			AND is_deleted = 1
			AND route_id = $routeId;
		
		-- 生成挂班空模板
		INSERT INTO schedule_master(
			company_id,
			work_date, 
			scheme_id, 
			route_id,
			serial, 
			first_direction, 
			first_time, 
			first_plan, 
			second_direction, 
			second_time, 
			second_plan, 
			third_direction, 
			third_time, 
			third_plan
		)
		SELECT
			$companyId,
			$workDate, 
			scheme_id, 
			route_id, 
			IFNULL(serial, 0), 
			first_direction, 
			first_time, 
			first_plan, 
			second_direction, 
			second_time, 
			second_plan, 
			third_direction, 
			third_time, 
			third_plan 
		FROM scheme_first
		WHERE scheme_id = $schemeId
		ORDER BY serial;	
	END IF;
	
	-- 删除临时表
	DROP TEMPORARY TABLE IF EXISTS tmp_scheme_table;
	DROP TEMPORARY TABLE IF EXISTS tmp_scheme_first;

-- 	SELECT * FROM scheme_first WHERE scheme_id = $schemeId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_plan_fix
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_plan_fix`;
delimiter ;;
CREATE PROCEDURE `procedure_plan_fix`(IN `$companyId` varchar(16),IN `$workDate` varchar(16), IN `$schemeId` varchar(16), IN`$routeId` VARCHAR(16))
BEGIN

	/*  计划调度生成计划
			-- @_workdata 日期
			-- @$schemeId 方案ID
	 */

	DROP TEMPORARY TABLE IF EXISTS tmp_timetable;
	DROP TEMPORARY TABLE IF EXISTS tmp_workplan;
	DROP TEMPORARY TABLE IF EXISTS tmp_plan;

	# 时间点
	CREATE TEMPORARY TABLE tmp_timetable(
		SELECT route_id, route_code, direction, depart_time, arrive_time, trips, distance, serial, series, class_id
		FROM scheme_table
		WHERE company_id = $companyId
		  AND scheme_id = $schemeId
	);

	# 司机和车辆
	CREATE TEMPORARY TABLE tmp_workplan(
		serial smallint(6), -- 班次
		series smallint(6), -- 趟次
		class_id  smallint(6), -- 早中晚
		car_id varchar(16), -- 车辆
		car_name varchar(32), -- 车辆
		emp_id varchar(32), -- 工号
		emp_name varchar(64), -- 司机
		conductor_id varchar(32), -- 售票员工号
		conductor_name varchar(64) -- 售票员姓名
	);

	# 早班车辆司机
	INSERT INTO tmp_workplan(serial, class_id, car_id, car_name, emp_id, emp_name, conductor_id, conductor_name)
	SELECT serial, 1, first_car_id, IFNULL((SELECT car_name FROM basic_car c WHERE c.company_id = m.company_id AND c.car_id = m.first_car_id), ''),
				 first_emp_id, first_emp_name, first_conductor_id, first_conductor_name
	FROM schedule_master m
	WHERE company_id = $companyId AND scheme_id = $schemeId AND work_date = $workDate AND is_deleted = 0;

	# 中班车辆司机
	INSERT INTO tmp_workplan(serial, class_id, car_id, car_name, emp_id, emp_name, conductor_id, conductor_name)
	SELECT serial, 2, second_car_id, IFNULL((SELECT car_name FROM basic_car c WHERE c.company_id = m.company_id AND c.car_id = m.second_car_id), ''),
				 second_emp_id, second_emp_name, second_conductor_id, second_conductor_name
	FROM schedule_master m
	where company_id = $companyId AND scheme_id = $schemeId AND work_date = $workDate AND is_deleted = 0;

	# 晚班车辆司机
	INSERT INTO tmp_workplan(serial, class_id, car_id, car_name, emp_id, emp_name, conductor_id, conductor_name)
	SELECT serial, 3, third_car_id, IFNULL((SELECT car_name FROM basic_car c WHERE c.company_id = m.company_id AND c.car_id = m.third_car_id), ''),
				 third_emp_id, third_emp_name, third_conductor_id, third_conductor_name
	FROM schedule_master m
	where company_id = $companyId AND scheme_id = $schemeId AND work_date = $workDate AND is_deleted = 0;

	# 每个时间点安排的车辆和司机
	CREATE TEMPORARY TABLE tmp_plan(
		SELECT 
				$companyId AS company_id,
				$workDate AS work_date, -- 日期
				t1.serial, t1.series,
				t1.route_id, t1.route_code, t1.direction, t1.depart_time, t1.arrive_time, t1.trips, t1.distance, -- 发车点
				t2.car_id AS imei, t2.car_id, t2.car_name AS car_name,
				t2.emp_id, t2.emp_name, -- 车辆司机
				t2.conductor_id, t2.conductor_name,
				t1.class_id
		FROM tmp_timetable t1
		LEFT JOIN tmp_workplan t2 ON t1.serial = t2.serial AND t1.class_id = t2.class_id
	);
	
	UPDATE tmp_plan t1, view_car t2
	SET t1.car_name = t2.car_name
	WHERE t1.car_id = t2.car_id;

	# 更新计划发车和计划到达时间
	UPDATE tmp_plan SET depart_time = date_add(depart_time, interval unix_timestamp($workDate) SECOND), arrive_time = date_add(arrive_time, interval unix_timestamp($workDate) SECOND);
	
	# 新增调度计划
	INSERT INTO schedule_plan
		(work_date, company_id, route_id, run_route_id, direction, table_depart, plan_depart, table_arrive, plan_arrive, trips, plan_mileage, real_mileage, car_id, car_name, lpn,
		 emp_id, emp_name, conductor_id, conductor_name, table_serial, serial, series, class_id, is_scheduled)
	SELECT
		work_date, $companyId, route_id, route_id, direction, depart_time, depart_time, arrive_time, arrive_time, trips, distance, distance, car_id, car_name,
		(SELECT lpn FROM basic_car c WHERE c.car_id = p.car_id and c.company_id = p.company_id AND c.is_deleted = 0 group by c.lpn LIMIT 1) AS lpn,
		emp_id, emp_name, conductor_id, conductor_name, serial, serial, series, class_id, 1
	FROM tmp_plan p
	WHERE IFNULL(car_id, '') <> ''
	  -- AND emp_id IS NOT NULL
		AND IFNULL(depart_time, '');

	# 新增挂班-行车计划
	INSERT INTO schedule_plan_table
		(work_date, company_id, route_id, scheme_id, run_code, direction, plan_depart, plan_arrive, trips, plan_mileage, car_id, car_name, lpn,
	   emp_id, emp_name, conductor_id, conductor_name, serial, series, class_id, old_plan_depart, old_car_id, old_car_name, old_emp_id, old_emp_name, old_lpn)
	SELECT
		work_date, $companyId, route_id, $schemeId, route_code, direction, depart_time, arrive_time, trips, distance, car_id, car_name,
		(SELECT lpn FROM basic_car c WHERE c.car_id = p.car_id and c.company_id = p.company_id AND c.is_deleted = 0 group by c.lpn LIMIT 1),
		emp_id, emp_name, conductor_id, conductor_name, serial, series, class_id, depart_time, car_id, car_name, emp_id, emp_name,
		(SELECT lpn FROM basic_car c WHERE c.car_id = p.car_id and c.company_id = p.company_id AND c.is_deleted = 0 group by c.lpn LIMIT 1)
	FROM tmp_plan p
	WHERE  IFNULL(car_id, '') <> ''
	  -- AND emp_id IS NOT NULL 
		AND IFNULL(depart_time, '');
	
	# 更新主线路名称
	UPDATE schedule_plan t1, basic_route t2
	SET t1.route_name = t2.route_name
	WHERE t1.route_id = t2.route_id
	  AND t1.company_id = t2.company_id
		AND t1.work_date = $workDate
		AND t1.company_id = $companyId
		AND t1.route_id = $routeId
	  AND	t2.is_deleted = 0;
	
	# 更新支线名称
	UPDATE schedule_plan t1, basic_route t2
	SET t1.run_route_name = t2.route_name
	WHERE t1.run_route_id = t2.route_id
	  AND t1.company_id = t2.company_id
		AND t1.work_date = $workDate
		AND t1.company_id = $companyId
		AND t1.route_id = $routeId
		AND t2.is_deleted = 0;
		
	# 更新主线路名称
	UPDATE schedule_plan_table t1, basic_route t2
	SET t1.route_name = t2.route_name
	WHERE t1.route_id = t2.route_id
	  AND t1.company_id = t2.company_id
		AND t1.work_date = $workDate
		AND t1.company_id = $companyId
		AND t1.route_id = $routeId
		AND t2.is_deleted = 0;
		
	# 回写计划调度主表schedule_plan的ID
	UPDATE schedule_plan_table t1, schedule_plan t2
	SET t1.schedule_plan_id = t2.id
	WHERE t1.company_id = t2.company_id
		AND t1.work_date = t2.work_date
		AND t1.route_id = t2.route_id
		AND t1.direction = t2.direction
		AND t1.car_id = t2.car_id
		AND t1.series = t2.series
		AND t1.serial = t2.serial
		AND t1.work_date = $workDate
		AND t1.company_id = $companyId
		AND t1.route_id = $routeId
		AND t1.is_deleted = 0
		AND t2.is_deleted = 0;
		
	# 更新线路起终点
	DROP TEMPORARY TABLE IF EXISTS tmp_origin_terminal;
	CREATE TEMPORARY TABLE tmp_origin_terminal(
		SELECT t3.route_id, t3.origin, t3.terminal, t3.direction
		FROM schedule_master t1, scheme_master t2, basic_route_direction t3
		WHERE t1.company_id = t2.company_id
			AND t1.route_id = t2.route_id
			AND t1.scheme_id = t2.scheme_id
			AND t2.way_id = t3.way_id
			AND t2.route_id = t3.route_id
			AND t1.work_date = $workDate
			AND t1.route_id = $routeId
			AND t1.scheme_id = $schemeId
			AND t1.is_deleted = 0
			AND t2.is_deleted = 0
			AND t3.is_deleted = 0
		GROUP BY t3.route_id, t3.origin, t3.terminal, t3.direction
	);
	
	UPDATE schedule_plan t1, tmp_origin_terminal t2
	SET t1.origin_station = t2.origin, t1.terminal_station = t2.terminal
	WHERE t1.company_id = $companyId
	  AND t1.route_id = t2.route_id
	  AND t1.direction = t2.direction
		AND t1.work_date = $workDate
		AND t1.route_id = $routeId
		AND t1.is_deleted = 0;
		
	UPDATE schedule_plan_table t1, tmp_origin_terminal t2
	SET t1.origin_station = t2.origin, t1.terminal_station = t2.terminal
	WHERE t1.company_id = $companyId
	  AND t1.route_id = t2.route_id
	  AND t1.direction = t2.direction
		AND t1.work_date = $workDate
		AND t1.route_id = $routeId
		AND t1.is_deleted = 0;

	DROP TEMPORARY TABLE IF EXISTS tmp_timetable;
	DROP TEMPORARY TABLE IF EXISTS tmp_workplan;
	DROP TEMPORARY TABLE IF EXISTS tmp_plan;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_plan_free
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_plan_free`;
delimiter ;;
CREATE PROCEDURE `procedure_plan_free`(IN `$companyId` varchar(16), IN `$workDate` varchar(16), IN `$schemeId` varchar(16), IN`$routeId` VARCHAR(16))
BEGIN
	
	/*  灵活调度生成计划
			-- @_workdata 日期
			-- @$schemeId 方案ID
	 */
  DECLARE $firstShiftsUp INT;
	DECLARE $firstShiftsDown INT;
	DROP TEMPORARY TABLE IF EXISTS tmp_timetable;
	DROP TEMPORARY TABLE IF EXISTS tmp_workplan;
	DROP TEMPORARY TABLE IF EXISTS tmp_plan;

	# 时间点
	CREATE TEMPORARY TABLE tmp_timetable(
		SELECT route_id, route_code, direction, depart_time, arrive_time, trips, distance, serial, series, class_id
		FROM scheme_table
		WHERE company_id = $companyId AND scheme_id = $schemeId
	);

	# 司机和车辆
	CREATE TEMPORARY TABLE tmp_workplan(
		serial smallint(6), -- 班次
		series smallint(6), -- 趟次
		class_id  smallint(6), -- 早中晚
		car_id varchar(16), -- 车辆
		car_name varchar(32), -- 车辆名称
		emp_id varchar(32), -- 工号
		emp_name varchar(64), -- 司机
		conductor_id varchar(32), -- 工号
		conductor_name varchar(64) -- 售票员
	);

	# 早班车辆司机
	INSERT INTO tmp_workplan(serial, class_id, car_id, car_name, emp_id, emp_name, conductor_id, conductor_name)
	SELECT serial, 1, first_car_id, IFNULL((SELECT car_name FROM basic_car c WHERE c.company_id = m.company_id AND c.car_id = m.first_car_id AND c.is_deleted = 0 LIMIT 1), ''),
				 first_emp_id, first_emp_name, first_conductor_id, first_conductor_name
	FROM schedule_master m
	WHERE company_id = $companyId AND scheme_id = $schemeId AND work_date = $workDate AND is_deleted = 0;

	# 中班车辆司机
	INSERT INTO tmp_workplan(serial, class_id, car_id, car_name, emp_id, emp_name, conductor_id, conductor_name)
	SELECT serial, 2, second_car_id, IFNULL((SELECT car_name FROM basic_car c WHERE c.company_id = m.company_id AND c.car_id = m.second_car_id AND c.is_deleted = 0 LIMIT 1), ''),
				 second_emp_id, second_emp_name, second_conductor_id, second_conductor_name
	FROM schedule_master m
	where company_id = $companyId AND scheme_id = $schemeId AND work_date = $workDate AND is_deleted = 0;

	# 晚班车辆司机
	INSERT INTO tmp_workplan(serial, class_id, car_id, car_name, emp_id, emp_name, conductor_id, conductor_name)
	SELECT serial, 3, third_car_id, IFNULL((SELECT car_name FROM basic_car c WHERE c.company_id = m.company_id AND c.car_id = m.third_car_id AND c.is_deleted = 0 LIMIT 1), ''),
				 third_emp_id, third_emp_name, third_conductor_id, third_conductor_name
	FROM schedule_master m
	where company_id = $companyId AND scheme_id = $schemeId AND work_date = $workDate AND is_deleted = 0;

	# 每个时间点安排的车辆和司机
	CREATE TEMPORARY TABLE tmp_plan(
		SELECT $companyId AS company_id,
				$workDate AS work_date, -- 日期
				t1.serial, t1.series,
				t1.route_id, t1.route_code, t1.direction, t1.depart_time, t1.arrive_time, t1.trips, t1.distance, -- 发车点
				t2.car_id AS imei, t2.car_id, t2.car_name AS car_name, t2.emp_id, t2.emp_name,	-- 车辆司机
			  t2.conductor_id, t2.conductor_name, t1.class_id
		FROM tmp_timetable t1
		LEFT JOIN tmp_workplan t2
		ON t1.serial = t2.serial AND t1.class_id = t2.class_id
		ORDER BY serial, depart_time
	);

	DROP TEMPORARY TABLE IF EXISTS tmp_plantable;
	CREATE TEMPORARY TABLE tmp_plantable(
		SELECT *
		FROM tmp_plan
		GROUP BY serial
	);
		
	UPDATE tmp_plantable t1, view_device t2
	SET t1.car_name = t2.car_name, t1.imei = t2.imei
	WHERE t1.car_id = t2.car_id;
	
	UPDATE tmp_plan t1, view_device t2
	SET t1.car_name = t2.car_name, t1.imei = t2.imei
	WHERE t1.car_id = t2.car_id;

	#更新计划发车和计划到达时间
	UPDATE tmp_plantable SET depart_time = date_add(depart_time, INTERVAL unix_timestamp($workDate) SECOND), arrive_time = date_add(arrive_time, INTERVAL unix_timestamp($workDate) SECOND);
	UPDATE tmp_plan SET depart_time = date_add(depart_time, INTERVAL unix_timestamp($workDate) SECOND), arrive_time = date_add(arrive_time, INTERVAL unix_timestamp($workDate) SECOND);

	UPDATE tmp_plantable t1, schedule_master t2
	SET t1.depart_time = t2.first_plan
	WHERE t1.work_date = t2.work_date
		AND t1.route_id = t2.route_id
		AND t1.serial = t2.serial
	  AND t1.car_id = t2.first_car_id
		AND t2.company_id = $companyId
		AND t2.is_deleted = 0;

	# 生成调度计划,灵活调度只新增前n个首班计划
	# 上行
	SELECT first_shifts
	INTO $firstShiftsUp
	FROM scheme_direction
	WHERE company_id = $companyId
	  AND scheme_id = $schemeId
	  AND direction = 1
	  AND is_deleted = 0;
		
	INSERT INTO schedule_plan
		(work_date, company_id, route_id, run_route_id, direction, plan_depart, plan_arrive, trips, plan_mileage, real_mileage, car_id, car_name, lpn,
	   emp_id, emp_name, conductor_id, conductor_name, serial, series, class_id)
	SELECT 
		work_date, $companyId, route_id, route_id, direction, depart_time, arrive_time, trips, distance, distance, car_id, car_name, 
		(SELECT lpn FROM basic_car c WHERE c.car_id = p.car_id and c.company_id = p.company_id AND c.is_deleted = 0 group by c.lpn LIMIT 1) AS lpn,
		emp_id, emp_name, conductor_id, conductor_name, serial, series, class_id
	FROM tmp_plantable p
	WHERE car_id IS NOT NULL
		AND depart_time IS NOT NULL
		AND direction = 1
	ORDER BY depart_time
	LIMIT 0, $firstShiftsUp;
	
	# 下行
	SELECT first_shifts
	INTO $firstShiftsDown
	FROM scheme_direction
	WHERE company_id = $companyId
	  AND scheme_id = $schemeId
	  AND direction = 2
	  AND is_deleted = 0;
		
	INSERT INTO schedule_plan
		(work_date, company_id, route_id, run_route_id, direction, plan_depart, plan_arrive, trips, plan_mileage, real_mileage, car_id, car_name, lpn,
		 emp_id, emp_name, conductor_id, conductor_name, serial, series, class_id)
	SELECT 
		work_date, $companyId, route_id, route_id, direction, depart_time, arrive_time, trips, distance, distance, car_id, car_name,
		(SELECT lpn FROM basic_car c WHERE c.car_id = p.car_id and c.company_id = p.company_id AND c.is_deleted = 0 group by c.lpn LIMIT 1) AS lpn,
		emp_id, emp_name, conductor_id, conductor_name, serial, series, class_id
	FROM tmp_plantable p
	WHERE car_id IS NOT NULL
		AND depart_time IS NOT NULL
		AND direction = 2
	ORDER BY depart_time
	LIMIT 0, $firstShiftsDown;

	# 新增挂班-行车计划
	INSERT INTO schedule_plan_table
		(work_date, company_id, route_id, scheme_id, run_code, direction, plan_depart, plan_arrive, trips, plan_mileage, car_id, car_name, lpn,
		 emp_id, emp_name, conductor_id, conductor_name, serial, series, class_id, old_plan_depart, old_car_id, old_car_name, old_emp_id, old_emp_name, old_lpn)
	SELECT 
		t1.work_date, $companyId, t1.route_id, $schemeId, t1.route_code, t1.direction, t1.depart_time, t1.arrive_time, t1.trips, t1.distance, t1.car_id, t1.car_name, 
		(SELECT lpn FROM basic_car c WHERE c.car_id = t1.car_id and c.company_id = t1.company_id AND c.is_deleted = 0 group by c.lpn LIMIT 1) AS lpn,
		t1.emp_id, t1.emp_name, t1.conductor_id, t1.conductor_name, t1.serial, t1.series, t2.class_id, t1.depart_time, t1.car_id, t1.car_name, t1.emp_id, t1.emp_name,
		(SELECT lpn FROM basic_car c WHERE c.car_id = t1.car_id and c.company_id = t1.company_id AND c.is_deleted = 0 group by c.lpn LIMIT 1)
	FROM tmp_plan t1 LEFT JOIN tmp_timetable t2
		ON t1.route_id = t2.route_id
		AND t1.serial = t2.serial
		AND t1.series = t2.series
	WHERE t1.car_id IS NOT NULL
    -- AND t1.emp_id IS NOT NULL
		AND t1.depart_time IS NOT NULL;

	# 更新主线路名称
	UPDATE schedule_plan t1, basic_route t2
	SET t1.route_name = t2.route_name
	WHERE t1.route_id = t2.route_id
	  AND t1.company_id = t2.company_id
		AND t1.work_date = $workDate
		AND t1.company_id = $companyId
	  AND	t2.is_deleted = 0;

	# 更新支线名称
	UPDATE schedule_plan t1, basic_route t2
	SET t1.run_route_name = t2.route_name
	WHERE t1.run_route_id = t2.route_id
	  AND t1.company_id = t2.company_id
		AND t1.work_date = $workDate
		AND t1.company_id = $companyId
		AND t2.is_deleted = 0;

	# 更新主线路名称
	UPDATE schedule_plan_table t1, basic_route t2
	SET t1.route_name = t2.route_name
	WHERE t1.route_id = t2.route_id
	  AND t1.company_id = t2.company_id
		AND t1.work_date = $workDate
		AND t1.company_id = $companyId
		AND t1.route_id = $routeId
		AND t2.is_deleted = 0;

	# 回写计划调度主表schedule_plan的ID
	UPDATE schedule_plan_table t1, schedule_plan t2
	SET t1.schedule_plan_id = t2.id
	WHERE t1.company_id = t2.company_id
		AND t1.work_date = t2.work_date
		AND t1.route_id = t2.route_id
		AND t1.direction = t2.direction
		AND t1.car_id = t2.car_id
		AND t1.series = t2.series
		AND t1.serial = t2.serial
		AND t1.work_date = $workDate
		AND t1.company_id = $companyId
		AND t1.route_id = $routeId
		AND t1.is_deleted = 0
		AND t2.is_deleted = 0;

	# 更新线路起终点
	DROP TEMPORARY TABLE IF EXISTS tmp_origin_terminal;
	CREATE TEMPORARY TABLE tmp_origin_terminal(
		SELECT t3.route_id, t3.origin, t3.terminal, t3.direction
		FROM schedule_master t1, scheme_master t2, basic_route_direction t3
		WHERE t1.company_id = t2.company_id
			AND t1.route_id = t2.route_id
			AND t1.scheme_id = t2.scheme_id
			AND t2.way_id = t3.way_id
			AND t1.company_id = $companyId
			AND t2.route_id = t3.route_id
			AND t1.work_date = $workDate
			AND t1.route_id = $routeId
			AND t1.scheme_id = $schemeId
			AND t1.is_deleted = 0
			AND t2.is_deleted = 0
			AND t3.is_deleted = 0
		GROUP BY t3.route_id, t3.origin, t3.terminal, t3.direction
	);

	UPDATE schedule_plan t1, tmp_origin_terminal t2
	SET t1.origin_station = t2.origin, t1.terminal_station = t2.terminal
	WHERE t1.company_id = $companyId
	  AND t1.route_id = t2.route_id
	  AND t1.direction = t2.direction
		AND t1.work_date = $workDate
		AND t1.route_id = $routeId
		AND t1.is_deleted = 0;

	UPDATE schedule_plan_table t1, tmp_origin_terminal t2
	SET t1.origin_station = t2.origin, t1.terminal_station = t2.terminal
	WHERE t1.company_id = $companyId
	  AND t1.route_id = t2.route_id
	  AND t1.direction = t2.direction
		AND t1.work_date = $workDate
		AND t1.route_id = $routeId
		AND t1.is_deleted = 0;

	DROP TEMPORARY TABLE IF EXISTS tmp_timetable;
	DROP TEMPORARY TABLE IF EXISTS tmp_workplan;
	DROP TEMPORARY TABLE IF EXISTS tmp_plan;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_plan_resource
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_plan_resource`;
delimiter ;;
CREATE PROCEDURE `procedure_plan_resource`(IN `$companyId` varchar(16), IN `$workDate` varchar(16), IN `$schemeId` varchar(16), IN`$routeId` VARCHAR(16))
BEGIN
	
	/*  生成车辆资源
			-- @_workdata 日期
			-- @$schemeId 方案ID
	 */
	# 司机和车辆
	DROP TEMPORARY TABLE IF EXISTS tmp_resource;
	CREATE TEMPORARY TABLE tmp_resource(
		route_id varchar(16),  -- 线路
		serial int, -- 班次
		car_id varchar(16), -- 车辆ID
		car_name varchar(32), -- 车辆名称
		imei varchar(16), -- 主设备ID
		emp_id varchar(32), -- 工号
		emp_name varchar(64), -- 司机
		conductor_id varchar(32),
		conductor_name varchar(64),
		direction int, -- 方向
		run_state int -- 运行状态 0正常 100机动 1000当天没排班
	);

	DROP TEMPORARY TABLE IF EXISTS tmp_car;
	CREATE TEMPORARY TABLE tmp_car(
		car_id varchar(16) -- 车辆
	);

	# 早班车辆
	INSERT INTO tmp_resource(route_id, serial, car_id, emp_id, emp_name, conductor_id, conductor_name, direction, run_state)
	SELECT t1.route_id, t1.serial, t1.first_car_id, t1.first_emp_id, t1.first_emp_name, t1.first_conductor_id, t1.first_conductor_name, t1.first_direction, 0
	FROM schedule_master t1, basic_car t2
	WHERE t1.scheme_id = $schemeId
	  AND t1.work_date = $workDate
		AND t1.is_deleted = 0
		AND t1.first_car_id = t2.car_id
	GROUP BY t1.route_id, t1.serial, t1.first_car_id, t1.first_emp_id, t1.first_emp_name, t1.first_conductor_id, t1.first_conductor_name, t1.first_direction
	ORDER BY t1.first_plan;

	INSERT INTO tmp_car SELECT car_id FROM tmp_resource GROUP BY car_id;

	# 中班车辆
	INSERT INTO tmp_resource(route_id, serial, car_id, emp_id, emp_name, conductor_id, conductor_name, direction, run_state)
	SELECT t1.route_id, t1.serial, t1.second_car_id, t1.second_emp_id, t1.second_emp_name, t1.second_conductor_id, t1.second_conductor_name, t1.second_direction, 1000
	FROM schedule_master t1, basic_car t2
	WHERE t1.scheme_id = $schemeId
	  AND t1.work_date = $workDate
		AND t1.is_deleted = 0
		AND t1.second_car_id = t2.car_id
	  AND NOT EXISTS (SELECT car_id FROM tmp_car WHERE t1.second_car_id = car_id)
  GROUP BY t1.route_id, t1.serial, t1.second_car_id, t1.second_emp_id, t1.second_emp_name, t1.second_conductor_id, t1.second_conductor_name, t1.second_direction
	ORDER BY t1.second_plan;

	INSERT INTO tmp_car SELECT car_id FROM tmp_resource GROUP BY car_id;

	# 晚班车辆
	INSERT INTO tmp_resource(route_id, serial, car_id, emp_id, emp_name, conductor_id, conductor_name, direction, run_state)
	SELECT t1.route_id, t1.serial, t1.third_car_id, t1.third_emp_id, t1.third_emp_name, t1.third_conductor_id, t1.third_conductor_name, t1.third_direction, 1000
	FROM schedule_master t1, basic_car t2
	WHERE t1.scheme_id = $schemeId
	  AND t1.work_date = $workDate
		AND t1.is_deleted = 0
		AND t1.third_car_id = t2.car_id
		AND NOT EXISTS (SELECT car_id FROM tmp_car WHERE t1.third_car_id = car_id)
	GROUP BY t1.route_id, t1.serial, t1.third_car_id, t1.third_emp_id, t1.third_emp_name, t1.third_conductor_id, t1.third_conductor_name, t1.third_direction
	ORDER BY t1.third_plan;
	
	# 更新终端ID和车辆名称
	UPDATE tmp_resource t1, view_car t2
	SET t1.car_name = t2.car_name, t1.imei = IFNULL(t2.imei, '')
	WHERE t1.car_id = t2.car_id;
	
	# 踢出存在于排班中的机动车辆
  DELETE FROM schedule_resource
	WHERE company_id = $companyId
	  AND work_date = $workDate 
	  AND car_id IN(SELECT first_car_id FROM schedule_master WHERE work_date = $workDate AND company_id = $companyId AND scheme_id = $schemeId AND IFNULL(first_car_id, '') <> '' AND is_deleted = 0
									UNION
									SELECT second_car_id FROM schedule_master WHERE work_date = $workDate AND company_id = $companyId AND scheme_id = $schemeId AND IFNULL(second_car_id, '') <> '' AND is_deleted = 0
									UNION
									SELECT third_car_id FROM schedule_master WHERE work_date = $workDate AND company_id = $companyId AND scheme_id = $schemeId AND IFNULL(third_car_id, '') <> '' AND is_deleted = 0)
		AND run_state = 1000
		AND is_deleted = 0;
	
	#生成运营车辆资源	
	INSERT INTO schedule_resource
		(company_id, route_id, route_name, run_route_id, run_route_name, imei, car_id, car_name, emp_id, emp_name, conductor_id, conductor_name, run_state, direction, serial, work_date)
	SELECT
		$companyId, route_id, (SELECT route_name FROM basic_route r WHERE t1.route_id = r.route_id and r.is_deleted = 0) AS route_name,
		route_id AS run_route_id, (SELECT route_name FROM basic_route x WHERE t1.route_id = x.route_id and x.is_deleted = 0) AS run_route_name,
		IFNULL(imei, ''), IFNULL(car_id, ''), IFNULL(car_name, ''), emp_id, emp_name, conductor_id, conductor_name, run_state, IFNULL(direction, 1) AS direction, serial, $workDate
	FROM tmp_resource t1
	WHERE NOT EXISTS (SELECT 1 FROM schedule_resource r WHERE r.company_id = $companyId AND car_id = t1.car_id AND work_date = $workDate AND is_deleted = 0)
	GROUP BY car_id;
		
	#生成非运营车辆资源
	INSERT INTO schedule_resource
		(company_id, route_id, route_name, run_route_id, run_route_name, imei, car_id, car_name, emp_id, emp_name, conductor_id, conductor_name, run_state, direction, serial, work_date)
	SELECT
		$companyId, route_id, (SELECT route_name FROM basic_route r WHERE t1.route_id = r.route_id and r.is_deleted = 0) AS route_name,
		route_id AS run_route_id, (SELECT route_name FROM basic_route x WHERE t1.route_id = x.route_id and x.is_deleted = 0) AS run_route_name,
		IFNULL(imei, ''), IFNULL(car_id, ''), IFNULL(car_name, ''), '' AS emp_id, '' AS emp_name, '', '', 1000 AS run_state, 1 AS direction, 0 AS serial, $workDate
	FROM view_car t1
	WHERE t1.company_id = $companyId
	  AND NOT EXISTS (SELECT 1 FROM schedule_resource r WHERE r.company_id = $companyId AND car_id = t1.car_id AND work_date = $workDate AND is_deleted = 0)
	GROUP BY car_id;
	
	# 更新主线路名称
	UPDATE schedule_resource t1, basic_route t2
	SET t1.route_name = t2.route_name
	WHERE t1.route_id = t2.route_id
	  AND t1.company_id = t2.company_id
		AND t1.work_date = $workDate
		AND t1.company_id = $companyId
	  AND	t2.is_deleted = 0;
		
	# 更新车辆档案对应线路名称
	UPDATE schedule_resource t1, view_car_route t2
	SET t1.archives_route_id = t2.route_id,
	    t1.archives_route_name = t2.route_name,
			t1.lpn = t2.lpn
	WHERE t1.company_id = t2.company_id
		AND t1.work_date = $workDate
	  -- AND t1.route_id = t2.route_id
		AND t1.car_id = t2.car_id
		AND t1.company_id = $companyId
	  AND	t1.is_deleted = 0;
	
	# 更新支线名称
	UPDATE schedule_resource t1, basic_route t2
	SET t1.run_route_name = t2.route_name
	WHERE t1.run_route_id = t2.route_id
	  AND t1.company_id = t2.company_id
		AND t1.work_date = $workDate
		AND t1.company_id = $companyId
		AND t2.is_deleted = 0;

	DROP TEMPORARY TABLE IF EXISTS tmp_resource;
	DROP TEMPORARY TABLE IF EXISTS tmp_car;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_trip
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_trip`;
delimiter ;;
CREATE PROCEDURE `procedure_trip`(in start_time datetime, in end_time datetime, in imei varchar(50))
begin
	DROP TEMPORARY TABLE IF EXISTS temp_poi_main;
	DROP TEMPORARY TABLE IF EXISTS temp_poi_main_copy;

	CREATE TEMPORARY TABLE temp_poi_main AS
	(
		select *, (@rownum := @rownum + 1) AS rownum from (
			select dp.id, dp.company_id, dp.imei, dp.stop_id, dp.flag, dp.route_id, dp.lat, dp.lng, dp.mileage, dp.event_time, bb.stop_name, br.route_name, vd.car_name
			from device_poi dp 
			join basic_route br on dp.route_id = br.route_id
			join view_device vd on dp.imei = vd.imei
			join basic_busstop bb on dp.stop_id = bb.stop_id
			where dp.event_time between start_time and end_time
			and dp.imei = imei
			-- where dp.event_time between '2020-03-01' and '2020-03-02'
			and dp.change_type = 100
			and dp.stop_id in (select stop_id from basic_route_station where flag > 0)
			order by dp.imei, dp.event_time
		) main,(SELECT @rownum := 0) AS rn
	);
	
	CREATE TEMPORARY TABLE temp_poi_main_copy as
	(
		select * from temp_poi_main
	);
	
	select
		a.imei ,
		a.car_name ,
		a.route_id ,
		a.route_name route_name ,
		a.stop_id depart_stop_id ,
		a.stop_name depart_stop_name ,
		a.event_time depart_time ,
		a.flag depart_flag ,
		a.mileage depart_mileage ,
		b.stop_id arrive_stop_id,
		b.stop_name arrive_stop_name ,
		b.event_time arrive_time,
		b.flag arrive_flag,
		b.mileage arrive_mileage,
		b.mileage - a.mileage mileage
	from
		temp_poi_main a
	join temp_poi_main_copy b on
		b.flag = 1
		and a.imei = b.imei
		and a.rownum + 1 = b.rownum
		and a.stop_id <> b.stop_id
		where a.flag = 2;
		
		DROP TEMPORARY TABLE IF EXISTS temp_poi_main;
		DROP TEMPORARY TABLE IF EXISTS temp_poi_main_copy;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_work_plan
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_work_plan`;
delimiter ;;
CREATE PROCEDURE `procedure_work_plan`(IN `_data` varchar(1024))
label:BEGIN

	/*  	 初始化挂班
	-- @$companyId 企业ID
	-- @$workDate 日期
	-- @$schemeId 方案ID
	-- @$flag 0生成数据 1空模板
	*/
	DECLARE $companyId VARCHAR(16);    -- 企业
	DECLARE $workDate VARCHAR(16);		 -- 日期
	DECLARE $routeId VARCHAR(16);			 -- 线路
	DECLARE $schemeId VARCHAR(16);		 -- 方案ID
	DECLARE $flag INT;								 -- 标识

	DECLARE $groupId VARCHAR(50);       -- 班组编码

	SELECT JSON_UNQUOTE(json_extract(_data, '$.company_id')) INTO $companyId;
	SELECT JSON_UNQUOTE(json_extract(_data, '$.work_date')) INTO $workDate;
	SELECT JSON_UNQUOTE(json_extract(_data, '$.scheme_id')) INTO $schemeId;
	SELECT JSON_UNQUOTE(json_extract(_data, '$.flag')) INTO $flag;

	# 线路为空退出存储过程
	SELECT route_id, shifts_type
  INTO $routeId, @classType
	FROM scheme_master
	WHERE company_id = $companyId AND scheme_id = $schemeId AND is_deleted = 0;
		
	IF IFNULL($routeId, '') = '' THEN LEAVE label; END IF;

	#>>>>>>>>>>>>>> 1.空班 >>>>>>>>>>>>>>
	CALL procedure_plan_first($workDate, $companyId, $schemeId, $routeId);
	IF $flag = 1 THEN LEAVE label; END IF;

	#取出全部方案班组内成员临时表
	DROP TEMPORARY TABLE IF EXISTS tmp_group_member;
	CREATE TEMPORARY TABLE tmp_group_member(
		SELECT 
			t1.shifts_type, t1.start_date, 0 AS move_count, t2.*,
			first_emp_id AS tmp_emp_id, first_emp_name AS tmp_emp_name,
			first_car_id AS tmp_car_id, first_car_name AS tmp_car_name
		FROM scheme_group t1, scheme_group_member t2
		WHERE t1.company_id = t2.company_id
		  AND t1.route_id = t2.route_id
			AND t1.group_id = t2.group_id
			AND t1.company_id = $companyId
			AND t1.route_id = $routeId
	);
	
	# 备份关联

	#>>>>>>>>>>>>>> 2.水平轮换 >>>>>>>>>>>>>>
	BEGIN
		# 目前只考虑早中班对调1次,后续有需要再加
		UPDATE tmp_group_member
		SET move_count = CASE WHEN @classType = 1 THEN 0 ELSE IFNULL(FLOOR(DATEDIFF($workDate, start_date) / emp_shift_interval) * 1, 0) END
		WHERE emp_shift_interval != 0;

		#SELECT * FROM tmp_group_member WHERE move_count % 2 = 1;
		UPDATE tmp_group_member
		SET 
		  -- 司机水平轮换
			tmp_emp_id = second_emp_id,
			tmp_emp_name = second_emp_name,
			second_emp_id = first_emp_id,
			second_emp_name = first_emp_name,
			first_emp_id = tmp_emp_id,
			first_emp_name = tmp_emp_name,
			-- 车辆水平轮换
			tmp_car_id = second_car_id,
			tmp_car_name = second_car_name,
			second_car_id = first_car_id,
			second_car_name = first_car_name,
			first_car_id = tmp_car_id,
			first_car_name = tmp_car_name,
			-- 清空临时空间
			tmp_emp_id = NULL,
			tmp_emp_name = NULL,
			tmp_car_id = NULL,
			tmp_car_name = NULL
		WHERE move_count % 2 = 1;
		#备份关联用
		DROP TEMPORARY TABLE IF EXISTS tmp_group_member2;
		CREATE TEMPORARY TABLE tmp_group_member2(SELECT * FROM tmp_group_member);
	END;

	#>>>>>>>>>>>>>> 3.垂直轮换 >>>>>>>>>>>>>>
	BEGIN
		-- 遍历数据结束标志
		DECLARE done INT DEFAULT FALSE;
		-- 游标
		DECLARE my_cur CURSOR FOR SELECT group_id FROM scheme_group	WHERE route_id = $routeId;
		-- 将结束标志绑定到游标
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
		-- 打开游标
		OPEN my_cur;
		-- 开始循环
		read_loop: LOOP
			 -- 提取游标里的数据，这里只有一个，多个的话也一样；
			FETCH my_cur INTO $groupId;
			IF done THEN LEAVE read_loop; END IF;

			# 班组信息
			SELECT 
				start_date, group_id, serial_shift_id, serial_shift_interval, shift_offset, shifts_type 
			INTO @startDate, @groupId, @serialShiftId, @serialShiftInterval, @shiftOffset, @shiftsType
			FROM 
				scheme_group 
			WHERE 
				group_id = $groupId;

			# 垂直偏移量
			SELECT IFNULL(FLOOR(DATEDIFF($workDate, @startDate) / @serialShiftInterval) * @shiftOffset, 0) INTO @moveCount;

			# 班组内数量
			SELECT COUNT(1) INTO @groupCount FROM tmp_group_member WHERE group_id = $groupId;
			
			-- 旧的排序
			DROP TEMPORARY TABLE IF EXISTS tmp_rank;
			CREATE TEMPORARY TABLE tmp_rank(
				SELECT 
					group_id, sort_id, id, @rownum := @rownum + 1 AS old_rank, 0 AS new_rank  
				FROM 
					(SELECT @rownum := 0) r, scheme_group_member member
				WHERE 
					member.route_id = $routeId  AND member.group_id = @groupId
				ORDER BY 
					member.group_id, member.sort_id, member.id
			);
	
			-- 新排序以及越界处理
			UPDATE tmp_rank SET new_rank = old_rank + (-1)*@moveCount % @groupCount WHERE group_id = $groupId;
			UPDATE tmp_rank
			SET new_rank = CASE WHEN new_rank > @groupCount
									THEN new_rank - @groupCount
									WHEN new_rank < 1
									THEN new_rank + @groupCount
									ELSE new_rank
								END
			WHERE group_id = $groupId;

			#SELECT * FROM tmp_rank;
			# 备份关联用
			DROP TEMPORARY TABLE IF EXISTS tmp_rank2;
			CREATE TEMPORARY TABLE tmp_rank2(SELECT * FROM tmp_rank);

			DROP TEMPORARY TABLE IF EXISTS tmp_rank3;
			CREATE TEMPORARY TABLE tmp_rank3(SELECT t1.id as old_id, t2.id as new_id FROM tmp_rank t1, tmp_rank2 t2 WHERE t1.new_rank = t2.old_rank);
			
			#SELECT * FROM tmp_rank3;
			-- 更新班次
			IF @serialShiftId = 0 THEN
				UPDATE tmp_group_member t1, tmp_rank3 t2, tmp_group_member2 t3
				SET t1.serial_id = t3.serial_id
				WHERE t1.group_id = $groupId AND t1.id = t2.old_id AND t2.new_id = t3.id;
			END IF;
	
			-- 更新司机
			IF @serialShiftId = 1 THEN
				UPDATE tmp_group_member t1, tmp_rank3 t2, tmp_group_member2 t3
				SET t1.first_emp_id = t3.first_emp_id,
					t1.first_emp_name = t3.first_emp_name,
					t1.second_emp_id = t3.second_emp_id,
					t1.second_emp_name = t3.second_emp_name
				WHERE t1.group_id = $groupId AND t1.id = t2.new_id AND t2.old_id = t3.id;
			END IF;

		END LOOP;
		-- 关闭游标
		CLOSE my_cur;
	END;
	
	#更新排班
	UPDATE schedule_master t1, tmp_group_member t2
	SET t1.first_car_id = t2.first_car_id,
			t1.first_car_name = t2.first_car_name,
			t1.first_emp_id = t2.first_emp_id,
			t1.first_emp_name = t2.first_emp_name,
			t1.first_conductor_id = t2.first_conductor_id,
			t1.first_conductor_name = t2.first_conductor_name,
			t1.second_car_id = t2.second_car_id,
			t1.second_car_name = t2.second_car_name,
			t1.second_emp_id = t2.second_emp_id,
			t1.second_emp_name = t2.second_emp_name,
			t1.second_conductor_id = t2.second_conductor_id,
			t1.second_conductor_name = t2.second_conductor_name
	WHERE t1.company_id = $companyId
		AND t1.route_id = $routeId
		AND t1.work_date = $workDate
		AND t1.serial = t2.serial_id
		AND t1.is_deleted = 0;

	INSERT INTO schedule_master(
			company_id, work_date, scheme_id, route_id, serial, class_type,
			first_car_id, first_emp_id, first_emp_name, first_conductor_id, first_conductor_name,
			second_car_id, second_emp_id, second_emp_name, second_conductor_id, second_conductor_name
	)
	SELECT $companyId, $workDate, $schemeId, $routeId, serial_id, serial_type,
				 first_car_id, first_emp_id, first_emp_name, first_conductor_id, first_conductor_name,
				 second_car_id, second_emp_id, second_emp_name, second_conductor_id, second_conductor_name
	FROM tmp_group_member
	WHERE serial_id = 0;
	
	# 纠正线路名称
	UPDATE schedule_master t1, basic_route t2
	SET t1.route_name = t2.route_name
	WHERE t1.company_id = t2.company_id
		AND t1.company_id = $companyId
		AND t1.route_id = t2.route_id
		AND t1.route_id = $routeId
		AND t1.work_date = $workDate
		AND t1.is_deleted = 0;
	
	# 纠正线路名称
	UPDATE schedule_master t1, scheme_master t2
	SET t1.scheme_name = t2.scheme_name
	WHERE t1.company_id = t2.company_id
		AND t1.company_id = $companyId
		AND t1.route_id = t2.route_id
		AND t1.scheme_id = t2.scheme_id
		AND t1.route_id = $routeId
		AND t1.work_date = $workDate
		AND t1.is_deleted = 0;	
	
END
;;
delimiter ;

-- ----------------------------
-- Event structure for event_create_partition
-- ----------------------------
DROP EVENT IF EXISTS `event_create_partition`;
delimiter ;;
CREATE EVENT `event_create_partition`
ON SCHEDULE
EVERY '1' DAY STARTS '2020-05-16 20:00:00'
ON COMPLETION PRESERVE
DO BEGIN
	-- 定时创建分区表
	CALL create_partition_by_month('cbus', 'device_position');
	CALL create_partition_by_month('gps', 'device_position');
	# 进出站
	CALL create_partition_by_month('cbus', 'device_depart_arrive');
	CALL create_partition_by_month('gps', 'device_depart_arrive');
	# 报警表
	CALL create_partition_by_month('cbus', 'device_alarm');
	CALL create_partition_by_month('gps', 'device_alarm');
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
