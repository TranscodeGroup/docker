/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1_广西恭城
 Source Server Type    : MySQL
 Source Server Version : 50730 (5.7.30)
 Source Host           : 127.0.0.1:3366
 Source Schema         : gps

 Target Server Type    : MySQL
 Target Server Version : 50730 (5.7.30)
 File Encoding         : 65001

 Date: 13/05/2025 19:57:49
*/

-- 创建gps数据库
CREATE DATABASE IF NOT EXISTS gps DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE gps;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for device_alarm
-- ----------------------------
DROP TABLE IF EXISTS `device_alarm`;
CREATE TABLE `device_alarm`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备编号',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
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
  `operator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作者',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '已读备注',
  `route_code` int(11) NULL DEFAULT NULL COMMENT '线路编号',
  `direction` smallint(6) NULL DEFAULT NULL COMMENT '方向',
  `serial` smallint(6) NULL DEFAULT NULL COMMENT '站序',
  `attached` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加JSON',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `event_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `event_time`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `event_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (TO_DAYS(event_time))
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
-- Table structure for device_alarm_file
-- ----------------------------
DROP TABLE IF EXISTS `device_alarm_file`;
CREATE TABLE `device_alarm_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备最新版本信息',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备id',
  `file_server` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'file-server' COMMENT '文件服务器',
  `alarm_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台给报警分配的唯一编号',
  `relative_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件路径',
  `file_size` int(11) NOT NULL COMMENT '文件大小',
  `file_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '文件类型0图片1音频2视频3文本4其他',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务器时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_alarm_key`(`company_id`, `alarm_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for device_alarm_safety
-- ----------------------------
DROP TABLE IF EXISTS `device_alarm_safety`;
CREATE TABLE `device_alarm_safety`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主动安全报警',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备编号',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运营线路员工ID',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运营线路员工名称',
  `alarm_id` int(11) NOT NULL DEFAULT 0 COMMENT '报警自增ID',
  `device_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '外设类型',
  `flag_status` smallint(6) NOT NULL DEFAULT 0 COMMENT '标志状态',
  `alarm_type` int(11) NOT NULL DEFAULT 0 COMMENT '报警/事件类型',
  `alarm_level` smallint(6) NOT NULL DEFAULT 0 COMMENT '报警级别',
  `alarm_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报警详情',
  `alarm_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报警唯一编号',
  `speed` int(11) NULL DEFAULT 0 COMMENT '速度，km/h',
  `height` int(11) NULL DEFAULT 0 COMMENT '海拔米',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度，一般指东经',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `event_time` datetime NULL DEFAULT NULL COMMENT '事件时间',
  `vehicle_state` int(11) NULL DEFAULT 0 COMMENT '车辆状态',
  `terminal_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端 ID',
  `mark_time` datetime NULL DEFAULT NULL COMMENT '标识内部时间',
  `serial_number` int(11) NULL DEFAULT 0 COMMENT '同一时间报警序号',
  `attached_count` smallint(6) NULL DEFAULT 0 COMMENT '附件数量',
  `read_status` int(11) NOT NULL DEFAULT 0 COMMENT '读取状态，0未读 1自动  100人为',
  `update_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `update_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理内容',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业对应时区的日期字符串',
  `time_zone` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应时区',
  `period_time` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '落在的分时段区间 例如：08:00 ~ 08:30',
  `reduce_score` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '一次违规扣分多少',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `event_time`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `event_time`) USING BTREE,
  INDEX `idx_work_date`(`company_id`, `work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for device_card
-- ----------------------------
DROP TABLE IF EXISTS `device_card`;
CREATE TABLE `device_card`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '终端唯一码',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `card_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡号',
  `card_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '刷卡数据',
  `check_in` smallint(6) NULL DEFAULT NULL COMMENT '0签退 1签到',
  `is_valid` smallint(6) NULL DEFAULT NULL COMMENT '0非法 1合法',
  `last_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓',
  `first_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名',
  `mister` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '尊称',
  `country` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家代码',
  `personal` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `expire` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效期',
  `birthday` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生日',
  `card_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡类型',
  `sex` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `place_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域代码',
  `lng` decimal(11, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(11, 6) NULL DEFAULT NULL COMMENT '纬度',
  `mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '累计里程 km',
  `receive_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '接收时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_card_time`(`company_id`, `car_id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `event_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for device_cmd_request
-- ----------------------------
DROP TABLE IF EXISTS `device_cmd_request`;
CREATE TABLE `device_cmd_request`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '终端唯一码',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `route_code` int(11) NOT NULL COMMENT '线路编号',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `request_code` int(11) NOT NULL DEFAULT 0 COMMENT '终端司机请求命令ID',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_card`(`imei`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for device_connect
-- ----------------------------
DROP TABLE IF EXISTS `device_connect`;
CREATE TABLE `device_connect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备最新版本信息',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备id',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `connect_flag` int(11) NOT NULL DEFAULT 0 COMMENT '0断开连接 1建立连接 ',
  `connect_time` datetime NOT NULL COMMENT '连接时间',
  `disconnect_time` datetime NULL DEFAULT NULL COMMENT '断开时间',
  `connect_duration` int(11) NULL DEFAULT NULL COMMENT '持续时长秒',
  `address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `remark` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务器时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `connect_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `connect_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `connect_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for device_depart_arrive
-- ----------------------------
DROP TABLE IF EXISTS `device_depart_arrive`;
CREATE TABLE `device_depart_arrive`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '终端唯一码',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `flag` smallint(6) NOT NULL DEFAULT 10 COMMENT '1到站 2离站',
  `route_code` int(11) NOT NULL DEFAULT 0 COMMENT '运行线路编号',
  `direction` smallint(6) NOT NULL DEFAULT 0 COMMENT '方向 1下行 2上行',
  `serial` smallint(6) NOT NULL COMMENT '车站序号 上下行从1开始',
  `station_id` bigint(20) NULL DEFAULT NULL COMMENT '对应站点表的唯一ID',
  `station_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `station_flag` smallint(6) NULL DEFAULT 0 COMMENT '0中间站 1起点 255终点',
  `stop_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站台编码',
  `stop_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点编号',
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
  `way_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点方案ID',
  `depart_time` datetime NULL DEFAULT NULL COMMENT '起点出发时间',
  `expected_duration` int(11) NULL DEFAULT NULL COMMENT '预期从起点耗时,秒',
  `actual_duration` int(11) NULL DEFAULT NULL COMMENT '实际从起点耗时,秒',
  `expected_mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '预期里程',
  `actual_mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '实际里程',
  `attached` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加数据',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `event_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `event_time`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_code`, `event_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (TO_DAYS(event_time))
PARTITIONS 47
(PARTITION `p_202101` VALUES LESS THAN (738187) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202102` VALUES LESS THAN (738215) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202103` VALUES LESS THAN (738246) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202104` VALUES LESS THAN (738276) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202105` VALUES LESS THAN (738307) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202106` VALUES LESS THAN (738337) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202107` VALUES LESS THAN (738368) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202108` VALUES LESS THAN (738399) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
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
-- Table structure for device_display
-- ----------------------------
DROP TABLE IF EXISTS `device_display`;
CREATE TABLE `device_display`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `display_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '终端唯一码',
  `warning` int(11) NULL DEFAULT NULL COMMENT '报警',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `origin` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'APP或WEB',
  `response_data` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应答数据',
  `display_time` datetime NULL DEFAULT NULL,
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`, `event_time`) USING BTREE,
  INDEX `ix_imei_time`(`display_id`, `event_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for device_file_upload
-- ----------------------------
DROP TABLE IF EXISTS `device_file_upload`;
CREATE TABLE `device_file_upload`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件上传id',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备号',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
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
  `relative_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `upload_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `serial` int(11) NULL DEFAULT 0 COMMENT '应答流水号',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求用户',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_file_upload`(`company_id`, `start_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for device_illegal
-- ----------------------------
DROP TABLE IF EXISTS `device_illegal`;
CREATE TABLE `device_illegal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备最新版本信息',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应时区的日期字符串',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备id',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `route_code` int(11) NULL DEFAULT NULL COMMENT '线路编码',
  `illegal_flag` int(11) NOT NULL DEFAULT 0 COMMENT '预留，0开始 1结束',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶员id',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶员姓名',
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
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `station_id` int(11) NULL DEFAULT NULL COMMENT '站点表ID',
  `station_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `reduce_score` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '违规扣分',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务器时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `time_zone` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应时区',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `event_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `event_time`) USING BTREE,
  INDEX `device_illegal_company_id_IDX`(`company_id`, `work_date`, `route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for device_over_speed
-- ----------------------------
DROP TABLE IF EXISTS `device_over_speed`;
CREATE TABLE `device_over_speed`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '持续超速-自增长id',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备编号',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `over_type` int(11) NOT NULL DEFAULT 0 COMMENT '0开始超速 1结束超速',
  `start_state` int(11) NULL DEFAULT NULL COMMENT '开始超速时的状态',
  `start_time` datetime NULL DEFAULT NULL COMMENT '起点时间',
  `start_station_id` int(11) NULL DEFAULT NULL COMMENT '超速开始站点ID',
  `start_station_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '超速开始站点名称',
  `start_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '起点纬度，一般指北纬',
  `start_lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '起点经度，一般指东经',
  `start_mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '开始里程',
  `end_state` int(11) NULL DEFAULT NULL COMMENT '结束超速时的状态',
  `end_time` datetime NULL DEFAULT NULL COMMENT '终点时间',
  `end_station_id` int(11) NULL DEFAULT NULL COMMENT '超速结束站点ID',
  `end_station_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '超速结束站点名称',
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
  `run_route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `run_route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`company_id`, `start_time`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `start_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `start_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for device_passenger
-- ----------------------------
DROP TABLE IF EXISTS `device_passenger`;
CREATE TABLE `device_passenger`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备最新版本信息',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备id',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
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
  `station_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `station_flag` int(11) NULL DEFAULT 0 COMMENT '0中间站 1起点 255终点',
  `stop_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站台ID',
  `stop_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点编号',
  `way_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路方案',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务器时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_code`, `upload_time`) USING BTREE,
  INDEX `idx_stop_time`(`company_id`, `stop_id`, `upload_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `upload_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for device_poi
-- ----------------------------
DROP TABLE IF EXISTS `device_poi`;
CREATE TABLE `device_poi`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '终端唯一码',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `stop_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站台ID',
  `stop_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站台名称',
  `flag` smallint(6) NOT NULL DEFAULT 0 COMMENT '1到站 2离站',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路名称',
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for device_position
-- ----------------------------
DROP TABLE IF EXISTS `device_position`;
CREATE TABLE `device_position`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '终端唯一码',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
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
  `attached` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加数据',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `event_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `event_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 756 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (TO_DAYS(event_time))
PARTITIONS 47
(PARTITION `p_202101` VALUES LESS THAN (738187) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202102` VALUES LESS THAN (738215) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202103` VALUES LESS THAN (738246) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202104` VALUES LESS THAN (738276) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202105` VALUES LESS THAN (738307) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202106` VALUES LESS THAN (738337) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202107` VALUES LESS THAN (738368) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_202108` VALUES LESS THAN (738399) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
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
-- Table structure for device_region
-- ----------------------------
DROP TABLE IF EXISTS `device_region`;
CREATE TABLE `device_region`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '终端唯一码',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `route_code` int(11) NULL DEFAULT NULL COMMENT '线路编号',
  `event_type` int(11) NULL DEFAULT NULL COMMENT '1:进；2:出',
  `business_type` int(11) NULL DEFAULT NULL COMMENT '业务类型 见表13',
  `region_code` int(11) NULL DEFAULT NULL COMMENT '定点编号',
  `region_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自编码',
  `region_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站台名称',
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
  `attached` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加数据',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`company_id`, `event_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `event_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for device_seat
-- ----------------------------
DROP TABLE IF EXISTS `device_seat`;
CREATE TABLE `device_seat`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主动安全报警',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备编号',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for device_seat_last
-- ----------------------------
DROP TABLE IF EXISTS `device_seat_last`;
CREATE TABLE `device_seat_last`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主动安全报警',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备编号',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `seat_map` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '座位表[z1-x1-y1, z2-x2-y2]',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `lng` decimal(11, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(11, 6) NULL DEFAULT NULL COMMENT '纬度',
  `speed` smallint(6) NULL DEFAULT NULL COMMENT '速度',
  `azimuth` smallint(6) NULL DEFAULT NULL COMMENT '方位角',
  `json_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '安全带设备状态最后修改时间',
  `last_update_time` datetime NULL DEFAULT NULL COMMENT '安全带设备状态最后修改时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产生时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_imei`(`company_id`, `imei`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for device_self_check
-- ----------------------------
DROP TABLE IF EXISTS `device_self_check`;
CREATE TABLE `device_self_check`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备最新版本信息',
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备id',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
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
  `storage_list` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储信息列表数,json',
  `upload_time` datetime NULL DEFAULT NULL COMMENT '终端上报时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务器时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `upload_time`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `upload_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `upload_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for device_snap
-- ----------------------------
DROP TABLE IF EXISTS `device_snap`;
CREATE TABLE `device_snap`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备id',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `chn` smallint(6) NULL DEFAULT NULL COMMENT '通道号',
  `snap_type` int(8) NOT NULL DEFAULT 0 COMMENT '0 平台指令抓拍 参照808协议，扩展100+',
  `snap_time` datetime NOT NULL COMMENT '拍照时间',
  `img_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件存储路径',
  `lng` decimal(11, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(11, 6) NULL DEFAULT NULL COMMENT '纬度',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `direction` smallint(6) NULL DEFAULT NULL COMMENT '方向',
  `station_id` int(11) NULL DEFAULT NULL COMMENT '站点表唯一ID',
  `stop_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站台ID',
  `media_id` int(11) NULL DEFAULT NULL COMMENT '抓拍到的多媒体ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `snap_time`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `snap_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `snap_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for device_snap_list
-- ----------------------------
DROP TABLE IF EXISTS `device_snap_list`;
CREATE TABLE `device_snap_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `snap_id` int(11) NULL DEFAULT NULL COMMENT '抓拍表ID',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备id',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `media_id` int(11) NULL DEFAULT NULL COMMENT '抓拍到的多媒体ID',
  `snap_type` int(8) NOT NULL DEFAULT 0 COMMENT '0 平台指令抓拍 参照808协议，扩展100+',
  `chn` smallint(6) NULL DEFAULT NULL COMMENT '通道号',
  `lng` decimal(11, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(11, 6) NULL DEFAULT NULL COMMENT '纬度',
  `snap_time` datetime NOT NULL COMMENT '拍照时间',
  `img_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件存储路径',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_car_time`(`company_id`, `car_id`, `snap_time`) USING BTREE,
  INDEX `idx_route_time`(`company_id`, `route_id`, `snap_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `snap_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for device_version
-- ----------------------------
DROP TABLE IF EXISTS `device_version`;
CREATE TABLE `device_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备id',
  `car_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `car_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `protocol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '协议版本',
  `firmware` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '固件版本',
  `site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报站文件版本',
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备唯一ID',
  `upload_time` datetime NOT NULL COMMENT '上报时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_version`(`company_id`, `car_id`, `upload_time`) USING BTREE,
  INDEX `idx_imei`(`imei`, `upload_time`) USING BTREE,
  INDEX `idx_time`(`company_id`, `upload_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
