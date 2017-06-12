/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50528
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-06-11 14:43:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accordion
-- ----------------------------
DROP TABLE IF EXISTS accordion;
CREATE TABLE accordion (
  id varchar(36) NOT NULL,
  name varchar(100) DEFAULT NULL,
  iconCls varchar(100) DEFAULT NULL,
  href varchar(255) DEFAULT NULL,
  parent varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accordion
-- ----------------------------
INSERT INTO `accordion` VALUES ('1', '上师管理', 'icon-user_brown', null, '0');
INSERT INTO `accordion` VALUES ('11', '上师信息', 'icon-user_suit', '/page/main/user/showAll.jsp', '1');
INSERT INTO `accordion` VALUES ('2', '用户管理', 'icon-user_gray_cool', null, '0');
INSERT INTO `accordion` VALUES ('21', '用户信息', 'icon-user', '/page/main/user/showAll.jsp', '2');
INSERT INTO `accordion` VALUES ('22', '用户反馈', 'icon-chart_curve', 'index.jsp', '2');
INSERT INTO `accordion` VALUES ('3', '图片管理', 'icon-picture', null, '0');
INSERT INTO `accordion` VALUES ('31', '轮播图', 'icon-bullet_picture', 'index.jsp', '3');
INSERT INTO `accordion` VALUES ('4', '专辑管理', 'icon-music', null, '0');
INSERT INTO `accordion` VALUES ('41', '专辑列表', 'icon-application_view_list', 'index.jsp', '4');
INSERT INTO `accordion` VALUES ('42', '专辑文件', 'icon-application_view_tile', 'index.jsp', '4');
INSERT INTO `accordion` VALUES ('5', '文章管理', 'icon-page_white_word', null, '0');
INSERT INTO `accordion` VALUES ('51', '显密法要', 'icon-page_white_coldfusion', 'index.jsp', '5');
INSERT INTO `accordion` VALUES ('52', '上师言教', 'icon-page_white_swoosh', 'index.jsp', '5');
INSERT INTO `accordion` VALUES ('53', '文章关系', 'icon-text_letter_omega', 'index.jsp', '5');
INSERT INTO `accordion` VALUES ('6', '功课记录', 'icon-clipboard', null, '0');
INSERT INTO `accordion` VALUES ('61', '记录类型', 'icon-chart_bar', 'index.jsp', '6');
INSERT INTO `accordion` VALUES ('62', '对应计数', 'icon-chart_bar_link', 'index.jsp', '6');
INSERT INTO `accordion` VALUES ('7', '位置管理', 'icon-coolite', null, '0');
INSERT INTO `accordion` VALUES ('71', '省市信息', 'icon-bookmark', 'index.jsp', '7');
INSERT INTO `accordion` VALUES ('72', '地区信息', 'icon-bookmark', 'index.jsp', '7');
INSERT INTO `accordion` VALUES ('8', '系统管理', 'icon-bullet_wrench', null, '0');
INSERT INTO `accordion` VALUES ('81', '系统日志', 'icon-page_white_text', 'index.jsp', '8');
INSERT INTO `accordion` VALUES ('82', '数据备份', 'icon-database_yellow', 'index.jsp', '8');
INSERT INTO `accordion` VALUES ('83', '清除缓存', 'icon-database_refresh', 'index.jsp', '8');
