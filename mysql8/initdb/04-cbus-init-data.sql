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
-- Records of basic_fleet
-- ----------------------------
INSERT INTO `basic_fleet` VALUES (1, '10001', 'GRP000001', '恭城公交', '', 'al-icon-genderless', 0, 0, 100, '', 'UID010001', '2025-05-13 08:53:55', '2025-05-13 08:53:55');

-- ----------------------------
-- Records of basic_route
-- ----------------------------
INSERT INTO `basic_route` VALUES (1, '10001', 'ROU000001', 11, '1路', 'GRP000001', '', NULL, 10, 0, 0, 0, NULL, 1, '2025-05-13 08:54:06', NULL, 11, '', 'UID010001', '2025-05-13 08:54:12', '2025-05-13 08:54:12', 0);

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
-- Records of schedule_resource
-- ----------------------------
INSERT INTO `schedule_resource` VALUES (1, '10001', '2025-05-13', 'ROU000001', '1路', 'ROU000001', '1路', 'ROU000001', '1路', 'CAR000001', '18270240064', NULL, '18270240064', NULL, NULL, NULL, NULL, 0, 100, 1, 0, 1, 0, 0.000, 0.000, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '2025-05-13 10:51:55', '', '2025-05-13 09:15:28', NULL, NULL, NULL, NULL, 0, NULL, '2025-05-13 09:13:02', '2025-05-13 10:51:55');

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
INSERT INTO `system_rule` VALUES (5, 'MOD', 10000, '模块编码', '2019-08-26 13:05:49', '2021-06-29 02:03:22');
INSERT INTO `system_rule` VALUES (6, 'GRP', 1, 'auto create', '2025-05-13 08:53:55', '2025-05-13 08:53:55');
INSERT INTO `system_rule` VALUES (7, 'ROU', 1, 'auto create', '2025-05-13 08:54:12', '2025-05-13 08:54:12');
INSERT INTO `system_rule` VALUES (8, 'CAR', 1, 'auto create', '2025-05-13 08:54:43', '2025-05-13 08:54:43');

-- ----------------------------
-- Records of system_shedlock
-- ----------------------------
INSERT INTO `system_shedlock` VALUES (1, 'correctionLogout', '2025-05-13 12:00:00.000', '2025-05-13 11:55:00.000', '1a1cc665cde6', '2025-05-13 06:45:00', '2025-05-13 11:55:00');
INSERT INTO `system_shedlock` VALUES (2, 'testJob1', '2025-05-13 11:57:30.000', '2025-05-13 11:57:00.001', '1a1cc665cde6', '2025-05-13 06:46:00', '2025-05-13 11:57:00');
INSERT INTO `system_shedlock` VALUES (3, 'checkDeviceFileUpload', '2025-05-13 11:55:29.153', '2025-05-13 11:50:29.153', '1a1cc665cde6', '2025-05-13 06:48:43', '2025-05-13 11:50:29');
INSERT INTO `system_shedlock` VALUES (4, 'checkOta', '2025-05-13 12:00:29.175', '2025-05-13 11:55:29.175', '1a1cc665cde6', '2025-05-13 06:53:43', '2025-05-13 11:55:29');


SET FOREIGN_KEY_CHECKS = 1;
