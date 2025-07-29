/*
 Navicat Premium Data Transfer

 Source Server         : 58.82.168.197-泰国CI服务器
 Source Server Type    : MySQL
 Source Server Version : 80405 (8.4.5)
 Source Host           : 127.0.0.1:3306
 Source Schema         : maintain

 Target Server Type    : MySQL
 Target Server Version : 80405 (8.4.5)
 File Encoding         : 65001

 Date: 29/04/2025 17:54:11
*/

-- 创建maintain数据库
CREATE DATABASE IF NOT EXISTS maintain DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE maintain;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for batch_job_execution
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_execution`;
CREATE TABLE `batch_job_execution`  (
  `JOB_EXECUTION_ID` bigint NOT NULL,
  `VERSION` bigint NULL DEFAULT NULL,
  `JOB_INSTANCE_ID` bigint NOT NULL,
  `CREATE_TIME` datetime(6) NOT NULL,
  `START_TIME` datetime(6) NULL DEFAULT NULL,
  `END_TIME` datetime(6) NULL DEFAULT NULL,
  `STATUS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXIT_CODE` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATED` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`JOB_EXECUTION_ID`) USING BTREE,
  INDEX `JOB_INST_EXEC_FK`(`JOB_INSTANCE_ID` ASC) USING BTREE,
  CONSTRAINT `JOB_INST_EXEC_FK` FOREIGN KEY (`JOB_INSTANCE_ID`) REFERENCES `batch_job_instance` (`JOB_INSTANCE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '处理批量作业' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of batch_job_execution
-- ----------------------------

-- ----------------------------
-- Table structure for batch_job_execution_context
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_execution_context`;
CREATE TABLE `batch_job_execution_context`  (
  `JOB_EXECUTION_ID` bigint NOT NULL,
  `SHORT_CONTEXT` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SERIALIZED_CONTEXT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`JOB_EXECUTION_ID`) USING BTREE,
  CONSTRAINT `JOB_EXEC_CTX_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '批处理要执行的内容' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of batch_job_execution_context
-- ----------------------------

-- ----------------------------
-- Table structure for batch_job_execution_params
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_execution_params`;
CREATE TABLE `batch_job_execution_params`  (
  `JOB_EXECUTION_ID` bigint NOT NULL,
  `PARAMETER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PARAMETER_TYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PARAMETER_VALUE` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IDENTIFYING` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  INDEX `JOB_EXEC_PARAMS_FK`(`JOB_EXECUTION_ID` ASC) USING BTREE,
  CONSTRAINT `JOB_EXEC_PARAMS_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '批量作业执行的参数' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of batch_job_execution_params
-- ----------------------------

-- ----------------------------
-- Table structure for batch_job_execution_seq
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_execution_seq`;
CREATE TABLE `batch_job_execution_seq`  (
  `ID` bigint NOT NULL,
  `UNIQUE_KEY` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `UNIQUE_KEY_UN`(`UNIQUE_KEY` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '批处理作业的执行顺序' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of batch_job_execution_seq
-- ----------------------------

-- ----------------------------
-- Table structure for batch_job_instance
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_instance`;
CREATE TABLE `batch_job_instance`  (
  `JOB_INSTANCE_ID` bigint NOT NULL,
  `VERSION` bigint NULL DEFAULT NULL,
  `JOB_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_KEY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`JOB_INSTANCE_ID`) USING BTREE,
  UNIQUE INDEX `JOB_INST_UN`(`JOB_NAME` ASC, `JOB_KEY` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '实例化批处理作业' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of batch_job_instance
-- ----------------------------

-- ----------------------------
-- Table structure for batch_job_seq
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_seq`;
CREATE TABLE `batch_job_seq`  (
  `ID` bigint NOT NULL,
  `UNIQUE_KEY` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `UNIQUE_KEY_UN`(`UNIQUE_KEY` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '批处理作业顺序' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of batch_job_seq
-- ----------------------------

-- ----------------------------
-- Table structure for batch_step_execution
-- ----------------------------
DROP TABLE IF EXISTS `batch_step_execution`;
CREATE TABLE `batch_step_execution`  (
  `STEP_EXECUTION_ID` bigint NOT NULL,
  `VERSION` bigint NOT NULL,
  `STEP_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_EXECUTION_ID` bigint NOT NULL,
  `CREATE_TIME` datetime(6) NOT NULL,
  `START_TIME` datetime(6) NULL DEFAULT NULL,
  `END_TIME` datetime(6) NULL DEFAULT NULL,
  `STATUS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMMIT_COUNT` bigint NULL DEFAULT NULL,
  `READ_COUNT` bigint NULL DEFAULT NULL,
  `FILTER_COUNT` bigint NULL DEFAULT NULL,
  `WRITE_COUNT` bigint NULL DEFAULT NULL,
  `READ_SKIP_COUNT` bigint NULL DEFAULT NULL,
  `WRITE_SKIP_COUNT` bigint NULL DEFAULT NULL,
  `PROCESS_SKIP_COUNT` bigint NULL DEFAULT NULL,
  `ROLLBACK_COUNT` bigint NULL DEFAULT NULL,
  `EXIT_CODE` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATED` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`STEP_EXECUTION_ID`) USING BTREE,
  INDEX `JOB_EXEC_STEP_FK`(`JOB_EXECUTION_ID` ASC) USING BTREE,
  CONSTRAINT `JOB_EXEC_STEP_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '批量处理所执行的步骤' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of batch_step_execution
-- ----------------------------

-- ----------------------------
-- Table structure for batch_step_execution_context
-- ----------------------------
DROP TABLE IF EXISTS `batch_step_execution_context`;
CREATE TABLE `batch_step_execution_context`  (
  `STEP_EXECUTION_ID` bigint NOT NULL,
  `SHORT_CONTEXT` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SERIALIZED_CONTEXT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`STEP_EXECUTION_ID`) USING BTREE,
  CONSTRAINT `STEP_EXEC_CTX_FK` FOREIGN KEY (`STEP_EXECUTION_ID`) REFERENCES `batch_step_execution` (`STEP_EXECUTION_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '批量处理每步所执行的内容' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of batch_step_execution_context
-- ----------------------------

-- ----------------------------
-- Table structure for batch_step_execution_seq
-- ----------------------------
DROP TABLE IF EXISTS `batch_step_execution_seq`;
CREATE TABLE `batch_step_execution_seq`  (
  `ID` bigint NOT NULL,
  `UNIQUE_KEY` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `UNIQUE_KEY_UN`(`UNIQUE_KEY` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '批量处理步骤顺序' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of batch_step_execution_seq
-- ----------------------------

-- ----------------------------
-- Table structure for device_category
-- ----------------------------
DROP TABLE IF EXISTS `device_category`;
CREATE TABLE `device_category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '产品主表',
  `category_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备类别',
  `category_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别名称',
  `category_name_zh` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别名称',
  `category_name_en` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别名称',
  `category_name_th` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别名称',
  `category_name_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '印尼语言',
  `parent_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '上级类别',
  `product_type` int NOT NULL DEFAULT 0 COMMENT '设备分类类别  0其他 100 定位设备 200视频设备 300主动安全设备 400公交报站设备',
  `order_id` int NOT NULL DEFAULT 0 COMMENT '排序字段',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_category_id`(`category_id` ASC) USING BTREE,
  UNIQUE INDEX `uk_category_name`(`category_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of device_category
-- ----------------------------

-- ----------------------------
-- Table structure for device_manufacturer
-- ----------------------------
DROP TABLE IF EXISTS `device_manufacturer`;
CREATE TABLE `device_manufacturer`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '产品主表',
  `manufacturer_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '厂家自编码',
  `manufacturer_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '厂家名称',
  `manufacturer_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '厂家编号',
  `main_products` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主营业务产品',
  `order_id` int NOT NULL DEFAULT 0 COMMENT '排序字段',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`manufacturer_id` ASC) USING BTREE,
  UNIQUE INDEX `uk_name`(`manufacturer_name` ASC) USING BTREE,
  UNIQUE INDEX `uk_code`(`manufacturer_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备厂家' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of device_manufacturer
-- ----------------------------

-- ----------------------------
-- Table structure for device_product
-- ----------------------------
DROP TABLE IF EXISTS `device_product`;
CREATE TABLE `device_product`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '产品主表',
  `product_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品ID',
  `product_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `device_model` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备型号',
  `category_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备类别',
  `protocol` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '通讯协议类型',
  `firmware_tags` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '固件过滤标签',
  `notice_type` smallint NULL DEFAULT 0 COMMENT '1: 808控制指令升级 2: bus通过远程升级通知升级',
  `support` int NULL DEFAULT 0 COMMENT '支持功能 低位 第1位在线 2定位 3ACC 4外接电源',
  `accessories_ids` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配件列表',
  `accessories_items` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配件列表',
  `manufacturer_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '生产厂家',
  `manufacturer_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '生产厂家',
  `product_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品描述',
  `product_image` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `platform_certified` smallint NOT NULL DEFAULT 0 COMMENT '通过平台认证 0=未通过 1=通过',
  `alarm_mapping` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主动安全报警映射',
  `order_id` int NOT NULL DEFAULT 0 COMMENT '排序字段',
  `wired_type` int NULL DEFAULT 0 COMMENT '接线类型 1有线 2无线',
  `fix_zone` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '一些设备不能不支持使用本地时区, 容易引起台账错误, 所以网关按设备类型兼容',
  `device_model_compose` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组合设备，设备型号数组',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_organize_id`(`product_id` ASC) USING BTREE,
  UNIQUE INDEX `uk_product_name`(`product_name` ASC) USING BTREE,
  UNIQUE INDEX `uk_device_model`(`device_model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 800 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of device_product
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_alarm
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_alarm`;
CREATE TABLE `jtt808_alarm`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '线路id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `platform_alarm_id` int NULL DEFAULT 0 COMMENT '平台统一报警id',
  `alarm_class` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'alarm_normal' COMMENT '报警类别 - 实时报警|主动安全',
  `device_type` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '外设类型',
  `additional` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '附加数据',
  `lng` decimal(11, 6) NOT NULL COMMENT '经度',
  `lat` decimal(11, 6) NOT NULL COMMENT '纬度',
  `duration` int NOT NULL DEFAULT 0 COMMENT '报警持续时长, 用于结束统计',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '归属日期',
  `time_zone` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始时间对应的时区',
  `period_time` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '落在的分时段区间 例如：08:00 ~ 08:30',
  `reduce_score` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '一次违规扣分多少',
  `handle_flag` int NOT NULL DEFAULT 0 COMMENT '处理方式',
  `handle_result` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '附加数据',
  `handle_time` datetime NULL DEFAULT NULL,
  `handler_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '附加数据',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `event_time` ASC) USING BTREE,
  INDEX `idx_car_time`(`organize_id` ASC, `vehicle_id` ASC, `event_time` ASC) USING BTREE,
  INDEX `idx_date`(`organize_id` ASC, `work_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 643399660 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '设备报警记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_alarm
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_alarm_count
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_alarm_count`;
CREATE TABLE `jtt808_alarm_count`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主动安全报警',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '归属日期',
  `platform_alarm_id` int NOT NULL DEFAULT 0 COMMENT '平台统一报警id',
  `alarm_class_code` smallint(5) UNSIGNED ZEROFILL NOT NULL COMMENT '0基础报警 1主动安全报警',
  `device_type` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '外设类型',
  `counts` int(11) UNSIGNED ZEROFILL NULL DEFAULT 00000000000 COMMENT '数量',
  `duration` int(11) UNSIGNED ZEROFILL NULL DEFAULT 00000000000 COMMENT '持续时长, 单位秒',
  `reduce_score` decimal(11, 1) UNSIGNED ZEROFILL NULL DEFAULT 0000000000.0 COMMENT '一次违规扣分多少',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_alarm_count`(`organize_id` ASC, `vehicle_id` ASC, `work_date` ASC) USING BTREE,
  INDEX `idx_date`(`organize_id` ASC, `work_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 607654 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '报警日小计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_alarm_count
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_alarm_file
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_alarm_file`;
CREATE TABLE `jtt808_alarm_file`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `imei` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '设备id',
  `file_server` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'file-server' COMMENT '文件服务器',
  `alarm_key` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '平台给报警分配的唯一编号',
  `file_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '文件名称',
  `relative_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件路径',
  `file_size` int NOT NULL COMMENT '文件大小',
  `file_type` smallint NOT NULL DEFAULT 0 COMMENT '文件类型0图片1音频2视频3文本4其他',
  `file_expiration_time` datetime NULL DEFAULT NULL COMMENT '文件保存有效期',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_file_name`(`organize_id` ASC, `imei` ASC, `file_name` ASC) USING BTREE,
  INDEX `idx_alarm_key`(`organize_id` ASC, `alarm_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1347639 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '设备报警的文件上传记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_alarm_file
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_alarm_safety
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_alarm_safety`;
CREATE TABLE `jtt808_alarm_safety`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主动安全报警',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车队id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车队名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `serial_id` int NOT NULL DEFAULT 0 COMMENT '报警自增ID',
  `device_type` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '外设类型',
  `flag_status` smallint NOT NULL DEFAULT 0 COMMENT '标志状态',
  `platform_alarm_id` int NULL DEFAULT 0 COMMENT '平台统一报警id',
  `alarm_level` smallint NOT NULL DEFAULT 0 COMMENT '报警级别',
  `alarm_info` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '报警详情',
  `alarm_key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '报警唯一编号',
  `speed` int NULL DEFAULT 0 COMMENT '速度，km/h',
  `height` int NULL DEFAULT 0 COMMENT '海拔米',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度，一般指东经',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `event_time` datetime NULL DEFAULT NULL COMMENT '事件时间',
  `vehicle_state` int NULL DEFAULT 0 COMMENT '车辆状态',
  `terminal_id` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '终端 ID',
  `mark_time` datetime NULL DEFAULT NULL COMMENT '标识内部时间',
  `serial_number` int NULL DEFAULT 0 COMMENT '同一时间报警序号',
  `attached_count` smallint NULL DEFAULT 0 COMMENT '附件数量',
  `read_status` int NOT NULL DEFAULT 0 COMMENT '读取状态，0未读 1自动  100人为',
  `updater_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新操作用户ID',
  `updater_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新操作账号',
  `remark` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '处理内容',
  `work_date` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '企业对应时区的日期字符串',
  `time_zone` char(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '对应时区',
  `period_time` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '落在的分时段区间 例如：08:00 ~ 08:30',
  `reduce_score` decimal(11, 1) NULL DEFAULT 0.0 COMMENT '一次违规扣分多少',
  `alarm_ignore` smallint NOT NULL DEFAULT 0 COMMENT '报警忽略',
  `card_info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '驾驶员+刷卡等信息',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_key`(`organize_id` ASC, `alarm_key` ASC) USING BTREE,
  INDEX `idx_org_workdate_vehicle`(`organize_id` ASC, `work_date` ASC, `vehicle_id` ASC) USING BTREE,
  INDEX `idx_event_time`(`organize_id` ASC, `event_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'ADAS+DSM报警记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_alarm_safety
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_card
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_card`;
CREATE TABLE `jtt808_card`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `lng` decimal(11, 6) NOT NULL DEFAULT 0.000000 COMMENT '经度',
  `lat` decimal(11, 6) NOT NULL DEFAULT 0.000000 COMMENT '纬度',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `card_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '刷卡的唯一标识',
  `attendance_type` int NOT NULL DEFAULT 0 COMMENT '0刷卡 1上班 2下班 3签到 4签退 5例检',
  `attendance_origin` int NOT NULL DEFAULT 0 COMMENT '考勤方式 0=简易GPS 1员工卡考勤 2输工号考勤 自定义200=GPS附加, 210透传',
  `attendance_check_In` int NULL DEFAULT NULL COMMENT '泰国磁条卡 0签退 1签到',
  `attendance_valid` int NULL DEFAULT NULL COMMENT ' 泰国磁条卡 0非法 1合法',
  `magnetic_card` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '泰国磁条卡唯一ID',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `event_time` ASC) USING BTREE,
  INDEX `idx_car_time`(`organize_id` ASC, `vehicle_id` ASC, `event_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 187761 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备刷卡记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_card
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_cmd
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_cmd`;
CREATE TABLE `jtt808_cmd`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备唯一码',
  `cmd_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '命令ID, 比如人脸查询, 参考808',
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '批量下发标识',
  `message_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消息唯一ID.替换UUID',
  `request_time` datetime NOT NULL COMMENT '发送时间',
  `param_object` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数, JSON对象',
  `request_state` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应答结果 初始 离线待发 无响应 成功',
  `response_time` datetime NULL DEFAULT NULL COMMENT '终端应答时间',
  `response_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求响应, JSON对象',
  `sender_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者ID',
  `sender_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一些备注',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_batch`(`organize_id` ASC, `batch_id` ASC) USING BTREE,
  INDEX `idx_message_id`(`message_id` ASC) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `request_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2645 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发送文本的日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_cmd
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_cmd_face
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_cmd_face`;
CREATE TABLE `jtt808_cmd_face`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `face_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人脸ID',
  `face_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人脸照片路径',
  `face_img_source` int NOT NULL DEFAULT 0 COMMENT '照片来源',
  `certificate` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '从业资格证',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_face`(`organize_id` ASC, `face_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_cmd_face
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_connect
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_connect`;
CREATE TABLE `jtt808_connect`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '终端连接',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车队id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车队名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `address` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '请求地址',
  `ip_region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `token` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '鉴权码',
  `connect_flag` int NOT NULL DEFAULT 0 COMMENT '1建立连接 2断开连接 ',
  `connect_protocol` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后连接使用的协议',
  `connect_time` datetime NOT NULL COMMENT '连接时间',
  `disconnect_time` datetime NULL DEFAULT NULL COMMENT '断开时间',
  `connect_duration` int NULL DEFAULT NULL COMMENT '持续时长秒',
  `disconnect_reason` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '鉴权原因',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `connect_time` ASC) USING BTREE,
  INDEX `idx_imei_time`(`organize_id` ASC, `imei` ASC, `connect_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22827259 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '设备连接记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_connect
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_face
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_face`;
CREATE TABLE `jtt808_face`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车队ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车队名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `vehicle_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车牌号',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备IMEI',
  `lng` decimal(11, 6) NOT NULL COMMENT '经度',
  `lat` decimal(11, 6) NOT NULL COMMENT '纬度',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `comparison_result` smallint NULL DEFAULT NULL COMMENT '对比结果，0-匹配成功；1-匹配失败；2-超时；3-没有启用该功能；4-连接异常；5-无指定人脸图片 6-无人脸库',
  `comparison_type` smallint NULL DEFAULT NULL COMMENT '对比类型，0-插卡比对；1-巡检比对；2-点火比对；3-离开返回比对',
  `similarity_ratio` double(11, 2) NULL DEFAULT NULL COMMENT '比对相似度阈值 百分比；范围 0%~100%。单位是 1%',
  `similarity` double(11, 2) NULL DEFAULT NULL COMMENT '百分比；范围 0.00%~100.00%。\r\n单位是 0.01%；比如 5432 表示 54.32%',
  `face_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶员对比图片',
  `face_img_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶员对比图片URL',
  `snapshot_img_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备抓拍对比上传的照片',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工ID',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `certificate` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '从业资格ID',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `event_time` ASC) USING BTREE,
  INDEX `idx_car_time`(`organize_id` ASC, `vehicle_id` ASC, `event_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '驾驶员身份识别上报' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_face
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_fence
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_fence`;
CREATE TABLE `jtt808_fence`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '终端连接',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车队id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车队名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始时间对应的日期',
  `time_zone` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始时间对应的时区',
  `fence_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '围栏ID',
  `fence_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '围栏名称',
  `fence_type` int NOT NULL DEFAULT 0 COMMENT '0POI 1圆 2矩形 3多边形 4路径点',
  `fence_category` smallint NOT NULL DEFAULT 0 COMMENT '0常规 10行政区域 ',
  `use_type` smallint NOT NULL DEFAULT 0 COMMENT '区域用途，0默认1停车场2加油充电站3维修点',
  `fence_direction` smallint NOT NULL COMMENT '进出围栏方向，0进围栏 1出围栏',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `previous_time` datetime NULL DEFAULT NULL COMMENT '上一个出围栏时间，或者当前围栏进时间',
  `lng` decimal(11, 6) NOT NULL DEFAULT 0.000000 COMMENT '经度',
  `lat` decimal(11, 6) NOT NULL COMMENT '纬度',
  `mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '里程 km',
  `rule_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '规则编码UUID',
  `rule_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '规则名称',
  `rule_type` smallint NULL DEFAULT NULL COMMENT '规则类型，0禁入 1禁出',
  `additional_fence` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '附加数据',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_event_time`(`organize_id` ASC, `vehicle_id` ASC, `event_time` ASC) USING BTREE,
  INDEX `idx_date`(`organize_id` ASC, `work_date` ASC, `vehicle_id` ASC) USING BTREE,
  INDEX `idx_previous_time`(`organize_id` ASC, `previous_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 455670 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '车辆进出区域记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_fence
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_file_upload
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_file_upload`;
CREATE TABLE `jtt808_file_upload`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '线路id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `message_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '消息唯一ID.替换UUID',
  `imei` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `chn` int NOT NULL COMMENT '通道',
  `start_time` datetime NOT NULL COMMENT '文件开始时间',
  `end_time` datetime NOT NULL COMMENT '文件结束时间',
  `warning` bigint NULL DEFAULT NULL COMMENT '报警状态',
  `file_type` int NOT NULL DEFAULT 0 COMMENT '0音视频 1音频 2视频 3视频或音频',
  `stream_type` int NOT NULL DEFAULT 0 COMMENT '0主或次码流 1主码流 2次码流',
  `storage_type` int NOT NULL DEFAULT 0 COMMENT '1主存储器 2灾备存储',
  `task_condition` int NULL DEFAULT 0 COMMENT '下载条件',
  `file_size` int NULL DEFAULT 0 COMMENT '文件大小',
  `upload_state` smallint NOT NULL DEFAULT 0 COMMENT '0等待执行 10下载中 11暂停 12继续 13取消 20完成 30失败',
  `relative_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `request_origin` int NOT NULL DEFAULT 0 COMMENT '数据来源 0平台指令 1SOS',
  `upload_time` datetime NULL DEFAULT NULL COMMENT '文件上传时间',
  `upload_size` int NULL DEFAULT 0 COMMENT '文件大小(已经上传的大小)',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `remark` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `serial` int NULL DEFAULT NULL COMMENT '应答流水号',
  `file_expiration_time` datetime NULL DEFAULT NULL COMMENT '文件保存有效期',
  `creator_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '请求用户',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_file_upload`(`organize_id` ASC, `start_time` ASC) USING BTREE,
  INDEX `idx_message_id`(`message_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 229 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '终端文件上传记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_file_upload
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_health
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_health`;
CREATE TABLE `jtt808_health`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `imei` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备唯一码, 过渡32, 实际很多表都还是16',
  `device_uuid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备唯一码, 32',
  `exam_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '体检ID',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `sex` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `record_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗前检测一体机记录ID，患者每个体检项目不同ID也不同，非纯数字',
  `device_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '固定值（PREJOB）',
  `project_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组合项目代码（参考组合项目代码表）',
  `event_time` datetime NULL DEFAULT NULL COMMENT '项目体检时间, 多个记录一起上报取最小值',
  `has_abnormal` smallint NULL DEFAULT NULL COMMENT '是有有异常, 来源dataItem的abnormalIndicator',
  `data_item` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体检数据',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC) USING BTREE,
  INDEX `idx_car_time`(`organize_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '驾驶员身份识别上报' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_health
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_io
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_io`;
CREATE TABLE `jtt808_io`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '终端连接',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车队id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车队名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始时间对应的日期',
  `time_zone` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始时间对应的时区',
  `previous_time` datetime NULL DEFAULT NULL COMMENT '同IO上一个时间',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `previous_second` int NULL DEFAULT NULL COMMENT '同IO上一个时长',
  `next_time` datetime NULL DEFAULT NULL COMMENT '同IO下一个时间',
  `next_second` int NULL DEFAULT NULL COMMENT '同IO下一个时长',
  `io_index` smallint NOT NULL DEFAULT 0 COMMENT 'IO索引 0开始',
  `action_type` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'ON | OFF',
  `fence_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '围栏ID',
  `fence_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '围栏名称',
  `fence_type` int NULL DEFAULT NULL COMMENT '0POI 1圆 2矩形 3多边形 4路径点',
  `fence_category` smallint NULL DEFAULT NULL COMMENT '0常规 10行政区域 ',
  `use_type` smallint NULL DEFAULT NULL COMMENT '区域用途，0默认1停车场2加油充电站3维修点',
  `use_description` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '自定义区域用途描述',
  `additional_io` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'IO开始附加',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_previous_time`(`organize_id` ASC, `previous_time` ASC, `vehicle_id` ASC) USING BTREE,
  INDEX `idx_event_time`(`organize_id` ASC, `vehicle_id` ASC, `event_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1689538 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'IO变化' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_io
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_media_file
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_media_file`;
CREATE TABLE `jtt808_media_file`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主动安全报警',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车队id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车队名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `chn` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '通道号',
  `media_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '多媒体ID',
  `media_file_type` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '多媒体类型 0图像 1音频 2视频',
  `media_file_format` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件格式 BYTE 0：JPEG；1：TIF；2：MP3；3：WAV；4：WMV',
  `media_event` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '时间项编码  0：平台下发指令；1：定时动作；2：抢劫报警触发；3：碰撞侧翻报警触发 等',
  `coordinate_info` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '位置信息',
  `relative_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `work_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始时间对应的日期',
  `time_zone` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '+08:00' COMMENT '开始时间对应的时区',
  `message_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '触发抓拍事件的消息唯一ID.替换UUID',
  `event_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '事件的类型, 比如进出围栏等',
  `event_id` bigint NULL DEFAULT NULL COMMENT '触发事件的表ID',
  `file_expiration_time` datetime NULL DEFAULT NULL COMMENT '文件保存有效期',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `created_unix` ASC) USING BTREE,
  INDEX `idx_media_id`(`imei` ASC, `chn` ASC, `media_id` ASC) USING BTREE,
  INDEX `idx_event`(`organize_id` ASC, `event_type` ASC, `event_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7381 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '多媒体文件上传记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_media_file
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_media_photograph
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_media_photograph`;
CREATE TABLE `jtt808_media_photograph`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主动安全报警',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车队id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车队名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `chn` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '通道号',
  `message_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '消息唯一ID.替换UUID',
  `rsp_result` int NOT NULL DEFAULT -1 COMMENT '0：成功；1：失败；2：通道不支持。 以下字段在结果=0 时才有效',
  `media_ids` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '抓拍多媒体数组',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建用户ID',
  `creator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建用户ID',
  `event_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '事件的类型, 比如进出围栏等',
  `event_id` bigint NULL DEFAULT NULL COMMENT '触发事件的表ID',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_message_id`(`organize_id` ASC, `message_id` ASC) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `vehicle_id` ASC, `created_unix` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '多媒体抓拍数据上传记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_media_photograph
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_obd
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_obd`;
CREATE TABLE `jtt808_obd`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备唯一码',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `obd_base` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'OBD基础数据',
  `obd_car` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'OBD轿车数据',
  `obd_truck` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'OBD货车数据',
  `obd_ev` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'OBD新能源数据',
  `error_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '故障码',
  `version_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '版本信息',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `event_time` ASC) USING BTREE,
  INDEX `idx_car_time`(`organize_id` ASC, `vehicle_id` ASC, `event_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 187219 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'OBD透传信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_obd
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_passenger
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_passenger`;
CREATE TABLE `jtt808_passenger`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '线路id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `route_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '线路',
  `route_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `upload_time` datetime NOT NULL COMMENT '上报时间',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始时间对应的日期',
  `time_zone` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始时间对应的时区',
  `up_number` int NOT NULL DEFAULT 0 COMMENT '上车人数',
  `down_number` int NOT NULL DEFAULT 0 COMMENT '下车人数',
  `in_car_number` int NOT NULL DEFAULT 0 COMMENT '车厢内人数',
  `approved_number` int NULL DEFAULT 0 COMMENT '核载人数',
  `full_load_rate` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '满载率',
  `total_today` int NULL DEFAULT 0 COMMENT '当天累计上车',
  `period_time` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '落在的分时段区间 例如：08:00 ~ 08:30',
  `lng` decimal(11, 6) NULL DEFAULT NULL COMMENT '缓存中的最近经度',
  `lat` decimal(11, 6) NULL DEFAULT NULL COMMENT '缓存中的最近纬度',
  `route_code` int NULL DEFAULT NULL COMMENT '运行线路编号',
  `direction` smallint NULL DEFAULT NULL COMMENT '方向',
  `serial` smallint NULL DEFAULT NULL COMMENT '车站序号 上下行从1开始',
  `station_id` int NULL DEFAULT NULL COMMENT '站点表唯一ID',
  `station_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `station_flag` int NULL DEFAULT 0 COMMENT '0中间站 1起点 255终点',
  `stop_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '站台ID',
  `stop_code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '站点编号',
  `way_id` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '线路方案',
  `created_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务器时间',
  `updated_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `upload_time` ASC) USING BTREE,
  INDEX `idx_work_date`(`organize_id` ASC, `work_date` ASC, `vehicle_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_passenger
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_position
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_position`;
CREATE TABLE `jtt808_position`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '线路id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `state` bigint NULL DEFAULT NULL COMMENT '车辆状态',
  `warning` bigint NULL DEFAULT NULL COMMENT '报警状态',
  `lng` decimal(11, 6) NOT NULL COMMENT '经度',
  `lat` decimal(11, 6) NOT NULL COMMENT '纬度',
  `height` smallint NULL DEFAULT NULL COMMENT '高度',
  `speed` smallint NULL DEFAULT NULL COMMENT '速度',
  `azimuth` smallint NULL DEFAULT NULL COMMENT '方位角',
  `mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '里程 km',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `receive_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '接收时间',
  `additional` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '附加数据',
  `properties` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '附加数据',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`, `event_time`) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `event_time` ASC) USING BTREE,
  INDEX `idx_car_time`(`organize_id` ASC, `vehicle_id` ASC, `event_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1124544139 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '终端设备的GPS数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_position
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_position_last
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_position_last`;
CREATE TABLE `jtt808_position_last`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '组织全名',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆编号',
  `lpn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车牌号码 License Plate Number',
  `imei` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `lng` decimal(11, 6) NOT NULL COMMENT '经度',
  `lat` decimal(11, 6) NOT NULL COMMENT '纬度',
  `height` smallint NULL DEFAULT NULL COMMENT '高度',
  `speed` smallint NULL DEFAULT NULL COMMENT '速度',
  `azimuth` smallint NULL DEFAULT NULL COMMENT '方位角',
  `warning` int NULL DEFAULT NULL COMMENT '报警状态',
  `state` int NULL DEFAULT NULL COMMENT '车辆状态',
  `mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '里程 km',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `receive_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '接收时间',
  `attached` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '附加数据',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`, `event_time`) USING BTREE,
  INDEX `idx_vehicle`(`organize_id` ASC, `vehicle_id` ASC) USING BTREE,
  INDEX `idx_lpn`(`organize_id` ASC, `lpn` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '车辆最后位置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_position_last
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_register
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_register`;
CREATE TABLE `jtt808_register`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车辆上安装的设备列表',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '线路id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备唯一码',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `ip_region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `header_properties` int NOT NULL DEFAULT 0 COMMENT '头属性',
  `header_version` int NOT NULL DEFAULT 0 COMMENT '头属性-版本',
  `province` int NOT NULL DEFAULT 0 COMMENT '省域ID',
  `city` int NOT NULL DEFAULT 0 COMMENT '市县域ID',
  `producer_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '制造商ID',
  `terminal_model` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端型号',
  `terminal_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端ID',
  `terminal_lpc` int NOT NULL DEFAULT 0 COMMENT '车牌颜色',
  `terminal_lpn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `registration_rsp` int NOT NULL DEFAULT 0 COMMENT '注册应答',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`, `event_time`) USING BTREE,
  UNIQUE INDEX `uk_imei_model`(`imei` ASC, `terminal_model` ASC) USING BTREE,
  INDEX `idx_organize`(`organize_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22132 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车上安装设备表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_register
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_tpms
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_tpms`;
CREATE TABLE `jtt808_tpms`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '终端连接',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车队id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车队名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `sensor_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '传感器ID',
  `tire_index` int NOT NULL DEFAULT 0 COMMENT '轮胎索引',
  `tire_position` int NOT NULL DEFAULT 0 COMMENT '轮胎位置',
  `sensor_battery_voltage` int NOT NULL DEFAULT 0 COMMENT '电池电量',
  `tire_pressure` decimal(11, 1) NOT NULL DEFAULT 0.0 COMMENT '胎压',
  `tire_temperature` int NOT NULL DEFAULT 0 COMMENT '轮胎温度',
  `tire_state` int NOT NULL DEFAULT 0 COMMENT '轮胎状态',
  `event_time` datetime NOT NULL COMMENT '事件时间',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jtt808_tpms_vehicle_id_IDX`(`vehicle_id` ASC, `event_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75820 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '设备胎压记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_tpms
-- ----------------------------

-- ----------------------------
-- Table structure for jtt808_video_storage
-- ----------------------------
DROP TABLE IF EXISTS `jtt808_video_storage`;
CREATE TABLE `jtt808_video_storage`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '线路id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆编号',
  `vehicle_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '组织全名',
  `lpn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车牌号码 License Plate Number',
  `imei` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `chn` int NOT NULL DEFAULT 0 COMMENT '通道',
  `domain` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'nginx映射的域名',
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'minio中的相对路径',
  `duration` int NOT NULL DEFAULT 0 COMMENT '文件时长 毫秒',
  `size` int NOT NULL DEFAULT 0 COMMENT '文件大小',
  `start_time` datetime NOT NULL COMMENT '文件开始时间',
  `end_time` datetime NOT NULL COMMENT '文件结束时间',
  `expire_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_vehicle`(`organize_id` ASC, `vehicle_id` ASC, `start_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 681903 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '车辆最后位置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jtt808_video_storage
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_daily_mileage
-- ----------------------------
DROP TABLE IF EXISTS `ledger_daily_mileage`;
CREATE TABLE `ledger_daily_mileage`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '归属日期',
  `time_zone` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始时间对应的时区',
  `fleet_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `start_time` datetime NOT NULL COMMENT '最早上线时间',
  `start_mileage` decimal(11, 3) NOT NULL COMMENT '最小开始里程',
  `end_time` datetime NOT NULL COMMENT '最晚关机时间',
  `end_mileage` decimal(11, 3) NOT NULL COMMENT '最大结束里程',
  `mileage` decimal(11, 3) NOT NULL COMMENT '当天总公里数',
  `is_abnormal` smallint NOT NULL DEFAULT 0 COMMENT '是否异常',
  `is_reissue` smallint NOT NULL DEFAULT 0 COMMENT '补传标识 0自动台账 1自动补录 2手工台账',
  `gps_mileage` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '终端GPS里程差',
  `geo_mileage` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '前后经纬度差值',
  `total_position` int NOT NULL DEFAULT 0 COMMENT '当天GPS总数量',
  `not_located` int NOT NULL DEFAULT 0 COMMENT '没有定位的坐标数量',
  `wrong_position` int NOT NULL DEFAULT 0 COMMENT '经度范围, 速度, 海拔, 方位角不合法的数据',
  `reissue_count` int NULL DEFAULT 0 COMMENT '补传包数量',
  `discontinuous_count` int NOT NULL DEFAULT 0 COMMENT '轨迹不连续',
  `drift_count` int NOT NULL DEFAULT 0 COMMENT '漂移数量',
  `online_second` int NOT NULL DEFAULT 0 COMMENT '当天在线时长, 来源GPS轨迹分析',
  `creator_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ix_date_car`(`organize_id` ASC, `work_date` ASC, `vehicle_id` ASC, `imei` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2404423 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆每日里程' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_daily_mileage
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_parking
-- ----------------------------
DROP TABLE IF EXISTS `ledger_parking`;
CREATE TABLE `ledger_parking`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开始时间对应的日期',
  `time_zone` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始时间对应的时区',
  `start_time` datetime NOT NULL COMMENT '行程开始时间',
  `start_mileage` decimal(11, 3) NOT NULL COMMENT '行程开始里程',
  `end_time` datetime NOT NULL COMMENT '行程结束时间',
  `end_mileage` decimal(11, 3) NOT NULL COMMENT '行车结束里程',
  `duration_second` int NOT NULL DEFAULT 0 COMMENT '行程内停车的时长',
  `parking_mileage` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '行程里程Km',
  `fuel_consumed` decimal(11, 1) NULL DEFAULT NULL COMMENT '燃油油耗',
  `fuel_capacity` decimal(11, 1) NOT NULL DEFAULT 0.0 COMMENT '油箱容量',
  `parking_flag` smallint NOT NULL DEFAULT 0 COMMENT '标识 0=停车 1=行程(ACC开时的空转) 2=离线',
  `trip_start_time` datetime NULL DEFAULT NULL COMMENT '行程开始时间',
  `trip_end_time` datetime NULL DEFAULT NULL COMMENT '行程结束时间',
  `additional` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '附加数据',
  `creator_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_date`(`organize_id` ASC, `work_date` ASC, `vehicle_id` ASC) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `start_time` ASC) USING BTREE,
  INDEX `idx_vehicle_time`(`organize_id` ASC, `vehicle_id` ASC, `start_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4555131 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '每日行程记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_parking
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_timeline
-- ----------------------------
DROP TABLE IF EXISTS `ledger_timeline`;
CREATE TABLE `ledger_timeline`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '标识 1上线',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开始时间对应的日期',
  `time_zone` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始时间对应的时区',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `flag` smallint NOT NULL DEFAULT 0 COMMENT '标识 1上线 2下线 10=补传11=轨迹不连续 12=漂移',
  `duration_second` int NOT NULL DEFAULT 0 COMMENT '时长',
  `num` int NULL DEFAULT 0 COMMENT '定位包数量',
  `additional` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '附加数据',
  `creator_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `vehicle_id` ASC, `start_time` ASC) USING BTREE,
  INDEX `idx_date`(`organize_id` ASC, `work_date` ASC, `vehicle_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4467957 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备时间线' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_timeline
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_trip_index
-- ----------------------------
DROP TABLE IF EXISTS `ledger_trip_index`;
CREATE TABLE `ledger_trip_index`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `imei` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `cursor_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '行程分析时间点游标',
  `first_acc_on_id` bigint NOT NULL DEFAULT 0 COMMENT '行程开始坐标ID, 0行驶中',
  `last_acc_on_id` bigint NOT NULL DEFAULT 0 COMMENT '行程之后一个acc on的ID',
  `last_acc_on_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '最后一个ACC ON的时间',
  `last_position_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '最后一个坐标包的时间',
  `last_position_id` bigint NOT NULL DEFAULT 0 COMMENT '最后一个坐标包的ID',
  `last_trip_end_id` bigint NOT NULL DEFAULT 0 COMMENT '最后行程的结束点, 也就是停车的开始点',
  `last_trip_end_oil` decimal(11, 1) NOT NULL DEFAULT 0.0 COMMENT '上一个行程结束时候的剩余油量L',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_imei`(`imei` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24682 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '时间点的行程分析' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_trip_index
-- ----------------------------

-- ----------------------------
-- Table structure for ledger_trip_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `ledger_trip_vehicle`;
CREATE TABLE `ledger_trip_vehicle`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路id',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '线路名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '终端唯一码',
  `work_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开始时间对应的日期',
  `time_zone` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始时间对应的时区',
  `start_time` datetime NOT NULL COMMENT '行程开始时间',
  `start_mileage` decimal(11, 3) NOT NULL COMMENT '行程开始里程',
  `end_time` datetime NOT NULL COMMENT '行程结束时间',
  `end_mileage` decimal(11, 3) NOT NULL COMMENT '行车结束里程',
  `trip_duration_second` int NOT NULL DEFAULT 0 COMMENT '行程持续多少秒',
  `idle_duration_second` int NOT NULL DEFAULT 0 COMMENT '行程内停车的时长',
  `trip_mileage` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '行程里程Km',
  `max_speed` int NOT NULL DEFAULT 0 COMMENT '行程最高速度',
  `avg_speed` int NOT NULL DEFAULT 0 COMMENT '行程平均车速',
  `fuel_consumed` decimal(11, 1) NULL DEFAULT NULL COMMENT '燃油油耗',
  `idle_consumed` decimal(11, 1) NULL DEFAULT NULL COMMENT '行程中怠速油耗',
  `fuel_increase` decimal(11, 1) NULL DEFAULT NULL COMMENT '加油量',
  `fuel_capacity` decimal(11, 1) NOT NULL DEFAULT 0.0 COMMENT '邮箱容量',
  `additional` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '附加数据',
  `creator_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_date`(`organize_id` ASC, `work_date` ASC, `vehicle_id` ASC) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `start_time` ASC) USING BTREE,
  INDEX `idx_vehicle_time`(`organize_id` ASC, `vehicle_id` ASC, `start_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2375697 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆行程统计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_trip_vehicle
-- ----------------------------

-- ----------------------------
-- Table structure for log_error
-- ----------------------------
DROP TABLE IF EXISTS `log_error`;
CREATE TABLE `log_error`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登陆成功uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `api_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'API',
  `error_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误信息',
  `code_data` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返回对象',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18054 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '错误日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_error
-- ----------------------------

-- ----------------------------
-- Table structure for log_geocoder
-- ----------------------------
DROP TABLE IF EXISTS `log_geocoder`;
CREATE TABLE `log_geocoder`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织全名',
  `lng` decimal(11, 6) NOT NULL COMMENT '经度',
  `lat` decimal(11, 6) NOT NULL COMMENT '纬度',
  `lang` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言 en th cn zh-CN',
  `coordinate_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'wgs84' COMMENT 'coordType 坐标类型 wgs84 gcj02 bd09, 默认gcj02',
  `is_organize_key` smallint NOT NULL DEFAULT 0 COMMENT '是否来源组织 0否 1是',
  `is_cache` smallint NOT NULL DEFAULT 0 COMMENT '是否来源缓存 0否 1是',
  `is_success` smallint NOT NULL DEFAULT 0 COMMENT '地址解析成功 0否 1是',
  `geocode` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求返回结果',
  `operator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者ID',
  `operator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者名称',
  `work_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'yyyy-mm-dd',
  `time_zone` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '时间对应的时区',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `created_unix` ASC) USING BTREE,
  INDEX `idx_month`(`organize_id` ASC, `work_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2257603 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '地理编码日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_geocoder
-- ----------------------------

-- ----------------------------
-- Table structure for log_login
-- ----------------------------
DROP TABLE IF EXISTS `log_login`;
CREATE TABLE `log_login`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登陆成功uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `session_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登陆成功令牌,同账号登录会话ID不一致',
  `login_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登陆时间',
  `login_type` smallint NULL DEFAULT 0 COMMENT '登录方式',
  `logout_unix` timestamp NULL DEFAULT NULL COMMENT '退出时间',
  `logout_type` smallint NULL DEFAULT 0 COMMENT '过期退出标识, 1过期退出',
  `third_party_type` int NOT NULL DEFAULT 0 COMMENT '第三方登录类型 0账号密码 10手机短信 20邮箱 30微信 40line',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `ip_region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `user_agent` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'APP或WEB',
  `device_info` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录设备信息',
  `api_version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'API接口版本号',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user`(`user_id` ASC, `login_unix` ASC) USING BTREE,
  INDEX `idx_login`(`login_unix` ASC) USING BTREE,
  INDEX `idx_session`(`session_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12150 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_mail
-- ----------------------------
DROP TABLE IF EXISTS `log_mail`;
CREATE TABLE `log_mail`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织全名',
  `form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱配置选项',
  `to_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发送目标',
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '邮件内容',
  `template_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `attachment_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `has_exception` smallint NOT NULL DEFAULT 0 COMMENT '发送异常',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `created_unix` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20493 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '邮件发送日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_mail
-- ----------------------------

-- ----------------------------
-- Table structure for log_message
-- ----------------------------
DROP TABLE IF EXISTS `log_message`;
CREATE TABLE `log_message`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户关注的组织或者个人工程师，自增长ID',
  `phone_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `send_sms_template` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '0个人 1组织',
  `send_sms_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '0个人 1组织',
  `send_sms_response` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '0个人 1组织',
  `error_count` int NOT NULL DEFAULT 0 COMMENT '错误数量',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_phone`(`phone_number` ASC) USING BTREE,
  INDEX `idx_time`(`created_unix` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1290 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息发送日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_message
-- ----------------------------

-- ----------------------------
-- Table structure for log_system
-- ----------------------------
DROP TABLE IF EXISTS `log_system`;
CREATE TABLE `log_system`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `user_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '操作人',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `api_url` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `methods` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '执行方法',
  `api_param` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '请求参数',
  `api_response` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT 'api返回code',
  `api_version` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'API版本号',
  `ip` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `ip_region` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `created_unix` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `updated_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`created_unix` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1379551 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for log_text
-- ----------------------------
DROP TABLE IF EXISTS `log_text`;
CREATE TABLE `log_text`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织全名',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备唯一码',
  `character_set` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字符集',
  `msg` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '消息',
  `flag` int NOT NULL DEFAULT 0,
  `message_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '消息唯一ID.替换UUID',
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '批量下发标识',
  `send_state` smallint NOT NULL DEFAULT 0 COMMENT '应答结果 0默认 1发送中 2发送成功 3发送失败',
  `send_time` datetime NOT NULL COMMENT '发送时间',
  `reply_time` datetime NULL DEFAULT NULL,
  `sender_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者ID',
  `sender_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者名称',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_batch`(`organize_id` ASC, `batch_id` ASC) USING BTREE,
  INDEX `idx_message_id`(`message_id` ASC) USING BTREE,
  INDEX `idx_time`(`organize_id` ASC, `send_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 839 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发送文本的日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_text
-- ----------------------------

-- ----------------------------
-- Table structure for order_contact_address
-- ----------------------------
DROP TABLE IF EXISTS `order_contact_address`;
CREATE TABLE `order_contact_address`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_no` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单编号 唯一值，供客户查询',
  `address_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安装地点，省市区+详细地址+经纬度',
  `first_contact_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第一联系人, 施工联系人,  可能驾驶员或者车场负责人',
  `second_contact_info` varchar(216) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第二联系人, 业务联系人, 可能是业务员',
  `appointment_time` datetime NULL DEFAULT NULL COMMENT '预约的日期和时间',
  `next_contact_time` datetime NULL DEFAULT NULL COMMENT '下一次沟通时间',
  `city_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工单城市6位编码，具体到市级',
  `form_organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发单组织ID',
  `to_organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接单组织ID',
  `form_organize_city_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发单组织城市编码',
  `to_organize_city_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接单组织城市编码',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_form_organize_id`(`form_organize_id` ASC) USING BTREE,
  INDEX `idx_to_organize_id`(`to_organize_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2090 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工单联系地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_contact_address
-- ----------------------------

-- ----------------------------
-- Table structure for order_daily_duration
-- ----------------------------
DROP TABLE IF EXISTS `order_daily_duration`;
CREATE TABLE `order_daily_duration`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '工单归档。计算当天归档工单的耗时分析',
  `work_month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '月份 yyyy-mm',
  `work_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '预约日期 yyyy-mm-dd',
  `order_type` int NOT NULL DEFAULT 0 COMMENT '1安装单 2维修单',
  `num_order` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '当天审核完成单',
  `duration_order` int NOT NULL DEFAULT 0 COMMENT '工单持续时长',
  `duration_assign` int NOT NULL DEFAULT 0 COMMENT '配单耗时, 分钟',
  `duration_accept` int NOT NULL DEFAULT 0 COMMENT '接单耗时, 分钟',
  `duration_done` int NOT NULL DEFAULT 0 COMMENT '服务耗时, 分钟',
  `duration_confirm` int NOT NULL DEFAULT 0 COMMENT '签单耗时, 分钟',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_date`(`work_date` ASC) USING BTREE,
  INDEX `idx_month`(`work_month` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45621 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '每日交单工单耗时分析' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for order_daily_engineer
-- ----------------------------
DROP TABLE IF EXISTS `order_daily_engineer`;
CREATE TABLE `order_daily_engineer`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '工单归档。工程师日交付单明细',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工程师ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `work_month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '月份yyyy-mm',
  `work_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期yyyy-mm-dd',
  `order_no` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单编号 唯一值，供客户查询',
  `order_type` int NOT NULL DEFAULT 0 COMMENT '1安装单 2维修单',
  `duration_order` int NOT NULL DEFAULT 0 COMMENT '工单持续时长',
  `duration_assign` int NOT NULL DEFAULT 0 COMMENT '配单耗时, 分钟',
  `duration_accept` int NOT NULL DEFAULT 0 COMMENT '接单耗时, 分钟',
  `duration_done` int NOT NULL DEFAULT 0 COMMENT '服务耗时, 分钟',
  `duration_confirm` int NOT NULL DEFAULT 0 COMMENT '签单耗时, 分钟',
  `service_score` int NOT NULL DEFAULT 0 COMMENT '评分',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_month`(`work_month` ASC) USING BTREE,
  INDEX `idx_date`(`work_date` ASC, `user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工程师日交单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_daily_engineer
-- ----------------------------

-- ----------------------------
-- Table structure for order_daily_organize
-- ----------------------------
DROP TABLE IF EXISTS `order_daily_organize`;
CREATE TABLE `order_daily_organize`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '工单归档。工程师日交付单明细',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `organize_type` smallint NOT NULL COMMENT '组织类型 1发单 2接单',
  `work_month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '月份yyyy-mm',
  `work_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期yyyy-mm-dd',
  `order_no` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单编号 唯一值，供客户查询',
  `order_type` int NOT NULL DEFAULT 0 COMMENT '1安装单 2维修单',
  `service_score` int NOT NULL DEFAULT 0 COMMENT '评分',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_month`(`work_month` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业日交单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_daily_organize
-- ----------------------------

-- ----------------------------
-- Table structure for order_master
-- ----------------------------
DROP TABLE IF EXISTS `order_master`;
CREATE TABLE `order_master`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自定义名称',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织全名',
  `order_no` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单编号 唯一值，供客户查询',
  `third_order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方平台工单号',
  `order_type` smallint NOT NULL DEFAULT 0 COMMENT '1 安装订单 2 维修订单',
  `order_subtype` smallint NOT NULL DEFAULT 0 COMMENT '0 默认 11 新装 12加装 21维修 22检修 23拆机 24换机 25移机',
  `order_category` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0默认 10内部单 20外部指定服务商 30外部议价单',
  `order_status` smallint NOT NULL DEFAULT 0 COMMENT '订单状态',
  `order_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '安装或者维修信息',
  `lpn` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌号',
  `vin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'VIN',
  `vehicle_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆类型',
  `expected_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '预约日期',
  `expected_time` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '预约时间段',
  `time_zone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '+08:00' COMMENT '时区',
  `manufacturer_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '厂家自编码',
  `manufacturer_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备产品名称',
  `category_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品类别ID',
  `category_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品类别名称',
  `attachment_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '安装产品ID或者维修故障ID',
  `attachment_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '安装产品名称或者维修故障名称，可能附加厂家名称',
  `attachment_imgs` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件图片,最多三张',
  `order_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `order_distribute_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '派单账号 系统派单@ 客户派单账号ID',
  `order_distribute_time` datetime NULL DEFAULT NULL COMMENT '派单时间',
  `distribute_organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接单组织ID',
  `distribute_organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织全名',
  `distribute_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接单用户ID',
  `distribute_user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接单用户名称',
  `distribute_phone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接单用户名称',
  `engineer_confirm_time` datetime NULL DEFAULT NULL COMMENT '工程师确认时间',
  `working_start_time` datetime NULL DEFAULT NULL COMMENT '开始工作时间',
  `working_finish_time` datetime NULL DEFAULT NULL COMMENT '结束工作时间',
  `order_acceptance_time` datetime NULL DEFAULT NULL COMMENT '签单时间',
  `order_cancel_time` datetime NULL DEFAULT NULL COMMENT '取消时间',
  `warning_state` smallint NOT NULL DEFAULT 0 COMMENT '工单预警状态 0正常 1派单超时 2接单超时 3交单超时 4签单超时',
  `service_score` smallint NULL DEFAULT 0 COMMENT '评价得分',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `is_archive` smallint NOT NULL DEFAULT 0 COMMENT '归档',
  `publish_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发单日期',
  `assign_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '派单日期',
  `accept_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接单日期',
  `done_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交单日期',
  `finish_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核日期',
  `sign_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签名图片',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_publish_date`(`publish_date` ASC) USING BTREE,
  INDEX `idx_organize_id`(`organize_id` ASC) USING BTREE,
  INDEX `idx_organize_id2`(`distribute_organize_id` ASC) USING BTREE,
  INDEX `idx_finish_date`(`finish_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工单主表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_master
-- ----------------------------

-- ----------------------------
-- Table structure for order_monthly_engineer
-- ----------------------------
DROP TABLE IF EXISTS `order_monthly_engineer`;
CREATE TABLE `order_monthly_engineer`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '工单归档。计算当天归档工单的耗时分析',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `work_month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '月份 yyyy-mm',
  `order_type` int NOT NULL DEFAULT 0 COMMENT '1安装单 2维修单',
  `num_order` int NOT NULL DEFAULT 0 COMMENT '交付的工单',
  `sum_service_score` int NOT NULL DEFAULT 0 COMMENT '评分',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_month`(`organize_id` ASC, `user_id` ASC, `work_month` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工程师月交单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_monthly_engineer
-- ----------------------------

-- ----------------------------
-- Table structure for order_monthly_organize
-- ----------------------------
DROP TABLE IF EXISTS `order_monthly_organize`;
CREATE TABLE `order_monthly_organize`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '工单归档。计算当天归档工单的耗时分析',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `work_month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '月份 yyyy-mm',
  `order_type` int NOT NULL DEFAULT 0 COMMENT '1安装单 2维修单',
  `num_published` int NOT NULL DEFAULT 0 COMMENT '发布的工单',
  `num_received` int NOT NULL DEFAULT 0 COMMENT '接到的工单',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_month`(`organize_id` ASC, `work_month` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业月交单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_monthly_organize
-- ----------------------------

-- ----------------------------
-- Table structure for order_optional_info
-- ----------------------------
DROP TABLE IF EXISTS `order_optional_info`;
CREATE TABLE `order_optional_info`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_no` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单编号 唯一值，供客户查询',
  `parent_order_no` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '订单编号 唯一值，供客户查询',
  `attachment_imgs` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发单要求图片',
  `optional_info` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片模板可选信息',
  `attached_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其他可选信息',
  `attachment_list` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障数组对象描述',
  `device_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '安装产品',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_order_no`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '可选工单信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_optional_info
-- ----------------------------

-- ----------------------------
-- Table structure for order_quoted_price
-- ----------------------------
DROP TABLE IF EXISTS `order_quoted_price`;
CREATE TABLE `order_quoted_price`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报价人员',
  `contact_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '@' COMMENT '报价联系人姓名',
  `contact_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '报价联系人电话号码',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织全名',
  `order_package` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '工单包',
  `order_no` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单编号 唯一值，供客户查询',
  `quoted_price` int NOT NULL COMMENT '报价，单位分',
  `currency_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'CNY' COMMENT 'ISO_4217格式币种 CNY人民币 USD美元',
  `num_times` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '次数，控制一个工单只能报价三次',
  `price_status` smallint NOT NULL DEFAULT 0 COMMENT '1同意 2拒绝 3失效',
  `order_initiator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工单创建者, 方便后续通知',
  `order_initiator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工单创建者, 方便后续通知',
  `order_initiator_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工单创建者, 方便后续通知',
  `order_organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工单的组织ID',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order`(`order_no` ASC) USING BTREE,
  INDEX `idx_user`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1144 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工单报价单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_quoted_price
-- ----------------------------

-- ----------------------------
-- Table structure for order_record_install
-- ----------------------------
DROP TABLE IF EXISTS `order_record_install`;
CREATE TABLE `order_record_install`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌号码 License Plate Number',
  `vin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆识别代码',
  `product_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '安装产品ID',
  `product_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '安装产品名称',
  `manufacturer_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '生产厂家',
  `manufacturer_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产厂家',
  `device_model` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '设备型号',
  `local_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '本机自编号',
  `sim_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SIM卡唯一码',
  `device_imei` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备序列号',
  `driving_license_imgs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '行驶证正反面',
  `installation_imgs` varchar(1280) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '施工图',
  `construction_content` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '施工内容',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_no`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '安装单记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_record_install
-- ----------------------------

-- ----------------------------
-- Table structure for order_record_install_item
-- ----------------------------
DROP TABLE IF EXISTS `order_record_install_item`;
CREATE TABLE `order_record_install_item`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `imei` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备序列号-808通讯',
  `wired_type` int NOT NULL DEFAULT 1 COMMENT '接线类型 1有线 2无线',
  `install_location` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '安装的位置',
  `sim_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'SIM卡唯一码',
  `local_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '本机自编号',
  `device_model` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '设备型号',
  `product_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '安装产品ID',
  `product_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '安装产品名称',
  `manufacturer_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '生产厂家',
  `manufacturer_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产厂家',
  `test_location` int NULL DEFAULT 0 COMMENT '0 未测试 1 测试通过 2 未通过',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_no`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 256 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '安装单记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_record_install_item
-- ----------------------------

-- ----------------------------
-- Table structure for order_record_install_main
-- ----------------------------
DROP TABLE IF EXISTS `order_record_install_main`;
CREATE TABLE `order_record_install_main`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌号码 License Plate Number',
  `vin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆识别代码',
  `installation_imgs` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '施工图',
  `construction_content` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '施工内容',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_order_no`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '维护保养单记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_record_install_main
-- ----------------------------

-- ----------------------------
-- Table structure for order_record_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `order_record_maintenance`;
CREATE TABLE `order_record_maintenance`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `maintenance_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '维修项ID',
  `imei` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备号',
  `wired_type` int NOT NULL DEFAULT 1 COMMENT '接线类型 1有线 2无线',
  `install_location` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '安装的位置，一般不需要填，来源安装',
  `vehicle_imgs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车头照片',
  `construction_imgs` varchar(1280) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '现场施工照片',
  `repair_scheme` int NOT NULL DEFAULT 1 COMMENT '维修方案	1仅维修 2-设备更换 3-重新安装',
  `new_imei` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'repairScheme为2-设备更换或 3-重新安装时，必填',
  `accessories_imgs_old` varchar(1280) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更换配件照片(旧)',
  `accessories_imgs_new` varchar(1280) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更换配件照片(新)',
  `device_model` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '设备型号',
  `product_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `product_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `maintenance_result` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '原因分析',
  `test_location` int NULL DEFAULT 0 COMMENT '0 未测试 1 测试通过 2 未通过',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `modify_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后修改用户ID',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_no`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '维修单记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_record_maintenance
-- ----------------------------

-- ----------------------------
-- Table structure for order_third_main
-- ----------------------------
DROP TABLE IF EXISTS `order_third_main`;
CREATE TABLE `order_third_main`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '第三方工单',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织全名',
  `order_no_external` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '工单号(外部的)',
  `order_no_internal` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工单号(内部的)',
  `order_type` int NOT NULL DEFAULT 0 COMMENT '1 安装订单 2 维修订单',
  `order_subtype` int NOT NULL DEFAULT 0 COMMENT '0 默认 11 新装 12加装 21维修 22检修 23拆机 24换机 25移机',
  `order_status` int NOT NULL DEFAULT 0 COMMENT '工单状态',
  `order_status_external` int NOT NULL DEFAULT 0 COMMENT '工单状态-外部的API',
  `order_status_internal` int NOT NULL DEFAULT 0 COMMENT '工单状态-内部的API',
  `appointment_time` datetime NOT NULL COMMENT '预约时间',
  `customer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户名称',
  `contact_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系⼈姓名',
  `contact_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系⼈电话',
  `address_detail` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '安装详细地点，⻔店⻔牌等',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '安装区县名称，例⼴东省深圳市',
  `city_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '安装省市区县 6 位编码，例440307',
  `lat` decimal(11, 6) NULL DEFAULT 0.000000 COMMENT '纬度',
  `lng` decimal(11, 6) NULL DEFAULT 0.000000 COMMENT '经度',
  `vehicle_model` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '⻋辆型号，⻋辆品牌、⻋型等',
  `vin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '⻋架号',
  `lpn` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `device_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '安装产品，型号，位置等要求',
  `required_image_codes` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台图片要求code列表',
  `required_image_templates` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台图片要求 自定义列表 比requiredImageIds优先低',
  `timezone` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '+08:00' COMMENT '时区',
  `lang` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'zh-CN' COMMENT '安装或者维修信息',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注，其它安装要求等',
  `third_organize_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方组织源编码，例如 JuRuiYun',
  `creator_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建者(发单者)',
  `creator_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者(发单者)',
  `remark_sync` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '同步语句的最后结果',
  `is_archived` int NOT NULL DEFAULT 0 COMMENT '0未归档 1已归档',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_third_main_un`(`organize_id` ASC, `order_no_external` ASC, `is_archived` ASC) USING BTREE,
  INDEX `order_no_external`(`order_no_external` ASC) USING BTREE,
  INDEX `order_no_internal`(`order_no_internal` ASC) USING BTREE,
  INDEX `idx_time`(`appointment_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '提供给第三方对接用，创建工单的中间表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_third_main
-- ----------------------------

-- ----------------------------
-- Table structure for order_third_party
-- ----------------------------
DROP TABLE IF EXISTS `order_third_party`;
CREATE TABLE `order_third_party`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '第三方工单',
  `work_order_sys_no` bigint NOT NULL COMMENT '工单编号',
  `external_work_orders_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '第三方工单编号',
  `work_order_type` int NOT NULL COMMENT '工单类型 1=定位设备安装',
  `client_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户名称',
  `install_time` datetime NOT NULL COMMENT '预约安装时间',
  `shop_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '安装店面名',
  `link_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '店面联系人',
  `car_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆型号，指车辆品牌、车型等基本描述',
  `vin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '脱敏后的车架号',
  `vin_hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车架号 MD5 后的值',
  `orders_from` int NOT NULL COMMENT '订单来源 1=乘用车零售 2=商用车 3=经',
  `product_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品配置（设备数量，类型，型号）',
  `product_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `credit_period` int NOT NULL COMMENT '服务期限（月）',
  `area_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '安装区县名称',
  `area_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '安装区县 code，省市区县 6 位编码',
  `wiredless_total` int NOT NULL COMMENT '无线设备总数',
  `wired_total` int NOT NULL DEFAULT 0 COMMENT '有线 GPS 总数',
  `gps_total` int NULL DEFAULT NULL COMMENT 'gps 总数',
  `status` int NOT NULL DEFAULT 0 COMMENT '工单状态 10=待派单 20=安装中 30=已',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工单描述追加' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_third_party
-- ----------------------------

-- ----------------------------
-- Table structure for order_timeline
-- ----------------------------
DROP TABLE IF EXISTS `order_timeline`;
CREATE TABLE `order_timeline`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_no` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单编号 唯一值，供客户查询',
  `action_info` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '工单操作',
  `order_status_before` smallint NOT NULL DEFAULT 0 COMMENT '之前订单状态',
  `order_status_after` smallint NOT NULL DEFAULT 0 COMMENT '之后订单状态',
  `change_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '变更信息',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织全名',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作人员',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作人员',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工单时间线' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_timeline
-- ----------------------------

-- ----------------------------
-- Table structure for organize_accessories_device
-- ----------------------------
DROP TABLE IF EXISTS `organize_accessories_device`;
CREATE TABLE `organize_accessories_device`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车辆上安装的设备列表',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `accessories_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配件ID',
  `accessories_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配件名称',
  `accessories_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配件编号',
  `accessories_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '外设类型, 枚举 ADAS DSM TPMS OIL TEMP CARD PASSENGER',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建者ID',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `organize_accessories_number`(`organize_id` ASC, `accessories_number` ASC) USING BTREE,
  UNIQUE INDEX `organize_accessories_name`(`organize_id` ASC, `accessories_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车上安装设备表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_accessories_device
-- ----------------------------

-- ----------------------------
-- Table structure for organize_accessories_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `organize_accessories_vehicle`;
CREATE TABLE `organize_accessories_vehicle`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车辆上安装的设备列表',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆编号',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌号码 License Plate Number',
  `accessories_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配件ID',
  `accessories_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配件编号',
  `accessories_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配件名称',
  `category_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配件类别Id',
  `category_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配件类别名称',
  `accessories_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '外设类型, 枚举 ADAS DSM TPMS OIL TEMP CARD PASSENGER',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建者ID',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_vehicle`(`organize_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3380 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车上安装设备表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_accessories_vehicle
-- ----------------------------

-- ----------------------------
-- Table structure for organize_audio
-- ----------------------------
DROP TABLE IF EXISTS `organize_audio`;
CREATE TABLE `organize_audio`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `audio_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '音频名称',
  `audio_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '音频路径',
  `creator_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建用户',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '音频管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_audio
-- ----------------------------

-- ----------------------------
-- Table structure for organize_bus_stop
-- ----------------------------
DROP TABLE IF EXISTS `organize_bus_stop`;
CREATE TABLE `organize_bus_stop`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `stop_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自编码',
  `stop_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站台编号',
  `stop_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站台名称',
  `state` int NOT NULL DEFAULT 0 COMMENT '0暂未开通 10运营 20停运',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '站台经纬度',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '站台经纬度',
  `azimuth` smallint NULL DEFAULT 0 COMMENT '方位角',
  `icon` int NULL DEFAULT 0 COMMENT '图标 0默认站台 1BRT站台 2船舶',
  `img_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站台图片URL',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `nearby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '靠近位置',
  `open_time` datetime NULL DEFAULT NULL COMMENT '开通时间',
  `stop_time` datetime NULL DEFAULT NULL COMMENT '停运时间',
  `path_line` int NULL DEFAULT 0 COMMENT '途径线路',
  `is_share` tinyint NOT NULL DEFAULT 0 COMMENT '企业内共享 0私有 1公用',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `created_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `updated_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_bus_stop
-- ----------------------------

-- ----------------------------
-- Table structure for organize_config_video
-- ----------------------------
DROP TABLE IF EXISTS `organize_config_video`;
CREATE TABLE `organize_config_video`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `vehicle_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `imei` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '设备号',
  `config` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '配置信息json',
  `creator_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `last_upload_time` datetime NULL DEFAULT NULL COMMENT '最后上传时间',
  `created_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `updated_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_imei`(`organize_id` ASC, `imei` ASC) USING BTREE,
  UNIQUE INDEX `uk_vehicle`(`organize_id` ASC, `vehicle_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '视频配置管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_config_video
-- ----------------------------

-- ----------------------------
-- Table structure for organize_device
-- ----------------------------
DROP TABLE IF EXISTS `organize_device`;
CREATE TABLE `organize_device`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车辆上安装的设备列表',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织全名',
  `device_imei` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备唯一码, 过渡32, 实际很多表都还是16',
  `device_uuid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备唯一码, 32',
  `product_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备类型ID',
  `product_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备类型名称',
  `category_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备类别',
  `category_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类别名称',
  `device_model` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备型号',
  `time_zone` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '+08:00' COMMENT '设备台账时区',
  `character_set` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'GBK' COMMENT '字符集GBK或UTF-8',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '车辆编号',
  `channel` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '通道列表',
  `is_slave` tinyint NOT NULL DEFAULT 0 COMMENT '是否备机',
  `is_prohibit_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '禁止登录',
  `fuel_sensor` json NULL COMMENT '油量传感器JSON',
  `first_connect_time` datetime NULL DEFAULT NULL COMMENT '第一次连接时间',
  `last_connect_time` datetime NULL DEFAULT NULL COMMENT '最后连接时间',
  `last_connect_protocol` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后连接使用的协议',
  `last_disconnect_time` datetime NULL DEFAULT NULL COMMENT '最后断开时间',
  `last_gps_time` datetime NULL DEFAULT NULL COMMENT '最后GPS时间',
  `last_gps_mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '最后GPS时间',
  `register_producer_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '制造商ID',
  `register_terminal_model` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端型号',
  `register_terminal_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端ID',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_imei`(`device_imei` ASC) USING BTREE,
  INDEX `idx_vehicle`(`organize_id` ASC, `vehicle_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46665 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车上安装设备表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_device
-- ----------------------------

-- ----------------------------
-- Table structure for organize_device_compose
-- ----------------------------
DROP TABLE IF EXISTS `organize_device_compose`;
CREATE TABLE `organize_device_compose`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '车辆上安装的设备列表',
  `imei` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备唯一码, 过渡32, 实际很多表都还是16',
  `device_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备的唯一标识',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆ID',
  `register_producer_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端注册-制造商ID',
  `register_terminal_model` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端注册-终端型号',
  `register_terminal_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端注册-终端ID',
  `first_connect_time` datetime NULL DEFAULT NULL COMMENT '第一次连接时间',
  `last_connect_time` datetime NULL DEFAULT NULL COMMENT '最后连接时间',
  `last_connect_protocol` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后连接使用的协议',
  `last_disconnect_time` datetime NULL DEFAULT NULL COMMENT '最后断开时间',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_device_key`(`imei` ASC, `device_key` ASC) USING BTREE,
  INDEX `idx_vehicle`(`organize_id` ASC, `vehicle_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 914 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车上安装设备表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_device_compose
-- ----------------------------

-- ----------------------------
-- Table structure for organize_device_product
-- ----------------------------
DROP TABLE IF EXISTS `organize_device_product`;
CREATE TABLE `organize_device_product`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `product_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备类型ID',
  `manufacturer_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '生产厂家ID',
  `creator_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '创建用户',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_organize_product_id`(`organize_id` ASC, `product_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1820 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备产品管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_device_product
-- ----------------------------

-- ----------------------------
-- Table structure for organize_employee
-- ----------------------------
DROP TABLE IF EXISTS `organize_employee`;
CREATE TABLE `organize_employee`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `emp_type` smallint NOT NULL DEFAULT 1 COMMENT '员工类型 0默认1 驾驶员 2乘务员 3站务',
  `emp_state` smallint NULL DEFAULT 0 COMMENT '状态 0在职 10请假  100离职',
  `fleet_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队 关联t_fleet',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队 关联t_fleet',
  `entry_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入职时间',
  `quit_time` datetime NULL DEFAULT NULL COMMENT '停职时间',
  `personal` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `birthday` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `sex` int NULL DEFAULT NULL COMMENT '性别 0未知 1男 2女',
  `license` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶证',
  `category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶证类型',
  `expire` datetime NULL DEFAULT NULL COMMENT '驾驶证有效期',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `img_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `spell` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首字母拼写',
  `emp_provider` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方服务企业,劳务公司',
  `open_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开放平台ID',
  `certificate` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '从业资格证',
  `facial_recognition_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人脸识别图片josn',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号id',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_emp`(`organize_id` ASC, `emp_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_employee
-- ----------------------------

-- ----------------------------
-- Table structure for organize_employee_card
-- ----------------------------
DROP TABLE IF EXISTS `organize_employee_card`;
CREATE TABLE `organize_employee_card`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `physical_number` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '物理卡号',
  `card_label` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '卡标签',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工号',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `emp_type` smallint NOT NULL DEFAULT 1 COMMENT '员工类型 0默认1 驾驶员 2乘务员 3站务',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号id',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_physical_number`(`organize_id` ASC, `physical_number` ASC) USING BTREE,
  UNIQUE INDEX `uk_card_label`(`organize_id` ASC, `card_label` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工卡号管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_employee_card
-- ----------------------------

-- ----------------------------
-- Table structure for organize_fence
-- ----------------------------
DROP TABLE IF EXISTS `organize_fence`;
CREATE TABLE `organize_fence`  (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '企业id',
  `fence_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '自编码',
  `group_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '围栏分组id',
  `fence_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '站台名称',
  `fence_code` int NULL DEFAULT NULL COMMENT '定点编号',
  `fence_type` int NOT NULL DEFAULT 0 COMMENT '0POI 1圆 2矩形 3多边形 4路径点',
  `fence_category` smallint NOT NULL DEFAULT 0 COMMENT '0常规 10行政区域 ',
  `use_type` smallint NOT NULL DEFAULT 0 COMMENT '区域用途，0默认1停车场2加油充电站3维修点 100自定义',
  `use_description` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '自定义区域用途描述',
  `center_lat` decimal(10, 6) NOT NULL COMMENT '中心点经纬度',
  `center_lng` decimal(10, 6) NOT NULL COMMENT '中心点经纬度',
  `icon` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图标索引',
  `img_url` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `fence_points` varchar(4096) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '路径点 [{lat1,lng1,r1},{lat2,lng2, r2}]',
  `fence_option` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '自定义样式，json字符串',
  `is_share` tinyint NOT NULL DEFAULT 0 COMMENT '企业内共享 0私有 1公用',
  `geocoding_ignore` smallint(6) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '忽略地址解析 0可用 1忽略',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `created_unix` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `updated_unix` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_fence_id`(`fence_id` ASC) USING BTREE,
  INDEX `ix_fence`(`organize_id` ASC, `fence_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21550 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '区域管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_fence
-- ----------------------------

-- ----------------------------
-- Table structure for organize_fence_group
-- ----------------------------
DROP TABLE IF EXISTS `organize_fence_group`;
CREATE TABLE `organize_fence_group`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '围栏用途分钟',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '企业id',
  `group_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '自定义围栏组Id',
  `group_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '自定义围栏组名称',
  `parent_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '父节点',
  `creator_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建用户',
  `created_unix` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `updated_unix` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_fence_group`(`organize_id` ASC, `group_name` ASC, `creator_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '自定义用途分组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_fence_group
-- ----------------------------

-- ----------------------------
-- Table structure for organize_firmware
-- ----------------------------
DROP TABLE IF EXISTS `organize_firmware`;
CREATE TABLE `organize_firmware`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `firmware_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '固件ID',
  `firmware_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '固件名称',
  `firmware_type` smallint NOT NULL DEFAULT 0 COMMENT '固件类型 1固件 2报站文件 3系统配置',
  `firmware_version` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '版本号',
  `firmware_tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '固件标签，采用;分割',
  `notify_type` int NOT NULL DEFAULT 1 COMMENT '1文件升级  2文本通知',
  `file_dir` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '/files/ota/bus/' COMMENT '文件目录',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'FTP文件名称',
  `ota_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文本升级，升级类型=文本的时候生效',
  `device_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '2合1设备, 同IMEI设备过滤项, ITS MDVR等',
  `device_models` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '[]' COMMENT '固件支持的设备型号列表',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_firmware`(`firmware_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '固件档案' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_firmware
-- ----------------------------

-- ----------------------------
-- Table structure for organize_firmware_ota
-- ----------------------------
DROP TABLE IF EXISTS `organize_firmware_ota`;
CREATE TABLE `organize_firmware_ota`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `fleet_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车队编号',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公司或车队名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆编号',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌号码 License Plate Number',
  `imei` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备ID',
  `notice_type` smallint NOT NULL DEFAULT 0 COMMENT '对应设备类型 1控制指令升级 2通过远程升级通知升级 50文本升级 100自定义',
  `ota_state` smallint NOT NULL DEFAULT 0 COMMENT '-1已取消 0未执行 1执行中 2已完成 3失败',
  `ota_progress` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '当前进度',
  `firmware_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '固件ID',
  `firmware_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '固件名称',
  `firmware_type` smallint NOT NULL DEFAULT 0 COMMENT '固件类型 1固件 2报站文件',
  `file_dir` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '/bus/' COMMENT '文件目录',
  `ota_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文本升级，升级类型=文本的时候生效',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `device_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '2合1设备, 同IMEI设备过滤项, ITS MDVR等',
  `message_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '消息唯一ID.替换UUID',
  `is_archived` int NOT NULL DEFAULT 0 COMMENT '归档标记 0 默认 1 已归档',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `organize_firmware_ota_organize_id_IDX`(`organize_id` ASC, `is_archived` ASC, `created_unix` ASC) USING BTREE,
  INDEX `message_id`(`organize_id` ASC, `vehicle_id` ASC, `message_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 567 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '固件升级记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_firmware_ota
-- ----------------------------

-- ----------------------------
-- Table structure for organize_fleet
-- ----------------------------
DROP TABLE IF EXISTS `organize_fleet`;
CREATE TABLE `organize_fleet`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织全名',
  `fleet_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID/分组ID',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司或车队名称',
  `parent_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父组织ID',
  `category` int NOT NULL DEFAULT 0 COMMENT '0 默认 1总公司 2分公司 3车队 4调度站 100调度中心 200其他',
  `sort_id` int NULL DEFAULT 100,
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建用户ID',
  `creator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建用户ID',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_fleet`(`organize_id` ASC, `fleet_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20464 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车队管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_fleet
-- ----------------------------

-- ----------------------------
-- Table structure for organize_info
-- ----------------------------
DROP TABLE IF EXISTS `organize_info`;
CREATE TABLE `organize_info`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织全名',
  `domain_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `short_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业简写，比如中车智联',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织描述',
  `nation_code` int NULL DEFAULT NULL COMMENT '国家代码',
  `regional_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在国家地域信息',
  `code_prov` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份代号',
  `code_city` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市代号',
  `code_coun` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '县城代号',
  `province` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `district` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `website` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织官网',
  `is_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已激活',
  `custom_avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像',
  `organization_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业机构代码',
  `company_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公司地址',
  `corporation_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '法人姓名',
  `business_license_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '营业执照',
  `corporation_identity_card` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '法人身份证',
  `corporation_identity_img` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '法人身份证',
  `corporation_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '法人联系方式',
  `contact_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `contact_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系人电话',
  `num_members` int NOT NULL DEFAULT 0 COMMENT '成员数量',
  `num_published` int NOT NULL DEFAULT 0 COMMENT '企业累计发单',
  `num_received` int NOT NULL DEFAULT 0 COMMENT '企业累计接单',
  `follow_organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上游企业ID',
  `follow_organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上游企业名称',
  `max_followers` smallint UNSIGNED NOT NULL DEFAULT 5 COMMENT '企业最多可创建的下游组织ID',
  `is_partner` smallint NOT NULL DEFAULT 0 COMMENT '城市合伙人，拍档',
  `custom_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '企业级别的配置',
  `favorite_alarm_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '收藏的常规报警ID集合 JSON',
  `favorite_safety_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '收藏的主动安全报警ID集合 JSON',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_organize_id`(`organize_id` ASC) USING BTREE,
  UNIQUE INDEX `uk_organize_name`(`organize_name` ASC) USING BTREE,
  INDEX `idx_follow_id`(`follow_organize_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 186 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_info
-- ----------------------------

-- ----------------------------
-- Table structure for organize_info_authentication
-- ----------------------------
DROP TABLE IF EXISTS `organize_info_authentication`;
CREATE TABLE `organize_info_authentication`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建用户',
  `organization_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业机构代码',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织全名',
  `nation_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家代码',
  `nation_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在国家地域信息',
  `code_prov` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份代号',
  `code_city` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市代号',
  `code_coun` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '县城代号',
  `province` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `district` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `company_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司地址',
  `corporation_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '法人姓名',
  `corporation_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '法人联系方式',
  `business_license_img` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '营业执照',
  `corporation_identity_card` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '法人身份证',
  `corporation_identity_img` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '法人身份证',
  `contact_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人电话',
  `check_status` int NOT NULL DEFAULT 0 COMMENT '审核状态  1通过 2拒绝',
  `check_describe` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '审核状态',
  `check_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核账号ID',
  `check_account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核账号',
  `is_deleted` bigint NOT NULL DEFAULT 0 COMMENT '删除位',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user`(`user_id` ASC, `is_deleted` ASC) USING BTREE,
  UNIQUE INDEX `uk_organization_code`(`organization_code` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织认证' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_info_authentication
-- ----------------------------

-- ----------------------------
-- Table structure for organize_order_optional
-- ----------------------------
DROP TABLE IF EXISTS `organize_order_optional`;
CREATE TABLE `organize_order_optional`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `optional_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自定义选项主键',
  `optional_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自定义选项描述',
  `optional_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自定义数组信息',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `creator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `is_template` smallint NOT NULL DEFAULT 0 COMMENT '是否模板,用于自动复制',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人员, 废弃',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人员, 废弃',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_optional`(`optional_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业可选工单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_order_optional
-- ----------------------------

-- ----------------------------
-- Table structure for organize_partner_city
-- ----------------------------
DROP TABLE IF EXISTS `organize_partner_city`;
CREATE TABLE `organize_partner_city`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织全名',
  `city_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '合伙人城市ID',
  `city_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '合伙人城市名称',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建者ID',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_organize_id`(`organize_id` ASC, `city_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1450 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '城市合伙人服务城市' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_partner_city
-- ----------------------------

-- ----------------------------
-- Table structure for organize_permission
-- ----------------------------
DROP TABLE IF EXISTS `organize_permission`;
CREATE TABLE `organize_permission`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '组织职务自定义权限',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `custom_role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'member' COMMENT '成员身份  member默认成员 owner管理员 service客服 engineer工程师 read只读成员',
  `custom_role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'member' COMMENT '成员身份',
  `permission_actions` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_permission
-- ----------------------------

-- ----------------------------
-- Table structure for organize_quota
-- ----------------------------
DROP TABLE IF EXISTS `organize_quota`;
CREATE TABLE `organize_quota`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `quota_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配额KEY',
  `month` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'yyyy-mm',
  `stock_count` int NOT NULL DEFAULT 100 COMMENT '还可以用多少次',
  `version` int NOT NULL DEFAULT 0 COMMENT '并发版本控制',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_organize_id`(`organize_id` ASC, `quota_key` ASC, `month` ASC) USING BTREE,
  INDEX `ix_organize_id_quota_key`(`organize_id` ASC, `quota_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配额管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_quota
-- ----------------------------

-- ----------------------------
-- Table structure for organize_renewal
-- ----------------------------
DROP TABLE IF EXISTS `organize_renewal`;
CREATE TABLE `organize_renewal`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收藏组织ID',
  `renewal_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '续约单编号',
  `renewal_statue` smallint NOT NULL DEFAULT 0 COMMENT '当前状态 0待审核 1审核中 2已审核通过 3审核不通过',
  `duration_value` int NOT NULL DEFAULT 0 COMMENT '续约时长',
  `duration_unit` int NOT NULL DEFAULT 0 COMMENT '续约单位 0天 1月',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `renewal_images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '续约单附件',
  `payment_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付单号',
  `total_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '整个订单的费用',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `creator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者名称',
  `reviewer_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '审核用户ID',
  `reviewer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核用户名称',
  `review_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '审核意见',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_code`(`organize_id` ASC, `renewal_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 244 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业收藏服务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_renewal
-- ----------------------------

-- ----------------------------
-- Table structure for organize_renewal_item
-- ----------------------------
DROP TABLE IF EXISTS `organize_renewal_item`;
CREATE TABLE `organize_renewal_item`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收藏组织ID',
  `renewal_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '续约单编号',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆编号',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌号码 License Plate Number',
  `imei` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'imei',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '平台到期时间',
  `old_validity` datetime NULL DEFAULT NULL COMMENT '续约之前有效期',
  `new_validity` datetime NOT NULL COMMENT '续约之后有效期',
  `owner_account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主拥有者账号',
  `sales_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '销售名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工单备注信息',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 604 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业收藏服务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_renewal_item
-- ----------------------------

-- ----------------------------
-- Table structure for organize_role
-- ----------------------------
DROP TABLE IF EXISTS `organize_role`;
CREATE TABLE `organize_role`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收藏组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织全名',
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '自定义角色ID',
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自定义角色名称',
  `is_share` int NOT NULL DEFAULT 0 COMMENT '0企业自定义 1系统共享',
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'null: 不限制权限; {}: 没有任何权限; {Page: [\"view\"]}: 拥有Page页面的查看权限',
  `function_group` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '功能权限数组[\"A\",\"B\"]',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_organize_role`(`organize_id` ASC, `role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 223 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织角色管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_role
-- ----------------------------
INSERT INTO `organize_role` VALUES (221, '', '系统内部角色', 'engineer', '工程师', 1, '{\"Monitor\":[\"view\"],\"History\":[\"view\"],\"Safety\":[\"view\"],\"Tire\":[\"view\"]}', NULL, NULL, 'dca0f9e348384d23958e151bb4adb98f', '2025-04-29 03:46:24', '2025-04-29 03:46:24');
INSERT INTO `organize_role` VALUES (222, '', '系统内部角色', 'service', '客服', 1, '', NULL, NULL, 'dca0f9e348384d23958e151bb4adb98f', '2025-04-29 03:46:24', '2025-04-29 03:46:24');

-- ----------------------------
-- Table structure for organize_route
-- ----------------------------
DROP TABLE IF EXISTS `organize_route`;
CREATE TABLE `organize_route`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `route_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路id',
  `route_code` int NOT NULL COMMENT '线路编码',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路名称',
  `fleet_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车队ID',
  `subsidiary_fleet_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级分公司级别车队ID,映射车队表',
  `way_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点方案',
  `route_state` int NOT NULL DEFAULT 0 COMMENT '0暂未开通 10运营 20停运',
  `route_category` smallint NOT NULL DEFAULT 0 COMMENT '线路类别,0双向线路 1单向环线 2双向环线',
  `route_travel` smallint NOT NULL DEFAULT 0 COMMENT '行驶类型 0全部站点 1支线 2区间 3大站',
  `route_ticket` smallint NOT NULL DEFAULT 0 COMMENT '0无人售票 1有人售票',
  `route_trunk` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区间大站支线时对应主线',
  `loop_default_value` int NULL DEFAULT 1 COMMENT '环线默认值1, 可选项1上行, 2下行, 3环线',
  `open_time` datetime NULL DEFAULT NULL COMMENT '线路第一次建立时间',
  `stop_time` datetime NULL DEFAULT NULL COMMENT '停运时间',
  `sort_id` int NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `created_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `updated_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线路表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_route
-- ----------------------------

-- ----------------------------
-- Table structure for organize_route_direction
-- ----------------------------
DROP TABLE IF EXISTS `organize_route_direction`;
CREATE TABLE `organize_route_direction`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '线路行驶方向',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业id',
  `way_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路站点方案',
  `route_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路id',
  `direction` smallint NOT NULL COMMENT '方向 1上行 2下行 3环线',
  `origin_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主站,站点导入时同步',
  `terminal_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '副站',
  `distance` decimal(11, 3) NOT NULL DEFAULT 0.000 COMMENT '全长km',
  `first_time` datetime NOT NULL COMMENT '首班发车时间',
  `last_time` datetime NOT NULL COMMENT '末班发车时间',
  `run_intervals` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发车间隔',
  `ticket_price` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '价格区间',
  `sort_id` int NULL DEFAULT NULL,
  `path` varchar(1800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径点 lat1,lng1|lat2,lng2',
  `style` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自定义样式',
  `non_linear` decimal(11, 3) NULL DEFAULT NULL COMMENT '非直线系数',
  `avg_station_km` decimal(11, 3) NULL DEFAULT NULL COMMENT '平均站距',
  `station_count` int NULL DEFAULT NULL COMMENT '站点数量',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `created_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `updated_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线路方向表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_route_direction
-- ----------------------------

-- ----------------------------
-- Table structure for organize_route_station
-- ----------------------------
DROP TABLE IF EXISTS `organize_route_station`;
CREATE TABLE `organize_route_station`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站点',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `way_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路站点方案',
  `route_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路自编码',
  `route_code` int NOT NULL COMMENT '线路id',
  `direction` smallint NOT NULL COMMENT '方向',
  `station_serial` smallint UNSIGNED NOT NULL COMMENT '站序，不能为负数',
  `station_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点名称',
  `short_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩写',
  `flag` smallint NOT NULL DEFAULT 0 COMMENT '0中间站 1起点 255终点',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `azimuth` smallint NULL DEFAULT NULL COMMENT '方位角',
  `distance` decimal(11, 3) NULL DEFAULT 0.000 COMMENT '距离起点的距离km',
  `distance_previous` decimal(11, 3) NULL DEFAULT NULL COMMENT '与前一站的距离',
  `duration` int NULL DEFAULT 0 COMMENT '距离起点的时间,秒',
  `parking` int NULL DEFAULT 0 COMMENT '停车时长',
  `stop_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应站台id',
  `is_opposite` smallint NULL DEFAULT 0 COMMENT '单向环线标识为对边显示的站点',
  `previous_station_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前一站点名称',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `created_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线路站点表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_route_station
-- ----------------------------

-- ----------------------------
-- Table structure for organize_route_way
-- ----------------------------
DROP TABLE IF EXISTS `organize_route_way`;
CREATE TABLE `organize_route_way`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '线路行驶方向',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `route_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路id',
  `route_code` int NULL DEFAULT NULL COMMENT '线路编码',
  `route_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `way_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线路方案ID',
  `way_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主站,站点导入时同步',
  `route_category` smallint NOT NULL DEFAULT 0 COMMENT '线路类别,0双向线路 1单向环线 2双向环线',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `check_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `active_time` datetime NULL DEFAULT NULL COMMENT '生效日期',
  `is_checked` int NOT NULL DEFAULT 0 COMMENT '审核',
  `is_actived` int NOT NULL DEFAULT 0 COMMENT '当前在用的',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `created_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `updated_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线路站点' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_route_way
-- ----------------------------

-- ----------------------------
-- Table structure for organize_rule
-- ----------------------------
DROP TABLE IF EXISTS `organize_rule`;
CREATE TABLE `organize_rule`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `rule_type` smallint NOT NULL COMMENT '规则类型，0禁入 1禁出',
  `rule_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则编码UUID',
  `rule_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则名称',
  `fence_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '围栏数组JSON - 预留一个规则配置多个围栏',
  `fence_direction` int NOT NULL DEFAULT 0 COMMENT '围栏方向',
  `fence_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '区域编号',
  `fence_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '区域名称',
  `fence_type` smallint NOT NULL DEFAULT 0 COMMENT '区域类型 0点，1圆，2矩形，3多边形，4多段线',
  `fence_category` smallint NOT NULL DEFAULT 0 COMMENT '区域分类 0自定义区域，1行政区域',
  `time_range` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '时间范围 00:00:00~00:00:00',
  `is_share` smallint NOT NULL DEFAULT 0 COMMENT '全局共享',
  `phone_list` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email_list` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `alarm_rules` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'json对象',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_rule`(`rule_id` ASC) USING BTREE,
  INDEX `idx_rule`(`organize_id` ASC, `rule_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18637 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '规则管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_rule
-- ----------------------------

-- ----------------------------
-- Table structure for organize_rule_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `organize_rule_vehicle`;
CREATE TABLE `organize_rule_vehicle`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `rule_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则ID',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '绑定的设备',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_vehicle`(`organize_id` ASC, `rule_id` ASC, `vehicle_id` ASC) USING BTREE,
  INDEX `idx_vehicle`(`organize_id` ASC, `vehicle_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135431 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆规则管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_rule_vehicle
-- ----------------------------

-- ----------------------------
-- Table structure for organize_safety_config
-- ----------------------------
DROP TABLE IF EXISTS `organize_safety_config`;
CREATE TABLE `organize_safety_config`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主动安全报警',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `alarm_type` int NOT NULL DEFAULT 0 COMMENT '报警/事件类型',
  `platform_alarm_id` int NULL DEFAULT 0 COMMENT '平台统一报警id',
  `reduce_score1` decimal(11, 1) NOT NULL DEFAULT 0.0 COMMENT '一级违规扣分多少',
  `reduce_score2` decimal(11, 1) NOT NULL DEFAULT 0.0 COMMENT '二级违规扣分多少',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_organize_id`(`organize_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主动安全配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_safety_config
-- ----------------------------

-- ----------------------------
-- Table structure for organize_sim
-- ----------------------------
DROP TABLE IF EXISTS `organize_sim`;
CREATE TABLE `organize_sim`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公交站台',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '企业id',
  `iccid` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'iccid',
  `phone` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'sim卡手机号码',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `installed_imei` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '安装设备id',
  `flow_mb` int NULL DEFAULT 0 COMMENT '流量MB',
  `activation_time` datetime NULL DEFAULT NULL COMMENT '激活时间',
  `creator_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `created_unix` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `updated_unix` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_phone`(`phone` ASC) USING BTREE,
  UNIQUE INDEX `uk_iccid`(`iccid` ASC) USING BTREE,
  INDEX `idx_sim`(`organize_id` ASC, `iccid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'SIM卡管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_sim
-- ----------------------------

-- ----------------------------
-- Table structure for organize_star
-- ----------------------------
DROP TABLE IF EXISTS `organize_star`;
CREATE TABLE `organize_star`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收藏组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织全名',
  `star_organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '被收藏组织ID',
  `star_organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织全名',
  `star_type` int NOT NULL DEFAULT 0 COMMENT '企业关联关系，1=收藏 2合作工单,接单之后标注',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业收藏服务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_star
-- ----------------------------

-- ----------------------------
-- Table structure for organize_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `organize_vehicle`;
CREATE TABLE `organize_vehicle`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织全名',
  `fleet_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '车队编号',
  `fleet_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '公司或车队名称',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆编号',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车牌号码 License Plate Number',
  `vin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '车辆识别代码',
  `vehicle_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆类型,映射数据字典表',
  `vehicle_model` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆具体型号, 比如比亚迪唐XXX',
  `approved_number` int NULL DEFAULT 0 COMMENT '核载人数',
  `lpn_color` int NOT NULL DEFAULT 9 COMMENT '车牌颜色 1蓝色 2黄色 3黑色 4白色 9其他',
  `icon` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'bus' COMMENT '图标索引',
  `register_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登记日期',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '平台到期时间',
  `driving_license_time` datetime NULL DEFAULT NULL COMMENT '行驶证到期时间',
  `compulsory_insurance_time` datetime NULL DEFAULT NULL COMMENT '交强险到期时间',
  `tpms_info` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'tpms轮胎位置图JSON对象',
  `temp_config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆温感相关设置',
  `fuel_config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆油箱相关配置',
  `io_config` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆io状态对应关系配置',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `dlt` int NOT NULL DEFAULT 0 COMMENT 'DLT，0代表非DLT，1表是DLT',
  `active` int NOT NULL DEFAULT 0 COMMENT '0表活动，1表等待(3 个月)，1表等待(6 个月),  3表过期，4表过期， 5表取消',
  `purchase_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '购买方式设置',
  `auto_create_fence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '围栏自动创建配置',
  `reminder_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '到期或离线回访记录',
  `route_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线路id',
  `renewal_time` datetime NULL DEFAULT NULL COMMENT '续约时间',
  `owner_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拥有者ID',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_lpn`(`organize_id` ASC, `lpn` ASC) USING BTREE,
  INDEX `idx_vehicle`(`organize_id` ASC, `vehicle_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131310 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆档案' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_vehicle
-- ----------------------------

-- ----------------------------
-- Table structure for organize_vehicle_employee
-- ----------------------------
DROP TABLE IF EXISTS `organize_vehicle_employee`;
CREATE TABLE `organize_vehicle_employee`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆编号',
  `emp_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工号',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `organize_vehicle_employee_organize_id_IDX`(`organize_id` ASC, `vehicle_id` ASC, `emp_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆与驾驶员绑定表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_vehicle_employee
-- ----------------------------

-- ----------------------------
-- Table structure for organize_vehicle_fence
-- ----------------------------
DROP TABLE IF EXISTS `organize_vehicle_fence`;
CREATE TABLE `organize_vehicle_fence`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `fence_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '围栏ID',
  `rule_type` smallint NOT NULL COMMENT '规则类型，0禁入 1禁出',
  `rule_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则编码UUID',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `creator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者名称',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_vehicle_fence`(`organize_id` ASC, `vehicle_id` ASC, `fence_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131071 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆保养管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_vehicle_fence
-- ----------------------------

-- ----------------------------
-- Table structure for organize_vehicle_maintain
-- ----------------------------
DROP TABLE IF EXISTS `organize_vehicle_maintain`;
CREATE TABLE `organize_vehicle_maintain`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆ID',
  `vehicle_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆名称',
  `lpn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车牌号',
  `imei` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备IMEI',
  `maintain_date` datetime NOT NULL COMMENT '保养日期',
  `interval_month` smallint NOT NULL DEFAULT 6 COMMENT '保养间隔时间(月)',
  `next_maintain_date` datetime NOT NULL COMMENT '下次保养日期',
  `maintain_mileage` int NOT NULL DEFAULT 0 COMMENT '保养里程(km)',
  `interval_mileage` int NOT NULL DEFAULT 0 COMMENT '保养间隔里程(km)',
  `next_maintain_mileage` int NOT NULL DEFAULT 0 COMMENT '下次保养里程(km)',
  `maintain_content` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保养内容(内容、费用、备注) JSON',
  `gps_mileage` decimal(11, 3) NULL DEFAULT NULL COMMENT '当前gps里程，用于前端查询时先全部赋值，再分页查询',
  `is_archive` smallint NOT NULL DEFAULT 0 COMMENT '是否归档，0=未归档，1=已归档',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_vehicle`(`organize_id` ASC, `vehicle_id` ASC) USING BTREE,
  INDEX `idx_vehicle_date`(`organize_id` ASC, `vehicle_id` ASC, `maintain_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 215 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆保养管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of organize_vehicle_maintain
-- ----------------------------

-- ----------------------------
-- Table structure for system_ad_banner
-- ----------------------------
DROP TABLE IF EXISTS `system_ad_banner`;
CREATE TABLE `system_ad_banner`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `main_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '副标题',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容链接',
  `is_show` int NOT NULL DEFAULT 0 COMMENT '是否展示，0不展示，1展示',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建账号',
  `creator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建账号',
  `api_version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1.0.2' COMMENT '当前API版本号',
  `order_id` int NULL DEFAULT NULL COMMENT '排序',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告位' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_ad_banner
-- ----------------------------

-- ----------------------------
-- Table structure for system_address
-- ----------------------------
DROP TABLE IF EXISTS `system_address`;
CREATE TABLE `system_address`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '产品主表',
  `code_country` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'china' COMMENT '国家英文',
  `code_prov` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code_city` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code_coun` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code_town` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_prov` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_coun` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_town` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '全国地址码表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_address
-- ----------------------------

-- ----------------------------
-- Table structure for system_address_count
-- ----------------------------
DROP TABLE IF EXISTS `system_address_count`;
CREATE TABLE `system_address_count`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '全国主要城市表',
  `code_country` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'china' COMMENT '国家英文',
  `code_prov` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省份ID',
  `code_city` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市编号',
  `name_prov` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省份名称',
  `name_city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市名称',
  `lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度，一般指东经',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度，一般指北纬',
  `count_coun` int NOT NULL DEFAULT 0 COMMENT '下级区县数量',
  `num_order` int NOT NULL DEFAULT 0 COMMENT '发单量',
  `num_engineer` int NOT NULL DEFAULT 0 COMMENT '发单量',
  `has_service_provider` smallint NOT NULL DEFAULT 0 COMMENT '是否服务商',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 999901 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '市级统计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_address_count
-- ----------------------------

-- ----------------------------
-- Table structure for system_alarm_platform
-- ----------------------------
DROP TABLE IF EXISTS `system_alarm_platform`;
CREATE TABLE `system_alarm_platform`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `platform_alarm_id` int NOT NULL COMMENT '报警类型 平台统一',
  `platform_alarm_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alarm_class` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报警大类：实时报警、主动安全报警',
  `alarm_category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报警分组：如ADAS、DSM等',
  `group_id` int NULL DEFAULT NULL COMMENT '报警分组ID',
  `push_name_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中',
  `push_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英',
  `push_name_th` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '泰',
  `push_name_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '印尼',
  `turn_off_push` int NULL DEFAULT 0 COMMENT '是否关闭报警0开启 1关闭',
  `sort_id` int NULL DEFAULT NULL COMMENT '排序字段',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ak_aid`(`platform_alarm_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 440 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台报警名称多语言表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_alarm_platform
-- ----------------------------
INSERT INTO `system_alarm_platform` VALUES (1, 100000, 'ACC关', 'alarm_normal', '808', 10, 'ACC关', 'ACC off', 'ปิดบัญชีแล้ว', 'ACC mati', 0, 100000, '2023-06-25 06:26:17', '2025-04-01 15:58:27');
INSERT INTO `system_alarm_platform` VALUES (2, 100001, 'ACC开', 'alarm_normal', '808', 10, 'ACC开', 'ACC on', 'ACC เปิดอยู่', 'ACC hidup', 0, 100001, '2023-06-25 06:26:17', '2025-04-01 15:58:28');
INSERT INTO `system_alarm_platform` VALUES (3, 100026, '开门', 'alarm_normal', '808', 10, '开门', 'Open door', 'เปิดประตู', 'Buka pintu', 0, 100026, '2023-06-25 06:26:17', '2025-04-01 15:58:29');
INSERT INTO `system_alarm_platform` VALUES (4, 100027, '关门', 'alarm_normal', '808', 10, '关门', 'Close door', 'ปิดประตู', 'Tutup pintu', 0, 100027, '2023-06-25 06:26:17', '2025-04-01 15:58:30');
INSERT INTO `system_alarm_platform` VALUES (6, 200000, 'SOS恢复', 'alarm_normal', '808', 20, 'SOS恢复', 'SOS recovery', 'การกู้คืนสัญญาณขอความช่วยเหลือ', 'Pemulihan SOS', 0, 200000, '2023-06-25 06:26:17', '2025-04-01 15:58:31');
INSERT INTO `system_alarm_platform` VALUES (7, 200001, 'SOS开始', 'alarm_normal', '808', 20, 'SOS开始', 'SOS starts', 'สัญญาณขอความช่วยเหลือเริ่มต้น', 'SOS menyala', 0, 200001, '2023-06-25 06:26:17', '2025-04-01 15:58:32');
INSERT INTO `system_alarm_platform` VALUES (8, 200002, '超速报警恢复', 'alarm_normal', '808', 20, '超速报警恢复', 'Speed alarm recovery', 'การกู้คืนสัญญาณเตือนความเร็ว', 'Pemulihan alarm kecepatan', 0, 200002, '2023-06-25 06:26:17', '2025-04-01 15:58:34');
INSERT INTO `system_alarm_platform` VALUES (9, 200003, '超速报警开始', 'alarm_normal', '808', 20, '超速报警开始', 'Speed warning starts', 'การเตือนความเร็วเริ่มต้นขึ้น', 'Peringatan kecepatan menyala', 0, 200003, '2023-06-25 06:26:17', '2025-04-01 15:58:35');
INSERT INTO `system_alarm_platform` VALUES (10, 200004, '疲劳驾驶恢复', 'alarm_normal', '808', 20, '疲劳驾驶恢复', 'Fatigue driving recovery', 'ฟื้นตัวจากการขับรถเมื่อยล้า', 'Mengemudi karena kelelahan pemulihan', 0, 200004, '2023-06-25 06:26:17', '2025-04-01 15:58:36');
INSERT INTO `system_alarm_platform` VALUES (11, 200005, '疲劳驾驶开始', 'alarm_normal', '808', 20, '疲劳驾驶开始', 'Fatigue driving begins', 'การขับรถเมื่อยล้าเริ่มต้นขึ้น', 'Mengemudi karena kelelahan dimulai', 0, 200005, '2023-06-25 06:26:17', '2025-04-01 15:58:37');
INSERT INTO `system_alarm_platform` VALUES (12, 200006, '危险驾驶恢复', 'alarm_normal', '808', 20, '危险驾驶恢复', 'Dangerous Driving Recovery', 'การกู้คืนการขับขี่ที่เป็นอันตราย', 'Pemulihan Mengemudi Berbahaya', 0, 200006, '2023-06-25 06:26:17', '2025-04-01 15:58:38');
INSERT INTO `system_alarm_platform` VALUES (13, 200007, '危险驾驶开始', 'alarm_normal', '808', 20, '危险驾驶开始', 'Dangerous driving begins', 'การขับขี่ที่เป็นอันตรายเริ่มต้นขึ้น', 'Mengemudi berbahaya dimulai', 0, 200007, '2023-06-25 06:26:17', '2025-04-01 15:58:39');
INSERT INTO `system_alarm_platform` VALUES (14, 200008, '4GNSS故障结束', 'alarm_normal', '808', 20, '4GNSS故障结束', '4GNSS failure ended', 'ความล้มเหลว 4GNSS สิ้นสุดลงแล้ว', 'Kegagalan 4GNSS berakhir', 0, 200008, '2023-06-25 06:26:17', '2025-04-01 15:58:40');
INSERT INTO `system_alarm_platform` VALUES (15, 200009, '4GNSS故障开始', 'alarm_normal', '808', 20, '4GNSS故障开始', '4GNSS failure begins', 'ความล้มเหลว 4GNSS เริ่มต้นขึ้น', 'Kegagalan 4GNSS dimulai', 0, 200009, '2023-06-25 06:26:17', '2025-04-01 15:58:41');
INSERT INTO `system_alarm_platform` VALUES (16, 200015, '终端电源欠压', 'alarm_normal', '808', 20, '终端电源欠压', 'Terminal power supply undervoltage', 'แหล่งจ่ายไฟฟ้าเทอร์มินอลสวนท่ง', 'Tegangan catu daya terminal rendah', 0, 200015, '2023-06-25 06:26:17', '2025-04-01 15:58:42');
INSERT INTO `system_alarm_platform` VALUES (17, 200016, '终端电源上电', 'alarm_normal', '808', 20, '终端电源上电', 'Terminal power on', 'เปิดเครื่องเทอร์มินัล', 'Daya terminal menyala', 0, 200016, '2023-06-25 06:26:17', '2025-04-01 15:58:43');
INSERT INTO `system_alarm_platform` VALUES (18, 200017, '终端电源掉电', 'alarm_normal', '808', 20, '终端电源掉电', 'Terminal power outage', 'เทอร์มินัลไฟฟ้าดับ', 'Pemadaman daya terminal', 0, 200017, '2023-06-25 06:26:17', '2025-04-01 15:58:45');
INSERT INTO `system_alarm_platform` VALUES (19, 200019, '终端显示器故障', 'alarm_normal', '808', 20, '终端显示器故障', 'Terminal display failure', 'เทอร์มินัลจอแสดงผลล้มเหลว', 'Kegagalan tampilan terminal', 0, 200019, '2023-06-25 06:26:17', '2025-04-01 15:58:46');
INSERT INTO `system_alarm_platform` VALUES (20, 200021, '终端TTS模块故障', 'alarm_normal', '808', 20, '终端TTS模块故障', 'Terminal TTS module failure', 'โมดูลเทอร์มินัล TTS ล้มเหลว', 'Kegagalan modul TTS terminal', 0, 200021, '2023-06-25 06:26:17', '2025-04-01 15:58:47');
INSERT INTO `system_alarm_platform` VALUES (21, 200023, '摄像头或存储故障', 'alarm_normal', '808', 20, '摄像头或存储故障', 'Camera or storage failure', 'กล้องหรือที่เก็บข้อมูลล้มเหลว', 'Kegagalan kamera atau penyimpanan', 0, 200023, '2023-06-25 06:26:17', '2025-04-01 15:58:48');
INSERT INTO `system_alarm_platform` VALUES (22, 200025, '终端摄道路运输IC卡模块故障', 'alarm_normal', '808', 20, '终端摄道路运输IC卡模块故障', 'Terminal camera road transport IC card module failure', 'โมดูลการ์ด IC การขนส่งทางถนนของกล้องเทอร์มินัลขัดข้อง', 'Kegagalan modul kartu IC transportasi jalan kamera terminal', 0, 200025, '2023-06-25 06:26:17', '2025-04-01 15:58:50');
INSERT INTO `system_alarm_platform` VALUES (23, 200027, '超速预警', 'alarm_normal', '808', 20, '超速预警', 'Speed warning', 'คำเตือนความเร็ว', 'Peringatan kecepatan', 0, 200027, '2023-06-25 06:26:17', '2025-04-01 15:58:51');
INSERT INTO `system_alarm_platform` VALUES (24, 200029, '疲劳驾驶预警', 'alarm_normal', '808', 20, '疲劳驾驶预警', 'Fatigue driving warning', 'คำเตือนการขับขี่เมื่อยล้า', 'Peringatan mengemudi karena kelelahan', 0, 200029, '2023-06-25 06:26:17', '2025-04-01 15:58:52');
INSERT INTO `system_alarm_platform` VALUES (25, 200031, '违规行驶报警', 'alarm_normal', '808', 20, '违规行驶报警', 'Violation driving alarm', 'สัญญาณเตือนการขับรถฝ่าฝืน', 'Alarm mengemudi karena pelanggaran', 0, 200031, '2023-06-25 06:26:17', '2025-04-01 15:58:53');
INSERT INTO `system_alarm_platform` VALUES (26, 200033, '胎压预警', 'alarm_normal', '808', 20, '胎压预警', 'Tire pressure warning', 'คำเตือนแรงดันลมยาง', 'Peringatan tekanan ban', 0, 200033, '2023-06-25 06:26:17', '2025-04-01 15:58:54');
INSERT INTO `system_alarm_platform` VALUES (27, 200035, '右转盲区异常报警', 'alarm_normal', '808', 20, '右转盲区异常报警', 'Right turn blind spot abnormality alarm', 'สัญญาณเตือนจุดบอดเลี้ยวขวาผิดปกติ', 'Alarm kelainan titik buta belok kanan', 0, 200035, '2023-06-25 06:26:17', '2025-04-01 15:58:55');
INSERT INTO `system_alarm_platform` VALUES (28, 200037, '当天累计驾驶超时', 'alarm_normal', '808', 20, '当天累计驾驶超时', 'Total driving time exceeded on the day', 'เกินเวลาขับรถรวมในวันนั้น', 'Total waktu mengemudi terlampaui pada hari itu', 0, 200037, '2023-06-25 06:26:17', '2025-04-01 15:58:58');
INSERT INTO `system_alarm_platform` VALUES (29, 200039, '超时停车报警', 'alarm_normal', '808', 20, '超时停车报警', 'Overtime parking alarm', 'สัญญาณเตือนการจอดรถล่วงเวลา', 'Alarm parkir lembur', 0, 200039, '2023-06-25 06:26:17', '2025-04-01 15:59:02');
INSERT INTO `system_alarm_platform` VALUES (30, 200040, '进区域报警', 'alarm_normal', '808', 20, '进区域报警', 'Alarm in area', 'สัญญาณเตือนภัยในพื้นที่', 'Alarm di area', 0, 200040, '2023-06-25 06:26:17', '2025-04-01 15:59:03');
INSERT INTO `system_alarm_platform` VALUES (31, 200041, '出区域报警', 'alarm_normal', '808', 20, '出区域报警', 'Out of area alarm', 'สัญญาณเตือนออกนอกพื้นที่', 'Alarm di luar area', 0, 200041, '2023-06-25 06:26:17', '2025-04-01 15:59:04');
INSERT INTO `system_alarm_platform` VALUES (32, 200043, '进出路线报警', 'alarm_normal', '808', 20, '进出路线报警', 'Alarm for entry and exit routes', 'สัญญาณเตือนสำหรับเส้นทางเข้าและออก', 'Alarm untuk rute masuk dan keluar', 0, 200043, '2023-06-25 06:26:17', '2025-04-01 15:59:07');
INSERT INTO `system_alarm_platform` VALUES (33, 200045, '路段行驶时长报警', 'alarm_normal', '808', 20, '路段行驶时长报警', 'Road section driving time alarm', 'สัญญาณเตือนเวลาขับขี่ส่วนถนน', 'Alarm waktu mengemudi di ruas jalan', 0, 200045, '2023-06-25 06:26:17', '2025-04-01 15:59:08');
INSERT INTO `system_alarm_platform` VALUES (34, 200047, '路线偏离', 'alarm_normal', '808', 20, '路线偏离', 'Route deviation', 'การเบี่ยงเบนเส้นทาง', 'Penyimpangan rute', 0, 200047, '2023-06-25 06:26:17', '2025-04-01 15:59:09');
INSERT INTO `system_alarm_platform` VALUES (35, 200049, '车辆VSS故障', 'alarm_normal', '808', 20, '车辆VSS故障', 'Vehicle VSS failure', 'VSS ของยานพาหนะล้มเหลว', 'Kegagalan VSS kendaraan', 0, 200049, '2023-06-25 06:26:17', '2025-04-01 15:59:11');
INSERT INTO `system_alarm_platform` VALUES (36, 200051, '车辆油量异常报警', 'alarm_normal', '808', 20, '车辆油量异常报警', 'Vehicle oil level abnormality alarm', 'สัญญาณเตือนระดับน้ำมันรถยนต์ผิดปกติ', 'Alarm kelainan level oli kendaraan', 0, 200051, '2023-06-25 06:26:17', '2025-04-01 15:59:12');
INSERT INTO `system_alarm_platform` VALUES (37, 200053, '车辆被盗报警', 'alarm_normal', '808', 20, '车辆被盗报警', 'vehicle stolen alarm', 'สัญญาณกันขโมยรถ', 'Alarm pencurian kendaraan', 0, 200053, '2023-06-25 06:26:17', '2025-04-01 15:59:13');
INSERT INTO `system_alarm_platform` VALUES (38, 200055, '车辆非法点火报警', 'alarm_normal', '808', 20, '车辆非法点火报警', 'Illegal vehicle ignition alarm', 'สัญญาณแจ้งเตือนการจุดระเบิดของยานพาหนะที่ผิดกฎหมาย', 'Alarm pengapian kendaraan ilegal', 0, 200055, '2023-06-25 06:26:17', '2025-04-01 15:59:15');
INSERT INTO `system_alarm_platform` VALUES (39, 200057, '车辆非法位移报警', 'alarm_normal', '808', 20, '车辆非法位移报警', 'Vehicle illegal displacement alarm', 'สัญญาณเตือนการเคลื่อนที่อย่างผิดกฎหมายของยานพาหนะ', 'Alarm perpindahan kendaraan ilegal', 0, 200057, '2023-06-25 06:26:17', '2025-04-01 15:59:16');
INSERT INTO `system_alarm_platform` VALUES (40, 200059, '碰撞侧翻报警', 'alarm_normal', '808', 20, '碰撞侧翻报警', 'Collision and rollover alarm', 'สัญญาณเตือนการชนและการพลิกคว่ำ', 'Alarm tabrakan dan terguling', 0, 200059, '2023-06-25 06:26:17', '2025-04-01 15:59:17');
INSERT INTO `system_alarm_platform` VALUES (41, 200061, '侧翻预警', 'alarm_normal', '808', 20, '侧翻预警', 'Rollover warning', 'คำเตือนการโรลโอเวอร์', 'Peringatan terguling', 0, 200061, '2023-06-25 06:26:17', '2025-04-01 15:59:20');
INSERT INTO `system_alarm_platform` VALUES (42, 300020, '视频相关报警', 'alarm_normal', '1078', 30, '视频相关报警', 'Video related alarms', 'สัญญาณเตือนที่เกี่ยวข้องกับวิดีโอ', 'Alarm terkait video', 0, 300020, '2023-06-25 06:26:17', '2025-04-01 15:59:21');
INSERT INTO `system_alarm_platform` VALUES (43, 300021, '视频丢失', 'alarm_normal', '1078', 30, '视频丢失', 'Video lost', 'วิดีโอหายไป', 'Video hilang', 0, 300021, '2023-06-25 06:26:17', '2025-04-01 15:59:22');
INSERT INTO `system_alarm_platform` VALUES (44, 300022, '视频遮挡', 'alarm_normal', '1078', 30, '视频遮挡', 'Video occlusion', 'การบดเคี้ยววิดีโอ', 'Oklusi video', 0, 300022, '2023-06-25 06:26:17', '2025-04-01 15:59:23');
INSERT INTO `system_alarm_platform` VALUES (45, 300023, '存储器故障', 'alarm_normal', '1078', 30, '存储器故障', 'Memory failure', 'หน่วยความจำล้มเหลว', 'Kegagalan memori', 0, 300023, '2023-06-25 06:26:17', '2025-04-01 15:59:24');
INSERT INTO `system_alarm_platform` VALUES (46, 300024, '异常驾驶行为', 'alarm_normal', '1078', 30, '异常驾驶行为', 'Abnormal driving behavior', 'พฤติกรรมการขับขี่ที่ผิดปกติ', 'Perilaku mengemudi yang tidak normal', 0, 300024, '2023-06-25 06:26:17', '2025-04-01 15:59:25');
INSERT INTO `system_alarm_platform` VALUES (47, 600003, '震动报警', 'alarm_normal', 'track', 40, '震动报警', 'Vibration alarm', 'สัญญาณเตือนการสั่นสะเทือน', 'Alarm getaran', 0, 600003, '2023-06-25 06:26:17', '2025-04-01 15:59:26');
INSERT INTO `system_alarm_platform` VALUES (48, 600009, '低电关机报警', 'alarm_normal', 'track', 40, '低电关机报警', 'Low power shutdown alarm', 'สัญญาณเตือนการปิดเครื่องพลังงานต่ำ', 'Alarm pematian daya rendah', 0, 600009, '2023-06-25 06:26:17', '2025-04-01 15:59:27');
INSERT INTO `system_alarm_platform` VALUES (49, 600011, '关机报警', 'alarm_normal', 'track', 40, '关机报警', 'Shutdown alarm', 'สัญญาณเตือนการปิดเครื่อง', 'Alarm pematian', 0, 600011, '2023-06-25 06:26:17', '2025-04-01 15:59:28');
INSERT INTO `system_alarm_platform` VALUES (50, 600012, '换卡报警', 'alarm_normal', 'track', 40, '换卡报警', 'Change card alarm', 'เปลี่ยนสัญญาณเตือนการ์ด', 'Ganti kartu alarm', 0, 600012, '2023-06-25 06:26:17', '2025-04-01 15:59:29');
INSERT INTO `system_alarm_platform` VALUES (51, 600013, '拆卸报警', 'alarm_normal', 'track', 40, '拆卸报警', 'Disassembly alarm', 'สัญญาณเตือนการถอดชิ้นส่วน', 'Alarm pembongkaran', 0, 600013, '2023-06-25 06:26:17', '2025-04-01 15:59:30');
INSERT INTO `system_alarm_platform` VALUES (52, 600014, '伪基站报警', 'alarm_normal', 'track', 40, '伪基站报警', 'Pseudo base station alarm', 'สัญญาณเตือนสถานีฐานหลอก', 'Alarm stasiun pangkalan semu', 0, 600014, '2023-06-25 06:26:17', '2025-04-01 15:59:31');
INSERT INTO `system_alarm_platform` VALUES (53, 600015, '位移报警', 'alarm_normal', 'track', 40, '位移报警', 'Displacement alarm', 'สัญญาณเตือนการเคลื่อนที่', 'Alarm perpindahan', 0, 600015, '2023-06-25 06:26:17', '2025-04-01 15:59:32');
INSERT INTO `system_alarm_platform` VALUES (54, 600016, '外电低电保护后飞行模式报警', 'alarm_normal', 'track', 40, '外电低电保护后飞行模式报警', 'Flight mode alarm after external low power protection', 'สัญญาณเตือนโหมดการบินหลังจากการป้องกันพลังงานต่ำภายนอก', 'Alarm mode penerbangan setelah perlindungan daya rendah eksternal', 0, 600016, '2023-06-25 06:26:17', '2025-04-01 15:59:33');
INSERT INTO `system_alarm_platform` VALUES (55, 600017, '外电低电声控报警', 'alarm_normal', 'track', 40, '外电低电声控报警', 'Low external power audible alarm', 'เสียงเตือนจากพลังงานภายนอกต่ำ', 'Alarm suara daya eksternal rendah', 0, 600017, '2023-06-25 06:26:17', '2025-04-01 15:59:34');
INSERT INTO `system_alarm_platform` VALUES (56, 600018, '外电低电保护报警', 'alarm_normal', 'track', 40, '外电低电保护报警', 'External low power protection alarm', 'สัญญาณเตือนการป้องกันพลังงานต่ำภายนอก', 'Alarm perlindungan daya rendah eksternal', 0, 600018, '2023-06-25 06:26:17', '2025-04-01 15:59:35');
INSERT INTO `system_alarm_platform` VALUES (57, 600019, 'GPS第一次定位报警', 'alarm_normal', 'track', 40, 'GPS第一次定位报警', 'GPS first positioning alarm', 'GPS แจ้งเตือนตำแหน่งแรก', 'Alarm penentuan posisi pertama GPS', 0, 600019, '2023-06-25 06:26:17', '2025-04-01 15:59:36');
INSERT INTO `system_alarm_platform` VALUES (58, 600020, '开机报警', 'alarm_normal', 'track', 40, '开机报警', 'Alarm on power on', 'ปลุกเมื่อเปิดเครื่อง', 'Alarm saat daya hidup', 0, 600020, '2023-06-25 06:26:17', '2025-04-01 15:59:37');
INSERT INTO `system_alarm_platform` VALUES (59, 600021, '进GPS盲区报警', 'alarm_normal', 'track', 40, '进GPS盲区报警', 'Alarm when entering GPS blind zone', 'สัญญาณเตือนเมื่อเข้าสู่โซนตาบอด GPS', 'Alarm saat memasuki zona buta GPS', 0, 600021, '2023-06-25 06:26:17', '2025-04-01 15:59:38');
INSERT INTO `system_alarm_platform` VALUES (60, 600022, '出GPS盲区报警', 'alarm_normal', 'track', 40, '出GPS盲区报警', 'Alarm when leaving GPS blind zone', 'สัญญาณเตือนเมื่อออกจากโซนตาบอด GPS', 'Alarm saat meninggalkan zona buta GPS', 0, 600022, '2023-06-25 06:26:17', '2025-04-01 15:59:39');
INSERT INTO `system_alarm_platform` VALUES (61, 600023, '门报警', 'alarm_normal', 'track', 40, '门报警', 'Door alarm', 'สัญญาณเตือนประตู', 'Alarm pintu', 0, 600023, '2023-06-25 06:26:17', '2025-04-01 15:59:40');
INSERT INTO `system_alarm_platform` VALUES (62, 600101, '输入1激活', 'alarm_normal', 'track', 40, '输入1激活', 'Enter 1 to activate', 'ป้อน 1 เพื่อเปิดใช้งาน', 'Masukkan 1 untuk mengaktifkan', 0, 600101, '2023-06-25 06:26:17', '2025-04-01 15:59:41');
INSERT INTO `system_alarm_platform` VALUES (63, 600102, '输入2激活', 'alarm_normal', 'track', 40, '输入2激活', 'Input 2 to activate', 'เข้า 2 เพื่อเปิดใช้งาน ', 'Masukkan 2 untuk mengaktifkan', 0, 600102, '2023-06-25 06:26:17', '2025-04-01 15:59:42');
INSERT INTO `system_alarm_platform` VALUES (64, 600103, '输入3激活', 'alarm_normal', 'track', 40, '输入3激活', 'Enter 3 to activate ', 'ใส่ 3 เพื่อเปิดใช้งาน ', 'Masukkan 3 untuk mengaktifkan', 0, 600103, '2023-06-25 06:26:17', '2025-04-01 15:59:43');
INSERT INTO `system_alarm_platform` VALUES (65, 600104, '输入4激活', 'alarm_normal', 'track', 40, '输入4激活', 'Enter 4 to activate', 'ป้อน 4 เพื่อเปิดใช้งาน', 'Masukkan 4 untuk mengaktifkan', 0, 600104, '2023-06-25 06:26:17', '2025-04-01 15:59:44');
INSERT INTO `system_alarm_platform` VALUES (66, 600105, '输入5激活', 'alarm_normal', 'track', 40, '输入5激活', 'Enter 5 to activate', 'ป้อน 5 เพื่อเปิดใช้งาน', 'Masukkan 5 untuk mengaktifkan', 0, 600105, '2023-06-25 06:26:17', '2025-04-01 15:59:46');
INSERT INTO `system_alarm_platform` VALUES (67, 600109, '输入1非激活', 'alarm_normal', 'track', 40, '输入1非激活', 'Enter 1 inactive', 'ป้อน 1 ที่ไม่ใช้งาน', 'Masukkan 1 tidak aktif', 0, 600109, '2023-06-25 06:26:17', '2025-04-01 15:59:47');
INSERT INTO `system_alarm_platform` VALUES (68, 600110, '输入2非激活', 'alarm_normal', 'track', 40, '输入2非激活', 'Input 2 inactive', 'อินพุต 2 ไม่ทำงาน', 'Masukkan 2 tidak aktif', 0, 600110, '2023-06-25 06:26:17', '2025-04-01 15:59:48');
INSERT INTO `system_alarm_platform` VALUES (69, 600111, '输入3非激活', 'alarm_normal', 'track', 40, '输入3非激活', 'Enter 3 inactive', 'ป้อน 3 ไม่ทำงาน', 'Masukkan 3 tidak aktif', 0, 600111, '2023-06-25 06:26:17', '2025-04-01 15:59:49');
INSERT INTO `system_alarm_platform` VALUES (70, 600112, '输入4非激活', 'alarm_normal', 'track', 40, '输入4非激活', 'Enter 4 inactive', 'ป้อน 4 ไม่ทำงาน', 'Masukkan 4 tidak aktif', 0, 600112, '2023-06-25 06:26:17', '2025-04-01 15:59:51');
INSERT INTO `system_alarm_platform` VALUES (71, 600113, '输入5非激活', 'alarm_normal', 'track', 40, '输入5非激活', 'Enter 5 inactive', 'ป้อน 5 ไม่ทำงาน', 'Masukkan 5 tidak aktif', 0, 600113, '2023-06-25 06:26:17', '2025-04-01 15:59:52');
INSERT INTO `system_alarm_platform` VALUES (72, 600141, '车停驶', 'alarm_normal', 'track', 40, '车停驶', 'Car stopped', 'รถหยุดแล้ว', 'Mobil berhenti', 0, 600141, '2023-06-25 06:26:17', '2025-04-01 15:59:53');
INSERT INTO `system_alarm_platform` VALUES (73, 600142, '车起步', 'alarm_normal', 'track', 40, '车起步', 'Car starts', 'รถสตาร์ท', 'Mobil menyala', 0, 600142, '2023-06-25 06:26:17', '2025-04-01 15:59:54');
INSERT INTO `system_alarm_platform` VALUES (74, 600144, 'GSM被干扰', 'alarm_normal', 'track', 40, 'GSM被干扰', 'GSM is interfered with', 'GSM ถูกรบกวน', 'GSM terganggu', 0, 600144, '2023-06-25 06:26:17', '2025-04-01 15:59:55');
INSERT INTO `system_alarm_platform` VALUES (75, 600156, '布防成功', 'alarm_normal', 'track', 40, '布防成功', 'Armed successfully', 'ติดอาวุธได้สำเร็จ', 'Berhasil diaktifkan', 0, 600156, '2023-06-25 06:26:17', '2025-04-01 15:59:56');
INSERT INTO `system_alarm_platform` VALUES (76, 600157, '撤防成功', 'alarm_normal', 'track', 40, '撤防成功', 'Disarmed successfully', 'ปลดอาวุธได้สำเร็จ', 'Berhasil dinonaktifkan', 0, 600157, '2023-06-25 06:26:17', '2025-04-01 15:59:57');
INSERT INTO `system_alarm_platform` VALUES (77, 600158, '偷车', 'alarm_normal', 'track', 40, '偷车', 'Steal a car', 'ขโมยรถ', 'Mencuri mobil', 0, 600158, '2023-06-25 06:26:17', '2025-04-01 15:59:58');
INSERT INTO `system_alarm_platform` VALUES (78, 600163, 'GSM干扰被解除', 'alarm_normal', 'track', 40, 'GSM干扰被解除', 'GSM interference removed', 'การรบกวน GSM ถูกลบออก', 'Gangguan GSM dihapus', 0, 600163, '2023-06-25 06:26:17', '2025-04-01 15:59:59');
INSERT INTO `system_alarm_platform` VALUES (79, 600317, '设备电池电量低', 'alarm_normal', 'track', 40, '设备电池电量低', 'Device battery is low', 'แบตเตอรี่ของอุปกรณ์เหลือน้อย', 'Baterai perangkat lemah', 0, 600317, '2023-06-25 06:26:17', '2025-04-01 16:00:00');
INSERT INTO `system_alarm_platform` VALUES (80, 600320, 'GPS天线切割', 'alarm_normal', 'track', 40, 'GPS天线切割', 'GPS antenna cutting', 'การตัดเสาอากาศ GPS', 'Pemotongan antena GPS', 0, 600320, '2023-06-25 06:26:17', '2025-04-01 16:00:01');
INSERT INTO `system_alarm_platform` VALUES (81, 600323, '紧急加速', 'alarm_normal', 'track', 40, '紧急加速', 'Emergency acceleration', 'การเร่งความเร็วฉุกเฉิน', 'Akselerasi darurat', 0, 600323, '2023-06-25 06:26:17', '2025-04-01 16:00:03');
INSERT INTO `system_alarm_platform` VALUES (82, 600324, '紧急减速', 'alarm_normal', 'track', 40, '紧急减速', 'Emergency deceleration', 'การชะลอตัวฉุกเฉิน', 'Deselerasi darurat', 0, 600324, '2023-06-25 06:26:17', '2025-04-01 16:00:04');
INSERT INTO `system_alarm_platform` VALUES (83, 600325, '设备休眠', 'alarm_normal', 'track', 40, '设备休眠', 'Device sleeps', 'อุปกรณ์เข้าสู่โหมดสลีป', 'Perangkat tidur', 0, 600325, '2023-06-25 06:26:17', '2025-04-01 16:00:05');
INSERT INTO `system_alarm_platform` VALUES (84, 600326, '设备唤醒', 'alarm_normal', 'track', 40, '设备唤醒', 'Device wake up', 'อุปกรณ์ตื่นขึ้น', 'Perangkat bangun', 0, 600326, '2023-06-25 06:26:17', '2025-04-01 16:00:06');
INSERT INTO `system_alarm_platform` VALUES (85, 600335, '怠速报警', 'alarm_normal', 'track', 40, '怠速报警', 'Idle speed alarm', 'สัญญาณเตือนความเร็วรอบเดินเบา', 'Alarm kecepatan diam', 0, 600335, '2023-06-25 06:26:17', '2025-04-01 16:00:07');
INSERT INTO `system_alarm_platform` VALUES (86, 600340, '高温报警', 'alarm_normal', 'track', 40, '高温报警', 'High temperature alarm', 'สัญญาณเตือนอุณหภูมิสูง', 'Alarm suhu tinggi', 0, 600340, '2023-06-25 06:26:17', '2025-04-01 16:00:08');
INSERT INTO `system_alarm_platform` VALUES (87, 600341, '低温报警', 'alarm_normal', 'track', 40, '低温报警', 'Low temperature alarm', 'สัญญาณเตือนอุณหภูมิต่ำ', 'Alarm suhu rendah', 0, 600341, '2023-06-25 06:26:17', '2025-04-01 16:00:09');
INSERT INTO `system_alarm_platform` VALUES (88, 600344, '油量报警', 'alarm_normal', 'track', 40, '油量报警', 'Oil level alarm', 'สัญญาณเตือนระดับน้ำมัน', 'Alarm level oli', 0, 600344, '2023-06-25 06:26:17', '2025-04-01 16:00:11');
INSERT INTO `system_alarm_platform` VALUES (89, 600345, '加油', 'alarm_normal', 'track', 40, '加油', 'Add oil', 'มาเร็ว', 'Tambah oli', 0, 600345, '2023-06-25 06:26:17', '2025-04-01 16:00:12');
INSERT INTO `system_alarm_platform` VALUES (90, 600346, '油量低', 'alarm_normal', 'track', 40, '油量低', 'Low oil level', 'ระดับน้ำมันต่ำ', 'Level oli rendah', 0, 600346, '2023-06-25 06:26:17', '2025-04-01 16:00:13');
INSERT INTO `system_alarm_platform` VALUES (91, 600347, '油量高', 'alarm_normal', 'track', 40, '油量高', 'High oil content', 'มีปริมาณน้ำมันสูง', 'Oli tinggi konten', 0, 600347, '2023-06-25 06:26:17', '2025-04-01 16:00:14');
INSERT INTO `system_alarm_platform` VALUES (92, 25865, '打哈欠报警', 'alarm_safety', 'DSM', 200, '打哈欠报警', 'Yawning alarm', 'สัญญาณเตือนหาว', 'Alarm menguap', 0, 25865, '2023-10-20 09:44:45', '2025-04-01 15:58:08');
INSERT INTO `system_alarm_platform` VALUES (93, 25866, '红外阻断报警', 'alarm_safety', 'DSM', 200, '红外阻断报警', 'Infrared blocking alarm', 'ปลุกบล็อกอินฟราเรด', 'Alarm pemblokiran inframerah', 0, 25866, '2023-10-20 09:44:46', '2025-04-01 15:58:09');
INSERT INTO `system_alarm_platform` VALUES (94, 25867, '镜头遮挡', 'alarm_safety', 'DSM', 200, '镜头遮挡', 'Lens occlusion', 'หน้ากากเลนส์', 'Penyumbatan lensa', 0, 25867, '2023-10-20 09:44:46', '2025-04-01 15:58:10');
INSERT INTO `system_alarm_platform` VALUES (184, 25601, '前向碰撞', 'alarm_safety', 'ADAS', 200, '前向碰撞', 'Forward collision alarm', 'สัญญาณเตือนการชน\',', 'Alarm tabrakan depan', 0, 25601, '2022-03-08 06:39:18', '2025-04-01 15:57:44');
INSERT INTO `system_alarm_platform` VALUES (185, 25602, '车道偏离', 'alarm_safety', 'ADAS', 200, '车道偏离', 'Lane departure warning', 'คำเตือนการออกจากเลน\',', 'Peringatan keluar jalur', 0, 25602, '2022-03-08 06:39:37', '2025-04-01 15:57:45');
INSERT INTO `system_alarm_platform` VALUES (186, 25603, '车距过近', 'alarm_safety', 'ADAS', 200, '车距过近', 'Alarm when the distance is too close', 'เตือนระยะใกล้เกินไป\',', 'Alarm saat jarak terlalu dekat', 0, 25603, '2022-03-08 06:39:48', '2025-04-01 15:57:47');
INSERT INTO `system_alarm_platform` VALUES (187, 25604, '行人碰撞', 'alarm_safety', 'ADAS', 200, '行人碰撞', 'Pedestrian collision alarm', 'สัญญาณเตือนการชนกันของคนเดินเท้า\',', 'Alarm tabrakan pejalan kaki', 0, 25604, '2022-03-08 06:39:57', '2025-04-01 15:57:48');
INSERT INTO `system_alarm_platform` VALUES (188, 25605, '频繁变道', 'alarm_safety', 'ADAS', 200, '频繁变道', 'Frequent lane change alarm', 'สัญญาณเตือนการเปลี่ยนเลนบ่อย\',', 'Alarm sering berpindah jalur', 0, 25605, '2022-03-08 06:40:06', '2025-04-01 15:57:50');
INSERT INTO `system_alarm_platform` VALUES (189, 25606, '道路标识超限', 'alarm_safety', 'ADAS', 200, '道路标识超限', 'Road sign overrun alarm', 'สัญญาณเตือนการบุกรุกถนน\',', 'Alarm melewati rambu jalan', 0, 25606, '2022-03-08 06:40:17', '2025-04-01 15:57:52');
INSERT INTO `system_alarm_platform` VALUES (190, 25607, '障碍物', 'alarm_safety', 'ADAS', 200, '障碍物', 'Obstacle alarm', 'สัญญาณเตือนภัยที่เป็นอุปสรรค\',', 'Alarm halangan', 0, 25607, '2022-03-08 06:42:50', '2025-04-01 15:57:53');
INSERT INTO `system_alarm_platform` VALUES (191, 25608, '前向摄像头遮挡', 'alarm_safety', 'ADAS', 200, '前向摄像头遮挡', 'Forward camera occlusion', 'กล้องด้านหน้า\',', 'Penyumbatan kamera depan', 0, 25608, '2022-03-08 06:43:00', '2025-04-01 15:57:54');
INSERT INTO `system_alarm_platform` VALUES (192, 25616, '道路标志识别事件', 'alarm_safety', 'ADAS', 200, '道路标志识别事件', 'Road sign recognition event', 'เหตุการณ์การจดจำป้ายถนน\',', 'Peristiwa pengenalan rambu jalan', 0, 25616, '2022-03-08 06:43:11', '2025-04-01 15:57:56');
INSERT INTO `system_alarm_platform` VALUES (193, 25617, '主动抓拍事件', 'alarm_safety', 'ADAS', 200, '主动抓拍事件', 'Active capture event', 'กิจกรรมการจับภาพที่ใช้งานอยู่\',', 'Peristiwa tangkapan aktif', 0, 25617, '2022-03-08 06:43:22', '2025-04-01 15:57:57');
INSERT INTO `system_alarm_platform` VALUES (194, 25857, '疲劳驾驶', 'alarm_safety', 'DSM', 200, '疲劳驾驶', 'Fatigue driving alarm', 'เตือนเมื่อยการเมื่อยล้าในการขับขี่\',', 'Alarm mengemudi karena kelelahan', 0, 25857, '2022-03-08 06:43:32', '2025-04-01 15:57:58');
INSERT INTO `system_alarm_platform` VALUES (195, 25858, '接打电话', 'alarm_safety', 'DSM', 200, '接打电话', 'Answer the call', '\'รับโทรศัพท์\',', 'Jawab panggilan', 0, 25858, '2022-03-08 06:43:42', '2025-04-01 15:58:00');
INSERT INTO `system_alarm_platform` VALUES (196, 25859, '抽烟报警', 'alarm_safety', 'DSM', 200, '抽烟报警', 'Smoking alarm', 'เตือนการสูบบุหรี่\',', 'Alarm merokok', 0, 25859, '2022-03-08 06:43:50', '2025-04-01 15:58:01');
INSERT INTO `system_alarm_platform` VALUES (197, 25860, '分神驾驶', 'alarm_safety', 'DSM', 200, '分神驾驶', 'Distracted driving alarm', 'เตือนการขับขี่ที่เสียสมาธิ\',', 'Alarm mengemudi karena gangguan', 0, 25860, '2022-03-08 06:44:01', '2025-04-01 15:58:02');
INSERT INTO `system_alarm_platform` VALUES (198, 25861, '驾驶员异常', 'alarm_safety', 'DSM', 200, '驾驶员异常', 'Driver abnormal alarm', 'แจ้งตือนคนขับผิดปกติ\',', 'Alarm pengemudi yang tidak normal', 0, 25861, '2022-03-08 06:44:12', '2025-04-01 15:58:03');
INSERT INTO `system_alarm_platform` VALUES (199, 25862, '双手同时脱离方向盘', 'alarm_safety', 'DSM', 200, '双手同时脱离方向盘', 'Both hands off the steering wheel at the same time', 'มือทั้งสองออกจากพวงมาลัยในเวลาเดียวกัน\',', 'Kedua tangan tidak memegang kemudi pada saat yang bersamaan', 0, 25862, '2022-03-08 06:44:23', '2025-04-01 15:58:04');
INSERT INTO `system_alarm_platform` VALUES (200, 25863, 'DSM监测功能失效', 'alarm_safety', 'DSM', 200, 'DSM监测功能失效', 'DSM monitoring function fails', 'ฟังก์ชันการตรวจสอบ DSM ล้มเหลว\',', 'Fungsi pemantauan DSM gagal', 0, 25863, '2022-03-08 06:44:34', '2025-04-01 15:58:06');
INSERT INTO `system_alarm_platform` VALUES (201, 25872, '自动抓拍事件', 'alarm_safety', 'DSM', 200, '自动抓拍事件', 'Automatic snapshot event', 'เหตุการณ์ภาพรวมอัตโนมัติ\',', 'Peristiwa potret otomatis', 0, 25872, '2022-03-08 06:44:42', '2025-04-01 15:58:14');
INSERT INTO `system_alarm_platform` VALUES (202, 25873, '驾驶员变更事件', 'alarm_safety', 'DSM', 200, '驾驶员变更事件', 'Driver change event', 'เหตุการณ์การเปลี่ยนแปลงผู้ขับ\'', 'Peristiwa pergantian pengemudi', 0, 25873, '2022-03-08 06:44:54', '2025-04-01 15:58:15');
INSERT INTO `system_alarm_platform` VALUES (203, 59392, '超速行驶', 'alarm_safety', 'FW', 200, '超速行驶', 'Overspeed', 'ขับรถเร็ว', 'Kecepatan berlebih', 0, 59392, '2023-03-10 08:11:58', '2025-04-01 15:58:22');
INSERT INTO `system_alarm_platform` VALUES (204, 59408, '急加速', 'alarm_safety', 'FW', 200, '急加速', 'Rapid acceleration', 'เร่งความเร็วอย่างรวดเร็ว', 'Akselerasi cepat', 0, 59408, '2023-03-10 08:12:54', '2025-04-01 15:58:23');
INSERT INTO `system_alarm_platform` VALUES (212, 59409, '急减速', 'alarm_safety', 'FW', 200, '急减速', 'Rapid deceleration', 'ลดความเร็วอย่างรวดเร็ว', 'Deselerasi cepat', 0, 59409, '2023-03-10 08:13:35', '2025-04-01 15:58:24');
INSERT INTO `system_alarm_platform` VALUES (213, 59415, '急转弯', 'alarm_safety', 'FW', 200, '急转弯', 'Take a sudden turn', 'เลี้ยวกะทันหัน', 'Mengambil belokan mendadak', 0, 59415, '2023-03-10 08:14:11', '2025-04-01 15:58:25');
INSERT INTO `system_alarm_platform` VALUES (214, 59416, '急变道', 'alarm_safety', 'FW', 200, '急变道', 'Abrupt lane change', 'เปลี่ยนเลนกะทันหัน', 'Perubahan jalur mendadak', 0, 59416, '2023-03-10 08:14:43', '2025-04-01 15:58:26');
INSERT INTO `system_alarm_platform` VALUES (216, 25864, '未系安全带', 'alarm_safety', 'DSM', 200, '未系安全带', 'Not wearing seatbelt', 'ไม่คาดเข็มขัดนิรภัย', 'Tidak mengenakan sabuk pengaman', 0, 25864, '2023-12-07 02:34:04', '2025-04-01 15:58:07');
INSERT INTO `system_alarm_platform` VALUES (217, 25870, '夜间禁行', 'alarm_safety', 'DSM', 200, '夜间禁行', 'No night driving', 'จำกัด การขับขี่ในเวลากลางคืน', 'Tidak boleh mengemudi di malam hari', 0, 25870, '2023-12-07 02:38:06', '2025-04-01 15:58:12');
INSERT INTO `system_alarm_platform` VALUES (218, 25871, '超时驾驶', 'alarm_safety', 'DSM', 200, '超时驾驶', 'Driving over time', 'ขับรถไปตามเวลา', 'Mengemudi melebihi waktu', 0, 25871, '2023-12-07 02:39:36', '2025-04-01 15:58:13');
INSERT INTO `system_alarm_platform` VALUES (219, 25874, '驾驶员身份异常', 'alarm_safety', 'DSM', 200, '驾驶员身份异常', 'Abnormal driver identity', 'การแสดงตัวของคนขับผิดปกติ', 'Identitas pengemudi yang tidak normal', 0, 25874, '2023-12-07 02:40:54', '2025-04-01 15:58:16');
INSERT INTO `system_alarm_platform` VALUES (220, 26369, '后方接近报警', 'alarm_safety', 'BSD', 200, '后方接近报警', 'Rear approach alarm', 'สัญญาณเตือนด้านหลัง', 'Alarm pendekatan belakang', 0, 26369, '2023-12-07 02:43:12', '2025-04-01 15:58:19');
INSERT INTO `system_alarm_platform` VALUES (221, 26370, '左侧后方接近报警', 'alarm_safety', 'BSD', 200, '左侧后方接近报警', 'Left rear approach alarm', 'สัญญาณเตือนการเข้าใกล้ด้านหลังซ้าย', 'Alarm pendekatan belakang kiri', 0, 26370, '2023-12-07 02:44:09', '2025-04-01 15:58:20');
INSERT INTO `system_alarm_platform` VALUES (433, 26371, '右侧后方接近报警', 'alarm_safety', 'BSD', 200, '右侧后方接近报警', 'Right rear approach alarm', 'สัญญาณเตือนการเข้าใกล้ด้านหลังขวา', 'Alarm pendekatan belakang kanan', 0, 26371, '2023-12-07 02:45:02', '2025-04-01 15:58:21');
INSERT INTO `system_alarm_platform` VALUES (434, 1000001, '禁止停车(平台)', 'alarm_normal', 'platform', 40, '禁止停车(平台)', 'No Parking (Platform)', 'ที่จอดรถต้องห้าม (แพลตฟอร์ม)', 'Dilarang Parkir (Platform)', 0, 1000001, '2024-04-17 06:47:01', '2025-04-01 16:00:15');
INSERT INTO `system_alarm_platform` VALUES (435, 1000002, '禁止行驶(平台)', 'alarm_normal', 'platform', 40, '禁止行驶(平台)', 'No Driving (Platform)', 'ห้ามเดินทาง (แพลตฟอร์ม)', 'Dilarang Mengemudi (Platform)', 0, 1000002, '2024-04-17 06:47:01', '2025-04-01 16:00:16');
INSERT INTO `system_alarm_platform` VALUES (436, 1000003, '禁止夜间行驶(平台)', 'alarm_normal', 'platform', 40, '禁止夜间行驶(平台)', 'No nighttime driving (platform)', 'ห้ามเดินทางในเวลากลางคืน (แพลตฟอร์ม)', 'Dilarang Mengemudi di Malam Hari (Platform)', 0, 1000003, '2024-04-17 06:47:01', '2025-04-01 16:00:17');
INSERT INTO `system_alarm_platform` VALUES (437, 1000004, '疲劳驾驶(平台)', 'alarm_normal', 'platform', 40, '疲劳驾驶(平台)', 'Fatigue driving (platform)', 'การขับขี่เมื่อยล้า (แพลตฟอร์ม)', 'Mengemudi karena Kelelahan (Platform)', 0, 1000004, '2024-04-17 06:47:01', '2025-04-01 16:00:18');
INSERT INTO `system_alarm_platform` VALUES (438, 1000005, '区域车辆拥堵(平台)', 'alarm_normal', 'platform', 40, '区域车辆拥堵(平台)', 'Regional vehicle congestion (platform)', 'ความแออัดของยานพาหนะในภูมิภาค (แพลตฟอร์ม)', 'Kemacetan Kendaraan Regional (Platform)', 0, 1000005, '2024-04-17 06:47:01', '2025-04-01 16:00:19');
INSERT INTO `system_alarm_platform` VALUES (439, 25888, '驾驶员闭眼报警', 'alarm_safety', 'DSM', 200, '驾驶员闭眼报警', 'Driver closed eyes alarm', 'สัญญาณเตือนเมื่อคนขับหลับตา', 'Alarm mata tertutup pengemudi', 0, 25888, '2024-07-16 01:54:19', '2025-04-01 15:58:17');

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `conf_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `conf_value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_encrypted` smallint NOT NULL DEFAULT 0 COMMENT '0未加密  1加密',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sytem_key`(`conf_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES (1, 'backup.email.to', '517178887@qq.com|297860245@qq.com|330811792@qq.com', 0, '打包备份数据库文件要发往的邮件账号', 0, '2022-10-14 17:38:27', '2025-04-07 07:19:58');
INSERT INTO `system_config` VALUES (2, 'backup.project.name', 'ds.tgtrack&tripsdd服务器', 0, 'ds.tgtrack&tripsdd服务器', 0, '2025-04-07 07:20:52', '2025-04-07 07:22:50');
INSERT INTO `system_config` VALUES (3, 'minio.url', 'https://www.tripsdd.com', 0, 'APP文件全路径需要补全, 这个不需要/minio结尾, 一些人脸数据需要http协议', 0, '2025-04-07 07:26:14', '2025-04-07 07:48:20');

-- ----------------------------
-- Table structure for system_database
-- ----------------------------
DROP TABLE IF EXISTS `system_database`;
CREATE TABLE `system_database`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '定时清理',
  `database_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '库名',
  `table_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表名',
  `data_rows` bigint NOT NULL DEFAULT 0 COMMENT '数据行',
  `data_length` bigint NOT NULL DEFAULT 0 COMMENT '数据长度(bit)',
  `index_length` bigint NOT NULL DEFAULT 0 COMMENT '索引长度',
  `is_backup` smallint NOT NULL DEFAULT 0 COMMENT '是否备份',
  `auto_backup_interval_days` smallint NOT NULL DEFAULT 3 COMMENT '备份间隔',
  `auto_backup_last_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '被执行时间',
  `last_backup_max_id` bigint NOT NULL DEFAULT 0 COMMENT '最近备份的最大记录ID',
  `is_clean` smallint NOT NULL DEFAULT 0 COMMENT '是否已经定期清理，启用和keep_data_days配合使用',
  `auto_clean_keep_days` int UNSIGNED NOT NULL DEFAULT 30 COMMENT '保留多少天数据, 只针对日志和循环覆盖数据，最小三天',
  `tactics` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数据库管理策略，json对象',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `created_unix` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_unix` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ix_table_name`(`database_name` ASC, `table_name` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1412 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时清理/备份表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `system_dictionary`;
CREATE TABLE `system_dictionary`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '产品主表',
  `dictionary_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dictionary_value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dictionary_value_zh` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英文',
  `dictionary_value_en` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英文',
  `dictionary_value_th` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '泰语',
  `dictionary_value_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '印尼',
  `dictionary_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型分类',
  `dictionary_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `tag_color` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_id` int NULL DEFAULT 0 COMMENT '排序',
  `num_use` int NOT NULL DEFAULT 0 COMMENT '累计使用次数',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_value`(`dictionary_value` ASC, `dictionary_type` ASC) USING BTREE,
  UNIQUE INDEX `uk_key`(`dictionary_key` ASC, `dictionary_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据字典' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_dictionary
-- ----------------------------
INSERT INTO `system_dictionary` VALUES (1, '1', '乘用车', '乘用车', 'Passenger car', 'รถโดยสาร', 'Mobil penumpang', 'Vehicle-Type', '乘用车涵盖了轿车、微型客车以及不超过9座的轻型客车', '#0096c7', 1, 0, '2022-05-09 03:10:26', '2025-04-01 15:58:24');
INSERT INTO `system_dictionary` VALUES (2, '2', '商用车', '商用车', 'commercial vehicle', 'รถเพื่อการพาณิชย์', 'kendaraan komersial', 'Vehicle-Type', '主要用于商业运输的车辆，包括货车、客车、工程车等。', '#ff5c93', 0, 0, '2022-05-09 03:10:26', '2025-04-01 15:58:24');
INSERT INTO `system_dictionary` VALUES (3, '3', '非道路用车', '非道路用车', 'off-road vehicles', 'ยานพาหนะออฟโรด', 'kendaraan off-road', 'Vehicle-Type', '越野车、工程机械和农用拖拉机是相对于道路车辆的另一种很重要的形式', NULL, 0, 0, '2022-05-09 03:10:28', '2025-04-01 15:58:25');
INSERT INTO `system_dictionary` VALUES (4, '4', '其他', '其他', 'other', 'อื่น', 'lainnya', 'Vehicle-Type', NULL, NULL, 0, 0, '2022-05-09 03:10:28', '2025-04-01 15:58:25');
INSERT INTO `system_dictionary` VALUES (34, '34', '车辆离线', '车辆离线', 'vehicle offline', 'รถออฟไลน์', 'kendaraan offline', 'Fault-Type', NULL, NULL, 0, 11, '2022-05-09 03:27:18', '2025-04-01 15:58:25');
INSERT INTO `system_dictionary` VALUES (35, '35', '无法定位', '无法定位', 'Unable to locate', 'หาไม่เจอ', 'Tidak dapat menemukan lokasi', 'Fault-Type', NULL, NULL, 0, 7, '2022-05-09 03:27:18', '2025-04-01 15:58:25');
INSERT INTO `system_dictionary` VALUES (36, '36', '行车速度问题', '行车速度问题', 'driving speed problem', 'ปัญหาความเร็วในการขับขี่', 'masalah kecepatan berkendara', 'Fault-Type', NULL, NULL, 0, 1, '2022-05-09 03:27:18', '2025-04-01 15:58:25');
INSERT INTO `system_dictionary` VALUES (37, '37', '报警故障', '报警故障', 'Alarm failure', 'สัญญาณเตือนล้มเหลว', 'Alarm gagal', 'Fault-Type', NULL, NULL, 0, 4, '2022-05-09 03:27:18', '2025-04-01 15:58:26');
INSERT INTO `system_dictionary` VALUES (38, '38', '定位数据问题', '定位数据问题', 'location data problem', 'ปัญหาข้อมูลตำแหน่ง', 'masalah data lokasi', 'Fault-Type', NULL, NULL, 0, 1, '2022-05-09 03:27:18', '2025-04-01 15:58:26');
INSERT INTO `system_dictionary` VALUES (39, '39', '视频数据问题', '视频数据问题', 'video data problem', 'ปัญหาข้อมูลวิดีโอ', 'masalah data video', 'Fault-Type', NULL, NULL, 0, 1, '2022-05-09 03:27:18', '2025-04-01 15:58:26');
INSERT INTO `system_dictionary` VALUES (40, '40', '行驶中ACC关闭', '行驶中ACC关闭', 'ACC is turned off while driving', 'ACC ถูกปิดในขณะขับรถ', 'ACC mati saat berkendara', 'Fault-Type', NULL, NULL, 0, 2, '2022-05-09 03:27:18', '2025-04-01 15:58:26');
INSERT INTO `system_dictionary` VALUES (41, '41', '对讲不正常', '对讲不正常', 'Intercom is abnormal', 'อินเตอร์คอมผิดปกติ', 'Interkom tidak normal', 'Fault-Type', NULL, NULL, 0, 0, '2022-05-09 03:27:18', '2025-04-01 15:58:26');
INSERT INTO `system_dictionary` VALUES (42, '42', '摄像头故障', '摄像头故障', 'camera failure', 'กล้องเสีย', 'kegagalan kamera', 'Fault-Type', NULL, NULL, 0, 0, '2022-05-09 03:27:18', '2025-04-01 15:58:26');
INSERT INTO `system_dictionary` VALUES (43, '43', '主动安全故障', '主动安全故障', 'Active safety failure', 'ความล้มเหลวด้านความปลอดภัยที่ใช้งาน', 'Kegagalan keselamatan aktif', 'Fault-Type', NULL, NULL, 0, 0, '2022-05-09 03:27:18', '2025-04-01 15:58:27');
INSERT INTO `system_dictionary` VALUES (44, '44', '储存设备故障', '储存设备故障', 'storage device failure', 'อุปกรณ์จัดเก็บข้อมูลล้มเหลว', 'kegagalan perangkat penyimpanan', 'Fault-Type', NULL, NULL, 0, 0, '2022-05-09 03:27:18', '2025-04-01 15:58:27');
INSERT INTO `system_dictionary` VALUES (45, '45', '执法仪检测不正常', '执法仪检测不正常', 'Law enforcement instrument detection is not normal', 'การตรวจจับเครื่องมือบังคับใช้กฎหมายไม่ปกติ', 'Deteksi instrumen penegakan hukum tidak normal', 'Fault-Type', NULL, NULL, 0, 0, '2022-05-09 03:27:18', '2025-04-01 15:58:27');
INSERT INTO `system_dictionary` VALUES (47, '47', '轨迹完整率低', '轨迹完整率低', 'Low track integrity', 'ความสมบูรณ์ของแทร็กต่ำ', 'Integritas lintasan rendah', 'Fault-Type', NULL, NULL, 0, 0, '2022-05-09 03:27:18', '2025-04-01 15:58:27');
INSERT INTO `system_dictionary` VALUES (48, '48', '漂移', '漂移', 'drift', 'ล่องลอย', 'drift', 'Fault-Type', NULL, NULL, 0, 0, '2022-05-09 03:27:18', '2025-04-01 15:58:27');
INSERT INTO `system_dictionary` VALUES (49, '49', '不读司机卡', '不读司机卡', 'Does not read driver card', 'ไม่อ่านการ์ดไดรเวอร์', 'Tidak membaca kartu pengemudi', 'Fault-Type', NULL, NULL, 0, 0, '2022-05-09 03:27:18', '2025-04-01 15:58:27');

-- ----------------------------
-- Table structure for system_doc
-- ----------------------------
DROP TABLE IF EXISTS `system_doc`;
CREATE TABLE `system_doc`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '系统文档',
  `doc_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文档路径',
  `doc_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文档标题',
  `doc_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '正文 Markdown 源代码',
  `doc_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT ' 状态 [0 - 草稿, 1 - 发布]',
  `repo_url` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分组URL',
  `likes_count` int NOT NULL DEFAULT 0 COMMENT '赞数量',
  `comments_count` int NOT NULL DEFAULT 0 COMMENT '评论数量',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建用户ID',
  `last_editor` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后修改人',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `order_id` int NOT NULL DEFAULT 100 COMMENT '排序字段',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_url`(`doc_url` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '知识库文档' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_doc
-- ----------------------------

-- ----------------------------
-- Table structure for system_domain
-- ----------------------------
DROP TABLE IF EXISTS `system_domain`;
CREATE TABLE `system_domain`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '系统文档',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '域名',
  `port` int NOT NULL DEFAULT 443 COMMENT '端口',
  `advance_days` int NOT NULL DEFAULT 15 COMMENT '提前多少天通知',
  `notification_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通知邮件地址JSON数组',
  `valid_from` datetime NULL DEFAULT NULL COMMENT '有效期开始',
  `valid_until` datetime NULL DEFAULT NULL COMMENT '有效期结束',
  `last_notification_time` datetime NULL DEFAULT NULL COMMENT '最后通知时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `lang` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'zh-CN' COMMENT '模板多言',
  `time_zone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'zh-CN' COMMENT '时区',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_domain`(`domain` ASC, `port` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '知识库文档' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_domain
-- ----------------------------

-- ----------------------------
-- Table structure for system_image_template
-- ----------------------------
DROP TABLE IF EXISTS `system_image_template`;
CREATE TABLE `system_image_template`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '照片模板要求DEMO，自增长ID',
  `template_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板要求编码,枚举',
  `template_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板的名字',
  `template_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板的URL',
  `template_name_en` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板名称-英文',
  `template_name_th` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板名称-泰语',
  `template_name_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板名称-印尼',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_template`(`template_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 174 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图片推送模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_image_template
-- ----------------------------

-- ----------------------------
-- Table structure for system_mq
-- ----------------------------
DROP TABLE IF EXISTS `system_mq`;
CREATE TABLE `system_mq`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'MQ消息表',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息内容',
  `state` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态：0-发送中，1-成功，2-失败',
  `exchange` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交换机',
  `route_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由key',
  `try_count` smallint UNSIGNED NULL DEFAULT NULL COMMENT '重试次数',
  `try_time` timestamp NULL DEFAULT NULL COMMENT '	重试时间',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `last_position_id` bigint NOT NULL DEFAULT 0 COMMENT '最后一个坐标包的ID',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'MQ消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_mq
-- ----------------------------

-- ----------------------------
-- Table structure for system_msg_template
-- ----------------------------
DROP TABLE IF EXISTS `system_msg_template`;
CREATE TABLE `system_msg_template`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户关注的组织或者个人工程师，自增长ID',
  `template_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板ID, 可映射orderAction枚举',
  `template_type` smallint NOT NULL DEFAULT 0 COMMENT '模板类型 0通用类型 10短信 20邮件 30极光推送',
  `template_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板名称-极光推送主标题',
  `template_name_en` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板名称-极光推送主标题',
  `template_name_th` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板名称-极光推送主标题',
  `template_name_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板名称-极光推送主标题',
  `template_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板内容-极光推送副标题',
  `template_content_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板内容-极光推送副标题',
  `template_content_th` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板内容-极光推送副标题',
  `template_content_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板内容-极光推送副标题',
  `sign_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '常用于第三方短信签名',
  `third_party_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方key，常用于短信第三方模板key',
  `third_template_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方提供商, 腾讯短信，极光推送等',
  `third_party_provider` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方提供商, 腾讯短信，极光推送等',
  `template_group` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'order' COMMENT '通知组别 用户或者工单等',
  `template_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述，发起人-动作-被通知人',
  `is_deleted` bigint NOT NULL DEFAULT 0 COMMENT '删除位',
  `order_id` int NOT NULL DEFAULT 0 COMMENT '排序字段',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_template`(`template_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息推送模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_msg_template
-- ----------------------------

-- ----------------------------
-- Table structure for system_nationality
-- ----------------------------
DROP TABLE IF EXISTS `system_nationality`;
CREATE TABLE `system_nationality`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nation_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家代码',
  `nation_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家名称-中文',
  `nation_name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家名称-英文',
  `nation_name_th` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家名称-泰文',
  `created_unix` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_unix` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_nation_code`(`nation_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 241 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '国家地区管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_nationality
-- ----------------------------

-- ----------------------------
-- Table structure for system_notification
-- ----------------------------
DROP TABLE IF EXISTS `system_notification`;
CREATE TABLE `system_notification`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '全部消息',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接收者',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业',
  `notify_group` smallint NOT NULL DEFAULT 0 COMMENT '消息类型  0=默认，1=消息，2=通知, 3=待办',
  `notify_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'apply_join_group申请加入组织|',
  `subject_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '主题分类',
  `subject_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联主题ID',
  `subject_object` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联主题ID',
  `actor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关人员ID',
  `actor_object` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关人员ID',
  `readed_time` datetime NULL DEFAULT NULL COMMENT '阅读时间',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除位',
  `updated_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_notification`(`user_id` ASC, `organize_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台消息推送' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_notification
-- ----------------------------

-- ----------------------------
-- Table structure for system_open_platform
-- ----------------------------
DROP TABLE IF EXISTS `system_open_platform`;
CREATE TABLE `system_open_platform`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '开放平台开发者账号',
  `organize_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '企业ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织全名',
  `app_key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '开发ID',
  `app_secret` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '开发秘钥',
  `api_version` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'API版本号',
  `white_list` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'API请求白名单, | 分割',
  `minute_request_frequency` int NULL DEFAULT 60 COMMENT '每分钟允许请求次数',
  `third_organize_code` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '第三方组织ID，方便回调',
  `remark` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者(发单者)',
  `creator_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者(发单者)',
  `last_ip` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '最后IP',
  `last_time` datetime NULL DEFAULT NULL COMMENT '最后时间',
  `created_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `updated_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_service`(`organize_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '开放平台开发者账号' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_open_platform
-- ----------------------------

-- ----------------------------
-- Table structure for system_repo
-- ----------------------------
DROP TABLE IF EXISTS `system_repo`;
CREATE TABLE `system_repo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `repo_url` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `repo_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `repo_group` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'doc' COMMENT '知识库类型 help帮助文档 doc学习文档',
  `num_doc` int NOT NULL DEFAULT 0 COMMENT '共多少篇文档',
  `order_id` int NOT NULL DEFAULT 0 COMMENT '排序字段',
  `is_public` smallint NOT NULL DEFAULT 1 COMMENT '内部协议指引文档, 固定URL, 列表不可见',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '删除标记',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sytem_repo_UN`(`repo_url` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '知识库目录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_repo
-- ----------------------------

-- ----------------------------
-- Table structure for system_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `system_schema_history`;
CREATE TABLE `system_schema_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_schema_history_s_idx`(`success` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_schema_history
-- ----------------------------

-- ----------------------------
-- Table structure for system_shedlock
-- ----------------------------
DROP TABLE IF EXISTS `system_shedlock`;
CREATE TABLE `system_shedlock`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '定时器分布式锁',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `lock_until` timestamp(3) NULL DEFAULT NULL,
  `locked_at` timestamp(3) NULL DEFAULT NULL,
  `locked_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `created_unix` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `updated_unix` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15082 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时器分布式锁' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_snippet
-- ----------------------------
DROP TABLE IF EXISTS `system_snippet`;
CREATE TABLE `system_snippet`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `snippet` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '消息模板',
  `tag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型过滤，比如文本指令和文本信息分开',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预留描述',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_service`(`organize_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '快照' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_snippet
-- ----------------------------

-- ----------------------------
-- Table structure for system_trouble_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `system_trouble_knowledge`;
CREATE TABLE `system_trouble_knowledge`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `trouble_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '故障码(P开头=动力系统，B开头=车身系统，C开头=底盘系统，U开头=网络通讯系统)',
  `vehicle_brand` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '汽车品牌，如：福特，水星，林肯',
  `definition_zh` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '中文定义',
  `definition_en` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '英文定义',
  `main_category` smallint NULL DEFAULT 0 COMMENT '主分类, 0=动力系统，1=车身系统，2=底盘系统，3=网络通讯系统',
  `category` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '范畴',
  `knowledge` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景知识',
  `created_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务器时间',
  `updated_unix` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_trouble_brand`(`trouble_code` ASC, `vehicle_brand` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_trouble_knowledge
-- ----------------------------

-- ----------------------------
-- Table structure for system_version_app
-- ----------------------------
DROP TABLE IF EXISTS `system_version_app`;
CREATE TABLE `system_version_app`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'APP包唯一ID',
  `app_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'tracker|bus|maintain--20240703废弃',
  `system_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '客户端 android、ios',
  `version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本号',
  `version_value` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '版本号',
  `lowest_version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '允许最低版本(低于这个要强制更新)',
  `update_type` tinyint NOT NULL DEFAULT 0 COMMENT '0：一般更新 1：强制更新',
  `download_files` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'APK文件URL对象，不同abi、不同url、不同hask',
  `store_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商店下载URL',
  `track` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区分测试版(beta),正式版(production)',
  `version_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新描述',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建账号',
  `creator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建账号',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_app`(`app_id` ASC, `system_type` ASC, `version_value` ASC, `track` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'App版本管理-iOS版本' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_version_app
-- ----------------------------

-- ----------------------------
-- Table structure for user_alarm_linkage
-- ----------------------------
DROP TABLE IF EXISTS `user_alarm_linkage`;
CREATE TABLE `user_alarm_linkage`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户关注的组织或者个人工程师，自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `alarm_class` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报警大类：实时报警、主动安全报警',
  `platform_alarm_id` int NULL DEFAULT 0 COMMENT '平台统一报警id',
  `alarm_linkage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报警联动选项JSON',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_alarm_linkage`(`organize_id` ASC, `platform_alarm_id` ASC, `user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户关注的组织或者个人工程师' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_alarm_linkage
-- ----------------------------

-- ----------------------------
-- Table structure for user_cmd
-- ----------------------------
DROP TABLE IF EXISTS `user_cmd`;
CREATE TABLE `user_cmd`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `cmd_protocol` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '协议组',
  `cmd_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '协议KEY',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_cmd`(`organize_id` ASC, `user_id` ASC, `cmd_protocol` ASC, `cmd_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 542 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户指令' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_cmd
-- ----------------------------

-- ----------------------------
-- Table structure for user_contact_address
-- ----------------------------
DROP TABLE IF EXISTS `user_contact_address`;
CREATE TABLE `user_contact_address`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地址唯一ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `contact_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业或者个人',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人手机号',
  `province` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '省份',
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '城市',
  `district` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区/县',
  `code_prov` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份代号',
  `code_city` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市代号',
  `code_coun` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '县城代号',
  `lng` decimal(11, 6) NOT NULL COMMENT '经度',
  `lat` decimal(11, 6) NOT NULL COMMENT '纬度',
  `place_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地图选点地名',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址',
  `is_default` smallint NOT NULL DEFAULT 0 COMMENT '是否默认地址',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_name`(`user_id` ASC, `contact_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户的联系地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_contact_address
-- ----------------------------

-- ----------------------------
-- Table structure for user_engineer
-- ----------------------------
DROP TABLE IF EXISTS `user_engineer`;
CREATE TABLE `user_engineer`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '认证过的工程师',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `full_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `contact_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `identity_card` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证',
  `identity_img` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证照片',
  `self_shot_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '个人半身照',
  `code_prov` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省代号',
  `code_city` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市代号',
  `code_coun` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区代号',
  `name_prov` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省名称',
  `name_city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称',
  `name_coun` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区代号',
  `contact_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '常住地址',
  `expertise_vehicle_types` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '擅长安装的车辆类型',
  `expertise_device_types` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '擅长安装的设备类型',
  `first_city_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拦截分析第一个地址的市区编号',
  `insurance_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '意外险照片',
  `physical_examination_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '体检证明',
  `license_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '从业资格证明',
  `emergency_contact_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话',
  `emergency_contact_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话号码',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其他描述',
  `personal_label` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标签',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '自动接单用的组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '自动接单用的组织全名',
  `is_automatic_order` smallint NOT NULL DEFAULT 0 COMMENT '自动接单中 0不接单 1自动接单',
  `core_address` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '核心中心地址',
  `supported_county` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '周边辅助接单区县',
  `last_update_unix` timestamp NULL DEFAULT NULL,
  `last_assign_unix` timestamp NULL DEFAULT NULL COMMENT '最后指派时间,用于倒叙',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `is_temporary` smallint NOT NULL DEFAULT 0 COMMENT '临时工程师,不需要提交认证',
  `is_deleted` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除位',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`user_id` ASC, `is_deleted` ASC) USING BTREE,
  UNIQUE INDEX `uk_card`(`identity_card` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 214 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工程师信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_engineer
-- ----------------------------

-- ----------------------------
-- Table structure for user_engineer_authentication
-- ----------------------------
DROP TABLE IF EXISTS `user_engineer_authentication`;
CREATE TABLE `user_engineer_authentication`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '工程师认证请求',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `full_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `contact_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话',
  `identity_card` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '身份证',
  `identity_img` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证照片',
  `self_shot_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '个人半身照',
  `contact_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '常住地址',
  `expertise_vehicle_types` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '擅长安装的设备类型',
  `expertise_device_types` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '擅长安装的设备类型',
  `insurance_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '意外险照片',
  `physical_examination_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '体检证明',
  `license_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '从业资格证明',
  `emergency_contact_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话',
  `emergency_contact_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话号码',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `core_address` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '核心中心地址',
  `supported_county` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '周边辅助接单区县',
  `check_status` int NOT NULL DEFAULT 0 COMMENT '审核状态  1通过 2拒绝',
  `check_describe` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '审核状态',
  `check_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核账号ID',
  `check_account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核账号',
  `is_deleted` bigint NOT NULL DEFAULT 0 COMMENT '删除位',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`user_id` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工程师认证' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_engineer_authentication
-- ----------------------------

-- ----------------------------
-- Table structure for user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `user_favorite`;
CREATE TABLE `user_favorite`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户收藏或者自定义分组',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `user_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建用户',
  `favorite_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆编号',
  `favorite_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组名字',
  `favorite_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT 'vehicle 收藏车辆  vehicle_group自定义车辆分组 alarm收藏报警 alarm_group自定义报警分组 safety收藏主动安全 safety_group自定义主动安全',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_user_vehicle`(`organize_id` ASC, `user_id` ASC, `favorite_id` ASC) USING BTREE,
  INDEX `idx_favorite`(`organize_id` ASC, `favorite_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12417 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户收藏记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '@' COMMENT '昵称',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号名',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `custom_avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `location` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在地区',
  `locale` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '常用的语言代码与国家地区对照表',
  `time_zone` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '+08:00' COMMENT '设备台账时区',
  `website` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主页',
  `account_modified` int NOT NULL DEFAULT 0 COMMENT '初始账号被修改过次数',
  `is_prohibit_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '禁止登录',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '管理员权限 1平台管理员 100系统管理员',
  `is_engineer` tinyint(1) NOT NULL DEFAULT 0 COMMENT '认证工程师',
  `full_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '真实姓名,来源工程师提交资料',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_login_unix` timestamp NULL DEFAULT NULL COMMENT '最后登陆时间',
  `user_config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户一些自定义配置文件',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '到期时间',
  `password_change_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次修改密码时间',
  `password_expire_days` int NULL DEFAULT 0 COMMENT '定期修改密码天数 0不需要',
  `create_origin` int NULL DEFAULT NULL COMMENT '创建方式',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户ID',
  `is_deleted` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除位',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id`(`user_id` ASC, `is_deleted` ASC) USING BTREE,
  UNIQUE INDEX `uk_account`(`account` ASC, `is_deleted` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15866 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'dca0f9e348384d23958e151bb4adb98f', '系统管理员', 'sysadmin', '{bcrypt-md5}$2a$10$dsfVEzh5NlfrgkcLFbrPLOuSsm5zJMJJwYqlQfTSWs3qKzwhQx5Ku', '', NULL, NULL, '+08:00', NULL, 0, 0, 100, 0, '', '系统账号', '2025-04-29 09:27:50', NULL, NULL, '2025-04-29 03:46:24', 0, NULL, '', 0, '2025-04-29 03:46:24', '2025-04-29 09:28:57');
INSERT INTO `user_info` VALUES (2, '25d19d8c917747ea', '组织管理员', 'tgadmin', '{bcrypt-md5}$2a$10$x7PPR5QH/2yooQmv4szk5O4.l1AujbzMbosaO4SaYL9UxXTsOKKey', '', NULL, NULL, '+08:00', NULL, 0, 0, 1, 0, '', NULL, '2025-04-30 08:04:22', NULL, NULL, '2025-04-30 07:35:32', 0, 110, '', 0, '2025-04-30 07:35:32', '2025-04-30 08:22:00');
-- ----------------------------
-- Table structure for user_issue
-- ----------------------------
DROP TABLE IF EXISTS `user_issue`;
CREATE TABLE `user_issue`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户收藏的组织或者个人工程师，自增长ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `issue_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '问题描述',
  `issue_imgs` varchar(516) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '问题图片最多4张',
  `contact_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `handle_status` smallint NOT NULL DEFAULT 0 COMMENT '处理状态 0未处理 1忽略 2已处理',
  `handle_account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理账号',
  `handle_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_user_organize`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户意见反馈' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_issue
-- ----------------------------

-- ----------------------------
-- Table structure for user_line_config
-- ----------------------------
DROP TABLE IF EXISTS `user_line_config`;
CREATE TABLE `user_line_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `line_token` varchar(43) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'linenotify发送消息的token',
  `token_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token的名称，用来标识区分用途等',
  `target_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'linenotify接收方种类：USER个人或GROUP群组',
  `target` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'linenotify接收方的名称: 个人昵称或群组名称',
  `is_active` int NOT NULL DEFAULT 0 COMMENT '有效标识 0 无效 1 有效',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_line_config_user_id_IDX`(`user_id` ASC, `line_token` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户LINE平台Token配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_line_config
-- ----------------------------

-- ----------------------------
-- Table structure for user_notification
-- ----------------------------
DROP TABLE IF EXISTS `user_notification`;
CREATE TABLE `user_notification`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `notification_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通知key',
  `notification_value` int NOT NULL DEFAULT 0 COMMENT '通知方式 bit1=消息 bit2=邮件 bit3=短信',
  `notification_app` int NOT NULL DEFAULT 0 COMMENT 'APP通知 0不通知 1通知',
  `notification_web` int NOT NULL DEFAULT 0 COMMENT 'WEB通知 0不通知 1通知',
  `notification_email` int NOT NULL DEFAULT 0 COMMENT 'EMAIL通知 0不通知 1通知',
  `notification_sms` int NOT NULL DEFAULT 0 COMMENT '短信通知 0不通知 1通知',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user`(`user_id` ASC, `notification_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 307 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '我的通知设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_notification
-- ----------------------------

-- ----------------------------
-- Table structure for user_organize
-- ----------------------------
DROP TABLE IF EXISTS `user_organize`;
CREATE TABLE `user_organize`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `nick_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织内名称',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织全名',
  `is_owner` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户是否本组织拥有者 0成员 1管理者',
  `member_role` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'member' COMMENT '成员身份  member默认成员 owner管理员 service客服 engineer工程师 read只读成员',
  `member_role_value` int NOT NULL DEFAULT 1 COMMENT '成员身份值, 方便排序',
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '自定义角色ID',
  `permission_actions` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限组_废弃, 采用角色的方式',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '到期时间',
  `tree_model` smallint NOT NULL DEFAULT 0 COMMENT '0默认企业-车队-车辆树 1企业-车辆树 2企业-车辆上级车队-车辆树',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_organize`(`user_id` ASC, `organize_id` ASC) USING BTREE,
  INDEX `idx_organize_id`(`organize_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18804 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户加入组织表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_organize
-- ----------------------------

-- ----------------------------
-- Table structure for user_organize_apply
-- ----------------------------
DROP TABLE IF EXISTS `user_organize_apply`;
CREATE TABLE `user_organize_apply`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `apply_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '申请表ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '申请用户ID',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '申请人名称',
  `custom_avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `phone_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请人手机号',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '申请加入组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '申请加入组织全名',
  `member_role` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'member' COMMENT '成员身份  member默认成员 owner管理员 service客服 engineer工程师 read只读成员',
  `inviter_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请人ID',
  `inviter_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请人名称',
  `apply_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请加入原因',
  `apply_status` smallint NOT NULL DEFAULT 0 COMMENT '申请单状态 = 0等待  1同意 2拒绝',
  `reject_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_user_organize`(`organize_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户加入组织申请表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_organize_apply
-- ----------------------------

-- ----------------------------
-- Table structure for user_organize_invite
-- ----------------------------
DROP TABLE IF EXISTS `user_organize_invite`;
CREATE TABLE `user_organize_invite`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `invite_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邀请表ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织ID',
  `organize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织全名',
  `custom_avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邀请企业LOGO',
  `member_role` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'member' COMMENT '成员身份  member默认成员 owner管理员 service客服 engineer工程师 read只读成员',
  `invite_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '被邀请者用户ID',
  `nick_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `invite_user_choose` smallint NOT NULL DEFAULT 0 COMMENT '被邀请者 = 0等待  1同意 2拒绝',
  `permission_actions` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限组',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建用户ID',
  `creator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建用户ID',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_user_organize`(`invite_user_id` ASC, `organize_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织邀请用户加入表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_organize_invite
-- ----------------------------

-- ----------------------------
-- Table structure for user_subscribe_config
-- ----------------------------
DROP TABLE IF EXISTS `user_subscribe_config`;
CREATE TABLE `user_subscribe_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `channel_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订阅的频道：平台到期PLATFORM_EXPIRATION 保养到期MAINTAIN_EXPIRATION',
  `notify_pipe` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订阅通知渠道： EMAIL、PLATFORM、LINE',
  `notify_config` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通知渠道可选配置json对象，方便扩展',
  `is_enabled` int NOT NULL DEFAULT 0 COMMENT '启用标识 0 禁用 1 启用',
  `lang` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'zh-CN' COMMENT '模板多言',
  `time_zone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'zh-CN' COMMENT '时区',
  `server_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器名称',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_subscribe_config_un`(`organize_id` ASC, `user_id` ASC, `channel_key` ASC, `notify_pipe` ASC) USING BTREE,
  INDEX `user_subscribe_config_organize_id_IDX`(`organize_id` ASC, `channel_key` ASC) USING BTREE,
  INDEX `user_subscribe_config_channel_key_IDX`(`channel_key` ASC, `notify_pipe` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户订阅配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_subscribe_config
-- ----------------------------

-- ----------------------------
-- Table structure for user_third_login
-- ----------------------------
DROP TABLE IF EXISTS `user_third_login`;
CREATE TABLE `user_third_login`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `third_unique_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方唯一用户id，可以是手机号，邮箱，可以是微信的openid，可以是QQ的openid，抑或苹果id',
  `third_nick_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方平台名称',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `third_party_type` int NOT NULL DEFAULT 0 COMMENT '第三方登录类型 0账号密码 10手机短信 20邮箱 30微信 40line',
  `bind_flag` smallint NOT NULL DEFAULT 0 COMMENT '0默认 1绑定 2解绑',
  `last_login_in_unix` timestamp NULL DEFAULT NULL COMMENT '最后登陆时间',
  `is_deleted` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除位',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_unique_acount`(`third_unique_account` ASC, `is_deleted` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 364 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方登录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_third_login
-- ----------------------------

-- ----------------------------
-- Table structure for user_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `user_vehicle`;
CREATE TABLE `user_vehicle`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户收藏的组织或者个人工程师，自增长ID',
  `organize_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `vehicle_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆编号',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '工程师安装之后, 给一个临时有效时长',
  `creator_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建用户',
  `created_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `updated_unix` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_vehicle`(`organize_id` ASC, `user_id` ASC, `vehicle_id` ASC) USING BTREE,
  INDEX `user_vehicle_organize_id_IDX`(`organize_id` ASC, `vehicle_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 678111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业车辆管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_vehicle
-- ----------------------------

-- ----------------------------
-- View structure for view_device_gateway
-- ----------------------------
DROP VIEW IF EXISTS `view_device_gateway`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_device_gateway` AS select `organize_device`.`id` AS `id`,`organize_device`.`device_imei` AS `imei`,`device_product`.`protocol` AS `protocol`,`device_product`.`fix_zone` AS `fix_zone`,`organize_device`.`time_zone` AS `time_zone`,`organize_device`.`character_set` AS `character_set`,`organize_device`.`fuel_sensor` AS `fuel_sensor`,`organize_vehicle`.`organize_id` AS `organize_id`,`organize_vehicle`.`lpn` AS `lpn`,`organize_vehicle`.`fuel_config` AS `fuel_config`,`organize_vehicle`.`temp_config` AS `temp_config`,`organize_device`.`is_prohibit_login` AS `is_prohibit_login` from ((`organize_device` left join `organize_vehicle` on(((`organize_device`.`organize_id` = `organize_vehicle`.`organize_id`) and (`organize_device`.`vehicle_id` = `organize_vehicle`.`vehicle_id`)))) left join `device_product` on((`organize_device`.`product_id` = `device_product`.`product_id`))) where (`organize_device`.`is_prohibit_login` = 0);

-- ----------------------------
-- View structure for view_device_vehicle
-- ----------------------------
DROP VIEW IF EXISTS `view_device_vehicle`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_device_vehicle` AS select `organize_device`.`id` AS `id`,`organize_device`.`created_unix` AS `created_unix`,`organize_device`.`updated_unix` AS `updated_unix`,`organize_device`.`organize_id` AS `organize_id`,`organize_device`.`organize_name` AS `organize_name`,`organize_device`.`device_imei` AS `imei`,`organize_device`.`time_zone` AS `time_zone`,`organize_device`.`character_set` AS `character_set`,`organize_device`.`channel` AS `channel`,`organize_device`.`last_gps_time` AS `last_gps_time`,`organize_vehicle`.`id` AS `id_vehicle`,`organize_vehicle`.`vehicle_id` AS `vehicle_id`,`organize_vehicle`.`vehicle_name` AS `vehicle_name`,`organize_vehicle`.`lpn` AS `lpn`,`organize_vehicle`.`fleet_id` AS `fleet_id`,`organize_vehicle`.`fleet_name` AS `fleet_name`,`organize_vehicle`.`vehicle_type` AS `vehicle_type`,`organize_vehicle`.`vehicle_model` AS `vehicle_model`,`organize_vehicle`.`expire_time` AS `expire_time`,`organize_vehicle`.`approved_number` AS `approved_number`,`organize_vehicle`.`icon` AS `icon`,`organize_vehicle`.`fuel_config` AS `fuel_config`,`organize_vehicle`.`io_config` AS `io_config`,`organize_vehicle`.`temp_config` AS `temp_config`,`organize_device`.`fuel_sensor` AS `fuel_sensor`,`organize_device`.`product_id` AS `product_id`,`device_product`.`product_name` AS `product_name`,`device_product`.`alarm_mapping` AS `alarm_mapping`,`organize_vehicle`.`auto_create_fence` AS `auto_create_fence` from ((`organize_device` join `organize_vehicle` on(((`organize_device`.`organize_id` = `organize_vehicle`.`organize_id`) and (`organize_device`.`vehicle_id` = `organize_vehicle`.`vehicle_id`)))) left join `device_product` on((`organize_device`.`product_id` = `device_product`.`product_id`)));

-- ----------------------------
-- View structure for view_organize_engineer
-- ----------------------------
DROP VIEW IF EXISTS `view_organize_engineer`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_organize_engineer` AS select `user_engineer`.`id` AS `id`,`user_organize`.`organize_id` AS `organize_id`,`user_organize`.`organize_name` AS `organize_name`,`user_engineer`.`user_id` AS `user_id`,`user_engineer`.`full_name` AS `full_name`,`user_organize`.`nick_name` AS `nick_name`,`user_info`.`custom_avatar` AS `custom_avatar`,`user_engineer`.`self_shot_img` AS `self_shot_img`,`user_engineer`.`contact_phone` AS `contact_phone`,`user_engineer`.`expertise_device_types` AS `expertise_device_types`,`user_engineer`.`expertise_vehicle_types` AS `expertise_vehicle_types`,`user_engineer`.`personal_label` AS `personal_label`,`user_engineer`.`code_prov` AS `code_prov`,`user_engineer`.`code_city` AS `code_city`,`user_engineer`.`code_coun` AS `code_coun`,`user_engineer`.`name_prov` AS `name_prov`,`user_engineer`.`name_city` AS `name_city`,`user_engineer`.`name_coun` AS `name_coun`,`user_engineer`.`contact_address` AS `contact_address` from ((`user_engineer` join `user_organize`) join `user_info`) where ((`user_engineer`.`user_id` = `user_organize`.`user_id`) and (`user_organize`.`member_role` = 'engineer') and (`user_engineer`.`user_id` = `user_info`.`user_id`) and (`user_info`.`is_deleted` = 0));

-- ----------------------------
-- View structure for view_organize_member
-- ----------------------------
DROP VIEW IF EXISTS `view_organize_member`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_organize_member` AS select `user_organize`.`id` AS `id`,`user_organize`.`organize_id` AS `organize_id`,`user_info`.`user_id` AS `user_id`,`user_info`.`user_name` AS `user_name`,`user_organize`.`nick_name` AS `nick_name`,`user_organize`.`permission_actions` AS `permission_actions`,`user_info`.`account` AS `account`,`user_info`.`custom_avatar` AS `custom_avatar`,`user_info`.`full_name` AS `full_name`,`user_organize`.`member_role` AS `member_role`,`user_organize`.`role_id` AS `role_id`,`user_info`.`is_engineer` AS `is_engineer`,`user_info`.`is_admin` AS `is_admin` from (`user_organize` join `user_info`) where ((`user_info`.`user_id` = `user_organize`.`user_id`) and (`user_info`.`is_deleted` = 0)) order by `user_organize`.`member_role_value` desc;

-- ----------------------------
-- View structure for view_organize_user
-- ----------------------------
DROP VIEW IF EXISTS `view_organize_user`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_organize_user` AS select `view_organize_user`.`id` AS `id`,`view_organize_user`.`organize_id` AS `organize_id`,`view_organize_user`.`user_id` AS `user_id`,`view_organize_user`.`user_name` AS `user_name`,`view_organize_user`.`nick_name` AS `nick_name`,`view_organize_user`.`account` AS `account`,`view_organize_user`.`custom_avatar` AS `custom_avatar`,`view_organize_user`.`full_name` AS `full_name`,`view_organize_user`.`creator_id` AS `creator_id`,`view_organize_user`.`expire_time` AS `expire_time`,`view_organize_user`.`member_role` AS `member_role`,`view_organize_user`.`member_role_value` AS `member_role_value`,`view_organize_user`.`role_id` AS `role_id`,`view_organize_user`.`tree_model` AS `tree_model`,`view_organize_user`.`choose` AS `choose` from (select `user_organize`.`id` AS `id`,`user_organize`.`organize_id` AS `organize_id`,`user_info`.`user_id` AS `user_id`,`user_info`.`user_name` AS `user_name`,`user_organize`.`nick_name` AS `nick_name`,`user_info`.`account` AS `account`,`user_info`.`custom_avatar` AS `custom_avatar`,`user_info`.`full_name` AS `full_name`,`user_info`.`creator_id` AS `creator_id`,`user_organize`.`expire_time` AS `expire_time`,`user_organize`.`member_role` AS `member_role`,`user_organize`.`member_role_value` AS `member_role_value`,`user_organize`.`role_id` AS `role_id`,`user_organize`.`tree_model` AS `tree_model`,1 AS `choose` from (`user_organize` join `user_info`) where ((`user_info`.`user_id` = `user_organize`.`user_id`) and (`user_info`.`is_deleted` = 0)) union all select -(`user_organize_invite`.`id`) AS `id`,`user_organize_invite`.`organize_id` AS `organize_id`,`user_organize_invite`.`invite_user_id` AS `user_id`,`user_info`.`user_name` AS `user_name`,`user_info`.`user_name` AS `nick_name`,`user_info`.`account` AS `account`,`user_info`.`custom_avatar` AS `custom_avatar`,`user_info`.`full_name` AS `full_name`,`user_info`.`creator_id` AS `creator_id`,NULL AS `expire_time`,`user_organize_invite`.`member_role` AS `member_role`,0 AS `member_role_value`,0 AS `tree_model`,'' AS `role_id`,`user_organize_invite`.`invite_user_choose` AS `choose` from (`user_organize_invite` join `user_info`) where ((`user_organize_invite`.`invite_user_choose` = 0) and (`user_info`.`user_id` = `user_organize_invite`.`invite_user_id`) and (`user_info`.`is_deleted` = 0))) `view_organize_user` order by `view_organize_user`.`member_role_value` desc;

-- ----------------------------
-- View structure for view_user_organize
-- ----------------------------
DROP VIEW IF EXISTS `view_user_organize`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_user_organize` AS select `user_organize`.`id` AS `id`,`user_organize`.`user_id` AS `user_id`,`user_organize`.`role_id` AS `role_id`,`organize_role`.`role_name` AS `role_name`,`user_organize`.`expire_time` AS `expire_time`,`organize_info`.`organize_id` AS `organize_id`,`organize_info`.`organize_name` AS `organize_name`,`organize_info`.`domain_name` AS `domain_name`,`organize_info`.`short_name` AS `short_name`,`organize_info`.`custom_avatar` AS `custom_avatar`,`user_organize`.`member_role` AS `member_role`,`user_organize`.`permission_actions` AS `permission_actions`,`organize_info`.`follow_organize_id` AS `follow_organize_id`,`organize_info`.`follow_organize_name` AS `follow_organize_name` from ((`user_organize` join `organize_info`) left join `organize_role` on(((`user_organize`.`organize_id` = `organize_role`.`organize_id`) and (`user_organize`.`role_id` = `organize_role`.`role_id`)))) where (`organize_info`.`organize_id` = `user_organize`.`organize_id`) order by `user_organize`.`id`;

-- ----------------------------
-- Procedure structure for CleanupBatchData
-- ----------------------------
DROP PROCEDURE IF EXISTS `CleanupBatchData`;
delimiter ;;
CREATE PROCEDURE `CleanupBatchData`(IN cutoff_time DATETIME)
BEGIN
    DECLARE job_execution_id_var BIGINT;
    
    -- 删除 BATCH_STEP_EXECUTION_CONTEXT 表中过期数据
    DELETE FROM BATCH_STEP_EXECUTION_CONTEXT
    WHERE STEP_EXECUTION_ID IN (
        SELECT STEP_EXECUTION_ID
        FROM BATCH_STEP_EXECUTION
        WHERE JOB_EXECUTION_ID IN (
            SELECT JOB_EXECUTION_ID
            FROM BATCH_JOB_EXECUTION
            WHERE CREATE_TIME < cutoff_time
        )
    );

    -- 删除 BATCH_STEP_EXECUTION 表中过期数据
    DELETE FROM BATCH_STEP_EXECUTION
    WHERE JOB_EXECUTION_ID IN (
        SELECT JOB_EXECUTION_ID
        FROM BATCH_JOB_EXECUTION
        WHERE CREATE_TIME < cutoff_time
    );

    -- 删除 BATCH_JOB_EXECUTION_CONTEXT 表中过期数据
    DELETE FROM BATCH_JOB_EXECUTION_CONTEXT
    WHERE JOB_EXECUTION_ID IN (
        SELECT JOB_EXECUTION_ID
        FROM BATCH_JOB_EXECUTION
        WHERE CREATE_TIME < cutoff_time
    );

    -- 删除 BATCH_JOB_EXECUTION_PARAMS 表中过期数据
    DELETE FROM BATCH_JOB_EXECUTION_PARAMS
    WHERE JOB_EXECUTION_ID IN (
        SELECT JOB_EXECUTION_ID
        FROM BATCH_JOB_EXECUTION
        WHERE CREATE_TIME < cutoff_time
    );

    -- 删除 BATCH_JOB_EXECUTION 表中过期数据
    DELETE FROM BATCH_JOB_EXECUTION
    WHERE CREATE_TIME < cutoff_time;

    -- 删除 BATCH_JOB_INSTANCE 表中未被使用的 JOB_INSTANCE_ID
    DELETE FROM BATCH_JOB_INSTANCE
    WHERE JOB_INSTANCE_ID NOT IN (
        SELECT JOB_INSTANCE_ID
        FROM BATCH_JOB_EXECUTION
    );

END
;;
delimiter ;

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
-- Event structure for event_create_parition
-- ----------------------------
DROP EVENT IF EXISTS `event_create_parition`;
delimiter ;;
CREATE EVENT `event_create_parition`
ON SCHEDULE
EVERY '1' WEEK STARTS '2023-07-01 20:00:00'
ON COMPLETION PRESERVE
DO BEGIN
	-- 定时创建分区表
	CALL create_partition_by_month('maintain', 'jtt808_position');
	CALL create_partition_by_month('maintain', 'jtt808_alarm');
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table device_category
-- ----------------------------
DROP TRIGGER IF EXISTS `trigger_device_category`;
delimiter ;;
CREATE TRIGGER `trigger_device_category` AFTER UPDATE ON `device_category` FOR EACH ROW begin
	if old.category_name != new.category_name then update maintain.organize_device a set a.category_name = new.category_name where a.category_id = new.category_id; end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table device_manufacturer
-- ----------------------------
DROP TRIGGER IF EXISTS `trigger_device_manufacturer`;
delimiter ;;
CREATE TRIGGER `trigger_device_manufacturer` AFTER UPDATE ON `device_manufacturer` FOR EACH ROW begin
	if old.manufacturer_name != new.manufacturer_name then
		update maintain.device_product
		set manufacturer_name = new.manufacturer_name
		where manufacturer_id = new.manufacturer_id;
	end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table device_product
-- ----------------------------
DROP TRIGGER IF EXISTS `trigger_device_product`;
delimiter ;;
CREATE TRIGGER `trigger_device_product` AFTER UPDATE ON `device_product` FOR EACH ROW begin
	if old.product_name != new.product_name then
		update maintain.organize_device
		set product_name = new.product_name
		where product_id = new.product_id;
	end if;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
