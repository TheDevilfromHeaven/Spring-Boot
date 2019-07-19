/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : mysterygame

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 25/06/2019 16:32:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `register_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('111', 'CYYrBfG2xO7KxuKg2fDS8n9+eZKmSFevWQR/HQ==', '2019-05-24 14:54:07');
INSERT INTO `admin` VALUES ('123', 'Mh0YXg4uj8zw4cPzURNoMyV7Xit68CgAz6jnPA==', '2019-05-24 14:52:13');

-- ----------------------------
-- Table structure for admin_info
-- ----------------------------
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info`  (
  `admin_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_haed_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE,
  INDEX `admin_name`(`admin_name`) USING BTREE,
  CONSTRAINT `admin_info_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for all_game
-- ----------------------------
DROP TABLE IF EXISTS `all_game`;
CREATE TABLE `all_game`  (
  `game_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_type_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`game_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of all_game
-- ----------------------------
INSERT INTO `all_game` VALUES (1, '手游');
INSERT INTO `all_game` VALUES (2, '网游');
INSERT INTO `all_game` VALUES (3, '单机');
INSERT INTO `all_game` VALUES (4, '棋牌');

-- ----------------------------
-- Table structure for chess_game
-- ----------------------------
DROP TABLE IF EXISTS `chess_game`;
CREATE TABLE `chess_game`  (
  `game_type_id` int(11) NOT NULL,
  `game_name_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_name_original` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_name_other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_platform` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_developers` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_lssue_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_player_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_screen` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `game_type_id`(`game_type_id`) USING BTREE,
  CONSTRAINT `chess_game_ibfk_1` FOREIGN KEY (`game_type_id`) REFERENCES `all_game` (`game_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chess_game
-- ----------------------------
INSERT INTO `chess_game` VALUES (4, '中国象棋', '中国象棋', 'Chinese chess', '棋牌', 'ios、Android', '腾讯游戏', '腾讯游戏', '2012年4月2日', '两人', '2D', '/img/qingpai/d11.jpg', '中国象棋使用方形格状棋盘及红黑二色圆形棋子进行对弈，棋盘上有十条横线、九条竖线共分成90个交叉点；中国象棋的棋子共有32个，每种颜色16个棋子，分为7个兵种，摆放和活动在交叉点上。双方交替行棋，先把对方的将（帅）“将死”的一方获胜（因为擒贼先擒王）。已有几千年历史、充满东方智慧的中国象棋在中国的群众中基础远远超过围棋，一直是普及最广的棋类项目。');
INSERT INTO `chess_game` VALUES (4, '欢乐斗地主', '欢乐斗地主', '欢乐斗地主', '棋牌', 'ios、Android', '腾讯游戏', '腾讯游戏', '2008年4月1日', '3人', '2D', '/img/qingpai/qp1.jpg', '《欢乐斗地主》是腾讯移动游戏平台的首款实时对战棋牌手游，是根据扑克牌游戏“跑得快”改编而成的三人游戏。通过扑克牌来决定游戏的胜负。该游戏于2008年4月发布。《斗地主》最初流行于湖北武汉、汉阳区，两个农民联合对抗一名地主，由于其规则简单、娱乐性强，迅速风靡全国。《欢乐斗地主》是在传统规则的基础上，引入\"欢乐豆\"积分，并且增加抢地主、明牌、癞子等一系列新玩法，而推出的一款更紧张刺激、更富于变化的\"斗地主\"游戏。');
INSERT INTO `chess_game` VALUES (4, '欢乐斗牛', '欢乐斗牛', '欢乐斗牛', '棋牌', 'ios、Android', '腾讯游戏', '腾讯游戏', '2010年4月1日', '多人', '2D', '/img/qingpai/qp2.jpg', '《欢乐斗牛》是由腾讯公司开发的一款桌面休闲扑克牌游戏，是一款地方性、游戏速度极快、刺激的棋牌游戏，主要流行在湖南、广东、广西地区。《欢乐斗牛》因为在线玩家多，玩法简单，斗智斗勇，博得很多玩家的喜欢。瞬间即可让你体验到无穷乐趣，除合入原汁原味的地方性斗牛玩法，欢乐斗牛分为：看牌抢庄、随机庄家、世界大战。');
INSERT INTO `chess_game` VALUES (4, '欢乐麻将', '欢乐麻将', '欢乐麻将', '棋牌', 'ios、Android', '腾讯游戏', '腾讯游戏', '2014年', '多人', '2D', '/img/qingpai/qp3.jpg', '《欢乐麻将》是腾讯游戏出品的一款经典手机游戏。玩的局数越多积分越高，获胜的局数越多，积分也越高，在“胜局积分”中的排行也越高，可以展示自己的牌技与成绩。游戏目前使用国标计番规则，胡牌简单。');
INSERT INTO `chess_game` VALUES (4, '三国杀', '三国杀', '三国杀', '棋牌', 'ios、Android', '中国传媒大学', '中国传媒大学', '2008年1月1日', '多人', '2D', '/img/qingpai/d15.jpg', '《三国杀》是中国传媒大学动画学院2004级游戏专业学生设计，由北京游卡桌游文化发展有限公司出版发行的一款热门的桌上游戏，并在2009年6月底由杭州边锋网络技术有限公司开发出网络游戏。该游戏融合了西方类似游戏的特点，并结合中国三国时期背景，以身份、势力或阵营等为线索，以卡牌为形式，合纵连横，经过一轮一轮的谋略和动作获得最终的胜利。三国杀集合历史、文学、美术等元素于一身，在中国广受欢迎。');
INSERT INTO `chess_game` VALUES (4, '狼人杀', '狼人杀', '狼人杀', '棋牌', 'ios、Android', '文化传媒有限公司', '文化传媒有限公司', '2010年', '6-18人', '2D', '/img/qingpai/qp4.jpg', '狼人杀，是一款多人参与的、以语言描述推动的、较量口才和分析判断能力的策略类桌面游戏，通常的版本需要4-18人参与。狼人杀桌面游戏2010年由北京大魔王桌游俱乐部出版发行，现在由狼人杀（海南）文化传媒有限公司出版发行。狼人杀游戏的机制与杀人游戏相类似，杀人游戏更倾向于竞技，狼人杀游戏则更加欢乐，角色更丰富。游戏分为两大阵营：狼人阵营和村民阵营。全部狼人出局，村民阵营胜利；全部神职或全部平民出局，狼人阵营胜利。');
INSERT INTO `chess_game` VALUES (4, '天天军旗', '天天军旗', '天天军旗', '棋牌', 'ios、Android', '腾讯游戏', '腾讯游戏', '2007年1月1日', '单人', '2D', '/img/qingpai/qp5.jpg', '天天军棋包括四种玩法：四国暗棋，四国明棋，单挑暗棋，赛事，好友对战玩家可选择喜欢的玩法，系统会随机分配水平相当的玩家进行对战；在对战中可提高自己的游戏等级和金币数量。');

-- ----------------------------
-- Table structure for come_soon
-- ----------------------------
DROP TABLE IF EXISTS `come_soon`;
CREATE TABLE `come_soon`  (
  `table_id` int(11) NOT NULL,
  `game_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `table_id`(`table_id`) USING BTREE,
  CONSTRAINT `come_soon_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `ranking_list` (`table_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of come_soon
-- ----------------------------
INSERT INTO `come_soon` VALUES (3, '剑网3', '/img/weifa/33.jpg');
INSERT INTO `come_soon` VALUES (3, '仙剑奇侠传七', '/img/weifa/wf1.jpg');
INSERT INTO `come_soon` VALUES (3, '幽灵行动：断点', '/img/weifa/wf2.jpg');
INSERT INTO `come_soon` VALUES (3, '赛博朋克2077', '/img/weifa/wf3.jpg');
INSERT INTO `come_soon` VALUES (3, '无主之地3', '/img/weifa/wf4.jpg');
INSERT INTO `come_soon` VALUES (3, '战锤：混沌祸根', '/img/weifa/wf5.jpg');
INSERT INTO `come_soon` VALUES (3, '血污：夜之仪式', '/img/weifa/wf6.jpg');
INSERT INTO `come_soon` VALUES (3, '沉没之城', '/img/weifa/wf7.jpg');
INSERT INTO `come_soon` VALUES (3, '莎木3', '/img/weifa/wf8.jpg');
INSERT INTO `come_soon` VALUES (3, '最后生还者：第二部', '/img/weifa/wf9.jpg');

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum`  (
  `forum_id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `forum_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`forum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES (1, '推荐', 'post_recommend', 'recommend.jpg');
INSERT INTO `forum` VALUES (2, '网游区', 'post_online_game', 'OL.jpg');
INSERT INTO `forum` VALUES (3, '单机区', 'post_single_play_game', 'SP.jpg');
INSERT INTO `forum` VALUES (4, '手游区', 'post_phone_game', 'Phone.jpg');

-- ----------------------------
-- Table structure for hot_game_list
-- ----------------------------
DROP TABLE IF EXISTS `hot_game_list`;
CREATE TABLE `hot_game_list`  (
  `table_id` int(11) NOT NULL,
  `game_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `table_id`(`table_id`) USING BTREE,
  CONSTRAINT `hot_game_list_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `ranking_list` (`table_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hot_game_list
-- ----------------------------
INSERT INTO `hot_game_list` VALUES (1, '英雄联盟', '/img/re/9.jpg');
INSERT INTO `hot_game_list` VALUES (1, '地下城与勇士', '/img/re/11.jpg');
INSERT INTO `hot_game_list` VALUES (1, '绝地求生', '/img/re/13.jpg');
INSERT INTO `hot_game_list` VALUES (1, '穿越火线', '/img/re/45.jpg');
INSERT INTO `hot_game_list` VALUES (1, '王者荣耀', '/img/re/s5.jpg');
INSERT INTO `hot_game_list` VALUES (1, '阴阳师', '/img/re/s7.jpg');
INSERT INTO `hot_game_list` VALUES (1, '第五人格', '/img/re/d3.jpg');
INSERT INTO `hot_game_list` VALUES (1, '开心消消乐', '/img/re/d5.jpg');
INSERT INTO `hot_game_list` VALUES (1, '植物大战僵尸', '/img/re/d35.jpg');
INSERT INTO `hot_game_list` VALUES (1, '拳皇', '/img/re/d39.jpg');

-- ----------------------------
-- Table structure for interest
-- ----------------------------
DROP TABLE IF EXISTS `interest`;
CREATE TABLE `interest`  (
  `user_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `interest_game` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `insert_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `interest_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of interest
-- ----------------------------
INSERT INTO `interest` VALUES ('111', '三国杀', '2019-06-01 17:24:47');
INSERT INTO `interest` VALUES ('111', '阴阳师', '2019-06-01 17:24:53');
INSERT INTO `interest` VALUES ('111', '王者荣耀', '2019-06-14 17:39:43');
INSERT INTO `interest` VALUES ('15277402877', '阴阳师', '2019-06-15 15:02:59');
INSERT INTO `interest` VALUES ('111', '命运－冠位指定', '2019-06-16 15:21:27');
INSERT INTO `interest` VALUES ('111', '生化危机2重制版 ', '2019-06-16 16:13:03');
INSERT INTO `interest` VALUES ('15277402877', '楚留香', '2019-06-16 16:25:01');
INSERT INTO `interest` VALUES ('15211111111', '崩坏3', '2019-06-18 15:21:25');
INSERT INTO `interest` VALUES ('15211111111', '楚留香', '2019-06-18 15:23:55');
INSERT INTO `interest` VALUES ('15211111111', '王者荣耀', '2019-06-18 15:27:33');
INSERT INTO `interest` VALUES ('15211111111', '阴阳师', '2019-06-18 15:27:44');
INSERT INTO `interest` VALUES ('15277402877', '生化危机2重制版 ', '2019-06-18 15:51:29');
INSERT INTO `interest` VALUES ('15277402877', '王者荣耀', '2019-06-18 16:39:37');
INSERT INTO `interest` VALUES ('111', '梦幻模拟战', '2019-06-22 09:10:43');
INSERT INTO `interest` VALUES ('111', '碧蓝航线', '2019-06-22 09:11:11');

-- ----------------------------
-- Table structure for new
-- ----------------------------
DROP TABLE IF EXISTS `new`;
CREATE TABLE `new`  (
  `new_id` int(11) NOT NULL AUTO_INCREMENT,
  `new_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `new_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `new_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `new_author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `new_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`new_id`) USING BTREE,
  INDEX `new_author`(`new_author`) USING BTREE,
  CONSTRAINT `new_ibfk_1` FOREIGN KEY (`new_author`) REFERENCES `admin_info` (`admin_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of new
-- ----------------------------
INSERT INTO `new` VALUES (1, '开启预加载资源，告别切包卡顿', '/new/穿越火线.txt', NULL, NULL, '2019-05-29 09:38:08');
INSERT INTO `new` VALUES (2, '峡谷之巅第四赛季即将结束', '/new/英雄联盟.txt', NULL, NULL, '2019-05-29 09:38:22');
INSERT INTO `new` VALUES (3, '新职业预约正式开始 剑影&小魔女登场', '/new/地下城与勇士.txt', NULL, NULL, '2019-05-29 09:38:29');
INSERT INTO `new` VALUES (4, '《头号玩家》致“竞”燃魂赛事！《魂斗罗：归来》邀您一同观影', '/new/魂斗罗：归来.txt', NULL, NULL, '2019-05-29 09:39:12');
INSERT INTO `new` VALUES (5, '撼地者至宝献礼TI9 “天外飞星”今日加入游戏', '/new/刀塔2.txt', NULL, NULL, '2019-05-29 09:39:22');
INSERT INTO `new` VALUES (6, '天狼狩猎者预定活动', '/new/王者荣耀.txt', NULL, NULL, '2019-05-29 09:39:38');
INSERT INTO `new` VALUES (7, '[OL][活动] 5.24-5.30 新品皮肤&壕将秒杀 强将张绣抢先体验', '/new/三国杀.txt', NULL, NULL, '2019-05-29 09:39:44');
INSERT INTO `new` VALUES (8, '欧莉蒂斯庄园童趣时刻 《第五人格》儿童节活动开启！', '/new/第五人格.txt', NULL, NULL, '2019-06-16 09:34:52');
INSERT INTO `new` VALUES (9, '狼神登场 《剑灵》拳师新派系超级觉醒开启', '/new/剑灵.txt', NULL, NULL, '2019-06-16 09:36:18');
INSERT INTO `new` VALUES (10, '群雄逐鹿天地间！《梦幻西游》电脑版群雄逐鹿精英争霸赛精彩赛事盘点', '/new/梦幻西游.txt', NULL, NULL, '2019-06-16 09:37:28');
INSERT INTO `new` VALUES (11, '天刀四周年盛典落幕 年中爆料全程高能', '/new/天涯明月刀.txt', NULL, NULL, '2019-06-16 09:40:46');
INSERT INTO `new` VALUES (12, '必不可少又超难获得的五个物品！你开局半小时能有几个？', '/new/我的世界.txt', NULL, NULL, '2019-06-16 09:42:15');
INSERT INTO `new` VALUES (13, '忠叛随 黯潮涌《阴阳师》全新式神海忍现身！', '/new/阴阳师.txt', NULL, NULL, '2019-06-16 09:43:26');

-- ----------------------------
-- Table structure for new_game_list
-- ----------------------------
DROP TABLE IF EXISTS `new_game_list`;
CREATE TABLE `new_game_list`  (
  `table_id` int(11) NOT NULL,
  `game_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `table_id`(`table_id`) USING BTREE,
  CONSTRAINT `new_game_list_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `ranking_list` (`table_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of new_game_list
-- ----------------------------
INSERT INTO `new_game_list` VALUES (2, '八方旅人', '');
INSERT INTO `new_game_list` VALUES (2, '只狼：影逝二度', '');
INSERT INTO `new_game_list` VALUES (2, '鬼泣5', '');
INSERT INTO `new_game_list` VALUES (2, '全面战争：三国', '');
INSERT INTO `new_game_list` VALUES (2, '瘟疫传说：无罪', NULL);
INSERT INTO `new_game_list` VALUES (2, '无主之地3', NULL);
INSERT INTO `new_game_list` VALUES (2, '全境封锁2', NULL);
INSERT INTO `new_game_list` VALUES (2, '明日方舟2', NULL);
INSERT INTO `new_game_list` VALUES (2, '剑网3:指尖江湖', NULL);

-- ----------------------------
-- Table structure for online_game
-- ----------------------------
DROP TABLE IF EXISTS `online_game`;
CREATE TABLE `online_game`  (
  `game_type_id` int(11) NOT NULL,
  `game_name_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_name_original` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_name_other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_platform` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_developers` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_lssue_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_player_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_screen` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `game_type_id`(`game_type_id`) USING BTREE,
  CONSTRAINT `online_game_ibfk_1` FOREIGN KEY (`game_type_id`) REFERENCES `all_game` (`game_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of online_game
-- ----------------------------
INSERT INTO `online_game` VALUES (2, '冒险岛', 'MapleStory', '枫之谷', '网游', 'PC', 'WIZET', 'NEXON', '2004年7月23日', '多人在线', '2D', '/img/wang/3.jpg', '《冒险岛Online》是由韩国WIZET和NEXON制作开发的一款2D横版卷轴网络游戏，于2004年7月24日在中国大陆正式上线，由盛大网络负责运营。故事以被“黑暗力量”不断入侵，因而进入了“浑沌期”的世界为背景，勇士们组成了联盟，再次与“黑暗力量”展开激斗。该游戏设有五大职业体系和七大游戏阵营。曾在2009年和2010年，该游戏连续两年，获“中国游戏产业年会”十大最受欢迎休闲网络游戏奖项。');
INSERT INTO `online_game` VALUES (2, '失落的方舟', 'LOST ARK', '失落的方舟', '网游', 'Stove', 'Tripod Studio', 'Smile Gate', '2018年11月7日', '大型多人', '2.5D', '/img/wang/5.jpg', '《失落的方舟》是Smile Gate开发的大型角色扮演游戏。');
INSERT INTO `online_game` VALUES (2, '武侠乂', '武侠乂', '武侠乂', '网游', 'PC、Android、iOS', 'DramGameStudio', '方块游戏', '2018年7月27日', '多人', '3D', '/img/wang/7.jpg', '《武侠乂》是由DramGameStudio独立研发武侠系列三部曲当中的第一部。第一部主要以生存竞技玩法为主，在有限的时间和安全空间内，玩家需要边生存边搜索边战斗，最终击败所有其他玩家来获得胜利。《武侠乂》是一款由方块游戏代理的网络游戏，游戏采用虚幻4引擎开发，多人在线参与的武侠沙盒题材游戏。游戏中，玩家将扮演一名无名侠客，与同场竞赛中的其他九十九名玩家控制的无名侠客们切磋竞技，游戏中除了传统武学，还有弓射、投掷等玩法，玩家可自由选择自己喜欢的方式进行竞技。');
INSERT INTO `online_game` VALUES (2, '英雄联盟', 'League of Legends', '撸啊撸、lol', '网游', 'Microsoft Windows ', 'Riot Games', 'Riot Games', '2011年9月22日', '多人', '2.5D', '/img/wang/9.jpg', '《英雄联盟》(简称LOL)是由美国拳头游戏(Riot Games)开发、中国大陆地区腾讯游戏代理运营的英雄对战MOBA竞技网游。游戏里拥有数百个个性英雄，并拥有排位系统、符文系统等特色养成系统。《英雄联盟》还致力于推动全球电子竞技的发展，除了联动各赛区发展职业联赛、打造电竞体系之外，每年还会举办“季中冠军赛”“全球总决赛”“All Star全明星赛”三大世界级赛事，获得了亿万玩家的喜爱，形成了自己独有的电子竞技文化。英雄联盟是一款多人竞技类游戏，于2018年加入亚运会。');
INSERT INTO `online_game` VALUES (2, '地下城与勇士', '던전앤파이터', '阿拉德战记', '网游', 'PC', 'NEOPLE公司', '腾讯游戏', '2005年8月', '多人', '2D', '/img/wang/11.jpg', '《地下城与勇士》是一款韩国网络游戏公司NEOPLE开发的免费角色扮演2D游戏，由三星电子发行，并于2005年8月在韩国正式发布。中国则由腾讯游戏代理发行。该游戏是一款2D卷轴式横版格斗过关网络游戏，大量继承了众多家用机、街机2D格斗游戏的特色。以任务引导角色成长为中心，结合副本、PVP、PVE为辅，与其他网络游戏同样具有装备与等级的改变，并拥有共500多种装备道具。每个人物有8个道具装备位置，在游戏中可以允许最多4个玩家进行组队挑战关卡，同样也可以进行4对4的PK。');
INSERT INTO `online_game` VALUES (2, '绝地求生', '绝地求生', 'PUBG', '网游', 'PC Xbox one', 'PUBG Corporation', '中国区腾讯独代', '2017年3月23日 ', '大型多人', '3D', '/img/wang/13.jpg', '《绝地求生》(PUBG) 是一款战术竞技型射击类沙盒游戏。该游戏中，玩家需要在游戏地图上收集各种资源，并在不断缩小的安全区域内对抗其他玩家，让自己生存到最后。游戏《绝地求生》除获得G-STAR最高奖项总统奖以及其他五项大奖，还打破了7项吉尼斯纪录。2018年8月9日，《绝地求生》官方宣布，将开启“百日行动”，进行持续数月的自查运动，为玩家提供一个更好的游戏体验；11月，有超过200万个账户被冻结。游戏于2018年12月7日登陆PS4平台。');
INSERT INTO `online_game` VALUES (2, 'QQ飞车', 'QQ飞车', 'QQ飞车', '网游', 'PC', '琳琅天上', '腾讯游戏', '2018年1月13日', '大型多人', '3D', '/img/wang/15.jpg', '《QQ飞车》是由腾讯的琳琅天上游戏工作室开发，腾讯游戏发行的一款网络游戏，最高同时在线已超过300万。游戏结合休闲和竞技玩法，是专为QQ用户打造的一款时尚赛车游戏，采用了物理引擎PhysX来保证车辆运行时的真实感。');
INSERT INTO `online_game` VALUES (2, '天涯明月刀', '天涯明月刀', '天刀', '网游', 'PC', '北极光工作室', '腾讯游戏', '2013年4月29', '大型多人', '3D', '/img/wang/17.jpg', '《天涯明月刀》是腾讯北极光工作室研发的一款武侠题材的3D大型多人在线角色扮演电脑客户端游戏，于2016年07月01日在中国大陆正式公测，由《天涯明月刀》小说改编而成。该作有丰富的社交系统，在游戏中玩家可以拜师和收徒，可以参加帮会，和帮会成员参加任务活动，还可以加入联盟、盟会，体验不同阵营之间的战斗。');
INSERT INTO `online_game` VALUES (2, '魔兽世界', 'World of Warcraft', '魔兽世界', '网游', 'PC', '暴雪娱乐', '暴雪娱乐', '2004年', '大型多人', '3D', '/img/wang/19.jpg', '《魔兽世界》（World of Warcraft）是由著名游戏公司暴雪娱乐所制作的第一款网络游戏，属于大型多人在线角色扮演游戏。游戏以该公司出品的即时战略游戏《魔兽争霸》的剧情为历史背景，依托魔兽争霸的历史事件和英雄人物，魔兽世界有着完整的历史背景时间线。玩家在魔兽世界中冒险、完成任务、新的历险、探索未知的世界、征服怪物等。');
INSERT INTO `online_game` VALUES (2, '无限法则', 'Ring of Elysium', 'Europa', '网游', ' Steam', '北极光工作室', '腾讯游戏', '2017年11月26日', '多人', '3D', '/img/wang/21.jpg', '《无限法则》是由腾讯游戏北极光工作室群团队制作的竞技射击网游，于2017年11月26日登陆steam。该游戏中，玩家将进入一座与世隔绝的巨大岛屿，通过自己搜集的装备与岛上的其他近百名玩家一决胜负。');
INSERT INTO `online_game` VALUES (2, '刀塔2', 'DOTA2', '刀塔2', '网游', 'PC/Mac OS X/Linux', 'Value', '完美世界', '2013年7月9日', '多人', '3D', '/img/wang/23.jpg', '《刀塔2》完整继承了原作《DotA》一百多位的英雄，并脱离了上一代作品《DOTA》所依赖的《魔兽争霸Ⅲ》引擎的多人即时对战游戏，《刀塔2》的世界由天辉和夜魇两个阵营所辖区域组成，有上、中、下三条主要的作战道路相连接，中间以河流为界。每个阵营分别由五位玩家所扮演的英雄担任守护者，他们将以守护己方远古遗迹并摧毁敌方远古遗迹为使命，通过提升等级、赚取金钱、购买装备和击杀敌方英雄等手段达成胜利。');
INSERT INTO `online_game` VALUES (2, '堡垒之夜', 'Fortnite', '堡垒之夜', '网游', 'PC', 'Epic Games', 'Epic Games', '2018年6月13日', '多人', '3D', '/img/wang/25.jpg', '《堡垒之夜》是一款第三人称射击游戏，已登陆Play Station 4，XBOX One，Nintendo Switch， [2]  PC，IOS，Android平台。在PVP模式（空降行动）中，玩家将扮演一名参与选拔的青年，与其他对手竞争，决出最后的赢家，带领大家拯救村庄，保卫家园。在PVE模式（守护家园）中，玩家可以组队探索世界，拯救幸存者，并迎击来袭的怪物。');
INSERT INTO `online_game` VALUES (2, '权御天下', '权御天下', '权御天下OL', '网游', 'PC', '绿岸网络', '绿岸网络', '2016年8月26日', '多人', '3D', '/img/wang/27.jpg', '《权御天下》是上海绿岸网络科技股份有限公司开发并运营的一款大型多人在线角色扮演游戏，于2016年8月26日在中国大陆幻想封测。游戏以武王伐纣为历史背景，借昆仑秘境之力，重塑五方悍国伐商而起。玩家志在行天道而灭乱神，夺天子而统九州。游戏的核心内容是“战争”，游戏采用了VR技术，在游戏世界中可以捕获灵兽（Eudemon），铸造机甲（Powersuits），指挥千军等，玩家可以选择不同的国家，组建不同的家族和帮助，进行各种PK互动。');
INSERT INTO `online_game` VALUES (2, '古剑奇谭网络版', '古剑奇谭OL', '古剑OL', '网游', 'PC', '上海烛龙信息科技有限公司', '北京网元圣唐娱乐科技有限公司', '2018年12月20日', '大型多人', '3D', '/img/wang/29.jpg', '《古剑奇谭网络版》是网元圣唐旗下上海烛龙研发的一款大型多人在线仙侠类角色扮演游戏（MMORPG)，延续《古剑奇谭》IP世界观游戏于2018年8月16日，不删档测试；12月20日，开启首部资料片“剑鸣流花” 。');
INSERT INTO `online_game` VALUES (2, '剑灵', 'Blade & Soul', '剑灵', '网游', 'PC', 'NCsoft', '腾讯游戏', '2013年5月', '大型多人', '3D', '/img/wang/31.jpg', '《剑灵》是韩国网络游戏开发商NCSoft开发的3D奇幻大型多人在线动作类游戏，中国国内由腾讯代理。该游戏由韩国制作人裴宰贤领衔开发，亚洲插画师金亨泰担纲美术设计，日本音乐制作人岩代太郎进行音乐监制。《剑灵》为玩家展示了东方武侠世界、人物造型、轻功绝学、打斗体验、战斗过程，以及任务情节。');
INSERT INTO `online_game` VALUES (2, '梦幻西游', '梦幻西游', '梦幻西游', '网游', 'PC', '网易公司', '网易公司', '2003年12月18日', '多人', '2.5D', '/img/wang/35.jpg', '《梦幻西游》是一款由中国网易公司自行开发并营运的网络游戏。游戏以著名的章回小说《西游记》故事为背景，透过Q版的人物，试图营造出浪漫的网络游戏风格。《梦幻西游》拥有注册用户超过3.1亿，一共开设收费服务器达472组，最高同时在线人数达271万（2012年8月5日14：45），是当时中国大陆同时在线人数最高的网络游戏。游戏于2013年6月24日改名为《梦幻西游2》。2016年2月29日正式定名为《梦幻西游》电脑版。');
INSERT INTO `online_game` VALUES (2, '风暴英雄', 'Heroes of the Storm', '暴雪英霸', '网游', 'Windows ', '暴雪娱乐', '暴雪娱乐', '2014年', '多人', '3D', '/img/wang/37.jpg', '《风暴英雄》 是由暴雪娱乐公司开发的一款运行在Windows和Mac OS上的在线多人竞技PC游戏。游戏中的英雄角色主要来自于暴雪四大经典游戏系列：《魔兽世界》、《暗黑破坏神》、《星际争霸》和《守望先锋》。它是一款道具收费的游戏，与《星际争霸Ⅱ》基于同一引擎开发。');
INSERT INTO `online_game` VALUES (2, '九阴真经', '九阴真经', '九阴真经', '网游', 'PC', '游戏蜗牛', '游戏蜗牛', '2012年7月2日', '大型多人', '3D', '/img/wang/39.jpg', '《九阴真经》是蜗牛公司开发的一款大型MMORPG电脑客户端游戏，于2012年8月8日开启不删档公测。游戏以中国武侠文化为背景，表现出中国武侠的核心元素：内外兼修的神奇武功、秀美壮观的古代山河、有情有义的江湖外传、正邪英雄的武林争霸。');
INSERT INTO `online_game` VALUES (2, '逆水寒', '逆水寒', '逆水寒', '网游', 'PC', '杭州网易雷火科技有限公司', '广州网易计算机有限公司', '2017年7月21日', '大型多人', '3D', '/img/wang/41.jpg', '《逆水寒》是由杭州网易雷火科技有限公司开发的一款武侠题材电脑客户端游戏，属大型多人在线角色扮演游戏 ，该作于2018年6月29日开启不限号不删档内测  。《逆水寒》以温瑞安《四大名捕》、《说英雄谁是英雄》、《神州奇侠》三大系列小说为游戏背景，讲述北宋末年一段惨烈的大追捕，并牵扯出江湖恩怨、朝堂纷争、帮派仇杀、感情纠葛、市井百态等北宋生活画卷。');
INSERT INTO `online_game` VALUES (2, '守望先锋', 'Overwatch', '斗阵特攻', '网游', 'PC ', '暴雪娱乐', '暴雪娱乐', '2016年5月24日', '多人', '3D', '/img/wang/43.jpg', '《守望先锋》（Overwatch，简称OW） 是由暴雪娱乐公司开发的一款第一人称射击游戏，于2016年5月24日全球上市，中国大陆地区由网易公司代理。游戏以未来地球为背景，讲述人类、守望先锋成员和智能机械的恩怨纠葛。游戏现有28位英雄(截止到2018年7月25日)，每一位英雄都有各自标志性的武器和技能。');
INSERT INTO `online_game` VALUES (2, '穿越火线', '크로스파이어', 'CF', '网游', 'PC ', 'Smile Gate', 'NEOWIZ', '2007年5月3日', '多人', '3D', '/img/wang/45.jpg', '《穿越火线》游戏是由韩国Smile Gate开发，由深圳市腾讯计算机系统有限公司代理运营的一款第一人称射击游戏。游戏讲述了全球两大佣兵集团Global Risk和Black List间的对决。游戏中有团队模式、战队赛、爆破模式、幽灵模式等多种模式。引进了“缺人补充”形式的即时加入系统。');

-- ----------------------------
-- Table structure for phone_game
-- ----------------------------
DROP TABLE IF EXISTS `phone_game`;
CREATE TABLE `phone_game`  (
  `game_type_id` int(11) NOT NULL,
  `game_name_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_name_original` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_name_other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_platform` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_developers` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_lssue_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_player_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_screen` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `game_type_id`(`game_type_id`) USING BTREE,
  CONSTRAINT `phone_game_ibfk_1` FOREIGN KEY (`game_type_id`) REFERENCES `all_game` (`game_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phone_game
-- ----------------------------
INSERT INTO `phone_game` VALUES (1, '楚留香', '楚留香', '楚留香手游', '手游', 'Android、IOS、PC', '网易游戏', '网易游戏', '2017年7月13日', '大型多人', '3D', '/img/shou/s3.jpg', '《楚留香》是古龙正版授权，网易研发的一款武侠RPG手游，该作于2018年2月1日全平台正式公测。\r\n以古龙先生的《楚留香新传》为世界背景，讲述了盗帅楚留香经历的系列查案故事。玩家可扮演华山、武当、云梦、少林、暗香、沧海等职业，协助楚留香一起查案。游戏拥有命格系统、宝石系统等战斗培养元素，还引入了华山论剑、天下会武、烽火雁门关、势力纷争等PVP玩法 。');
INSERT INTO `phone_game` VALUES (1, '王者荣耀', '5v5 Arena Game', '王者联盟', '手游', 'Android、IOS', '天美工作室', '腾讯游戏', '2015年11月26日', '多人', '3D', '/img/shou/s5.jpg', '《王者荣耀》是由腾讯游戏天美工作室群开发并运行的一款运营在Android、IOS、NS平台上的MOBA类手机游戏，于2015年11月26日在Android、IOS平台上正式公测，游戏前期使用名称有《英雄战迹》、《王者联盟》。《Arena Of Valor》，即《王者荣耀》的欧美版本于2018年在任天堂Switch平台发售。');
INSERT INTO `phone_game` VALUES (1, '阴阳师', '阴阳师', '陰陽師', '手游', 'Android，ios，PC', '网易移动游戏', '网易移动游戏', '2016年6月20日', '多人', '3D', '/img/shou/s7.jpg', '《阴阳师》是由中国网易移动游戏公司自主研发的3D日式和风回合制RPG手游。2016年6月1日11：00，《阴阳师》开放安卓首测；同年9月2日，登陆ios平台于App Store首发；同年9月9日，阴阳师全平台公测。\r\n游戏中的和风元素是以《源氏物语》的古日本平安时代为背景设计的。游戏剧情以日本平安时代为背景，讲述了阴阳师安倍晴明于人鬼交织的阴阳两界中，探寻自身记忆的故事。');
INSERT INTO `phone_game` VALUES (1, '命运－冠位指定', 'Fate/Grand Order', 'フェイト/グランドオーダー', '手游', 'iOS ', 'DELiGHTWorks', 'SONY,Aniplex', '2015年7月30日', '多人', '3D', '/img/shou/s9.jpg', '《Fate/Grand Order》是TYPE-MOON发行的角色扮演类手机游戏，为Fate系列的续作，于2015年7月30日在日本Android版上线，并于2016年9月29日在中国大陆正式上线iOS版，其衍生游戏有《Fate/Grand Order Arcade》。\r\n游戏的背景是“圣杯战争”，故事围绕着七个不同的时代和七个圣杯展开。玩家需要参与各个章节的故事，进行对战。');
INSERT INTO `phone_game` VALUES (1, '梦幻模拟战', 'ラングリッサー', '兰古利萨', '手游', 'MD PCE SFC', 'NCS，Extreme', 'NCS，Extreme', '1991年', '单人', '2D', '/img/shou/s11.jpg', '《梦幻模拟战》（日文名：ラングリッサー，英文名：Langrisser）系列，是由日本电脑系统公司NCS（Nippon Computer Systems）旗下的Masaya（美塞亚）和Career Soft开发的电视游戏系列，类型为将剧情融入战棋的战略角色扮演游戏（SRPG）。此系列游戏制作人是高田慎二郎。人物设计是日本知名漫画家漆原智志，由于漆原氏以绘画性感美女漫画人物为人熟悉，所以此系列亦吸纳不少漫画迷。游戏音乐由日本著名音乐作曲编曲家岩垂德行创作，其乐曲风格高雅、大气、恢宏，倍受听众欢迎。');
INSERT INTO `phone_game` VALUES (1, '龙之谷手游', '龙之谷', 'Dragon Nest', '手游', 'Android、IOS', '上海盛大网络发展有限公司', '深圳市腾讯计算机系统有限公司', '2017年3月1日', '多人', '3D', '/img/shou/s13.jpg', '《龙之谷》是由上海盛大网络发展有限公司、上海欢乐互娱网络科技有限公司共同研发的一款角色扮演类的3D动作冒险手游，该作于2017年03月01日全平台正式上市。\r\n《龙之谷》还原了端游《龙之谷》的世界观、剧情、人设等，并带来了地狱犬、狮蝎，海龙等独创BOSS玩法。游戏主要讲述名为萝丝的小女孩被魔物抓去的故事，玩家可扮演战士、魔法师、弓箭手、牧师、学者、刺客、舞娘等职业，去拯救这位小女孩 。');
INSERT INTO `phone_game` VALUES (1, '崩坏3', '崩坏3rd', 'Honkai Impact 3', '手游', 'IOS、Android', '米哈游科技（上海）有限公司', '米哈游科技（上海）有限公司', '2016年10月14日', '大型多人在线', '3D', '/img/shou/s15.jpg', '《崩坏3》是由米哈游科技（上海）有限公司制作发行的一款角色扮演类手机游戏，该作于2016年10月14日全平台公测。\r\n游戏讲述了世界受到神秘灾害“崩坏”侵蚀的故事，玩家可扮演炽翎、白夜执事、第六夜想曲、月下初拥、极地战刃、空之律者、原罪猎人等女武神，去抵抗崩坏的入侵，维护好这个世界的和平。游戏拥有圣痕系统、女武神等战斗培养元素，还引入乱斗竞速、舰团战等PVP玩法。');
INSERT INTO `phone_game` VALUES (1, '碧蓝航线', '碧蓝航线', 'Azur Lane', '手游', 'IOS、Android', 'Yongshi', 'biligame', '2017年5月25日', '多人', '2.5D', '/img/shou/s17.jpg', '《碧蓝航线》是一款集策略养成、即时海战、弹幕、各类社交玩法为一体的二次元休闲游戏。本作以军武拟人为题材，玩家可通过主线关卡、每日副本、实战演习、舰船建造等丰富的玩法，收集并养成强力的角色与装备，手动操作自己的舰队征战四海。');
INSERT INTO `phone_game` VALUES (1, '恋与制作人', '恋与制作人', '恋与制作人', '手游', 'IOS', '芜湖叠纸网络科技有限公司', '叠纸游戏', '2017年12月20日', '大型多人', '2D', '/img/shou/s19.jpg', '《恋与制作人》是芜湖叠纸网络科技有限公司在2017年12月20日发行的一款面向年轻女性用户的超现实恋爱手游。\r\n游戏基于抽卡养成的玩法，加入了约会、触摸、温馨小屋、在你身边等恋爱互动系统，以现代都市为舞台，融入超现实主义元素，玩家以女主角的身份负责经营一家影视制作公司，历经各种离奇事件，邂逅四个不同类型的男主角（华锐总裁李泽言、大学教授许墨、Evol特警白起、国际巨星周棋洛），并与他们培养感情。');
INSERT INTO `phone_game` VALUES (1, '剑与家园', '剑与家园', 'Art of Conquest', '手游', 'Android、IOS', '莉莉丝游戏', '莉莉丝游戏', '2016年10月14日', '多人', '3D', '/img/shou/s21.jpg', '《剑与家园》是《刀塔传奇》（后改名《小冰冰传奇》）研发商莉莉丝游戏的第二款自研大作。开创全新全球实时策略对战玩法和前所未有的战斗体验。玩家在大地图上自由探索，沿途收妖斩怪，通过战斗获取资源，比如金币和木头，或者魔法水，或者更稀有的材料和装备。根据角色种族不同建造属于自己的城堡，逐渐强大后可抵挡与征服敌对国家。在《剑与家园》中体验实时策略对战玩法和战斗体验，在这里，你将参与到大规模战斗和深度的策略，小心安排你的部队和英雄，保全兵力以取得胜利！');
INSERT INTO `phone_game` VALUES (1, '少女前线', '少女前线', 'Girls Frontline', '手游', 'IOS、Android', 'Mica-team 云母组', '成都数字天空科技有限公司', '2016年5月20日', '单人、多人', '2D', '/img/shou/s23.jpg', '《少女前线》是由成都数字天空科技有限公司于2016年发行的一款后启示录题材的战术策略养成类游戏。\r\n游戏主要讲述了第三次世界大战之后，世界因战乱陷入了混沌黑暗的时期，世界的秩序和稳定交由一家名为格里芬和克鲁格的私人军事承包商来维护；游戏里，玩家要扮演格里芬军事承包商旗下的一名指挥官，指挥战术少女来达成公司维护世界稳定的任务。随着游戏的深入，玩家将一点一点知晓隐藏在这个世界背后巨大的阴谋。');
INSERT INTO `phone_game` VALUES (1, '红警OL手游', '红警OL', '红警OL', '手游', 'IOS、Android', '有爱互动', '腾讯游戏', '2010年5月20日', '单人', '2D', '/img/shou/s25.jpg', '《红警OL手游》是国内唯一获得正版授权的红警游戏，是以经典PC游戏“红警”为基础开发的全新手游!');
INSERT INTO `phone_game` VALUES (1, 'QQ炫舞', 'QQ炫舞', 'QQ炫舞', '手游', 'pc', '北京永航科技', '腾讯游戏', '2008年5月22日', '多人', '3D', '/img/shou/s27.jpg', '《QQ炫舞》是腾讯公司2008年推出的一款强调休闲、时尚、交友的在线多人3D界面音乐舞蹈游戏，由腾讯公司与北京永航科技联合发布。游戏对局模式众多，包括：炫舞模式、传统模式、节奏模式、团队模式、舞会模式、练习模式、动感模式、道具模式、疯狂模式、斗气模式、斗魂模式、约会模式、缘舞模式、婚礼模式、VOS模式、自由舞步。并与QQ深度进行深度融合，建立起交友体系。');
INSERT INTO `phone_game` VALUES (1, '天龙八部手游', '天龙八部', '天龙八部', '手游', 'Android、IOS', '北京畅游时代数码技术有限公司', '深圳市腾讯计算机系统有限公司', '2017年7月5日', '多人', '3D', '/img/shou/s29.jpg', '《天龙八部手游》是由北京畅游时代数码技术有限公司研发、腾讯代理的一款角色扮演手游，该作于2017年7月5日正式公测。\r\n游戏讲述元佑元年，大宋遭受辽国入侵的故事，玩家可扮演峨眉、丐帮、天山、逍遥、天龙等门派，与乔峰等主人公一起，去奋勇杀敌、抵御辽兵的入侵。游戏拥有神器、宝石等战斗培养元素，还引入了帮会守卫战、珍珑棋局、华山论剑等PVP玩法。');
INSERT INTO `phone_game` VALUES (1, '魂斗罗：归来', '魂斗罗', '魂斗罗', '手游', 'Android、IOS', 'KONAMI', '腾讯游戏', '2017年6月6日', '多人', '3D', '/img/shou/31.jpg', '《魂斗罗：归来》是由腾讯游戏联合日本KONAMI，共同研发的一款横版动作射击手游，该作于2017年6月6日正式公开测试。\r\n游戏讲述了外星异形不断入侵地球的故事，玩家可扮演兰斯·比恩、比尔·雷泽、兰斯、雷、希娜等英雄，去保卫好地球。游戏引入伙伴、基因、超武等战斗培养元素，还拥有英雄战场、热身赛、排位赛等PVP玩法。');
INSERT INTO `phone_game` VALUES (1, '乱世王者', '乱世王者', '乱世王者手游', '手游', 'Android、IOS', '腾讯游戏天美工作室   ', '腾讯游戏', '2017年11月21日', '大型多人', '2D', '/img/shou/33.jpg', '《乱世王者》是由腾讯旗下天美工作室群自主研发的一款战争策略手游，该作于2017年11月21日正式公测。\r\n《乱世王者》是一款历史架空背景的战争策略手游。《乱世王者》高度还原战争策略游戏的精髓，玩家将化身为在这个乱世中的一方诸侯，从招兵买马到安邦治国，逐步走向问鼎天下的争霸之路。');
INSERT INTO `phone_game` VALUES (1, '最强NBA', '最强NBA', 'Strongest NBA', '手游', 'Android、iOS', '腾讯游戏光子工作室群', '腾讯游戏', '2017年9月27日', '多人', '3D', '/img/shou/35.jpg', '《最强NBA》是由腾讯游戏开发并运营在Android、iOS的一款体育竞技手游。NBA正版授权，内有NBA球星阵容，真实细腻画面和热血实况对战场景，随时随地操控全场，感受真实的NBA对抗。\r\n《最强NBA》游戏中的玩法以竞技对战为主，玩家之间进行3V3六人实时街头对战，或1V1球队对战等多种方式的PVP对局，还可以选择游戏的闯关玩法，在满足条件后可以参加游戏的排位赛等。');
INSERT INTO `phone_game` VALUES (1, '新剑侠情缘', '新剑侠情缘', '新剑侠情缘', '手游', 'PC', '金山软件公司西山居工作室', '金山股份有限公司', '2001年12月15日', '单人', '2D', '/img/shou/s37.jpg', '《新剑侠情缘》是金山软件公司西山居工作室研发的一款单机动作角色扮演游戏，该作是以1997年版《剑侠情缘》第一代游戏为基础重新制作，游戏于2001年12月15日发行。\r\n背景是烽火连天的南宋时期，一幕幕武林的恩怨纷争由此展开。人物既有岳飞、韩世忠、梁红玉、秦桧等历史人物，也有独孤剑、张琳心、张如梦、南宫彩虹、杨瑛等武林豪杰。除了继承剑侠系列的特点之外，还引入了暗器的概念。');
INSERT INTO `phone_game` VALUES (1, '轩辕传奇手游', '轩辕传奇', '轩辕传奇', '手游', 'Android、iOS', '腾讯北极光工作室', '腾讯游戏', '2017年3月9日', '多人', '3D', '/img/shou/s39.jpg', '山海经神话巨制《轩辕传奇手游》是腾讯首款自研神话PK手游，延续端游经典PVP玩法，与上古勇士结成血盟，百人同屏，实时对战争夺城主之位，给你畅快的打击快感，体验无束缚的上古玄幻世界。\r\n《轩辕传奇手游》由北极光工作室自主研发，于2017年3月9日开启新生测试，延续《轩辕传奇》端游经典玩法的基础上，融入更多来自古代典籍《山海经》的神话传说元素，传承山海经神话传说，再现远古神兽风采。360度全视角，唯美写实画风将山海经大荒大泽景象在玩家眼前逐一展开。');
INSERT INTO `phone_game` VALUES (1, '择天记', '择天记', '择天记手游', '手游', 'Android、iOS', '腾讯游戏', '腾讯游戏', '2018年1月24日', '大型多人', '3D', '/img/shou/s41.jpg', '《择天记》是由腾讯游戏研发的一款MMORPG手游，该作于2018年1月24日公开测试。\r\n《择天记》手游讲述陈长生逆天改命的故事，玩家可扮演离山剑宗、青曜十三司、槐院、南溪斋、天机阁等门派职业，一起与陈长生逆天改命，维护人、魔、妖三族的和平。游戏拥有坐骑、神翼、妖宠、法宝等战斗培养元素，还引入了挑战圣人、煮石大会、青藤会武等PVP玩法。');
INSERT INTO `phone_game` VALUES (1, '第五人格', '第五人格', 'Identity V', '手游', 'ios、Android', '网易游戏', '网易游戏', '2018年4月2日', '多人', '3D', '/img/shou/d3.jpg', '玩家将扮演侦探奥尔菲斯，在收到一封神秘的委托信后，进入恶名昭著的庄园调查一件失踪案。在进行证据调查过程中，玩家扮演的奥尔菲斯将采用演绎法，对案情进行回顾。在案情回顾时，玩家可以选择扮演监管者或求生者，展开激烈的对抗。而在调查的过程，无限接近事实时，却发现越来越不可思议的真相。');
INSERT INTO `phone_game` VALUES (1, '开心消消乐', '开心消消乐', '开心消消乐', '手游', 'ios、Android', '网易游戏', '网易游戏', '2013年8月', '单人', '2D', '/img/shou/d5.jpg', '《开心消消乐》是一款乐元素研发的一款三消类休闲游戏。2013年8月，正式在网页版上线，在2014年8月推出了安卓版本和IOS版本。\r\n游戏以救村长为目的，玩家开始了一段开心的闯关旅程。');
INSERT INTO `phone_game` VALUES (1, '会说话的汤姆猫', 'Talking Tom Cat', '会说话的汤姆猫', '手游', 'ios、Android', 'Outfit7公司', 'Outfit7公司', '2010年', '单人', '2D', '/img/shou/d7.jpg', '《会说话的汤姆猫》是由Outfit7公司研发的一款手机宠物类应用游戏。汤姆是一只宠物猫，他可以在您触摸时作出反应，并且用滑稽的声音完整地复述您说的话。\r\n您可以抚摸他、用手指戳他、用拳轻打他或捉他的尾巴。您还可以将录制汤姆复述您说话上传至YouTube或FaceBook或通过电子邮件发送给亲友。与这只会说话的汤姆猫一起玩耍，享受欢乐和笑声。');
INSERT INTO `phone_game` VALUES (1, '贪吃蛇大作战', '贪吃蛇大作战', '贪吃蛇大作战', '手游', 'ios、Android', 'Outfit7公司', 'Outfit7公司', '2018年7月26日', '单人', '2D', '/img/shou/d9.jpg', '《贪吃蛇大作战》一款休闲竞技游戏，不仅比拼手速，更考验玩家的策略。在贪吃蛇大作战的世界中，每个人在初始都化身为一条小蛇，通过不断努力变得越来越长，最终成为最贪吃的无双巨蛇。');
INSERT INTO `phone_game` VALUES (1, '神庙逃亡', 'Temple Run', '神庙逃亡', '手游', 'ios、Android', 'Imangi Studios', 'Imangi Studios', '2012年7月26日', '单人', '3D', '/img/shou/d17.jpg', '《神庙逃亡》是由Imangi Studios开发制作的一款跑酷冒险类单机类系列游戏，于2012-7-26发行，内容主题有生存，丛林，冒险等，Android版游戏大小为23.3 MB。');
INSERT INTO `phone_game` VALUES (1, '地铁跑酷', 'Subway Surfers', '地铁跑酷', '手游', 'iOS、Android', 'Kiloo Games', 'Kiloo Games', '2012年10月', '单人', '3D', '/img/shou/d19.jpg', '该游戏是一款堪比神庙逃亡的经典跑酷游戏。游戏的画面绚丽精致，色彩繁多让人感觉很舒服，在操作上非常顺畅，并且干净利落。通过简单的向上划，向下划，向左向右划来躲避障碍和迎面而来的火车，帮助主人公躲避脾气暴躁的警察和他的狗的追捕。在空中也可以左右改变方向，还可以通过双击屏幕调出滑板，在有限的时间里相当于增加一次生命。游戏中还包含了如弹簧鞋等多种道具。');
INSERT INTO `phone_game` VALUES (1, '登山赛车', 'Hill Climb Racing', '登山赛车', '手游', 'iOS、Android', 'Fingersoft', 'Fingersoft', '2012年9月', '单人', '3D', '/img/shou/d21.jpg', '《登山赛车》是一款由Fingersoft开发的体育竞速类手机游戏。该游戏已于2012年9月发行。\r\n游戏以玩家驾驶一款赛车跑在山地上，由于山地非常颠簸，需要玩家很好的把握油门和刹车，保证车子就不会翻过来。沿途可以收集金币，用来改造车子为背景，引导玩家进行游戏。');
INSERT INTO `phone_game` VALUES (1, '钢琴块2', 'Piano Tiles 2', '别踩白块儿 2', '手游', 'ios、Android', '猎豹移动公司', '猎豹移动公司', '2015年12月26日', '单人', '2D', '/img/shou/d29.jpg', '《钢琴块2》是猎豹移动自主研发的一款将音乐和街机玩法完美结合的手机游戏。根据音乐节奏点击黑色方块，按照顺序点，不可错点、不点，错点、不点会导致游戏失败。有《土耳其进行曲》、《致爱丽丝》等音乐。');
INSERT INTO `phone_game` VALUES (1, '愤怒的小鸟', 'Angry Birds', '愤怒的小鸟', '手游', 'iOS、Android', 'Rovio Entertainment Ltd', 'Rovio Entertainment Ltd', '2009年12月', '单人', '2D', '/img/shou/d31.jpg', '《愤怒的小鸟》是由Rovio开发的一款休闲益智类游戏，于2009年12月首发于iOS。\r\n游戏以小鸟报复偷走鸟蛋的肥猪为背景，讲述了小鸟与肥猪的一系列故事。');
INSERT INTO `phone_game` VALUES (1, '滑雪大冒险', 'ski safari', '滑雪大冒险', '手游', 'iOS、Android', 'Defiant Development', 'Defiant Development', '2012年12月17日', '单人', '2D', '/img/shou/d33.jpg', '滑雪大冒险是由Yodo1, LTD开发的一款惊险刺激的跑酷游戏。游戏于2012年12月17日发行。游戏操作简单方便，只需手指触摸屏幕操作人物。画面逼真，游戏中可以完成各种各样高难度的滑雪动作，还可以和动物们一起合作逃生，有许许多多的人物需要玩家一一去解锁以增加游戏的趣味性。');
INSERT INTO `phone_game` VALUES (1, '超级马里奥兄弟', 'Super Mario Bros', '超级玛丽', '手游', 'IOS、Android', '任天堂公司', '任天堂公司', '1983年', '单人、多人', '2D', '/img/shou/d37.jpg', '《超级马里奥兄弟》，是任天堂公司开发并于1985年出品的著名横版过关游戏，最早在红白机上推出，有多款后续作品，迄今多个版本合共销量已突破5亿4000万套。');

-- ----------------------------
-- Table structure for post_online_game
-- ----------------------------
DROP TABLE IF EXISTS `post_online_game`;
CREATE TABLE `post_online_game`  (
  `bbs_id` int(11) NOT NULL,
  `game_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `bbs_id`(`bbs_id`) USING BTREE,
  INDEX `invitation_id`(`post_id`) USING BTREE,
  CONSTRAINT `post_online_game_ibfk_1` FOREIGN KEY (`bbs_id`) REFERENCES `forum` (`forum_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_online_game
-- ----------------------------
INSERT INTO `post_online_game` VALUES (2, '刀塔2', 1, 'dota', 'dota', '2019-06-06 09:38:52', '15277402877');
INSERT INTO `post_online_game` VALUES (2, '风暴英雄', 2, '企鹅温柔却温柔', '哦睡觉啊地方开始啦大家发了扩散打开了付款了涉及到法律空间上了；的；浪费撒的发生地方', '2019-06-06 10:04:44', '15277402877');
INSERT INTO `post_online_game` VALUES (2, '冒险岛', 3, '测试测试测试', '长沙长沙长沙长沙长沙长沙长沙', '2019-06-12 17:30:09', '15277402877');
INSERT INTO `post_online_game` VALUES (2, '古剑奇谭网络版', 4, '自行车V现在才V', '我去二位数的方式地方', '2019-06-12 17:30:22', '15277402877');
INSERT INTO `post_online_game` VALUES (2, '绝地求生', 5, '大风刮过好好干', '可能连续吃了困困了现在才V刊唠唠嗑', '2019-06-12 17:30:39', '15277402877');
INSERT INTO `post_online_game` VALUES (2, 'QQ飞车', 6, '阿桑地方撒的发生地方', '啊额我你空间的发给你，出现在女，训练课程V离开现在才V就例行检查考虑了新课程V离开现在金龙客车V', '2019-06-12 17:30:53', '15277402877');
INSERT INTO `post_online_game` VALUES (2, '地下城与勇士', 7, '阿桑地方撒地方', '额减肥呢克利斯朵夫你卡刷卡劳动妇女克里斯蒂娜克里夫', '2019-06-12 17:31:13', '15277402877');
INSERT INTO `post_online_game` VALUES (2, '天涯明月刀', 8, '1111111111', '我是说大地方', '2019-06-12 17:31:26', '15277402877');
INSERT INTO `post_online_game` VALUES (2, '剑灵', 9, '222222', '啊时代发生的发生大幅', '2019-06-12 17:31:38', '15277402877');
INSERT INTO `post_online_game` VALUES (2, '古剑奇谭网络版', 10, '3333333', '啊时代发生的发生重新下载', '2019-06-12 17:31:51', '15277402877');
INSERT INTO `post_online_game` VALUES (2, '魔兽世界', 11, '44444444', '啊筛选出V在现实的说法', '2019-06-12 17:32:01', '15277402877');
INSERT INTO `post_online_game` VALUES (2, '穿越火线', 12, '5555555555555', '看见哦I家哦那就快来看看', '2019-06-12 17:34:23', '15277402877');
INSERT INTO `post_online_game` VALUES (2, '无限法则', 13, '66666666666', '也会觉得非常vb', '2019-06-12 17:34:43', '15277402877');
INSERT INTO `post_online_game` VALUES (2, '古剑奇谭网络版', 14, '6.18', '完成测试', '2019-06-18 15:19:15', '15211111111');
INSERT INTO `post_online_game` VALUES (2, '风暴英雄', 15, '6.22', '6.22', '2019-06-22 09:28:36', '111');
INSERT INTO `post_online_game` VALUES (2, '魔兽世界', 16, '6.22', '测试bug', '2019-06-22 09:29:29', '111');
INSERT INTO `post_online_game` VALUES (2, '堡垒之夜', 17, '测试数据', '测试分页', '2019-06-22 09:33:00', '111');
INSERT INTO `post_online_game` VALUES (2, '逆水寒', 18, '测试数据', '测试分页2', '2019-06-22 09:33:29', '111');
INSERT INTO `post_online_game` VALUES (2, '剑灵', 19, '测试数据', '测试分页3', '2019-06-22 09:33:50', '111');
INSERT INTO `post_online_game` VALUES (2, '古剑奇谭网络版', 20, '测试数据', '测试分页4', '2019-06-22 09:34:06', '111');
INSERT INTO `post_online_game` VALUES (2, '九阴真经', 21, '测试数据', '测试分页5', '2019-06-22 09:34:26', '111');

-- ----------------------------
-- Table structure for post_phone_game
-- ----------------------------
DROP TABLE IF EXISTS `post_phone_game`;
CREATE TABLE `post_phone_game`  (
  `bbs_id` int(11) NOT NULL,
  `game_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `bbs_id`(`bbs_id`) USING BTREE,
  INDEX `invitation_id`(`post_id`) USING BTREE,
  CONSTRAINT `post_phone_game_ibfk_1` FOREIGN KEY (`bbs_id`) REFERENCES `forum` (`forum_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_phone_game
-- ----------------------------
INSERT INTO `post_phone_game` VALUES (4, '剑与家园', 1, '测试7777', '士大夫温柔温柔', '2019-06-06 09:49:23', '15277402877');
INSERT INTO `post_phone_game` VALUES (4, 'QQ炫舞', 2, 'zxcv', 'zxcvzxcv', '2019-06-06 10:00:16', '15277402877');
INSERT INTO `post_phone_game` VALUES (4, '红警OL手游', 3, 'asdfas', 'asdfsadf', '2019-06-25 15:26:25', '15277402877');
INSERT INTO `post_phone_game` VALUES (4, '新剑侠情缘', 4, '测试', '测试', '2019-06-25 16:11:52', '15288888888');

-- ----------------------------
-- Table structure for post_recommend
-- ----------------------------
DROP TABLE IF EXISTS `post_recommend`;
CREATE TABLE `post_recommend`  (
  `bbs_id` int(11) NOT NULL,
  `game_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `bbs_id`(`bbs_id`) USING BTREE,
  INDEX `invitation_id`(`post_id`) USING BTREE,
  CONSTRAINT `post_recommend_ibfk_1` FOREIGN KEY (`bbs_id`) REFERENCES `forum` (`forum_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_recommend
-- ----------------------------
INSERT INTO `post_recommend` VALUES (1, '三国杀', 1, '测试', '测试', '2019-06-05 10:16:05', '111');
INSERT INTO `post_recommend` VALUES (1, '阴阳师', 2, '测试1', '测试1', '2019-06-05 10:16:27', '15210203040');
INSERT INTO `post_recommend` VALUES (1, '八方旅人', 3, 'asdf', 'asdf', '2019-06-05 23:56:42', '15277402877');

-- ----------------------------
-- Table structure for post_single_play_game
-- ----------------------------
DROP TABLE IF EXISTS `post_single_play_game`;
CREATE TABLE `post_single_play_game`  (
  `bbs_id` int(11) NOT NULL,
  `game_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `bbs_id`(`bbs_id`) USING BTREE,
  INDEX `inviation_id`(`post_id`) USING BTREE,
  CONSTRAINT `post_single_play_game_ibfk_1` FOREIGN KEY (`bbs_id`) REFERENCES `forum` (`forum_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_single_play_game
-- ----------------------------
INSERT INTO `post_single_play_game` VALUES (3, '使命召唤：黑色行动4', 1, '测试qwer', '测试测试测试测', '2019-06-06 09:48:37', '15277402877');
INSERT INTO `post_single_play_game` VALUES (3, '迷你世界', 2, '请问人情味人', '自行车V自行车V', '2019-06-06 15:57:00', '15277402877');
INSERT INTO `post_single_play_game` VALUES (3, '只狼:影逝二度', 5, '测试', '测试', '2019-06-22 09:46:44', '15210203040');

-- ----------------------------
-- Table structure for ranking_list
-- ----------------------------
DROP TABLE IF EXISTS `ranking_list`;
CREATE TABLE `ranking_list`  (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ranking_list
-- ----------------------------
INSERT INTO `ranking_list` VALUES (1, '热门游戏');
INSERT INTO `ranking_list` VALUES (2, '新品游戏');
INSERT INTO `ranking_list` VALUES (3, '即将退出');

-- ----------------------------
-- Table structure for reply_online
-- ----------------------------
DROP TABLE IF EXISTS `reply_online`;
CREATE TABLE `reply_online`  (
  `post_id` int(11) NOT NULL,
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`reply_id`) USING BTREE,
  INDEX `invitation_id`(`post_id`) USING BTREE,
  CONSTRAINT `reply_online_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post_online_game` (`post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply_online
-- ----------------------------
INSERT INTO `reply_online` VALUES (1, 6, '666', '2019-06-06 15:50:15', '15277402877');
INSERT INTO `reply_online` VALUES (14, 7, '测试', '2019-06-18 15:19:51', '15211111111');
INSERT INTO `reply_online` VALUES (10, 8, '突破零回复', '2019-06-22 09:39:00', '15277402877');

-- ----------------------------
-- Table structure for reply_phone
-- ----------------------------
DROP TABLE IF EXISTS `reply_phone`;
CREATE TABLE `reply_phone`  (
  `post_id` int(11) NOT NULL,
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`reply_id`) USING BTREE,
  INDEX `invitation_id`(`post_id`) USING BTREE,
  CONSTRAINT `reply_phone_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post_phone_game` (`post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply_phone
-- ----------------------------
INSERT INTO `reply_phone` VALUES (1, 6, '啊速度发撒地方', '2019-06-06 15:55:27', '15277402877');
INSERT INTO `reply_phone` VALUES (3, 7, 'werdfbzxjgf', '2019-06-25 15:26:33', '15277402877');

-- ----------------------------
-- Table structure for reply_recommend
-- ----------------------------
DROP TABLE IF EXISTS `reply_recommend`;
CREATE TABLE `reply_recommend`  (
  `post_id` int(11) NOT NULL,
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`reply_id`) USING BTREE,
  INDEX `invitation_id`(`post_id`) USING BTREE,
  CONSTRAINT `reply_recommend_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post_recommend` (`post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply_recommend
-- ----------------------------
INSERT INTO `reply_recommend` VALUES (1, 1, '我的作用是测试', '2019-06-04 17:08:59', '111');
INSERT INTO `reply_recommend` VALUES (1, 4, 'test2', '2019-06-05 09:09:07', '222');
INSERT INTO `reply_recommend` VALUES (2, 5, 'asdfsadf', '2019-06-06 11:01:06', '15210203040');
INSERT INTO `reply_recommend` VALUES (1, 6, 'test', '2019-06-06 15:21:10', '111');
INSERT INTO `reply_recommend` VALUES (1, 7, '啊速度发撒地方撒地方', '2019-06-06 15:45:07', '15277402877');
INSERT INTO `reply_recommend` VALUES (1, 8, 'a啊速度发撒地方', '2019-06-06 15:45:24', '15277402877');
INSERT INTO `reply_recommend` VALUES (3, 9, '', '2019-06-10 10:13:33', '15277402877');
INSERT INTO `reply_recommend` VALUES (3, 10, '', '2019-06-10 10:26:33', '15277402877');
INSERT INTO `reply_recommend` VALUES (3, 11, 'qwer', '2019-06-10 10:43:37', '15277402877');
INSERT INTO `reply_recommend` VALUES (1, 12, '长沙长沙长沙长沙长沙长沙长沙', '2019-06-12 17:12:19', '15277402877');
INSERT INTO `reply_recommend` VALUES (1, 13, '1111111111', '2019-06-12 17:12:30', '15277402877');
INSERT INTO `reply_recommend` VALUES (1, 14, '22222222222', '2019-06-12 17:12:35', '15277402877');
INSERT INTO `reply_recommend` VALUES (1, 15, '333333333333333333333333333', '2019-06-12 17:12:39', '15277402877');
INSERT INTO `reply_recommend` VALUES (1, 16, '44444444444444444444444444444', '2019-06-12 17:12:44', '15277402877');
INSERT INTO `reply_recommend` VALUES (1, 17, '555555555555555555', '2019-06-12 17:12:54', '15277402877');
INSERT INTO `reply_recommend` VALUES (1, 18, '66666666666666666', '2019-06-12 17:12:58', '15277402877');
INSERT INTO `reply_recommend` VALUES (1, 19, '77777777777777777777777777', '2019-06-12 17:13:07', '15277402877');
INSERT INTO `reply_recommend` VALUES (1, 20, '888888888888888888', '2019-06-12 17:13:12', '15277402877');
INSERT INTO `reply_recommend` VALUES (1, 21, '9999999999999999999999', '2019-06-12 17:13:18', '15277402877');
INSERT INTO `reply_recommend` VALUES (1, 22, '0000000000000000', '2019-06-12 17:13:30', '15277402877');
INSERT INTO `reply_recommend` VALUES (3, 23, '完成测试', '2019-06-18 15:18:41', '15211111111');
INSERT INTO `reply_recommend` VALUES (1, 24, '阿什顿飞', '2019-06-18 15:33:34', '15211111111');
INSERT INTO `reply_recommend` VALUES (1, 25, '测试bug', '2019-06-22 09:30:22', '111');
INSERT INTO `reply_recommend` VALUES (3, 26, '暖场', '2019-06-22 09:42:05', '15210203040');
INSERT INTO `reply_recommend` VALUES (1, 27, '测试测试测试', '2019-06-25 16:07:07', '15288888888');

-- ----------------------------
-- Table structure for reply_single_play
-- ----------------------------
DROP TABLE IF EXISTS `reply_single_play`;
CREATE TABLE `reply_single_play`  (
  `post_id` int(11) NOT NULL,
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`reply_id`) USING BTREE,
  INDEX `invitation_id`(`post_id`) USING BTREE,
  CONSTRAINT `reply_single_play_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post_single_play_game` (`post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply_single_play
-- ----------------------------
INSERT INTO `reply_single_play` VALUES (1, 6, '阿斯顿发撒的', '2019-06-06 15:56:46', '15277402877');
INSERT INTO `reply_single_play` VALUES (2, 7, '请问人情味人', '2019-06-06 15:57:06', '15277402877');

-- ----------------------------
-- Table structure for single_play_game
-- ----------------------------
DROP TABLE IF EXISTS `single_play_game`;
CREATE TABLE `single_play_game`  (
  `game_type_id` int(11) NOT NULL,
  `game_name_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_name_original` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_name_other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_platform` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_developers` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_lssue_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_player_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_screen` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `game_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `game_type_id`(`game_type_id`) USING BTREE,
  CONSTRAINT `single_play_game_ibfk_1` FOREIGN KEY (`game_type_id`) REFERENCES `all_game` (`game_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of single_play_game
-- ----------------------------
INSERT INTO `single_play_game` VALUES (3, '生化危机2重制版 ', 'biohazard re 2', 'resident evil 2', '单机', 'PC', 'CAPCOM', 'CAPCOM', '2019年1月25日', '单人', '3D', '/img/dan/dj1.jpg', '《生化危机2重制版》（ biohazard re 2）将登陆PlayStation 4、Xbox One和PC平台，使用《生化危机7》同款引擎RE Engine打造，经典的生存恐怖游戏正式重生。逼真又惊人的视效、音效打造恐怖之境，《生化危机2：重制版》完全重做，将带来更深层次的叙事体验。全新的过肩视角，以及现代化操作，支持4K，2019年1月25日，《生化危机2》回归。');
INSERT INTO `single_play_game` VALUES (3, '流星蝴蝶剑单机版', 'Meteor', '流星蝴蝶剑单机版', '单机', 'PC', '昱泉国际', '昱泉国际', '2009年1月25日', '单人、多人', '3D', '/img/dan/dj2.jpg', '《流星蝴蝶剑》单机版是一款根据古龙的同名武侠小说名著改编而成的动作游戏，采用了现在最热门的游戏型态“网络对战”，是一款广受玩家好评的游戏。重要是玩家以团队进行战斗的方法，利用各种兵器的优越性，在同是玩家所扮演的对手之间，双方人马以暗害、兵刃相交、暗器射击等等，将对手全灭或是达成该次特定任务的游戏方法进行。此一游戏的最大优势，在于昱泉游戏公司在最善常的武侠题材上，试图打造新一代的武侠表现方法。利用以往的武侠游戏制作经验，以及人物的武功招式动作表现上，全力制作不同以往的武侠游戏“流星蝴蝶剑”。');
INSERT INTO `single_play_game` VALUES (3, '纪元1800', 'Anno 1800', '纪元1800', '单机', 'PC', 'Blue Byte', 'Ubisoft', '2019年4月16日', '单人、多人', '3D', '/img/dan/dj3.jpg', '《纪元1800》（Anno 1800）是一款由育碧开发的城市建筑模拟游戏。于2019年4月16日正式发售。');
INSERT INTO `single_play_game` VALUES (3, '全境封锁2', 'Tom Clancy\'s The Division2', '全境封锁2', '单机', 'PC', 'Ubisoft', 'Ubisoft', '2019年3月15日', '单人、多人', '3D', '/img/dan/dj4.jpg', '《全境封锁2》由Massive工作室主导并与育碧安纳西工作室、RedStorm工作室、Reflections工作室、育碧布加勒斯特工作室以及育碧上海工作室合作研发。游戏引擎为最新版的Snowdrop engine。该作背景移师美国首都华盛顿特区，时间线为一代的六个月后。于2019年3月15日全平台发售。');
INSERT INTO `single_play_game` VALUES (3, '全面战争：三国', ' Total War: THREE KINGDOMS', '全面战争：三国', '单机', 'PC', 'Creative Assembly', 'SEGA', '2019年5月23日', '单人', '3D', '/img/dan/dj5.jpg', '《全面战争：三国》（Total War: THREE KINGDOMS）是由Creative Assembly开发并由世嘉发行的一款大型即时战略游戏，也是《全面战争》系列的最新作品。该游戏将参加2018年E3游戏展，2018年9月28日预售，2019年5月23日发售。 [1] 该作以中国历史上的三国时期作为故事背景，凭借全面战争系列以往的大场面和恢弘大气的战场气氛，将三国时期那段波澜壮阔的历史呈现给游戏玩家。');
INSERT INTO `single_play_game` VALUES (3, '鬼泣5', 'Devil May Cry 5', '恶魔猎人5', '单机', 'PC', 'CAPCOM', 'CAPCOM', '2019年3月8日', '多人', '3D', '/img/dan/dj6.jpg', '《鬼泣5》是由日本CAPCOM开发的一款动作冒险游戏，该作是《鬼泣》系列第六部，且是《鬼泣4》的正统续作，故事发生在《鬼泣4》之后，于2019年3月8日发售，登陆PC、PS4和XBOX One平台。游戏采用Capcom内部专有的RE引擎开发，使得游戏在图形保真度方面达到了全新的高度');
INSERT INTO `single_play_game` VALUES (3, '保卫萝卜', 'CarrotFantasy', '保卫萝卜', '单机', 'PC', '腾讯游戏', '腾讯游戏', '2012年8月7日', '单人', '2D', '/img/dan/d13.jpg', '《保卫萝卜》是一款由“凯罗天下”开发的萌系风格塔防游戏，容易上手、老少皆宜，内置新手引导。游戏含有丰富的关卡和主题包，拥有各自风格特色的多种防御塔，有趣的音效设定和搞怪的怪物造型及名字大大地增加了游戏的趣味性。玩家还可以收集道具和怪物，完成更多的成就。');
INSERT INTO `single_play_game` VALUES (3, '怪物猎人：世界', '怪物猎人：世界', '怪物猎人：世界', '单机', 'PC', 'CAPCOM', 'CAPCOM', '2018年8月10日', '单人', '3D', '/img/dan/dj7.jpg', '由卡普空开发团队采用MT Framework引擎开发，制作时间达四年之久。2018年8月13日，腾讯Wegame发布公告，称“因WeGame平台发行的《怪物猎人 世界》部分游戏内容未完全符合政策法规要求”，相关政府管理部门接到大量举报，该游戏相应运营资质文件现在已被取消。应主管部门要求，现执行下架整改，停止游戏售卖。');
INSERT INTO `single_play_game` VALUES (3, '废土行动', '废土行动', 'Action of waste soil', '单机', 'PC', '上海昊动网络科技有限公司', '上海昊动网络科技有限公司', '2015年7月26日', '单人', '3D', '/img/dan/d23.jpg', '《废土行动》是一款免费的单人末世生存游戏：在K病毒的扩散下，世界迅速被毁灭，饥饿，寒冷，瘟疫，病毒，恶狼，丧尸......威胁无处不在，随时都可能将人类脆弱的生命夺走，生存，是每个幸存者最根本的需要！并且，随着城市文明的毁灭，人与人之间的信任变得危险无比，所有幸存者，如同黑暗中的猎人谨慎生存和隐藏，任何暴露自己存在的人都将很快被掠夺消灭。');
INSERT INTO `single_play_game` VALUES (3, '我的世界', 'Minecraft', '我的世界', '单机', 'PC', 'Mojang', 'MarkusPersson', '2009年5月17日', '单人、多人', '3D', '/img/dan/d25.jpg', '《我的世界》是一款3D的第一人称沙盘游戏，所呈现的世界并不是华丽的画面与特效，而是注重在游戏性上面。玩家在游戏中做着「建设」与「破坏」两件事，但是透过像乐高一样的积木来组合与拼凑，轻而易举的就能制作出小木屋、城堡甚至城市，但是若再加上玩家的想像力，空中之城、地底都市都一样能够实现。');
INSERT INTO `single_play_game` VALUES (3, '迷你世界', '迷你世界', '迷你世界', '单机', 'PC', '深圳市迷你玩科技有限公司', '深圳市迷你玩科技有限公司', '2015年12月26日', '单人、多人', '3D', '/img/dan/d27.jpg', '迷你世界是一款高度自由的休闲类3D沙盒游戏，由深圳市迷你玩科技有限公司运营。这是国产沙盒游戏，通过玩家破坏方块与创造方块来组合成属于自己的建筑以及与小伙伴们一起进行大冒险。游戏有着非常方便快捷的多人联机模式，只要有网络就能和各个地方的小伙伴们一起玩，没有等级和规则限制，没有规定的玩法，只有随心所欲的破坏和天马行空的创造。');
INSERT INTO `single_play_game` VALUES (3, '植物大战僵尸', 'Plants vs Zombies', '植物大战僵尸', '单机', 'PC', 'PopCap Games', 'PopCap Games', '2009年5月5日', '单人', '2D', '/img/dan/d35.jpg', '《植物大战僵尸》是由PopCap Games开发的一款益智策略类单机游戏，于2009年5月5日发售。玩家通过武装多种植物切换不同的功能，快速有效地把僵尸阻挡在入侵的道路上。不同的敌人，不同的玩法构成五种不同的游戏模式，加之黑夜、浓雾以及泳池之类的障碍增加了游戏挑战性。');
INSERT INTO `single_play_game` VALUES (3, '拳皇', 'ザ・キング・オブ・ファイターズ', '格斗之王', '单机', 'PC', 'SNK Playmore', 'SNK Playmore', '1994年8月25日', '单人、多人', '2D', '/img/dan/d39.jpg', '《拳皇》是1994年日本SNK公司旗下在MVS游戏机板上发售的一款著名对战型格斗街机游戏，简称\"KOF\"，也是在剧情中举行的世界规模的格斗大赛的名称。最初为该公司旗下另外两部作品《饿狼传说》系列和《龙虎之拳2》中以南镇为舞台举办的格斗大赛。');
INSERT INTO `single_play_game` VALUES (3, '只狼：影逝二度', 'SEKIRO: Shadows Die Twice', '只狼 影逝二度', '单机', 'PC', 'FROM SOFTWARE', 'From Software', '2019年3月22日', '单人', '3D', '/img/dan/dj8.jpg', '在《Sekiro: Shadows Die Twice》中译是“独臂之狼”，一个名誉不再、伤痕累累的忍者，一个从死亡边缘捡回一命的战士。你效忠守护继承古老血统的年轻御子，与危险的苇名一族以及众多凶恶之徒为敌。年轻的御子被抓走后，为挽回荣誉，你将不畏死亡，踏上危机四伏的征程。');
INSERT INTO `single_play_game` VALUES (3, '瘟疫传说：无罪', 'A Plague Tale: Innocence', '瘟疫传说：无罪', '单机', 'PC', 'Asobo Studio', 'Focus Home Interactive', '2019年5月15日', '单人', '3D', '/img/dan/dj9.jpg', '《瘟疫传说：无罪》是一款动作冒险游戏，公元1349年，瘟疫在法兰西王国肆虐。阿米西亚和她年幼的弟弟雨果受到宗教审判所的追捕，被迫在被疾病摧毁的村落间颠沛流离。在逃亡的途中，他们需要与其他孩子并肩作战，借助火和光来逃避蜂拥而至的老鼠。二人命运紧密相连，面对未知的恐惧，只能依靠彼此，挣扎求生。');
INSERT INTO `single_play_game` VALUES (3, '王国之心3', '王国之心3', '王国之心3', '单机', 'PC', 'Square Enix', 'Square Enix', '2019年1月25日', '单人', '3D', '/img/dan/dj10.jpg', '《王国之心3》是一款由Square Enix制作并发行的动作角色扮演游戏。游戏采用虚幻4引擎进行制作，故事将继续沿续《王国之心3D》的故事。');
INSERT INTO `single_play_game` VALUES (3, '荒野大镖客：救赎2', 'Red Dead Redemption 2', '荒野大镖客2', '单机', 'PC', 'Rockstar San Diego', 'Rockstar Games', '2018年10月26日', '单人、多人', '3D', '/img/dan/dj11.jpg', '《荒野大镖客：救赎2》（Red Dead: RedemptionⅡ）是Rockstar San Diego工作室制作，Rockstar公司发行的一款以美国西部拓荒史为题材的动作冒险类开放世界游戏，为2010年该公司发行的《荒野大镖客：救赎》的正统续作。2018年10月26日，游戏正式发售；同年11月27日，荒野大镖客ol测试版正式上线。');
INSERT INTO `single_play_game` VALUES (3, '使命召唤：黑色行动4', 'Call of Duty: Black Ops 4', '使命召唤15：黑色行动4', '单机', 'PC', 'Treyarch', '动视', '2018年10月12日', '多人', '3D', '/img/dan/dj12.jpg', '《使命召唤：黑色行动4》（Call of Duty: Black Ops 4）是一款Treyarch开发的第一人称射击游戏，是《使命召唤》游戏系列的第15部作品。该作取消了使命召唤系列传统的单人剧情模式，将聚焦多人模式、僵尸模式与大逃杀模式。 该作将由动视于2018年10月12日发售，登陆PS4、XboxOne、PC等平台，其中PC版将由战网独占。');
INSERT INTO `single_play_game` VALUES (3, '死或生6', 'デッド オア アライブ6', '生死格斗6', '单机', 'PC', 'Team Ninja', 'Tecmo Koei', '2019年3月1日', '单人', '3D', '/img/dan/dj13.jpg', '《死或生6》登陆任天堂Switch平台， 港台各经销商开预 事实上，在采访中早矢仕洋介表示他十分欣赏PS4/Xbox One，其本人想充分利用次世代机能，不过《死或生5：最后一战》显然未能达到要求，除了画质上略有提升之外。制作团队将立足长远规划下一个项目。 此前Team Ninja团队一直以高精细建模著称，如果《死或生6》公布，相信制作人会充分发挥次世代“乳摇物理震荡”效果，让我们一起期待吧。');
INSERT INTO `single_play_game` VALUES (3, '狂怒2', 'Rage 2', '狂怒2', '单机', 'PC', 'Avalanche Studios', 'Bethesda Softworks', '2019年5月14日', '单人', '3D', '/img/dan/dj14.jpg', '《狂怒2》由Avalanche Studios和第一人称射击游戏创作团队id Software联手打造，让你尽享屠戮的狂欢。在这里，你可以去任何地方、射杀和引爆任何东西。现已在Steam开始预购，发行日期2019年5月14日。');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `register_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `userInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('111', 'Hh1BIO/exW8U03QiInirWwUF6ngQry4K9vKJLw==', '2019-05-24 15:13:54', NULL);
INSERT INTO `users` VALUES ('15200000000', 'XBm2+/binA5Z3EU4m2s1Gf3JircxcP2zQZlElg==', '2019-06-09 18:02:40', NULL);
INSERT INTO `users` VALUES ('15210203040', 'IsO6f1xvdpgTN9O5sBVbHxUbZDn+yP1GEqb+pQ==', '2019-06-22 09:40:37', NULL);
INSERT INTO `users` VALUES ('15211111111', 'DoQXCkz+u/NWI1jNDxHknKBPlqqpyFQL3VXaBQ==', '2019-06-18 15:17:52', NULL);
INSERT INTO `users` VALUES ('15222222222', '5OJigQCBxTw9hc2WhKX44VRLK78GkuDO4z/GRQ==', '2019-06-18 16:23:05', NULL);
INSERT INTO `users` VALUES ('15277402877', 'CANpqmumMdR+SEdDTypW2rCjvjTaiynxY132SQ==', '2019-06-01 21:46:52', NULL);
INSERT INTO `users` VALUES ('15288888888', 'r6JkxLSlexe7Fj/rxBNIjd6EcLg0uslKGp4PVw==', '2019-06-25 15:53:54', NULL);
INSERT INTO `users` VALUES ('15296192157', '3gyeXP1m+9DEZpraMadgw5zXzBGkqqA+Lfox9g==', '2019-06-12 15:39:29', NULL);

-- ----------------------------
-- Table structure for users_info
-- ----------------------------
DROP TABLE IF EXISTS `users_info`;
CREATE TABLE `users_info`  (
  `user_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '保密',
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_birthday` date NULL DEFAULT '1990-01-01',
  `user_head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'default.jpg',
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `users_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_info
-- ----------------------------
INSERT INTO `users_info` VALUES ('111', '李四', '保密', '', '2019-01-04', 'ffd8fe61-76ca-41e5-90a7-62efabd2ad25.jpg');
INSERT INTO `users_info` VALUES ('15200000000', '自行车', '保密', '', '1996-02-07', 'default.jpg');
INSERT INTO `users_info` VALUES ('15210203040', 'lina', '女', '', '1990-01-01', 'a282530f-47a1-4af0-b927-e2037097a688.jpg');
INSERT INTO `users_info` VALUES ('15211111111', '彭于晏', '保密', '1111111@qq.com', '2000-01-13', 'default.jpg');
INSERT INTO `users_info` VALUES ('15222222222', '张三', '保密', NULL, '1990-01-01', 'default.jpg');
INSERT INTO `users_info` VALUES ('15277402877', '吴彦祖', '女', '1015157436@qq.com', '2019-06-05', '2e97e41e-d3b2-449d-bed9-ee339f860819.jpg');
INSERT INTO `users_info` VALUES ('15288888888', '吴彦祖', '男', '1015157436@qq.com', '2019-06-25', '4bc99a88-2fb7-419b-aadb-4031df2ac907.jpg');
INSERT INTO `users_info` VALUES ('15296192157', '1111', '保密', NULL, '1990-01-01', 'default.jpg');

SET FOREIGN_KEY_CHECKS = 1;
