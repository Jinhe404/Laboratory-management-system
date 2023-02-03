/*
 Navicat Premium Data Transfer

 Source Server         : root@locallhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : lab

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 13/11/2022 10:44:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布人',
  `time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (2, '金河', '实验室管理系统![第6页14.PNG](http://localhost:9090/file/c70ddf8dd99d495db1bc7518d2db4cd4.PNG)', '管理员', '2022-10-21 19:59:29');
INSERT INTO `article` VALUES (3, NULL, '![2.jpg](http://localhost:9090/file/78ce19d5efb842509992389e6630b061.jpg)', '管理员', '2022-10-21 22:59:12');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `publish_date` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出场日期',
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备所有人',
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '厂商',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类',
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备码',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `createtime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `score` int(10) NULL DEFAULT NULL,
  `nums` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `book_no_index`(`book_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'MS60', '130', '2022-10-03', '李老师', 'LEICA', '全站仪 > 徕卡', 'MS60', 'http://localhost:9090/file/d2cee5d0d8c74f76a3f453fc38eb7207.PNG', '2022-10-26 15:43:00', '2022-10-26 00:00:00', 1, 2);
INSERT INTO `book` VALUES (2, 'TS30', '实验室130', '2022-10-03', '李老师', 'LEICA', '全站仪 > 徕卡', 'TS30', 'http://localhost:9090/file/c4f48556dd8a4aed957074750a7e0ed1.PNG', '2022-10-26 15:49:35', '2022-10-26 00:00:00', 1, 2);
INSERT INTO `book` VALUES (3, 'TS09 plus', NULL, '2022-09-01', '李老师', 'LCICA', '全站仪 > 徕卡', 'TS09 plus', 'http://localhost:9090/file/e09450049866464d813d20b5ecbffd2d.PNG', '2022-10-27 16:36:46', '2022-10-27 00:00:00', 1, 0);

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `book_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备名称',
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备编号（类型）',
  `user_no` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `user_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户联系方式',
  `createtime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatatime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `score` int(11) NULL DEFAULT NULL COMMENT '借设备积分',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '已借出' COMMENT '设备状态',
  `days` int(11) NULL DEFAULT 1 COMMENT '借设备天数',
  `return_date` datetime NULL DEFAULT NULL COMMENT '归还日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES (3, 'TS30', 'TS30', NULL, '金同学', '15809994788', '2022-10-26 16:06:36', NULL, 1, '已归还', 2, '2022-10-28 00:00:00');
INSERT INTO `borrow` VALUES (4, 'TS30', 'TS30', NULL, '金河', '13739541874', '2022-10-26 16:51:34', NULL, 1, '已归还', 1, '2022-10-27 00:00:00');
INSERT INTO `borrow` VALUES (5, 'MS60', 'MS60', NULL, '魏同学', '14789561234', '2022-10-26 16:53:58', NULL, 1, '已归还', 2, '2022-10-28 00:00:00');
INSERT INTO `borrow` VALUES (6, 'TS30', 'TS30', NULL, 'jinhe', '13739541874', '2022-10-26 17:06:10', NULL, 1, '已归还', 2, '2022-10-28 00:00:00');
INSERT INTO `borrow` VALUES (7, 'TS09 plus', 'TS09 plus', NULL, 'jin', '13739541874', '2022-10-27 16:38:11', NULL, 1, '已归还', 2, '2022-10-29 00:00:00');
INSERT INTO `borrow` VALUES (8, 'TS09 plus', 'TS09 plus', NULL, '金河', '13739541874', '2022-10-27 16:40:42', NULL, 1, '已借出', 3, '2022-10-30 00:00:00');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '全站仪', '全站仪', NULL, '2022-10-26 15:31:44', NULL);
INSERT INTO `category` VALUES (2, '徕卡', '徕卡', 1, '2022-10-26 15:32:50', NULL);
INSERT INTO `category` VALUES (3, '无人机航测系统', '无人机航测系统', NULL, '2022-10-26 15:33:29', NULL);
INSERT INTO `category` VALUES (4, '南方测绘', '南方测绘', 3, '2022-10-26 15:33:47', NULL);
INSERT INTO `category` VALUES (5, '大疆精灵4', '大疆精灵4', 3, '2022-10-26 15:34:09', NULL);
INSERT INTO `category` VALUES (6, '成都纵横', '成都纵横', 3, '2022-10-26 15:34:42', '2022-10-27 00:00:00');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备名称',
  `equip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备型号',
  `times` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '借还时间',
  `state` tinyint(1) NULL DEFAULT NULL COMMENT '是否可用',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `equip_num` int(11) NULL DEFAULT NULL COMMENT '设备数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '全站仪', 'Leca', '2022-10-05 17:09:35', 1, 7, 1);
INSERT INTO `course` VALUES (2, '水准仪', 'Trimble Dini03 2', '2022-10-11 00:00:00', 1, 2, NULL);
INSERT INTO `course` VALUES (3, '全站仪', '南方 NTS 372R15', '2022-10-05 00:00:00', 1, 2, NULL);
INSERT INTO `course` VALUES (4, 'GNSS', 'Leica GS18', '2022-10-01 00:00:00', 1, 3, NULL);
INSERT INTO `course` VALUES (5, '无人机', '1', '2022-10-04 00:00:00', 0, NULL, NULL);
INSERT INTO `course` VALUES (6, '无人机', 'dj', NULL, NULL, 2, NULL);

-- ----------------------------
-- Table structure for equip
-- ----------------------------
DROP TABLE IF EXISTS `equip`;
CREATE TABLE `equip`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `etype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备名称',
  `emodel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备描述',
  `eqnum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备数量',
  `eplace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备地点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equip
-- ----------------------------
INSERT INTO `equip` VALUES (1, '全站仪', 'Leica MS60', '1', '130');
INSERT INTO `equip` VALUES (2, '全站仪', 'Leica TS30', '1', '130');
INSERT INTO `equip` VALUES (3, '全站仪', 'Leica TS16', '1', '130');
INSERT INTO `equip` VALUES (4, '全站仪', 'Leica TS09 plus', '1', NULL);
INSERT INTO `equip` VALUES (5, '全站仪', 'Leica TC1800', '1', NULL);
INSERT INTO `equip` VALUES (6, '全站仪', 'Leica TCR1202', '1', NULL);
INSERT INTO `equip` VALUES (7, '全站仪', 'Leica TC905L', '1', NULL);
INSERT INTO `equip` VALUES (8, '全站仪', '索佳 SET2 130R3', '1', NULL);
INSERT INTO `equip` VALUES (9, '全站仪', '南方 NTS 382R6', '25', NULL);
INSERT INTO `equip` VALUES (10, '全站仪', '南方 NTS 372R15', '50', NULL);
INSERT INTO `equip` VALUES (11, '全站仪', '南方 NTS 362RL', '27', NULL);
INSERT INTO `equip` VALUES (12, '全站仪', '三鼎 STS-782R', '6', NULL);
INSERT INTO `equip` VALUES (13, '全站仪', '拓普康 GTS335', '7', NULL);
INSERT INTO `equip` VALUES (14, '全站仪', '索佳 SET610', '8', NULL);
INSERT INTO `equip` VALUES (15, '全站仪', 'Leica TC307', '4', NULL);
INSERT INTO `equip` VALUES (16, '全站仪', '海星达 ATS-320M', '4', NULL);
INSERT INTO `equip` VALUES (17, '无人机航\r\n测系统', '南方测绘 HO1300', '1', NULL);
INSERT INTO `equip` VALUES (18, '无人机航测系统', '大疆 精灵 4 RTK', '12', NULL);
INSERT INTO `equip` VALUES (19, '无人机航测系统', '成都纵横 CW-15', '1', NULL);
INSERT INTO `equip` VALUES (20, 'GNSS', 'Leica GS18', '2', NULL);
INSERT INTO `equip` VALUES (21, 'GNSS', 'Leica GS16', '4', NULL);
INSERT INTO `equip` VALUES (22, 'GNSS', '南方 银河 1（新版）', '5', NULL);
INSERT INTO `equip` VALUES (23, 'GNSS', '南方 银河 1（旧版）', '3', NULL);
INSERT INTO `equip` VALUES (24, 'GNSS', '中海达 iRTK5', '11', NULL);
INSERT INTO `equip` VALUES (25, 'GNSS', '南方 S82-C', '4', NULL);
INSERT INTO `equip` VALUES (26, 'GNSS', '海星达 iRTK', '5', NULL);
INSERT INTO `equip` VALUES (27, 'GNSS', '合众思壮 survey 5', '5', NULL);
INSERT INTO `equip` VALUES (28, 'GNSS', 'CORS 站', '1', NULL);
INSERT INTO `equip` VALUES (29, '水准仪', 'Leica DNA03 3', '3', NULL);
INSERT INTO `equip` VALUES (30, '水准仪', 'Trimble Dini03 2', '2', NULL);
INSERT INTO `equip` VALUES (31, '水准仪', 'Leica Sprinter 250M', '10', NULL);
INSERT INTO `equip` VALUES (32, '水准仪', '南方 DL-2007', '10', NULL);
INSERT INTO `equip` VALUES (33, '水准仪', '南方 DSZ2', '25', NULL);
INSERT INTO `equip` VALUES (34, '水准仪', '苏光 DSZ2', '10', NULL);
INSERT INTO `equip` VALUES (35, '水准仪', '蔡司 Ni-004', '4', NULL);
INSERT INTO `equip` VALUES (36, '水准仪', '自动安平水准仪', '40', NULL);
INSERT INTO `equip` VALUES (37, '水准仪', 'S3 微倾式水准仪', '80', NULL);
INSERT INTO `equip` VALUES (38, '扫描仪', 'Z-F IMAGER \r\n5010C', '1', NULL);
INSERT INTO `equip` VALUES (39, '扫描仪', 'Leica MS60', '1', NULL);
INSERT INTO `equip` VALUES (40, '测绘数\r\n据处理\r\n中心', '联想专业台式机', '40', NULL);
INSERT INTO `equip` VALUES (41, '测绘数\r\n据处理\r\n中心', '航天远景教学系统', '40', NULL);
INSERT INTO `equip` VALUES (42, '测绘数\r\n据处理\r\n中心', '3D 眼镜', '40', NULL);
INSERT INTO `equip` VALUES (43, '相机', '成都纵横 CA-503R', '1', NULL);
INSERT INTO `equip` VALUES (44, '相机', '成都纵横 C102', '1', NULL);
INSERT INTO `equip` VALUES (45, '相机', 'SPECIM IQ 高光谱相机', '2', NULL);
INSERT INTO `equip` VALUES (46, '经纬仪', 'DJ6', '85', NULL);
INSERT INTO `equip` VALUES (47, '无人机实\r\n训工作站', NULL, '15', NULL);
INSERT INTO `equip` VALUES (48, '无人机实\r\n虚拟现\r\n实眼镜', 'VIVE PRO', '2', '133');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备名称',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '报修学生',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备图片',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '报修时间',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '待审核' COMMENT '待审核，审核不通过，审核通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (4, '主机', '金河同学', 'http://localhost:9090/file/be0906d922464f1c8585d232bc712a05.PNG', '2022-10-23', '审核通过');
INSERT INTO `goods` VALUES (5, '1', 'admin', 'http://localhost:9090/file/b5c0868ca09e45ebacbab57bd4423d35.jpg', '2022-10-26', '待审核');
INSERT INTO `goods` VALUES (6, '电脑', '魏同学', 'http://localhost:9090/file/45296e9c1c30425c9865fc35df9533ff.PNG', '2022-10-26', '审核通过');
INSERT INTO `goods` VALUES (7, '无人机', '魏同学', 'http://localhost:9090/file/4eb52f1463ec497cbfee99ece5c07c23.PNG', '2022-10-27', '待审核');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '留言人id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '留言人用户名',
  `time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, '111', 112, '11', '2022-09-06 00:00:00', 1);
INSERT INTO `message` VALUES (2, '222', 22, '22', '2022-10-01 17:15:10', 2);
INSERT INTO `message` VALUES (4, '333', 1, 'admin', '2022-10-01 17:15:52', 33);
INSERT INTO `message` VALUES (5, '44', 1, 'admin', '2021-10-01 00:00:00', 4);
INSERT INTO `message` VALUES (6, NULL, 1, 'admin', '2022-10-01 18:25:55', NULL);
INSERT INTO `message` VALUES (7, NULL, 1, 'admin', '2022-10-01 18:25:58', NULL);
INSERT INTO `message` VALUES (8, NULL, 1, 'admin', '2022-10-01 18:27:33', NULL);
INSERT INTO `message` VALUES (9, NULL, 1, 'admin', '2022-10-01 18:27:42', NULL);
INSERT INTO `message` VALUES (11, '全站仪', 1, 'admin', '2022-10-01 18:29:31', NULL);
INSERT INTO `message` VALUES (12, '3355588', 1, 'admin', '2022-10-01 20:17:00', NULL);
INSERT INTO `message` VALUES (13, '全站仪', 1, 'admin', '2022-10-02 10:22:36', NULL);
INSERT INTO `message` VALUES (14, '经纬仪', 1, 'admin', '2022-10-12 11:27:58', NULL);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布人',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `type` int(11) NULL DEFAULT NULL COMMENT '1-简单的公告，2富文本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '实验室管理系统1.0发布', '今天实验室1.0版本正式上线', '2022-10-16 09:36:27', NULL, NULL, NULL);
INSERT INTO `notice` VALUES (3, '实验室管理系统2.0', '实验室管理系统2.0上线了，测试中', '2022-10-18 12:22:55', NULL, NULL, NULL);
INSERT INTO `notice` VALUES (5, '实验室管理系统1.0', '<p>实验室管理系1.0测试</p><p>为了保证系统稳定性，根据严格管理、规范实施的要求，指定该系统上线规范。对于已经开发完毕的系统，需要正式部署到生产环境前必须严格按照一下流程规范实施。<br/></p>', '2022-10-14 15:18:58', '管理员', 'http://localhost:9090/file/78ce19d5efb842509992389e6630b061.jpg', 2);
INSERT INTO `notice` VALUES (6, '实验室管理1.1', '<p>实验室管理系统1.1.1开始测试</p>', '2022-10-16 19:50:46', '管理员', 'http://localhost:9090/file/78ce19d5efb842509992389e6630b061.jpg', 2);

-- ----------------------------
-- Table structure for retur
-- ----------------------------
DROP TABLE IF EXISTS `retur`;
CREATE TABLE `retur`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `book_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备名称',
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备编号（类型）',
  `user_no` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `user_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户联系方式',
  `createtime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatatime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `score` int(11) NULL DEFAULT NULL COMMENT '借设备积分',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '已借出' COMMENT '设备状态',
  `days` int(11) NULL DEFAULT 1 COMMENT '借设备天数',
  `return_date` datetime NULL DEFAULT NULL COMMENT '归还日期',
  `real_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of retur
-- ----------------------------
INSERT INTO `retur` VALUES (2, 'TS30', 'TS30', NULL, '金同学', '15809994788', '2022-10-26 16:43:06', NULL, 1, '已归还', 2, '2022-10-28 00:00:00', '2022-10-26 00:00:00');
INSERT INTO `retur` VALUES (3, 'MS60', 'MS60', NULL, '金河', '13739541874', '2022-10-26 16:43:08', NULL, 1, '已归还', 2, '2022-10-28 00:00:00', '2022-10-26 00:00:00');
INSERT INTO `retur` VALUES (4, 'MS60', 'MS60', NULL, '金河', '13739541874', '2022-10-26 16:56:17', NULL, 1, '已归还', 2, '2022-10-28 00:00:00', '2022-10-26 00:00:00');
INSERT INTO `retur` VALUES (5, 'TS30', 'TS30', NULL, '金同学', '15809994788', '2022-10-26 16:56:18', NULL, 1, '已归还', 2, '2022-10-28 00:00:00', '2022-10-26 00:00:00');
INSERT INTO `retur` VALUES (6, 'TS30', 'TS30', NULL, '金河', '13739541874', '2022-10-26 17:16:28', NULL, 1, '已归还', 1, '2022-10-27 00:00:00', '2022-10-26 00:00:00');
INSERT INTO `retur` VALUES (7, 'TS30', 'TS30', NULL, 'jinhe', '13739541874', '2022-10-26 17:22:34', NULL, 1, '已归还', 2, '2022-10-28 00:00:00', '2022-10-26 00:00:00');
INSERT INTO `retur` VALUES (8, 'TS09 plus', 'TS09 plus', NULL, 'jin', '13739541874', '2022-10-27 16:38:53', NULL, 1, '已归还', 2, '2022-10-29 00:00:00', '2022-10-27 00:00:00');
INSERT INTO `retur` VALUES (9, 'MS60', 'MS60', NULL, '魏同学', '14789561234', '2022-11-10 16:13:22', NULL, 1, '已归还', 2, '2022-10-28 00:00:00', '2022-11-10 00:00:00');

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course`  (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`student_id`, `course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_course
-- ----------------------------
INSERT INTO `student_course` VALUES (1, 1);
INSERT INTO `student_course` VALUES (1, 2);
INSERT INTO `student_course` VALUES (1, 3);
INSERT INTO `student_course` VALUES (1, 4);
INSERT INTO `student_course` VALUES (2, 5);
INSERT INTO `student_course` VALUES (5, 2);
INSERT INTO `student_course` VALUES (5, 3);
INSERT INTO `student_course` VALUES (5, 4);
INSERT INTO `student_course` VALUES (6, 5);
INSERT INTO `student_course` VALUES (8, 5);
INSERT INTO `student_course` VALUES (9, 3);
INSERT INTO `student_course` VALUES (10, 6);
INSERT INTO `student_course` VALUES (15, 1);
INSERT INTO `student_course` VALUES (16, 1);
INSERT INTO `student_course` VALUES (16, 2);
INSERT INTO `student_course` VALUES (16, 3);
INSERT INTO `student_course` VALUES (16, 4);
INSERT INTO `student_course` VALUES (16, 5);
INSERT INTO `student_course` VALUES (17, 1);
INSERT INTO `student_course` VALUES (17, 2);
INSERT INTO `student_course` VALUES (17, 3);
INSERT INTO `student_course` VALUES (17, 4);
INSERT INTO `student_course` VALUES (17, 5);
INSERT INTO `student_course` VALUES (18, 1);
INSERT INTO `student_course` VALUES (18, 3);
INSERT INTO `student_course` VALUES (18, 4);
INSERT INTO `student_course` VALUES (18, 5);
INSERT INTO `student_course` VALUES (19, 1);
INSERT INTO `student_course` VALUES (19, 2);
INSERT INTO `student_course` VALUES (19, 3);
INSERT INTO `student_course` VALUES (23, 2);
INSERT INTO `student_course` VALUES (23, 3);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 281 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` VALUES (2, 'house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` VALUES (3, 'menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` VALUES (4, 's-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` VALUES (5, 's-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` VALUES (6, 'document', 'el-icon-document', 'icon');
INSERT INTO `sys_dict` VALUES (7, 'coffee', 'el-icon-coffee\r\n', 'icon');
INSERT INTO `sys_dict` VALUES (8, 's-marketing', 'el-icon-s-marketing', 'icon');
INSERT INTO `sys_dict` VALUES (9, 'phone-outline', 'el-icon-phone-outline', 'icon');
INSERT INTO `sys_dict` VALUES (10, 'platform-eleme', 'el-icon-platform-eleme', 'icon');
INSERT INTO `sys_dict` VALUES (11, 'eleme', 'el-icon-eleme', 'icon');
INSERT INTO `sys_dict` VALUES (12, 'delete-solid', 'el-icon-delete-solid', 'icon');
INSERT INTO `sys_dict` VALUES (13, 'delete', 'el-icon-delete', 'icon');
INSERT INTO `sys_dict` VALUES (14, 's-tools', 'el-icon-s-tools', 'icon');
INSERT INTO `sys_dict` VALUES (15, 'setting', 'el-icon-setting', 'icon');
INSERT INTO `sys_dict` VALUES (16, 'user-solid', 'el-icon-user-solid', 'icon');
INSERT INTO `sys_dict` VALUES (17, 'phone', 'el-icon-phone', 'icon');
INSERT INTO `sys_dict` VALUES (18, 'more', 'el-icon-more', 'icon');
INSERT INTO `sys_dict` VALUES (19, 'more-outline', 'el-icon-more-outline', 'icon');
INSERT INTO `sys_dict` VALUES (20, 'star-on', 'el-icon-star-on', 'icon');
INSERT INTO `sys_dict` VALUES (21, 'star-off', 'el-icon-star-off', 'icon');
INSERT INTO `sys_dict` VALUES (22, 's-goods', 'el-icon-s-goods', 'icon');
INSERT INTO `sys_dict` VALUES (23, 'goods', 'el-icon-goods', 'icon');
INSERT INTO `sys_dict` VALUES (24, 'warning', 'el-icon-warning', 'icon');
INSERT INTO `sys_dict` VALUES (25, 'warning-outline', 'el-icon-warning-outline', 'icon');
INSERT INTO `sys_dict` VALUES (26, 'question', 'el-icon-question', 'icon');
INSERT INTO `sys_dict` VALUES (27, 'info', 'el-icon-info', 'icon');
INSERT INTO `sys_dict` VALUES (28, 'remove', 'el-icon-remove', 'icon');
INSERT INTO `sys_dict` VALUES (29, 'circle-plus', 'el-icon-circle-plus', 'icon');
INSERT INTO `sys_dict` VALUES (30, 'success', 'el-icon-success', 'icon');
INSERT INTO `sys_dict` VALUES (31, 'error', 'el-icon-error', 'icon');
INSERT INTO `sys_dict` VALUES (32, 'zoom-in', 'el-icon-zoom-in', 'icon');
INSERT INTO `sys_dict` VALUES (33, 'zoom-out', 'el-icon-zoom-out', 'icon');
INSERT INTO `sys_dict` VALUES (34, 'remove-outline', 'el-icon-remove-outline', 'icon');
INSERT INTO `sys_dict` VALUES (35, 'circle-plus-outline', 'el-icon-circle-plus-outline', 'icon');
INSERT INTO `sys_dict` VALUES (36, 'circle-check', 'el-icon-circle-check', 'icon');
INSERT INTO `sys_dict` VALUES (37, 'circle-close', 'el-icon-circle-close', 'icon');
INSERT INTO `sys_dict` VALUES (38, 's-help', 'el-icon-s-help', 'icon');
INSERT INTO `sys_dict` VALUES (39, 'help', 'el-icon-help', 'icon');
INSERT INTO `sys_dict` VALUES (40, 'minus', 'el-icon-minus', 'icon');
INSERT INTO `sys_dict` VALUES (41, 'plus', 'el-icon-plus', 'icon');
INSERT INTO `sys_dict` VALUES (42, 'check', 'el-icon-check', 'icon');
INSERT INTO `sys_dict` VALUES (43, 'close', 'el-icon-close', 'icon');
INSERT INTO `sys_dict` VALUES (44, 'picture', 'el-icon-picture', 'icon');
INSERT INTO `sys_dict` VALUES (45, 'picture-outline', 'el-icon-picture-outline', 'icon');
INSERT INTO `sys_dict` VALUES (46, 'picture-outline-round', 'el-icon-picture-outline-round', 'icon');
INSERT INTO `sys_dict` VALUES (47, 'upload', 'el-icon-upload', 'icon');
INSERT INTO `sys_dict` VALUES (48, 'upload2', 'el-icon-upload2', 'icon');
INSERT INTO `sys_dict` VALUES (49, 'download', 'el-icon-download', 'icon');
INSERT INTO `sys_dict` VALUES (50, 'camera-solid', 'el-icon-camera-solid', 'icon');
INSERT INTO `sys_dict` VALUES (51, 'camera', 'el-icon-camera', 'icon');
INSERT INTO `sys_dict` VALUES (52, 'video-camera-solid', 'el-icon-video-camera-solid', 'icon');
INSERT INTO `sys_dict` VALUES (53, 'video-camera', 'el-icon-video-camera', 'icon');
INSERT INTO `sys_dict` VALUES (54, 'message-solid', 'el-icon-message-solid', 'icon');
INSERT INTO `sys_dict` VALUES (55, 'bell', 'el-icon-bell', 'icon');
INSERT INTO `sys_dict` VALUES (56, 's-cooperation', 'el-icon-s-cooperation', 'icon');
INSERT INTO `sys_dict` VALUES (57, 's-order', 'el-icon-s-order', 'icon');
INSERT INTO `sys_dict` VALUES (58, 's-platform', 'el-icon-s-platform', 'icon');
INSERT INTO `sys_dict` VALUES (59, 's-fold', 'el-icon-s-fold', 'icon');
INSERT INTO `sys_dict` VALUES (60, 's-unfold', 'el-icon-s-unfold', 'icon');
INSERT INTO `sys_dict` VALUES (61, 's-operation', 'el-icon-s-operation', 'icon');
INSERT INTO `sys_dict` VALUES (62, 's-promotion', 'el-icon-s-promotion', 'icon');
INSERT INTO `sys_dict` VALUES (63, 's-home', 'el-icon-s-home', 'icon');
INSERT INTO `sys_dict` VALUES (64, 's-release', 'el-icon-s-release', 'icon');
INSERT INTO `sys_dict` VALUES (65, 's-ticket', 'el-icon-s-ticket', 'icon');
INSERT INTO `sys_dict` VALUES (66, 's-management', 'el-icon-s-management', 'icon');
INSERT INTO `sys_dict` VALUES (67, 's-open', 'el-icon-s-open', 'icon');
INSERT INTO `sys_dict` VALUES (68, 's-shop', 'el-icon-s-shop', 'icon');
INSERT INTO `sys_dict` VALUES (69, 's-flag', 'el-icon-s-flag', 'icon');
INSERT INTO `sys_dict` VALUES (70, 's-comment', 'el-icon-s-comment', 'icon');
INSERT INTO `sys_dict` VALUES (71, 's-finance', 'el-icon-s-finance', 'icon');
INSERT INTO `sys_dict` VALUES (72, 's-claim', 'el-icon-s-claim', 'icon');
INSERT INTO `sys_dict` VALUES (73, 's-opportunity', 'el-icon-s-opportunity', 'icon');
INSERT INTO `sys_dict` VALUES (74, 's-data', 'el-icon-s-data', 'icon');
INSERT INTO `sys_dict` VALUES (75, 's-check', 'el-icon-s-check', 'icon');
INSERT INTO `sys_dict` VALUES (76, 'share', 'el-icon-share', 'icon');
INSERT INTO `sys_dict` VALUES (77, 'd-caret', 'el-icon-d-caret', 'icon');
INSERT INTO `sys_dict` VALUES (78, 'caret-left', 'el-icon-caret-left', 'icon');
INSERT INTO `sys_dict` VALUES (79, 'caret-right', 'el-icon-caret-right', 'icon');
INSERT INTO `sys_dict` VALUES (80, 'caret-bottom', 'el-icon-caret-bottom', 'icon');
INSERT INTO `sys_dict` VALUES (81, 'caret-top', 'el-icon-caret-top', 'icon');
INSERT INTO `sys_dict` VALUES (82, 'bottom-left', 'el-icon-bottom-left', 'icon');
INSERT INTO `sys_dict` VALUES (83, 'bottom-right', 'el-icon-bottom-right', 'icon');
INSERT INTO `sys_dict` VALUES (84, 'back', 'el-icon-back', 'icon');
INSERT INTO `sys_dict` VALUES (85, 'right', 'el-icon-right', 'icon');
INSERT INTO `sys_dict` VALUES (86, 'bottom', 'el-icon-bottom', 'icon');
INSERT INTO `sys_dict` VALUES (87, 'top', 'el-icon-top', 'icon');
INSERT INTO `sys_dict` VALUES (88, 'top-left', 'el-icon-top-left', 'icon');
INSERT INTO `sys_dict` VALUES (89, 'top-right', 'el-icon-top-right', 'icon');
INSERT INTO `sys_dict` VALUES (90, 'arrow-left', 'el-icon-arrow-left', 'icon');
INSERT INTO `sys_dict` VALUES (91, 'arrow-right', 'el-icon-arrow-right', 'icon');
INSERT INTO `sys_dict` VALUES (92, 'arrow-down', 'el-icon-arrow-down', 'icon');
INSERT INTO `sys_dict` VALUES (93, 'arrow-up', 'el-icon-arrow-up', 'icon');
INSERT INTO `sys_dict` VALUES (94, 'd-arrow-left', 'el-icon-d-arrow-left', 'icon');
INSERT INTO `sys_dict` VALUES (95, 'd-arrow-right', 'el-icon-d-arrow-right', 'icon');
INSERT INTO `sys_dict` VALUES (96, 'video-pause', 'el-icon-video-pause', 'icon');
INSERT INTO `sys_dict` VALUES (97, 'video-play', 'el-icon-video-play', 'icon');
INSERT INTO `sys_dict` VALUES (98, 'refresh', 'el-icon-refresh', 'icon');
INSERT INTO `sys_dict` VALUES (99, 'refresh-right', 'el-icon-refresh-right', 'icon');
INSERT INTO `sys_dict` VALUES (100, 'refresh-left', 'el-icon-refresh-left', 'icon');
INSERT INTO `sys_dict` VALUES (101, 'finished', 'el-icon-finished', 'icon');
INSERT INTO `sys_dict` VALUES (102, 'sort', 'el-icon-sort', 'icon');
INSERT INTO `sys_dict` VALUES (103, 'sort-up', 'el-icon-sort-up', 'icon');
INSERT INTO `sys_dict` VALUES (104, 'sort-down', 'el-icon-sort-down', 'icon');
INSERT INTO `sys_dict` VALUES (105, 'rank', 'el-icon-rank', 'icon');
INSERT INTO `sys_dict` VALUES (106, 'loading', 'el-icon-loading', 'icon');
INSERT INTO `sys_dict` VALUES (107, 'view', 'el-icon-view', 'icon');
INSERT INTO `sys_dict` VALUES (108, 'c-scale-to-original', 'el-icon-c-scale-to-original', 'icon');
INSERT INTO `sys_dict` VALUES (109, 'date', 'el-icon-date', 'icon');
INSERT INTO `sys_dict` VALUES (110, 'edit', 'el-icon-edit', 'icon');
INSERT INTO `sys_dict` VALUES (111, 'edit-outline', 'el-icon-edit-outline', 'icon');
INSERT INTO `sys_dict` VALUES (112, 'folder', 'el-icon-folder', 'icon');
INSERT INTO `sys_dict` VALUES (113, 'folder-opened', 'el-icon-folder-opened', 'icon');
INSERT INTO `sys_dict` VALUES (114, 'folder-add', 'el-icon-folder-add', 'icon');
INSERT INTO `sys_dict` VALUES (115, 'folder-remove', 'el-icon-folder-remove', 'icon');
INSERT INTO `sys_dict` VALUES (116, 'folder-delete', 'el-icon-folder-delete', 'icon');
INSERT INTO `sys_dict` VALUES (117, 'folder-checked', 'el-icon-folder-checked', 'icon');
INSERT INTO `sys_dict` VALUES (118, 'tickets', 'el-icon-tickets', 'icon');
INSERT INTO `sys_dict` VALUES (119, 'document-remove', 'el-icon-document-remove', 'icon');
INSERT INTO `sys_dict` VALUES (120, 'document-delete', 'el-icon-document-delete', 'icon');
INSERT INTO `sys_dict` VALUES (121, 'document-copy', 'el-icon-document-copy', 'icon');
INSERT INTO `sys_dict` VALUES (122, 'document-checked', 'el-icon-document-checked', 'icon');
INSERT INTO `sys_dict` VALUES (123, 'document-add', 'el-icon-document-add', 'icon');
INSERT INTO `sys_dict` VALUES (124, 'printer', 'el-icon-printer', 'icon');
INSERT INTO `sys_dict` VALUES (125, 'paperclip', 'el-icon-paperclip', 'icon');
INSERT INTO `sys_dict` VALUES (126, 'takeaway-box', 'el-icon-takeaway-box', 'icon');
INSERT INTO `sys_dict` VALUES (127, 'search', 'el-icon-search', 'icon');
INSERT INTO `sys_dict` VALUES (128, 'monitor', 'el-icon-monitor', 'icon');
INSERT INTO `sys_dict` VALUES (129, 'attract', 'el-icon-attract', 'icon');
INSERT INTO `sys_dict` VALUES (130, 'mobile', 'el-icon-mobile', 'icon');
INSERT INTO `sys_dict` VALUES (131, 'scissors', 'el-icon-scissors', 'icon');
INSERT INTO `sys_dict` VALUES (132, 'umbrella', 'el-icon-umbrella', 'icon');
INSERT INTO `sys_dict` VALUES (133, 'headset', 'el-icon-headset', 'icon');
INSERT INTO `sys_dict` VALUES (134, 'brush', 'el-icon-brush', 'icon');
INSERT INTO `sys_dict` VALUES (135, 'mouse', 'el-icon-mouse', 'icon');
INSERT INTO `sys_dict` VALUES (136, 'coordinate', 'el-icon-coordinate', 'icon');
INSERT INTO `sys_dict` VALUES (137, 'magic-stick', 'el-icon-magic-stick', 'icon');
INSERT INTO `sys_dict` VALUES (138, 'reading', 'el-icon-reading', 'icon');
INSERT INTO `sys_dict` VALUES (139, 'data-line', 'el-icon-data-line', 'icon');
INSERT INTO `sys_dict` VALUES (140, 'data-board', 'el-icon-data-board', 'icon');
INSERT INTO `sys_dict` VALUES (141, 'pie-chart', 'el-icon-pie-chart', 'icon');
INSERT INTO `sys_dict` VALUES (142, 'data-analysis', 'el-icon-data-analysis', 'icon');
INSERT INTO `sys_dict` VALUES (143, 'collection-tag', 'el-icon-collection-tag', 'icon');
INSERT INTO `sys_dict` VALUES (144, 'film', 'el-icon-film', 'icon');
INSERT INTO `sys_dict` VALUES (145, 'suitcase', 'el-icon-suitcase', 'icon');
INSERT INTO `sys_dict` VALUES (146, 'suitcase-1', 'el-icon-suitcase-1', 'icon');
INSERT INTO `sys_dict` VALUES (147, 'receiving', 'el-icon-receiving', 'icon');
INSERT INTO `sys_dict` VALUES (148, 'collection', 'el-icon-collection', 'icon');
INSERT INTO `sys_dict` VALUES (149, 'files', 'el-icon-files', 'icon');
INSERT INTO `sys_dict` VALUES (150, 'notebook-1', 'el-icon-notebook-1', 'icon');
INSERT INTO `sys_dict` VALUES (151, 'notebook-2', 'el-icon-notebook-2', 'icon');
INSERT INTO `sys_dict` VALUES (152, 'toilet-paper', 'el-icon-toilet-paper', 'icon');
INSERT INTO `sys_dict` VALUES (153, 'office-building', 'el-icon-office-building', 'icon');
INSERT INTO `sys_dict` VALUES (154, 'school', 'el-icon-school', 'icon');
INSERT INTO `sys_dict` VALUES (155, 'table-lamp', 'el-icon-table-lamp', 'icon');
INSERT INTO `sys_dict` VALUES (156, 'no-smoking', 'el-icon-no-smoking', 'icon');
INSERT INTO `sys_dict` VALUES (157, 'smoking', 'el-icon-smoking', 'icon');
INSERT INTO `sys_dict` VALUES (158, 'shopping-cart-full', 'el-icon-shopping-cart-full', 'icon');
INSERT INTO `sys_dict` VALUES (159, 'shopping-cart-1', 'el-icon-shopping-cart-1', 'icon');
INSERT INTO `sys_dict` VALUES (160, 'shopping-cart-2', 'el-icon-shopping-cart-2', 'icon');
INSERT INTO `sys_dict` VALUES (161, 'shopping-bag-1', 'el-icon-shopping-bag-1', 'icon');
INSERT INTO `sys_dict` VALUES (162, 'shopping-bag-2', 'el-icon-shopping-bag-2', 'icon');
INSERT INTO `sys_dict` VALUES (163, 'sold-out', 'el-icon-sold-out', 'icon');
INSERT INTO `sys_dict` VALUES (164, 'sell', 'el-icon-sell', 'icon');
INSERT INTO `sys_dict` VALUES (165, 'present', 'el-icon-present', 'icon');
INSERT INTO `sys_dict` VALUES (166, 'box', 'el-icon-box', 'icon');
INSERT INTO `sys_dict` VALUES (167, 'bank-card', 'el-icon-bank-card', 'icon');
INSERT INTO `sys_dict` VALUES (168, 'money', 'el-icon-money', 'icon');
INSERT INTO `sys_dict` VALUES (169, 'coin', 'el-icon-coin', 'icon');
INSERT INTO `sys_dict` VALUES (170, 'wallet', 'el-icon-wallet', 'icon');
INSERT INTO `sys_dict` VALUES (171, 'discount', 'el-icon-discount', 'icon');
INSERT INTO `sys_dict` VALUES (172, 'price-tag', 'el-icon-price-tag', 'icon');
INSERT INTO `sys_dict` VALUES (173, 'news', 'el-icon-news', 'icon');
INSERT INTO `sys_dict` VALUES (174, 'guide', 'el-icon-guide', 'icon');
INSERT INTO `sys_dict` VALUES (175, 'male', 'el-icon-male', 'icon');
INSERT INTO `sys_dict` VALUES (176, 'female', 'el-icon-female', 'icon');
INSERT INTO `sys_dict` VALUES (177, 'thumb', 'el-icon-thumb', 'icon');
INSERT INTO `sys_dict` VALUES (178, 'cpu', 'el-icon-cpu', 'icon');
INSERT INTO `sys_dict` VALUES (179, 'link', 'el-icon-link', 'icon');
INSERT INTO `sys_dict` VALUES (180, 'connection', 'el-icon-connection', 'icon');
INSERT INTO `sys_dict` VALUES (181, 'open', 'el-icon-open', 'icon');
INSERT INTO `sys_dict` VALUES (182, 'turn-off', 'el-icon-turn-off', 'icon');
INSERT INTO `sys_dict` VALUES (183, 'set-up', 'el-icon-set-up', 'icon');
INSERT INTO `sys_dict` VALUES (184, 'chat-round', 'el-icon-chat-round', 'icon');
INSERT INTO `sys_dict` VALUES (185, 'chat-line-round', 'el-icon-chat-line-round', 'icon');
INSERT INTO `sys_dict` VALUES (186, 'chat-square', 'el-icon-chat-square', 'icon');
INSERT INTO `sys_dict` VALUES (187, 'chat-dot-round', 'el-icon-chat-dot-round', 'icon');
INSERT INTO `sys_dict` VALUES (188, 'chat-dot-square', 'el-icon-chat-dot-square', 'icon');
INSERT INTO `sys_dict` VALUES (189, 'chat-line-square', 'el-icon-chat-line-square', 'icon');
INSERT INTO `sys_dict` VALUES (190, 'message', 'el-icon-message', 'icon');
INSERT INTO `sys_dict` VALUES (191, 'postcard', 'el-icon-postcard', 'icon');
INSERT INTO `sys_dict` VALUES (192, 'position', 'el-icon-position', 'icon');
INSERT INTO `sys_dict` VALUES (193, 'turn-off-microphone', 'el-icon-turn-off-microphone', 'icon');
INSERT INTO `sys_dict` VALUES (194, 'microphone', 'el-icon-microphone', 'icon');
INSERT INTO `sys_dict` VALUES (195, 'close-notification', 'el-icon-close-notification', 'icon');
INSERT INTO `sys_dict` VALUES (196, 'bangzhu', 'el-icon-bangzhu', 'icon');
INSERT INTO `sys_dict` VALUES (197, 'time', 'el-icon-time', 'icon');
INSERT INTO `sys_dict` VALUES (198, 'odometer', 'el-icon-odometer', 'icon');
INSERT INTO `sys_dict` VALUES (199, 'crop', 'el-icon-crop', 'icon');
INSERT INTO `sys_dict` VALUES (200, 'aim', 'el-icon-aim', 'icon');
INSERT INTO `sys_dict` VALUES (201, 'switch-button', 'el-icon-switch-button', 'icon');
INSERT INTO `sys_dict` VALUES (202, 'full-screen', 'el-icon-full-screen', 'icon');
INSERT INTO `sys_dict` VALUES (203, 'copy-document', 'el-icon-copy-document', 'icon');
INSERT INTO `sys_dict` VALUES (204, 'mic', 'el-icon-mic', 'icon');
INSERT INTO `sys_dict` VALUES (205, 'stopwatch', 'el-icon-stopwatch', 'icon');
INSERT INTO `sys_dict` VALUES (206, 'medal-1', 'el-icon-medal-1', 'icon');
INSERT INTO `sys_dict` VALUES (207, 'medal', 'el-icon-medal', 'icon');
INSERT INTO `sys_dict` VALUES (208, 'trophy', 'el-icon-trophy', 'icon');
INSERT INTO `sys_dict` VALUES (209, 'trophy-1', 'el-icon-trophy-1', 'icon');
INSERT INTO `sys_dict` VALUES (210, 'first-aid-kit', 'el-icon-first-aid-kit', 'icon');
INSERT INTO `sys_dict` VALUES (211, 'discover', 'el-icon-discover', 'icon');
INSERT INTO `sys_dict` VALUES (212, 'place', 'el-icon-place', 'icon');
INSERT INTO `sys_dict` VALUES (213, 'location', 'el-icon-location', 'icon');
INSERT INTO `sys_dict` VALUES (214, 'location-outline', 'el-icon-location-outline', 'icon');
INSERT INTO `sys_dict` VALUES (215, 'location-information', 'el-icon-location-information', 'icon');
INSERT INTO `sys_dict` VALUES (216, 'add-location', 'el-icon-add-location', 'icon');
INSERT INTO `sys_dict` VALUES (217, 'delete-location', 'el-icon-delete-location', 'icon');
INSERT INTO `sys_dict` VALUES (218, 'map-location', 'el-icon-map-location', 'icon');
INSERT INTO `sys_dict` VALUES (219, 'alarm-clock', 'el-icon-alarm-clock', 'icon');
INSERT INTO `sys_dict` VALUES (220, 'timer', 'el-icon-timer', 'icon');
INSERT INTO `sys_dict` VALUES (221, 'watch-1', 'el-icon-watch-1', 'icon');
INSERT INTO `sys_dict` VALUES (222, 'watch', 'el-icon-watch', 'icon');
INSERT INTO `sys_dict` VALUES (223, 'lock', 'el-icon-lock', 'icon');
INSERT INTO `sys_dict` VALUES (224, 'unlock', 'el-icon-unlock', 'icon');
INSERT INTO `sys_dict` VALUES (225, 'key', 'el-icon-key', 'icon');
INSERT INTO `sys_dict` VALUES (226, 'service', 'el-icon-service', 'icon');
INSERT INTO `sys_dict` VALUES (227, 'mobile-phone', 'el-icon-mobile-phone', 'icon');
INSERT INTO `sys_dict` VALUES (228, 'bicycle', 'el-icon-bicycle', 'icon');
INSERT INTO `sys_dict` VALUES (229, 'truck', 'el-icon-truck', 'icon');
INSERT INTO `sys_dict` VALUES (230, 'ship', 'el-icon-ship', 'icon');
INSERT INTO `sys_dict` VALUES (231, 'basketball', 'el-icon-basketball', 'icon');
INSERT INTO `sys_dict` VALUES (232, 'football', 'el-icon-football', 'icon');
INSERT INTO `sys_dict` VALUES (233, 'soccer', 'el-icon-soccer', 'icon');
INSERT INTO `sys_dict` VALUES (234, 'baseball', 'el-icon-baseball', 'icon');
INSERT INTO `sys_dict` VALUES (235, 'wind-power', 'el-icon-wind-power', 'icon');
INSERT INTO `sys_dict` VALUES (236, 'light-rain', 'el-icon-light-rain', 'icon');
INSERT INTO `sys_dict` VALUES (237, 'lightning', 'el-icon-lightning', 'icon');
INSERT INTO `sys_dict` VALUES (238, 'heavy-rain', 'el-icon-heavy-rain', 'icon');
INSERT INTO `sys_dict` VALUES (239, 'sunrise', 'el-icon-sunrise', 'icon');
INSERT INTO `sys_dict` VALUES (240, 'sunrise-1', 'el-icon-sunrise-1', 'icon');
INSERT INTO `sys_dict` VALUES (241, 'sunset', 'el-icon-sunset', 'icon');
INSERT INTO `sys_dict` VALUES (242, 'sunny', 'el-icon-sunny', 'icon');
INSERT INTO `sys_dict` VALUES (243, 'cloudy', 'el-icon-cloudy', 'icon');
INSERT INTO `sys_dict` VALUES (244, 'partly-cloudy', 'el-icon-partly-cloudy', 'icon');
INSERT INTO `sys_dict` VALUES (245, 'cloudy-and-sunny', 'el-icon-cloudy-and-sunny', 'icon');
INSERT INTO `sys_dict` VALUES (246, 'moon', 'el-icon-moon', 'icon');
INSERT INTO `sys_dict` VALUES (247, 'moon-night', 'el-icon-moon-night', 'icon');
INSERT INTO `sys_dict` VALUES (248, 'dish', 'el-icon-dish', 'icon');
INSERT INTO `sys_dict` VALUES (249, 'dish-1', 'el-icon-dish-1', 'icon');
INSERT INTO `sys_dict` VALUES (250, 'food', 'el-icon-food', 'icon');
INSERT INTO `sys_dict` VALUES (251, 'chicken', 'el-icon-chicken', 'icon');
INSERT INTO `sys_dict` VALUES (252, 'fork-spoon', 'el-icon-fork-spoon', 'icon');
INSERT INTO `sys_dict` VALUES (253, 'knife-fork', 'el-icon-knife-fork', 'icon');
INSERT INTO `sys_dict` VALUES (254, 'burger', 'el-icon-burger', 'icon');
INSERT INTO `sys_dict` VALUES (255, 'tableware', 'el-icon-tableware', 'icon');
INSERT INTO `sys_dict` VALUES (256, 'sugar', 'el-icon-sugar', 'icon');
INSERT INTO `sys_dict` VALUES (257, 'dessert', 'el-icon-dessert', 'icon');
INSERT INTO `sys_dict` VALUES (258, 'ice-cream', 'el-icon-ice-cream', 'icon');
INSERT INTO `sys_dict` VALUES (259, 'hot-water', 'el-icon-hot-water', 'icon');
INSERT INTO `sys_dict` VALUES (260, 'water-cup', 'el-icon-water-cup', 'icon');
INSERT INTO `sys_dict` VALUES (261, 'coffee-cup', 'el-icon-coffee-cup', 'icon');
INSERT INTO `sys_dict` VALUES (262, 'cold-drink', 'el-icon-cold-drink', 'icon');
INSERT INTO `sys_dict` VALUES (263, 'goblet', 'el-icon-goblet', 'icon');
INSERT INTO `sys_dict` VALUES (264, 'goblet-full', 'el-icon-goblet-full', 'icon');
INSERT INTO `sys_dict` VALUES (265, 'goblet-square', 'el-icon-goblet-square', 'icon');
INSERT INTO `sys_dict` VALUES (266, 'goblet-square-full', 'el-icon-goblet-square-full', 'icon');
INSERT INTO `sys_dict` VALUES (267, 'refrigerator', 'el-icon-refrigerator', 'icon');
INSERT INTO `sys_dict` VALUES (268, 'grape', 'el-icon-grape', 'icon');
INSERT INTO `sys_dict` VALUES (269, 'watermelon', 'el-icon-watermelon', 'icon');
INSERT INTO `sys_dict` VALUES (270, 'cherry', 'el-icon-cherry', 'icon');
INSERT INTO `sys_dict` VALUES (271, 'apple', 'el-icon-apple', 'icon');
INSERT INTO `sys_dict` VALUES (272, 'pear', 'el-icon-pear', 'icon');
INSERT INTO `sys_dict` VALUES (273, 'orange', 'el-icon-orange', 'icon');
INSERT INTO `sys_dict` VALUES (274, 'ice-tea', 'el-icon-ice-tea', 'icon');
INSERT INTO `sys_dict` VALUES (275, 'ice-drink', 'el-icon-ice-drink', 'icon');
INSERT INTO `sys_dict` VALUES (276, 'milk-tea', 'el-icon-milk-tea', 'icon');
INSERT INTO `sys_dict` VALUES (277, 'potato-strips', 'el-icon-potato-strips', 'icon');
INSERT INTO `sys_dict` VALUES (278, 'lollipop', 'el-icon-lollipop', 'icon');
INSERT INTO `sys_dict` VALUES (279, 'ice-cream-square', 'el-icon-ice-cream-square', 'icon');
INSERT INTO `sys_dict` VALUES (280, 'ice-cream-round', 'el-icon-ice-cream-round', 'icon');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint(20) NULL DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (1, '2.PNG', 'PNG', 256, 'http://localhost:9090/file/3f9601015d844a49bd0d664b88027820.PNG', 'c54079461fc29ba766b289fcb1928b24', 0, 1);
INSERT INTO `sys_file` VALUES (2, '第20页-47.PNG', 'PNG', 840, 'http://localhost:9090/file/181077696e8c4ed287a73e3c7bdf6fd2.PNG', '564fd5e947630f98265df12a99af3513', 1, 1);
INSERT INTO `sys_file` VALUES (3, '1.PNG', 'PNG', 891, 'http://localhost:9090/file/dcb613c7b87a434fa0ed59029c9d25f5.PNG', 'd249a2f506056f2065691dfc5f31d41f', 0, 1);
INSERT INTO `sys_file` VALUES (4, '2.jpg', 'jpg', 843, 'http://localhost:9090/file/78ce19d5efb842509992389e6630b061.jpg', '3641e97b0751367c1f27ee0d9ed16145', 0, 1);
INSERT INTO `sys_file` VALUES (5, '第20页-48.PNG', 'PNG', 296, 'http://localhost:9090/file/493b61ea9bbb400b94ef5e928832bdd5.PNG', '33c09ab2d44d3e1ddd48829edb02a987', 1, 1);
INSERT INTO `sys_file` VALUES (6, '第8页-20.PNG', 'PNG', 144, 'http://localhost:9090/file/10686472b4374a618f9236eab8371244.PNG', '9ccd3dffa47c381891b6566fceb88884', 0, 1);
INSERT INTO `sys_file` VALUES (7, '第8页-20.PNG', 'PNG', 144, 'http://localhost:9090/file/10686472b4374a618f9236eab8371244.PNG', '9ccd3dffa47c381891b6566fceb88884', 1, 1);
INSERT INTO `sys_file` VALUES (8, '第16页-37.PNG', 'PNG', 330, 'http://localhost:9090/file/7776b39838a947d5b9324a17ae7d793d.PNG', '6eab0cff1ba8d79646c16fe82f509b83', 1, 1);
INSERT INTO `sys_file` VALUES (9, '第20页-48.PNG', 'PNG', 296, 'http://localhost:9090/file/493b61ea9bbb400b94ef5e928832bdd5.PNG', '33c09ab2d44d3e1ddd48829edb02a987', 0, 1);
INSERT INTO `sys_file` VALUES (10, 'iali9.jpg', 'jpg', 470, 'http://localhost:9090/file/22b59384e9364450bfade4c56b4bda55.jpg', '1847b49243c4e0440beeec36097931ef', 0, 1);
INSERT INTO `sys_file` VALUES (11, '第16页-37.PNG', 'PNG', 330, 'http://localhost:9090/file/7776b39838a947d5b9324a17ae7d793d.PNG', '6eab0cff1ba8d79646c16fe82f509b83', 0, 1);
INSERT INTO `sys_file` VALUES (12, '1.PNG', 'PNG', 891, 'http://localhost:9090/file/dcb613c7b87a434fa0ed59029c9d25f5.PNG', 'd249a2f506056f2065691dfc5f31d41f', 0, 1);
INSERT INTO `sys_file` VALUES (13, '第20页-48.PNG', 'PNG', 296, 'http://localhost:9090/file/493b61ea9bbb400b94ef5e928832bdd5.PNG', '33c09ab2d44d3e1ddd48829edb02a987', 0, 1);
INSERT INTO `sys_file` VALUES (14, '第8页-20.PNG', 'PNG', 144, 'http://localhost:9090/file/10686472b4374a618f9236eab8371244.PNG', '9ccd3dffa47c381891b6566fceb88884', 1, 1);
INSERT INTO `sys_file` VALUES (15, '2.jpg', 'jpg', 843, 'http://localhost:9090/file/78ce19d5efb842509992389e6630b061.jpg', '3641e97b0751367c1f27ee0d9ed16145', 0, 1);
INSERT INTO `sys_file` VALUES (16, '第8页-20.PNG', 'PNG', 144, 'http://localhost:9090/file/10686472b4374a618f9236eab8371244.PNG', '9ccd3dffa47c381891b6566fceb88884', 0, 1);
INSERT INTO `sys_file` VALUES (17, '第20页-48.PNG', 'PNG', 296, 'http://localhost:9090/file/493b61ea9bbb400b94ef5e928832bdd5.PNG', '33c09ab2d44d3e1ddd48829edb02a987', 0, 1);
INSERT INTO `sys_file` VALUES (18, '第8页-20.PNG', 'PNG', 144, 'http://localhost:9090/file/10686472b4374a618f9236eab8371244.PNG', '9ccd3dffa47c381891b6566fceb88884', 0, 1);
INSERT INTO `sys_file` VALUES (19, '第6页-14.PNG', 'PNG', 337, 'http://localhost:9090/file/c70ddf8dd99d495db1bc7518d2db4cd4.PNG', '7b2d1e86dda8486a5dd06a0b450cda3a', 0, 1);
INSERT INTO `sys_file` VALUES (20, '2.jpg', 'jpg', 843, 'http://localhost:9090/file/78ce19d5efb842509992389e6630b061.jpg', '3641e97b0751367c1f27ee0d9ed16145', 0, 1);
INSERT INTO `sys_file` VALUES (21, '第8页-20.PNG', 'PNG', 144, 'http://localhost:9090/file/10686472b4374a618f9236eab8371244.PNG', '9ccd3dffa47c381891b6566fceb88884', 0, 1);
INSERT INTO `sys_file` VALUES (22, '第6页-14.PNG', 'PNG', 337, 'http://localhost:9090/file/c70ddf8dd99d495db1bc7518d2db4cd4.PNG', '7b2d1e86dda8486a5dd06a0b450cda3a', 0, 1);
INSERT INTO `sys_file` VALUES (23, '2.jpg', 'jpg', 843, 'http://localhost:9090/file/78ce19d5efb842509992389e6630b061.jpg', '3641e97b0751367c1f27ee0d9ed16145', 0, 1);
INSERT INTO `sys_file` VALUES (24, '2.jpg', 'jpg', 843, 'http://localhost:9090/file/78ce19d5efb842509992389e6630b061.jpg', '3641e97b0751367c1f27ee0d9ed16145', 0, 1);
INSERT INTO `sys_file` VALUES (25, '第21页-49.PNG', 'PNG', 1056, 'http://localhost:9090/file/779243ce9cbb4bc6a9ef2e881cf27b0c.PNG', '04d5d588201042259614cfeeaa62447f', 0, 1);
INSERT INTO `sys_file` VALUES (26, '第8页-20.PNG', 'PNG', 144, 'http://localhost:9090/file/10686472b4374a618f9236eab8371244.PNG', '9ccd3dffa47c381891b6566fceb88884', 0, 1);
INSERT INTO `sys_file` VALUES (27, '2.PNG', 'PNG', 256, 'http://localhost:9090/file/3f9601015d844a49bd0d664b88027820.PNG', 'c54079461fc29ba766b289fcb1928b24', 0, 1);
INSERT INTO `sys_file` VALUES (28, '第20页-48.PNG', 'PNG', 296, 'http://localhost:9090/file/493b61ea9bbb400b94ef5e928832bdd5.PNG', '33c09ab2d44d3e1ddd48829edb02a987', 0, 1);
INSERT INTO `sys_file` VALUES (29, '第16页-37.PNG', 'PNG', 330, 'http://localhost:9090/file/7776b39838a947d5b9324a17ae7d793d.PNG', '6eab0cff1ba8d79646c16fe82f509b83', 0, 1);
INSERT INTO `sys_file` VALUES (30, '第19页-45.PNG', 'PNG', 668, 'http://localhost:9090/file/be0906d922464f1c8585d232bc712a05.PNG', '1ddeaf2cc58abd476e26a5b86874add2', 0, 1);
INSERT INTO `sys_file` VALUES (31, 'R-C.jpg', 'jpg', 373, 'http://localhost:9090/file/b5c0868ca09e45ebacbab57bd4423d35.jpg', '0a9d3cdd8b8ce0c83ba661297779d26b', 0, 1);
INSERT INTO `sys_file` VALUES (32, 'R-C.jpg', 'jpg', 373, 'http://localhost:9090/file/b5c0868ca09e45ebacbab57bd4423d35.jpg', '0a9d3cdd8b8ce0c83ba661297779d26b', 0, 1);
INSERT INTO `sys_file` VALUES (33, '4.PNG', 'PNG', 537, 'http://localhost:9090/file/d2cee5d0d8c74f76a3f453fc38eb7207.PNG', '4506dff7b8445f08ee942b3211f44e8e', 0, 1);
INSERT INTO `sys_file` VALUES (34, '9.PNG', 'PNG', 575, 'http://localhost:9090/file/c4f48556dd8a4aed957074750a7e0ed1.PNG', 'c1b430df6abc2f76294dfbdaccffd072', 0, 1);
INSERT INTO `sys_file` VALUES (35, '第14页-33.PNG', 'PNG', 1282, 'http://localhost:9090/file/45296e9c1c30425c9865fc35df9533ff.PNG', '071347e07443832a11117ea69817a522', 0, 1);
INSERT INTO `sys_file` VALUES (36, '第7页-19.PNG', 'PNG', 1401, 'http://localhost:9090/file/4eb52f1463ec497cbfee99ece5c07c23.PNG', '06386f53fcd2dfffd2261613cbacd05e', 0, 1);
INSERT INTO `sys_file` VALUES (37, '第13页-31.PNG', 'PNG', 476, 'http://localhost:9090/file/e0aeb6f85b424f95bd2e73edebb2f80e.PNG', '794f9c0f92dd7ef9a3b02905713d895e', 0, 1);
INSERT INTO `sys_file` VALUES (38, '8.PNG', 'PNG', 527, 'http://localhost:9090/file/e09450049866464d813d20b5ecbffd2d.PNG', '50e6aac6e7b89b6702f218cf6cfb02d8', 0, 1);
INSERT INTO `sys_file` VALUES (39, '第8页-20.PNG', 'PNG', 144, 'http://localhost:9090/file/10686472b4374a618f9236eab8371244.PNG', '9ccd3dffa47c381891b6566fceb88884', 0, 1);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `sort_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (4, '系统管理', NULL, 'el-icon-s-grid', NULL, NULL, NULL, 201);
INSERT INTO `sys_menu` VALUES (5, '用户管理', '/user', 'el-icon-user', NULL, 4, 'User', 301);
INSERT INTO `sys_menu` VALUES (6, '角色管理', '/role', 'el-icon-s-custom', NULL, 4, 'Role', 302);
INSERT INTO `sys_menu` VALUES (7, '菜单管理', '/menu', 'el-icon-menu', NULL, 4, 'Menu', 303);
INSERT INTO `sys_menu` VALUES (8, '文件管理', '/file', 'el-icon-document', NULL, 4, 'File', 304);
INSERT INTO `sys_menu` VALUES (10, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home', 0);
INSERT INTO `sys_menu` VALUES (11, '手机借阅', '/message', 'el-icon-menu', NULL, NULL, 'Message', 999);
INSERT INTO `sys_menu` VALUES (15, '设备信息', '', 'el-icon-shopping-bag-1', NULL, NULL, '', 200);
INSERT INTO `sys_menu` VALUES (16, '设备管理', '/course', 'el-icon-collection-tag', NULL, 15, 'Course', NULL);
INSERT INTO `sys_menu` VALUES (17, '公告信息', '/notice', 'el-icon-message', NULL, NULL, 'Notice', 999);
INSERT INTO `sys_menu` VALUES (19, '设备总览', '/equip', 'el-icon-s-data', NULL, 15, 'Equip', NULL);
INSERT INTO `sys_menu` VALUES (22, '设备分类管理', NULL, 'el-icon-s-shop', NULL, NULL, NULL, 199);
INSERT INTO `sys_menu` VALUES (23, '设备分类添加', '/categoryAdd', 'el-icon-circle-plus', NULL, 22, 'CategoryAdd', NULL);
INSERT INTO `sys_menu` VALUES (24, '设备分类列表', '/categoryList', 'el-icon-date', NULL, 22, 'CategoryList', NULL);
INSERT INTO `sys_menu` VALUES (26, '设备管理', NULL, 'el-icon-document-copy', NULL, NULL, NULL, 200);
INSERT INTO `sys_menu` VALUES (27, '设备添加', '/equipAdd', 'el-icon-circle-plus', NULL, 26, 'EquipAdd', NULL);
INSERT INTO `sys_menu` VALUES (28, '设备列表', '/equipList', 'el-icon-document', NULL, 26, 'EquipList', NULL);
INSERT INTO `sys_menu` VALUES (29, '借阅管理', NULL, 'el-icon-phone', NULL, NULL, NULL, 200);
INSERT INTO `sys_menu` VALUES (30, '借阅添加', '/borrowAdd', 'el-icon-circle-plus', NULL, 29, 'BorrowAdd', NULL);
INSERT INTO `sys_menu` VALUES (31, '借阅列表', '/borrowList', 'el-icon-more', NULL, 29, 'BorrowList', NULL);
INSERT INTO `sys_menu` VALUES (32, '文章管理', '/article', 'el-icon-s-order', NULL, NULL, 'Article', 999);
INSERT INTO `sys_menu` VALUES (33, '设备报修', '/goods', 'el-icon-refresh', NULL, 15, 'Goods', NULL);
INSERT INTO `sys_menu` VALUES (34, '还设备管理', NULL, 'el-icon-s-claim', NULL, NULL, NULL, 200);
INSERT INTO `sys_menu` VALUES (35, '还设备列表', '/returList', 'el-icon-scissors', NULL, 34, 'ReturList', NULL);
INSERT INTO `sys_menu` VALUES (36, '借阅总览', '/homeview', 'el-icon-s-flag', NULL, NULL, 'HomeView', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` VALUES (2, '学生', '普通用户', 'ROLE_STUDENT');
INSERT INTO `sys_role` VALUES (6, '老师', '老师', 'ROLE_TEACHER');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 22);
INSERT INTO `sys_role_menu` VALUES (1, 23);
INSERT INTO `sys_role_menu` VALUES (1, 24);
INSERT INTO `sys_role_menu` VALUES (1, 26);
INSERT INTO `sys_role_menu` VALUES (1, 27);
INSERT INTO `sys_role_menu` VALUES (1, 28);
INSERT INTO `sys_role_menu` VALUES (1, 29);
INSERT INTO `sys_role_menu` VALUES (1, 30);
INSERT INTO `sys_role_menu` VALUES (1, 31);
INSERT INTO `sys_role_menu` VALUES (1, 33);
INSERT INTO `sys_role_menu` VALUES (1, 34);
INSERT INTO `sys_role_menu` VALUES (1, 35);
INSERT INTO `sys_role_menu` VALUES (1, 36);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 8);
INSERT INTO `sys_role_menu` VALUES (2, 15);
INSERT INTO `sys_role_menu` VALUES (2, 16);
INSERT INTO `sys_role_menu` VALUES (2, 19);
INSERT INTO `sys_role_menu` VALUES (2, 29);
INSERT INTO `sys_role_menu` VALUES (2, 30);
INSERT INTO `sys_role_menu` VALUES (2, 31);
INSERT INTO `sys_role_menu` VALUES (2, 33);
INSERT INTO `sys_role_menu` VALUES (6, 10);
INSERT INTO `sys_role_menu` VALUES (6, 11);
INSERT INTO `sys_role_menu` VALUES (6, 17);
INSERT INTO `sys_role_menu` VALUES (7, 11);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'admin', '管理员', '3102528743@qq.com', '13988997788', '180', '2022-01-22 21:10:27', 'http://localhost:9090/file/493b61ea9bbb400b94ef5e928832bdd5.PNG', 'ROLE_ADMIN');
INSERT INTO `sys_user` VALUES (2, 'zhang', '123', '张张1111', 'zhang@qq.com', '13677889900', '南京', '2022-02-26 22:10:14', NULL, 'ROLE_TEACHER');
INSERT INTO `sys_user` VALUES (3, 'wang', '123', '我是王五', 'wang@qq.com', '13877668855', '上海', '2022-02-26 22:10:18', 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', 'ROLE_TEACHER');
INSERT INTO `sys_user` VALUES (5, '金河同学', '123', 'jinhe', NULL, NULL, NULL, '2022-10-16 22:00:20', 'http://localhost:9090/file/10686472b4374a618f9236eab8371244.PNG', 'ROLE_STUDENT');
INSERT INTO `sys_user` VALUES (6, '魏同学', '123456', 'nana', NULL, NULL, NULL, '2022-10-16 22:03:14', 'http://localhost:9090/file/e0aeb6f85b424f95bd2e73edebb2f80e.PNG', 'ROLE_STUDENT');
INSERT INTO `sys_user` VALUES (7, 'jinhe110', '123', 'jinhe110', NULL, NULL, NULL, '2022-10-17 12:31:07', NULL, 'ROLE_TEACHER');
INSERT INTO `sys_user` VALUES (8, 'jin', '123', '123', NULL, NULL, NULL, '2022-10-19 09:38:33', NULL, 'ROLE_STUDENT');
INSERT INTO `sys_user` VALUES (9, 'wei', '123', 'wei', NULL, NULL, NULL, '2022-10-19 16:23:41', NULL, 'ROLE_STUDENT');
INSERT INTO `sys_user` VALUES (10, 'he00', '123', 'he00', NULL, NULL, NULL, '2022-10-19 16:25:36', NULL, 'ROLE_STUDENT');
INSERT INTO `sys_user` VALUES (12, '金河1', '123456', '金河1', '3102528744@qq.com', NULL, NULL, '2022-10-27 16:44:29', 'http://localhost:9090/file/10686472b4374a618f9236eab8371244.PNG', 'ROLE_STUDENT');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` int(11) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论内容',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '评论id',
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论时间',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父亲id',
  `origin_id` int(11) NULL DEFAULT NULL COMMENT '最上级评论',
  `article_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (-1939800062, '1', NULL, NULL, NULL, NULL, 2);
INSERT INTO `t_comment` VALUES (937492482, '1', NULL, NULL, NULL, NULL, 2);
INSERT INTO `t_comment` VALUES (2120286210, NULL, NULL, NULL, NULL, NULL, 2);

-- ----------------------------
-- Table structure for validation
-- ----------------------------
DROP TABLE IF EXISTS `validation`;
CREATE TABLE `validation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '验证码',
  `type` int(1) NULL DEFAULT NULL COMMENT '验证类型',
  `time` timestamp NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of validation
-- ----------------------------
INSERT INTO `validation` VALUES (7, '3102528743@qq.com', '9813', 2, '2022-10-23 18:33:59');
INSERT INTO `validation` VALUES (9, '3102528743@qq.com', '3756', 1, '2022-10-27 16:28:58');

SET FOREIGN_KEY_CHECKS = 1;
