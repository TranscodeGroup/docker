/*
 Navicat Premium Data Transfer

 Source Server         : tg.ci-server
 Source Server Type    : MySQL
 Source Server Version : 80405 (8.4.5)
 Source Host           : 127.0.0.1:9063
 Source Schema         : analytics

 Target Server Type    : MySQL
 Target Server Version : 80405 (8.4.5)
 File Encoding         : 65001

 Date: 06/11/2025 09:50:23
*/

-- 创建analytics数据库
CREATE DATABASE IF NOT EXISTS analytics DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE analytics;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for passenger_daily_stop_route
-- ----------------------------
DROP TABLE IF EXISTS `passenger_daily_stop_route`;
CREATE TABLE `passenger_daily_stop_route`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stop_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '站台编码',
  `stop_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站台名称',
  `route_code` int NOT NULL COMMENT '线路id',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `sample_count` int UNSIGNED NOT NULL COMMENT '采样数量',
  `total_passenger` int UNSIGNED NOT NULL COMMENT '累计客流',
  `week_id` smallint NOT NULL DEFAULT 0 COMMENT '星期1 2 3 4 5 6 7',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_date`(`company_id` ASC, `route_id` ASC, `work_date` ASC) USING BTREE,
  INDEX `idx_route_code_date`(`company_id` ASC, `route_code` ASC, `work_date` ASC) USING BTREE,
  INDEX `idx_stop_date`(`company_id` ASC, `stop_id` ASC, `work_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56223 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for passenger_period_route
-- ----------------------------
DROP TABLE IF EXISTS `passenger_period_route`;
CREATE TABLE `passenger_period_route`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '使用企业时区转换的日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `route_code` int NULL DEFAULT NULL COMMENT '线路id',
  `start_time` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开始时间',
  `end_time` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '结束时间',
  `time_zone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  `sample_count` int UNSIGNED NOT NULL COMMENT '采样数量',
  `total_passenger` int UNSIGNED NOT NULL COMMENT '客流之和',
  `week_id` smallint NOT NULL DEFAULT 0 COMMENT '星期1 2 3 4 5 6 7',
  `peak_id` smallint NOT NULL DEFAULT 0 COMMENT '0平峰 1早高峰 2晚高峰 3低峰',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_date`(`company_id` ASC, `route_id` ASC, `work_date` ASC) USING BTREE,
  INDEX `idx_route_code_date`(`company_id` ASC, `route_code` ASC, `work_date` ASC) USING BTREE,
  INDEX `idx_route_code_date_time`(`company_id` ASC, `work_date` ASC, `route_code` ASC, `start_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38345 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for passenger_period_stop
-- ----------------------------
DROP TABLE IF EXISTS `passenger_period_stop`;
CREATE TABLE `passenger_period_stop`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '使用企业时区转换的日期',
  `start_time` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开始时间',
  `end_time` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '结束时间',
  `stop_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '站台编码',
  `stop_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站台名称',
  `stop_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点编号',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `route_code` int NULL DEFAULT NULL COMMENT '线路id',
  `time_zone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  `sample_count` int UNSIGNED NOT NULL COMMENT '采样数量',
  `total_passenger` int UNSIGNED NOT NULL COMMENT '客流之和',
  `sample_count_down` int UNSIGNED NULL DEFAULT NULL COMMENT '下车采样数量',
  `total_passenger_down` int UNSIGNED NULL DEFAULT NULL COMMENT '下车客流之和',
  `week_id` smallint NOT NULL DEFAULT 0 COMMENT '星期1 2 3 4 5 6 7',
  `peak_id` smallint NOT NULL DEFAULT 0 COMMENT '0平峰 1早高峰 2晚高峰 3低峰',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_stop_date`(`company_id` ASC, `stop_id` ASC, `work_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 600003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for route_daily_speed
-- ----------------------------
DROP TABLE IF EXISTS `route_daily_speed`;
CREATE TABLE `route_daily_speed`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路id',
  `route_code` int NULL DEFAULT NULL COMMENT '线路id',
  `direction` smallint NULL DEFAULT NULL COMMENT '方向',
  `avg_velocity` int NULL DEFAULT NULL COMMENT '平均速度',
  `sample_count` int UNSIGNED NULL DEFAULT NULL COMMENT '采样数量',
  `total_velocity` bigint UNSIGNED NULL DEFAULT NULL COMMENT '速度之和',
  `avg_velocity0` int NULL DEFAULT NULL COMMENT '平均速度-平峰',
  `sample_count0` int UNSIGNED NULL DEFAULT NULL COMMENT '采样数量',
  `total_velocity0` bigint UNSIGNED NULL DEFAULT NULL COMMENT '速度之和',
  `avg_velocity1` int NULL DEFAULT NULL COMMENT '平均速度-早高峰',
  `sample_count1` int UNSIGNED NULL DEFAULT NULL COMMENT '采样数量',
  `total_velocity1` bigint UNSIGNED NULL DEFAULT NULL COMMENT '速度之和',
  `avg_velocity2` int NULL DEFAULT NULL COMMENT '平均速度-晚高峰',
  `sample_count2` int UNSIGNED NULL DEFAULT NULL COMMENT '采样数量',
  `total_velocity2` bigint UNSIGNED NULL DEFAULT NULL COMMENT '速度之和',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_time`(`company_id` ASC, `route_id` ASC, `work_date` ASC) USING BTREE,
  INDEX `idx_work_date`(`company_id` ASC, `work_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1228260 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for route_daily_station
-- ----------------------------
DROP TABLE IF EXISTS `route_daily_station`;
CREATE TABLE `route_daily_station`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开始时间',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `way_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点方案ID',
  `direction` smallint NULL DEFAULT NULL COMMENT '方向',
  `route_code` int NULL DEFAULT NULL COMMENT '线路id',
  `serial` smallint NULL DEFAULT NULL COMMENT '车站序号 上下行从1开始',
  `station_id` bigint NULL DEFAULT NULL COMMENT '对应站点表的唯一ID',
  `station_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `stop_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站台编码',
  `distance_previous` decimal(10, 4) NULL DEFAULT NULL COMMENT '与前一站的距离',
  `driving_time_sum` bigint NULL DEFAULT NULL COMMENT '上一站到本站累计用时，秒',
  `driving_time_count` int NULL DEFAULT NULL COMMENT '上一站到本站行驶时长，有效上报次数',
  `driving_time_avg` int NULL DEFAULT NULL COMMENT '上一站到本站平均用时，秒',
  `stop_time_sum` bigint NULL DEFAULT NULL COMMENT '累计上报停留时长,秒',
  `stop_time_count` int NULL DEFAULT NULL COMMENT '累计上报次数',
  `stop_time_avg` int NULL DEFAULT NULL COMMENT '平均停靠时长，秒',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_time`(`company_id` ASC, `work_date` ASC, `route_id` ASC) USING BTREE,
  INDEX `idx_route_station`(`company_id` ASC, `work_date` ASC, `station_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1418255 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for route_period_speed
-- ----------------------------
DROP TABLE IF EXISTS `route_period_speed`;
CREATE TABLE `route_period_speed`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '使用企业时区转换的日期',
  `route_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `route_code` int NULL DEFAULT NULL COMMENT '线路id',
  `direction` smallint NULL DEFAULT NULL COMMENT '方向',
  `start_time` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开始时间',
  `end_time` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '结束时间',
  `time_zone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  `period_time` datetime NULL DEFAULT NULL COMMENT '分段时间',
  `avg_velocity` int NULL DEFAULT NULL COMMENT '平均速度',
  `sample_count` int UNSIGNED NULL DEFAULT NULL COMMENT '采样数量',
  `total_velocity` bigint UNSIGNED NULL DEFAULT NULL COMMENT '速度之和',
  `aggregate` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '聚合函数',
  `peak_id` smallint NOT NULL DEFAULT 0 COMMENT '0平峰 1早高峰 2晚高峰 3低峰',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_route_time`(`company_id` ASC, `route_id` ASC) USING BTREE,
  INDEX `idx_route_code`(`company_id` ASC, `route_code` ASC, `direction` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1421451 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for route_period_speed_real
-- ----------------------------
DROP TABLE IF EXISTS `route_period_speed_real`;
CREATE TABLE `route_period_speed_real`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用企业时区转换的日期',
  `route_code` int NULL DEFAULT NULL COMMENT '线路id',
  `direction` smallint NULL DEFAULT NULL COMMENT '方向',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `period_time` datetime NULL DEFAULT NULL COMMENT '分段时间',
  `speed` decimal(11, 3) NULL DEFAULT NULL COMMENT '平均速度',
  `aggregate` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '聚合函数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_speed`(`company_id` ASC, `route_code` ASC, `direction` ASC, `period_time` ASC) USING BTREE,
  INDEX `idx_route_time`(`company_id` ASC, `route_code` ASC, `start_time` ASC) USING BTREE,
  INDEX `idx_company_time`(`company_id` ASC, `start_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
