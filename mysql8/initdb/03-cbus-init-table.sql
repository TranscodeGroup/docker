/*
 Navicat Premium Data Transfer

 Source Server         : 58.82.168.197-泰国CI服务器
 Source Server Type    : MySQL
 Source Server Version : 80405 (8.4.5)
 Source Host           : 127.0.0.1:9063
 Source Schema         : cbus

 Target Server Type    : MySQL
 Target Server Version : 80405 (8.4.5)
 File Encoding         : 65001

 Date: 06/11/2025 10:09:33
*/

-- 创建cbus数据库
CREATE DATABASE IF NOT EXISTS cbus DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE cbus;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for basic_ad_banner
-- ----------------------------
DROP TABLE IF EXISTS `basic_ad_banner`;
CREATE TABLE `basic_ad_banner`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公交公司id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `link` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容链接',
  `is_show` int NOT NULL DEFAULT 0 COMMENT '是否展示，0不展示，1展示',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `release_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_ad_passenger_info
-- ----------------------------
DROP TABLE IF EXISTS `basic_ad_passenger_info`;
CREATE TABLE `basic_ad_passenger_info`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公交公司id',
  `template_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板名称',
  `info_serial` int NOT NULL DEFAULT 0 COMMENT '取值范围1～10',
  `info_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '信息内容 最长1024',
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `info_priority` int NOT NULL DEFAULT 0 COMMENT '信息优先级',
  `display_method` int NOT NULL DEFAULT 0 COMMENT '表47 信息显示方式',
  `display_position` int NOT NULL DEFAULT 0 COMMENT '表48 信息显示位置定义',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_ad_passenger_publish
-- ----------------------------
DROP TABLE IF EXISTS `basic_ad_passenger_publish`;
CREATE TABLE `basic_ad_passenger_publish`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公交公司id',
  `template_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板名称',
  `template_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板名称',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '取值范围1～10',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '终端IMEI  自定义输入 不通过系统编码',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路名称',
  `published_status` int NOT NULL DEFAULT 0 COMMENT '发布状态 1发布中  2成功 3失败',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_ad_passenger_template
-- ----------------------------
DROP TABLE IF EXISTS `basic_ad_passenger_template`;
CREATE TABLE `basic_ad_passenger_template`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公交公司id',
  `template_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板名称',
  `template_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板名称',
  `template_type` int NOT NULL DEFAULT 0 COMMENT '1预置信息 2即时信息',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_alarm_device
-- ----------------------------
DROP TABLE IF EXISTS `basic_alarm_device`;
CREATE TABLE `basic_alarm_device`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_alarm_id` int NOT NULL COMMENT '报警类型 前端输入 校验唯一',
  `device_alarm_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `platform_alarm_id` int NULL DEFAULT NULL COMMENT '对应平台报警ID',
  `protocol` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '协议名称',
  `sort_id` int NULL DEFAULT NULL COMMENT '排序字段',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ak_aid`(`device_alarm_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_alarm_platform
-- ----------------------------
DROP TABLE IF EXISTS `basic_alarm_platform`;
CREATE TABLE `basic_alarm_platform`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `platform_alarm_id` int NOT NULL COMMENT '报警类型 前端输入 校验唯一',
  `platform_alarm_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id` int NULL DEFAULT NULL COMMENT '报警分组ID',
  `sort_id` int NULL DEFAULT NULL COMMENT '排序字段',
  `push_name_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `push_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `push_name_th` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `turn_off_push` int NULL DEFAULT 0 COMMENT '是否关闭报警0开启 1关闭',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ak_aid`(`platform_alarm_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_announcement
-- ----------------------------
DROP TABLE IF EXISTS `basic_announcement`;
CREATE TABLE `basic_announcement`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公交公司id',
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发布者',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告内容',
  `is_show` int NOT NULL DEFAULT 0 COMMENT '是否展示，0不展示，1展示',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `release_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日期',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建账号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_announcement_flag
-- ----------------------------
DROP TABLE IF EXISTS `basic_announcement_flag`;
CREATE TABLE `basic_announcement_flag`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `announcement_id` int NOT NULL DEFAULT 0 COMMENT '公告id',
  `user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_busstop
-- ----------------------------
DROP TABLE IF EXISTS `basic_busstop`;
CREATE TABLE `basic_busstop`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `stop_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自编码',
  `stop_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站台编号',
  `stop_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站台名称',
  `state` int NOT NULL DEFAULT 0 COMMENT '0暂未开通 10运营 20停运',
  `lng` decimal(10, 6) NULL DEFAULT 0.000000 COMMENT '站台经纬度',
  `lat` decimal(10, 6) NULL DEFAULT 0.000000 COMMENT '站台经纬度',
  `azimuth` smallint NULL DEFAULT 0 COMMENT '方位角',
  `icon` int NULL DEFAULT 0 COMMENT '图标 0默认站台 1BRT站台 2船舶',
  `img_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站台图片URL',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `nearby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '靠近位置',
  `open_time` datetime NULL DEFAULT NULL COMMENT '开通时间',
  `stop_time` datetime NULL DEFAULT NULL COMMENT '停运时间',
  `goby` int NULL DEFAULT 0 COMMENT '途径线路',
  `is_share` tinyint NOT NULL DEFAULT 0 COMMENT '企业内共享 0私有 1公用',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_stop_id`(`stop_id` ASC) USING BTREE,
  UNIQUE INDEX `uk_stop_code`(`company_id` ASC, `stop_code` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `idx_stop`(`company_id` ASC, `stop_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_car
-- ----------------------------
DROP TABLE IF EXISTS `basic_car`;
CREATE TABLE `basic_car`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '自编号码',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `car_state` smallint NOT NULL DEFAULT 0 COMMENT '状态 0正常 10维修  20扣车 100报废',
  `vin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆识别代码',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `lpn_color` int NULL DEFAULT 9 COMMENT '车牌颜色 1蓝色 2黄色 3黑色 4白色 9其他',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '企业内组织分组',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路',
  `img_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/file/static/images/image-48.png' COMMENT '车辆图片',
  `icon` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'bus' COMMENT '图标索引',
  `register_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登记日期',
  `expire_time` datetime NOT NULL COMMENT '平台到期时间',
  `expire_verify` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过期验证',
  `approved_number` int NULL DEFAULT 50 COMMENT '核载人数',
  `fuel_km` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '百公里耗油',
  `fuel_hours` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '每小时油耗',
  `fuel_tank` decimal(11, 3) NULL DEFAULT 60.000 COMMENT '油箱容量',
  `iode_fine` varchar(368) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IO自定义',
  `has_ac` int NOT NULL DEFAULT 0 COMMENT '是否空调车',
  `mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '里程 km',
  `contract_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `equipment_count` int NULL DEFAULT 0 COMMENT '车速安装设备数量',
  `seat_map` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '座位表[z1-x1-y1, z2-x2-y2]',
  `vehicle_provider` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆供应商',
  `vehicle_type_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车型',
  `vehicle_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车型，车辆标准',
  `vehicle_source` int NOT NULL DEFAULT 0 COMMENT '车辆来源 0购买 1租赁',
  `fixed_emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '固定驾驶员编号',
  `fixed_emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '固定驾驶员姓名',
  `driving_license_time` datetime NULL DEFAULT NULL COMMENT '行驶证到期时间',
  `compulsory_insurance_time` datetime NULL DEFAULT NULL COMMENT '交强险到期时间',
  `commercial_insurance_time` datetime NULL DEFAULT NULL COMMENT '商业保险时间',
  `next_inspection_time` datetime NULL DEFAULT NULL COMMENT '下一次年检时间',
  `next_maintenance_time` datetime NULL DEFAULT NULL COMMENT '下一次保养时间',
  `registration_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '车辆注册号',
  `vehicle_model` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆型号(泰国项目)',
  `tax_due_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纳税到期日',
  `contract_expiration_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同到期日',
  `unit_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '序列号',
  `vehicle_options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '车辆附加信息JSON等',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_car_id`(`car_id` ASC) USING BTREE,
  UNIQUE INDEX `uk_car_name`(`company_id` ASC, `car_name` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `idx_car`(`company_id` ASC, `car_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_car_insurance
-- ----------------------------
DROP TABLE IF EXISTS `basic_car_insurance`;
CREATE TABLE `basic_car_insurance`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车辆保险',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '自编号码',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `vin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆识别代码',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车牌号码 License Plate Number',
  `effective_time` datetime NOT NULL COMMENT '发证时间',
  `expire_time` datetime NOT NULL COMMENT '到期时间',
  `insurance_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '保险单号',
  `insurance_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '保险类型',
  `insurance_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保险公司',
  `agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理人',
  `phone_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保险联系电话',
  `original_price` decimal(11, 3) NULL DEFAULT NULL COMMENT '原保险价格',
  `discount` decimal(10, 0) NULL DEFAULT NULL COMMENT '折扣',
  `actual_price` decimal(11, 3) NULL DEFAULT NULL COMMENT '实际保险价格',
  `insurance_claims` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保险理赔',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_car`(`company_id` ASC, `car_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_car_license
-- ----------------------------
DROP TABLE IF EXISTS `basic_car_license`;
CREATE TABLE `basic_car_license`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车辆行驶证',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `vin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆识别代码',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '自编号码',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车牌号码 License Plate Number',
  `lpn_color` int NOT NULL DEFAULT 1 COMMENT '车牌颜色 1蓝色 2黄色 3黑色 4白色 9其他',
  `engine_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行驶证号',
  `effective_time` datetime NOT NULL COMMENT '发证时间',
  `expire_time` datetime NOT NULL COMMENT '到期时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_car`(`company_id` ASC, `car_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_car_renewal
-- ----------------------------
DROP TABLE IF EXISTS `basic_car_renewal`;
CREATE TABLE `basic_car_renewal`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车辆行驶证',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '自编号码',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `lpn_color` int NULL DEFAULT 1 COMMENT '车牌颜色 1蓝色 2黄色 3黑色 4白色 9其他',
  `vin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆识别代码',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业内组织分组',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '公司或车队名称',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '线路名称',
  `renewal_duration` int NOT NULL COMMENT '续约时长月份',
  `expire_time_before` datetime NOT NULL COMMENT '到期时间',
  `expire_time_after` datetime NOT NULL COMMENT '到期时时(续期后)',
  `cost` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '单个车辆支付金额',
  `total_cost` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '总支付金额',
  `renewal_status` smallint NOT NULL DEFAULT 0 COMMENT '0创建 1已审批 2已取消',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `review_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核用户ID',
  `review_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order`(`order_id` ASC, `car_id` ASC) USING BTREE,
  UNIQUE INDEX `uk_expire_time`(`car_id` ASC, `company_id` ASC, `expire_time_before` ASC, `renewal_duration` ASC) USING BTREE,
  INDEX `idx_order`(`company_id` ASC, `order_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_car_type
-- ----------------------------
DROP TABLE IF EXISTS `basic_car_type`;
CREATE TABLE `basic_car_type`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公交公司id',
  `vehicle_type_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车型ID',
  `vehicle_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车型描述',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_vehicle_type`(`company_id` ASC, `vehicle_type_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_device
-- ----------------------------
DROP TABLE IF EXISTS `basic_device`;
CREATE TABLE `basic_device`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '102' COMMENT '企业id',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '终端IMEI  自定义输入 不通过系统编码',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组id 关联t_group',
  `type_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备类型 关联t_devtype表',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `register_time` datetime NULL DEFAULT NULL COMMENT '激活日期',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '到期时间',
  `time_zone` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '+08:00' COMMENT '设备台账时区',
  `character_set` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'GBK' COMMENT '字符集GBK或UTF-8',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '通道列表',
  `is_slave` tinyint NULL DEFAULT 0 COMMENT '是否备机',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `firmware` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '固件版本, 公交平台固件+报站文件版本',
  `version_no` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '一般用于存储从设备,比如DVR的版本',
  `ban_hint` int NOT NULL DEFAULT 0 COMMENT '过期提示 0表提示 1表禁用提示',
  `bind_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '绑定账号',
  `connect_state` int NULL DEFAULT 0 COMMENT '连接状态 0离线  1在线',
  `first_connect_time` datetime NULL DEFAULT NULL COMMENT '第一次连接时间',
  `last_connect_time` datetime NULL DEFAULT NULL COMMENT '最后连接时间',
  `attached` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加JSON',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`imei` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `idx_imei`(`company_id` ASC, `imei` ASC) USING BTREE,
  INDEX `idx_car`(`company_id` ASC, `car_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_device_compose
-- ----------------------------
DROP TABLE IF EXISTS `basic_device_compose`;
CREATE TABLE `basic_device_compose`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车辆上安装的设备列表',
  `imei` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备唯一码, 过渡32, 实际很多表都还是16',
  `device_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备的唯一标识, 制造商|型号|终端ID',
  `register_producer_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端注册-制造商ID',
  `register_terminal_model` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端注册-终端型号',
  `register_terminal_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端注册-终端ID',
  `first_connect_time` datetime NULL DEFAULT NULL COMMENT '第一次连接时间',
  `last_connect_time` datetime NULL DEFAULT NULL COMMENT '最后连接时间',
  `last_connect_protocol` int NULL DEFAULT NULL COMMENT '最后连接使用的协议',
  `last_disconnect_time` datetime NULL DEFAULT NULL COMMENT '最后断开时间',
  `version_no` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端属性版本',
  `version_time` datetime NULL DEFAULT NULL COMMENT '终端属性最后读取时间',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '102' COMMENT '归属企业ID',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_device_key`(`imei` ASC, `device_key` ASC) USING BTREE,
  INDEX `idx_imei`(`imei` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车上安装设备表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_device_request
-- ----------------------------
DROP TABLE IF EXISTS `basic_device_request`;
CREATE TABLE `basic_device_request`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '司机手动命令',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `request_code` int NOT NULL COMMENT '终端司机请求命令ID',
  `request_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '终端司机请求命令名称',
  `event_code` int NOT NULL COMMENT '事件代码',
  `bind_run_state` int NOT NULL DEFAULT 0 COMMENT '事件代码=其他的时候, 绑定的车辆运营状态',
  `bind_task_state` int NOT NULL DEFAULT 0 COMMENT '事件代码=其他的时候, 绑定的车辆任务状态',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端司机请求命令名称',
  `function_key` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '功能键 F8  F9',
  `hot_key` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快捷键 F0~F7',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '逻辑删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_device_type
-- ----------------------------
DROP TABLE IF EXISTS `basic_device_type`;
CREATE TABLE `basic_device_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一编码',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '终端型号',
  `factory` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备生产厂商',
  `protocol` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通讯协议类型',
  `support` int NULL DEFAULT 255 COMMENT '支持功能 低位 第1位在线 2定位 3ACC 4外接电源',
  `img_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'motor/static/images/image-48.png' COMMENT '设备类型图片',
  `sort_id` int NULL DEFAULT 100 COMMENT '排序',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `tags` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '固件过滤标签',
  `notice` smallint NULL DEFAULT 0 COMMENT '1控制指令升级 2通过远程升级通知升级 100自定义',
  `two_in_one` int NOT NULL DEFAULT 0 COMMENT '二合一设备',
  `alarm_mapping` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主动安全报警映射',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_type`(`type_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_display
-- ----------------------------
DROP TABLE IF EXISTS `basic_display`;
CREATE TABLE `basic_display`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `display_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '显示屏ID,和IMEI一样手工输入',
  `display_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '显示屏名称',
  `display_state` int NOT NULL DEFAULT 0 COMMENT '0暂未开通 10开通 20维护',
  `display_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子站牌类型',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `stop_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安装的站台',
  `region_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应自定义区域ID',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '站台经纬度',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '站台经纬度',
  `img_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子站牌图片URL',
  `install_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安装时间',
  `next_maintain_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下一次维护日期',
  `next_maintain_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下一次维护内容',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_display_id`(`company_id` ASC, `display_id` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_display_ad
-- ----------------------------
DROP TABLE IF EXISTS `basic_display_ad`;
CREATE TABLE `basic_display_ad`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '父标题',
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子标题',
  `display_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指定电子站牌ID',
  `is_published` smallint NOT NULL DEFAULT 0 COMMENT '已发布 1已发布 0未发布',
  `publish_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`publish_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_display_maintain
-- ----------------------------
DROP TABLE IF EXISTS `basic_display_maintain`;
CREATE TABLE `basic_display_maintain`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `display_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '显示屏ID,和IMEI一样手工输入',
  `maintain_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '维护内容',
  `maintain_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '维护时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_display_date`(`display_id` ASC, `maintain_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_display_route
-- ----------------------------
DROP TABLE IF EXISTS `basic_display_route`;
CREATE TABLE `basic_display_route`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `display_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '显示屏ID,和IMEI一样手工输入',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '显示屏名称',
  `direction` int NULL DEFAULT 0 COMMENT '方向 0全部 1上行 2下行 3环线',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_display_id`(`company_id` ASC, `display_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_employee
-- ----------------------------
DROP TABLE IF EXISTS `basic_employee`;
CREATE TABLE `basic_employee`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `nick_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `emp_type` smallint NOT NULL DEFAULT 1 COMMENT '员工类型 0默认1 驾驶员 2乘务员 3站务',
  `emp_state` smallint NULL DEFAULT 0 COMMENT '状态 0在职 10请假  100离职',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队 关联t_fleet',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路 关联t_route',
  `quit_time` datetime NULL DEFAULT NULL COMMENT '停职时间',
  `entry_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入职时间',
  `personal` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `birthday` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `sex` int NULL DEFAULT NULL COMMENT '性别 0未知 1男 2女',
  `license` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶证',
  `category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶证类型',
  `expire` datetime NULL DEFAULT NULL COMMENT '驾驶证有效期',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `img_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `spell` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首字母拼写',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `emp_provider` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方服务企业',
  `open_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开放平台ID',
  `is_deleted` int NULL DEFAULT 0 COMMENT '逻辑删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_emp`(`company_id` ASC, `emp_id` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_employee_card
-- ----------------------------
DROP TABLE IF EXISTS `basic_employee_card`;
CREATE TABLE `basic_employee_card`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `card_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物理卡号',
  `physical_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物理卡号',
  `register_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '逻辑删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_emp`(`company_id` ASC, `card_id` ASC, `is_deleted` ASC) USING BTREE,
  UNIQUE INDEX `uk_physical`(`company_id` ASC, `physical_number` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_fault_area
-- ----------------------------
DROP TABLE IF EXISTS `basic_fault_area`;
CREATE TABLE `basic_fault_area`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司ID',
  `area_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域ID',
  `area_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域名称',
  `parent_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主区域ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_fault_area`(`company_id` ASC, `area_id` ASC, `parent_id` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_fault_description
-- ----------------------------
DROP TABLE IF EXISTS `basic_fault_description`;
CREATE TABLE `basic_fault_description`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司ID',
  `module_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块ID',
  `module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块名称',
  `parent_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主模块ID',
  `is_deleted` int NULL DEFAULT 0,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_fault_description`(`company_id` ASC, `module_id` ASC, `parent_id` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_fault_history
-- ----------------------------
DROP TABLE IF EXISTS `basic_fault_history`;
CREATE TABLE `basic_fault_history`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自编号',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `event_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据编号',
  `fault_status` int NULL DEFAULT NULL COMMENT '状态 0=创建, 1=审核, 2=确认, 3=指派, 4=误报, 5=解决, 255=关闭',
  `history_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主标签',
  `history_children` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签明细',
  `is_deleted` int NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_history`(`company_id` ASC, `event_id` ASC, `fault_status` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_fault_part
-- ----------------------------
DROP TABLE IF EXISTS `basic_fault_part`;
CREATE TABLE `basic_fault_part`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fault_part_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fault_part_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_deleted` int NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_part`(`company_id` ASC, `fault_part_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_fault_repair
-- ----------------------------
DROP TABLE IF EXISTS `basic_fault_repair`;
CREATE TABLE `basic_fault_repair`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `event_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '事件编号',
  `fault_type` int NOT NULL COMMENT '故障类型',
  `description_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障描述ID',
  `description_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障描述',
  `module_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主模块ID',
  `module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主模块名称',
  `sub_module_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子模块ID',
  `sub_module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子模块名称',
  `current_assignment` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前指派ID',
  `current_assignment_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前指派人名称',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域ID',
  `fleet_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  `sub_fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子区域ID',
  `sub_fleet_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子区域名称',
  `fault_status` int NULL DEFAULT 0 COMMENT '状态 0=创建, 1=审核, 2=确认, 3=指派, 4=误报, 5=解决, 255=关闭',
  `repair_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报修人ID',
  `repair_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报修人名称',
  `repair_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '报修时间',
  `parking_space` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '停车位',
  `residence_time` datetime NULL DEFAULT NULL COMMENT '停留时间',
  `parking_time` datetime NULL DEFAULT NULL COMMENT '停车时间',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `steps_reproduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重现步骤',
  `attachment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件',
  `file_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件文件名称',
  `fault_part_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障部件',
  `fault_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障原因',
  `resolution_time` datetime NULL DEFAULT NULL COMMENT '解决时间',
  `fault_solution_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '解决方案',
  `fault_solution_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '解决方案名称',
  `close_time` datetime NULL DEFAULT NULL COMMENT '关闭时间',
  `history_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '历史记录',
  `report_type` smallint NULL DEFAULT 0 COMMENT '报告上报类型 0=内部，1=外部',
  `description_type` smallint NULL DEFAULT 0 COMMENT '故障描述类型 0=控制室，1=车上的设备',
  `fault_solution_status` smallint NULL DEFAULT 0 COMMENT '解决状态 0=正常或未处理，1=已解决',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_fault_repair`(`company_id` ASC, `event_id` ASC, `create_time` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_fault_solution
-- ----------------------------
DROP TABLE IF EXISTS `basic_fault_solution`;
CREATE TABLE `basic_fault_solution`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fault_solution_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fault_solution_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_deleted` int NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_solution`(`company_id` ASC, `fault_solution_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_file_category
-- ----------------------------
DROP TABLE IF EXISTS `basic_file_category`;
CREATE TABLE `basic_file_category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公交公司id',
  `group_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组id',
  `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类别编码',
  `category_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类别名称',
  `parent_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级编码',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户名称',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_file_info
-- ----------------------------
DROP TABLE IF EXISTS `basic_file_info`;
CREATE TABLE `basic_file_info`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公交公司id',
  `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类别编码',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `file_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件url',
  `file_size` int NULL DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户名称',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_firmware
-- ----------------------------
DROP TABLE IF EXISTS `basic_firmware`;
CREATE TABLE `basic_firmware`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `firmware_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '固件ID',
  `firmware_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '固件名称',
  `firmware_type` smallint NOT NULL DEFAULT 0 COMMENT '固件类型 1固件 2报站文件 3系统配置',
  `firmware_version` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '版本号',
  `firmware_tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '固件标签，采用;分割',
  `notice_type` smallint NOT NULL DEFAULT 0 COMMENT '对应设备类型 1控制指令升级 2通过远程升级通知升级 50文本升级 100自定义',
  `notify_type` int NOT NULL DEFAULT 1 COMMENT '1文件升级  2文本通知',
  `file_dir` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '/files/ota/bus/' COMMENT '文件目录',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'FTP文件名称',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报站文件车队id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `ota_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文本升级，升级类型=文本的时候生效',
  `device_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '2合1设备, 同IMEI设备过滤项, ITS MDVR等',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记,删除改ID',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_firmware`(`firmware_id` ASC) USING BTREE,
  INDEX `uk_cid_firmware`(`company_id` ASC, `firmware_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_firmware_ota
-- ----------------------------
DROP TABLE IF EXISTS `basic_firmware_ota`;
CREATE TABLE `basic_firmware_ota`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备ID',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路名称',
  `notice_type` smallint NOT NULL DEFAULT 0 COMMENT '对应设备类型 1控制指令升级 2通过远程升级通知升级 50文本升级 100自定义',
  `ota_state` smallint NOT NULL DEFAULT 0 COMMENT '-1已取消 0未执行 1执行中 2已完成 3失败',
  `progress_code` int NULL DEFAULT 0 COMMENT '当前进度状态码',
  `ota_progress` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前进度',
  `firmware_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '固件ID',
  `firmware_version` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `firmware_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '固件名称',
  `firmware_type` smallint NOT NULL DEFAULT 0 COMMENT '固件类型 1固件 2报站文件',
  `file_dir` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '/bus/' COMMENT '文件目录',
  `ota_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文本升级，升级类型=文本的时候生效',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `device_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '2合1设备, 同IMEI设备过滤项, ITS MDVR等',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记,删除改ID',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_firmware_ota`(`company_id` ASC, `is_deleted` ASC, `imei` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_fleet
-- ----------------------------
DROP TABLE IF EXISTS `basic_fleet`;
CREATE TABLE `basic_fleet`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID/分组ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司或车队名称',
  `parent_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父组织ID',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'al-icon-genderless' COMMENT '图标',
  `category` int NOT NULL DEFAULT 0 COMMENT '0 默认 1总公司 2分公司 3车队 4调度站 100调度中心 200其他',
  `computer_count` int NULL DEFAULT 0 COMMENT '调度室电脑数量',
  `sort_id` int NULL DEFAULT 100,
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`company_id` ASC, `fleet_name` ASC) USING BTREE,
  UNIQUE INDEX `uk_id`(`fleet_id` ASC) USING BTREE,
  INDEX `idx_fleet`(`company_id` ASC, `fleet_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_illegal_score
-- ----------------------------
DROP TABLE IF EXISTS `basic_illegal_score`;
CREATE TABLE `basic_illegal_score`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `illegal_type` int NOT NULL DEFAULT 0 COMMENT '违规类型',
  `reduce_score` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '一次违规扣分多少',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '违规扣分配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_lost_found
-- ----------------------------
DROP TABLE IF EXISTS `basic_lost_found`;
CREATE TABLE `basic_lost_found`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '失物id',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公交公司id',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失物图片',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布失物标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布失物内容',
  `is_show` int NOT NULL DEFAULT 0 COMMENT '是否展示，0不展示，1展示',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '完结删除标记',
  `release_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日期',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_maintain
-- ----------------------------
DROP TABLE IF EXISTS `basic_maintain`;
CREATE TABLE `basic_maintain`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车辆保养',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `maintain_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '保养编码',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路名称',
  `maintain_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '保养时间',
  `maintain_mileage` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '保养里程',
  `next_interval_month` smallint NOT NULL DEFAULT 3 COMMENT '下一次间隔(月份）',
  `next_interval_mileage` decimal(10, 3) NOT NULL DEFAULT 5000.000 COMMENT '下一次间隔里程(公里)',
  `remind_status` int NOT NULL DEFAULT 0 COMMENT '0不提醒 1提醒',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_car`(`company_id` ASC, `car_id` ASC) USING BTREE,
  INDEX `idx_maintain`(`company_id` ASC, `maintain_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_maintain_item
-- ----------------------------
DROP TABLE IF EXISTS `basic_maintain_item`;
CREATE TABLE `basic_maintain_item`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车辆保养',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `maintain_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '保养编码',
  `maintain_item` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '维护内容',
  `maintain_cost` decimal(10, 3) NOT NULL DEFAULT 0.000 COMMENT '维护费用',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_maintain`(`company_id` ASC, `maintain_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_region
-- ----------------------------
DROP TABLE IF EXISTS `basic_region`;
CREATE TABLE `basic_region`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `region_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自编码',
  `region_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站台名称',
  `region_code` int NULL DEFAULT NULL COMMENT '定点编号',
  `region_type` int NOT NULL DEFAULT 0 COMMENT '0POI 1圆 2矩形 3多边形 4路径点',
  `region_category` smallint NOT NULL DEFAULT 0 COMMENT '0常规 10行政区域 ',
  `use_type` smallint NOT NULL DEFAULT 0 COMMENT '区域用途，0默认1停车场2加油充电站3维修点',
  `center_lat` decimal(10, 6) NOT NULL COMMENT '中心点经纬度',
  `center_lng` decimal(10, 6) NOT NULL COMMENT '中心点经纬度',
  `icon` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标索引',
  `img_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `region_point` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径点 lat1,lng1|lat2,lng2',
  `region_option` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自定义样式，json字符串',
  `is_share` tinyint NOT NULL DEFAULT 0 COMMENT '企业内共享 0私有 1公用',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_region_rule
-- ----------------------------
DROP TABLE IF EXISTS `basic_region_rule`;
CREATE TABLE `basic_region_rule`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '禁入，禁出等',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `rule_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rule_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rule_type` int NOT NULL DEFAULT 0 COMMENT '10禁止进入 20禁止出去 30区域限速 40停车超时',
  `rule_option` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT 'rule_type的二级选项',
  `region_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '映射basic_region表',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_stop`(`company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_region_rule_car
-- ----------------------------
DROP TABLE IF EXISTS `basic_region_rule_car`;
CREATE TABLE `basic_region_rule_car`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `rule_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_stop`(`company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_route
-- ----------------------------
DROP TABLE IF EXISTS `basic_route`;
CREATE TABLE `basic_route`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路id',
  `route_code` int NOT NULL COMMENT '线路编码',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路名称',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车队ID',
  `subsidiary_fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级分公司级别车队ID,映射车队表',
  `way_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点方案',
  `state` int NOT NULL DEFAULT 0 COMMENT '0暂未开通 10运营 20停运',
  `category` smallint NOT NULL DEFAULT 0 COMMENT '线路类别,0双向线路 1单向环线 2双向环线',
  `travel` smallint NOT NULL DEFAULT 0 COMMENT '行驶类型 0全部站点 1支线 2区间 3大站',
  `ticket` smallint NOT NULL DEFAULT 0 COMMENT '0无人售票 1有人售票',
  `trunk` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区间大站支线时对应主线',
  `loop_default_value` int NULL DEFAULT 1 COMMENT '环线默认值1, 可选项1上行, 2下行, 3环线',
  `open_time` datetime NULL DEFAULT NULL COMMENT '线路第一次建立时间',
  `stop_time` datetime NULL DEFAULT NULL COMMENT '停运时间',
  `sort_id` int NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`route_id` ASC) USING BTREE,
  INDEX `uk_name`(`company_id` ASC, `route_name` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_route_change
-- ----------------------------
DROP TABLE IF EXISTS `basic_route_change`;
CREATE TABLE `basic_route_change`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路名称',
  `route_code` int NOT NULL COMMENT '线路编码',
  `state` int NOT NULL DEFAULT 0 COMMENT '0暂未开通 10运营 20停运 100关闭',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_route_control
-- ----------------------------
DROP TABLE IF EXISTS `basic_route_control`;
CREATE TABLE `basic_route_control`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '调度台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `control_bit` int NOT NULL DEFAULT 0 COMMENT '控制位 换线|切换运营|计划到车辆|计划到调度屏|下发文本',
  `is_depart_check` smallint NOT NULL DEFAULT 1 COMMENT '是否发车考核',
  `depart_allow_fast` int NOT NULL DEFAULT 2 COMMENT '发车允许快2分钟',
  `depart_allow_slow` int NOT NULL DEFAULT 3 COMMENT '发车允许慢3分钟',
  `plan_send_early` int NOT NULL DEFAULT 15 COMMENT '提前15min下发计划',
  `sign_in_change_vehicle` int NOT NULL DEFAULT 0 COMMENT '签到更换司机计划到新车辆',
  `sign_in_change_driver` int NOT NULL DEFAULT 0 COMMENT '签到车辆更新新司机',
  `auto_handle_request` int NOT NULL DEFAULT 1 COMMENT '自动处理司机请求',
  `sign_in_advance_time` int NOT NULL DEFAULT 0 COMMENT '签到提前多少分钟提醒,0不提醒',
  `plan_notice_attach` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下发计划附加信息',
  `plan_notice_text` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下发计划附加信息',
  `plan_cancel_attach` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取消计划附加信息',
  `plan_cancel_text` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取消计划追加文本信息',
  `check_in_text` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到追加文本',
  `check_out_text` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签退追加文本',
  `request_agree_text` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '司机请求同意文本应答',
  `request_reject_text` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '司机请求拒绝文本应答',
  `check_in_create_plan` int NOT NULL DEFAULT 0 COMMENT '签到自动创建计划',
  `middle_station_create_plan` int NOT NULL DEFAULT 0 COMMENT '中间站点允许补传自动创建计划',
  `min_stop_minute` int NULL DEFAULT 1 COMMENT '终点最小停留时长',
  `min_departure_long` int NULL DEFAULT 10 COMMENT '最小发车时长',
  `max_departure_long` int NULL DEFAULT 20 COMMENT '最大发车时长',
  `nearby_field` decimal(11, 1) NULL DEFAULT 0.5 COMMENT '场站附近范围',
  `auto_agree_request` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自动同意参数',
  `station_completion_rate` int NULL DEFAULT 0 COMMENT '站点完成率0-100， 默认0不考核',
  `apply_time_max_delay_minutes` int NOT NULL DEFAULT 5 COMMENT '派班允许查找超时多少分钟的计划，默认最大允许超时5分钟',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `allow_move_serial` smallint NOT NULL DEFAULT 0 COMMENT '取消整班计划时，是否允许移动班次',
  `station_text` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Stop' COMMENT '站点文本',
  `station_on_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大站考核: 准点抵达@stationName!',
  `station_early` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大站考核: 提前@minute分钟抵达@stationName!',
  `station_late` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大站考核: 晚点@minute分钟抵达@stationName!',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`route_id` ASC) USING BTREE,
  INDEX `idx_service`(`company_id` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_route_direction
-- ----------------------------
DROP TABLE IF EXISTS `basic_route_direction`;
CREATE TABLE `basic_route_direction`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '线路行驶方向',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `way_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路站点方案',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路id',
  `direction` smallint NOT NULL COMMENT '方向 1上行 2下行',
  `origin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主站,站点导入时同步',
  `terminal` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '副站',
  `distance` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '全长km',
  `first_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '首班发车时间',
  `last_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '末班发车时间',
  `intervals` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发车间隔',
  `price` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '价格区间',
  `sort_id` int NULL DEFAULT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径点 lat1,lng1|lat2,lng2',
  `style` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自定义样式',
  `non_linear` decimal(11, 3) NULL DEFAULT NULL COMMENT '非直线系数',
  `avg_station_km` decimal(11, 3) NULL DEFAULT NULL COMMENT '平均站距',
  `station_count` int NULL DEFAULT NULL COMMENT '站点数量',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_direction`(`company_id` ASC, `way_id` ASC, `route_id` ASC, `direction` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `idx_way`(`way_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_route_station
-- ----------------------------
DROP TABLE IF EXISTS `basic_route_station`;
CREATE TABLE `basic_route_station`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站点',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `way_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路站点方案',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路自编码',
  `route_code` int NOT NULL COMMENT '线路id',
  `direction` smallint NOT NULL COMMENT '方向',
  `serial` smallint UNSIGNED NOT NULL COMMENT '站序，不能为负数',
  `station_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点名称',
  `abridge` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩写',
  `flag` smallint NOT NULL DEFAULT 0 COMMENT '0中间站 1起点 255终点',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `azimuth` smallint NULL DEFAULT NULL COMMENT '方位角',
  `distance` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '距离起点的距离km',
  `distance_previous` decimal(11, 3) NULL DEFAULT NULL COMMENT '与前一站的距离',
  `duration` int NULL DEFAULT 0 COMMENT '距离起点的时间,秒',
  `parking` int NULL DEFAULT 0 COMMENT '停车时长',
  `stop_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应站台id',
  `identifier` bigint NULL DEFAULT NULL COMMENT '标识符,创建的时间戳,废弃',
  `is_opposite` smallint NULL DEFAULT 0 COMMENT '单向环线标识为对边显示的站点',
  `previous_station_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前一站点名称',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_station`(`way_id` ASC, `route_id` ASC, `direction` ASC, `serial` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `idx_way`(`company_id` ASC, `way_id` ASC) USING BTREE,
  INDEX `idx_stop_id`(`company_id` ASC, `stop_id` ASC) USING BTREE,
  INDEX `idx_route_direction`(`company_id` ASC, `route_id` ASC, `direction` ASC, `way_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_route_way
-- ----------------------------
DROP TABLE IF EXISTS `basic_route_way`;
CREATE TABLE `basic_route_way`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '线路行驶方向',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路id',
  `route_code` int NULL DEFAULT NULL COMMENT '线路编码',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `way_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路方案ID',
  `way_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主站,站点导入时同步',
  `category` smallint NOT NULL DEFAULT 0 COMMENT '线路类别,0双向线路 1单向环线 2双向环线',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `check_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `active_time` datetime NULL DEFAULT NULL COMMENT '生效日期',
  `is_checked` int NOT NULL DEFAULT 0 COMMENT '审核',
  `is_actived` int NOT NULL DEFAULT 0 COMMENT '当前在用的',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_way_id`(`way_id` ASC) USING BTREE,
  INDEX `idx_route_id`(`company_id` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_safety_score
-- ----------------------------
DROP TABLE IF EXISTS `basic_safety_score`;
CREATE TABLE `basic_safety_score`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主动安全报警',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `alarm_type` int NOT NULL DEFAULT 0 COMMENT '报警/事件类型',
  `reduce_score1` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '一次违规扣分多少',
  `reduce_score2` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '一次违规扣分多少',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_company_id`(`company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主动安全报警扣分标准' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_sim
-- ----------------------------
DROP TABLE IF EXISTS `basic_sim`;
CREATE TABLE `basic_sim`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业',
  `sim_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT 'Sim卡唯一编码',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'sim卡手机号码',
  `iccid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'iccid',
  `register_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `installed_imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安装设备id',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_phone`(`phone` ASC) USING BTREE,
  UNIQUE INDEX `uk_iccid`(`iccid` ASC) USING BTREE,
  UNIQUE INDEX `uk_sim`(`sim_id` ASC) USING BTREE,
  INDEX `idx_sim`(`company_id` ASC, `sim_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_subscribe_car
-- ----------------------------
DROP TABLE IF EXISTS `basic_subscribe_car`;
CREATE TABLE `basic_subscribe_car`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subscribe_topic` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ADAS DSM等',
  `subscribe_type` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '具体的报警ID',
  `subscribe_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_stop`(`company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for basic_subscribe_topic
-- ----------------------------
DROP TABLE IF EXISTS `basic_subscribe_topic`;
CREATE TABLE `basic_subscribe_topic`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '禁入，禁出等',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `subscribe_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订阅自编码',
  `subscribe_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订阅名称',
  `subscribe_topic` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DSM' COMMENT '订阅主题 ADAS DSM等',
  `subscribe_type` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '主题对应的KEY集合，如主动安全的类型',
  `subscribe_lang` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'en' COMMENT '多语言 en zh th',
  `subscribe_emails` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'JSON格式订阅邮箱数组，最多10个',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_stop`(`company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for config_common_template
-- ----------------------------
DROP TABLE IF EXISTS `config_common_template`;
CREATE TABLE `config_common_template`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `template_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板ID',
  `template_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `server_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Json服务器信息',
  `maintenance_manage` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Json维护管理',
  `alarm_enable` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Json告警使能',
  `encode_param` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Json编码参数',
  `common_config` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Json通用配置',
  `driver_config` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Json司机配置',
  `screen_display` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JsonOSD参数设置',
  `system_config` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Json系统设置',
  `is_deleted` int NULL DEFAULT 0,
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '终端升级通用模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for config_field_station
-- ----------------------------
DROP TABLE IF EXISTS `config_field_station`;
CREATE TABLE `config_field_station`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `region_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域ID',
  `region_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  `region_type` int NULL DEFAULT NULL COMMENT '区域类型',
  `region_point` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径点',
  `is_deleted` int NULL DEFAULT 0,
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '终端升级的站场配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for config_remote_upgrade
-- ----------------------------
DROP TABLE IF EXISTS `config_remote_upgrade`;
CREATE TABLE `config_remote_upgrade`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `upgrade_content` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发布内容',
  `common_upgrade` smallint NULL DEFAULT NULL COMMENT '升级通用配置   0 升级， 1 不升级',
  `event_upgrade` smallint NULL DEFAULT NULL COMMENT '升级司机命令   0 升级， 1 不升级',
  `field_upgrade` smallint NULL DEFAULT NULL COMMENT '升级车场配置   0 升级， 1 不升级',
  `file_path` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本',
  `is_deleted` int NULL DEFAULT 0,
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '终端升级包发布记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for config_voice_basic
-- ----------------------------
DROP TABLE IF EXISTS `config_voice_basic`;
CREATE TABLE `config_voice_basic`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `voice_type` int NULL DEFAULT NULL COMMENT '类型',
  `voice_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `use_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用途',
  `use_type` int NULL DEFAULT NULL COMMENT '用途类型',
  `usefulness` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用途说明',
  `is_deleted` int NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '终端升级公共、站点基础配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for config_voice_library
-- ----------------------------
DROP TABLE IF EXISTS `config_voice_library`;
CREATE TABLE `config_voice_library`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `voice_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '语音文件ID',
  `voice_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '语音文件名称',
  `voice_type` smallint NOT NULL DEFAULT 0 COMMENT '语音类型 1公共语音 2站点语音 3线路语音',
  `language_type` smallint NOT NULL DEFAULT 0 COMMENT '语言类型 1普通话 2英语 3方言',
  `voice_format` smallint NOT NULL DEFAULT 0 COMMENT '音频格式 先默认0，0:wav, 1:avi',
  `relative_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '/files/config/$cid/voice/' COMMENT '文件路径',
  `file_size` int NULL DEFAULT NULL COMMENT '文件大小',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记,删除改ID',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_firmware`(`voice_id` ASC) USING BTREE,
  INDEX `uk_cid_firmware`(`company_id` ASC, `voice_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '终端升级用的语音库' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for config_voice_line
-- ----------------------------
DROP TABLE IF EXISTS `config_voice_line`;
CREATE TABLE `config_voice_line`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `route_code` int NULL DEFAULT NULL COMMENT '线路代码',
  `route_state` int NULL DEFAULT NULL COMMENT '线路状态',
  `announce_way` int NULL DEFAULT NULL COMMENT '报站方式',
  `full_limit` int NULL DEFAULT NULL COMMENT '全程限速',
  `up_limit` int NULL DEFAULT NULL COMMENT '上行限速',
  `down_limit` int NULL DEFAULT NULL COMMENT '下行限速',
  `non_limit` int NULL DEFAULT NULL COMMENT '非运营限速',
  `mandarin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '普通话',
  `mandarin_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '普通话名称',
  `mandarin_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `english` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英语',
  `english_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `english_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英语名称',
  `dialect` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方言',
  `dialect_name` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方言名称',
  `dialect_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `is_deleted` int NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ix_line_voice`(`company_id` ASC, `route_id` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '终端升级的线路配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for config_voice_public
-- ----------------------------
DROP TABLE IF EXISTS `config_voice_public`;
CREATE TABLE `config_voice_public`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `voice_type` int NOT NULL COMMENT '语音类型 0 进站 1 出站 2 起点 3 终站 4服务用语 5 提示语音',
  `use_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用途',
  `use_type` int NULL DEFAULT NULL COMMENT '用途类型',
  `usefulness` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用途说明',
  `mandarin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '普通话',
  `mandarin_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `mandarin_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `english` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英语',
  `english_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `english_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `dialect` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方言',
  `dialect_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `dialect_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `is_deleted` int NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ix_public_voice`(`company_id` ASC, `route_id` ASC, `voice_type` ASC, `usefulness` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '终端升级的公共配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for config_voice_station
-- ----------------------------
DROP TABLE IF EXISTS `config_voice_station`;
CREATE TABLE `config_voice_station`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `stop_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站台编号',
  `station_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点序号',
  `serial` int NULL DEFAULT NULL COMMENT '站点编号',
  `station_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点名称',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `angle` int NULL DEFAULT NULL COMMENT '方位角',
  `radius` int NULL DEFAULT NULL COMMENT '半径',
  `limit_speed` int NULL DEFAULT NULL COMMENT '限速',
  `is_big` bit(1) NULL DEFAULT b'0' COMMENT '大站',
  `direction` int NULL DEFAULT NULL COMMENT '方向',
  `mandarin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '普通话',
  `mandarin_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `mandarin_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `english` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英语',
  `english_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `english_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `dialect` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方言',
  `dialect_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `dialect_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `advert_one` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展用语1',
  `advert_one_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `advert_one_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展用语1',
  `advert_two` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展用语2',
  `advert_two_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `advert_two_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展用语2',
  `advert_three` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展用语3',
  `advert_three_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语音文件路径',
  `advert_three_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展用语3',
  `advert_en_one` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展用语英语1',
  `advert_en_two` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展用语英语2',
  `advert_en_three` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展用语英语3',
  `is_deleted` int NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `way_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `leave_station` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `enter_station` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_station_voice`(`company_id` ASC, `route_id` ASC, `station_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '终端升级的站点配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_daily_car
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_car`;
CREATE TABLE `ledger_daily_car`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序列',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '归属日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '归属线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属线路名称',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆编码',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `run_route_set` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运行线路名称',
  `plan_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '计划趟次',
  `real_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '实际趟次',
  `abnormal_count` int NULL DEFAULT NULL COMMENT '异常趟次',
  `trip_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '趟次兑现率',
  `emp_use_count` int NULL DEFAULT 0 COMMENT '出勤人数',
  `total_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '运营+包车+非运营总里程',
  `plan_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '原计划运营总里程',
  `operating_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '运营里程',
  `contract_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '包车里程',
  `idle_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '辅助里程',
  `gps_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT 'GPS总里程, 来源计划表和非运营表',
  `device_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '设备总里程, 来源GPS表',
  `first_last_count` int NULL DEFAULT 0 COMMENT '首末班考核次数',
  `first_last_on_time` int NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int NULL DEFAULT 0 COMMENT '发车次数',
  `depart_on_time` int NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int NULL DEFAULT 0 COMMENT '大站正点次数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int NULL DEFAULT 0 COMMENT '全程正点次数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `over_speed_count` int NULL DEFAULT 0 COMMENT '超速次数',
  `device_boot_time` datetime NULL DEFAULT NULL COMMENT '设备启动时间',
  `device_shutdown_time` datetime NULL DEFAULT NULL COMMENT '设备关机时间',
  `device_time` int NULL DEFAULT NULL COMMENT '设备运行时长,单位小时',
  `work_start_time` datetime NULL DEFAULT NULL COMMENT '开始工作时间(计划和非运营最早一笔)',
  `work_end_time` datetime NULL DEFAULT NULL COMMENT '结束工作时间(计划和非运营最晚一笔)',
  `work_time` int NOT NULL DEFAULT 0 COMMENT '一天工作总时长(秒)',
  `plan_first_departure_time` datetime NULL DEFAULT NULL COMMENT '行车计划-第一班实际发车时间',
  `plan_last_arrival_time` datetime NULL DEFAULT NULL COMMENT '行车计划-最后一班实际到达时间',
  `plan_time` int NULL DEFAULT 0 COMMENT '运营工作时长=最晚行车记录到达-最早行车记录发车',
  `operational_time_expected` int NULL DEFAULT 0 COMMENT '计划总时长(秒), 计划到达-计划发车',
  `operational_time_actual` int NULL DEFAULT 0 COMMENT '实际总时长(秒), 实际到达-实际发车',
  `non_operational_time` int NULL DEFAULT 0 COMMENT '非运营时长(秒)',
  `rest_time` int NULL DEFAULT 0 COMMENT '休息时长(秒)',
  `run_time` int NOT NULL DEFAULT 0 COMMENT '运营时长(秒)，使用operational_time替代，后续删除20220324',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `sort_id` int NULL DEFAULT NULL COMMENT '排序',
  `is_deleted` int NULL DEFAULT 0,
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_date_route`(`company_id` ASC, `work_date` ASC, `route_id` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_daily_company
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_company`;
CREATE TABLE `ledger_daily_company`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '基础数据日台账',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期,规避多时区',
  `vehicle_count` int NOT NULL DEFAULT 0 COMMENT '车辆档案总数',
  `vehicle_0` int NOT NULL DEFAULT 0 COMMENT '运营车辆',
  `vehicle_10` int NOT NULL DEFAULT 0 COMMENT '故障车辆',
  `vehicle_20` int NOT NULL DEFAULT 0 COMMENT '扣押车辆',
  `vehicle_100` int NOT NULL DEFAULT 0 COMMENT '报废车辆',
  `employee_count` int NOT NULL DEFAULT 0 COMMENT '人员档案总数',
  `driver_count` int NOT NULL DEFAULT 0 COMMENT '驾驶员数量',
  `conductor_count` int NOT NULL DEFAULT 0 COMMENT '乘务员数量',
  `employee_0` int NOT NULL DEFAULT 0 COMMENT '正常',
  `employee_10` int NOT NULL DEFAULT 0 COMMENT '请假',
  `employee_100` int NOT NULL DEFAULT 0 COMMENT '离职',
  `stop_count` int NOT NULL DEFAULT 0 COMMENT '站台数量',
  `route_count` int NOT NULL DEFAULT 0 COMMENT '线路总数',
  `dispatch_count` int NOT NULL DEFAULT 0 COMMENT '调度线路数',
  `distance_10` int NULL DEFAULT 0 COMMENT '10km以下线路数',
  `distance_20` int NULL DEFAULT 0 COMMENT '20km以下线路数',
  `distance_30` int NULL DEFAULT 0 COMMENT '30km以下线路数',
  `distance_other` int NULL DEFAULT 0 COMMENT '30km以上线路数',
  `passenger_count` int NOT NULL DEFAULT 0 COMMENT '客流总数',
  `car_own_count` int NOT NULL DEFAULT 0 COMMENT '配车数量',
  `car_use_count` int NOT NULL DEFAULT 0 COMMENT '出勤车辆',
  `car_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '车辆出勤率',
  `emp_own_count` int NOT NULL DEFAULT 0 COMMENT '企业员工配额',
  `emp_use_count` int NOT NULL DEFAULT 0 COMMENT '出勤员工',
  `emp_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '员工出勤率',
  `plan_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '计划趟次',
  `real_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '实际趟次',
  `trip_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '趟次兑现率',
  `total_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '企业单日总里程',
  `plan_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '计划里程',
  `real_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '实际里程',
  `contract_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '包车公里',
  `idle_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '辅助公里',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `first_last_count` int NULL DEFAULT 0 COMMENT '首末班考核次数',
  `first_last_on_time` int NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '首末班正点率',
  `depart_count` int NULL DEFAULT 0 COMMENT '发车考核次数',
  `depart_on_time` int NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '发车正点率',
  `big_station_count` int NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int NULL DEFAULT 0 COMMENT '大站正点次数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '大站正点率',
  `full_time_count` int NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int NULL DEFAULT 0 COMMENT '全程正点次数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '全程正点率',
  `over_speed_count` int NULL DEFAULT 0 COMMENT '超速次数',
  `monitor_large_interval` int NULL DEFAULT 0 COMMENT '发车大间隔',
  `monitor_bunching_count` int NULL DEFAULT 0 COMMENT '串车次数',
  `monitor_scatter_count` int NULL DEFAULT 0 COMMENT '行车大间隔',
  `monitor_long_wait` int NULL DEFAULT 0 COMMENT '长时间等待',
  `monitor_long_parking` int NULL DEFAULT 0 COMMENT '长时间停靠',
  `is_deleted` int NOT NULL DEFAULT 0,
  `except_count` int NULL DEFAULT NULL COMMENT '行车异常次数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_workdate`(`company_id` ASC, `work_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_daily_company_alarm
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_company_alarm`;
CREATE TABLE `ledger_daily_company_alarm`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '基础数据日台账',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期,规避多时区',
  `vehicle_count` int NOT NULL DEFAULT 0 COMMENT '车辆档案总数',
  `alarm_type` int NOT NULL DEFAULT 0 COMMENT '报警/事件类型',
  `alarm_count` int NOT NULL DEFAULT 0 COMMENT '报警次数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_workdate`(`company_id` ASC, `work_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_daily_detail
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_detail`;
CREATE TABLE `ledger_daily_detail`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '单人单车日台账',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `company_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业名称',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营线路名称',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营线路车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营线路车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营线路员工ID',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营线路员工名称',
  `emp_type` int NULL DEFAULT 1 COMMENT '员工类型 0默认1 驾驶员 2乘务员 3站务',
  `emp_state` int NULL DEFAULT NULL COMMENT '司机状态0正常, 10请假 100机动',
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
  `work_time` int NOT NULL DEFAULT 0 COMMENT '工作时长(秒)',
  `trave_time` int NOT NULL DEFAULT 0 COMMENT 'travel行驶时长(秒)',
  `is_late` smallint NOT NULL DEFAULT 0 COMMENT '司机是否迟到',
  `record_count` int NOT NULL DEFAULT 0 COMMENT '记录数',
  `except_count` int NOT NULL DEFAULT 0 COMMENT '行车异常记录数',
  `over_speed_count` int NOT NULL DEFAULT 0 COMMENT '超速次数',
  `first_last_count` int NULL DEFAULT 0 COMMENT '首末班考核次数',
  `first_last_on_time` int NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int NULL DEFAULT 0 COMMENT '发车考核次数',
  `depart_on_time` int NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int NULL DEFAULT 0 COMMENT '大站正点次数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int NULL DEFAULT 0 COMMENT '全程正点次数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `work_start_time` datetime NULL DEFAULT NULL COMMENT '开始工作时间(计划和非运营最早一笔)',
  `work_end_time` datetime NULL DEFAULT NULL COMMENT '结束工作时间(计划和非运营最晚一笔)',
  `plan_first_departure_time` datetime NULL DEFAULT NULL COMMENT '行车计划-第一班实际发车时间',
  `plan_last_arrival_time` datetime NULL DEFAULT NULL COMMENT '行车计划-最后一班实际到达时间',
  `operational_time_expected` int NULL DEFAULT 0 COMMENT '计划总时长(秒), 计划到达-计划发车',
  `operational_time_actual` int NULL DEFAULT 0 COMMENT '实际总时长(秒), 实际到达-实际发车',
  `non_operational_time` int NULL DEFAULT 0 COMMENT '非运营时长(秒)',
  `rest_time` int NULL DEFAULT 0 COMMENT '休息时长(秒)',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `sort_id` int NULL DEFAULT NULL COMMENT '排序',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cwr`(`company_id` ASC, `work_date` ASC, `route_id` ASC) USING BTREE,
  INDEX `idx_crw`(`company_id` ASC, `route_id` ASC, `work_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_daily_employee
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_employee`;
CREATE TABLE `ledger_daily_employee`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序列',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '归属日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属线路名称',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `emp_type` smallint NOT NULL DEFAULT 1 COMMENT '员工类型 0默认1 驾驶员 2乘务员 3站务',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业归属员工ID',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业归属员工名称',
  `plan_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '计划趟次',
  `real_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '实际趟次',
  `abnormal_count` int NULL DEFAULT 0 COMMENT '异常趟次',
  `trip_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '趟次兑现率',
  `car_use_count` int NULL DEFAULT 0 COMMENT '配班数',
  `total_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '运营+包车+非运营总里程',
  `plan_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '原计划运营总里程',
  `operating_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '运营里程',
  `contract_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '包车里程',
  `idle_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT '辅助里程',
  `gps_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT 'GPS总里程, 来源计划表和非运营表',
  `first_last_count` int NULL DEFAULT 0 COMMENT '首末班考核次数',
  `first_last_on_time` int NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int NULL DEFAULT 0 COMMENT '发车次数',
  `depart_on_time` int NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int NULL DEFAULT 0 COMMENT '大站正点次数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int NULL DEFAULT 0 COMMENT '全程正点次数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `over_speed_count` int NULL DEFAULT 0 COMMENT '超速次数',
  `start_time` datetime NULL DEFAULT NULL COMMENT '最早上班时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '最晚下班时间',
  `work_time` int NULL DEFAULT 0 COMMENT '工作时长',
  `run_time` int NULL DEFAULT 0 COMMENT '运营时长',
  `rest_time` int NULL DEFAULT 0 COMMENT '休息时长',
  `operational_time_expected` int NULL DEFAULT 0 COMMENT '计划总时长(秒), 计划到达-计划发车',
  `operational_time_actual` int NULL DEFAULT 0 COMMENT '实际总时长(秒), 实际到达-实际发车',
  `non_operational_time` int NULL DEFAULT 0 COMMENT '非运营时长(秒)',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `run_route_set` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运行线路名称',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_deleted` int NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_date_route`(`company_id` ASC, `work_date` ASC, `route_id` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_daily_illegal
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_illegal`;
CREATE TABLE `ledger_daily_illegal`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '违规信息日台账',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营线路名称',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营线路车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营线路车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运营线路员工ID',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运营线路员工名称',
  `illegal_type` int NULL DEFAULT 0 COMMENT '违规类型',
  `standard_value` int NULL DEFAULT NULL COMMENT '违规阀值',
  `illegal_count` int NULL DEFAULT 0 COMMENT '违规次数',
  `reduce_score` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '违规扣分',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_daily_mileage
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_mileage`;
CREATE TABLE `ledger_daily_mileage`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '归属日期',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司编号',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号编号',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路名称',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆自编号',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备编号',
  `mileage` decimal(11, 3) NOT NULL COMMENT '当天总公里数',
  `is_abnormal` smallint NULL DEFAULT 0 COMMENT '是否异常',
  `is_reissue` smallint NULL DEFAULT 0 COMMENT '补传标识 0自动台账 1自动补录 2手工台账',
  `start_time` datetime NOT NULL COMMENT '最小开始里程',
  `start_mileage` decimal(11, 3) NOT NULL COMMENT '最早上线时间',
  `end_time` datetime NOT NULL COMMENT '最大结束里程',
  `end_mileage` decimal(11, 3) NOT NULL COMMENT '最晚关机时间',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否有效',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_date_route`(`company_id` ASC, `work_date` ASC, `route_id` ASC) USING BTREE,
  INDEX `ix_date_car`(`company_id` ASC, `work_date` ASC, `car_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_daily_route
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_route`;
CREATE TABLE `ledger_daily_route`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `company_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业名称',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路名称',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `is_dispatch` smallint NOT NULL DEFAULT 0 COMMENT '当天是否调度',
  `car_own_count` int NOT NULL DEFAULT 0 COMMENT '配车',
  `car_use_count` int NOT NULL DEFAULT 0 COMMENT '出车',
  `car_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '车辆出勤率',
  `emp_own_count` int NOT NULL DEFAULT 0 COMMENT '司机配额',
  `emp_use_count` int NOT NULL DEFAULT 0 COMMENT '出勤员工',
  `emp_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '员工出勤率',
  `plan_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '计划趟次',
  `real_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '实际趟次',
  `abnormal_count` int NULL DEFAULT 0 COMMENT '异常趟次',
  `trip_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '趟次兑现率',
  `total_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '全部里程',
  `plan_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '计划里程',
  `real_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '实际里程',
  `gps_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT 'GPS里程',
  `contract_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '包车里程',
  `idle_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '非运营里程',
  `record_count` int NOT NULL DEFAULT 0 COMMENT '计划完成记录数',
  `except_count` int NOT NULL DEFAULT 0 COMMENT '行车异常记录数',
  `work_time` int NOT NULL DEFAULT 0 COMMENT '工作时长',
  `trave_time` int NOT NULL DEFAULT 0 COMMENT '行驶时长',
  `operational_time_expected` int NULL DEFAULT 0 COMMENT '计划总时长(秒), 计划到达-计划发车',
  `operational_time_actual` int NULL DEFAULT 0 COMMENT '实际总时长(秒), 实际到达-实际发车',
  `non_operational_time` int NULL DEFAULT 0 COMMENT '非运营时长(秒)',
  `rest_time` int NULL DEFAULT 0 COMMENT '休息时长(秒)',
  `first_last_count` int NULL DEFAULT 0 COMMENT '首班考核次数',
  `first_last_on_time` int NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int NULL DEFAULT 0 COMMENT '发车考核次数',
  `depart_on_time` int NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int NULL DEFAULT 0 COMMENT '大站考核准点数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int NULL DEFAULT 0 COMMENT '全程用时准点记录数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `over_speed_count` int NOT NULL DEFAULT 0 COMMENT '超速记录次数',
  `monitor_large_interval` int NOT NULL DEFAULT 0 COMMENT '发车大间隔',
  `monitor_bunching_count` int NOT NULL DEFAULT 0 COMMENT '串车次数',
  `monitor_scatter_count` int NOT NULL DEFAULT 0 COMMENT '大间隔',
  `monitor_long_wait` int NOT NULL DEFAULT 0 COMMENT '长时间等待',
  `monitor_long_parking` int NOT NULL DEFAULT 0 COMMENT '长时间停靠',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `sort_id` int NULL DEFAULT NULL COMMENT '排序',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核账号',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cwr`(`company_id` ASC, `work_date` ASC, `route_id` ASC) USING BTREE,
  INDEX `idx_crw`(`company_id` ASC, `route_id` ASC, `work_date` ASC) USING BTREE,
  INDEX `uk_date_route`(`company_id` ASC, `work_date` ASC, `route_id` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_daily_station
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_station`;
CREATE TABLE `ledger_daily_station`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '单天峰段全程耗时',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营线路名称',
  `route_code` int NULL DEFAULT NULL COMMENT '线路编号',
  `way_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营线路车辆ID',
  `utc_hour` int NOT NULL COMMENT 'UTC小时',
  `direction` int NOT NULL DEFAULT 0 COMMENT '方向',
  `expected_mileage` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '额定里程',
  `actual_mileage` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '行驶GPS里程',
  `expected_duration` int NOT NULL COMMENT '预期时长秒',
  `actual_duration` int NOT NULL COMMENT '实际时长秒',
  `max_duration` int NOT NULL COMMENT '最大耗时秒',
  `min_duration` int NOT NULL COMMENT '最小耗时秒',
  `trip_count` int NOT NULL COMMENT '统计次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_time`(`company_id` ASC, `route_id` ASC, `work_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_driver_trip_level
-- ----------------------------
DROP TABLE IF EXISTS `ledger_driver_trip_level`;
CREATE TABLE `ledger_driver_trip_level`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '驾驶员趟次工资',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `work_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `route_fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路归属车队',
  `route_fleet_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路归宿车队名称',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶员工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶员姓名',
  `emp_fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工归宿车队',
  `emp_fleet_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶员归属车队名称',
  `plan_depart` datetime NULL DEFAULT NULL COMMENT '计划发车',
  `real_depart` datetime NULL DEFAULT NULL COMMENT '计划到达',
  `trips` decimal(10, 1) NULL DEFAULT NULL COMMENT '趟次',
  `time_period_id` smallint NULL DEFAULT NULL COMMENT '时段',
  `subsidy_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '时段工资',
  `is_deleted` int NOT NULL DEFAULT 0,
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ix_driver_record`(`company_id` ASC, `work_date` ASC, `route_fleet_id` ASC, `route_id` ASC, `car_id` ASC, `emp_id` ASC, `plan_depart` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `ix_trip_level`(`company_id` ASC, `work_date` ASC, `emp_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_fault_data_check
-- ----------------------------
DROP TABLE IF EXISTS `ledger_fault_data_check`;
CREATE TABLE `ledger_fault_data_check`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `work_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属日期',
  `archive_time` datetime NULL DEFAULT NULL COMMENT '归属时间-->故障报修单报修时间',
  `year` smallint NULL DEFAULT NULL COMMENT '年份',
  `month` smallint NULL DEFAULT NULL COMMENT '月份',
  `event_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '事件编号',
  `fault_type` int NOT NULL COMMENT '故障类型',
  `description_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障描述ID',
  `description_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障描述',
  `module_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主模块ID',
  `module_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主模块名称',
  `sub_module_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子模块ID',
  `sub_module_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子模块名称',
  `current_assignment` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前指派ID',
  `current_assignment_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前指派人名称',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `side_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆边号，如：2-46789，边号=46789',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `sub_fleet_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下级车队ID',
  `sub_fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下级车队名称',
  `fault_status` int NULL DEFAULT 0 COMMENT '状态 0=创建, 1=审核, 2=确认, 3=指派, 4=误报, 5=解决, 255=关闭',
  `repair_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报修人ID',
  `repair_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报修人名称',
  `repair_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '报修时间',
  `parking_space` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '停车位',
  `residence_time` datetime NULL DEFAULT NULL COMMENT '停留时间',
  `parking_time` datetime NULL DEFAULT NULL COMMENT '停车时间',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `steps_reproduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重现步骤',
  `resolution_time` datetime NULL DEFAULT NULL COMMENT '解决时间',
  `fault_solution_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '解决方案',
  `fault_solution_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '解决方案名称',
  `action_result` smallint NULL DEFAULT NULL COMMENT '处理结果 0未处理，1已处理',
  `close_time` datetime NULL DEFAULT NULL COMMENT '关闭时间',
  `total_time_long` decimal(18, 2) NULL DEFAULT NULL COMMENT '从报修到关闭用时',
  `resolution_time_long` decimal(18, 2) NULL DEFAULT NULL COMMENT '从报修解决故障用时',
  `close_time_long` decimal(18, 2) NULL DEFAULT NULL COMMENT '从解决到关闭用时',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `criteria_type` smallint NULL DEFAULT NULL COMMENT '考核标准 0未超出阈值，1超出阈值',
  `contract_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `report_category` smallint NULL DEFAULT NULL COMMENT '上报类别',
  `report_type` smallint NULL DEFAULT NULL COMMENT '上报类型 0内部，1外部',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `fault_solution_status` smallint NULL DEFAULT NULL COMMENT '解决状态 0=正常或未处理，1=已解决',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_fault_repair`(`company_id` ASC, `event_id` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `uk_company_time`(`company_id` ASC, `archive_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_monthly_car
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_car`;
CREATE TABLE `ledger_monthly_car`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `month` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '月度',
  `start_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开始日期',
  `end_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '结束日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属线路名称',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `check_days` int NOT NULL DEFAULT 0 COMMENT '考核天数',
  `use_days` int NOT NULL DEFAULT 0 COMMENT '出车天数',
  `days_ratio` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '出车率',
  `work_time` int NOT NULL DEFAULT 0 COMMENT '工作总时长',
  `trave_time` int NOT NULL DEFAULT 0 COMMENT '运营总时长',
  `plan_time` int NULL DEFAULT 0 COMMENT '运营工作时长=最晚行车记录到达-最早行车记录发车',
  `operational_time_expected` int NULL DEFAULT 0 COMMENT '计划总时长(秒), 计划到达-计划发车',
  `operational_time_actual` int NULL DEFAULT 0 COMMENT '实际总时长(秒), 实际到达-实际发车',
  `non_operational_time` int NULL DEFAULT 0 COMMENT '非运营时长(秒)',
  `rest_time` int NULL DEFAULT 0 COMMENT '休息时长',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
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
  `first_last_count` int NULL DEFAULT 0 COMMENT '首末班考核次数',
  `first_last_on_time` int NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int NULL DEFAULT 0 COMMENT '发车次数',
  `depart_on_time` int NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int NULL DEFAULT 0 COMMENT '大站正点次数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int NULL DEFAULT 0 COMMENT '全程正点次数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `over_speed_count` int NULL DEFAULT 0 COMMENT '超速次数',
  `sort_id` int NULL DEFAULT NULL COMMENT '排序',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_monthly_car`(`company_id` ASC, `month` ASC, `route_id` ASC, `car_id` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_monthly_company
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_company`;
CREATE TABLE `ledger_monthly_company`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '基础数据日台账',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业',
  `month` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期,规避多时区',
  `days` smallint NOT NULL DEFAULT 0 COMMENT '天数',
  `vehicle_count` int NOT NULL DEFAULT 0 COMMENT '车辆数量',
  `employee_count` int NOT NULL DEFAULT 0 COMMENT '人员数量',
  `driver_count` int NOT NULL DEFAULT 0 COMMENT '驾驶员数量',
  `conductor_count` int NOT NULL DEFAULT 0 COMMENT '乘务员数量',
  `stop_count` int NOT NULL COMMENT '站台数量',
  `route_count` int NOT NULL DEFAULT 0 COMMENT '线路总数',
  `dispatch_count` int NOT NULL DEFAULT 0 COMMENT '调度线路数',
  `passenger_count` int NOT NULL DEFAULT 0 COMMENT '客流总数',
  `car_own_count` int NOT NULL DEFAULT 0 COMMENT '配车数量',
  `car_use_count` int NOT NULL DEFAULT 0 COMMENT '出勤车辆',
  `car_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '车辆出勤率',
  `emp_own_count` int NOT NULL DEFAULT 0 COMMENT '驾驶员配额',
  `emp_use_count` int NOT NULL DEFAULT 0 COMMENT '出勤驾驶员',
  `emp_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '员工出勤率',
  `plan_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '计划趟次',
  `real_count` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '实际趟次',
  `trip_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '趟次兑现率',
  `total_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '总里程',
  `plan_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '计划里程',
  `real_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '实际里程',
  `contract_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '包车公里',
  `idle_mileage` decimal(18, 3) NULL DEFAULT 0.000 COMMENT '辅助公里',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `first_last_count` int NULL DEFAULT 0 COMMENT '首末班考核次数',
  `first_last_on_time` int NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '首末班正点率',
  `depart_count` int NULL DEFAULT 0 COMMENT '发车考核次数',
  `depart_on_time` int NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '发车正点率',
  `big_station_count` int NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int NULL DEFAULT 0 COMMENT '大站正点次数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '大站正点率',
  `full_time_count` int NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int NULL DEFAULT 0 COMMENT '全程正点次数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT NULL COMMENT '全程正点率',
  `over_speed_count` int NULL DEFAULT 0 COMMENT '超速次数',
  `monitor_large_interval` int NULL DEFAULT 0 COMMENT '发车大间隔',
  `monitor_bunching_count` int NULL DEFAULT 0 COMMENT '串车次数',
  `monitor_scatter_count` int NULL DEFAULT 0 COMMENT '行车大间隔',
  `monitor_long_wait` int NULL DEFAULT 0 COMMENT '长时间等待',
  `monitor_long_parking` int NULL DEFAULT 0 COMMENT '长时间停靠',
  `is_deleted` int NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_monthly_company`(`company_id` ASC, `month` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_monthly_employee
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_employee`;
CREATE TABLE `ledger_monthly_employee`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `month` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '月度',
  `start_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开始日期',
  `end_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '结束日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `emp_type` smallint NOT NULL DEFAULT 1 COMMENT '员工类型 0默认1 驾驶员 2乘务员 3站务',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '司机ID',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '司机名称',
  `check_days` int NOT NULL DEFAULT 0 COMMENT '考核天数',
  `use_days` int NOT NULL DEFAULT 0 COMMENT '出车天数',
  `days_ratio` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '出车率',
  `work_time` int NOT NULL DEFAULT 0 COMMENT '工作总时长',
  `trave_time` int NOT NULL DEFAULT 0 COMMENT '运营总时长',
  `plan_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '计划总趟次',
  `real_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '实际总趟次',
  `trip_ratio` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '趟次兑现率',
  `total_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '调度运营总里程',
  `plan_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '计划里程',
  `trave_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '运营总里程',
  `contract_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '包车总里程',
  `idle_mileage` decimal(11, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '辅助里程',
  `gps_mileage` decimal(11, 3) UNSIGNED NULL DEFAULT 0.000 COMMENT 'GPS总里程, 来源GPS表，非计划表',
  `first_last_count` int NULL DEFAULT 0 COMMENT '首班考核次数',
  `first_last_on_time` int NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int NULL DEFAULT 0 COMMENT '发车考核次数',
  `depart_on_time` int NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int NULL DEFAULT 0 COMMENT '大站考核准点数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int NULL DEFAULT 0 COMMENT '全程用时准点记录数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `over_speed_count` int NULL DEFAULT 0 COMMENT '超速记录次数',
  `operational_time_expected` int NULL DEFAULT 0 COMMENT '计划总时长(秒), 计划到达-计划发车',
  `operational_time_actual` int NULL DEFAULT 0 COMMENT '实际总时长(秒), 实际到达-实际发车',
  `non_operational_time` int NULL DEFAULT 0 COMMENT '非运营时长(秒)',
  `rest_time` int NULL DEFAULT 0 COMMENT '休息时长(秒)',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `is_deleted` int NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_monthly_car`(`company_id` ASC, `month` ASC, `route_id` ASC, `emp_id` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_monthly_fault_contract
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_fault_contract`;
CREATE TABLE `ledger_monthly_fault_contract`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月份',
  `contract_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `gps_vehicles_count` int NULL DEFAULT NULL COMMENT '配备 GPS 的车辆数量',
  `on_vehicle_devices_count` int NULL DEFAULT NULL COMMENT '车辆上的设备总数（个）',
  `computer_count` int NULL DEFAULT 0 COMMENT '电脑数量',
  `computer_total` int NOT NULL DEFAULT 0 COMMENT '电脑设备总数（个）',
  `equipmnet_total` int NULL DEFAULT 0 COMMENT '所有设备总数=车辆上的设备总数+电脑设备总数',
  `report_count` int NULL DEFAULT 0 COMMENT '故障上报次数',
  `fault_rate` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '故障率',
  `devices_report_count` int NULL DEFAULT 0 COMMENT '车上故障上报次数',
  `devices_specified_time_complete` int NULL DEFAULT 0 COMMENT '规定时间内完成的维修次数（次）',
  `devices_over_hours24` int NULL DEFAULT 0 COMMENT '24小时以上维修次数（次',
  `network_devices_count` int NULL DEFAULT 0 COMMENT '计算机网络设备的故障上报次数',
  `network_devices_corrected_hours3` int NULL DEFAULT 0 COMMENT '3小时内完成即时更正次数（次）',
  `network_devices_overdue_count` int NULL DEFAULT 0 COMMENT '逾期修改次数（次）',
  `app_report_count` int NULL DEFAULT 0 COMMENT 'app故障上报次数',
  `app_corrected_hours3` int NULL DEFAULT 0 COMMENT '3小时内临时修复次数（次）',
  `app_permanent_fix_days3` int NULL DEFAULT 0 COMMENT '3天内完成的永久修复次数（次）',
  `app_over_hours3` int NULL DEFAULT 0 COMMENT '3小时以上维修次数（次）',
  `cloud_report_count` int NULL DEFAULT 0 COMMENT '信息系统和云修复通知',
  `cloud_corrected_hours3` int NULL DEFAULT 0 COMMENT '3小时内临时修复次数（次）',
  `cloud_permanent_fix_days3` int NULL DEFAULT 0 COMMENT '3天内完成的永久修复次数（次）',
  `cloud_overdue_count` int NULL DEFAULT 0 COMMENT '逾期修改次数（次）',
  `is_deleted` int NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_index`(`company_id` ASC, `month` ASC, `fleet_id` ASC, `contract_no` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `nk_index`(`company_id` ASC, `month` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_monthly_fault_module
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_fault_module`;
CREATE TABLE `ledger_monthly_fault_module`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月份',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `report_count` int NULL DEFAULT NULL COMMENT '故障上报次数',
  `no_vehicle_info` int NULL DEFAULT NULL COMMENT '没有车辆信息',
  `cable_inch_7` int NULL DEFAULT NULL COMMENT '7\" 电缆',
  `app` int NULL DEFAULT NULL COMMENT '应用程序',
  `camera_1` int NULL DEFAULT NULL COMMENT '相机#1',
  `camera_2` int NULL DEFAULT NULL COMMENT '相机#2',
  `camera_3` int NULL DEFAULT NULL COMMENT '相机#3',
  `camera_4` int NULL DEFAULT NULL COMMENT '相机#4',
  `gps` int NULL DEFAULT NULL COMMENT '全球定位系统',
  `gps_antenna` int NULL DEFAULT NULL COMMENT 'GPS天线',
  `gsm` int NULL DEFAULT NULL COMMENT 'GSM',
  `gsm_antenna` int NULL DEFAULT NULL COMMENT 'GSM天线',
  `harddisk` int NULL DEFAULT NULL COMMENT '硬盘',
  `monitor_pole_inch_22` int NULL DEFAULT NULL COMMENT '显示器 22\" 杆',
  `pcc_1` int NULL DEFAULT NULL COMMENT 'PCC#1',
  `pcc_2` int NULL DEFAULT NULL COMMENT 'PCC#2',
  `rfid` int NULL DEFAULT NULL COMMENT '射频识别',
  `driver_license` int NULL DEFAULT NULL COMMENT '驾驶执照',
  `gsm_antenna_3g` int NULL DEFAULT NULL COMMENT '3G(GSM)天线',
  `server_box` int NULL DEFAULT NULL COMMENT '服务器箱',
  `led_screen_inch_22` int NULL DEFAULT NULL COMMENT '22寸LED屏',
  `drive_screen_inch_7` int NULL DEFAULT NULL COMMENT '驱动屏幕 7\"',
  `dataset_problem` int NULL DEFAULT NULL COMMENT '数据集有问题',
  `car_power_system` int NULL DEFAULT NULL COMMENT '汽车动力系统',
  `is_deleted` int NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_index`(`company_id` ASC, `month` ASC, `fleet_id` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_monthly_fault_platform
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_fault_platform`;
CREATE TABLE `ledger_monthly_fault_platform`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月份',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `report_count` int NULL DEFAULT NULL COMMENT '故障维护通知',
  `desktop_computer` int NULL DEFAULT NULL COMMENT '台式电脑',
  `screen_inch43` int NULL DEFAULT NULL COMMENT '43寸屏幕',
  `computer_monitor` int NULL DEFAULT NULL COMMENT '电脑显示器',
  `ups` int NULL DEFAULT NULL COMMENT 'ups',
  `modem_router` int NULL DEFAULT NULL COMMENT '调制解调器路由器',
  `mouse` int NULL DEFAULT NULL COMMENT '鼠标',
  `keyboard` int NULL DEFAULT NULL COMMENT '键盘',
  `internet_signal` int NULL DEFAULT NULL COMMENT '网络信号',
  `is_deleted` int NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_index`(`company_id` ASC, `month` ASC, `fleet_id` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_monthly_fault_rate
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_fault_rate`;
CREATE TABLE `ledger_monthly_fault_rate`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月份',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `contract_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属合同',
  `vehicles_count` int NULL DEFAULT NULL COMMENT '车辆总数',
  `devices_count` int NULL DEFAULT NULL COMMENT '车上设备总数',
  `report_count` int NULL DEFAULT NULL COMMENT '故障报修通知数量',
  `fault_rate` decimal(18, 2) NULL DEFAULT NULL COMMENT '故障率',
  `corrected_count` int NULL DEFAULT NULL COMMENT '上报后处理过的数量',
  `corrected_percentage` decimal(18, 2) NULL DEFAULT NULL COMMENT '上报故障处理了的占比',
  `normal_count` int NULL DEFAULT NULL COMMENT '上报后但是正常的数量',
  `normal_percentage` decimal(18, 2) NULL DEFAULT NULL COMMENT '上报故障是正常的占比',
  `is_deleted` int NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nk_index`(`company_id` ASC, `month` ASC, `fleet_id` ASC) USING BTREE,
  INDEX `ik_index`(`company_id` ASC, `month` ASC, `fleet_id` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_monthly_fault_report
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_fault_report`;
CREATE TABLE `ledger_monthly_fault_report`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月份',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `contract_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属合同',
  `report_count` int NULL DEFAULT NULL COMMENT '上报次数',
  `solved` int NULL DEFAULT NULL COMMENT '已解决',
  `unsolved` int NULL DEFAULT NULL COMMENT '未解决',
  `all_devices` int NULL DEFAULT NULL COMMENT '总设备数量',
  `all_solved` int NULL DEFAULT NULL COMMENT '已解决设备数量',
  `all_unsolved` int NULL DEFAULT NULL COMMENT '未解决设备数据',
  `is_deleted` int NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_index`(`company_id` ASC, `month` ASC, `fleet_id` ASC, `contract_no` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `normal_index`(`company_id` ASC, `month` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_monthly_route
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_route`;
CREATE TABLE `ledger_monthly_route`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `start_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始日期',
  `end_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '结束日期',
  `day_count` smallint NOT NULL COMMENT '当月天数',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `company_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业名称',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路名称',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `car_own_count` int NOT NULL DEFAULT 0 COMMENT '配车',
  `car_use_count` int NOT NULL DEFAULT 0 COMMENT '出车',
  `car_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '车辆出勤率',
  `emp_own_count` int NOT NULL COMMENT ' 司机配额',
  `emp_use_count` int NOT NULL DEFAULT 0 COMMENT '出勤员工',
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
  `record_count` int NOT NULL DEFAULT 0 COMMENT '计划完成记录数',
  `except_count` int NOT NULL DEFAULT 0 COMMENT '行车异常记录数',
  `work_time` int NOT NULL DEFAULT 0 COMMENT '工作时长',
  `trave_time` int NOT NULL DEFAULT 0 COMMENT '行驶时长',
  `first_last_count` int NOT NULL DEFAULT 0 COMMENT '首班考核次数',
  `first_last_on_time` int NOT NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int NOT NULL DEFAULT 0 COMMENT '发车考核次数',
  `depart_on_time` int NOT NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int NOT NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int NOT NULL DEFAULT 0 COMMENT '大站考核准点数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int NOT NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int NOT NULL DEFAULT 0 COMMENT '全程用时准点记录数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `over_speed_count` int NOT NULL DEFAULT 0 COMMENT '超速记录次数',
  `monitor_large_interval` int NOT NULL DEFAULT 0 COMMENT '发车大间隔',
  `monitor_bunching_count` int NOT NULL DEFAULT 0 COMMENT '串车次数',
  `monitor_scatter_count` int NOT NULL DEFAULT 0 COMMENT '大间隔次数',
  `monitor_long_wait` int NOT NULL DEFAULT 0 COMMENT '长时间等待',
  `monitor_long_parking` int NOT NULL DEFAULT 0 COMMENT '长时间停靠',
  `operational_time_expected` int NULL DEFAULT 0 COMMENT '计划总时长(秒), 计划到达-计划发车',
  `operational_time_actual` int NULL DEFAULT 0 COMMENT '实际总时长(秒), 实际到达-实际发车',
  `non_operational_time` int NULL DEFAULT 0 COMMENT '非运营时长(秒)',
  `rest_time` int NULL DEFAULT 0 COMMENT '休息时长(秒)',
  `non_operational_detail` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '非运营细分类的里程与时长 存储为json字符串',
  `sort_id` int NULL DEFAULT NULL COMMENT '排序',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cwr`(`company_id` ASC, `month` ASC, `route_id` ASC) USING BTREE,
  INDEX `idx_crw`(`company_id` ASC, `route_id` ASC, `month` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_monthly_safety_score
-- ----------------------------
DROP TABLE IF EXISTS `ledger_monthly_safety_score`;
CREATE TABLE `ledger_monthly_safety_score`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '企业驾驶员主动安全评分台账',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `month` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '月度',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '车牌号',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '归属线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属线路名称',
  `vehicle_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '车型',
  `fixed_emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '固定驾驶员编号',
  `fixed_emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '固定驾驶员姓名',
  `fixed_emp_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系电话',
  `speeding_times` int NULL DEFAULT 0 COMMENT '超速次数',
  `abnormal_times` int NULL DEFAULT NULL COMMENT '异常次数',
  `monthly_mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '月度里程',
  `check_days` int NOT NULL DEFAULT 0 COMMENT '考核天数',
  `use_days` int NOT NULL DEFAULT 0 COMMENT '出车天数',
  `final_score` decimal(11, 1) NOT NULL DEFAULT 100.0 COMMENT '最终评分',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '月度申述详情',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_company_emp`(`company_id` ASC, `month` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '单人月度台账' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ledger_time_route
-- ----------------------------
DROP TABLE IF EXISTS `ledger_time_route`;
CREATE TABLE `ledger_time_route`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `company_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业名称',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路名称',
  `event_time` datetime NOT NULL COMMENT '记录时间段',
  `is_dispatch` smallint NOT NULL DEFAULT 0 COMMENT '当天是否调度',
  `car_own_count` int NOT NULL DEFAULT 0 COMMENT '配车',
  `car_use_count` int NOT NULL DEFAULT 0 COMMENT '出车',
  `car_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '车辆出勤率',
  `emp_own_count` int NOT NULL DEFAULT 0 COMMENT '司机配额',
  `emp_use_count` int NOT NULL DEFAULT 0 COMMENT '出勤员工',
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
  `record_count` int NOT NULL DEFAULT 0 COMMENT '计划完成记录数',
  `except_count` int NOT NULL DEFAULT 0 COMMENT '行车异常记录数',
  `work_time` int NOT NULL DEFAULT 0 COMMENT '工作时长',
  `trave_time` int NOT NULL DEFAULT 0 COMMENT '行驶时长',
  `first_last_count` int NULL DEFAULT 0 COMMENT '首班考核次数',
  `first_last_on_time` int NULL DEFAULT 0 COMMENT '首末班正点次数',
  `first_last_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '首末班正点率',
  `depart_count` int NULL DEFAULT 0 COMMENT '发车考核次数',
  `depart_on_time` int NULL DEFAULT 0 COMMENT '发车正点次数',
  `depart_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '发车正点率',
  `big_station_count` int NULL DEFAULT 0 COMMENT '大站考核次数',
  `big_station_on_time` int NULL DEFAULT 0 COMMENT '大站考核准点数',
  `big_station_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '大站正点率',
  `full_time_count` int NULL DEFAULT 0 COMMENT '全程考核次数',
  `full_time_on_time` int NULL DEFAULT 0 COMMENT '全程用时准点记录数',
  `full_time_ratio` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '全程正点率',
  `over_speed_count` int NOT NULL DEFAULT 0 COMMENT '超速记录次数',
  `monitor_large_interval` int NOT NULL DEFAULT 0 COMMENT '发车大间隔',
  `monitor_bunching_count` int NOT NULL DEFAULT 0 COMMENT '串车次数',
  `monitor_scatter_count` int NOT NULL DEFAULT 0 COMMENT '大间隔',
  `monitor_long_wait` int NOT NULL DEFAULT 0 COMMENT '长时间等待',
  `monitor_long_parking` int NOT NULL DEFAULT 0 COMMENT '长时间停靠',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cwr`(`company_id` ASC, `work_date` ASC, `route_id` ASC) USING BTREE,
  INDEX `idx_crw`(`company_id` ASC, `route_id` ASC, `work_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_attendance
-- ----------------------------
DROP TABLE IF EXISTS `log_attendance`;
CREATE TABLE `log_attendance`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '考勤签到记录',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'yyyy-mm-dd日期 忽略时区',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `check_flag` smallint NOT NULL DEFAULT 0 COMMENT '1签到 2签退',
  `check_time` datetime NOT NULL COMMENT '签到/签退时间',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到车辆',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到车辆归属线路',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到设备',
  `physical_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡片ID',
  `sign_in_type` smallint NULL DEFAULT NULL COMMENT '1上班 2下班 3签到 4签退 5例检',
  `sign_in_origin` smallint NULL DEFAULT NULL COMMENT '考勤方式 1员工卡考勤 2输工号考勤 自定义200=GPS附加, 210透传 255调度员签到',
  `create_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_date_route`(`company_id` ASC, `work_date` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `log_dispatch`;
CREATE TABLE `log_dispatch`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '调度操作日志',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `cmd` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调度指令',
  `content` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指令内容',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_date_route`(`company_id` ASC, `work_date` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_dsp
-- ----------------------------
DROP TABLE IF EXISTS `log_dsp`;
CREATE TABLE `log_dsp`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '日期',
  `event_id` smallint NOT NULL DEFAULT 0 COMMENT '事件ID',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路名称',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `run_state` int NOT NULL DEFAULT 0 COMMENT '0运营 1包车 10短休 >10加油  100退出运营等',
  `in_field` smallint NOT NULL DEFAULT 1 COMMENT '在场内 0场外 1场内',
  `direction` smallint NOT NULL DEFAULT 1 COMMENT '方向',
  `plan_id` int NULL DEFAULT NULL COMMENT '计划表ID',
  `plan_depart` datetime NULL DEFAULT NULL COMMENT '计划发车',
  `log_text` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time_route`(`company_id` ASC, `event_time` ASC, `route_id` ASC) USING BTREE,
  INDEX `idx_route_time`(`company_id` ASC, `route_id` ASC, `event_time` ASC) USING BTREE,
  INDEX `idx_work_date`(`company_id` ASC, `work_date` ASC, `route_id` ASC, `car_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_event
-- ----------------------------
DROP TABLE IF EXISTS `log_event`;
CREATE TABLE `log_event`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车辆事件日志',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备ID',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `event_id` smallint NOT NULL COMMENT '1上线 2下线 3签到 4签退 ',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `direction` smallint NULL DEFAULT NULL COMMENT '方向 1下行2上行',
  `serial` smallint NULL DEFAULT NULL COMMENT '站序',
  `event_time` datetime NULL DEFAULT NULL COMMENT '发生时间OccurTime',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `route_code` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_date_route`(`company_id` ASC, `work_date` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_login
-- ----------------------------
DROP TABLE IF EXISTS `log_login`;
CREATE TABLE `log_login`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登陆成功uid',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登陆成功令牌',
  `login_in` datetime NOT NULL COMMENT '登陆时间',
  `login_out` datetime NULL DEFAULT NULL COMMENT '退出时间',
  `login_out_type` smallint NULL DEFAULT NULL COMMENT '过期退出标识, 1过期退出',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `origin` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'APP或WEB',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_token`(`token` ASC) USING BTREE,
  INDEX `idx_login`(`company_id` ASC, `login_in` ASC) USING BTREE,
  INDEX `idx_user`(`user_id` ASC, `login_in` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_message
-- ----------------------------
DROP TABLE IF EXISTS `log_message`;
CREATE TABLE `log_message`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '自编号码',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `msg` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息',
  `send_time` datetime NOT NULL COMMENT '发送时间',
  `send_state` smallint NOT NULL DEFAULT 0 COMMENT '应答结果 0默认 1发送中 2已发送',
  `reply_time` datetime NULL DEFAULT NULL,
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `character_set` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字符集',
  `uuid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前端下发唯一标识',
  `flag` int NULL DEFAULT NULL COMMENT '发送标志位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_send_time`(`company_id` ASC, `send_time` ASC) USING BTREE,
  INDEX `idx_date_car`(`company_id` ASC, `work_date` ASC, `car_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_plan_change
-- ----------------------------
DROP TABLE IF EXISTS `log_plan_change`;
CREATE TABLE `log_plan_change`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `plan_id` int UNSIGNED NOT NULL COMMENT '计划表的ID',
  `before_plan_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作前的计划对象',
  `after_plan_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '修改后的计划ID',
  `action_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作用户ID',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作账号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_plan_id`(`plan_id` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_company`(`company_id` ASC, `work_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_station
-- ----------------------------
DROP TABLE IF EXISTS `log_station`;
CREATE TABLE `log_station`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车辆进出站',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `flag` smallint NOT NULL DEFAULT 0 COMMENT '1进站 2出站',
  `route_code` int NULL DEFAULT NULL,
  `direction` smallint NULL DEFAULT NULL COMMENT '方向 1下行2上行',
  `station_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `serial` smallint NULL DEFAULT NULL COMMENT '站序',
  `lng` decimal(11, 6) NULL DEFAULT NULL,
  `lat` decimal(11, 6) NULL DEFAULT NULL,
  `mileage` decimal(11, 3) NULL DEFAULT NULL,
  `event_time` datetime NULL DEFAULT NULL COMMENT '发生时间OccurTime',
  `plan_id` int NULL DEFAULT NULL COMMENT '执行中的计划ID',
  `plan_depart` datetime NULL DEFAULT NULL COMMENT '计划发车',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_station`(`company_id` ASC, `work_date` ASC, `route_id` ASC, `car_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_system
-- ----------------------------
DROP TABLE IF EXISTS `log_system`;
CREATE TABLE `log_system`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `action_url` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `change_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '变化部分JSON',
  `location` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行模块',
  `methods` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行方法',
  `code` int NULL DEFAULT NULL COMMENT 'api返回code',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `origin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'APP或WEB',
  `user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`company_id` ASC, `create_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_web_socket
-- ----------------------------
DROP TABLE IF EXISTS `log_web_socket`;
CREATE TABLE `log_web_socket`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `authorization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '验证码',
  `x_time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签名时间',
  `x_sign` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签名',
  `x_reason` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签名结果',
  `socket_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'socket唯一ID',
  `socket_uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'socket参数会话ID',
  `socket_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'socket参数带的账号',
  `login_out` datetime NULL DEFAULT NULL COMMENT '退出时间',
  `logout_remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登出原因',
  `socket_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'socket的IP',
  `socket_headers` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'socket里面的消息头',
  `token_model` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'socket_uuid附加的登录会话信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`company_id` ASC, `create_time` ASC) USING BTREE,
  INDEX `log_web_socket_socket_uuid_IDX`(`socket_uuid` ASC) USING BTREE,
  INDEX `log_web_socket_socket_id_IDX`(`socket_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for operation_fuel
-- ----------------------------
DROP TABLE IF EXISTS `operation_fuel`;
CREATE TABLE `operation_fuel`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '加油加气，充电',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路企业',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期 yyyy-mm-dd',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0.000' COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0.000' COMMENT '车辆名称',
  `type_id` smallint NOT NULL DEFAULT 0 COMMENT '1加油 2加气 3充电',
  `event_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '事件时间',
  `quantity` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '加油量',
  `total_price` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '总价',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_wr`(`work_date` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for operation_ic_card
-- ----------------------------
DROP TABLE IF EXISTS `operation_ic_card`;
CREATE TABLE `operation_ic_card`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '线路当天运营参数',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路企业',
  `terminal_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IC卡终端ID',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `card_type` int NOT NULL DEFAULT 0 COMMENT '磁卡类型 1普通卡 2学生卡 3老人卡 4系统卡',
  `event_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '刷卡时间',
  `original_price` decimal(10, 2) NOT NULL COMMENT '原票价',
  `discount` decimal(10, 0) NOT NULL DEFAULT 100 COMMENT '折扣',
  `consume` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实际价格',
  `balance` decimal(10, 2) NULL DEFAULT NULL COMMENT '余额',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_date`(`company_id` ASC, `work_date` ASC) USING BTREE,
  INDEX `idx_time`(`company_id` ASC, `event_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for operation_income
-- ----------------------------
DROP TABLE IF EXISTS `operation_income`;
CREATE TABLE `operation_income`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '票款收入',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路企业',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期 yyyy-mm-dd',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路名称',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶员',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶员',
  `income` decimal(11, 3) NOT NULL COMMENT '总收入',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique`(`route_id` ASC, `work_date` ASC, `car_id` ASC, `emp_id` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `ix_cwr`(`company_id` ASC, `work_date` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for owner_console
-- ----------------------------
DROP TABLE IF EXISTS `owner_console`;
CREATE TABLE `owner_console`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '调度台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `console_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度台id',
  `console_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dispatch`(`company_id` ASC, `console_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for owner_console_route
-- ----------------------------
DROP TABLE IF EXISTS `owner_console_route`;
CREATE TABLE `owner_console_route`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '调度台关联线路',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `console_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度台id',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_dispatch_route`(`company_id` ASC, `console_id` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for owner_console_user
-- ----------------------------
DROP TABLE IF EXISTS `owner_console_user`;
CREATE TABLE `owner_console_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '调度台关联用户',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度台id',
  `console_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_dispatch_user`(`company_id` ASC, `console_id` ASC, `user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for owner_role
-- ----------------------------
DROP TABLE IF EXISTS `owner_role`;
CREATE TABLE `owner_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `role_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色id',
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_flag` smallint NOT NULL DEFAULT 0 COMMENT '0普通 1管理员 100系统管理员',
  `function_group` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '功能组JSON数组 [“A”,\"B\"]',
  `editable_days` int NULL DEFAULT 7 COMMENT '数据封存多少天',
  `is_share` smallint NOT NULL DEFAULT 0 COMMENT '平台共享',
  `sort_id` int NULL DEFAULT 100 COMMENT '排序',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '0=正常 1=删除',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`company_id` ASC, `role_name` ASC, `is_deleted` ASC) USING BTREE,
  UNIQUE INDEX `uk_id`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for owner_role_perm
-- ----------------------------
DROP TABLE IF EXISTS `owner_role_perm`;
CREATE TABLE `owner_role_perm`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `role_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色id',
  `module_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模块id',
  `perm` int NOT NULL DEFAULT 0 COMMENT '权限',
  `module_type` smallint NOT NULL DEFAULT 0 COMMENT '0默认 1datav',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ix_role_module`(`company_id` ASC, `role_id` ASC, `module_id` ASC) USING BTREE,
  INDEX `idx_role`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for owner_user
-- ----------------------------
DROP TABLE IF EXISTS `owner_user`;
CREATE TABLE `owner_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '上级id，用于用户树，保留',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '21218CCA77804D2BA1922C33E0151105' COMMENT '密码，默认888888',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '名称',
  `role_flag` int NOT NULL DEFAULT 0 COMMENT '是否管理员 0=不是 1=企业管理员 100超级管理员',
  `img_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'static/images/user-boy.png' COMMENT '用户头像 默认在 static下 注意字符串最左边没有 /',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '到期时间',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `password_change_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次修改密码时间',
  `password_expire_days` int NULL DEFAULT 0 COMMENT '定期修改密码天数 0不需要',
  `last_login_in_time` datetime NULL DEFAULT NULL COMMENT '最后登陆时间',
  `union_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户统一标识',
  `max_login_allow` int NULL DEFAULT 3 COMMENT '最大允许同时登陆',
  `encrypt` smallint NULL DEFAULT NULL COMMENT '数据加密方式',
  `user_config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户一些自定义配置文件',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_account`(`account` ASC, `is_deleted` ASC) USING BTREE,
  UNIQUE INDEX `uk_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for owner_user_alarm
-- ----------------------------
DROP TABLE IF EXISTS `owner_user_alarm`;
CREATE TABLE `owner_user_alarm`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户关联角色表',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应t_company的company_id',
  `user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应owner_user的user_id',
  `platform_alarm_id` int NULL DEFAULT NULL COMMENT '对应平台报警ID',
  `web_notice` int NOT NULL DEFAULT 0 COMMENT 'web是否接收 0接收 1拒绝',
  `app_notice` int NOT NULL DEFAULT 0 COMMENT 'app是否接收 0接收 1拒绝',
  `mail_notice` int NOT NULL DEFAULT 0 COMMENT 'mail是否接收 0接收 1拒绝',
  `is_show` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否开启报警弹窗',
  `duration` int NOT NULL DEFAULT 30 COMMENT '弹窗显示时长(s)',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_alarm`(`company_id` ASC, `user_id` ASC, `platform_alarm_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for owner_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `owner_user_auth`;
CREATE TABLE `owner_user_auth`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '第三方登陆验证',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业id',
  `user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关联的用户ID',
  `login_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '认证类型：wechat、alipay、apple, JWT等等',
  `issuer` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '颁发者, jwt等不同网站来源',
  `identifier` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录唯一标识，如用户名、邮箱、openid、支付宝uid等',
  `last_login` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for owner_user_organize
-- ----------------------------
DROP TABLE IF EXISTS `owner_user_organize`;
CREATE TABLE `owner_user_organize`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户关联角色表',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应t_company的company_id',
  `user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应owner_user的user_id',
  `org_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应fleet和roule的guid',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_org`(`user_id` ASC, `org_id` ASC) USING BTREE,
  INDEX `idx_user_org`(`company_id` ASC, `user_id` ASC, `org_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for owner_user_role
-- ----------------------------
DROP TABLE IF EXISTS `owner_user_role`;
CREATE TABLE `owner_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户关联角色表',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应owner_user的user_id',
  `role_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应own_role的role_id',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_userrole`(`company_id` ASC, `user_id` ASC, `role_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for schedule_attendance
-- ----------------------------
DROP TABLE IF EXISTS `schedule_attendance`;
CREATE TABLE `schedule_attendance`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '当天司机签到情况',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'yyyy-mm-dd日期 忽略时区',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `emp_type` smallint NOT NULL DEFAULT 1 COMMENT '员工类型 0默认1 驾驶员 2乘务员 3站务',
  `emp_state` smallint NOT NULL DEFAULT 100 COMMENT '司机状态0正常, 10请假 100机动 1000当天没排班',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `archives_route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '档案线路ID',
  `archives_route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆档案线路名称',
  `plan_serial` smallint NULL DEFAULT NULL COMMENT '计划班次',
  `plan_work_time` datetime NULL DEFAULT NULL COMMENT '计划上班时间',
  `plan_car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划签到车辆车辆id',
  `plan_car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划签到车辆名称',
  `plan_lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `origin_station` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '起点站',
  `check_flag` smallint NOT NULL DEFAULT 0 COMMENT '最后状态0未签到 1签到 2签退',
  `check_time` datetime NULL DEFAULT NULL COMMENT '签到时间',
  `check_route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实际签到线路',
  `check_route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实际签到线路名称',
  `check_car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到车辆ID',
  `check_car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到车辆名称',
  `check_lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `is_work_late` int NULL DEFAULT 0 COMMENT '上班迟到',
  `is_leave_early` int NULL DEFAULT 0 COMMENT '下班早退',
  `spell` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首字母拼写',
  `first_check_time` datetime NULL DEFAULT NULL COMMENT '当天第一次刷卡时间',
  `last_check_time` datetime NULL DEFAULT NULL COMMENT '当天最后一次刷卡时间',
  `plan_table_id` int NULL DEFAULT NULL COMMENT '计划调度主表schedule_plan_table的ID',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '1 表示删除，0 表示未删除',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_attendance`(`company_id` ASC, `work_date` ASC, `emp_id` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `idx_attendance`(`work_date` ASC, `route_id` ASC) USING BTREE,
  INDEX `idx_date_route`(`company_id` ASC, `work_date` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for schedule_complaint
-- ----------------------------
DROP TABLE IF EXISTS `schedule_complaint`;
CREATE TABLE `schedule_complaint`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业ID',
  `complaint_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '投诉ID',
  `complaint_status` tinyint NOT NULL DEFAULT 0 COMMENT '工单状态: 0=录入工单, 10=处理中, 20=处理完成, 100=归档',
  `complaint_type` int NULL DEFAULT NULL COMMENT '投诉类型: 1=驾驶员行为, 2=调度/运营问题, 3=计费/结算问题, 10=其他',
  `urgency_level` tinyint NULL DEFAULT NULL COMMENT '紧急程度: 1=低, 2=中, 3=高, 4=紧急',
  `complaint_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '投诉标题',
  `complaint_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '投诉内容',
  `attachments` json NULL COMMENT '投诉图片列表(JSON数组)',
  `complainant_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '投诉人姓名',
  `complainant_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '投诉人联系方式',
  `event_time` datetime NULL DEFAULT NULL COMMENT '事件时间',
  `archive_time` datetime NULL DEFAULT NULL COMMENT '归档时间',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建人ID',
  `create_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_company_id`(`company_id` ASC) USING BTREE,
  INDEX `idx_complaint_no`(`complaint_no` ASC) USING BTREE,
  INDEX `idx_complaint_status`(`complaint_status` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公交投诉数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schedule_complaint_progress
-- ----------------------------
DROP TABLE IF EXISTS `schedule_complaint_progress`;
CREATE TABLE `schedule_complaint_progress`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业ID',
  `complaint_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '投诉ID',
  `progress_content` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '进度内容',
  `attachments` json NULL COMMENT '投诉图片列表(JSON数组)',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '创建人ID',
  `create_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_company_id`(`company_id` ASC) USING BTREE,
  INDEX `idx_complaint_no`(`complaint_no` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公交投诉数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schedule_health
-- ----------------------------
DROP TABLE IF EXISTS `schedule_health`;
CREATE TABLE `schedule_health`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `work_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `id_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证',
  `imei` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备唯一码, 过渡32, 实际很多表都还是16',
  `device_uuid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备唯一码, 32',
  `exam_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '体检ID',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `record_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗前检测一体机记录ID，患者每个体检项目不同ID也不同，非纯数字',
  `device_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '固定值（PREJOB）',
  `project_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组合项目代码（参考组合项目代码表）',
  `event_time` datetime NULL DEFAULT NULL COMMENT '项目体检时间, 多个记录一起上报取最小值',
  `has_abnormal` smallint NULL DEFAULT NULL COMMENT '是有有异常, 来源dataItem的abnormalIndicator',
  `data_item` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体检数据',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`company_id` ASC) USING BTREE,
  INDEX `idx_car_time`(`company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '驾驶员身份识别上报' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for schedule_idle
-- ----------------------------
DROP TABLE IF EXISTS `schedule_idle`;
CREATE TABLE `schedule_idle`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆id',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `idle_type` smallint NULL DEFAULT NULL COMMENT '非运营类型 0其他 1空放 2加油 3修车 4保养 5洗车 6事故 7年审 8通勤',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `start_mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT 'GPS里程',
  `end_mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT 'GPS里程',
  `real_mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '实际里程,默认值=计划里程',
  `gps_mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT 'GPS里程',
  `state` smallint NOT NULL DEFAULT 0 COMMENT '状态 0未执行 1执行中 2完成 3取消',
  `origin` smallint NOT NULL DEFAULT 0 COMMENT '来源 0调度 1导入 100补录 200排班',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `serial` smallint NOT NULL DEFAULT 0 COMMENT '当前班次,行号',
  `series` smallint NOT NULL DEFAULT 0 COMMENT '当前趟次，列号',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '1 表示删除，0 表示未删除',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_routename`(`company_id` ASC, `car_id` ASC) USING BTREE,
  INDEX `idx_routeid`(`company_id` ASC) USING BTREE,
  INDEX `idx_workdate`(`company_id` ASC, `work_date` ASC, `car_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for schedule_master
-- ----------------------------
DROP TABLE IF EXISTS `schedule_master`;
CREATE TABLE `schedule_master`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '日程安排表',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'yyyy-mm-dd日期 忽略时区',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `scheme_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营方案',
  `scheme_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方案名称',
  `serial` smallint NOT NULL COMMENT '班次',
  `class_type` smallint NOT NULL DEFAULT 0 COMMENT '班次类型 0正班 100机动',
  `first_time` datetime NULL DEFAULT NULL COMMENT '早班上班时间',
  `first_plan` datetime NULL DEFAULT NULL COMMENT '早班司机第一班发车时间',
  `first_direction` smallint NULL DEFAULT NULL COMMENT '早班方向 1上行2下行',
  `first_car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班车辆',
  `first_car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班司机工号',
  `first_emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班司机姓名',
  `first_conductor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班乘务员工号',
  `first_conductor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班乘务员姓名',
  `second_time` datetime NULL DEFAULT NULL COMMENT '中班上班时间',
  `second_plan` datetime NULL DEFAULT NULL COMMENT '中班第一班发车时间',
  `second_direction` smallint NULL DEFAULT NULL COMMENT '中班方向 1下行2上行',
  `second_car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班车辆',
  `second_car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `second_emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班司机工号',
  `second_emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班司机姓名',
  `second_conductor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班乘务员工号',
  `second_conductor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班乘务员姓名',
  `third_time` datetime NULL DEFAULT NULL COMMENT '晚班上班时间',
  `third_plan` datetime NULL DEFAULT NULL COMMENT '晚班第一班发车时间',
  `third_direction` smallint NULL DEFAULT NULL COMMENT '晚班方向 1下行2上行',
  `third_car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班车辆',
  `third_car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `third_emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班司机工号',
  `third_emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班司机姓名',
  `third_conductor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班乘务员工号',
  `third_conductor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班乘务员姓名',
  `is_night` smallint NOT NULL DEFAULT 0 COMMENT '夜班',
  `is_across` smallint NOT NULL DEFAULT 0 COMMENT '跨天',
  `attach` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其他附加 预留JSON',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ws`(`work_date` ASC, `scheme_id` ASC) USING BTREE,
  INDEX `idx_wr`(`work_date` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for schedule_plan
-- ----------------------------
DROP TABLE IF EXISTS `schedule_plan`;
CREATE TABLE `schedule_plan`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `run_route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运行线路id',
  `run_route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `plan_type` smallint NOT NULL DEFAULT 0 COMMENT '计划类型 0正常 1临时线路 2区间 3大站 4延长线 100包车',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆id',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `conductor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售票员工号',
  `conductor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售票号姓名',
  `direction` smallint NOT NULL COMMENT '方向',
  `table_depart` datetime NULL DEFAULT NULL COMMENT '原运营方案计划发车',
  `plan_depart` datetime NOT NULL COMMENT '计划发车',
  `real_depart` datetime NULL DEFAULT NULL COMMENT '实际发车',
  `table_arrive` datetime NULL DEFAULT NULL COMMENT '原运营方案计划到达',
  `plan_arrive` datetime NOT NULL COMMENT '计划到达',
  `real_arrive` datetime NULL DEFAULT NULL COMMENT '实际到达',
  `plan_mileage` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '计划里程',
  `real_mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '实际里程,默认值=计划里程',
  `gps_mileage` decimal(11, 3) NULL DEFAULT 0.000 COMMENT 'GPS里程',
  `state` smallint NOT NULL DEFAULT 0 COMMENT '计划状态 0未执行  1执行中 2完成 3取消',
  `is_scheduled` smallint UNSIGNED NOT NULL DEFAULT 1 COMMENT '0未排班 1已排班',
  `send_bus` smallint NULL DEFAULT 0 COMMENT '通知车辆',
  `send_screen` smallint NULL DEFAULT 0 COMMENT '通知调度屏',
  `add_id` smallint NULL DEFAULT NULL COMMENT '添加原因',
  `change_id` smallint NULL DEFAULT NULL COMMENT '变更原因',
  `cancel_id` smallint NULL DEFAULT NULL COMMENT '取消原因',
  `trips` decimal(11, 3) NOT NULL DEFAULT 1.000 COMMENT '趟次',
  `origin` smallint NOT NULL DEFAULT 0 COMMENT '来源 0排班 1进场排班 2请求排班 3立即排班 50调度添加 100补录',
  `table_serial` smallint NULL DEFAULT NULL COMMENT '原运营方案计划班次',
  `serial` smallint NOT NULL DEFAULT 0 COMMENT '当前班次',
  `series` smallint NOT NULL DEFAULT 0 COMMENT '当前趟次',
  `class_id` smallint NULL DEFAULT 0 COMMENT '班别  1早班  2中班  3晚班',
  `abnormal_id` smallint NULL DEFAULT NULL COMMENT '异常',
  `abnormal_time` datetime NULL DEFAULT NULL,
  `abnormal_stop` varchar(196) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `origin_station` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '起点站',
  `terminal_station` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终点站',
  `attach` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其他数据',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_time_out` smallint NOT NULL DEFAULT 0 COMMENT '超时标识 10预计发车超时 20发车已超时 30预计到达超时 40到达已超时',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '1 表示删除，0 表示未删除',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_crw`(`company_id` ASC, `route_id` ASC, `work_date` ASC) USING BTREE,
  INDEX `idx_wr`(`work_date` ASC, `route_id` ASC) USING BTREE,
  INDEX `idx_cwe`(`company_id` ASC, `work_date` ASC, `emp_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for schedule_plan_table
-- ----------------------------
DROP TABLE IF EXISTS `schedule_plan_table`;
CREATE TABLE `schedule_plan_table`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `run_code` int NULL DEFAULT NULL COMMENT '运行线路id,废弃',
  `run_route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运行线路id',
  `run_route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运行线路名称',
  `scheme_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营方案',
  `plan_type` smallint NOT NULL DEFAULT 0 COMMENT '计划类型 0正常 1包车 2区间 3大站',
  `trips` decimal(11, 3) NOT NULL DEFAULT 1.000 COMMENT '趟次',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆id',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `conductor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售票员工号',
  `conductor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售票员姓名',
  `direction` smallint NOT NULL COMMENT '方向 1下行2上行',
  `plan_depart` datetime NOT NULL COMMENT '计划发车',
  `plan_arrive` datetime NOT NULL COMMENT '计划到达',
  `plan_mileage` decimal(11, 3) NOT NULL COMMENT '计划里程',
  `serial` smallint NULL DEFAULT NULL COMMENT '当前班次',
  `series` smallint NULL DEFAULT NULL COMMENT '当前趟次',
  `state` smallint NULL DEFAULT 0 COMMENT '状态',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `class_id` smallint NOT NULL DEFAULT 1 COMMENT '班次1早2中3晚',
  `schedule_plan_id` int NULL DEFAULT NULL COMMENT '计划调度主表schedule_plan的ID',
  `origin_station` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '起点站',
  `terminal_station` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终点站',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `old_plan_depart` datetime NULL DEFAULT NULL COMMENT '原计划发车',
  `old_car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原车辆id',
  `old_car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原车辆名称',
  `old_emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原工号',
  `old_emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原姓名',
  `old_lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原车牌号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_work_date`(`company_id` ASC, `route_id` ASC, `work_date` ASC) USING BTREE,
  INDEX `idx_plan_id`(`company_id` ASC, `work_date` ASC, `schedule_plan_id` ASC) USING BTREE,
  INDEX `idx_date_emp`(`company_id` ASC, `work_date` ASC, `emp_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for schedule_request
-- ----------------------------
DROP TABLE IF EXISTS `schedule_request`;
CREATE TABLE `schedule_request`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '终端唯一码',
  `request_code` int NOT NULL DEFAULT 0 COMMENT '终端司机请求命令ID',
  `request_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端司机请求命令名称',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `event_code` int NOT NULL DEFAULT 0 COMMENT '事件代码',
  `bind_run_state` int NOT NULL DEFAULT 0 COMMENT '事件代码=其他的时候, 绑定的车辆运营状态',
  `bind_task_state` int NOT NULL DEFAULT 0 COMMENT '事件代码=其他的时候, 绑定的车辆任务状态',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `handle_code` int NULL DEFAULT 0 COMMENT '0未处理 1自动同意 2自动拒绝  100同意 200拒绝',
  `handle_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理账号',
  `handle_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理账号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_time`(`company_id` ASC, `route_id` ASC, `event_time` ASC) USING BTREE,
  INDEX `idx_time`(`company_id` ASC, `event_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for schedule_resource
-- ----------------------------
DROP TABLE IF EXISTS `schedule_resource`;
CREATE TABLE `schedule_resource`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `run_route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '运行线路id',
  `run_route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `archives_route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '档案线路ID',
  `archives_route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆档案线路名称',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆id',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '调度模式, 0计划调 1灵活调',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安装设备id',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `conductor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `conductor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `check_in` smallint NOT NULL DEFAULT 0 COMMENT '司机是否已签到',
  `run_state` int NOT NULL DEFAULT 100 COMMENT '0运营 1包车 10短休 >10加油  100退出运营等',
  `real_state` int NOT NULL DEFAULT 0 COMMENT '在线不在线等状态位',
  `in_field` smallint NOT NULL DEFAULT 1 COMMENT '在场内 0场外 1场内',
  `direction` smallint NOT NULL DEFAULT 1 COMMENT '方向',
  `serial` smallint NOT NULL DEFAULT 0 COMMENT '排班班次',
  `trips` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '当天完成运次',
  `total_trips` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '当天车辆总趟次',
  `use_id` int NOT NULL DEFAULT 0 COMMENT '当天运营计划ID',
  `plan_depart` datetime NULL DEFAULT NULL COMMENT '计划发车',
  `real_depart` datetime NULL DEFAULT NULL COMMENT '实际发车',
  `plan_arrive` datetime NULL DEFAULT NULL COMMENT '计划到达',
  `real_arrive` datetime NULL DEFAULT NULL COMMENT '实际到达',
  `depart_km` decimal(11, 3) NULL DEFAULT NULL COMMENT '出发时候的GPS里程',
  `on_time` smallint NOT NULL DEFAULT 0 COMMENT '发车0默认 1准点 2早发 3晚发',
  `task_id` smallint NOT NULL DEFAULT 0 COMMENT '回场任务',
  `user_time` datetime NULL DEFAULT NULL COMMENT '定点计划',
  `expect_station_count` smallint NULL DEFAULT 0 COMMENT '预期进站数量',
  `actual_station_count` smallint NULL DEFAULT 0 COMMENT '实际进站数量',
  `last_station_code` int NULL DEFAULT NULL COMMENT '最后进站编号',
  `last_station_direction` smallint NULL DEFAULT NULL COMMENT '最后进站方向',
  `last_station_serial` smallint NULL DEFAULT NULL COMMENT '最后进站站序',
  `last_station_time` datetime NULL DEFAULT NULL COMMENT '最后进站时间',
  `on_off_time` datetime NULL DEFAULT NULL COMMENT '上下线时间',
  `last_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后位置',
  `last_address_time` datetime NULL DEFAULT NULL COMMENT '最后位置更新时间',
  `previous_km` decimal(11, 3) NULL DEFAULT NULL COMMENT '过去5分钟行驶里程',
  `previous_km_time` datetime NULL DEFAULT NULL COMMENT '上一次时间戳',
  `plan_table_id` int NULL DEFAULT NULL COMMENT '计划调度主表schedule_plan_table的ID',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '1 表示删除，0 表示未删除',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_resource`(`company_id` ASC, `work_date` ASC, `car_id` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `idx_resource`(`work_date` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for schedule_suggestion
-- ----------------------------
DROP TABLE IF EXISTS `schedule_suggestion`;
CREATE TABLE `schedule_suggestion`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '司机ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '司机ID',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '司机姓名',
  `event_code` int NOT NULL DEFAULT 0 COMMENT '事件代码',
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `handle_code` int NULL DEFAULT 0 COMMENT '0未处理 1处理 2忽略关闭',
  `handle_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理账号',
  `handle_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理账号',
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加JSON信息',
  `plan_id` int NULL DEFAULT NULL COMMENT '计划表ID',
  `plan_depart` datetime NULL DEFAULT NULL COMMENT '计划发车',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_suggestion`(`company_id` ASC, `work_date` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for schedule_table
-- ----------------------------
DROP TABLE IF EXISTS `schedule_table`;
CREATE TABLE `schedule_table`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '日程安排表',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业Id',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'yyyy-mm-dd日期 忽略时区',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `scheme_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营方案',
  `serial` smallint NOT NULL COMMENT '班次',
  `class_type` smallint NOT NULL DEFAULT 0 COMMENT '班次类型 0正班 100机动',
  `first_time` datetime NULL DEFAULT NULL COMMENT '早班上班时间',
  `first_plan` datetime NULL DEFAULT NULL COMMENT '早班司机第一班发车时间',
  `first_direction` smallint NULL DEFAULT NULL COMMENT '早班方向 1下行2上行',
  `first_car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班车辆',
  `first_car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班车辆',
  `first_car_name_expect` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班车辆',
  `first_emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班司机工号',
  `first_emp_id_expect` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班司机工号',
  `first_emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班司机姓名',
  `first_emp_name_expect` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班司机姓名',
  `second_time` datetime NULL DEFAULT NULL COMMENT '中班上班时间',
  `second_plan` datetime NULL DEFAULT NULL COMMENT '中班第一班发车时间',
  `second_direction` smallint NULL DEFAULT NULL COMMENT '中班方向 1下行2上行',
  `second_car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班车辆',
  `second_car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班车辆',
  `second_car_name_expect` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班车辆',
  `second_emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班司机工号',
  `second_emp_id_expect` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班司机工号',
  `second_emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班司机姓名',
  `second_emp_name_except` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班司机姓名',
  `third_time` datetime NULL DEFAULT NULL COMMENT '晚班上班时间',
  `third_plan` datetime NULL DEFAULT NULL COMMENT '晚班第一班发车时间',
  `third_direction` smallint NULL DEFAULT NULL COMMENT '晚班方向 1下行2上行',
  `third_car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班车辆',
  `third_car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班车辆',
  `third_car_name_expect` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班车辆',
  `third_emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班司机工号',
  `third_emp_id_except` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班司机工号',
  `third_emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班司机姓名',
  `third_emp_name_except` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班司机姓名',
  `is_night` smallint NOT NULL DEFAULT 0 COMMENT '夜班',
  `is_across` smallint NOT NULL DEFAULT 0 COMMENT '跨天',
  `attach` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其他附加 预留JSON',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ws`(`company_id` ASC, `work_date` ASC, `scheme_id` ASC) USING BTREE,
  INDEX `idx_wr`(`company_id` ASC, `work_date` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for schedule_three_check
-- ----------------------------
DROP TABLE IF EXISTS `schedule_three_check`;
CREATE TABLE `schedule_three_check`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆id',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '车辆自编码',
  `weather` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '天气',
  `route_id` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `drive_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶员',
  `check_type` int NULL DEFAULT NULL COMMENT '1出车前 2行驶中 3收车后',
  `has_exception` smallint NULL DEFAULT NULL COMMENT '是否存在异常',
  `check_result` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查结果',
  `check_items` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '检查项目, 最多30',
  `check_images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '检查图片, 最多10张',
  `check_time` datetime NULL DEFAULT NULL COMMENT '检查时间',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_resource`(`company_id` ASC, `work_date` ASC, `car_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schedule_vacation
-- ----------------------------
DROP TABLE IF EXISTS `schedule_vacation`;
CREATE TABLE `schedule_vacation`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '员工请假表',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `vacation_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自编号',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `vacation_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '休假类型',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请假原因',
  `start_time` datetime NOT NULL COMMENT '休假开始日期',
  `end_time` datetime NULL DEFAULT NULL COMMENT '休假截止日期',
  `vacation_days` smallint NULL DEFAULT NULL COMMENT '休假的工作日天数',
  `state` smallint NOT NULL DEFAULT 0 COMMENT '0 初始化  1 提交申请  2审批通过  3审批拒绝',
  `target` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指定审批人',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cid_starttime`(`company_id` ASC, `start_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for scheme_date
-- ----------------------------
DROP TABLE IF EXISTS `scheme_date`;
CREATE TABLE `scheme_date`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '线路当天运营参数',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路企业',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期 yyyy-mm-dd',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `scheme_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营方案id',
  `scheme_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '运营方案名称',
  `way_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点ID',
  `scheme_work_time` int NOT NULL DEFAULT 0 COMMENT '方案计划工作时长',
  `schedule_work_time` int NOT NULL DEFAULT 0 COMMENT '排班工作时长',
  `scheme_plan_mileage` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '方案计划运营里程',
  `own_car_count` int NOT NULL DEFAULT 0 COMMENT '线路配车数量',
  `schedule_car_count` int NOT NULL DEFAULT 0 COMMENT '排班车辆',
  `own_emp_count` int NOT NULL DEFAULT 0 COMMENT '司机配额',
  `schedule_emp_count` int NOT NULL DEFAULT 0 COMMENT '排班司机',
  `scheme_plan_count` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '方案计划趟次',
  `schedule_plan_count` int NOT NULL DEFAULT 0 COMMENT '排班趟次',
  `scheme_serial_count` int NOT NULL DEFAULT 0 COMMENT '方案计划出勤班次',
  `schedule_serial_count` int NOT NULL DEFAULT 0 COMMENT '排班出勤班次',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_route_date`(`company_id` ASC, `work_date` ASC, `route_id` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `idx_route_route`(`company_id` ASC, `route_id` ASC, `work_date` ASC) USING BTREE,
  INDEX `idx_route_date`(`work_date` ASC, `company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for scheme_direction
-- ----------------------------
DROP TABLE IF EXISTS `scheme_direction`;
CREATE TABLE `scheme_direction`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '线路行驶方向',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业Id',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路id',
  `scheme_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营方案id',
  `run_route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运行支线线路id',
  `run_direction` smallint NULL DEFAULT 0 COMMENT '调度方向 1上行 2下行(暂时不用)',
  `direction` smallint NULL DEFAULT NULL COMMENT '采用调度方向 1上行 2下行 3环行',
  `origin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主站,站点导入时同步',
  `terminal` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '副站',
  `second_station` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '辅助第二站',
  `distance` decimal(11, 3) NULL DEFAULT NULL COMMENT '全长km',
  `first_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '首班发车时间',
  `last_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '末班发车时间',
  `first_shifts` int NULL DEFAULT 0 COMMENT '首发班次',
  `intervals` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发车间隔',
  `price` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '价格区间',
  `shifts` smallint NULL DEFAULT NULL COMMENT '发车班次',
  `total_trips` int NULL DEFAULT 0 COMMENT '预期单边总车次',
  `turning_time` int NULL DEFAULT 0 COMMENT '抵达停留时长后立即发车',
  `sort_id` int NULL DEFAULT NULL,
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_scheme_direction`(`company_id` ASC, `scheme_id` ASC, `direction` ASC) USING BTREE,
  INDEX `idx_route_scheme`(`company_id` ASC, `route_id` ASC, `scheme_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for scheme_first
-- ----------------------------
DROP TABLE IF EXISTS `scheme_first`;
CREATE TABLE `scheme_first`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '首班发车时间',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业Id',
  `scheme_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营方案ID',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `serial` int NOT NULL COMMENT '班次',
  `first_direction` smallint NULL DEFAULT NULL COMMENT '首班方向',
  `first_time` datetime NULL DEFAULT NULL COMMENT '首班上班时间',
  `first_plan` datetime NULL DEFAULT NULL COMMENT '首班发车时间',
  `second_direction` smallint NULL DEFAULT NULL COMMENT '中班上班时间',
  `second_time` datetime NULL DEFAULT NULL COMMENT '中班上班时间',
  `second_plan` datetime NULL DEFAULT NULL COMMENT '中班发车时间',
  `third_direction` smallint NULL DEFAULT NULL COMMENT '晚班发车方向',
  `third_time` datetime NULL DEFAULT NULL COMMENT '晚班上班时间',
  `third_plan` datetime NULL DEFAULT NULL COMMENT '晚班发车时间',
  `is_night` smallint NOT NULL DEFAULT 0 COMMENT '是否夜班',
  `is_across` smallint NOT NULL DEFAULT 0 COMMENT '是否跨天',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_scheme`(`company_id` ASC, `scheme_id` ASC) USING BTREE,
  INDEX `idx_route_scheme`(`company_id` ASC, `route_id` ASC, `scheme_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for scheme_group
-- ----------------------------
DROP TABLE IF EXISTS `scheme_group`;
CREATE TABLE `scheme_group`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '企业ID',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路ID',
  `start_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始日期',
  `scheme_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方案ID',
  `group_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '班组ID',
  `group_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '班组名称',
  `serial_shift_id` int NOT NULL DEFAULT 0 COMMENT '轮换顺序 0班次  1司机',
  `serial_shift_interval` int NOT NULL DEFAULT 0 COMMENT '几天变换一次',
  `shift_offset` int NOT NULL DEFAULT 0 COMMENT '班次偏移量, 负数前移，正数后移',
  `shifts_type` int NOT NULL DEFAULT 1 COMMENT '轮班 1单班 2双班 3三班',
  `reserved_count` int NOT NULL DEFAULT 0 COMMENT '顶班数量',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `emp_offset` int NULL DEFAULT NULL COMMENT '司机偏移量,废弃',
  `emp_shift_id` int NOT NULL DEFAULT 0 COMMENT '司机轮换规则,,废弃',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_group`(`company_id` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for scheme_group_member
-- ----------------------------
DROP TABLE IF EXISTS `scheme_group_member`;
CREATE TABLE `scheme_group_member`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT ' 序列号',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司ID',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `scheme_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方案ID',
  `group_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '班组ID',
  `serial_id` smallint NOT NULL DEFAULT 0 COMMENT '班次',
  `serial_type` smallint NOT NULL DEFAULT 0 COMMENT '班次类型 0正班 100机动',
  `first_car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班车辆',
  `first_car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班车辆',
  `first_emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班司机工号',
  `first_emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班司机姓名',
  `first_conductor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班乘务员工号',
  `first_conductor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '早班乘务员姓名',
  `second_car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班车辆',
  `second_car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班车辆',
  `second_emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班司机工号',
  `second_emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班司机姓名',
  `second_conductor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班乘务员工号',
  `second_conductor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中班乘务员姓名',
  `third_car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班车辆',
  `third_car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班车辆',
  `third_emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班司机工号',
  `third_emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班司机姓名',
  `third_conductor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班乘务员工号',
  `third_conductor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '晚班乘务员姓名',
  `emp_shift_id` int NOT NULL DEFAULT 0 COMMENT '偏移量 0固定 <0左移 >0右移',
  `emp_shift_interval` int NOT NULL DEFAULT 0 COMMENT '几天变换一次',
  `reserved_emp_id1` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '顶班司机工号1',
  `reserved_emp_name1` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '顶班司机1',
  `reserved_car_id1` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '顶班车辆1',
  `reserved_car_name1` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '顶班车辆1',
  `reserved_emp_id2` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '顶班驾驶员2',
  `reserved_emp_name2` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '顶班司机2',
  `reserved_car_id2` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '顶班车辆2',
  `reserved_car_name2` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '顶班车辆2',
  `sort_id` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member`(`company_id` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for scheme_idle
-- ----------------------------
DROP TABLE IF EXISTS `scheme_idle`;
CREATE TABLE `scheme_idle`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '非运营里程',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业Id',
  `scheme_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营方案id',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `serial` smallint NOT NULL DEFAULT 0 COMMENT '班次',
  `first_empty` decimal(10, 4) NULL DEFAULT NULL COMMENT '空放里程',
  `first_oil` decimal(10, 4) NULL DEFAULT NULL COMMENT '加油里程',
  `second_empty` decimal(10, 4) NULL DEFAULT NULL COMMENT '空放里程',
  `second_oil` decimal(10, 4) NULL DEFAULT NULL COMMENT '加油里程',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_scheme`(`company_id` ASC, `scheme_id` ASC) USING BTREE,
  INDEX `idx_route_scheme`(`company_id` ASC, `route_id` ASC, `scheme_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for scheme_master
-- ----------------------------
DROP TABLE IF EXISTS `scheme_master`;
CREATE TABLE `scheme_master`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `scheme_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营方案id',
  `scheme_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '方案编码',
  `scheme_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '方案名称',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `way_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路方案ID',
  `way_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主站,站点导入时同步',
  `dispatch_type` smallint NOT NULL DEFAULT 0 COMMENT '调度模式, 0计划调 1灵活调',
  `distribute_type` smallint NOT NULL DEFAULT 2 COMMENT '派发计划1单边派发 2两边派发',
  `single_direction` smallint NOT NULL DEFAULT 1 COMMENT '单边固定方向 1上行 2下行',
  `shifts_type` smallint NOT NULL DEFAULT 1 COMMENT '轮班 1单班 2双班 3三班',
  `open_time` datetime NOT NULL COMMENT '开通时间',
  `stop_time` datetime NULL DEFAULT NULL COMMENT '禁用时间',
  `tags` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `ticket` smallint NOT NULL DEFAULT 0 COMMENT '0无人售票 1有人售票',
  `state` smallint NOT NULL DEFAULT 0 COMMENT '0 初始化  1 提交申请  2审批通过  3审批拒绝',
  `plan_start` datetime NULL DEFAULT NULL COMMENT '计划调开始时间',
  `plan_end` datetime NULL DEFAULT NULL COMMENT '计划调恢复时间',
  `time_zone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '+08:00' COMMENT '设备台账时区',
  `trip_unit` decimal(11, 3) NULL DEFAULT 1.000 COMMENT '一趟的单位',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `check_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `check_account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核账号',
  `is_checked` int NULL DEFAULT 0 COMMENT '审核',
  `is_disable` smallint NOT NULL DEFAULT 0 COMMENT '禁用标记',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_default` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_scheme`(`company_id` ASC, `scheme_id` ASC) USING BTREE,
  INDEX `idx_route`(`company_id` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for scheme_param
-- ----------------------------
DROP TABLE IF EXISTS `scheme_param`;
CREATE TABLE `scheme_param`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业Id',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `scheme_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营方案id',
  `direction` smallint NOT NULL COMMENT '方向 1上行 2下行 3环行',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `val1` smallint NOT NULL DEFAULT 1 COMMENT '间隔1',
  `val2` smallint NULL DEFAULT NULL COMMENT '间隔2',
  `val3` smallint NULL DEFAULT NULL COMMENT '间隔3',
  `val4` smallint NULL DEFAULT NULL COMMENT '间隔4',
  `val5` smallint NULL DEFAULT NULL COMMENT '间隔5',
  `duration` smallint NOT NULL COMMENT '耗时 分钟',
  `peak_id` smallint NOT NULL DEFAULT 1 COMMENT '1平峰 2高峰 3低峰',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_scheme`(`company_id` ASC, `scheme_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for scheme_param_temp
-- ----------------------------
DROP TABLE IF EXISTS `scheme_param_temp`;
CREATE TABLE `scheme_param_temp`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '当天日期',
  `direction` smallint NOT NULL COMMENT '方向 1上行 2下行 3环行',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `val1` smallint NOT NULL DEFAULT 1 COMMENT '间隔1',
  `val2` smallint NULL DEFAULT NULL COMMENT '间隔2',
  `val3` smallint NULL DEFAULT NULL COMMENT '间隔3',
  `val4` smallint NULL DEFAULT NULL COMMENT '间隔4',
  `val5` smallint NULL DEFAULT NULL COMMENT '间隔5',
  `turning_time` int NULL DEFAULT 0 COMMENT '进终点换向时长,发车时间=进站+换向停留,大于0生效',
  `duration` smallint NOT NULL COMMENT '耗时 分钟',
  `peak_id` smallint NOT NULL DEFAULT 1 COMMENT '1平峰 2高峰 3低峰',
  `change_id` smallint NULL DEFAULT 0 COMMENT '调整原因',
  `is_enable` smallint NOT NULL DEFAULT 1 COMMENT '是否启用 1启用',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_scheme`(`work_date` ASC, `company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for scheme_route_time_period
-- ----------------------------
DROP TABLE IF EXISTS `scheme_route_time_period`;
CREATE TABLE `scheme_route_time_period`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '时段参数',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路名称',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `time_period_id` smallint NOT NULL DEFAULT 0 COMMENT '11=早1, 12=早2,  31=晚1, 32=晚2, 33=晚3, 34=晚4 ',
  `unit_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '时段单趟金额',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `is_deleted` int NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`company_id` ASC, `work_date` ASC, `route_id` ASC, `time_period_id` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `idx_service`(`company_id` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for scheme_station
-- ----------------------------
DROP TABLE IF EXISTS `scheme_station`;
CREATE TABLE `scheme_station`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站点',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业Id',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路自编码',
  `scheme_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营方案id',
  `run_route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运行支线线路id',
  `run_direction` smallint NULL DEFAULT 0 COMMENT '调度方向 1上行 2下行',
  `route_code` int NOT NULL COMMENT '线路编号,与车载统一',
  `direction` smallint NOT NULL COMMENT '线路站点方向 1下行2上行',
  `serial` smallint UNSIGNED NOT NULL COMMENT '站序，不能为负数',
  `station_id` int NULL DEFAULT NULL COMMENT '映射站点表的主键ID',
  `station_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点名称',
  `abridge` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩写',
  `flag` smallint NOT NULL DEFAULT 0 COMMENT '0中间站 1起点 255终点',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `azimuth` smallint NULL DEFAULT NULL COMMENT '方位角',
  `distance` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '距离起点的距离',
  `stop_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应站台id',
  `check_in` smallint NOT NULL DEFAULT 0 COMMENT '签到点',
  `big` smallint NULL DEFAULT 0 COMMENT '大站',
  `normal` smallint NULL DEFAULT NULL COMMENT '平峰考核到站时长',
  `peak` smallint NULL DEFAULT NULL COMMENT '高峰考核到站时长',
  `low` smallint NULL DEFAULT NULL COMMENT '低峰考核到站时长',
  `slow` smallint NULL DEFAULT 3 COMMENT '允许慢多少分钟',
  `fast` smallint NULL DEFAULT 3 COMMENT '允许快多少分钟',
  `depart` smallint NOT NULL DEFAULT 0 COMMENT '离开执行计划 0不检测 1进站检测 2出站检测 3进出站检测',
  `arrive` smallint NOT NULL DEFAULT 0 COMMENT '抵达完成计划 0不检测 1进站检测 2出站检测 3进出站检测',
  `is_deleted` int NULL DEFAULT 0,
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_scheme`(`company_id` ASC, `route_id` ASC, `scheme_id` ASC) USING BTREE,
  INDEX `idx_scheme`(`company_id` ASC, `scheme_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for scheme_table
-- ----------------------------
DROP TABLE IF EXISTS `scheme_table`;
CREATE TABLE `scheme_table`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业Id',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `scheme_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运营方案id',
  `serial` smallint NULL DEFAULT NULL COMMENT '行',
  `series` smallint NULL DEFAULT NULL COMMENT '列',
  `route_code` int NOT NULL DEFAULT 0 COMMENT '运行线路编码,废弃',
  `run_route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运行线路id',
  `run_route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运行线路名称',
  `direction` smallint NULL DEFAULT NULL COMMENT '行驶方向',
  `depart_time` datetime NULL DEFAULT NULL COMMENT '出发时间',
  `arrive_time` datetime NULL DEFAULT NULL COMMENT '抵达时间',
  `parking` int NULL DEFAULT NULL COMMENT '停靠时长',
  `intervals` int NULL DEFAULT NULL COMMENT '上一趟的发车间隔',
  `trips` decimal(11, 3) NULL DEFAULT NULL COMMENT '单位趟次',
  `distance` decimal(11, 3) NULL DEFAULT NULL COMMENT '全长km',
  `class_id` smallint NOT NULL DEFAULT 1 COMMENT '班次1早2中3晚',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_scheme`(`company_id` ASC, `scheme_id` ASC) USING BTREE,
  INDEX `idx_route_scheme`(`company_id` ASC, `route_id` ASC, `scheme_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for service_abnormal
-- ----------------------------
DROP TABLE IF EXISTS `service_abnormal`;
CREATE TABLE `service_abnormal`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '运营服务之预警',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `scheme_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营方案id',
  `scheme_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '当天方案名称',
  `check_time` datetime NOT NULL COMMENT '检测到的时间',
  `abnormal_type` int NOT NULL DEFAULT 0 COMMENT '考核类型 1发车大间隔 2串车 3大间隔 4站点久候 5长时间停车',
  `abnormal_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'JSON内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '事件utc时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_logevent`(`work_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for service_illegal
-- ----------------------------
DROP TABLE IF EXISTS `service_illegal`;
CREATE TABLE `service_illegal`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上报设备',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号码 License Plate Number',
  `vehicle_type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车型描述 来自basic_car_type表',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶员id',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶员姓名',
  `illegal_type` smallint NOT NULL DEFAULT 0 COMMENT '违规类型: 疲劳驾驶',
  `illegal_value` int NULL DEFAULT NULL COMMENT '违规值',
  `standard_value` int NULL DEFAULT NULL COMMENT '违规阀值',
  `start_time` datetime NOT NULL COMMENT '起点时间',
  `start_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '起点纬度,',
  `start_lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '起点经度',
  `start_mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '开始时的里程',
  `end_time` datetime NOT NULL COMMENT '终点时间',
  `end_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '终点纬度',
  `end_lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '终点经度',
  `end_mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '结束时的里程',
  `duration` int NULL DEFAULT 0 COMMENT '持续时长，单位秒',
  `parking_duration` int NULL DEFAULT 0 COMMENT '停车休息时长 s',
  `mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '里程 km',
  `speed` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '速度，km/h',
  `reduce_score` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '违规扣分',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_wr`(`work_date` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for service_on_time
-- ----------------------------
DROP TABLE IF EXISTS `service_on_time`;
CREATE TABLE `service_on_time`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '运营服务之大站考核',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `scheme_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运营方案id',
  `check_type` smallint NOT NULL DEFAULT 0 COMMENT '1 首末班 2发车正点 3大站 4全程',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `station_id` int NULL DEFAULT NULL COMMENT '站点表唯一ID',
  `station_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `route_code` int NULL DEFAULT NULL COMMENT '线路编码',
  `direction` smallint NULL DEFAULT NULL COMMENT '方向 1上行2下行',
  `serial` smallint NULL DEFAULT NULL COMMENT '站序',
  `use_plan_id` int NULL DEFAULT NULL COMMENT '计划表ID',
  `use_plan_state` smallint NOT NULL DEFAULT 0 COMMENT '计划状态 0未执行  1执行中 2完成 3取消',
  `plan_depart` datetime NULL DEFAULT NULL COMMENT '从起点计划发车时间',
  `real_depart` datetime NULL DEFAULT NULL COMMENT '从起点实际发车时间',
  `peak_id` smallint NOT NULL DEFAULT 1 COMMENT '1平峰 2高峰 3低峰',
  `plan_run_time` smallint NULL DEFAULT NULL COMMENT '计划用时(分)',
  `real_run_time` smallint NULL DEFAULT NULL COMMENT '实际用时(分)',
  `allow_slow` smallint NULL DEFAULT NULL COMMENT '允许慢(分)',
  `allow_fast` smallint NULL DEFAULT NULL COMMENT '允许快(分)',
  `result` smallint NULL DEFAULT NULL COMMENT '结果差值(分)',
  `plan_arrive` datetime NULL DEFAULT NULL COMMENT '计划抵达时间',
  `real_arrive` datetime NULL DEFAULT NULL COMMENT '实际抵达时间',
  `check_value` smallint NOT NULL DEFAULT 0 COMMENT '考核结果 1准点 2早到 3晚到',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '事件utc时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_company_data`(`company_id` ASC, `work_date` ASC) USING BTREE,
  INDEX `idx_data_company`(`work_date` ASC, `company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for service_over_speed
-- ----------------------------
DROP TABLE IF EXISTS `service_over_speed`;
CREATE TABLE `service_over_speed`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '持续超速-自增长id',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上报设备',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `fleet_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队ID',
  `fleet_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队名称',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶员工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶员姓名',
  `start_time` datetime NOT NULL COMMENT '起点时间',
  `start_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '起点纬度，一般指北纬',
  `start_lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '起点经度，一般指东经',
  `end_time` datetime NOT NULL COMMENT '终点时间',
  `end_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '终点纬度，一般指北纬',
  `end_lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '终点经度，一般指东经',
  `limit_speed` int NULL DEFAULT 0 COMMENT '限速值 km/h',
  `max_speed` int NULL DEFAULT 0 COMMENT '最大速度，km/h',
  `avg_speed` int NULL DEFAULT 0 COMMENT '平均速度，km/h',
  `duration` int NULL DEFAULT 0 COMMENT '超速持续时长，单位秒',
  `mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '里程 km',
  `station_id` int NULL DEFAULT NULL COMMENT '站点表唯一ID',
  `station_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `run_route_code` int NULL DEFAULT NULL COMMENT '运行线路|方向|站点',
  `run_route_direction` smallint NULL DEFAULT NULL,
  `run_route_serial` smallint NULL DEFAULT NULL,
  `run_state` int NOT NULL DEFAULT 0 COMMENT '运营状态 0运营 1包车 10短休 >10加油  100退出运营等',
  `depart_time` datetime NULL DEFAULT NULL COMMENT '发车时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_wr`(`work_date` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_av_rtp
-- ----------------------------
DROP TABLE IF EXISTS `system_av_rtp`;
CREATE TABLE `system_av_rtp`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业id',
  `node_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `node_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `protocol` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频协议',
  `rtp_host` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'RTP定向服务器地址',
  `rtp_tcp_port` int NULL DEFAULT NULL COMMENT 'RTP服务器定向端口',
  `pull_http_flv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拉流地址',
  `pull_rtmp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `talk_web_socket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对讲服务器客户端',
  `is_active` int NOT NULL DEFAULT 1 COMMENT '活跃的',
  `sort_id` int NULL DEFAULT 100 COMMENT '排序',
  `remark` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_av_srs
-- ----------------------------
DROP TABLE IF EXISTS `system_av_srs`;
CREATE TABLE `system_av_srs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业id',
  `node_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `node_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `protocol` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频协议',
  `push_rtmp_wan` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pull_rtmp_wan` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `push_rtmp_lan` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pull_http_wan` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '拉流地址',
  `pull_rtmp_lan` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pull_http_lan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拉流地址',
  `is_active` int NOT NULL DEFAULT 1 COMMENT '活跃的',
  `rtp_host` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'RTP定向服务器地址',
  `rtp_tcp_port` int NULL DEFAULT NULL COMMENT 'RTP服务器定向端口',
  `sort_id` int NULL DEFAULT 100 COMMENT '排序',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ak_prefix`(`company_id` ASC, `node_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_company
-- ----------------------------
DROP TABLE IF EXISTS `system_company`;
CREATE TABLE `system_company`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业id',
  `parent_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级id',
  `company_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业名称',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '左侧栏标题',
  `logo` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'citybus' COMMENT '主页logo',
  `home_page` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司网站主页',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业管理账号',
  `level` int NOT NULL DEFAULT 10 COMMENT '销售层级 10代理商 20分销商 30总经销 100平台',
  `archive_time` smallint NULL DEFAULT 7 COMMENT '数据封存多少天',
  `monthly_start_date` smallint NULL DEFAULT 1 COMMENT '月度报表起始日期',
  `module_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '选择的模块列表',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '城市中心经纬度',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '城市中心经纬度',
  `time_zone` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '+08:00' COMMENT '设备台账时区',
  `language` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'zh' COMMENT '默认语言,与登陆页面对应',
  `map_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地图key,JSON格式, type=地图类型,key=地图key',
  `push_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'APP推送配置KEY',
  `push_secret` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'APP推送配置秘钥',
  `company_config` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业级别的自定义配置 内容json形式',
  `morning_peak` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '07:00-09:00' COMMENT '早高峰时段',
  `late_peak` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '17:00-19:00' COMMENT '晚高峰时段',
  `authorized_vehicle_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '授权车辆数量，默认100',
  `sort_id` int NULL DEFAULT 100 COMMENT '排序id',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`company_id` ASC) USING BTREE,
  UNIQUE INDEX `uk_name`(`company_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_company_module
-- ----------------------------
DROP TABLE IF EXISTS `system_company_module`;
CREATE TABLE `system_company_module`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业id',
  `module_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模块id',
  `allow_access` smallint NOT NULL DEFAULT 0 COMMENT '0禁止访问 1允许访问',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`company_id` ASC, `module_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '平台版本信息',
  `config_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置key',
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置值',
  `config_prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置前缀, 比如spring.mail',
  `config_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置秘钥',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注描述',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_holidays
-- ----------------------------
DROP TABLE IF EXISTS `system_holidays`;
CREATE TABLE `system_holidays`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '优先查询本企业，没数据查询=0的企业',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期',
  `holidays_type` int NULL DEFAULT 0 COMMENT '0默认 100工作日 110补班 200周末 210法定节假',
  `holidays_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '假期描述。如元旦，春节等',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_company_date`(`company_id` ASC, `work_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_module
-- ----------------------------
DROP TABLE IF EXISTS `system_module`;
CREATE TABLE `system_module`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `module_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模块id',
  `parent_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '上级id',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单标题',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件名称',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'al-icon-genderless' COMMENT '图标',
  `path` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'url路径',
  `vue` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'vue文件路径 可以空',
  `redirect` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重定向',
  `opt` int NOT NULL DEFAULT 0 COMMENT '可用权限',
  `api` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '受控API',
  `is_ctrl` int NOT NULL DEFAULT 0 COMMENT '是否受控 0=普通用户、管理员可见 1=超级管理员可见',
  `is_hide` int NOT NULL DEFAULT 0 COMMENT '是否隐藏 0=否 1=是',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `category` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类别,主动安全,电子站牌等',
  `sort_id` int NULL DEFAULT 100 COMMENT '排序',
  `fix_company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指定企业可见',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位 1已删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_path`(`path` ASC) USING BTREE,
  UNIQUE INDEX `uk_id`(`module_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_module_datav
-- ----------------------------
DROP TABLE IF EXISTS `system_module_datav`;
CREATE TABLE `system_module_datav`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `module_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模块id',
  `parent_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '上级id',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单标题',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件名称',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'al-icon-genderless' COMMENT '图标',
  `path` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'url路径',
  `vue` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'vue文件路径 可以空',
  `redirect` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重定向',
  `opt` int NOT NULL DEFAULT 0 COMMENT '可用权限',
  `api` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '受控API',
  `is_ctrl` int NOT NULL DEFAULT 0 COMMENT '是否受控 0=普通用户、管理员可见 1=超级管理员可见',
  `is_hide` int NOT NULL DEFAULT 0 COMMENT '是否隐藏 0=否 1=是',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `category` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类别,主动安全,电子站牌等',
  `sort_id` int NULL DEFAULT 100 COMMENT '排序',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位 1已删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_path`(`path` ASC) USING BTREE,
  UNIQUE INDEX `uk_id`(`module_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_open_platform
-- ----------------------------
DROP TABLE IF EXISTS `system_open_platform`;
CREATE TABLE `system_open_platform`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '开放平台开发者账号',
  `app_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开发ID',
  `app_secret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开发秘钥',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `api_version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `white_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'API请求白名单',
  `minute_request_frequency` int NULL DEFAULT 0 COMMENT '每分钟允许请求次数',
  `delay_size` int NULL DEFAULT 0 COMMENT '延迟多少个请求才给数据',
  `delay_filter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据过滤器',
  `last_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后IP',
  `last_time` datetime NULL DEFAULT NULL COMMENT '最后时间',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_service`(`company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_regular_clean
-- ----------------------------
DROP TABLE IF EXISTS `system_regular_clean`;
CREATE TABLE `system_regular_clean`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '定时清理',
  `database_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '库名',
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表名',
  `data_rows` bigint NOT NULL DEFAULT 0 COMMENT '数据行',
  `data_length` bigint NOT NULL DEFAULT 0 COMMENT '数据长度(bit)',
  `index_length` bigint NOT NULL DEFAULT 0 COMMENT '索引长度',
  `is_backup` smallint NOT NULL DEFAULT 0 COMMENT '是否备份',
  `auto_backup_interval_days` smallint NOT NULL DEFAULT 3 COMMENT '备份间隔',
  `auto_backup_last_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '被执行时间',
  `is_clean` smallint NOT NULL DEFAULT 0 COMMENT '是否已经定期清理，启用和keep_data_days配合使用',
  `auto_clean_keep_days` int UNSIGNED NOT NULL DEFAULT 30 COMMENT '保留多少天数据, 只针对日志和循环覆盖数据，最小三天',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ix_table_name`(`database_name` ASC, `table_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_rule
-- ----------------------------
DROP TABLE IF EXISTS `system_rule`;
CREATE TABLE `system_rule`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `prefix` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `suffix` int NOT NULL DEFAULT 1,
  `remark` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ak_prefix`(`prefix` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `system_schema_history`;
CREATE TABLE `system_schema_history`  (
  `installed_rank` int NOT NULL,
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `script` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `checksum` int NULL DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`) USING BTREE,
  INDEX `system_schema_history_s_idx`(`success` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_service
-- ----------------------------
DROP TABLE IF EXISTS `system_service`;
CREATE TABLE `system_service`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '调度台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应system_company的company_id',
  `service_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应system_service的service_id',
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度后台服务名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`service_id` ASC) USING BTREE,
  INDEX `idx_service`(`company_id` ASC, `service_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_service_route
-- ----------------------------
DROP TABLE IF EXISTS `system_service_route`;
CREATE TABLE `system_service_route`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户关联角色表',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `service_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务台ID',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应basic_route的route_id',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_service_route`(`service_id` ASC, `route_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_shedlock
-- ----------------------------
DROP TABLE IF EXISTS `system_shedlock`;
CREATE TABLE `system_shedlock`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '定时器分布式锁',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lock_until` timestamp(3) NULL DEFAULT NULL,
  `locked_at` timestamp(3) NULL DEFAULT NULL,
  `locked_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_snippet
-- ----------------------------
DROP TABLE IF EXISTS `system_snippet`;
CREATE TABLE `system_snippet`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '调度台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应system_company的company_id',
  `snippet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息模板',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_service`(`company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_token_file
-- ----------------------------
DROP TABLE IF EXISTS `system_token_file`;
CREATE TABLE `system_token_file`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '调度台',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '对应system_company的company_id',
  `issuer` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '颁发者, jwt等不同网站来源',
  `private_key` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '私钥',
  `public_key` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公钥',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT '最后访问时间',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_service`(`company_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- View structure for gateway_device
-- ----------------------------
DROP VIEW IF EXISTS `gateway_device`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `gateway_device` AS select `t1`.`id` AS `id`,`t1`.`company_id` AS `company_id`,`t1`.`imei` AS `imei`,`t1`.`time_zone` AS `time_zone`,`t1`.`character_set` AS `character_set`,`t2`.`type_id` AS `type_id`,`t2`.`type_name` AS `type_name`,`t2`.`protocol` AS `protocol`,`t2`.`two_in_one` AS `two_in_one`,`t3`.`car_id` AS `car_id`,`t3`.`car_name` AS `car_name`,`t3`.`lpn` AS `lpn`,`t3`.`lpn_color` AS `lpn_color` from ((`basic_device` `t1` left join `basic_device_type` `t2` on((`t1`.`type_id` = `t2`.`type_id`))) left join `basic_car` `t3` on(((`t1`.`company_id` = `t3`.`company_id`) and (`t1`.`car_id` = `t3`.`car_id`))));

-- ----------------------------
-- View structure for v_device
-- ----------------------------
DROP VIEW IF EXISTS `v_device`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_device` AS select `t1`.`id` AS `id`,`t1`.`company_id` AS `cid`,`t1`.`imei` AS `devid`,`t1`.`time_zone` AS `timezone`,`t1`.`character_set` AS `character_set`,`t2`.`protocol` AS `protocol`,`t2`.`type_id` AS `typeid`,`t2`.`type_name` AS `typename`,`t2`.`two_in_one` AS `twoinone`,`t2`.`two_in_one` AS `two_in_one` from (`basic_device` `t1` left join `basic_device_type` `t2` on((`t1`.`type_id` = `t2`.`type_id`)));

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
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_api_route` AS select `basic_route`.`id` AS `id`,`basic_route`.`company_id` AS `company_id`,`basic_route`.`route_code` AS `route_code`,`basic_route`.`route_id` AS `route_id`,`basic_route`.`route_name` AS `route_name`,`basic_route`.`category` AS `category`,`basic_route`.`fleet_id` AS `fleet_id`,`basic_fleet`.`fleet_name` AS `fleet_name`,`basic_route`.`create_time` AS `create_time`,`basic_route`.`update_time` AS `update_time` from (`basic_route` left join `basic_fleet` on(((`basic_route`.`company_id` = `basic_fleet`.`company_id`) and (`basic_route`.`fleet_id` = `basic_fleet`.`fleet_id`)))) where (`basic_route`.`is_deleted` = 0);
-- ----------------------------
-- View structure for view_api_station
-- ----------------------------
DROP VIEW IF EXISTS `view_api_station`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_api_station` AS select `basic_route_station`.`id` AS `id`,`basic_route_station`.`company_id` AS `company_id`,`basic_route_station`.`route_id` AS `route_id`,`basic_route_station`.`route_code` AS `route_code`,`basic_route_station`.`direction` AS `direction`,`basic_route_station`.`serial` AS `serial`,`basic_route_station`.`station_name` AS `station_name`,`basic_route_station`.`flag` AS `flag`,`basic_route_station`.`lng` AS `lng`,`basic_route_station`.`lat` AS `lat`,`basic_route_station`.`distance` AS `distance`,`basic_route_station`.`create_time` AS `create_time`,`basic_route_station`.`update_time` AS `update_time` from (`basic_route` join `basic_route_station`) where ((`basic_route`.`company_id` = `basic_route_station`.`company_id`) and (`basic_route`.`route_id` = `basic_route_station`.`route_id`) and (`basic_route`.`way_id` = `basic_route_station`.`way_id`) and (`basic_route`.`is_deleted` = 0) and (`basic_route_station`.`is_deleted` = 0));

-- ----------------------------
-- View structure for view_basic_car
-- ----------------------------
DROP VIEW IF EXISTS `view_basic_car`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_basic_car` AS select `t1`.`id` AS `id`,`t1`.`company_id` AS `company_id`,`t1`.`car_id` AS `car_id`,`t1`.`car_name` AS `car_name`,`t1`.`car_state` AS `car_state`,`t1`.`vin` AS `vin`,`t1`.`lpn` AS `lpn`,`t1`.`lpn_color` AS `lpn_color`,`t1`.`fleet_id` AS `fleet_id`,`t5`.`fleet_name` AS `fleet_name`,`t1`.`route_id` AS `route_id`,`t1`.`img_url` AS `img_url`,`t1`.`icon` AS `icon`,`t1`.`register_time` AS `register_time`,`t1`.`expire_time` AS `expire_time`,`t1`.`expire_verify` AS `expire_verify`,`t1`.`approved_number` AS `approved_number`,`t1`.`fuel_km` AS `fuel_km`,`t1`.`fuel_hours` AS `fuel_hours`,`t1`.`fuel_tank` AS `fuel_tank`,`t1`.`iode_fine` AS `iode_fine`,`t1`.`has_ac` AS `has_ac`,`t1`.`mileage` AS `mileage`,`t1`.`contract_no` AS `contract_no`,`t1`.`equipment_count` AS `equipment_count`,`t1`.`seat_map` AS `seat_map`,`t1`.`remark` AS `remark`,`t1`.`vehicle_provider` AS `vehicle_provider`,`t1`.`vehicle_type` AS `vehicle_type`,`t1`.`vehicle_type_id` AS `vehicle_type_id`,`t1`.`vehicle_source` AS `vehicle_source`,`t1`.`fixed_emp_id` AS `fixed_emp_id`,`t1`.`fixed_emp_name` AS `fixed_emp_name`,`t1`.`driving_license_time` AS `driving_license_time`,`t1`.`compulsory_insurance_time` AS `compulsory_insurance_time`,`t1`.`commercial_insurance_time` AS `commercial_insurance_time`,`t1`.`next_inspection_time` AS `next_inspection_time`,`t1`.`next_maintenance_time` AS `next_maintenance_time`,`t1`.`registration_number` AS `registration_number`,`t1`.`vehicle_model` AS `vehicle_model`,`t1`.`tax_due_date` AS `tax_due_date`,`t1`.`contract_expiration_date` AS `contract_expiration_date`,`t1`.`unit_id` AS `unit_id`,`t1`.`vehicle_options` AS `vehicle_options`,`t1`.`is_deleted` AS `is_deleted`,`t1`.`create_user_id` AS `create_user_id`,`t1`.`create_time` AS `create_time`,`t1`.`update_time` AS `update_time`,`t2`.`route_name` AS `route_name`,`t3`.`imei` AS `imei`,`t3`.`type_id` AS `type_id`,`t3`.`channel` AS `channel`,`t3`.`connect_state` AS `connect_state`,`t3`.`last_connect_time` AS `last_connect_time`,`t4`.`vehicle_type` AS `vehicle_type_name` from ((((`basic_car` `t1` left join `basic_route` `t2` on(((`t1`.`company_id` = `t2`.`company_id`) and (`t1`.`route_id` = `t2`.`route_id`)))) left join `basic_device` `t3` on(((`t1`.`company_id` = `t3`.`company_id`) and (`t1`.`car_id` = `t3`.`car_id`) and (`t3`.`is_slave` = 0)))) left join `basic_car_type` `t4` on(((`t1`.`vehicle_type_id` = `t4`.`vehicle_type_id`) and (`t1`.`company_id` = `t4`.`company_id`)))) left join `basic_fleet` `t5` on((`t1`.`fleet_id` = `t5`.`fleet_id`))) where (`t1`.`is_deleted` = 0);

-- ----------------------------
-- View structure for view_basic_device
-- ----------------------------
DROP VIEW IF EXISTS `view_basic_device`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_basic_device` AS select `t1`.`id` AS `id`,`t1`.`company_id` AS `company_id`,`t1`.`imei` AS `imei`,`t1`.`fleet_id` AS `fleet_id`,`t1`.`type_id` AS `type_id`,`t1`.`car_id` AS `car_id`,`t1`.`register_time` AS `register_time`,`t1`.`expire_time` AS `expire_time`,`t1`.`time_zone` AS `time_zone`,`t1`.`character_set` AS `character_set`,`t1`.`channel` AS `channel`,`t1`.`is_slave` AS `is_slave`,`t1`.`remark` AS `remark`,`t1`.`firmware` AS `firmware`,`t1`.`version_no` AS `version_no`,`t1`.`ban_hint` AS `ban_hint`,`t1`.`bind_user_id` AS `bind_user_id`,`t1`.`connect_state` AS `connect_state`,`t1`.`first_connect_time` AS `first_connect_time`,`t1`.`last_connect_time` AS `last_connect_time`,`t1`.`create_user_id` AS `create_user_id`,`t1`.`is_deleted` AS `is_deleted`,`t1`.`create_time` AS `create_time`,`t1`.`update_time` AS `update_time`,`t1`.`attached` AS `attached`,`t2`.`type_name` AS `type_name`,`t2`.`support` AS `support`,`t2`.`notice` AS `notice`,`t2`.`tags` AS `tags`,`t3`.`fleet_name` AS `fleet_name`,`t4`.`car_name` AS `car_name`,`t4`.`lpn` AS `lpn`,`t4`.`vehicle_type` AS `vehicle_type`,`t5`.`route_id` AS `route_id`,`t5`.`route_name` AS `route_name` from ((((`basic_device` `t1` left join `basic_device_type` `t2` on((`t1`.`type_id` = `t2`.`type_id`))) left join `basic_fleet` `t3` on(((`t1`.`company_id` = `t3`.`company_id`) and (`t1`.`fleet_id` = `t3`.`fleet_id`)))) left join `basic_car` `t4` on(((`t1`.`company_id` = `t4`.`company_id`) and (`t1`.`car_id` = `t4`.`car_id`)))) left join `basic_route` `t5` on(((`t4`.`company_id` = `t5`.`company_id`) and (`t4`.`route_id` = `t5`.`route_id`)))) where (`t1`.`is_deleted` = 0);

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
;
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
	CALL create_partition_by_month('gps', 'device_position');
	CALL create_partition_by_month('gps', 'device_depart_arrive');
	CALL create_partition_by_month('gps', 'device_alarm');
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
