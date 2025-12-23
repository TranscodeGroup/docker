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

-- 创建cbus数据库
CREATE DATABASE IF NOT EXISTS cbus DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE cbus;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Records of basic_device_type
-- ----------------------------
INSERT INTO `basic_device_type` VALUES (1, 'DTY000113', 'TG-MDVR', 'Transcodegroup', '808&1078', 3568, 'files/img/devtype/4be52d46ecf84d79b10de8f7c3e2b230.jpg', 41, '支持国标808/1078设备，通用类型', 'k3u;k8vu;stu;zip;k8u', 2, 0, NULL, '2019-08-23 07:43:12', '2025-01-07 06:13:33');
INSERT INTO `basic_device_type` VALUES (2, 'DTY000117', 'TG-T8', 'Transcodegroup', '808-2011&808-2013&1078-2016&bus2016-sf', 3184, '', 31, '刷卡，报站，4CH视频', 'k8hu;k8vu;zip', 2, 1, NULL, '2019-08-23 07:43:12', '2025-01-16 03:25:27');
INSERT INTO `basic_device_type` VALUES (3, 'DTY000118', 'TG-T3', 'Transcodegroup', '808&1078&bus2016-sf&1078-2016&808-2011', 3088, '', 30, '刷卡，报站', 'k3u;stu;zip', 2, 0, NULL, '2019-08-23 07:43:12', '2025-09-19 10:03:48');
INSERT INTO `basic_device_type` VALUES (4, 'DTY000121', 'TG-SD', 'Transcodegroup', '808&1078', 3568, '', 100101, 'SD卡录像', 'MR9704C;CONFIG', 1, 0, NULL, '2019-08-23 07:43:12', '2023-07-18 08:07:45');
INSERT INTO `basic_device_type` VALUES (5, 'DTY000122', 'TG-HD', 'Transcodegroup', '808&1078&bus2015', 3568, '', 100201, '硬盘录像', 'MR9704C;CONFIG', 1, 0, NULL, '2019-08-23 07:43:12', '2023-07-18 08:07:48');
INSERT INTO `basic_device_type` VALUES (6, 'DTY000124', 'K3&MDVR', 'Transcodegroup', '808&1078&bus', 69104, '', 61, 'K3&MDVR配套使用', 'k3u;k8vu;stu;zip', 2, 1, NULL, '2020-12-17 07:25:54', '2023-07-18 08:07:32');
INSERT INTO `basic_device_type` VALUES (7, 'DTY000125', 'TG_BUS', 'STM', '808&1078&bus&stm', 2048, '', 71, '扩展协议，0x16,0x17,0x18是公交数据的设备,GPS站序错误忽略\n', 'sw;zip;k8u', 2, 0, NULL, '2020-12-24 11:36:04', '2025-01-07 06:13:39');
INSERT INTO `basic_device_type` VALUES (8, 'DTY000126', 'TG-K3', 'Transcodegroup', '808&1078&bus2016-sf', 3504, '', 72, '刷卡，报站，文本下发', 'k3u;stu;zip', 2, 0, NULL, '2021-01-25 05:41:52', '2025-09-19 09:44:55');
INSERT INTO `basic_device_type` VALUES (9, 'DTY000127', 'L12', 'L12', 'LTY', 68720, '', NULL, 'lty的设备升级', 'sw', 101, 0, NULL, '2021-06-02 07:23:52', '2024-04-24 03:20:05');
INSERT INTO `basic_device_type` VALUES (10, 'DTY000128', 'ITH-M525', 'Transcodegroup', 'safety-jiangsu-sbh&808-2011&1078-2016', 1535, '', 99, '支持国标808/1078设备，思博慧主动安全', 'xml;crc;stu;zip', 1, 0, NULL, '2019-08-23 07:43:12', '2023-01-10 10:41:33');
INSERT INTO `basic_device_type` VALUES (11, 'DTY010001', 'K3-TALK&MDVR', '三锋智能', '808-2013&1078-2016&bus2016-sf&safety-jiangsu', 69104, '', 100, 'K3+通力设备，K3对讲， 必须包含关键字 （K3-TALK）', 'k3u;k8vu;stu;zip', 2, 1, '{}', '2024-01-11 06:04:13', '2024-01-11 06:16:53');
INSERT INTO `basic_device_type` VALUES (12, 'DTY010002', 'L10', 'L10', 'lty', 68720, '', 100, NULL, NULL, 101, 0, '{}', '2024-04-24 03:19:45', '2024-04-24 03:19:54');

-- ----------------------------
-- Records of owner_role
-- ----------------------------
INSERT INTO `owner_role` VALUES (1, '100', 'RID000000', 'System', 100, NULL, 7, 1, 100, '100', 0, NULL, '2019-08-23 07:45:42', '2019-11-01 02:18:17');
INSERT INTO `owner_role` VALUES (2, '100', 'RID000001', 'Admin', 1, NULL, 7, 1, 1, '1', 0, NULL, '2019-08-23 07:45:42', '2019-11-01 02:17:57');
INSERT INTO `owner_role` VALUES (3, '100', 'RID000002', 'User', 0, NULL, 7, 1, 0, '0', 0, NULL, '2019-08-23 07:45:42', '2019-11-01 02:18:03');

-- ----------------------------
-- Records of owner_user
-- ----------------------------
INSERT INTO `owner_user` VALUES (1, '100', 'UID000001', '', 'sysadmin', '21218CCA77804D2BA1922C33E0151105', '平台管理员', 100, 'static/images/user-boy.png', '', '', '平台管理员', NULL, NULL, 0, '2025-05-13 06:44:32', 0, '2025-05-13 11:56:07', NULL, 3, NULL, NULL, '2019-08-23 07:49:08', '2025-05-13 11:56:07');
INSERT INTO `owner_user` VALUES (2, '100', 'UID000002', '', 'lin', '21218CCA77804D2BA1922C33E0151105', '林工', 100, 'static/images/user-boy.png', '', 'lin557@126.com', '系统测试', NULL, NULL, 0, '2025-05-13 06:44:32', 0, NULL, NULL, 3, NULL, NULL, '2019-08-23 07:49:08', '2021-06-29 01:57:21');
INSERT INTO `owner_user` VALUES (3, '100', 'UID000003', '', 'eason', '21218CCA77804D2BA1922C33E0151105', '聂工', 100, 'static/images/user-boy.png', '', '330811792@qq.com', '系统测试', NULL, NULL, 0, '2025-05-13 06:44:32', 0, NULL, NULL, 3, NULL, NULL, '2019-08-23 07:49:08', '2021-06-29 01:57:22');
INSERT INTO `owner_user` VALUES (4, '10001', 'UID010001', '', 'gongcheng@admin', '5E28E1C011ED5A673F708B6DD5634507', 'gongcheng@admin', 1, '/files/img/user/336e793aaf154bf1bd5d203e3788c385.png', NULL, NULL, 'auto create', NULL, NULL, 0, '2025-05-13 08:48:45', 0, '2025-05-13 11:56:28', NULL, 3, 0, NULL, '2025-05-13 08:48:44', '2025-05-13 11:56:28');
INSERT INTO `owner_user` VALUES (5, '10001', 'UID010002', '', 'gongcheng@tg', '8204A34D6CAA61C262DADE8CC9633C9E', 'gongcheng@tg', 1, '/files/img/user/0217e9561c6544178d2c2e3f377654c7.png', NULL, NULL, 'auto create', NULL, NULL, 0, '2025-05-13 08:48:45', 0, NULL, NULL, 3, 0, NULL, '2025-05-13 08:48:45', '2025-05-13 11:42:42');

-- ----------------------------
-- Records of owner_user_role
-- ----------------------------
INSERT INTO `owner_user_role` VALUES (2, '10001', 'UID010001', 'RID000001', 'UID010001', '2025-05-13 11:42:33', '2025-05-13 11:42:33');
INSERT INTO `owner_user_role` VALUES (3, '10001', 'UID010002', 'RID000001', 'UID010001', '2025-05-13 11:42:42', '2025-05-13 11:42:42');

-- ----------------------------
-- Records of schedule_request
-- ----------------------------
INSERT INTO `schedule_request` VALUES (1, '10001', '2025-05-13', '18270240064', 1, NULL, '2025-03-12 19:56:27', 0, 0, 0, 'ROU000001', '1路', 'CAR000001', '18270240064', NULL, NULL, NULL, 0, NULL, NULL, NULL, '2025-05-13 09:15:46', '2025-05-13 09:15:46');

-- ----------------------------
-- Records of system_av_srs
-- ----------------------------
INSERT INTO `system_av_srs` VALUES (8, '10001', 'live-36.212.31.166', 'gc', NULL, 'rtmp://36.212.31.166:9005/', 'rtmp://36.212.31.166:9005/', NULL, 'http://36.212.31.166:9085/mdvr,http://36.212.31.166:9086/mdvr,http://36.212.31.166:9087/mdvr,http://36.212.31.166:9088/mdvr,http://36.212.31.166:9089/mdvr', NULL, NULL, 1, NULL, 0, 100, '2025-05-13 09:25:16', '2025-05-13 11:46:32');

-- ----------------------------
-- Records of system_company
-- ----------------------------
INSERT INTO `system_company` VALUES (1, '100', '', 'CityBus', 'CityBus', NULL, NULL, '默认企业', NULL, 30, NULL, 1, NULL, NULL, NULL, '+08:00', 'zh', NULL, NULL, NULL, NULL, '07:00-09:00', '17:00-19:00', '', 0, NULL, '2019-08-14 12:01:15', '2021-06-29 02:00:41');
INSERT INTO `system_company` VALUES (2, '10001', '100', '恭城公交', '恭城公交', '/files/img/company/5e7a5dabf76e4fcdaa91d257d3cd12d4.png', NULL, '', 'gongcheng@admin', 20, 7, 1, NULL, 110.817484, 24.838551, '+08:00', 'zh', NULL, NULL, NULL, '{\"disable_auto_schedule\":false,\"multiple_search_limit\":60,\"alarm_safety_list\":[],\"gps_deviation_excluded\":false}', '07:00-09:00', '17:00-19:00', 'iheCxAgUe7psEqq/5VmVxw==', 0, 'UID000001', '2025-05-13 08:48:44', '2025-05-13 11:56:15');

-- ----------------------------
-- Records of system_module
-- ----------------------------
INSERT INTO `system_module` VALUES (1000, 'MOD001000', '', 'console', 'console', 'el-icon-monitor', '/console', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '控制台', NULL, 1000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:28:23');
INSERT INTO `system_module` VALUES (1001, 'MOD001001', 'MOD001000', 'smart_cloud_screen', 'SmartCloudScreen', 'el-icon-s-platform', 'smart-cloud-screen', 'views/real/exhibit', '', 1, NULL, 0, 0, '控制台/智慧云屏', NULL, 1001, '', 0, '2019-08-23 07:44:35', '2025-12-22 08:28:43');
INSERT INTO `system_module` VALUES (1002, 'MOD001002', 'MOD001000', 'safety_monitor', 'SafetyMonitor', 'el-icon-message-solid', 'safety-monitor', 'views/dashboard/alarm/index.vue', '', 1, NULL, 0, 0, '控制台/主动安全-监控', NULL, 1002, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:28:51');
INSERT INTO `system_module` VALUES (1003, 'MOD001003', 'MOD001000', 'real_vehicle', 'RealVehicle', 'al-icon-bus', 'dashboard-car', 'views/dashboard/car/index.vue', '', 1, NULL, 0, 1, '控制台/实时车辆', NULL, 1003, NULL, 0, '2021-01-18 02:21:55', '2025-12-22 09:01:59');
INSERT INTO `system_module` VALUES (10000, 'MOD010000', '', 'basic', '/basic', 'el-icon-menu', '/basic', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '基础数据', NULL, 10000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:29:29');
INSERT INTO `system_module` VALUES (11000, 'MOD011000', 'MOD010000', 'org', 'Org', 'al-icon-genderless', 'org', 'views/basic/org/index', 'noRedirect', 1, NULL, 0, 0, '基础数据/组织结构', NULL, 11000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:37:35');
INSERT INTO `system_module` VALUES (11010, 'MOD011010', 'MOD011000', 'company', 'Company', 'al-icon-genderless', 'company', 'views/basic/org/company', NULL, 15, '/api/data/company', 1, 0, '基础数据/组织结构/企业管理', NULL, 11010, '', 0, '2019-08-23 07:44:35', '2025-12-22 08:38:37');
INSERT INTO `system_module` VALUES (11020, 'MOD011020', 'MOD011000', 'fleet', 'Fleet', 'al-icon-genderless', 'fleet', 'views/basic/org/fleet', NULL, 63, '/api/data/fleet', 0, 0, '基础数据/组织结构/车队管理', NULL, 11020, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:39:09');
INSERT INTO `system_module` VALUES (12000, 'MOD012000', 'MOD010000', 'place', 'Place', 'al-icon-genderless', 'place', 'views/basic/place/index', 'noRedirect', 1, NULL, 0, 0, '基础数据/线路档案', NULL, 12000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:41:11');
INSERT INTO `system_module` VALUES (12010, 'MOD012010', 'MOD012000', 'busstop', 'Busstop', 'al-icon-genderless', 'busstop', 'views/basic/place/busstop', NULL, 63, NULL, 0, 0, '基础数据/线路档案/站台管理', NULL, 12010, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (12020, 'MOD012020', 'MOD012000', 'route', 'Route', 'al-icon-genderless', 'route', 'views/basic/place/route', NULL, 63, NULL, 0, 0, '基础数据/线路档案/线路信息', NULL, 12020, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (12030, 'MOD012030', 'MOD012000', 'station', 'RouteWay', 'al-icon-genderless', 'station', 'views/basic/place/station', NULL, 575, NULL, 0, 0, '基础数据/线路档案/线路站点', NULL, 12030, NULL, 0, '2019-11-05 13:49:05', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (12040, 'MOD012040', 'MOD012000', 'basic_region', 'BasicRegion', 'al-icon-genderless', 'basic-region', 'views/basic/place/basic-region', NULL, 63, NULL, 0, 0, '基础数据/线路档案/自定义区域(点,圆，矩形，多边形，路径点)', NULL, 12040, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (12050, 'MOD012050', 'MOD012000', 'region_rule', 'RegionRule', 'al-icon-genderless', 'region-rule', 'views/basic/place/region-rule', NULL, 15, NULL, 0, 0, '基础数据/线路档案/区域规则', NULL, 12050, NULL, 0, '2020-05-09 06:17:14', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (12060, 'MOD012060', 'MOD012000', 'route2', 'Route2', 'al-icon-genderless', 'route2', 'views/basic/place/route2', NULL, 47, NULL, 0, 1, '基础数据/线路档案/项目管理(嘟嘟巴士定制，和线路信息是同一份)', NULL, 12060, '', 0, '2023-02-04 07:40:02', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (13000, 'MOD013000', 'MOD010000', 'goods', 'Goods', 'al-icon-genderless', 'goods', 'views/basic/goods/index', 'noRedirect', 1, NULL, 0, 0, '基础数据/车辆信息', NULL, 13000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:41:42');
INSERT INTO `system_module` VALUES (13010, 'MOD013010', 'MOD013000', 'vehicle', 'Vehicle', 'al-icon-genderless', 'vehicle', 'views/basic/goods/vehicle', NULL, 63, NULL, 0, 0, '基础数据/车辆信息/车辆档案', NULL, 13010, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (13011, 'MOD013011', 'MOD013000', 'vehicle_manage', 'VehicleManage', 'al-icon-genderless', 'vehicle-manage', 'views/basic/goods/vehicle/VehicleManage.vue', NULL, 15, NULL, 0, 1, '基础数据/车辆信息/车辆管理(简易版本, 嘟嘟巴士定制)', NULL, 13011, NULL, 0, '2023-02-06 09:44:06', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (13012, 'MOD013012', 'MOD013000', 'basic_car_type', 'BasicCarType', 'al-icon-genderless', 'basic-car-type', 'views/basic/goods/basic-car-type', NULL, 15, NULL, 0, 0, '基础数据/车辆信息/车辆类型', NULL, 13012, '', 0, '2023-06-27 06:46:46', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (13013, 'MOD013013', 'MOD013000', 'car_renewal_examine', 'Renewal', 'al-icon-genderless', 'CarRenewalExamine', 'views/basic/goods/vehicle/CarRenewalExamine', NULL, 545, NULL, 1, 0, '基础数据/车辆信息/车辆续费审核', NULL, 13013, '', 0, '2021-12-02 10:15:56', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (13014, 'MOD013014', 'MOD013000', 'basic_car_insurance', 'BasicCarInsurance', 'al-icon-genderless', 'basic-car-insurance', 'views/basic/goods/basic-car-insurance', NULL, 15, NULL, 0, 0, '基础数据/车辆信息/车辆保险', NULL, 13014, '', 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (13015, 'MOD013015', 'MOD013000', 'basic_car_license', 'BasicCarLicense', 'al-icon-genderless', 'basic-car-license', 'views/basic/goods/basic-car-license', NULL, 15, NULL, 0, 0, '基础数据/车辆信息/车辆行驶证', NULL, 13015, '', 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (13016, 'MOD013016', 'MOD013000', 'basic_car_expire', 'BasicCarExpire', 'al-icon-genderless', 'basic-car-expire', 'views/basic/goods/basic-car-expire', NULL, 33, NULL, 0, 0, '基础数据/车辆信息/车辆过期提醒', NULL, 13016, '', 0, '2020-06-03 02:24:36', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (13020, 'MOD013020', 'MOD013000', 'device', 'Device', 'al-icon-genderless', 'device', 'views/basic/goods/device', NULL, 63, NULL, 0, 0, '基础数据/车辆信息/设备管理', NULL, 13020, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (13021, 'MOD013021', 'MOD013000', 'devtype', 'Devtype', 'al-icon-genderless', 'device-type', 'views/basic/goods/devtype', NULL, 63, '/api/data/devtype', 1, 0, '基础数据/车辆信息/设备类型', NULL, 13021, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (13030, 'MOD013030', 'MOD013000', 'sim', 'Sim', 'al-icon-genderless', 'sim', 'views/basic/goods/sim', NULL, 255, '/api/data/sim', 0, 0, '基础数据/车辆信息/SIM卡管理', NULL, 13030, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (13040, 'MOD013040', 'MOD013000', 'basic_safety_score', 'BasicSafetyScore', 'al-icon-genderless', 'basic-safety-score', 'views/basic/goods/basic-safety-score', NULL, 15, NULL, 0, 0, '基础数据/车辆信息/主动安全评分标准', NULL, 13040, '', 0, '2022-12-23 01:51:21', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (13041, 'MOD013041', 'MOD013000', 'basic_subscribe_topic', 'BasicSubscribeTopic', 'al-icon-genderless', 'basic-subscribe-topic', 'views/basic/goods/basic-subscribe-topic', NULL, 15, NULL, 0, 0, '基础数据/车辆信息/主动安全订阅规则', NULL, 13041, '', 0, '2023-03-06 07:07:59', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (13050, 'MOD013050', 'MOD013000', 'basic_illegal_score', 'BasicSIlegalScore', 'al-icon-genderless', 'basic-Illegae-score', 'views/basic/goods/basic-illegal-score', NULL, 15, NULL, 0, 0, '基础数据/车辆信息/违规扣分标准', NULL, 13050, NULL, 0, '2024-03-05 08:12:29', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (14000, 'MOD014000', 'MOD010000', 'person', 'Person', 'al-icon-genderless', 'person', 'views/basic/person/index', 'noRedirect', 1, NULL, 0, 0, '基础数据/人员信息', NULL, 14000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:42:17');
INSERT INTO `system_module` VALUES (14010, 'MOD014010', 'MOD014000', 'staff', 'Staff', 'al-icon-genderless', 'staff', 'views/basic/person/staff', NULL, 63, NULL, 0, 0, '基础数据/人员信息/员工管理', NULL, 14010, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:42:36');
INSERT INTO `system_module` VALUES (14011, 'MOD014011', 'MOD014000', 'staff', 'StaffLite', 'al-icon-genderless', 'staff-lite', 'views/basic/person/staff/StaffLite.vue', NULL, 63, NULL, 0, 1, '基础数据/人员信息/员工管理(简易版本, 嘟嘟巴士定制)', NULL, 14011, '', 0, '2023-02-04 08:29:23', '2025-12-22 08:42:39');
INSERT INTO `system_module` VALUES (14030, 'MOD014030', 'MOD014000', 'iccard', 'ICCard', 'al-icon-genderless', 'iccard', 'views/basic/person/iccard', NULL, 63, NULL, 0, 0, '基础数据/人员信息/卡号管理', NULL, 14030, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:42:45');
INSERT INTO `system_module` VALUES (14040, 'MOD014040', 'MOD014000', 'device_request', 'DeviceRequest', 'al-icon-genderless', 'device-request', 'views/basic/person/device-request', NULL, 47, NULL, 0, 0, '基础数据/人员信息/业务请求', NULL, 14040, NULL, 0, '2020-03-30 03:13:00', '2025-12-22 08:42:53');
INSERT INTO `system_module` VALUES (15000, 'MOD015000', 'MOD010000', 'display', 'Display', 'al-icon-genderless', 'display', 'views/basic/display/index', 'noRedirect', 1, NULL, 0, 0, '基础数据/电子站牌', NULL, 15000, '', 0, '2019-08-23 07:44:35', '2025-12-22 08:43:21');
INSERT INTO `system_module` VALUES (15010, 'MOD015010', 'MOD015000', 'basic_display', 'BasicDisplay', 'al-icon-genderless', 'basic-display', 'views/basic/display/basic-display', NULL, 63, NULL, 0, 0, '基础数据/电子站牌/电子站牌', NULL, 15010, NULL, 0, '2020-02-20 07:44:35', '2025-12-22 08:43:38');
INSERT INTO `system_module` VALUES (15011, 'MOD015011', 'MOD015000', 'basic_display_ad', 'BasicDisplayAd', 'al-icon-genderless', 'basic-display-ad', 'views/basic/display/basic-display-ad', NULL, 15, NULL, 0, 0, '基础数据/电子站牌/电子站牌(广告)', NULL, 15011, NULL, 0, '2020-02-20 07:44:35', '2025-12-22 08:43:44');
INSERT INTO `system_module` VALUES (15020, 'MOD015020', 'MOD015000', 'basic_ad_banner', 'BasicAdBanner', 'al-icon-genderless', 'basic-ad-banner', 'views/basic/display/basic-ad-banner', NULL, 527, NULL, 0, 0, '基础数据/电子站牌/公交广告', NULL, 15020, NULL, 0, '2021-01-04 07:51:40', '2025-12-22 08:43:49');
INSERT INTO `system_module` VALUES (15021, 'MOD015021', 'MOD015000', 'basic_announcement', 'BasicAnnouncement', 'al-icon-genderless', 'basic-announcement', 'views/basic/display/basic-announcement', NULL, 527, NULL, 0, 0, '基础数据/电子站牌/公告发布', NULL, 15021, NULL, 0, '2021-04-13 01:19:48', '2025-12-22 08:43:54');
INSERT INTO `system_module` VALUES (15022, 'MOD015022', 'MOD015000', 'basic_lost_found', 'BasicLostFound', 'al-icon-genderless', 'basic-lost-found', 'views/basic/display/basic-lost-found', NULL, 527, NULL, 0, 0, '基础数据/电子站牌/失物认领', NULL, 15022, NULL, 0, '2021-04-14 03:21:42', '2025-12-22 08:43:56');
INSERT INTO `system_module` VALUES (15030, 'MOD015030', 'MOD015000', 'basic_ad_passenger', 'BasicAdPassenger', 'al-icon-genderless', 'basic-ad-passenger', 'views/basic/display/basic-ad-passenger', NULL, 527, NULL, 0, 1, '基础数据/电子站牌/乘客信息模板', NULL, 15030, '', 0, '2021-12-27 08:52:08', '2025-12-22 08:43:59');
INSERT INTO `system_module` VALUES (15031, 'MOD015031', 'MOD015000', 'basic_ad_passenger_publish', 'BasicAdPassengerPublish', 'al-icon-genderless', 'basic-ad-passenger-publish', 'views/basic/display/basic-ad-passenger-publish', NULL, 527, NULL, 0, 1, '基础数据/电子站牌/乘客信息发布', NULL, 15031, '', 0, '2021-12-30 01:49:02', '2025-12-22 08:44:06');
INSERT INTO `system_module` VALUES (16000, 'MOD016000', 'MOD010000', 'firmware', 'Firmware', 'al-icon-genderless', 'firmware', 'views/basic/firmware/index', 'noRedirect', 1, NULL, 0, 0, '基础数据/版本管理', NULL, 16000, '', 0, '2019-08-23 07:44:35', '2025-12-22 08:44:31');
INSERT INTO `system_module` VALUES (16010, 'MOD016010', 'MOD016000', 'basic_firmware', 'BasicFirmware', 'al-icon-genderless', 'basic-firmware', 'views/basic/firmware/basic-firmware', '', 15, NULL, 0, 0, '基础数据/版本管理/固件列表', NULL, 16010, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (16020, 'MOD016020', 'MOD016000', 'basic_firmware_ota', 'BasicFirmwareOta', 'al-icon-genderless', 'basic-firmware-ota', 'views/basic/firmware/basic-firmware-ota', '', 15, NULL, 0, 0, '基础数据/版本管理/OTA任务', NULL, 16020, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (17000, 'MOD017000', 'MOD010000', 'basic_fault_repair', 'BasicFault', 'al-icon-genderless', 'basic-fault', 'views/basic/fault/index', 'noRedirect', 1023, NULL, 0, 0, '基础数据/故障报修(BMTA定制)', NULL, 17000, '', 0, '2020-07-02 06:35:51', '2025-12-22 08:44:50');
INSERT INTO `system_module` VALUES (17001, 'MOD017001', 'MOD017000', 'basic_fault_repair', 'BasicFaultRepair', 'al-icon-genderless', 'basic-fault-repair', 'views/basic/fault/basic-fault-repair', '', 63, NULL, 0, 0, '基础数据/故障报修/故障报修', NULL, 17001, NULL, 0, '2020-07-02 06:35:51', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (17002, 'MOD017002', 'MOD017000', 'basic_fault_description', 'BasicFaultDescription', 'al-icon-genderless', 'basic-fault-description', 'views/basic/fault/basic-fault-description', '', 15, NULL, 0, 0, '基础数据/故障报修/故障描述', NULL, 17002, NULL, 0, '2020-07-02 06:35:51', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (17003, 'MOD017003', 'MOD017000', 'basic_fault_part', 'BasicFaultPart', 'al-icon-genderless', 'basic-fault-part', 'views/basic/fault/basic-fault-part', '', 15, NULL, 0, 0, '基础数据/故障报修/故障部件', NULL, 17003, NULL, 0, '2020-07-02 06:35:51', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (17004, 'MOD017004', 'MOD017000', 'basic_fault_solution', 'BasicFaultSolution', 'al-icon-genderless', 'basic-fault-solution', 'views/basic/fault/basic-fault-solution', '', 15, NULL, 0, 0, '基础数据/故障报修/解决方案', NULL, 17004, NULL, 0, '2020-07-02 06:35:51', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (20000, 'MOD020000', '', 'plan', '/plan', 'al-icon-plan', '/plan', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '运营计划', NULL, 20000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:30:02');
INSERT INTO `system_module` VALUES (21000, 'MOD021000', 'MOD020000', 'scheme', 'SchemeMaster', 'al-icon-genderless', 'scheme', 'views/plan/scheme', NULL, 1023, NULL, 0, 0, '运营计划/运营方案', NULL, 21000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:56:20');
INSERT INTO `system_module` VALUES (22000, 'MOD022000', 'MOD020000', 'workplan', 'WorkPlan', 'al-icon-genderless', 'workplan', 'views/plan/workplan', NULL, 1023, NULL, 0, 0, '运营计划/线路排班', NULL, 22000, '', 0, '2019-08-23 07:44:35', '2025-12-22 08:56:22');
INSERT INTO `system_module` VALUES (22001, 'MOD022001', 'MOD020000', 'workPlanNew', 'WorkPlanNew', 'al-icon-genderless', 'workplan-new', 'views/plan/workplan-new', NULL, 1023, NULL, 1, 1, '运营计划/线路排班(新, 实际未启用)', NULL, 22001, '', 0, '2019-08-23 07:44:35', '2025-12-22 08:56:23');
INSERT INTO `system_module` VALUES (22002, 'MOD022002', 'MOD020000', 'autoworkplan', 'AutoWorkPlan', 'al-icon-genderless', 'autoworkplan', 'views/plan/scheme-group', NULL, 1, NULL, 1, 1, '运营计划/自动排班', NULL, 22002, NULL, 0, '2020-04-02 10:23:09', '2025-12-22 08:56:25');
INSERT INTO `system_module` VALUES (23001, 'MOD023001', 'MOD020000', 'vacation', 'Vacation', 'al-icon-genderless', 'vacation', 'views/plan/vacation', NULL, 47, NULL, 0, 0, '运营计划/请假管理', NULL, 23001, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:56:27');
INSERT INTO `system_module` VALUES (23002, 'MOD023002', 'MOD020000', 'maintain', 'Maintain', 'al-icon-genderless', 'maintain', 'views/plan/maintain', NULL, 47, NULL, 0, 0, '运营计划/车辆保养', NULL, 23002, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:56:29');
INSERT INTO `system_module` VALUES (23003, 'MOD023003', 'MOD020000', 'system_holidays', 'SystemHolidays', 'al-icon-genderless', 'system-holidays', 'views/plan/operation/system-holidays', '', 47, NULL, 0, 0, '运营计划/节假日', NULL, 23003, '', 0, '2021-10-09 01:50:17', '2025-12-22 08:56:30');
INSERT INTO `system_module` VALUES (23004, 'MOD023004', 'MOD020000', 'complaint', 'Complaint', 'al-icon-genderless', 'complaint', 'views/plan/complaint', '', 1, '', 0, 0, '运营计划/投诉管理', NULL, 23004, NULL, 0, '2025-12-22 06:42:08', '2025-12-22 08:56:34');
INSERT INTO `system_module` VALUES (24000, 'MOD024000', 'MOD020000', 'repair', 'Repair', 'al-icon-genderless', 'repair', 'views/plan/repair/index', NULL, 1, NULL, 0, 0, '运营计划/数据维护', NULL, 24000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:56:37');
INSERT INTO `system_module` VALUES (24001, 'MOD024001', 'MOD024000', 'repair_plan', 'RepairPlan', 'al-icon-genderless', 'repair-plan', 'views/plan/repair/plan', '', 1023, NULL, 0, 0, '运营计划/数据维护/行车计划维护', NULL, 24001, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:56:40');
INSERT INTO `system_module` VALUES (24002, 'MOD024002', 'MOD024000', 'repair_idle', 'RepairIdle', 'al-icon-genderless', 'repair-idle', 'views/plan/repair/idle', '', 1023, NULL, 0, 0, '运营计划/数据维护/非运营数据维护', NULL, 24002, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:56:42');
INSERT INTO `system_module` VALUES (24003, 'MOD024003', 'MOD024000', 'operation_income', 'OperationIncome', 'al-icon-genderless', 'operation-income', 'views/plan/operation/income', '', 1023, NULL, 0, 0, '运营计划/数据维护/票款营收', NULL, 24003, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:56:43');
INSERT INTO `system_module` VALUES (24004, 'MOD024004', 'MOD024000', 'operation_ic_card', 'OperationIcCard', 'al-icon-genderless', 'operation-ic-card', 'views/plan/operation/ic-card', '', 1023, NULL, 0, 0, '运营计划/数据维护/IC卡收入', NULL, 24004, NULL, 0, '2020-06-19 06:04:26', '2025-12-22 08:56:45');
INSERT INTO `system_module` VALUES (24005, 'MOD024005', 'MOD024000', 'operation_fuel', 'OperationFuel', 'al-icon-genderless', 'operation-fuel', 'views/plan/operation/operation-fuel', '', 1023, NULL, 0, 0, '运营计划/数据维护/能源管理', NULL, 24005, NULL, 0, '2020-06-19 09:32:30', '2025-12-22 08:56:47');
INSERT INTO `system_module` VALUES (24006, 'MOD024006', 'MOD024000', 'route_time_period', 'RouteTimePeriod', 'al-icon-genderless', 'route-time-period', 'views/plan/operation/route-time-period', '', 47, NULL, 0, 1, '运营计划/数据维护/时段金额(胜天定制)', NULL, 24006, '', 0, '2021-08-19 03:44:27', '2025-12-22 08:56:49');
INSERT INTO `system_module` VALUES (25000, 'MOD025000', 'MOD020000', 'ledger_check', 'LedgerCheck', 'al-icon-genderless', 'ledger-check', 'views/plan/check', NULL, 1, NULL, 0, 0, '运营计划/路单审核', NULL, 25000, '', 0, '2024-12-26 08:25:57', '2025-12-22 08:56:51');
INSERT INTO `system_module` VALUES (30000, 'MOD030000', '', 'real', '/real', 'el-icon-view', '/real', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '实时监控', NULL, 30000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:30:25');
INSERT INTO `system_module` VALUES (31000, 'MOD031000', 'MOD030000', 'dispatch', 'Dispatch', 'al-icon-genderless', 'dispatch', 'views/real/dispatch', NULL, 1023, NULL, 0, 0, '实时监控/线路调度', NULL, 31000, '', 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (32000, 'MOD032000', 'MOD030000', 'map', 'Map', 'al-icon-genderless', 'map', 'views/real/map', NULL, 1023, NULL, 0, 0, '实时监控/电子地图', NULL, 32000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (33000, 'MOD033000', 'MOD030000', 'emu', 'Emu', 'al-icon-genderless', 'emu', 'views/real/emu', NULL, 1023, NULL, 0, 0, '实时监控/直线地图', NULL, 33000, '', 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (34000, 'MOD034000', 'MOD030000', 'video', 'Video', 'al-icon-genderless', 'video', 'views/real/video', NULL, 1, NULL, 0, 0, '实时监控/视频直播', NULL, 34000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (35000, 'MOD035000', 'MOD030000', 'track', 'TrackMap', 'al-icon-genderless', 'track', 'views/real/track', NULL, 1, NULL, 0, 0, '实时监控/轨迹回放', NULL, 35000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (36000, 'MOD036000', 'MOD030000', 'record', 'Record', 'al-icon-genderless', 'record', 'views/real/record', NULL, 33, NULL, 0, 0, '实时监控/录像回放', NULL, 36000, '', 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (37000, 'MOD037000', 'MOD030000', 'navigation', 'Navigation', 'al-icon-genderless', 'navigation', 'views/real/navigation', NULL, 1, NULL, 0, 0, '实时监控/路线导航', NULL, 37000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (38000, 'MOD038000', 'MOD030000', 'board', 'Board', 'al-icon-genderless', 'board', 'views/real/board', NULL, 1, NULL, 1, 1, '实时监控/站牌监控(BMTA测试)', NULL, 38000, NULL, 0, '2020-07-10 09:52:29', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (39000, 'MOD039000', 'MOD030000', 'device_seat', 'DeviceSeat', 'al-icon-genderless', 'device-seat', 'views/real/device-seat', NULL, 1, NULL, 0, 1, '实时监控/车辆座位状态(阿尔泰定制)', NULL, 39000, '', 0, '2021-09-02 06:13:32', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40000, 'MOD040000', '', 'data', '/data', 'al-icon-excel', '/data', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '数据分析', NULL, 40000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:30:45');
INSERT INTO `system_module` VALUES (40100, 'MOD040100', 'MOD040000', 'by_company', 'ByCompany', 'al-icon-genderless', 'by-company', 'views/data/by-company/index', 'noRedirect', 1, NULL, 0, 0, '数据分析/企业汇总', NULL, 40100, NULL, 0, '2019-09-02 02:59:41', '2025-12-22 08:45:31');
INSERT INTO `system_module` VALUES (40110, 'MOD040110', 'MOD040100', 'company_daily', 'CompanyDaily', 'al-icon-genderless', 'company-daily', 'views/data/by-company/company-daily', NULL, 545, NULL, 0, 0, '数据分析/企业汇总/企业日报', NULL, 40110, NULL, 0, '2019-12-05 09:41:00', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40120, 'MOD040120', 'MOD040100', 'company_weekly', 'CompanyWeekly', 'al-icon-genderless', 'company-weekly', 'views/data/by-company/company-weekly', NULL, 49, NULL, 1, 1, '数据分析/企业汇总/企业周报', NULL, 40120, NULL, 0, '2019-12-05 09:32:32', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40130, 'MOD040130', 'MOD040100', 'company_monthly', 'CompanyMonthly', 'al-icon-genderless', 'company-monthly', 'views/data/by-company/company-monthly', NULL, 545, NULL, 0, 0, '数据分析/企业汇总/企业日报', NULL, 40130, NULL, 0, '2019-09-02 03:03:36', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40200, 'MOD040200', 'MOD040000', 'by_route', 'ByRoute', 'al-icon-genderless', 'by-route', 'views/data/by-route/index', 'noRedirect', 1, NULL, 0, 0, '数据分析/线路汇总', NULL, 40200, NULL, 0, '2019-09-02 03:03:05', '2025-12-22 08:45:49');
INSERT INTO `system_module` VALUES (40210, 'MOD040210', 'MOD040200', 'route_daily_detail', 'RouteDailyDetail', 'al-icon-genderless', 'route-daily-detail', 'views/data/by-route/route-daily-detail', NULL, 545, NULL, 0, 0, '数据分析/线路汇总/线路日报', NULL, 40210, NULL, 0, '2020-06-18 02:13:00', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40220, 'MOD040220', 'MOD040200', 'route_daily', 'RouteDaily', 'al-icon-genderless', 'route-daily', 'views/data/by-route/route-daily', NULL, 545, NULL, 0, 0, '数据分析/线路汇总/线路日趋势', NULL, 40220, NULL, 0, '2019-12-05 09:41:00', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40230, 'MOD040230', 'MOD040200', 'route_weekly', 'RouteWeekly', 'al-icon-genderless', 'route-weekly', 'views/data/by-route/route-weekly', NULL, 33, NULL, 1, 1, '数据分析/线路汇总/线路周报', NULL, 40230, NULL, 0, '2019-12-05 09:41:00', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40240, 'MOD040240', 'MOD040200', 'route_monthly_detail', 'RouteMonthlyDetail', 'al-icon-genderless', 'route-monthly-detail', 'views/data/by-route/route-monthly-detail', NULL, 545, NULL, 0, 0, '数据分析/线路汇总/线路月报', NULL, 40240, NULL, 0, '2020-06-24 08:23:09', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40250, 'MOD040250', 'MOD040200', 'route_monthly', 'RouteMonthly', 'al-icon-genderless', 'route-monthly', 'views/data/by-route/route-monthly', NULL, 545, NULL, 0, 0, '数据分析/线路汇总/线路月趋势', NULL, 40250, NULL, 0, '2019-12-05 09:41:00', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40300, 'MOD040300', 'MOD040000', 'by_vehicle', 'ByVehicle', 'al-icon-genderless', 'by-vehicle', 'views/data/by-vehicle/index', 'noRedirect', 1, NULL, 0, 0, '数据分析/单车汇总', NULL, 40300, NULL, 0, '2019-09-02 00:44:22', '2025-12-22 08:46:07');
INSERT INTO `system_module` VALUES (40310, 'MOD040310', 'MOD040300', 'by_daily_car', 'CarDaily', 'al-icon-genderless', 'car-daily', 'views/data/by-vehicle/car-daily', NULL, 33, NULL, 0, 0, '数据分析/单车汇总/单车日统计', NULL, 40310, NULL, 0, '2020-03-24 02:47:59', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40320, 'MOD040320', 'MOD040300', 'by_month_car', 'CarMonth', 'al-icon-genderless', 'car-month', 'views/data/by-vehicle/car-month', NULL, 33, NULL, 0, 0, '数据分析/单车汇总/单车月统计', NULL, 40320, NULL, 0, '2020-03-24 02:47:59', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40330, 'MOD040330', 'MOD040300', 'daily_mileage', 'DailyMileage', 'al-icon-genderless', 'daily-mileage', 'views/data/by-vehicle/daily-mileage', NULL, 545, NULL, 0, 0, '数据分析/单车汇总/单日里程', NULL, 40330, '', 0, '2020-03-24 02:47:59', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40340, 'MOD040340', 'MOD040300', 'month_mileage', 'MonthMileage', 'al-icon-genderless', 'month-mileage', 'views/data/by-vehicle/month-mileage', NULL, 33, NULL, 0, 0, '数据分析/单车汇总/车辆单月行驶总里程/月度里程', NULL, 40340, NULL, 0, '2020-03-31 09:37:24', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40350, 'MOD040350', 'MOD040300', 'car_trip_total', 'CarTripTotal', 'al-icon-genderless', 'car-trip-total', 'views/data/by-vehicle/car-trip-total', NULL, 545, NULL, 0, 1, '数据分析/单车汇总/车辆趟次等级统计(胜天定制)', NULL, 40350, '', 0, '2021-09-06 08:51:06', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40360, 'MOD040360', 'MOD040300', 'car_work_time_detail', 'CarWorkTimeDetail', 'al-icon-genderless', 'car-work-time-detail', 'views/data/by-vehicle/car-work-time-detail', NULL, 33, NULL, 0, 1, '数据分析/单车汇总/车辆工作时长明细表(胜天定制)', NULL, 40360, '', 0, '2022-03-25 03:14:59', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40400, 'MOD040400', 'MOD040000', 'by_staff', 'ByStaff', 'al-icon-genderless', 'by-staff', 'views/data/by-staff/index', 'noRedirect', 1, NULL, 0, 0, '数据分析/单人汇总', NULL, 40400, NULL, 0, '2019-09-02 00:44:22', '2025-12-22 08:46:28');
INSERT INTO `system_module` VALUES (40410, 'MOD040410', 'MOD040400', 'route_attendance', 'RouteAttendance', 'al-icon-genderless', 'route-attendance', 'views/data/by-route/route-attendance', NULL, 33, NULL, 0, 0, '数据分析/单人汇总/考勤日报', NULL, 40410, NULL, 0, '2020-04-07 07:17:07', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40420, 'MOD040420', 'MOD040400', 'detail_daily', 'DetailDaily', 'al-icon-genderless', 'detail-daily', 'views/data/by-detail/detail-daily', NULL, 33, NULL, 0, 0, '数据分析/单人汇总/运营日报', NULL, 40420, '', 0, '2020-05-25 03:03:24', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40430, 'MOD040430', 'MOD040400', 'detail_month', 'DetailMonth', 'al-icon-genderless', 'detail-month', 'views/data/by-detail/detail-daily/LedgerDailyDetailSummary', NULL, 33, NULL, 0, 0, '数据分析/单人汇总/运营月报', NULL, 40430, '', 0, '2020-05-25 03:06:29', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40440, 'MOD040440', 'MOD040400', 'employee_daily', 'EmployeeDaily', 'al-icon-genderless', 'employee-daily', 'views/data/by-staff/employee-daily', NULL, 33, NULL, 0, 0, '数据分析/单人汇总/单人日报', NULL, 40440, NULL, 0, '2020-04-15 01:03:56', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40450, 'MOD040450', 'MOD040400', 'employee_monthly', 'EmployeeMonthly', 'al-icon-genderless', 'employee-monthly', 'views/data/by-staff/employee-monthly', NULL, 33, NULL, 0, 0, '数据分析/单人汇总/单人月报', NULL, 40450, NULL, 0, '2020-04-15 02:52:52', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40460, 'MOD040460', 'MOD040400', 'driver_trip_level', 'DriverTripLevel', 'al-icon-genderless', 'driver-trip-level', 'views/data/by-staff/driver-trip-level', NULL, 545, NULL, 0, 1, '数据分析/单人汇总/司机趟次等级(胜天定制)', NULL, 40460, '', 0, '2021-08-20 02:08:01', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40470, 'MOD040470', 'MOD040400', 'driver_trip_total', 'DriverTripTotal', 'al-icon-genderless', 'driver-trip-total', 'views/data/by-staff/driver-trip-total', NULL, 545, NULL, 0, 1, '数据分析/单人汇总/司机趟次等级统计(胜天定制)', NULL, 40470, '', 0, '2021-08-24 03:38:28', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40500, 'MOD040500', 'MOD040000', 'analysis_passenger', 'AnalysisPassenger', 'al-icon-genderless', 'analysis-passenger', 'views/data/analysis-passenger', '', 33, '', 0, 0, '数据分析/客流分析', NULL, 40500, NULL, 0, '2021-01-18 02:21:55', '2025-12-22 08:46:53');
INSERT INTO `system_module` VALUES (40510, 'MOD040510', 'MOD040500', 'detail_passenger', 'DetailPassenger', 'al-icon-genderless', 'detail-passenger', 'views/data/by-detail/detail-passenger', NULL, 33, NULL, 0, 0, '数据分析/客流分析/线路客流', NULL, 40510, '', 0, '2019-12-05 09:41:00', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40520, 'MOD040520', 'MOD040500', 'passenger_top10', 'PassengerTopTen', 'al-icon-genderless', 'passenger-top-ten', 'views/data/analysis-passenger/passenger-top-ten', '', 33, '', 0, 0, '数据分析/客流分析/客流TOP10', NULL, 40520, '', 0, '2021-01-18 02:21:55', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40530, 'MOD040530', 'MOD040500', 'over_load', 'OverLoad', 'al-icon-genderless', 'over-load', 'views/data/analysis-passenger/over-load', '', 1, '', 0, 0, '数据分析/客流分析/超载统计', NULL, 40530, NULL, 0, '2021-01-18 02:21:55', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40600, 'MOD040600', 'MOD040000', 'by_detail', 'ByDetail', 'al-icon-genderless', 'by-detail', 'views/data/by-detail/index', 'noRedirect', 1, NULL, 0, 0, '数据分析/运营统计', NULL, 40600, NULL, 0, '2019-09-02 03:03:05', '2025-12-22 08:47:11');
INSERT INTO `system_module` VALUES (40601, 'MOD040601', 'MOD040600', 'detail_summary', 'DetailSummary', 'al-icon-genderless', 'detail-summary', 'views/data/by-detail/detail-summary', NULL, 33, NULL, 0, 0, '数据分析/运营统计/运营汇总', NULL, 40601, NULL, 0, '2019-12-05 09:41:00', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40602, 'MOD040602', 'MOD040600', 'detail_trip', 'DetailTrip', 'al-icon-genderless', 'detail-trip', 'views/data/by-detail/detail-trip', NULL, 33, NULL, 0, 0, '数据分析/运营统计/运营记录', NULL, 40602, '', 0, '2019-12-05 09:41:00', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40603, 'MOD040603', 'MOD040600', 'detail_idle', 'DetailIdle', 'al-icon-genderless', 'detail-idle', 'views/data/by-detail/detail-idle', NULL, 33, NULL, 0, 0, '数据分析/运营统计/非运营记录', NULL, 40603, NULL, 0, '2019-12-05 09:41:00', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40605, 'MOD040605', 'MOD040600', 'detail_attendance', 'DetailAttendance', 'al-icon-genderless', 'detail-attendance', 'views/data/by-detail/detail-attendance', '', 33, '', 0, 0, '数据分析/运营统计/考勤明细', NULL, 40605, NULL, 0, '2021-01-18 02:21:55', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40606, 'MOD040606', 'MOD040600', 'ledger_trip', 'LedgerTrip', 'al-icon-genderless', 'ledger-trip', 'views/data/by-detail/ledger-trip', NULL, 33, NULL, 0, 0, '数据分析/运营统计/行程统计', NULL, 40606, NULL, 0, '2019-12-05 09:41:00', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40607, 'MOD040607', 'MOD040600', 'acc_parking', 'AccParking', 'al-icon-genderless', 'acc-parking', 'views/data/by-detail/acc-parking', '', 1, NULL, 1, 0, '数据分析/运营统计/ACC停车', NULL, 40607, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40608, 'MOD040608', 'MOD040600', 'daily_dispatch', 'DailyDispatch', 'al-icon-genderless', 'daily-dispatch', 'views/data/by-detail/daily-dispatch', NULL, 33, NULL, 0, 0, '数据分析/运营统计/调度日统计', NULL, 40608, NULL, 0, '2020-03-17 08:46:50', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40609, 'MOD040609', 'MOD040600', 'monthly_safety_score', 'MonthlySafetyScore', 'al-icon-genderless', 'monthly-safety-score', 'views/data/by-vehicle/MonthlySafetyScore', NULL, 33, NULL, 0, 0, '数据分析/运营统计/月度安全评分', NULL, 40609, '', 0, '2022-12-16 10:25:45', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40610, 'MOD040610', 'MOD040600', 'over_speed_count', 'OverSpeedCount', 'al-icon-genderless', 'over-speed-count', 'views/data/by-detail/over-speed-count', NULL, 33, NULL, 0, 0, '数据分析/运营统计/超速统计', NULL, 40610, NULL, 0, '2024-02-29 02:12:00', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40611, 'MOD040611', 'MOD040600', 'over_speed_region', 'OverSpeedRegion', 'al-icon-genderless', 'over-speed-region', 'views/data/by-detail/over-speed-region', NULL, 33, NULL, 0, 0, '数据分析/运营统计/超速区域统计', NULL, 40611, NULL, 0, '2024-03-11 01:38:45', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40612, 'MOD040612', 'MOD040600', 'device_offline', 'DeviceOffline', 'al-icon-genderless', 'device-offline', 'views/data/by-detail/detail-offline', NULL, 33, NULL, 0, 0, '数据分析/运营统计/脱机设备', NULL, 40612, NULL, 0, '2021-05-19 01:03:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40613, 'MOD040613', 'MOD040600', 'ledger_illegal_count', 'LedgerIllegalCount', 'al-icon-genderless', 'ledger-illegal-count', 'views/data/by-detail/ledger-illegal-count', NULL, 33, NULL, 0, 0, '数据分析/运营统计/违规统计', NULL, 40613, NULL, 0, '2024-03-06 09:45:56', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40614, 'MOD040614', 'MOD040600', 'fatigue_driving', 'FatigueDriving', 'al-icon-genderless', 'service-illegal', 'views/data/by-detail/FatigueDriving', NULL, 33, NULL, 0, 0, '数据分析/运营统计/疲劳驾驶', NULL, 40614, NULL, 0, '2024-03-07 09:41:34', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40700, 'MOD040700', 'MOD040000', 'appraise', 'Appraise', 'al-icon-genderless', 'appraise', 'views/data/appraise/index', 'noRedirect', 1, NULL, 0, 0, '数据分析/运营服务', NULL, 40700, NULL, 0, '2019-09-02 00:49:31', '2025-12-22 08:47:38');
INSERT INTO `system_module` VALUES (40701, 'MOD040701', 'MOD040700', 'dispatch_on_time', 'DispatchOnTime', 'al-icon-genderless', 'dispatch-on-time', 'views/data/appraise/dispatch-on-time', NULL, 33, NULL, 0, 0, '数据分析/运营服务/行车准点', NULL, 40701, NULL, 0, '2019-09-02 02:53:38', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40702, 'MOD040702', 'MOD040700', 'dispatch_exception', 'DispatchException', 'al-icon-genderless', 'dispatch-exception', 'views/data/appraise/dispatch-exception', NULL, 33, NULL, 0, 0, '数据分析/运营服务/监控异常', NULL, 40702, NULL, 0, '2019-09-02 00:57:32', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40703, 'MOD040703', 'MOD040700', 'dispatch_over_speed', 'DispatchOverSpeed', 'al-icon-genderless', 'dispatch-over-speed', 'views/data/appraise/dispatch-over-speed', NULL, 33, NULL, 0, 0, '数据分析/运营服务/车辆超速', NULL, 40703, NULL, 0, '2019-09-02 01:00:58', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40710, 'MOD040710', 'MOD040700', 'apart', 'Apart', 'al-icon-genderless', 'apart', 'views/data/appraise/apart', NULL, 33, NULL, 0, 1, '数据分析/运营服务/行车大间隔', NULL, 40710, NULL, 0, '2019-09-02 01:03:04', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40711, 'MOD040711', 'MOD040700', 'await', 'Await', 'al-icon-genderless', 'await', 'views/data/appraise/await', NULL, 33, NULL, 0, 1, '数据分析/运营服务/长时间候车', NULL, 40711, NULL, 0, '2019-09-02 01:10:13', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40712, 'MOD040712', 'MOD040700', 'stop', 'Stop', 'al-icon-genderless', 'stop', 'views/data/appraise/stop', NULL, 33, NULL, 0, 1, '数据分析/运营服务/运营途中停车(可分析到抛锚或拥堵)', NULL, 40712, NULL, 0, '2019-09-02 01:14:18', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40800, 'MOD040800', 'MOD040000', 'upload', 'Upload', 'al-icon-genderless', 'upload', 'views/data/upload/index', 'noRedirect', 1, NULL, 0, 0, '数据分析/终端上报', NULL, 40800, NULL, 0, '2019-09-02 00:28:22', '2025-12-22 08:47:57');
INSERT INTO `system_module` VALUES (40801, 'MOD040801', 'MOD040800', 'gps', 'Position', 'al-icon-genderless', 'gps', 'views/data/upload/gps', NULL, 33, NULL, 0, 0, '数据分析/终端上报/终端GPS上报', NULL, 40801, '', 0, '2019-09-02 00:35:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40802, 'MOD040802', 'MOD040800', 'depart_arrive', 'DepartArrive', 'al-icon-genderless', 'depart-arrive', 'views/data/upload/depart-arrive', NULL, 33, NULL, 0, 0, '数据分析/终端上报/车辆进出车站', NULL, 40802, NULL, 0, '2019-09-02 00:36:20', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40803, 'MOD040803', 'MOD040800', 'overspeed', 'OverSpeed', 'al-icon-genderless', 'over-speed', 'views/data/upload/over-speed', NULL, 33, NULL, 0, 0, '数据分析/终端上报/车辆超速', NULL, 40803, NULL, 0, '2019-09-02 00:37:11', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40804, 'MOD040804', 'MOD040800', 'card', 'Card', 'al-icon-genderless', 'card', 'views/data/upload/card', NULL, 33, NULL, 0, 0, '数据分析/终端上报/司机刷卡', NULL, 40804, NULL, 0, '2019-09-02 00:37:42', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40805, 'MOD040805', 'MOD040800', 'alarm_details', 'AlarmDetails', 'al-icon-genderless', 'alarm-details', 'views/data/upload/alarm-details', NULL, 33, NULL, 0, 0, '数据分析/终端上报/报警明细', NULL, 40805, NULL, 0, '2019-12-11 01:49:40', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40806, 'MOD040806', 'MOD040800', 'device_snap', 'DeviceSnap', 'al-icon-genderless', 'device-snap', 'views/data/upload/device-snap', NULL, 33, NULL, 0, 0, '数据分析/终端上报/设备抓拍', NULL, 40806, NULL, 0, '2019-09-02 00:37:11', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40807, 'MOD040807', 'MOD040800', 'device_passenger', 'DevicePassenger', 'al-icon-genderless', 'device-passenger', 'views/data/upload/device-passenger', NULL, 33, NULL, 0, 0, '数据分析/终端上报/设备客流', NULL, 40807, '', 0, '2019-09-02 00:37:11', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40808, 'MOD040808', 'MOD040800', 'device_poi', 'DevicePoi', 'al-icon-genderless', 'device-poi', 'views/data/upload/device-poi', NULL, 33, NULL, 0, 0, '数据分析/终端上报/设备进出围栏', NULL, 40808, NULL, 0, '2019-09-02 00:37:11', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40809, 'MOD040809', 'MOD040800', 'device_alarm_safety', 'DeviceAlarmSafety', 'al-icon-genderless', 'device-alarm-safety', 'views/data/upload/device-alarm-safety', NULL, 33, NULL, 0, 0, '数据分析/终端上报/主动安全报警', NULL, 40809, NULL, 0, '2020-05-27 00:37:11', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40810, 'MOD040810', 'MOD040800', 'device_illegal', 'DeviceIllegal', 'al-icon-genderless', 'device-illegal', 'views/data/upload/device-illegal', NULL, 33, '/api/data/device-illegal', 0, 0, '数据分析/终端上报/违规违章', NULL, 40810, '', 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40811, 'MOD040811', 'MOD040800', 'device_region', 'DeviceRegion', 'al-icon-genderless', 'device-region', 'views/data/upload/device-region', NULL, 33, NULL, 0, 0, '数据分析/终端上报/进出区域', NULL, 40811, NULL, 0, '2021-05-19 01:03:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40900, 'MOD040900', 'MOD040000', 'logger', 'Logger', 'al-icon-genderless', 'logger', 'views/data/logger/index', 'noRedirect', 1, NULL, 0, 0, '数据分析/日志信息', NULL, 40900, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:48:23');
INSERT INTO `system_module` VALUES (40901, 'MOD040901', 'MOD040900', 'manual_command_log', 'ManualCommandLog', 'al-icon-genderless', 'manual-command', 'views/data/logger/manual-command-log', NULL, 33, NULL, 0, 0, '数据分析/日志信息/司机手动命令日志', NULL, 40901, NULL, 0, '2020-10-27 06:45:26', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40902, 'MOD040902', 'MOD040900', 'system', 'SysLog', 'al-icon-genderless', 'system', 'views/data/logger/system', NULL, 33, NULL, 0, 0, '数据分析/日志信息/系统日志', NULL, 40902, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40903, 'MOD040903', 'MOD040900', 'signin', 'SingIn', 'al-icon-genderless', 'signin', 'views/data/logger/signin', NULL, 33, NULL, 0, 0, '数据分析/日志信息/登录日志', NULL, 40903, NULL, 0, '2019-09-01 04:18:40', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40904, 'MOD040904', 'MOD040900', 'dsp_log', 'DspLog', 'al-icon-genderless', 'dsp-log', 'views/data/logger/dsp-log', NULL, 33, NULL, 0, 0, '数据分析/日志信息/调度后台日志', NULL, 40904, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40905, 'MOD040905', 'MOD040900', 'message_log', 'MessageLog', 'al-icon-genderless', 'message-log', 'views/data/logger/message-log', NULL, 33, NULL, 0, 0, '数据分析/日志信息/发送消息日志', NULL, 40905, NULL, 0, '2020-03-26 09:16:10', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (40906, 'MOD040906', 'MOD040900', 'event_log', 'EventLog', 'al-icon-genderless', 'event-log', 'views/data/logger/event-log', NULL, 33, NULL, 0, 0, '数据分析/日志信息/车辆事件日志', NULL, 40906, NULL, 0, '2020-03-27 02:02:09', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (50000, 'MOD050000', '', 'set', '/set', 'el-icon-setting', '/set', 'layout/Layout', 'noRedirect', 1, NULL, 0, 0, '系统设置', NULL, 50000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:31:18');
INSERT INTO `system_module` VALUES (51000, 'MOD051000', 'MOD050000', 'menu', 'Menu', 'al-icon-genderless', 'menu', 'views/set/menu/index', NULL, 1, NULL, 0, 0, '系统设置/平台设置', NULL, 51000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:48:45');
INSERT INTO `system_module` VALUES (51001, 'MOD051001', 'MOD051000', 'module', 'Module', 'al-icon-genderless', 'module', 'views/set/menu/module', NULL, 15, '/api/data/module', 1, 0, '系统设置/平台设置/模块列表', NULL, 51001, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (51002, 'MOD051002', 'MOD051000', 'rule', 'Rule', 'al-icon-genderless', 'rule', 'views/set/menu/rule', NULL, 7, '/api/data/rule', 1, 0, '系统设置/平台设置/编码规则', NULL, 51002, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (51003, 'MOD051003', 'MOD051000', 'open_platform', 'OpenPlatform', 'al-icon-genderless', 'open-platform', 'views/set/menu/open-platform', NULL, 15, '/api/data/open-platform', 0, 0, '系统设置/平台设置/开放平台', NULL, 51003, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (51004, 'MOD051004', 'MOD051000', 'regular_clean', 'ReaularClean', 'al-icon-genderless', 'regalar-clean', 'views/set/menu/regular-clean', NULL, 15, '/api/data/regular-clean', 1, 0, '系统设置/平台设置/定期清理', NULL, 51004, '', 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (51005, 'MOD051005', 'MOD051000', 'system_av_srs', 'SystemAvSrs', 'al-icon-genderless', 'system-av-srs', 'views/set/menu/system-av-srs', NULL, 15, '/api/data/system-av-srs', 0, 0, '系统设置/平台设置/SRS服务器', NULL, 51005, NULL, 0, '2021-01-15 01:14:42', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (51006, 'MOD051006', 'MOD051000', 'system_av_rtp', 'SystemAvRtp', 'al-icon-genderless', 'system-av-rtp', 'views/set/menu/system-av-rtp', NULL, 15, '/api/data/system-av-rtp', 0, 0, '系统设置/平台设置/RTP服务器', NULL, 51006, NULL, 0, '2021-05-28 03:04:30', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (51007, 'MOD051007', 'MOD051000', 'platform_alarm', 'PlatformAlarm', 'al-icon-genderless', 'platform-alarm', 'views/set/menu/platform-alarm', NULL, 15, '/api/data/platform-alarm', 1, 0, '系统设置/平台设置/平台报警', NULL, 51007, '', 0, '2021-08-25 07:23:44', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (51008, 'MOD051008', 'MOD051000', 'device_alarm', 'DeviceAlarm', 'al-icon-genderless', 'device-alarm', 'views/set/menu/device-alarm', NULL, 15, '/api/data/device-alarm', 1, 0, '系统设置/平台设置/终端报警', NULL, 51008, '', 0, '2022-01-12 03:44:36', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (51009, 'MOD051009', 'MOD051000', 'system_config', 'SystemConfig', 'al-icon-genderless', 'system-config', 'views/set/menu/system-config', NULL, 15, '/api/data/system-config', 0, 0, '系统设置/平台设置/配置维护', NULL, 51009, '', 0, '2022-02-11 06:28:21', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (52000, 'MOD052000', 'MOD050000', 'auth', 'Auth', 'al-icon-genderless', 'auth', 'views/set/auth/index', NULL, 1, NULL, 0, 0, '系统设置/权限分配', NULL, 52000, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:49:05');
INSERT INTO `system_module` VALUES (52001, 'MOD052001', 'MOD052000', 'user', 'User', 'al-icon-genderless', 'user', 'views/set/auth/user', NULL, 15, '/api/data/user', 0, 0, '系统设置/权限分配/用户管理', NULL, 52001, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (52002, 'MOD052002', 'MOD052000', 'role', 'Role', 'al-icon-genderless', 'role', 'views/set/auth/role', NULL, 15, '/api/data/role', 0, 0, '系统设置/权限分配/角色管理', NULL, 52002, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (52003, 'MOD052003', 'MOD052000', 'grant', 'Grant', 'al-icon-genderless', 'grant', 'views/set/auth/grant', NULL, 65, NULL, 0, 0, '系统设置/权限分配/授权中心', NULL, 52003, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (52004, 'MOD052004', 'MOD052000', 'console', 'Console', 'al-icon-genderless', 'console', 'views/set/auth/console', NULL, 15, NULL, 0, 0, '系统设置/权限分配/控制台', NULL, 52004, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (52005, 'MOD052005', 'MOD052000', 'grant_datav', 'GrantDatav', 'al-icon-genderless', 'grant-datav', 'views/set/auth/grant-datav', NULL, 65, NULL, 0, 0, '系统设置/权限分配/大数据授权', NULL, 52005, '', 0, '2022-03-07 06:46:57', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (52006, 'MOD052006', 'MOD052000', 'service', 'Service', 'al-icon-genderless', 'service', 'views/set/auth/service', NULL, 7, NULL, 0, 0, '系统设置/权限分配/后台服务', NULL, 52006, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (53000, 'MOD053000', 'MOD050000', 'doc', 'Doc', 'al-icon-genderless', 'doc', 'views/set/doc/index', NULL, 1, NULL, 0, 0, '系统设置/开发文档', NULL, 53000, '', 0, '2019-08-23 07:44:35', '2025-12-22 08:49:24');
INSERT INTO `system_module` VALUES (53001, 'MOD053001', 'MOD053000', 'i18n', 'I18n', 'al-icon-genderless', 'i18n', 'views/set/doc/i18n', NULL, 1, NULL, 1, 0, '系统设置/开发文档/国际化', NULL, 53001, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (53002, 'MOD053002', 'MOD053000', 'icon', 'Icon', 'al-icon-genderless', 'icon', 'views/set/doc/icon', NULL, 1, NULL, 1, 0, '系统设置/开发文档/图标', NULL, 53002, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (53003, 'MOD053003', 'MOD053000', 'version', 'Version', 'al-icon-genderless', 'version', 'views/set/doc/version', NULL, 1, NULL, 1, 0, '系统设置/开发文档/更新日志', NULL, 53003, NULL, 0, '2019-08-23 07:44:35', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (54000, 'MOD054000', 'MOD050000', 'config', 'Config', 'al-icon-genderless', 'config', 'views/set/config/index', '', 1, '', 0, 0, '系统设置/终端配置', NULL, 54000, NULL, 0, '2021-01-18 02:21:55', '2025-12-22 08:49:42');
INSERT INTO `system_module` VALUES (54001, 'MOD054001', 'MOD054000', 'config_voice', 'ConfigVoice', 'al-icon-genderless', 'config-voice', 'views/set/config/config-voice', '', 15, '/api/data/config-voice', 0, 0, '系统设置/终端配置/语音库管理', NULL, 54001, '', 0, '2021-01-18 02:21:55', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (54002, 'MOD054002', 'MOD054000', 'config_common', 'ConfigCommon', 'al-icon-genderless', 'config-common', 'views/set/config/config-common', '', 15, '/api/data/config-common', 0, 0, '系统设置/终端配置/通用配置', NULL, 54002, NULL, 0, '2021-01-18 02:21:55', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (54003, 'MOD054003', 'MOD054000', 'device_data', 'DeviceData', 'al-icon-genderless', 'device-data', 'views/set/config/device-data', '', 15, '/api/data/config-voice', 0, 0, '系统设置/终端配置/终端数据', NULL, 54003, NULL, 0, '2021-01-18 02:21:55', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (54004, 'MOD054004', 'MOD054000', 'remote_publish', 'RemotePublish', 'al-icon-genderless', 'remote-publish', 'views/set/config/remote-publish', '', 15, '/api/data/config-voice', 0, 0, '系统设置/终端配置/远程发布', NULL, 54004, NULL, 0, '2021-01-18 02:21:55', '2025-12-22 08:51:56');
INSERT INTO `system_module` VALUES (60000, 'MOD060000', '', 'standardization', '/standardization', 'el-icon-folder', '/standardization', 'layout/Layout', 'noRedirect', 1, '', 0, 0, '标准化', NULL, 60000, NULL, 0, '2025-12-01 08:23:41', '2025-12-22 06:24:22');
INSERT INTO `system_module` VALUES (60001, 'MOD060001', 'MOD060000', 'security', 'Security', 'al-icon-genderless', 'security', 'views/standardization/security/index', '', 1, '', 0, 0, '标准化/安全标准化', NULL, 60001, NULL, 0, '2025-12-01 09:00:46', '2025-12-22 08:08:48');
INSERT INTO `system_module` VALUES (60002, 'MOD060002', 'MOD060000', 'subsidy', 'Subsidy', 'al-icon-genderless', 'subsidy', 'views/standardization/subsidy', '', 1, '', 0, 0, '标准化/补贴核算管理', NULL, 60002, NULL, 0, '2025-12-22 03:29:52', '2025-12-22 08:08:50');


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
-- Records of system_rule
-- ----------------------------
INSERT INTO `system_rule` VALUES (1, 'UID', 10002, '用户ID', '2019-08-23 07:47:46', '2025-05-13 08:48:44');
INSERT INTO `system_rule` VALUES (2, 'CID', 10001, '企业ID ทดสอบ', '2019-08-23 07:47:46', '2025-05-13 08:48:44');
INSERT INTO `system_rule` VALUES (3, 'RID', 10000, '角色ID', '2019-08-23 07:47:46', '2021-06-29 02:03:20');
INSERT INTO `system_rule` VALUES (4, 'DTY', 10000, '设备类型1', '2019-08-23 07:47:46', '2021-06-29 02:03:21');
INSERT INTO `system_rule` VALUES (5, 'MOD', 70000, '模块编码', '2019-08-26 13:05:49', '2021-06-29 02:03:22');

-- ----------------------------
-- Records of basic_alarm_device
-- ----------------------------
INSERT INTO `basic_alarm_device` VALUES (1, 1, 'SOS', 1, 'TG-M1', 1, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (2, 2, '断电报警', 1119, 'TG-M1', 2, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (8, 3, '震动报警', 1109, 'TG-M1', 3, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (12, 6, '超速报警', 1003, 'TG-M1', 6, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (13, 7, 'ACC开', 1001, 'TG-M1', 7, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (15, 8, 'ACC关', 1002, 'TG-M1', 8, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (16, 9, '低电关机报警', NULL, 'TG-M1', 9, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (17, 10, '外电低压报警', 1116, 'TG-M1', 10, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (18, 11, '关机报警', 1102, 'TG-M1', 11, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (19, 12, '换卡报警', 1113, 'TG-M1', 12, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (20, 13, '拆卸报警', 1112, 'TG-M1', 13, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (21, 14, '伪基站报警', 1111, 'TG-M1', 14, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (22, 15, '位移拖车报警', 1110, 'TG-M1', 15, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (23, 16, '外电低电保护后飞行模式', NULL, 'TG-M1', 16, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (24, 17, '声控报警', NULL, 'TG-M1', 17, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (25, 18, '外电低电保护报警', NULL, 'TG-M1', 18, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (26, 19, 'gps第一次定位报警', NULL, 'TG-M1', 19, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (27, 20, '开机报警', 1101, 'TG-M1', 20, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (28, 21, '进入gps盲区报警', 1107, 'TG-M1', 21, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (29, 22, '离开gps盲区报警', 1108, 'TG-M1', 22, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (30, 23, '门报警', 1008, 'TG-M1', 23, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (35, 1001, '进围栏报警', 1803, 'TG-PLATFORM', 1001, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (36, 1002, '出围栏报警', 1804, 'TG-PLATFORM', 1002, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (37, 1003, '进路径区', 1805, 'TG-PLATFORM', 1003, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (38, 1004, '出路径区', 1806, 'TG-PLATFORM', 1004, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (39, 101, 'SOS', 1, 'TG-MEI', 101, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (40, 102, '输入2激活(开门)', 1008, 'TG-MEI', 102, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (41, 103, '输入3激活(点火)', 1001, 'TG-MEI', 103, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (42, 104, '输入4激活', 1707, 'TG-MEI', 104, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (43, 105, '输入5激活', 1709, 'TG-MEI', 105, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (44, 109, '输入1非激活(或SOS松开)', 2, 'TG-MEI', 109, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (45, 110, '输入2非激活', 1009, 'TG-MEI', 110, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (46, 111, '输入3非激活', 1002, 'TG-MEI', 111, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (47, 112, '输入4非激活', 1708, 'TG-MEI', 112, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (48, 113, '输入5非激活', 1710, 'TG-MEI', 113, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (49, 117, '终端电池低电', 1115, 'TG-MEI', 117, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (50, 118, '外接电瓶低电', 1116, 'TG-MEI', 118, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (51, 119, '超速', 1003, 'TG-MEI', 119, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (52, 120, '进入电子围栏', 1601, 'TG-MEI', 120, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (53, 121, '离开电子围栏', 1602, 'TG-MEI', 121, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (54, 122, '车电瓶线接上', 1118, 'TG-MEI', 122, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (55, 123, '车电瓶线被切断', 1119, 'TG-MEI', 123, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (56, 124, '丢失GPS信号', 1107, 'TG-MEI', 124, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (57, 125, '收到GPS信号', 1108, 'TG-MEI', 125, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (58, 126, '进入休眠模式', 1105, 'TG-MEI', 126, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (59, 127, '退出休眠模式', 1602, 'TG-MEI', 127, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (60, 128, 'GPS天线被切断', 1114, 'TG-MEI', 128, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (61, 129, '终端开机', 1101, 'TG-MEI', 129, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (62, 131, '心跳', NULL, 'TG-MEI', 131, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (63, 132, '拐弯', NULL, 'TG-MEI', 132, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (64, 133, '定距追踪', NULL, 'TG-MEI', 133, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (65, 134, '当前位置', NULL, 'TG-MEI', 134, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (66, 135, '定时追踪', NULL, 'TG-MEI', 135, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (67, 136, '拖车', 1110, 'TG-MEI', 136, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (68, 137, 'RFID', NULL, 'TG-MEI', 137, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (69, 139, '拍照触发事件', 1201, 'TG-MEI', 139, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (70, 140, '关机', 1102, 'TG-MEI', 140, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (71, 141, '静止', NULL, 'TG-MEI', 141, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (72, 142, '移动', NULL, 'TG-MEI', 142, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (73, 144, 'GSM被干扰', 1111, 'TG-MEI', 144, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (74, 150, '高温', 1501, 'TG-MEI', 150, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (75, 151, '低温', 1502, 'TG-MEI', 151, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (76, 152, '满油', 1401, 'TG-MEI', 152, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (77, 153, '低油', 1402, 'TG-MEI', 153, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (78, 154, '偷油', 1403, 'TG-MEI', 154, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (79, 156, '布防成功', 1103, 'TG-MEI', 156, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (80, 157, '撤防成功', 1104, 'TG-MEI', 157, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (81, 158, '偷车', 1110, 'TG-MEI', 158, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (82, 163, 'GSM干扰被解除', NULL, 'TG-MEI', 163, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (83, 165, '求救打电话', NULL, 'TG-MEI', 165, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (84, 166, '输入2激活打电话', NULL, 'TG-MEI', 166, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (85, 167, '输入3激活打电话', NULL, 'TG-MEI', 167, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (86, 168, '输入4激活打电话', NULL, 'TG-MEI', 168, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (87, 169, '输入5激活打电话', NULL, 'TG-MEI', 169, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (88, 170, '拒绝接听来电', 1302, 'TG-MEI', 170, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (89, 171, '来电后回复位置', NULL, 'TG-MEI', 171, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (90, 172, '自动接听来电', 1302, 'TG-MEI', 172, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (91, 173, '监听', 1303, 'TG-MEI', 173, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (92, 179, '跌倒', NULL, 'TG-MEI', 179, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (93, 180, '设备已安装到主体', NULL, 'TG-MEI', 180, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (94, 181, '设备从安装主体脱落', NULL, 'TG-MEI', 181, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (95, 232, '停车不熄火恢复（停止空转）', NULL, 'TG-MEI', 232, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (96, 233, '停车不熄火（空转）', 1007, 'TG-MEI', 233, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (97, 235, '疲劳驾驶', 1005, 'TG-MEI', 235, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (98, 236, '疲劳驾驶恢复', NULL, 'TG-MEI', 236, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (99, 238, '超速恢复', 1004, 'TG-MEI', 238, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (100, 239, '保养提醒', NULL, 'TG-MEI', 239, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (103, 301, '距离上报', NULL, 'TG-FIFO', 301, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (104, 302, 'SOS', 1, 'TG-FIFO', 302, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (105, 303, 'SOS恢复', 2, 'TG-FIFO', 303, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (106, 304, '输入2激活', 1001, 'TG-FIFO', 304, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (107, 305, '输入2恢复', 1002, 'TG-FIFO', 305, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (108, 306, '输入3激活', 1705, 'TG-FIFO', 306, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (109, 307, '输入3恢复', 1706, 'TG-FIFO', 307, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (110, 308, '输入4激活', NULL, 'TG-FIFO', 308, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (111, 309, '输入4恢复', NULL, 'TG-FIFO', 309, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (112, 314, '外接电源低电', 1116, 'TG-FIFO', 314, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (113, 315, '外接电源断开', 1118, 'TG-FIFO', 315, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (114, 316, '外接电源连接', 1119, 'TG-FIFO', 316, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (115, 317, '电池低电', 1115, 'TG-FIFO', 317, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (116, 318, '超速开始', 1003, 'TG-FIFO', 318, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (117, 320, 'GPS天线切割', 1114, 'TG-FIFO', 320, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (118, 321, '震动报警', 1109, 'TG-FIFO', 321, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (119, 323, '紧急加速', NULL, 'TG-FIFO', 323, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (120, 324, '紧急减速', NULL, 'TG-FIFO', 324, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (121, 325, '设备休眠', 1105, 'TG-FIFO', 325, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (122, 326, '设备唤醒', 1106, 'TG-FIFO', 326, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (123, 327, '疲劳驾驶', 1005, 'TG-FIFO', 327, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (124, 328, '疲劳驾驶恢复', NULL, 'TG-FIFO', 328, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (125, 329, '停车超时', NULL, 'TG-FIFO', 329, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (126, 330, '信号干扰', NULL, 'TG-FIFO', 330, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (127, 332, '定位干扰', NULL, 'TG-FIFO', 332, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (128, 333, '离开围栏', 1602, 'TG-FIFO', 333, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (129, 334, '进入围栏', 1601, 'TG-FIFO', 334, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (130, 335, '怠速报警', NULL, 'TG-FIFO', 335, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (131, 337, '登入', NULL, 'TG-FIFO', 337, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (132, 338, '登出', NULL, 'TG-FIFO', 338, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (133, 339, '非法登陆', NULL, 'TG-FIFO', 339, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (134, 340, '高温报警', 1501, 'TG-FIFO', 340, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (135, 341, '低温报警', 1402, 'TG-FIFO', 341, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (136, 343, '串口错误', NULL, 'TG-FIFO', 343, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (137, 344, '油量报警', 1403, 'TG-FIFO', 344, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (138, 345, '加油', NULL, 'TG-FIFO', 345, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (139, 346, '油量低', 1402, 'TG-FIFO', 346, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (140, 347, '油量高', 1401, 'TG-FIFO', 347, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (141, 10001, 'SOS开始', 1, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (142, 10002, 'SOS恢复', 2, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (143, 10003, '超速开始', 1003, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (144, 10004, '超速恢复', 1004, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (145, 10005, '疲劳驾驶开始', 1005, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (146, 10006, '疲劳驾驶恢复', NULL, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (147, 10009, 'GNSS模块故障开始', NULL, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (148, 10010, 'GNSS模块故障恢复', NULL, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (149, 10011, 'GNSS天线未接或被剪断开始', 1114, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (150, 10012, 'GNSS天线未接或被剪断恢复', 1120, 'TG-1078', NULL, '2019-11-28 00:58:41', '2021-02-03 09:52:10');
INSERT INTO `basic_alarm_device` VALUES (151, 10013, 'GNSS天线短路开始', NULL, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (152, 10014, 'GNSS天线短路恢复', NULL, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (153, 10015, '终端主电源欠压开始', 1116, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (154, 10016, '终端主电源欠压恢复', NULL, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (155, 10017, '终端主电源掉电开始', 1119, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (156, 10018, '终端主电源掉电恢复', 1118, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (163, 342, '超速结束', NULL, 'TG-FIFO', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (164, 10059, '震动报警', 1109, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (165, 11001, 'ACC OFF', 1002, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (166, 11002, 'ACC ON', 1001, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (167, 11035, '门5关', 1009, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (168, 11036, '门5开', 1008, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (169, 11034, '门4开', 1717, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (170, 11033, '门4关', 1718, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (172, 11032, '门3开', 1715, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (173, 11031, '门3关', 1716, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (174, 11030, '门2开', 1713, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (175, 11029, '门2关', 1714, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (176, 11028, '门1开', 1711, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (177, 11027, '门1关', 1712, 'TG-1078', NULL, '2019-11-28 00:58:41', '2019-11-28 00:58:41');
INSERT INTO `basic_alarm_device` VALUES (178, 12021, '视频丢失', 12021, 'TG-1078', NULL, '2020-12-03 03:34:23', '2020-12-03 03:34:26');
INSERT INTO `basic_alarm_device` VALUES (179, 12022, '视频遮挡', 12022, 'TG-1078', NULL, '2020-12-03 03:34:47', '2020-12-03 03:34:47');
INSERT INTO `basic_alarm_device` VALUES (180, 12023, '存储器故障', 12023, 'TG-1078', NULL, '2020-12-03 03:35:02', '2020-12-03 03:35:02');
INSERT INTO `basic_alarm_device` VALUES (181, 13000, '设备不通讯', 13000, 'TG-1078', NULL, '2021-02-03 08:28:04', '2021-02-03 08:28:04');
INSERT INTO `basic_alarm_device` VALUES (183, 14000, '异常开关门开始', 14000, 'TG-MDVR', NULL, '2021-08-04 02:56:27', '2021-08-09 09:32:39');
INSERT INTO `basic_alarm_device` VALUES (184, 15001, '紧急加速开始', 15001, 'TG-MDVR', NULL, '2021-08-09 05:36:48', '2021-08-09 05:37:41');
INSERT INTO `basic_alarm_device` VALUES (185, 15002, '紧急加速结束', 15002, 'TG-MDVR', NULL, '2021-08-09 05:37:02', '2021-08-09 05:37:43');
INSERT INTO `basic_alarm_device` VALUES (186, 15003, '紧急减速开始', 15003, 'TG-MDVR', NULL, '2021-08-09 05:37:20', '2021-08-09 05:37:44');
INSERT INTO `basic_alarm_device` VALUES (187, 15004, '紧急减速结束', 15004, 'TG-MDVR', NULL, '2021-08-09 05:37:37', '2021-08-09 05:37:46');
INSERT INTO `basic_alarm_device` VALUES (188, 16001, '离线行驶开始', 16001, 'TG-MDVR', NULL, '2021-08-09 05:44:41', '2021-08-09 05:45:00');
INSERT INTO `basic_alarm_device` VALUES (189, 16002, '离线行驶结束', 16002, 'TG-MDVR', NULL, '2021-08-09 05:44:57', '2021-08-09 05:45:02');
INSERT INTO `basic_alarm_device` VALUES (190, 17000, '车辆滞站', 17000, 'TG-MDVR', NULL, '2021-08-09 05:52:40', '2021-08-09 05:52:59');
INSERT INTO `basic_alarm_device` VALUES (191, 18000, '车辆越站', 18000, 'TG-MDVR', NULL, '2021-08-09 05:52:56', '2021-08-09 05:53:01');
INSERT INTO `basic_alarm_device` VALUES (192, 14001, '异常开关门结束', 14001, 'TG-MDVR', NULL, '2021-08-09 07:02:33', '2021-08-09 07:02:49');
INSERT INTO `basic_alarm_device` VALUES (193, 19000, 'GPS设备门开启', 19000, 'TG-MDVR', NULL, '2021-08-20 10:18:24', '2021-08-20 10:18:24');

-- ----------------------------
-- Records of basic_alarm_platform
-- ----------------------------
INSERT INTO `basic_alarm_platform` VALUES (1, 1, 'SOS开始', 1, 1, 'SOS开始', 'SOS Start', 'เริ่ม SOS', 0, '2019-11-28 01:05:14', '2024-08-26 02:28:24');
INSERT INTO `basic_alarm_platform` VALUES (2, 2, 'SOS恢复', 1, 2, 'SOS恢复', 'SOS reinstate', 'สิ้นสุดความเร็ว SOS', 0, '2019-11-28 01:05:14', '2022-01-13 09:41:55');
INSERT INTO `basic_alarm_platform` VALUES (3, 1001, 'ACC开启', 10, 1001, 'ACC开启', 'ACC on', 'เปิด ACC', 0, '2019-11-28 01:05:14', '2022-01-13 09:41:55');
INSERT INTO `basic_alarm_platform` VALUES (4, 1002, 'ACC关闭', 10, 1002, 'ACC关闭', 'ACC off', 'ปิด ACC', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:55');
INSERT INTO `basic_alarm_platform` VALUES (5, 1003, '超速开始', 10, 1003, '超速开始', 'Speeding start', 'เริ่มความเร็วเกินกำหนด', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:55');
INSERT INTO `basic_alarm_platform` VALUES (6, 1004, '超速结束', 10, 1004, '超速结束', 'Speeding end', 'สิ้นสุดความเร็วเกินกำหนด', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:55');
INSERT INTO `basic_alarm_platform` VALUES (7, 1005, '疲劳驾驶', 10, 1005, '疲劳驾驶', 'Fatigue driving', 'ผู้ขับขี่เกิดความเมื่อยล้า', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:55');
INSERT INTO `basic_alarm_platform` VALUES (8, 1006, '异常开关门', 10, 1006, '异常开关门', 'Illegal Open Door', 'เปิดประตูผิดปกติ', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:55');
INSERT INTO `basic_alarm_platform` VALUES (9, 1007, '停车未熄火', 10, 1007, '停车未熄火', 'idling', 'จอดรถติดเครื่อง', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:55');
INSERT INTO `basic_alarm_platform` VALUES (10, 1008, '开门', 10, 1008, '开门', 'Open the door', 'เปิดประตู', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:55');
INSERT INTO `basic_alarm_platform` VALUES (11, 1009, '关门', 10, 1009, '关门', 'Close the door', 'ปิดประตู', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:55');
INSERT INTO `basic_alarm_platform` VALUES (12, 1010, '偏离路线', 10, 1010, '偏离路线', 'Off course', 'ออกนอกเส้นทาง', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:55');
INSERT INTO `basic_alarm_platform` VALUES (13, 1101, '设备开机', 11, 1101, '设备开机', 'Device Reboot', 'รีบูทอุปกรณ์', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:55');
INSERT INTO `basic_alarm_platform` VALUES (14, 1102, '设备关机', 11, 1102, '设备关机', 'Device Power Off', 'ปิดอุปกรณ์', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:55');
INSERT INTO `basic_alarm_platform` VALUES (15, 1103, '设防', 11, 1103, '设防', 'Fortification', 'พื้นที่เฉพาะ', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:55');
INSERT INTO `basic_alarm_platform` VALUES (16, 1104, '撤防', 11, 1104, '撤防', 'Disarm', 'ล้างการแจ้งเตือน', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (17, 1105, '进入休眠模式', 11, 1105, '进入休眠模式', 'Enter Sleep', 'เข้าสู่โหมดสลีป', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (18, 1106, '退出休眠模式', 11, 1106, '退出休眠模式', 'Exit Sleep', 'ออกจากโหมดสลีป', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (19, 1107, '进入GPS盲区', 11, 1107, '进入GPS盲区', 'Enter GPS blind area', 'เข้าพื้นที่อับสัญญาณ GPS', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (20, 1108, '退出GPS盲区', 11, 1108, '退出GPS盲区', 'Exit GPS blind area', 'ออกพื้นที่อับสัญญาณ GPS', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (21, 1109, '震动报警', 11, 1109, '震动报警', 'Vibration alarm', 'แจ้งเตือนการสั่นสะเทือน', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (22, 1110, '拖车报警', 11, 1110, '拖车报警', 'Trailer', 'ถูกลากจูง', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (23, 1111, '伪基站报警', 11, 1111, '伪基站报警', 'Pseudo base station', 'สถานีฐาน', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (24, 1112, '拆卸设备报警', 11, 1112, '拆卸设备报警', 'Take apart', 'ถอดอุปกรณ์', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (25, 1113, '换卡报警', 11, 1113, '换卡报警', 'Change Sim', 'เปลี่ยนซิมการ์ด', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (26, 1114, 'GPS天线被切断', 11, 1114, 'GPS天线被切断', 'GPS antenna Cut', 'เสาสัญญาณ GPS ถูกถอด', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (27, 1115, '内置电池电压低', 11, 1115, '内置电池电压低', 'Low Battery', 'แบตเตอรี่ต่ำ', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (28, 1116, '外接电源电压低', 11, 1116, '外接电源电压低', 'Low External Battery', 'แบตเตอรี่ภายนอกต่ำ', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (29, 1117, '侧翻', 11, 1117, '侧翻', 'Rollover', 'รถคว่ำ', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (30, 1118, '外部电源接上', 11, 1118, '外部电源接上', 'External power is connected', 'เชื่อมสายไฟหลักแล้ว', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (31, 1119, '外接电源断开', 11, 1119, '外接电源断开', 'External power disconnected', 'สายไฟหลักถูกถอด', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (32, 1120, 'GPS恢复正常', 11, 1120, 'GPS恢复正常', 'GPS returns to normal', 'GPS กลับสู่สภาวะปกติ', 0, '2021-02-03 09:49:15', '2022-01-13 09:41:56');
INSERT INTO `basic_alarm_platform` VALUES (33, 1201, '抓拍', 12, 1201, '抓拍', 'Snapshot', 'ถ่ายภาพ', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (34, 1301, '拒接来电', 13, 1301, '拒接来电', 'Rejected call', 'ปฏิเสธสายเรียกเข้า', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (35, 1302, '接听来电', 13, 1302, '接听来电', 'Answer the call', 'รับสายเรียกเข้า', 0, '2019-11-28 01:05:15', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (36, 1303, '监听', 13, 1303, '监听', 'Listen', 'ดักฟัง', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (37, 1401, '油量过高', 14, 1401, '油量过高', 'Exorbitant oil', 'เชื้อเพลิงมากเกินไป', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (38, 1402, '油量过低', 14, 1402, '油量过低', 'Low oil content', 'เชื้อเพลงต่ำ', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (39, 1403, '偷油', 14, 1403, '偷油', 'Stealing Oil', 'ขโมยเชื้อเพลิง', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (40, 1404, '加油', 14, 1404, '加油', 'Oiling', 'มาเลย', 0, '2022-01-13 03:05:06', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (41, 1501, '温度过高', 15, 1501, '温度过高', 'The temperature is too high', 'อุณหภูมิสูงเกินไป', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (42, 1502, '温度过低', 15, 1502, '温度过低', 'The temperature is too low', 'อุณหภูมิต่ำเกินไป', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (43, 1601, '进入电子围栏', 16, 1601, '进入电子围栏', 'Enter the fence', 'เข้าสู่พื้นที่', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (44, 1602, '离开电子围栏', 16, 1602, '离开电子围栏', 'Leave the fence', 'ออกจากพื้นที่', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (45, 1701, 'IO1激活', 17, 1701, 'IO1激活', 'IO1 activated', 'IO1 ทำงาน', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (46, 1702, 'IO1非激活', 17, 1702, 'IO1非激活', 'IO1 is not active', 'IO1 ไม่ทำงาน', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (47, 1703, 'IO2激活', 17, 1703, 'IO2激活', 'IO2 activated', 'IO2 ทำงาน', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (48, 1704, 'IO2非激活', 17, 1704, 'IO2非激活', 'IO2 inactive', 'IO2 ไม่ทำงาน', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (49, 1705, 'IO3激活', 17, 1705, 'IO3激活', 'IO3 activated', 'IO3 ทำงาน', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (50, 1706, 'IO3非激活', 17, 1706, 'IO3非激活', 'IO3 inactive', 'IO3 ไม่ทำงาน', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (51, 1707, 'IO4激活', 17, 1707, 'IO4激活', 'IO4 activated', 'IO4 ทำงาน', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (52, 1708, 'IO4非激活', 17, 1708, 'IO4非激活', 'IO4 inactive', 'IO4 ไม่ทำงาน', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:57');
INSERT INTO `basic_alarm_platform` VALUES (53, 1709, 'IO5激活', 17, 1709, 'IO5激活', 'IO5 activated', 'IO5 ทำงาน', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (54, 1710, 'IO5非激活', 17, 1710, 'IO5非激活', 'IO5 inactive', 'IO5 ไม่ทำงาน', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (55, 1711, '	\r\n门1开', 17, 1711, '门1开', 'Door 1 is open', 'ประตู 1 เปิด', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (56, 1712, '	\r\n门1关', 17, 1712, '门1关', 'Door 1 closed', 'ประตู 1 ปิด', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (57, 1713, '	\r\n门2开', 17, 1713, '门2开', 'Door 2 is open', 'ประตู 2 เปิด', 0, '2019-11-28 01:05:17', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (58, 1714, '门2关', 17, 1714, '门2关', 'Door 2 closed', 'ประตู 2 ปิด', 0, '2019-11-28 01:05:17', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (59, 1715, '门3开', 17, 1715, '门3开', 'Door 3 is open', 'ประตู 3 เปิด', 0, '2019-11-28 01:05:17', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (60, 1716, '	\r\n门3关', 17, 1716, '门3关', 'Door 3 closed', 'ประตู 3 ปิด', 0, '2019-11-28 01:05:17', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (61, 1717, '门4开', 17, 1717, '门4开', 'Door 4 open', 'ประตู 4 เปิด', 0, '2019-11-28 01:05:17', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (62, 1718, '	\r\n门4关', 17, 1718, '	\r\n门4关', 'Door 4 closed', 'ประตู 4 ปิด', 0, '2019-11-28 01:05:17', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (63, 1719, '门5开', 17, 1719, '门5开', 'Door 5 open', 'ประตู 5 เปิด', 0, '2019-11-28 01:05:17', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (64, 1720, '门5关', 17, 1720, '门5关', 'Door 5 closed', 'ประตู 5 ปิด', 0, '2019-11-28 01:05:17', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (65, 1801, '设备上线', 18, 1801, '设备上线', 'Device is online', 'อุปกรณ์ออนไลน์', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (66, 1802, '设备下线', 18, 1802, '设备下线', 'Device is offline', 'อุปกรณ์ออฟไลน์', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (67, 1803, '进电子围栏', 18, 1803, '进电子围栏', 'Enter the fence', 'เข้าสู่พื้นที่', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (68, 1804, '出电子围栏', 18, 1804, '出电子围栏', 'Leave the fence', 'ออกจากพื้นที่', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (69, 1805, '进入路径区', 18, 1805, '进入路径区', 'Enter the path area', 'เข้าสู่เส้นทาง', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (70, 1806, '退出路径区', 18, 1806, '退出路径区', 'Exit Path Area', 'ออกจากเส้นทาง', 0, '2019-11-28 01:05:16', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (71, 1811, '油量过高(平台)', 18, 1811, '油量过高(平台)', 'Too much oil（Platform）', 'น้ำมันมากเกินไป(แพลตฟอร์ม)', 0, '2022-01-11 10:16:49', '2022-01-13 09:41:58');
INSERT INTO `basic_alarm_platform` VALUES (72, 1812, '油量过低(平台)', 18, 1812, '油量过低(平台)', 'Oil level too low(platform)', 'ระดับน้ำมันต่ำเกินไป(แพลตฟอร์ม)', 0, '2022-01-11 10:17:49', '2022-01-13 09:41:59');
INSERT INTO `basic_alarm_platform` VALUES (73, 1813, '偷油(平台)', 18, 1813, '偷油(平台)', 'Steal oil(platform)', 'ขโมยน้ำมัน(แพลตฟอร์ม)', 0, '2022-01-11 10:18:27', '2022-01-13 09:41:59');
INSERT INTO `basic_alarm_platform` VALUES (74, 1814, '加油(平台)', 18, 1814, '加油(平台)', 'Oiling(platform)', 'มาเลย(แพลตฟอร์ม)', 0, '2022-01-11 10:20:14', '2022-01-13 09:41:59');
INSERT INTO `basic_alarm_platform` VALUES (75, 12021, '视频丢失', 100, 12021, '视频丢失', 'Video loss', 'วิดีโอหาย', 0, '2020-12-29 08:15:13', '2022-01-13 09:43:09');
INSERT INTO `basic_alarm_platform` VALUES (76, 12022, '视频遮挡', 100, 12022, '视频遮挡', 'Video occlusion', 'พบการปิดกล้อง', 0, '2020-12-29 08:15:38', '2022-01-13 09:43:14');
INSERT INTO `basic_alarm_platform` VALUES (77, 12023, '存储器故障', 100, 12023, '存储器故障', 'Memory failure', 'หน่วยความจำล้มเหลว', 0, '2020-12-29 08:16:05', '2022-01-13 09:43:16');
INSERT INTO `basic_alarm_platform` VALUES (78, 13000, '设备不通讯', 100, 13000, '设备不通讯', 'Device not communicating', 'อุปกรณ์ไม่ตอบสนอง', 0, '2021-02-03 08:27:29', '2022-01-13 09:43:18');
INSERT INTO `basic_alarm_platform` VALUES (79, 14000, '异常开关门开始', 100, 14000, '异常开关门开始', 'The abnormal opening and closing of the door started', 'การเปิดและปิดประตูอย่างผิดปกติเริ่มต้นขึ้น', 0, '2021-08-25 01:54:05', '2022-01-13 09:43:19');
INSERT INTO `basic_alarm_platform` VALUES (80, 14001, '异常开关门结束', 100, 14001, '异常开关门结束', 'Abnormal door opening ended', 'การเปิดประตูผิดปกติสิ้นสุด', 0, '2021-08-25 01:55:01', '2022-01-13 09:44:05');
INSERT INTO `basic_alarm_platform` VALUES (81, 15001, '紧急加速开始', 100, 15001, '紧急加速开始', 'emergency acceleration start', 'การเร่งความเร็วฉุกเฉินเริ่มต้น', 0, '2021-08-25 01:56:49', '2022-01-13 09:43:22');
INSERT INTO `basic_alarm_platform` VALUES (82, 15002, '紧急加速结束', 100, 15002, '紧急加速结束', 'End of emergency acceleration', 'สิ้นสุดการเร่งความเร็วฉุกเฉิน', 0, '2021-08-25 01:57:26', '2022-01-13 09:43:24');
INSERT INTO `basic_alarm_platform` VALUES (83, 15003, '紧急减速开始', 100, 15003, '紧急减速开始', 'emergency deceleration start', 'การเริ่มต้นการชะลอตัวฉุกเฉิน', 0, '2021-08-25 01:59:04', '2022-01-13 09:43:26');
INSERT INTO `basic_alarm_platform` VALUES (84, 15004, '紧急减速结束', 100, 15004, '紧急减速结束', 'Emergency deceleration ends', 'การชะลอตัวฉุกเฉินสิ้นสุดลง', 0, '2021-08-25 01:59:52', '2022-01-13 09:43:27');
INSERT INTO `basic_alarm_platform` VALUES (85, 16001, '离线行驶开始', 100, 16001, '离线行驶开始', 'Offline driving start', 'การสตาร์ทแบบออฟไลน์', 0, '2021-08-25 02:01:12', '2022-01-13 09:43:29');
INSERT INTO `basic_alarm_platform` VALUES (86, 16002, '离线行驶结束', 100, 16002, '离线行驶结束', 'Offline driving ends', 'การสิ้นสุดการขับขี่แบบออฟไลน์', 0, '2021-08-25 02:01:58', '2022-01-13 09:43:31');
INSERT INTO `basic_alarm_platform` VALUES (87, 17000, '车辆滞站', 100, 17000, '车辆滞站', 'vehicle stalled', 'รถติด', 0, '2021-08-25 02:02:42', '2022-01-13 09:43:32');
INSERT INTO `basic_alarm_platform` VALUES (88, 18000, '车辆越站', 100, 18000, '车辆越站', 'vehicle overpasses', 'สะพานลอยรถ', 0, '2021-08-25 02:03:43', '2022-01-13 09:43:33');
INSERT INTO `basic_alarm_platform` VALUES (89, 19000, 'GPS设备被打开', 100, 19000, 'GPS设备被打开', 'GPS unit open', 'อุปกรณ์ถูกเปิดฝา', 0, '2021-08-25 02:04:26', '2022-01-13 09:43:36');
INSERT INTO `basic_alarm_platform` VALUES (90, 25601, '前向碰撞', 200, 25601, '前向碰撞', 'Forward collision alarm', 'สัญญาณเตือนการชน\',', 0, '2022-03-08 06:39:18', '2022-03-08 06:51:33');
INSERT INTO `basic_alarm_platform` VALUES (91, 25602, '车道偏离', 200, 25602, '车道偏离', 'Lane departure warning', 'คำเตือนการออกจากเลน\',', 0, '2022-03-08 06:39:37', '2022-03-08 06:51:33');
INSERT INTO `basic_alarm_platform` VALUES (92, 25603, '车距过近', 200, 25603, '车距过近', 'Alarm when the distance is too close', 'เตือนระยะใกล้เกินไป\',', 0, '2022-03-08 06:39:48', '2022-03-08 06:51:33');
INSERT INTO `basic_alarm_platform` VALUES (93, 25604, '行人碰撞', 200, 25604, '行人碰撞', 'Pedestrian collision alarm', 'สัญญาณเตือนการชนกันของคนเดินเท้า\',', 0, '2022-03-08 06:39:57', '2022-03-08 06:51:33');
INSERT INTO `basic_alarm_platform` VALUES (94, 25605, '频繁变道', 200, 25605, '频繁变道', 'Frequent lane change alarm', 'สัญญาณเตือนการเปลี่ยนเลนบ่อย\',', 0, '2022-03-08 06:40:06', '2022-03-08 06:51:33');
INSERT INTO `basic_alarm_platform` VALUES (95, 25606, '道路标识超限', 200, 25606, '道路标识超限', 'Road sign overrun alarm', 'สัญญาณเตือนการบุกรุกถนน\',', 0, '2022-03-08 06:40:17', '2022-03-08 06:51:33');
INSERT INTO `basic_alarm_platform` VALUES (96, 25607, '障碍物', 200, 25607, '障碍物', 'Obstacle alarm', 'สัญญาณเตือนภัยที่เป็นอุปสรรค\',', 0, '2022-03-08 06:42:50', '2022-03-08 06:51:33');
INSERT INTO `basic_alarm_platform` VALUES (97, 25608, '前向摄像头遮挡', 200, 25608, '前向摄像头遮挡', 'Forward camera occlusion', 'กล้องด้านหน้า\',', 0, '2022-03-08 06:43:00', '2022-03-08 06:51:33');
INSERT INTO `basic_alarm_platform` VALUES (98, 25616, '道路标志识别事件', 200, 25616, '道路标志识别事件', 'Road sign recognition event', 'เหตุการณ์การจดจำป้ายถนน\',', 0, '2022-03-08 06:43:11', '2022-03-08 06:51:33');
INSERT INTO `basic_alarm_platform` VALUES (99, 25617, '主动抓拍事件', 200, 25617, '主动抓拍事件', 'Active capture event', 'กิจกรรมการจับภาพที่ใช้งานอยู่\',', 0, '2022-03-08 06:43:22', '2022-03-08 06:51:33');
INSERT INTO `basic_alarm_platform` VALUES (100, 25857, '疲劳驾驶', 200, 25857, '疲劳驾驶', 'Fatigue driving alarm', 'เตือนเมื่อยการเมื่อยล้าในการขับขี่\',', 0, '2022-03-08 06:43:32', '2022-06-15 07:03:04');
INSERT INTO `basic_alarm_platform` VALUES (101, 25858, '接打电话', 200, 25858, '接打电话', 'Answer the call', '\'รับโทรศัพท์\',', 0, '2022-03-08 06:43:42', '2022-06-15 07:03:10');
INSERT INTO `basic_alarm_platform` VALUES (102, 25859, '抽烟报警', 200, 25859, '抽烟报警', 'Smoking alarm', 'เตือนการสูบบุหรี่\',', 0, '2022-03-08 06:43:50', '2025-08-14 06:52:37');
INSERT INTO `basic_alarm_platform` VALUES (103, 25860, '分神驾驶', 200, 25860, '分神驾驶', 'Distracted driving alarm', 'เตือนการขับขี่ที่เสียสมาธิ\',', 0, '2022-03-08 06:44:01', '2022-06-15 07:03:16');
INSERT INTO `basic_alarm_platform` VALUES (104, 25861, '驾驶员异常', 200, 25861, '驾驶员异常', 'Driver abnormal alarm', 'แจ้งตือนคนขับผิดปกติ\',', 0, '2022-03-08 06:44:12', '2022-06-15 07:03:19');
INSERT INTO `basic_alarm_platform` VALUES (105, 25862, '双手同时脱离方向盘', 200, 25862, '双手同时脱离方向盘', 'Both hands off the steering wheel at the same time', 'มือทั้งสองออกจากพวงมาลัยในเวลาเดียวกัน\',', 0, '2022-03-08 06:44:23', '2022-03-08 06:51:34');
INSERT INTO `basic_alarm_platform` VALUES (106, 25863, 'DSM监测功能失效', 200, 25863, 'DSM监测功能失效', 'DSM monitoring function fails', 'ฟังก์ชันการตรวจสอบ DSM ล้มเหลว\',', 0, '2022-03-08 06:44:34', '2022-03-08 06:51:34');
INSERT INTO `basic_alarm_platform` VALUES (107, 25872, '自动抓拍事件', 200, 25872, '自动抓拍事件', 'Automatic snapshot event', 'เหตุการณ์ภาพรวมอัตโนมัติ\',', 0, '2022-03-08 06:44:42', '2022-03-08 06:51:34');
INSERT INTO `basic_alarm_platform` VALUES (108, 25873, '驾驶员变更事件', 200, 25873, '驾驶员变更事件', 'Driver change event', 'เหตุการณ์การเปลี่ยนแปลงผู้ขับ\'', 0, '2022-03-08 06:44:54', '2022-03-08 06:51:34');
INSERT INTO `basic_alarm_platform` VALUES (109, 1815, '怠速', 18, 1815, '怠速', 'Idling', 'รอบเดินเบา', 0, '2025-11-04 09:32:05', '2025-11-04 09:32:05');

SET FOREIGN_KEY_CHECKS = 1;
