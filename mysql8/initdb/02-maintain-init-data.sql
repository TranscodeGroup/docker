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
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'dca0f9e348384d23958e151bb4adb98f', '系统管理员', 'sysadmin', '{bcrypt-md5}$2a$10$dsfVEzh5NlfrgkcLFbrPLOuSsm5zJMJJwYqlQfTSWs3qKzwhQx5Ku', '', NULL, NULL, '+08:00', NULL, 0, 0, 100, 0, '', '系统账号', '2025-04-29 09:27:50', NULL, NULL, '2025-04-29 03:46:24', 0, NULL, '', 0, '2025-04-29 03:46:24', '2025-04-29 09:28:57');
INSERT INTO `user_info` VALUES (2, '25d19d8c917747ea', '组织管理员', 'tgadmin', '{bcrypt-md5}$2a$10$dsfVEzh5NlfrgkcLFbrPLOuSsm5zJMJJwYqlQfTSWs3qKzwhQx5Ku', '', NULL, NULL, '+08:00', NULL, 0, 0, 1, 0, '', NULL, '2025-04-30 08:04:22', NULL, NULL, '2025-04-30 07:35:32', 0, 110, '', 0, '2025-04-30 07:35:32', '2025-04-30 08:22:00');


-- ----------------------------
-- Records of organize_role
-- ----------------------------
INSERT INTO `organize_role` VALUES (221, '', '系统内部角色', 'engineer', '工程师', 1, '{\"Monitor\":[\"view\"],\"History\":[\"view\"],\"Safety\":[\"view\"],\"Tire\":[\"view\"]}', NULL, NULL, 'dca0f9e348384d23958e151bb4adb98f', '2025-04-29 03:46:24', '2025-04-29 03:46:24');
INSERT INTO `organize_role` VALUES (222, '', '系统内部角色', 'service', '客服', 1, '', NULL, NULL, 'dca0f9e348384d23958e151bb4adb98f', '2025-04-29 03:46:24', '2025-04-29 03:46:24');

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
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES (1, 'backup.email.to', '517178887@qq.com|297860245@qq.com|330811792@qq.com', 0, '打包备份数据库文件要发往的邮件账号', 0, '2022-10-14 17:38:27', '2025-04-07 07:19:58');
INSERT INTO `system_config` VALUES (2, 'backup.project.name', 'ds.tgtrack&tripsdd服务器', 0, 'ds.tgtrack&tripsdd服务器', 0, '2025-04-07 07:20:52', '2025-04-07 07:22:50');
INSERT INTO `system_config` VALUES (3, 'minio.url', 'https://www.tripsdd.com', 0, 'APP文件全路径需要补全, 这个不需要/minio结尾, 一些人脸数据需要http协议', 0, '2025-04-07 07:26:14', '2025-04-07 07:48:20');

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

SET FOREIGN_KEY_CHECKS = 1;
