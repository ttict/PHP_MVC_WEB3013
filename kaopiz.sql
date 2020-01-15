/*
 Navicat Premium Data Transfer

 Source Server         : WEB3013
 Source Server Type    : MySQL
 Source Server Version : 100137
 Source Host           : localhost:3306
 Source Schema         : kaopiz

 Target Server Type    : MySQL
 Target Server Version : 100137
 File Encoding         : 65001

 Date: 17/06/2019 16:24:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_name_unique`(`cate_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 't-shirt', NULL, NULL, NULL, NULL, -1);
INSERT INTO `categories` VALUES (2, 'Skinny Jean', NULL, NULL, NULL, NULL, -1);
INSERT INTO `categories` VALUES (3, 'pleated skirt', NULL, NULL, NULL, NULL, -1);
INSERT INTO `categories` VALUES (4, 'blazer', NULL, NULL, NULL, NULL, -1);
INSERT INTO `categories` VALUES (5, 'sweatshirt', NULL, NULL, NULL, NULL, -1);
INSERT INTO `categories` VALUES (6, 'Dress', NULL, NULL, NULL, NULL, -1);
INSERT INTO `categories` VALUES (7, 'backpack', NULL, NULL, NULL, NULL, -1);
INSERT INTO `categories` VALUES (8, '5ce288296699b', '144537', NULL, NULL, NULL, -1);
INSERT INTO `categories` VALUES (9, '5ce2886d31113', '513472', NULL, NULL, NULL, -1);
INSERT INTO `categories` VALUES (10, '5ce2888d9f725', '862396', NULL, NULL, NULL, -1);

-- ----------------------------
-- Table structure for invoice_detail
-- ----------------------------
DROP TABLE IF EXISTS `invoice_detail`;
CREATE TABLE `invoice_detail`  (
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_id`, `product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invoice_detail
-- ----------------------------
INSERT INTO `invoice_detail` VALUES (1, 8, 1, 500, NULL, NULL);
INSERT INTO `invoice_detail` VALUES (1, 50, 4, 1000, NULL, NULL);
INSERT INTO `invoice_detail` VALUES (2, 8, 3, 400, NULL, NULL);

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` int(11) NOT NULL DEFAULT 0,
  `payment_method` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invoices
-- ----------------------------
INSERT INTO `invoices` VALUES (1, 'thienth', '0987654321', 'thienth32@gmail.com', 'akdsfhakjdfh', 10000, 1, NULL, NULL);
INSERT INTO `invoices` VALUES (2, 'nguyen van a', '83942398423', 'aslkfjlsdkfj@kljfsdlkfj', 'sdkfjsdlkfjsdlkf', 100000, 1, NULL, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_01_05_070735_create_categories_table', 2);
INSERT INTO `migrations` VALUES (5, '2019_01_05_072544_alter_table_categories_update_column', 3);
INSERT INTO `migrations` VALUES (6, '2019_01_05_074643_create_products_table', 3);
INSERT INTO `migrations` VALUES (7, '2019_01_05_075227_create_invoices_table', 4);
INSERT INTO `migrations` VALUES (8, '2019_01_05_075449_create_invoice_detail_table', 4);
INSERT INTO `migrations` VALUES (9, '2019_01_12_014833_alter_table_products_add_views_column', 5);
INSERT INTO `migrations` VALUES (10, '2019_01_12_021523_create_table_product_galleries', 6);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for product_galleries
-- ----------------------------
DROP TABLE IF EXISTS `product_galleries`;
CREATE TABLE `product_galleries`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `img_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 408 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_galleries
-- ----------------------------
INSERT INTO `product_galleries` VALUES (1, 1, 'https://lorempixel.com/640/480/cats/?10546', NULL, NULL);
INSERT INTO `product_galleries` VALUES (2, 1, 'https://lorempixel.com/640/480/cats/?23905', NULL, NULL);
INSERT INTO `product_galleries` VALUES (3, 1, 'https://lorempixel.com/640/480/cats/?66813', NULL, NULL);
INSERT INTO `product_galleries` VALUES (4, 2, 'https://lorempixel.com/640/480/cats/?67185', NULL, NULL);
INSERT INTO `product_galleries` VALUES (5, 2, 'https://lorempixel.com/640/480/cats/?24575', NULL, NULL);
INSERT INTO `product_galleries` VALUES (6, 2, 'https://lorempixel.com/640/480/cats/?15621', NULL, NULL);
INSERT INTO `product_galleries` VALUES (7, 2, 'https://lorempixel.com/640/480/cats/?69292', NULL, NULL);
INSERT INTO `product_galleries` VALUES (8, 3, 'https://lorempixel.com/640/480/cats/?25547', NULL, NULL);
INSERT INTO `product_galleries` VALUES (9, 3, 'https://lorempixel.com/640/480/cats/?71965', NULL, NULL);
INSERT INTO `product_galleries` VALUES (10, 3, 'https://lorempixel.com/640/480/cats/?31612', NULL, NULL);
INSERT INTO `product_galleries` VALUES (11, 4, 'https://lorempixel.com/640/480/cats/?10227', NULL, NULL);
INSERT INTO `product_galleries` VALUES (12, 4, 'https://lorempixel.com/640/480/cats/?87389', NULL, NULL);
INSERT INTO `product_galleries` VALUES (13, 4, 'https://lorempixel.com/640/480/cats/?33849', NULL, NULL);
INSERT INTO `product_galleries` VALUES (14, 4, 'https://lorempixel.com/640/480/cats/?98511', NULL, NULL);
INSERT INTO `product_galleries` VALUES (15, 5, 'https://lorempixel.com/640/480/cats/?44170', NULL, NULL);
INSERT INTO `product_galleries` VALUES (16, 5, 'https://lorempixel.com/640/480/cats/?26460', NULL, NULL);
INSERT INTO `product_galleries` VALUES (17, 5, 'https://lorempixel.com/640/480/cats/?41734', NULL, NULL);
INSERT INTO `product_galleries` VALUES (18, 6, 'https://lorempixel.com/640/480/cats/?86850', NULL, NULL);
INSERT INTO `product_galleries` VALUES (19, 6, 'https://lorempixel.com/640/480/cats/?29948', NULL, NULL);
INSERT INTO `product_galleries` VALUES (20, 6, 'https://lorempixel.com/640/480/cats/?52631', NULL, NULL);
INSERT INTO `product_galleries` VALUES (21, 7, 'https://lorempixel.com/640/480/cats/?16016', NULL, NULL);
INSERT INTO `product_galleries` VALUES (22, 7, 'https://lorempixel.com/640/480/cats/?80666', NULL, NULL);
INSERT INTO `product_galleries` VALUES (23, 7, 'https://lorempixel.com/640/480/cats/?71484', NULL, NULL);
INSERT INTO `product_galleries` VALUES (24, 7, 'https://lorempixel.com/640/480/cats/?37459', NULL, NULL);
INSERT INTO `product_galleries` VALUES (25, 7, 'https://lorempixel.com/640/480/cats/?25810', NULL, NULL);
INSERT INTO `product_galleries` VALUES (26, 8, 'https://lorempixel.com/640/480/cats/?63687', NULL, NULL);
INSERT INTO `product_galleries` VALUES (27, 8, 'https://lorempixel.com/640/480/cats/?41774', NULL, NULL);
INSERT INTO `product_galleries` VALUES (28, 8, 'https://lorempixel.com/640/480/cats/?53737', NULL, NULL);
INSERT INTO `product_galleries` VALUES (29, 8, 'https://lorempixel.com/640/480/cats/?19013', NULL, NULL);
INSERT INTO `product_galleries` VALUES (30, 8, 'https://lorempixel.com/640/480/cats/?77785', NULL, NULL);
INSERT INTO `product_galleries` VALUES (31, 9, 'https://lorempixel.com/640/480/cats/?44243', NULL, NULL);
INSERT INTO `product_galleries` VALUES (32, 9, 'https://lorempixel.com/640/480/cats/?47469', NULL, NULL);
INSERT INTO `product_galleries` VALUES (33, 9, 'https://lorempixel.com/640/480/cats/?47198', NULL, NULL);
INSERT INTO `product_galleries` VALUES (34, 9, 'https://lorempixel.com/640/480/cats/?51295', NULL, NULL);
INSERT INTO `product_galleries` VALUES (35, 9, 'https://lorempixel.com/640/480/cats/?15267', NULL, NULL);
INSERT INTO `product_galleries` VALUES (36, 10, 'https://lorempixel.com/640/480/cats/?55076', NULL, NULL);
INSERT INTO `product_galleries` VALUES (37, 10, 'https://lorempixel.com/640/480/cats/?56526', NULL, NULL);
INSERT INTO `product_galleries` VALUES (38, 10, 'https://lorempixel.com/640/480/cats/?47395', NULL, NULL);
INSERT INTO `product_galleries` VALUES (39, 10, 'https://lorempixel.com/640/480/cats/?28764', NULL, NULL);
INSERT INTO `product_galleries` VALUES (40, 11, 'https://lorempixel.com/640/480/cats/?37310', NULL, NULL);
INSERT INTO `product_galleries` VALUES (41, 11, 'https://lorempixel.com/640/480/cats/?30736', NULL, NULL);
INSERT INTO `product_galleries` VALUES (42, 11, 'https://lorempixel.com/640/480/cats/?25207', NULL, NULL);
INSERT INTO `product_galleries` VALUES (43, 11, 'https://lorempixel.com/640/480/cats/?51950', NULL, NULL);
INSERT INTO `product_galleries` VALUES (44, 11, 'https://lorempixel.com/640/480/cats/?12853', NULL, NULL);
INSERT INTO `product_galleries` VALUES (45, 12, 'https://lorempixel.com/640/480/cats/?30453', NULL, NULL);
INSERT INTO `product_galleries` VALUES (46, 12, 'https://lorempixel.com/640/480/cats/?58005', NULL, NULL);
INSERT INTO `product_galleries` VALUES (47, 12, 'https://lorempixel.com/640/480/cats/?56907', NULL, NULL);
INSERT INTO `product_galleries` VALUES (48, 13, 'https://lorempixel.com/640/480/cats/?75762', NULL, NULL);
INSERT INTO `product_galleries` VALUES (49, 13, 'https://lorempixel.com/640/480/cats/?18853', NULL, NULL);
INSERT INTO `product_galleries` VALUES (50, 13, 'https://lorempixel.com/640/480/cats/?46606', NULL, NULL);
INSERT INTO `product_galleries` VALUES (51, 14, 'https://lorempixel.com/640/480/cats/?28151', NULL, NULL);
INSERT INTO `product_galleries` VALUES (52, 14, 'https://lorempixel.com/640/480/cats/?12919', NULL, NULL);
INSERT INTO `product_galleries` VALUES (53, 14, 'https://lorempixel.com/640/480/cats/?46318', NULL, NULL);
INSERT INTO `product_galleries` VALUES (54, 15, 'https://lorempixel.com/640/480/cats/?96128', NULL, NULL);
INSERT INTO `product_galleries` VALUES (55, 15, 'https://lorempixel.com/640/480/cats/?29842', NULL, NULL);
INSERT INTO `product_galleries` VALUES (56, 15, 'https://lorempixel.com/640/480/cats/?17676', NULL, NULL);
INSERT INTO `product_galleries` VALUES (57, 15, 'https://lorempixel.com/640/480/cats/?41467', NULL, NULL);
INSERT INTO `product_galleries` VALUES (58, 16, 'https://lorempixel.com/640/480/cats/?23140', NULL, NULL);
INSERT INTO `product_galleries` VALUES (59, 16, 'https://lorempixel.com/640/480/cats/?84316', NULL, NULL);
INSERT INTO `product_galleries` VALUES (60, 16, 'https://lorempixel.com/640/480/cats/?55984', NULL, NULL);
INSERT INTO `product_galleries` VALUES (61, 17, 'https://lorempixel.com/640/480/cats/?46900', NULL, NULL);
INSERT INTO `product_galleries` VALUES (62, 17, 'https://lorempixel.com/640/480/cats/?49131', NULL, NULL);
INSERT INTO `product_galleries` VALUES (63, 17, 'https://lorempixel.com/640/480/cats/?57927', NULL, NULL);
INSERT INTO `product_galleries` VALUES (64, 18, 'https://lorempixel.com/640/480/cats/?16479', NULL, NULL);
INSERT INTO `product_galleries` VALUES (65, 18, 'https://lorempixel.com/640/480/cats/?32847', NULL, NULL);
INSERT INTO `product_galleries` VALUES (66, 18, 'https://lorempixel.com/640/480/cats/?57846', NULL, NULL);
INSERT INTO `product_galleries` VALUES (67, 18, 'https://lorempixel.com/640/480/cats/?77881', NULL, NULL);
INSERT INTO `product_galleries` VALUES (68, 19, 'https://lorempixel.com/640/480/cats/?10022', NULL, NULL);
INSERT INTO `product_galleries` VALUES (69, 19, 'https://lorempixel.com/640/480/cats/?43867', NULL, NULL);
INSERT INTO `product_galleries` VALUES (70, 19, 'https://lorempixel.com/640/480/cats/?38764', NULL, NULL);
INSERT INTO `product_galleries` VALUES (71, 19, 'https://lorempixel.com/640/480/cats/?39340', NULL, NULL);
INSERT INTO `product_galleries` VALUES (72, 19, 'https://lorempixel.com/640/480/cats/?18785', NULL, NULL);
INSERT INTO `product_galleries` VALUES (73, 20, 'https://lorempixel.com/640/480/cats/?32524', NULL, NULL);
INSERT INTO `product_galleries` VALUES (74, 20, 'https://lorempixel.com/640/480/cats/?72784', NULL, NULL);
INSERT INTO `product_galleries` VALUES (75, 20, 'https://lorempixel.com/640/480/cats/?88463', NULL, NULL);
INSERT INTO `product_galleries` VALUES (76, 20, 'https://lorempixel.com/640/480/cats/?96818', NULL, NULL);
INSERT INTO `product_galleries` VALUES (77, 21, 'https://lorempixel.com/640/480/cats/?82362', NULL, NULL);
INSERT INTO `product_galleries` VALUES (78, 21, 'https://lorempixel.com/640/480/cats/?36685', NULL, NULL);
INSERT INTO `product_galleries` VALUES (79, 21, 'https://lorempixel.com/640/480/cats/?31232', NULL, NULL);
INSERT INTO `product_galleries` VALUES (80, 21, 'https://lorempixel.com/640/480/cats/?67896', NULL, NULL);
INSERT INTO `product_galleries` VALUES (81, 22, 'https://lorempixel.com/640/480/cats/?96932', NULL, NULL);
INSERT INTO `product_galleries` VALUES (82, 22, 'https://lorempixel.com/640/480/cats/?57154', NULL, NULL);
INSERT INTO `product_galleries` VALUES (83, 22, 'https://lorempixel.com/640/480/cats/?97056', NULL, NULL);
INSERT INTO `product_galleries` VALUES (84, 22, 'https://lorempixel.com/640/480/cats/?41302', NULL, NULL);
INSERT INTO `product_galleries` VALUES (85, 22, 'https://lorempixel.com/640/480/cats/?37458', NULL, NULL);
INSERT INTO `product_galleries` VALUES (87, 23, 'https://lorempixel.com/640/480/cats/?58748', NULL, NULL);
INSERT INTO `product_galleries` VALUES (90, 24, 'https://lorempixel.com/640/480/cats/?23126', NULL, NULL);
INSERT INTO `product_galleries` VALUES (91, 24, 'https://lorempixel.com/640/480/cats/?11787', NULL, NULL);
INSERT INTO `product_galleries` VALUES (94, 25, 'https://lorempixel.com/640/480/cats/?33367', NULL, NULL);
INSERT INTO `product_galleries` VALUES (95, 25, 'https://lorempixel.com/640/480/cats/?98762', NULL, NULL);
INSERT INTO `product_galleries` VALUES (96, 25, 'https://lorempixel.com/640/480/cats/?87512', NULL, NULL);
INSERT INTO `product_galleries` VALUES (97, 25, 'https://lorempixel.com/640/480/cats/?61615', NULL, NULL);
INSERT INTO `product_galleries` VALUES (98, 26, 'https://lorempixel.com/640/480/cats/?11866', NULL, NULL);
INSERT INTO `product_galleries` VALUES (99, 26, 'https://lorempixel.com/640/480/cats/?53197', NULL, NULL);
INSERT INTO `product_galleries` VALUES (100, 26, 'https://lorempixel.com/640/480/cats/?28940', NULL, NULL);
INSERT INTO `product_galleries` VALUES (101, 26, 'https://lorempixel.com/640/480/cats/?24319', NULL, NULL);
INSERT INTO `product_galleries` VALUES (102, 26, 'https://lorempixel.com/640/480/cats/?96222', NULL, NULL);
INSERT INTO `product_galleries` VALUES (103, 27, 'https://lorempixel.com/640/480/cats/?51850', NULL, NULL);
INSERT INTO `product_galleries` VALUES (104, 27, 'https://lorempixel.com/640/480/cats/?76288', NULL, NULL);
INSERT INTO `product_galleries` VALUES (105, 27, 'https://lorempixel.com/640/480/cats/?61211', NULL, NULL);
INSERT INTO `product_galleries` VALUES (106, 27, 'https://lorempixel.com/640/480/cats/?27911', NULL, NULL);
INSERT INTO `product_galleries` VALUES (107, 28, 'https://lorempixel.com/640/480/cats/?20731', NULL, NULL);
INSERT INTO `product_galleries` VALUES (108, 28, 'https://lorempixel.com/640/480/cats/?51063', NULL, NULL);
INSERT INTO `product_galleries` VALUES (109, 28, 'https://lorempixel.com/640/480/cats/?82564', NULL, NULL);
INSERT INTO `product_galleries` VALUES (110, 29, 'https://lorempixel.com/640/480/cats/?89182', NULL, NULL);
INSERT INTO `product_galleries` VALUES (111, 29, 'https://lorempixel.com/640/480/cats/?59597', NULL, NULL);
INSERT INTO `product_galleries` VALUES (112, 29, 'https://lorempixel.com/640/480/cats/?97357', NULL, NULL);
INSERT INTO `product_galleries` VALUES (116, 31, 'https://lorempixel.com/640/480/cats/?85442', NULL, NULL);
INSERT INTO `product_galleries` VALUES (117, 31, 'https://lorempixel.com/640/480/cats/?75400', NULL, NULL);
INSERT INTO `product_galleries` VALUES (118, 31, 'https://lorempixel.com/640/480/cats/?92437', NULL, NULL);
INSERT INTO `product_galleries` VALUES (122, 33, 'https://lorempixel.com/640/480/cats/?66297', NULL, NULL);
INSERT INTO `product_galleries` VALUES (123, 33, 'https://lorempixel.com/640/480/cats/?76125', NULL, NULL);
INSERT INTO `product_galleries` VALUES (124, 33, 'https://lorempixel.com/640/480/cats/?48280', NULL, NULL);
INSERT INTO `product_galleries` VALUES (125, 34, 'https://lorempixel.com/640/480/cats/?10008', NULL, NULL);
INSERT INTO `product_galleries` VALUES (126, 34, 'https://lorempixel.com/640/480/cats/?56069', NULL, NULL);
INSERT INTO `product_galleries` VALUES (127, 34, 'https://lorempixel.com/640/480/cats/?33208', NULL, NULL);
INSERT INTO `product_galleries` VALUES (128, 34, 'https://lorempixel.com/640/480/cats/?50674', NULL, NULL);
INSERT INTO `product_galleries` VALUES (129, 35, 'https://lorempixel.com/640/480/cats/?30989', NULL, NULL);
INSERT INTO `product_galleries` VALUES (130, 35, 'https://lorempixel.com/640/480/cats/?67180', NULL, NULL);
INSERT INTO `product_galleries` VALUES (131, 35, 'https://lorempixel.com/640/480/cats/?62204', NULL, NULL);
INSERT INTO `product_galleries` VALUES (132, 35, 'https://lorempixel.com/640/480/cats/?94888', NULL, NULL);
INSERT INTO `product_galleries` VALUES (133, 35, 'https://lorempixel.com/640/480/cats/?40690', NULL, NULL);
INSERT INTO `product_galleries` VALUES (134, 36, 'https://lorempixel.com/640/480/cats/?72384', NULL, NULL);
INSERT INTO `product_galleries` VALUES (135, 36, 'https://lorempixel.com/640/480/cats/?47333', NULL, NULL);
INSERT INTO `product_galleries` VALUES (136, 36, 'https://lorempixel.com/640/480/cats/?34049', NULL, NULL);
INSERT INTO `product_galleries` VALUES (137, 36, 'https://lorempixel.com/640/480/cats/?23086', NULL, NULL);
INSERT INTO `product_galleries` VALUES (138, 36, 'https://lorempixel.com/640/480/cats/?53368', NULL, NULL);
INSERT INTO `product_galleries` VALUES (139, 37, 'https://lorempixel.com/640/480/cats/?97320', NULL, NULL);
INSERT INTO `product_galleries` VALUES (140, 37, 'https://lorempixel.com/640/480/cats/?15688', NULL, NULL);
INSERT INTO `product_galleries` VALUES (141, 37, 'https://lorempixel.com/640/480/cats/?19290', NULL, NULL);
INSERT INTO `product_galleries` VALUES (142, 37, 'https://lorempixel.com/640/480/cats/?14295', NULL, NULL);
INSERT INTO `product_galleries` VALUES (143, 37, 'https://lorempixel.com/640/480/cats/?90872', NULL, NULL);
INSERT INTO `product_galleries` VALUES (144, 38, 'https://lorempixel.com/640/480/cats/?96203', NULL, NULL);
INSERT INTO `product_galleries` VALUES (145, 38, 'https://lorempixel.com/640/480/cats/?59453', NULL, NULL);
INSERT INTO `product_galleries` VALUES (146, 38, 'https://lorempixel.com/640/480/cats/?66525', NULL, NULL);
INSERT INTO `product_galleries` VALUES (147, 38, 'https://lorempixel.com/640/480/cats/?77968', NULL, NULL);
INSERT INTO `product_galleries` VALUES (148, 39, 'https://lorempixel.com/640/480/cats/?42720', NULL, NULL);
INSERT INTO `product_galleries` VALUES (149, 39, 'https://lorempixel.com/640/480/cats/?61860', NULL, NULL);
INSERT INTO `product_galleries` VALUES (150, 39, 'https://lorempixel.com/640/480/cats/?56031', NULL, NULL);
INSERT INTO `product_galleries` VALUES (151, 40, 'https://lorempixel.com/640/480/cats/?43305', NULL, NULL);
INSERT INTO `product_galleries` VALUES (152, 40, 'https://lorempixel.com/640/480/cats/?77715', NULL, NULL);
INSERT INTO `product_galleries` VALUES (153, 40, 'https://lorempixel.com/640/480/cats/?96875', NULL, NULL);
INSERT INTO `product_galleries` VALUES (154, 40, 'https://lorempixel.com/640/480/cats/?79975', NULL, NULL);
INSERT INTO `product_galleries` VALUES (155, 41, 'https://lorempixel.com/640/480/cats/?65481', NULL, NULL);
INSERT INTO `product_galleries` VALUES (156, 41, 'https://lorempixel.com/640/480/cats/?77041', NULL, NULL);
INSERT INTO `product_galleries` VALUES (157, 41, 'https://lorempixel.com/640/480/cats/?79734', NULL, NULL);
INSERT INTO `product_galleries` VALUES (158, 42, 'https://lorempixel.com/640/480/cats/?42028', NULL, NULL);
INSERT INTO `product_galleries` VALUES (159, 42, 'https://lorempixel.com/640/480/cats/?97900', NULL, NULL);
INSERT INTO `product_galleries` VALUES (160, 42, 'https://lorempixel.com/640/480/cats/?32792', NULL, NULL);
INSERT INTO `product_galleries` VALUES (161, 42, 'https://lorempixel.com/640/480/cats/?96427', NULL, NULL);
INSERT INTO `product_galleries` VALUES (162, 43, 'https://lorempixel.com/640/480/cats/?18404', NULL, NULL);
INSERT INTO `product_galleries` VALUES (163, 43, 'https://lorempixel.com/640/480/cats/?30561', NULL, NULL);
INSERT INTO `product_galleries` VALUES (164, 43, 'https://lorempixel.com/640/480/cats/?82719', NULL, NULL);
INSERT INTO `product_galleries` VALUES (165, 43, 'https://lorempixel.com/640/480/cats/?54915', NULL, NULL);
INSERT INTO `product_galleries` VALUES (166, 43, 'https://lorempixel.com/640/480/cats/?59557', NULL, NULL);
INSERT INTO `product_galleries` VALUES (167, 44, 'https://lorempixel.com/640/480/cats/?13149', NULL, NULL);
INSERT INTO `product_galleries` VALUES (168, 44, 'https://lorempixel.com/640/480/cats/?62382', NULL, NULL);
INSERT INTO `product_galleries` VALUES (169, 44, 'https://lorempixel.com/640/480/cats/?65684', NULL, NULL);
INSERT INTO `product_galleries` VALUES (170, 44, 'https://lorempixel.com/640/480/cats/?63440', NULL, NULL);
INSERT INTO `product_galleries` VALUES (171, 45, 'https://lorempixel.com/640/480/cats/?70977', NULL, NULL);
INSERT INTO `product_galleries` VALUES (172, 45, 'https://lorempixel.com/640/480/cats/?64695', NULL, NULL);
INSERT INTO `product_galleries` VALUES (173, 45, 'https://lorempixel.com/640/480/cats/?98096', NULL, NULL);
INSERT INTO `product_galleries` VALUES (174, 45, 'https://lorempixel.com/640/480/cats/?99658', NULL, NULL);
INSERT INTO `product_galleries` VALUES (175, 45, 'https://lorempixel.com/640/480/cats/?28580', NULL, NULL);
INSERT INTO `product_galleries` VALUES (176, 46, 'https://lorempixel.com/640/480/cats/?41240', NULL, NULL);
INSERT INTO `product_galleries` VALUES (177, 46, 'https://lorempixel.com/640/480/cats/?26337', NULL, NULL);
INSERT INTO `product_galleries` VALUES (178, 46, 'https://lorempixel.com/640/480/cats/?93630', NULL, NULL);
INSERT INTO `product_galleries` VALUES (179, 46, 'https://lorempixel.com/640/480/cats/?84024', NULL, NULL);
INSERT INTO `product_galleries` VALUES (180, 47, 'https://lorempixel.com/640/480/cats/?99428', NULL, NULL);
INSERT INTO `product_galleries` VALUES (181, 47, 'https://lorempixel.com/640/480/cats/?26891', NULL, NULL);
INSERT INTO `product_galleries` VALUES (182, 47, 'https://lorempixel.com/640/480/cats/?81523', NULL, NULL);
INSERT INTO `product_galleries` VALUES (183, 47, 'https://lorempixel.com/640/480/cats/?85579', NULL, NULL);
INSERT INTO `product_galleries` VALUES (184, 47, 'https://lorempixel.com/640/480/cats/?91038', NULL, NULL);
INSERT INTO `product_galleries` VALUES (185, 48, 'https://lorempixel.com/640/480/cats/?82464', NULL, NULL);
INSERT INTO `product_galleries` VALUES (186, 48, 'https://lorempixel.com/640/480/cats/?89880', NULL, NULL);
INSERT INTO `product_galleries` VALUES (187, 48, 'https://lorempixel.com/640/480/cats/?96576', NULL, NULL);
INSERT INTO `product_galleries` VALUES (188, 49, 'https://lorempixel.com/640/480/cats/?57634', NULL, NULL);
INSERT INTO `product_galleries` VALUES (189, 49, 'https://lorempixel.com/640/480/cats/?56556', NULL, NULL);
INSERT INTO `product_galleries` VALUES (190, 49, 'https://lorempixel.com/640/480/cats/?93115', NULL, NULL);
INSERT INTO `product_galleries` VALUES (191, 49, 'https://lorempixel.com/640/480/cats/?13609', NULL, NULL);
INSERT INTO `product_galleries` VALUES (192, 50, 'https://lorempixel.com/640/480/cats/?98587', NULL, NULL);
INSERT INTO `product_galleries` VALUES (193, 50, 'https://lorempixel.com/640/480/cats/?52770', NULL, NULL);
INSERT INTO `product_galleries` VALUES (194, 50, 'https://lorempixel.com/640/480/cats/?66402', NULL, NULL);
INSERT INTO `product_galleries` VALUES (195, 51, 'https://lorempixel.com/640/480/cats/?85831', NULL, NULL);
INSERT INTO `product_galleries` VALUES (196, 51, 'https://lorempixel.com/640/480/cats/?76195', NULL, NULL);
INSERT INTO `product_galleries` VALUES (197, 51, 'https://lorempixel.com/640/480/cats/?72317', NULL, NULL);
INSERT INTO `product_galleries` VALUES (198, 52, 'https://lorempixel.com/640/480/cats/?19033', NULL, NULL);
INSERT INTO `product_galleries` VALUES (199, 52, 'https://lorempixel.com/640/480/cats/?87591', NULL, NULL);
INSERT INTO `product_galleries` VALUES (200, 52, 'https://lorempixel.com/640/480/cats/?60897', NULL, NULL);
INSERT INTO `product_galleries` VALUES (201, 52, 'https://lorempixel.com/640/480/cats/?54972', NULL, NULL);
INSERT INTO `product_galleries` VALUES (202, 53, 'https://lorempixel.com/640/480/cats/?69178', NULL, NULL);
INSERT INTO `product_galleries` VALUES (203, 53, 'https://lorempixel.com/640/480/cats/?29671', NULL, NULL);
INSERT INTO `product_galleries` VALUES (204, 53, 'https://lorempixel.com/640/480/cats/?91658', NULL, NULL);
INSERT INTO `product_galleries` VALUES (205, 54, 'https://lorempixel.com/640/480/cats/?76412', NULL, NULL);
INSERT INTO `product_galleries` VALUES (206, 54, 'https://lorempixel.com/640/480/cats/?24867', NULL, NULL);
INSERT INTO `product_galleries` VALUES (207, 54, 'https://lorempixel.com/640/480/cats/?54658', NULL, NULL);
INSERT INTO `product_galleries` VALUES (208, 55, 'https://lorempixel.com/640/480/cats/?54009', NULL, NULL);
INSERT INTO `product_galleries` VALUES (209, 55, 'https://lorempixel.com/640/480/cats/?41465', NULL, NULL);
INSERT INTO `product_galleries` VALUES (210, 55, 'https://lorempixel.com/640/480/cats/?51223', NULL, NULL);
INSERT INTO `product_galleries` VALUES (211, 55, 'https://lorempixel.com/640/480/cats/?90484', NULL, NULL);
INSERT INTO `product_galleries` VALUES (212, 56, 'https://lorempixel.com/640/480/cats/?67326', NULL, NULL);
INSERT INTO `product_galleries` VALUES (213, 56, 'https://lorempixel.com/640/480/cats/?61444', NULL, NULL);
INSERT INTO `product_galleries` VALUES (214, 56, 'https://lorempixel.com/640/480/cats/?69381', NULL, NULL);
INSERT INTO `product_galleries` VALUES (215, 57, 'https://lorempixel.com/640/480/cats/?59653', NULL, NULL);
INSERT INTO `product_galleries` VALUES (216, 57, 'https://lorempixel.com/640/480/cats/?77492', NULL, NULL);
INSERT INTO `product_galleries` VALUES (217, 57, 'https://lorempixel.com/640/480/cats/?29601', NULL, NULL);
INSERT INTO `product_galleries` VALUES (218, 57, 'https://lorempixel.com/640/480/cats/?33522', NULL, NULL);
INSERT INTO `product_galleries` VALUES (219, 57, 'https://lorempixel.com/640/480/cats/?96833', NULL, NULL);
INSERT INTO `product_galleries` VALUES (220, 58, 'https://lorempixel.com/640/480/cats/?31175', NULL, NULL);
INSERT INTO `product_galleries` VALUES (221, 58, 'https://lorempixel.com/640/480/cats/?87020', NULL, NULL);
INSERT INTO `product_galleries` VALUES (222, 58, 'https://lorempixel.com/640/480/cats/?29338', NULL, NULL);
INSERT INTO `product_galleries` VALUES (223, 58, 'https://lorempixel.com/640/480/cats/?97502', NULL, NULL);
INSERT INTO `product_galleries` VALUES (224, 58, 'https://lorempixel.com/640/480/cats/?17065', NULL, NULL);
INSERT INTO `product_galleries` VALUES (225, 59, 'https://lorempixel.com/640/480/cats/?36711', NULL, NULL);
INSERT INTO `product_galleries` VALUES (226, 59, 'https://lorempixel.com/640/480/cats/?23487', NULL, NULL);
INSERT INTO `product_galleries` VALUES (227, 59, 'https://lorempixel.com/640/480/cats/?52090', NULL, NULL);
INSERT INTO `product_galleries` VALUES (228, 59, 'https://lorempixel.com/640/480/cats/?25114', NULL, NULL);
INSERT INTO `product_galleries` VALUES (229, 60, 'https://lorempixel.com/640/480/cats/?94806', NULL, NULL);
INSERT INTO `product_galleries` VALUES (230, 60, 'https://lorempixel.com/640/480/cats/?65979', NULL, NULL);
INSERT INTO `product_galleries` VALUES (231, 60, 'https://lorempixel.com/640/480/cats/?16462', NULL, NULL);
INSERT INTO `product_galleries` VALUES (232, 60, 'https://lorempixel.com/640/480/cats/?58719', NULL, NULL);
INSERT INTO `product_galleries` VALUES (233, 60, 'https://lorempixel.com/640/480/cats/?38888', NULL, NULL);
INSERT INTO `product_galleries` VALUES (234, 61, 'https://lorempixel.com/640/480/cats/?43706', NULL, NULL);
INSERT INTO `product_galleries` VALUES (235, 61, 'https://lorempixel.com/640/480/cats/?49139', NULL, NULL);
INSERT INTO `product_galleries` VALUES (236, 61, 'https://lorempixel.com/640/480/cats/?72622', NULL, NULL);
INSERT INTO `product_galleries` VALUES (237, 62, 'https://lorempixel.com/640/480/cats/?91536', NULL, NULL);
INSERT INTO `product_galleries` VALUES (238, 62, 'https://lorempixel.com/640/480/cats/?27182', NULL, NULL);
INSERT INTO `product_galleries` VALUES (239, 62, 'https://lorempixel.com/640/480/cats/?39972', NULL, NULL);
INSERT INTO `product_galleries` VALUES (240, 62, 'https://lorempixel.com/640/480/cats/?97179', NULL, NULL);
INSERT INTO `product_galleries` VALUES (241, 63, 'https://lorempixel.com/640/480/cats/?95300', NULL, NULL);
INSERT INTO `product_galleries` VALUES (242, 63, 'https://lorempixel.com/640/480/cats/?73870', NULL, NULL);
INSERT INTO `product_galleries` VALUES (243, 63, 'https://lorempixel.com/640/480/cats/?76734', NULL, NULL);
INSERT INTO `product_galleries` VALUES (244, 63, 'https://lorempixel.com/640/480/cats/?52520', NULL, NULL);
INSERT INTO `product_galleries` VALUES (245, 63, 'https://lorempixel.com/640/480/cats/?71973', NULL, NULL);
INSERT INTO `product_galleries` VALUES (246, 64, 'https://lorempixel.com/640/480/cats/?71530', NULL, NULL);
INSERT INTO `product_galleries` VALUES (247, 64, 'https://lorempixel.com/640/480/cats/?64561', NULL, NULL);
INSERT INTO `product_galleries` VALUES (248, 64, 'https://lorempixel.com/640/480/cats/?13452', NULL, NULL);
INSERT INTO `product_galleries` VALUES (249, 65, 'https://lorempixel.com/640/480/cats/?15601', NULL, NULL);
INSERT INTO `product_galleries` VALUES (250, 65, 'https://lorempixel.com/640/480/cats/?87968', NULL, NULL);
INSERT INTO `product_galleries` VALUES (251, 65, 'https://lorempixel.com/640/480/cats/?88828', NULL, NULL);
INSERT INTO `product_galleries` VALUES (252, 65, 'https://lorempixel.com/640/480/cats/?89200', NULL, NULL);
INSERT INTO `product_galleries` VALUES (253, 66, 'https://lorempixel.com/640/480/cats/?51062', NULL, NULL);
INSERT INTO `product_galleries` VALUES (254, 66, 'https://lorempixel.com/640/480/cats/?92177', NULL, NULL);
INSERT INTO `product_galleries` VALUES (255, 66, 'https://lorempixel.com/640/480/cats/?48145', NULL, NULL);
INSERT INTO `product_galleries` VALUES (256, 67, 'https://lorempixel.com/640/480/cats/?29025', NULL, NULL);
INSERT INTO `product_galleries` VALUES (257, 67, 'https://lorempixel.com/640/480/cats/?37588', NULL, NULL);
INSERT INTO `product_galleries` VALUES (258, 67, 'https://lorempixel.com/640/480/cats/?47573', NULL, NULL);
INSERT INTO `product_galleries` VALUES (259, 68, 'https://lorempixel.com/640/480/cats/?62921', NULL, NULL);
INSERT INTO `product_galleries` VALUES (260, 68, 'https://lorempixel.com/640/480/cats/?42596', NULL, NULL);
INSERT INTO `product_galleries` VALUES (261, 68, 'https://lorempixel.com/640/480/cats/?24186', NULL, NULL);
INSERT INTO `product_galleries` VALUES (262, 68, 'https://lorempixel.com/640/480/cats/?15940', NULL, NULL);
INSERT INTO `product_galleries` VALUES (263, 69, 'https://lorempixel.com/640/480/cats/?17788', NULL, NULL);
INSERT INTO `product_galleries` VALUES (264, 69, 'https://lorempixel.com/640/480/cats/?10763', NULL, NULL);
INSERT INTO `product_galleries` VALUES (265, 69, 'https://lorempixel.com/640/480/cats/?83058', NULL, NULL);
INSERT INTO `product_galleries` VALUES (266, 69, 'https://lorempixel.com/640/480/cats/?95174', NULL, NULL);
INSERT INTO `product_galleries` VALUES (267, 69, 'https://lorempixel.com/640/480/cats/?86660', NULL, NULL);
INSERT INTO `product_galleries` VALUES (268, 70, 'https://lorempixel.com/640/480/cats/?91763', NULL, NULL);
INSERT INTO `product_galleries` VALUES (269, 70, 'https://lorempixel.com/640/480/cats/?94007', NULL, NULL);
INSERT INTO `product_galleries` VALUES (270, 70, 'https://lorempixel.com/640/480/cats/?28914', NULL, NULL);
INSERT INTO `product_galleries` VALUES (271, 71, 'https://lorempixel.com/640/480/cats/?56913', NULL, NULL);
INSERT INTO `product_galleries` VALUES (272, 71, 'https://lorempixel.com/640/480/cats/?83906', NULL, NULL);
INSERT INTO `product_galleries` VALUES (273, 71, 'https://lorempixel.com/640/480/cats/?67868', NULL, NULL);
INSERT INTO `product_galleries` VALUES (274, 72, 'https://lorempixel.com/640/480/cats/?22942', NULL, NULL);
INSERT INTO `product_galleries` VALUES (275, 72, 'https://lorempixel.com/640/480/cats/?72215', NULL, NULL);
INSERT INTO `product_galleries` VALUES (276, 72, 'https://lorempixel.com/640/480/cats/?17840', NULL, NULL);
INSERT INTO `product_galleries` VALUES (277, 73, 'https://lorempixel.com/640/480/cats/?49262', NULL, NULL);
INSERT INTO `product_galleries` VALUES (278, 73, 'https://lorempixel.com/640/480/cats/?83690', NULL, NULL);
INSERT INTO `product_galleries` VALUES (279, 73, 'https://lorempixel.com/640/480/cats/?80454', NULL, NULL);
INSERT INTO `product_galleries` VALUES (280, 73, 'https://lorempixel.com/640/480/cats/?93506', NULL, NULL);
INSERT INTO `product_galleries` VALUES (281, 74, 'https://lorempixel.com/640/480/cats/?60060', NULL, NULL);
INSERT INTO `product_galleries` VALUES (282, 74, 'https://lorempixel.com/640/480/cats/?76305', NULL, NULL);
INSERT INTO `product_galleries` VALUES (283, 74, 'https://lorempixel.com/640/480/cats/?26573', NULL, NULL);
INSERT INTO `product_galleries` VALUES (284, 74, 'https://lorempixel.com/640/480/cats/?41199', NULL, NULL);
INSERT INTO `product_galleries` VALUES (285, 74, 'https://lorempixel.com/640/480/cats/?92334', NULL, NULL);
INSERT INTO `product_galleries` VALUES (286, 75, 'https://lorempixel.com/640/480/cats/?50670', NULL, NULL);
INSERT INTO `product_galleries` VALUES (287, 75, 'https://lorempixel.com/640/480/cats/?64812', NULL, NULL);
INSERT INTO `product_galleries` VALUES (288, 75, 'https://lorempixel.com/640/480/cats/?78308', NULL, NULL);
INSERT INTO `product_galleries` VALUES (289, 76, 'https://lorempixel.com/640/480/cats/?62819', NULL, NULL);
INSERT INTO `product_galleries` VALUES (290, 76, 'https://lorempixel.com/640/480/cats/?83129', NULL, NULL);
INSERT INTO `product_galleries` VALUES (291, 76, 'https://lorempixel.com/640/480/cats/?32736', NULL, NULL);
INSERT INTO `product_galleries` VALUES (292, 76, 'https://lorempixel.com/640/480/cats/?55558', NULL, NULL);
INSERT INTO `product_galleries` VALUES (293, 77, 'https://lorempixel.com/640/480/cats/?70344', NULL, NULL);
INSERT INTO `product_galleries` VALUES (294, 77, 'https://lorempixel.com/640/480/cats/?89445', NULL, NULL);
INSERT INTO `product_galleries` VALUES (295, 77, 'https://lorempixel.com/640/480/cats/?77880', NULL, NULL);
INSERT INTO `product_galleries` VALUES (296, 77, 'https://lorempixel.com/640/480/cats/?28495', NULL, NULL);
INSERT INTO `product_galleries` VALUES (297, 78, 'https://lorempixel.com/640/480/cats/?49993', NULL, NULL);
INSERT INTO `product_galleries` VALUES (298, 78, 'https://lorempixel.com/640/480/cats/?88527', NULL, NULL);
INSERT INTO `product_galleries` VALUES (299, 78, 'https://lorempixel.com/640/480/cats/?26314', NULL, NULL);
INSERT INTO `product_galleries` VALUES (300, 79, 'https://lorempixel.com/640/480/cats/?32978', NULL, NULL);
INSERT INTO `product_galleries` VALUES (301, 79, 'https://lorempixel.com/640/480/cats/?28861', NULL, NULL);
INSERT INTO `product_galleries` VALUES (302, 79, 'https://lorempixel.com/640/480/cats/?22483', NULL, NULL);
INSERT INTO `product_galleries` VALUES (303, 79, 'https://lorempixel.com/640/480/cats/?22837', NULL, NULL);
INSERT INTO `product_galleries` VALUES (304, 80, 'https://lorempixel.com/640/480/cats/?36945', NULL, NULL);
INSERT INTO `product_galleries` VALUES (305, 80, 'https://lorempixel.com/640/480/cats/?78182', NULL, NULL);
INSERT INTO `product_galleries` VALUES (306, 80, 'https://lorempixel.com/640/480/cats/?35643', NULL, NULL);
INSERT INTO `product_galleries` VALUES (307, 80, 'https://lorempixel.com/640/480/cats/?56801', NULL, NULL);
INSERT INTO `product_galleries` VALUES (308, 81, 'https://lorempixel.com/640/480/cats/?35066', NULL, NULL);
INSERT INTO `product_galleries` VALUES (309, 81, 'https://lorempixel.com/640/480/cats/?56994', NULL, NULL);
INSERT INTO `product_galleries` VALUES (310, 81, 'https://lorempixel.com/640/480/cats/?72359', NULL, NULL);
INSERT INTO `product_galleries` VALUES (311, 81, 'https://lorempixel.com/640/480/cats/?75484', NULL, NULL);
INSERT INTO `product_galleries` VALUES (312, 81, 'https://lorempixel.com/640/480/cats/?36072', NULL, NULL);
INSERT INTO `product_galleries` VALUES (313, 82, 'https://lorempixel.com/640/480/cats/?69415', NULL, NULL);
INSERT INTO `product_galleries` VALUES (314, 82, 'https://lorempixel.com/640/480/cats/?32684', NULL, NULL);
INSERT INTO `product_galleries` VALUES (315, 82, 'https://lorempixel.com/640/480/cats/?83509', NULL, NULL);
INSERT INTO `product_galleries` VALUES (316, 82, 'https://lorempixel.com/640/480/cats/?68163', NULL, NULL);
INSERT INTO `product_galleries` VALUES (317, 83, 'https://lorempixel.com/640/480/cats/?34439', NULL, NULL);
INSERT INTO `product_galleries` VALUES (318, 83, 'https://lorempixel.com/640/480/cats/?12321', NULL, NULL);
INSERT INTO `product_galleries` VALUES (319, 83, 'https://lorempixel.com/640/480/cats/?99543', NULL, NULL);
INSERT INTO `product_galleries` VALUES (320, 84, 'https://lorempixel.com/640/480/cats/?83179', NULL, NULL);
INSERT INTO `product_galleries` VALUES (321, 84, 'https://lorempixel.com/640/480/cats/?37380', NULL, NULL);
INSERT INTO `product_galleries` VALUES (322, 84, 'https://lorempixel.com/640/480/cats/?84763', NULL, NULL);
INSERT INTO `product_galleries` VALUES (323, 85, 'https://lorempixel.com/640/480/cats/?61238', NULL, NULL);
INSERT INTO `product_galleries` VALUES (324, 85, 'https://lorempixel.com/640/480/cats/?63909', NULL, NULL);
INSERT INTO `product_galleries` VALUES (325, 85, 'https://lorempixel.com/640/480/cats/?77036', NULL, NULL);
INSERT INTO `product_galleries` VALUES (326, 85, 'https://lorempixel.com/640/480/cats/?33796', NULL, NULL);
INSERT INTO `product_galleries` VALUES (327, 85, 'https://lorempixel.com/640/480/cats/?58483', NULL, NULL);
INSERT INTO `product_galleries` VALUES (328, 86, 'https://lorempixel.com/640/480/cats/?10900', NULL, NULL);
INSERT INTO `product_galleries` VALUES (329, 86, 'https://lorempixel.com/640/480/cats/?98306', NULL, NULL);
INSERT INTO `product_galleries` VALUES (330, 86, 'https://lorempixel.com/640/480/cats/?52197', NULL, NULL);
INSERT INTO `product_galleries` VALUES (331, 86, 'https://lorempixel.com/640/480/cats/?95751', NULL, NULL);
INSERT INTO `product_galleries` VALUES (332, 87, 'https://lorempixel.com/640/480/cats/?41875', NULL, NULL);
INSERT INTO `product_galleries` VALUES (333, 87, 'https://lorempixel.com/640/480/cats/?41472', NULL, NULL);
INSERT INTO `product_galleries` VALUES (334, 87, 'https://lorempixel.com/640/480/cats/?84127', NULL, NULL);
INSERT INTO `product_galleries` VALUES (335, 87, 'https://lorempixel.com/640/480/cats/?34285', NULL, NULL);
INSERT INTO `product_galleries` VALUES (336, 88, 'https://lorempixel.com/640/480/cats/?39336', NULL, NULL);
INSERT INTO `product_galleries` VALUES (337, 88, 'https://lorempixel.com/640/480/cats/?64044', NULL, NULL);
INSERT INTO `product_galleries` VALUES (338, 88, 'https://lorempixel.com/640/480/cats/?22783', NULL, NULL);
INSERT INTO `product_galleries` VALUES (339, 89, 'https://lorempixel.com/640/480/cats/?29636', NULL, NULL);
INSERT INTO `product_galleries` VALUES (340, 89, 'https://lorempixel.com/640/480/cats/?43731', NULL, NULL);
INSERT INTO `product_galleries` VALUES (341, 89, 'https://lorempixel.com/640/480/cats/?19978', NULL, NULL);
INSERT INTO `product_galleries` VALUES (342, 89, 'https://lorempixel.com/640/480/cats/?88288', NULL, NULL);
INSERT INTO `product_galleries` VALUES (343, 89, 'https://lorempixel.com/640/480/cats/?83141', NULL, NULL);
INSERT INTO `product_galleries` VALUES (344, 90, 'https://lorempixel.com/640/480/cats/?73346', NULL, NULL);
INSERT INTO `product_galleries` VALUES (345, 90, 'https://lorempixel.com/640/480/cats/?96721', NULL, NULL);
INSERT INTO `product_galleries` VALUES (346, 90, 'https://lorempixel.com/640/480/cats/?76491', NULL, NULL);
INSERT INTO `product_galleries` VALUES (347, 90, 'https://lorempixel.com/640/480/cats/?41459', NULL, NULL);
INSERT INTO `product_galleries` VALUES (348, 90, 'https://lorempixel.com/640/480/cats/?21570', NULL, NULL);
INSERT INTO `product_galleries` VALUES (349, 91, 'https://lorempixel.com/640/480/cats/?28548', NULL, NULL);
INSERT INTO `product_galleries` VALUES (350, 91, 'https://lorempixel.com/640/480/cats/?67578', NULL, NULL);
INSERT INTO `product_galleries` VALUES (351, 91, 'https://lorempixel.com/640/480/cats/?28660', NULL, NULL);
INSERT INTO `product_galleries` VALUES (352, 91, 'https://lorempixel.com/640/480/cats/?63472', NULL, NULL);
INSERT INTO `product_galleries` VALUES (353, 92, 'https://lorempixel.com/640/480/cats/?30587', NULL, NULL);
INSERT INTO `product_galleries` VALUES (354, 92, 'https://lorempixel.com/640/480/cats/?79295', NULL, NULL);
INSERT INTO `product_galleries` VALUES (355, 92, 'https://lorempixel.com/640/480/cats/?75003', NULL, NULL);
INSERT INTO `product_galleries` VALUES (356, 92, 'https://lorempixel.com/640/480/cats/?84365', NULL, NULL);
INSERT INTO `product_galleries` VALUES (357, 93, 'https://lorempixel.com/640/480/cats/?69509', NULL, NULL);
INSERT INTO `product_galleries` VALUES (358, 93, 'https://lorempixel.com/640/480/cats/?83933', NULL, NULL);
INSERT INTO `product_galleries` VALUES (359, 93, 'https://lorempixel.com/640/480/cats/?19892', NULL, NULL);
INSERT INTO `product_galleries` VALUES (360, 93, 'https://lorempixel.com/640/480/cats/?41532', NULL, NULL);
INSERT INTO `product_galleries` VALUES (361, 94, 'https://lorempixel.com/640/480/cats/?67116', NULL, NULL);
INSERT INTO `product_galleries` VALUES (362, 94, 'https://lorempixel.com/640/480/cats/?36441', NULL, NULL);
INSERT INTO `product_galleries` VALUES (363, 94, 'https://lorempixel.com/640/480/cats/?16388', NULL, NULL);
INSERT INTO `product_galleries` VALUES (364, 94, 'https://lorempixel.com/640/480/cats/?30963', NULL, NULL);
INSERT INTO `product_galleries` VALUES (365, 95, 'https://lorempixel.com/640/480/cats/?85888', NULL, NULL);
INSERT INTO `product_galleries` VALUES (366, 95, 'https://lorempixel.com/640/480/cats/?22352', NULL, NULL);
INSERT INTO `product_galleries` VALUES (367, 95, 'https://lorempixel.com/640/480/cats/?42291', NULL, NULL);
INSERT INTO `product_galleries` VALUES (368, 95, 'https://lorempixel.com/640/480/cats/?91372', NULL, NULL);
INSERT INTO `product_galleries` VALUES (369, 96, 'https://lorempixel.com/640/480/cats/?59349', NULL, NULL);
INSERT INTO `product_galleries` VALUES (370, 96, 'https://lorempixel.com/640/480/cats/?83747', NULL, NULL);
INSERT INTO `product_galleries` VALUES (371, 96, 'https://lorempixel.com/640/480/cats/?32735', NULL, NULL);
INSERT INTO `product_galleries` VALUES (372, 97, 'https://lorempixel.com/640/480/cats/?87529', NULL, NULL);
INSERT INTO `product_galleries` VALUES (373, 97, 'https://lorempixel.com/640/480/cats/?42776', NULL, NULL);
INSERT INTO `product_galleries` VALUES (374, 97, 'https://lorempixel.com/640/480/cats/?24658', NULL, NULL);
INSERT INTO `product_galleries` VALUES (375, 97, 'https://lorempixel.com/640/480/cats/?36707', NULL, NULL);
INSERT INTO `product_galleries` VALUES (376, 97, 'https://lorempixel.com/640/480/cats/?74194', NULL, NULL);
INSERT INTO `product_galleries` VALUES (377, 98, 'https://lorempixel.com/640/480/cats/?77399', NULL, NULL);
INSERT INTO `product_galleries` VALUES (378, 98, 'https://lorempixel.com/640/480/cats/?61915', NULL, NULL);
INSERT INTO `product_galleries` VALUES (379, 98, 'https://lorempixel.com/640/480/cats/?50838', NULL, NULL);
INSERT INTO `product_galleries` VALUES (380, 98, 'https://lorempixel.com/640/480/cats/?23918', NULL, NULL);
INSERT INTO `product_galleries` VALUES (381, 98, 'https://lorempixel.com/640/480/cats/?25714', NULL, NULL);
INSERT INTO `product_galleries` VALUES (382, 99, 'https://lorempixel.com/640/480/cats/?92140', NULL, NULL);
INSERT INTO `product_galleries` VALUES (383, 99, 'https://lorempixel.com/640/480/cats/?82045', NULL, NULL);
INSERT INTO `product_galleries` VALUES (384, 99, 'https://lorempixel.com/640/480/cats/?35338', NULL, NULL);
INSERT INTO `product_galleries` VALUES (385, 99, 'https://lorempixel.com/640/480/cats/?10732', NULL, NULL);
INSERT INTO `product_galleries` VALUES (386, 99, 'https://lorempixel.com/640/480/cats/?28363', NULL, NULL);
INSERT INTO `product_galleries` VALUES (387, 100, 'https://lorempixel.com/640/480/cats/?70770', NULL, NULL);
INSERT INTO `product_galleries` VALUES (388, 100, 'https://lorempixel.com/640/480/cats/?38965', NULL, NULL);
INSERT INTO `product_galleries` VALUES (389, 100, 'https://lorempixel.com/640/480/cats/?15945', NULL, NULL);
INSERT INTO `product_galleries` VALUES (392, 104, 'images/galleries/pro_104/5c3ab409d5c66.png', '2019-01-13 03:44:09', '2019-01-13 03:44:09');
INSERT INTO `product_galleries` VALUES (395, 104, 'images/galleries/pro_104/5c3adfaf21275.png', '2019-01-13 06:50:23', '2019-01-13 06:50:23');
INSERT INTO `product_galleries` VALUES (397, 104, 'images/galleries/pro_104/5c3ae29f408fa.png', '2019-01-13 07:02:55', '2019-01-13 07:02:55');
INSERT INTO `product_galleries` VALUES (398, 114, 'images/galleries/pro_114/5c4bcd5214459.jpeg', '2019-01-26 03:00:34', '2019-01-26 03:00:34');
INSERT INTO `product_galleries` VALUES (399, 114, 'images/galleries/pro_114/5c4bcd5215c1a.jpeg', '2019-01-26 03:00:34', '2019-01-26 03:00:34');
INSERT INTO `product_galleries` VALUES (400, 114, 'images/galleries/pro_114/5c4bcd521a3f9.jpeg', '2019-01-26 03:00:34', '2019-01-26 03:00:34');
INSERT INTO `product_galleries` VALUES (401, 114, 'images/galleries/pro_114/5c4bcd521b1ee.jpeg', '2019-01-26 03:00:34', '2019-01-26 03:00:34');
INSERT INTO `product_galleries` VALUES (404, 123, 'http://127.0.0.1/mvc/public/5d049a8539681-Untitled.png', '2019-06-15 09:13:09', '2019-06-15 09:13:09');
INSERT INTO `product_galleries` VALUES (405, 123, 'http://127.0.0.1/mvc/public/5d04a31a4f478-alena-aenami-witcher-1k.jpg', '2019-06-15 09:49:46', '2019-06-15 09:49:46');
INSERT INTO `product_galleries` VALUES (406, 123, 'http://127.0.0.1/mvc/public/5d04a31a55bb7-banner-orderk20d.jpg', '2019-06-15 09:49:46', '2019-06-15 09:49:46');
INSERT INTO `product_galleries` VALUES (407, 124, 'http://127.0.0.1/mvc/public/5d0505ac9492b-banner-orderk20d.jpg', '2019-06-15 16:50:20', '2019-06-15 16:50:20');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cate_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  `short_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `star` double(8, 2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `products_cate_id_foreign`(`cate_id`) USING BTREE,
  CONSTRAINT `products_cate_id_foreign` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (23, 'Domenico Schroeder', 'https://lorempixel.com/640/480/cats/?63145', 4, 5961, 'Alice added to him: the jurymen. \'No, no! The King said, and opened it, or not. So she must be When the story for instance, if it is the top of her became of it, yer honour!\' \'Digging for her sharp.', 'Alice felt so desperate that she could not taste theirs, and the words came very queer indeed:-- \'\'Tis the voice of the door opened inwards, and Alice\'s elbow was pressed hard against it, that.', 1.00, NULL, '2019-06-15 08:05:42', 1);
INSERT INTO `products` VALUES (24, 'Hailie Stoltenberg', 'https://lorempixel.com/640/480/cats/?12636', 5, 46542, 'I know. So she was hardly knew so on; then, \'we were nowhere to the beginning,\' the Gryphon repeated in a tree in the executioner: \'fetch her lap of that you butter wouldn\'t be a present of mine.', 'March Hare said in a court of justice before, but she could for sneezing. There was a bright idea came into Alice\'s shoulder as he spoke, \'we were trying--\' \'I see!\' said the King, the Queen, who.', 2.00, NULL, '2019-01-12 03:00:37', 3);
INSERT INTO `products` VALUES (25, 'Mr  Christ Huels', 'http://127.0.0.1/mvc/public/5d070de84cfc4-alena-aenami-witcher-1k.jpg', 6, 69179, 'I must needs come back of singers. \'You may be different,\' said the Duchess?\' \'Hush! Hush!\' said to think I wish I hadn\'t to bring tears running in the young lady,\' said right,\' said the Gryphon.', 'Duck. \'Found IT,\' the Mouse only shook its head impatiently, and walked two and two, as the game was going on shrinking rapidly: she soon found herself in a melancholy air, and, after glaring at her.', 2.00, NULL, '2019-06-17 05:50:00', 1);
INSERT INTO `products` VALUES (26, 'Narciso Predovic II', 'https://lorempixel.com/640/480/cats/?58780', 5, 3078, 'Alice had plenty of beautiful Soup? Pennyworth only does very respectful tone, \'and I think.\' And he wasn\'t going up a sulky tone; \'Seven jogged my adventures--beginning from one place of Hearts.', 'Why, there\'s hardly enough of me left to make out that she looked up eagerly, half hoping she might as well as if his heart would break. She pitied him deeply. \'What is his sorrow?\' she asked the.', 2.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (27, 'Susan Thiel V', 'https://lorempixel.com/640/480/cats/?15140', 6, 16550, 'I suppose so,\' Alice opened the answer to ask them all I think?\' \'I can go near her, calling out here? Why, it so often read out which is of the twinkling of the White Rabbit. She said to grow.', 'Mock Turtle went on talking: \'Dear, dear! How queer everything is queer to-day.\' Just then she looked back once or twice, half hoping she might as well wait, as she went on. \'Would you like to show.', 4.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (28, 'Sharon Halvorson', 'https://lorempixel.com/640/480/cats/?91181', 2, 37013, 'William\'s conduct at all.\' \'In that must manage better not at the pope, was now about lessons,\' the Dormouse, without even when the dance. Will you, will you can--\' \'Swim after folding his.', 'They had a vague sort of present!\' thought Alice. \'I mean what I get\" is the same thing as \"I sleep when I get it home?\' when it grunted again, and made a rush at the March Hare, \'that \"I like what.', 1.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (29, 'Jayce Wiza', 'https://lorempixel.com/640/480/cats/?93908', 6, 54754, 'Duchess. An obstacle that \"I see such a railway station.) However, \'jury-men\' would be otherwise than I think you\'d rather not,\' said the house, and peeped over the branches, and sometimes shorter.', 'Pigeon. \'I\'m NOT a serpent, I tell you, you coward!\' and at once took up the fan and gloves--that is, if I shall have to turn into a cucumber-frame, or something of the month is it?\' he said. (Which.', 5.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (31, 'Clay Fahey DVM', 'https://lorempixel.com/640/480/cats/?71566', 4, 20934, 'Caterpillar. \'I\'m afraid that it away the corner, \'Oh dear! I\'d better leave off,\' said the little faster?\" said her head made her foot! She was soon as himself, and Alice sighed wearily. \'I don\'t.', 'They\'re dreadfully fond of pretending to be lost, as she went on without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was not a regular rule: you invented it just grazed.', 2.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (32, 'Deven Carroll DDS', 'https://lorempixel.com/640/480/cats/?95559', 3, 62954, 'But the sun. (IF you a snatch in his brush, and a tiny golden scale! \'How the other: the Lobster Quadrille The master was on his history,\' As for a sigh: \'he taught them: such a mouse--a mouse--O.', 'I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go on for some while in silence. At last the Mouse, getting up and picking the daisies, when suddenly a White Rabbit blew three blasts on the top.', 3.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (33, 'Ava Olson', 'https://lorempixel.com/640/480/cats/?43699', 3, 98055, 'Ma!\' said to the trees upon her face was speaking, so much care of thought, \'till its mouth, and in March.\' As she found her repeating all the bright idea what CAN I grow larger, sir, just upset the.', 'Alice, as she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let him know she liked them best, For this must be off, and Alice thought she might find another key on.', 5.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (34, 'Prof. Camren Robel V', 'https://lorempixel.com/640/480/cats/?78623', 2, 28012, 'Seven flung down with a nice soft thing she went to one place for a red-hot poker will tell me, please, if there was good thing!\' said the pebbles came up the next remark. \'Of course,\' he consented.', 'Mouse to Alice to herself. \'I dare say there may be different,\' said Alice; \'living at the bottom of a tree. \'Did you speak?\' \'Not I!\' he replied. \'We quarrelled last March--just before HE went mad.', 2.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (35, 'Samir Schumm DVM', 'https://lorempixel.com/640/480/cats/?56187', 2, 83653, 'Will you, and hot buttered toast,) she had any other parts of course--\"I GAVE HIM TWO--\" why, that would bend about here, O Mouse!\' (Alice had to be like to the matter much,\' said the way, was.', 'And in she went. Once more she found a little pattering of footsteps in the sea, some children digging in the same year for such a curious feeling!\' said Alice; \'that\'s not at all anxious to have.', 5.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (36, 'Pearl Haag', 'https://lorempixel.com/640/480/cats/?43485', 2, 74621, 'Alice; \'I wonder how did not even Stigand, the rest were giving it away!\' There was moderate. But do THAT in the jury. They all the bill, \"French, music, AND SHOES.\' the Dormouse went in the Mouse.', 'PRECIOUS nose\'; as an explanation. \'Oh, you\'re sure to kill it in a melancholy way, being quite unable to move. She soon got it out loud. \'Thinking again?\' the Duchess to play croquet.\' Then they.', 4.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (37, 'Javier Sipes', 'https://lorempixel.com/640/480/cats/?27602', 6, 84750, 'Alice could remember it must be asleep instantly, and she had not taste it, and waited. The White Rabbit; \'in my dear, certainly: Alice thought), and she was a duck with her fancy, that: they saw.', 'All on a crimson velvet cushion; and, last of all the rats and--oh dear!\' cried Alice, jumping up in such a capital one for catching mice you can\'t help it,\' she thought, \'till its ears have come.', 5.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (38, 'Aryanna Bartell', 'https://lorempixel.com/640/480/cats/?63932', 6, 3775, 'YOUR table,\' said the King; \'and even room for she was an encouraging tone. Alice thought of bright brass plate came opposite to worry it; and said, without being that makes my jaw, Has lasted the.', 'Mock Turtle interrupted, \'if you only kept on puzzling about it while the Mouse was swimming away from him, and very soon finished off the cake. * * * * * * * * * * * * * * * CHAPTER II. The Pool of.', 2.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (39, 'Unique Tromp', 'https://lorempixel.com/640/480/cats/?14953', 4, 59885, 'Hearts, who was going back to find herself what they arrived, with the roof. There was her face, with a little bit of use now,\' she went on, then,\' the moral of the two feet as they WILL be no such.', 'Queen said to herself, \'to be going messages for a conversation. \'You don\'t know what to do, so Alice went on again:-- \'I didn\'t write it, and very soon had to be a footman in livery, with a round.', 4.00, NULL, '2019-01-12 02:08:55', 2);
INSERT INTO `products` VALUES (40, 'Vaughn McLaughlin', 'https://lorempixel.com/640/480/cats/?56031', 5, 54407, 'I don\'t FIT you,\' she was, that in my dear, YOU manage?\' Alice began singing a body tucked away, even introduced to be a commotion in a blow with them,\' the hearth and sometimes, \'Do you may not.', 'Alice, she went slowly after it: \'I never could abide figures!\' And with that she still held the pieces of mushroom in her pocket) till she got into it), and sometimes she scolded herself so.', 3.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (41, 'Miss Florida Paucek Sr.', 'https://lorempixel.com/640/480/cats/?12502', 4, 71067, 'Queen of thing I think--\' (for, you manage the darkness as quickly that there seemed to make children digging her voice, and bawled out, at once.\' And so savage if I wish I shall have wanted it.', 'Gryphon, sighing in his confusion he bit a large mushroom growing near her, she began, rather timidly, saying to herself that perhaps it was as much as she could not be denied, so she went on.', 4.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (42, 'Dixie Larkin', 'https://lorempixel.com/640/480/cats/?18313', 7, 99480, 'Hatter. \'You ought to keep back to see me to happen any advantage from being arches are gone, and saw one, or more; They were live at once considering how the judge,\' she was lying under the White.', 'Mock Turtle: \'nine the next, and so on.\' \'What a curious dream, dear, certainly: but now run in to your places!\' shouted the Gryphon, \'that they WOULD put their heads off?\' shouted the Queen.', 2.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (43, 'Velda D\'Amore', 'https://lorempixel.com/640/480/cats/?74197', 1, 31973, 'She said the Caterpillar, just saying to offer it,\' said the jury. \'Not at the trees behind her. The adventures first,\' said the beginning with one repeat it, it in hand in a boon, Was kindly.', 'Mouse, sharply and very soon finished off the mushroom, and raised herself to about two feet high: even then she walked up towards it rather timidly, saying to herself, in a very decided tone: \'tell.', 1.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (44, 'Sigmund Green', 'https://lorempixel.com/640/480/cats/?15727', 3, 96662, 'I shall think you mean that WOULD twist itself up by producing from one corner of its age, there were live hedgehogs, the Mock Turtle. \'Very much care where--\' said Alice; \'and that\'s very.', 'I COULD NOT SWIM--\" you can\'t think! And oh, my poor little thing sat down a good deal until she made it out into the garden door. Poor Alice! It was so ordered about by mice and rabbits. I almost.', 4.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (45, 'Niko Weissnat', 'https://lorempixel.com/640/480/cats/?89184', 5, 36874, 'As soon made Alice heard it seemed to hold of THIS!\' (Sounds of the meaning in questions of yourself,\' said Alice. \'I\'ve had just at the Queen, pointing to say \'Drink me,\' said the King hastily.', 'When the pie was all dark overhead; before her was another long passage, and the baby--the fire-irons came first; then followed a shower of saucepans, plates, and dishes. The Duchess took her.', 5.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (46, 'Xavier Hoppe DDS', 'https://lorempixel.com/640/480/cats/?45953', 4, 11746, 'If they hit her to learn! Oh, my poor animal\'s feelings. \'I keep them into a thing. After a good English); \'now I\'m talking!\' Just at the March Hare. \'Exactly so,\' said the Mock Turtle persisted.', 'Last came a little before she made out the answer to shillings and pence. \'Take off your hat,\' the King eagerly, and he went on in a wondering tone. \'Why, what a wonderful dream it had struck her.', 5.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (47, 'Adrianna Renner', 'https://lorempixel.com/640/480/cats/?62158', 4, 47895, 'IS the house, quite forgot you weren\'t to begin with,\' said the Gryphon remarked: \'because I\'m Mabel, for really dreadful,\' she kept her sharp little nervous about two were taken advantage from.', 'I will prosecute YOU.--Come, I\'ll take no denial; We must have a prize herself, you know,\' said the Pigeon; \'but if they do, why then they\'re a kind of rule, \'and vinegar that makes people.', 2.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (48, 'Isabell Cole', 'https://lorempixel.com/640/480/cats/?29311', 4, 98107, 'March Hare will you, won\'t you, won\'t you, won\'t stand beating. Now, if it grunted again, so Alice knew that \"I eat or not.\' \'We had been looking anxiously at him when she knows it doesn\'t suit my.', 'Dormouse: \'not in that poky little house, and have next to her. \'I wish I hadn\'t quite finished my tea when I find a pleasure in all directions, tumbling up against each other; however, they got.', 2.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (49, 'Lexi Mante', 'https://lorempixel.com/640/480/cats/?73442', 1, 8915, 'I\'m doubtful about two miles down, all the Duchess\'s knee, while Alice could be so close to herself; \'the best to grow at the Queen had kept all her neck nicely by his mind, and said Alice was very.', 'Alice. \'Come on, then!\' roared the Queen, who had got burnt, and eaten up by two guinea-pigs, who were lying round the table, but it puzzled her too much, so she began fancying the sort of way to.', 5.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (50, 'Tomas Abbott', 'https://lorempixel.com/640/480/cats/?82192', 6, 11243, 'So she had kept doubling itself round and began smoking a shiver. \'I DON\'T know,\' he poured a moment: she carried it was that in Coils.\' \'What day to doubt, and began with a lark, And argued each.', 'King. \'When did you do lessons?\' said Alice, and she very soon came to the jury, in a low voice. \'Not at first, perhaps,\' said the Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and.', 5.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (51, 'Prof. Jedediah Cole MD', 'https://lorempixel.com/640/480/cats/?39355', 5, 41669, 'And the boots every now only makes my throat!\' and then a trial: For some of the BEST butter, you know,\' said the fact. \'I suppose I don\'t like changing the Queen had been that,\' she jumped up and.', 'I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go near the right size to do anything but sit with its mouth and began to tremble. Alice looked round, eager to see anything; then she had never.', 3.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (52, 'Dr. Rudy Vandervort', 'https://lorempixel.com/640/480/cats/?48276', 3, 78633, 'I\'m doubtful about it,\' said the Queen of great curiosity, and sighing. \'It IS a curious today. I to get me out of it: \'No room! No accounting for the Cat, as it myself to do such a long as it had.', 'And beat him when he finds out who was peeping anxiously into its face to see it trying in a trembling voice:-- \'I passed by his face only, she would catch a bat, and that\'s very like a.', 4.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (53, 'Kevon Corkery', 'https://lorempixel.com/640/480/cats/?40928', 4, 1582, 'Duchess?\' \'Hush! Hush!\' said the first thought Alice recognised the Gryphon, with an extraordinary ways of the Caterpillar was sitting between us. For anything to say.\' This time as a great or.', 'Caterpillar took the regular course.\' \'What was THAT like?\' said Alice. \'Why, SHE,\' said the Mouse was swimming away from him, and said anxiously to herself, \'because of his head. But at any rate a.', 3.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (54, 'Donna Kuhn', 'https://lorempixel.com/640/480/cats/?28491', 1, 56926, 'As they were getting so ordered about this is Alice, always took her very much,\' thought Alice, in a day about as \"I passed too small, but out-of-the-way things get into the Cat. \'--so you may stand.', 'YOU, and no one could possibly hear you.\' And certainly there was no label this time it all is! I\'ll try if I like being that person, I\'ll come up: if not, I\'ll stay down here till I\'m somebody.', 2.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (55, 'Clementina Bruen', 'https://lorempixel.com/640/480/cats/?12220', 6, 69990, 'At this must have ordered\'; and the dance. Would not, could bear: she felt a wondering what Latitude was, how did they lessen from a box her hands, and finish his nose, and Pepper For he seems to.', 'Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and Northumbria--\"\' \'Ugh!\' said the Gryphon: and Alice guessed who it was, even before she gave a look askance-- Said he thanked the.', 1.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (56, 'Samir Nader', 'https://lorempixel.com/640/480/cats/?74683', 2, 14289, 'The cook till his Normans--\" How she did you know. Please, Ma\'am, is Bill,\' thought Alice. \'I\'m afraid that curious croquet-ground in a crash of them at this, so grave voice, but she began, in.', 'I\'d only been the right word) \'--but I shall ever see such a neck as that! No, no! You\'re a serpent; and there\'s no name signed at the top of his Normans--\" How are you getting on?\' said the Cat.', 3.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (57, 'Elmo Cremin V', 'https://lorempixel.com/640/480/cats/?32710', 2, 82778, 'THE.', 'March Hare said to live. \'I\'ve seen a rabbit with either a waistcoat-pocket, or a serpent?\' \'It matters a good deal until she made out the proper way of speaking to it,\' she said to herself \'It\'s.', 3.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (58, 'Mrs. Vanessa Legros', 'https://lorempixel.com/640/480/cats/?74839', 3, 77262, 'The Mouse was sneezing by mice in a little dears came near the bread-and-butter. Just then said the words: \'Yes, that\'s why. Pig!\' She did not come the others looked down and then keep herself at.', 'Duchess; \'and that\'s the queerest thing about it.\' \'She\'s in prison,\' the Queen had never heard before, \'Sure then I\'m here! Digging for apples, indeed!\' said the Mock Turtle, who looked at her for.', 3.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (59, 'Ignatius Watsica', 'https://lorempixel.com/640/480/cats/?18400', 4, 2852, 'Alice, \'because they had to taste theirs, and doesn\'t believe I tell me,\' but in a minute or two, looking down on my shoulders got a really clever thing that it just in his way out. \'I beg pardon.', 'As she said to the voice of the evening, beautiful Soup! \'Beautiful Soup! Who cares for fish, Game, or any other dish? Who would not open any of them. \'I\'m sure I\'m not myself, you see.\' \'I don\'t.', 5.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (60, 'Humberto Feil', 'https://lorempixel.com/640/480/cats/?47787', 1, 92367, 'Alice, \'it\'ll never forgotten to live. \'I\'ve so she went on her head!\' or not. So she could not give the last in the animals with its hurry to climb up by producing from one of thought, \'till its.', 'Stop this moment, I tell you!\' But she waited for some time busily writing in his turn; and both the hedgehogs were out of its mouth and began to feel a little bottle on it, for she had got its head.', 1.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (61, 'Rosalinda Raynor', 'https://lorempixel.com/640/480/cats/?53595', 1, 81699, 'Duchess, \'and they live on?\' said Alice. \'I\'ve so yet,\' said Alice looked at all; however, they used to dry again: they all my limbs very provoking to the Mouse, who were all round. \'But I\'m on one.', 'And welcome little fishes in With gently smiling jaws!\' \'I\'m sure those are not the right thing to get us dry would be like, \'--for they haven\'t got much evidence YET,\' she said to herself, \'it.', 3.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (62, 'Dolly Moen I', 'https://lorempixel.com/640/480/cats/?68412', 2, 58025, 'Turtle--we used to the Gryphon. \'Then, you have a real nose; also its mouth again, sitting on a fancy what would feel very politely; but it can EVEN finish, if it was sitting on his note-book.', 'The Dormouse shook its head impatiently, and said, very gravely, \'I think, you ought to have changed since her swim in the way down one side and then quietly marched off after the candle is like.', 4.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (63, 'Corrine Beier', 'https://lorempixel.com/640/480/cats/?55988', 2, 80361, 'When the birds! Why, I used to kill it a Little Bill had looked all directions, \'just like to fly; and waited. When the Rabbit blew three dates on talking: \'Dear, dear! I suppose?\' said the truth.', 'This was not quite like the wind, and was in managing her flamingo: she succeeded in curving it down \'important,\' and some \'unimportant.\' Alice could think of anything to put his mouth close to the.', 3.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (64, 'Clair Mraz', 'https://lorempixel.com/640/480/cats/?61980', 3, 53505, 'It did not sneeze, were any that the wood. \'The game\'s going on the corner, \'Oh dear! I should push the e--e--evening, Beautiful, beauti--FUL SOUP!\' \'Chorus again!\' which seemed to itself \'The.', 'I wish I hadn\'t drunk quite so much!\' Alas! it was a body to cut it off from: that he shook both his shoes off. \'Give your evidence,\' the King said to herself, in a sort of idea that they had a door.', 4.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (65, 'Sanford O\'Kon', 'https://lorempixel.com/640/480/cats/?10497', 3, 22165, 'Mock Turtle interrupted, yawning. \'I\'m glad there were Elsie, Lacie, and yet you were saying to be lost: away under it, yer honour: but there was looking for it,\' said to the pool, and sometimes.', 'She was walking hand in her head, and she drew herself up closer to Alice\'s side as she could. \'The game\'s going on shrinking rapidly: she soon found herself in a hurry that she let the jury--\' \'If.', 2.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (66, 'Delbert Grant', 'https://lorempixel.com/640/480/cats/?58416', 6, 41699, 'King said Alice; \'but if I do!\' but I shan\'t! YOU sing,\' said Alice did not talk!\' said the bottle that her going, though this time). \'Don\'t talk about two or two feet in livery, with one of lamps.', 'It means much the most interesting, and perhaps after all it might tell her something about the temper of your nose-- What made you so awfully clever?\' \'I have answered three questions, and that.', 3.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (67, 'Estella Murray Sr.', 'https://lorempixel.com/640/480/cats/?73021', 6, 20242, 'Alice thought at the March Hare. \'Exactly so,\' said the locks were nine feet in bringing the Duchess; \'and she went on to begin lessons: you\'d only difficulty was, what? Alice thought poor man,\' the.', 'When they take us up and down, and was gone in a tone of great surprise. \'Of course not,\' Alice cautiously replied: \'but I must be Mabel after all, and I could not remember the simple and loving.', 4.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (68, 'Noemi Shields', 'https://lorempixel.com/640/480/cats/?49530', 7, 53468, 'WHAT? The baby grunted again, sitting on the Mock Turtle a wretched Hatter replied. \"There was in without knowing how to the way--\' \'THAT generally a day is such stuff? Be off, and I\'m sure I vote.', 'King had said that day. \'A likely story indeed!\' said Alice, a little quicker. \'What a curious dream!\' said Alice, as she had never forgotten that, if you like,\' said the Gryphon. \'Of course,\' the.', 2.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (69, 'Javonte Fahey DDS', 'https://lorempixel.com/640/480/cats/?41866', 5, 39834, 'Alice very like the hookah into a child,\' said the immediate adoption of saucepans, plates, and said Alice, who were all she caught the Hatter were nowhere to look so that she was terribly.', 'Dormouse crossed the court, arm-in-arm with the Gryphon. \'It\'s all her knowledge of history, Alice had never forgotten that, if you please! \"William the Conqueror, whose cause was favoured by the.', 2.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (70, 'Vergie McCullough', 'https://lorempixel.com/640/480/cats/?58542', 2, 18459, 'CHAPTER XI. Who ever getting so rich and told you tell him--it was immediately met those cool fountains, but it just beginning very provoking to make you know,\' the race is of WHAT?\' said this, and.', 'I did: there\'s no use going back to my jaw, Has lasted the rest of the moment she appeared; but she had made her look up in spite of all this grand procession, came THE KING AND QUEEN OF HEARTS.', 4.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (71, 'Orval Ruecker', 'https://lorempixel.com/640/480/cats/?45507', 4, 74859, 'White Rabbit whispered to sing this:-- \'Fury said the air! Do come upon Bill! the Cat in a pleasant temper, and a sigh: \'it\'s generally gave a treacle-well--eh, stupid?\' \'But you\'re falling through.', 'Soup! \'Beautiful Soup! Who cares for you?\' said the Caterpillar. Alice said to herself; \'the March Hare said to Alice. \'What sort of use in knocking,\' said the Caterpillar. \'Not QUITE right, I\'m.', 4.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (72, 'Estel Hoppe', 'https://lorempixel.com/640/480/cats/?67595', 3, 43816, 'Alice. \'I\'m too stiff. And he did not mad. You\'re mad.\' \'But why do next! If I give you know--\' (pointing with you,\' (she couldn\'t afford to laugh; and, as he found she said the Queen will be quite.', 'For some minutes the whole pack rose up into a chrysalis--you will some day, you know--and then after that into a large plate came skimming out, straight at the bottom of a well?\' The Dormouse.', 4.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (73, 'Luna Simonis III', 'https://lorempixel.com/640/480/cats/?54657', 4, 66992, 'Queen, turning into a subject! Our family always pepper in at the Footman\'s head: it was her promise. \'Treacle,\' said the Queen, who was looking for her sister was swimming away without my dear, I.', 'William the Conqueror.\' (For, with all speed back to the door, and the small ones choked and had just succeeded in curving it down into a small passage, not much larger than a rat-hole: she knelt.', 1.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (74, 'Mrs. Gertrude Bogan', 'https://lorempixel.com/640/480/cats/?37079', 3, 67067, 'The King repeated in reply. \'That\'s the earth. Let me very confusing.\' \'It is to work shaking it might like herself. \'I kept doubling itself up and she tried to do let Dinah here, lad!--Here, put.', 'Gryphon, \'she wants for to know when the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked at Alice. \'I\'M not a VERY turn-up nose, much more like a candle. I wonder if I only wish.', 5.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (75, 'Ima Kuhn', 'https://lorempixel.com/640/480/cats/?81286', 7, 99663, 'The Gryphon went on, \'\"--found it was as if I\'ve got behind a long that the trees as it\'s pleased. Now you were white, but they came rather impatiently: \'any shrimp could not quite forgot how to.', 'Dodo said, \'EVERYBODY has won, and all that,\' he said in a coaxing tone, and she went on, yawning and rubbing its eyes, for it flashed across her mind that she had nibbled some more.', 1.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (76, 'Jadyn Macejkovic', 'https://lorempixel.com/640/480/cats/?97224', 7, 29269, 'Queen\'s ears--\' the Queen,\' and ran till the pack, she said the fan and perhaps after her. There was a most confusing it in her choice, and raised himself suddenly: you see, because he kept all the.', 'Hatter: and in THAT direction,\' the Cat in a confused way, \'Prizes! Prizes!\' Alice had no pictures or conversations in it, and finding it very nice, (it had, in fact, a sort of idea that they.', 5.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (77, 'Mr. Mohammad Koepp IV', 'https://lorempixel.com/640/480/cats/?51026', 3, 33893, 'Alice could not open place, and was silence instantly, and the Queen. \'You are you?\' She went on being ordered about for a game was the back and the Dormouse shall!\' they all at Alice didn\'t like a.', 'Hatter went on, half to itself, half to itself, \'Oh dear! Oh dear! I\'d nearly forgotten to ask.\' \'It turned into a pig, my dear,\' said Alice, \'and if it makes rather a hard word, I will just explain.', 2.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (78, 'Kailyn Wiegand', 'https://lorempixel.com/640/480/cats/?12225', 4, 24270, 'I don\'t be jury,\" Said the great curiosity, and growing small she did the trial\'s begun.\' \'They\'re done that, if she is of this moment, I fancy--Who\'s to invent something!\' \'I--I\'m a very little.', 'VERY unpleasant state of mind, she turned the corner, but the Hatter went on, without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was beginning very angrily, but the.', 4.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (79, 'Emmie Murazik I', 'https://lorempixel.com/640/480/cats/?31172', 7, 73416, 'I can you?\' \'I\'m a--I\'m a--\' \'Well! I\'ve got any of tears which the chimney, has he?\' said to find quite enough--I hope it\'ll seem, sending presents to herself, and washing her too much what it.', 'King: \'leave out that one of them were animals, and some were birds,) \'I suppose they are the jurors.\' She said it to annoy, Because he knows it teases.\' CHORUS. (In which the wretched Hatter.', 3.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (80, 'Leda Turner', 'https://lorempixel.com/640/480/cats/?31124', 5, 18120, 'Alice severely. \'What HAVE tasted an old fellow! Don\'t let him declare, \"You have come, or so, and decidedly, and no wonder who instantly jumped into alarm in a good many miles down, down. Would.', 'It sounded an excellent opportunity for repeating his remark, with variations. \'I shall sit here,\' he said, turning to the Dormouse, who seemed ready to sink into the sky. Twinkle, twinkle--\"\' Here.', 3.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (81, 'Mrs. Myah Kihn', 'https://lorempixel.com/640/480/cats/?15639', 4, 55757, 'SOMEBODY ought to herself. At last the order of one repeat it, and he thought was a long that what work throwing an anxious to see you?\' he said, \'EVERYBODY has just in a neat little voice, \'Let us.', 'MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at Alice. \'It must have been was not here before,\' said Alice,) and round the thistle again; then the Mock Turtle, and to hear it say, as.', 1.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (82, 'Tyrique Casper', 'https://lorempixel.com/640/480/cats/?47376', 6, 20436, 'Gryphon: \'I wonder what they drew all that.\' \'Well, be some tea and both its voice. Nobody moved. \'Who are too flustered to herself. At this grand words \'DRINK ME\' beautifully marked \'poison,\' it in.', 'And the Gryphon only answered \'Come on!\' cried the Mock Turtle\'s Story \'You can\'t think how glad I am in the air, mixed up with the distant green leaves. As there seemed to be full of smoke from one.', 1.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (83, 'Willa Sanford', 'https://lorempixel.com/640/480/cats/?88817', 3, 45428, 'I shall have this cat grins like it is twelve, and I\'m not do to herself. At this time for the right size for a sort of her arm, and the door and said the March Hare,) \'--it was not a.', 'She was a general chorus of \'There goes Bill!\' then the different branches of Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never thought about it,\' said Alice. \'Come on, then,\'.', 2.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (84, 'Virginia Borer', 'https://lorempixel.com/640/480/cats/?48260', 6, 65523, 'Who Stole the Hatter. \'He won\'t you, and all the lobsters again!\' yelled the King in a pig, my time, while the most important air, and, as well was the Gryphon replied very earnestly. \'I\'ve so.', 'They had not long to doubt, for the next thing is, to get hold of its little eyes, but it puzzled her very much confused, \'I don\'t know of any good reason, and as it lasted.) \'Then the Dormouse into.', 2.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (85, 'Prof. William Maggio V', 'https://lorempixel.com/640/480/cats/?90097', 5, 45682, 'He looked at once, with the way out into its eyelids, so like a rabbit with a whiting kindly, but she went on, \'I do,\' said nothing: she could. The King sharply. \'Do bats eat the Hatter, \'you see.', 'Take your choice!\' The Duchess took no notice of her hedgehog. The hedgehog was engaged in a coaxing tone, and added \'It isn\'t directed at all,\' said the King added in an encouraging opening for a.', 5.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (86, 'Ilene Franecki', 'https://lorempixel.com/640/480/cats/?20433', 2, 23361, 'Christmas.\' And took down in a pity. I should like that must be said. \'Fifteenth,\' said the animals that the e--e--evening, Beautiful, beautiful Soup! Who ever so rich and eaten up again! Let me out.', 'Alice, jumping up in her haste, she had looked under it, and found that her flamingo was gone in a melancholy tone. \'Nobody seems to suit them!\' \'I haven\'t opened it yet,\' said the last words out.', 1.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (87, 'Lesly Walsh', 'https://lorempixel.com/640/480/cats/?54082', 6, 20538, 'I used to look at first, \'why your name, child?\' \'My dear! Do come and the young lady,\' said the Dormouse again, but she put them can find them.\' In a prize herself, \'I don\'t know what o\'clock it.', 'Caterpillar. \'Well, perhaps your feelings may be ONE.\' \'One, indeed!\' said Alice, in a melancholy way, being quite unable to move. She soon got it out to the part about her pet: \'Dinah\'s our cat.', 1.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (88, 'Mr. Anastacio Stamm II', 'https://lorempixel.com/640/480/cats/?40511', 5, 1509, 'Beautiful, beautiful garden--how IS his scaly friend of a procession,\' thought decidedly uncivil. \'But what was going to begin.\' For, you were looking at the whole place where Dinn may be the.', 'Duchess, as she could. \'The game\'s going on between the executioner, the King, \'that saves a world of trouble, you know, this sort in her face, and was gone in a hoarse, feeble voice: \'I heard the.', 2.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (89, 'Nestor Morissette DDS', 'https://lorempixel.com/640/480/cats/?84727', 3, 68613, 'Yet you are you like the earth! How are so easily offended, you to her foot up into little recovered from a shrill, loud voice, and vanished. Alice desperately: \'he\'s perfectly sure I have to.', 'March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t keep the same thing with you,\' said Alice, always ready to sink into the sky all the first minute or two, and the great hall, with.', 1.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (91, 'Dr. Carter Brakus Jr.', 'https://lorempixel.com/640/480/cats/?86533', 3, 15105, 'HER ONE, THEY GAVE HIM TWO--\" why, that accounts for the looking-glass. There ought to Alice, \'we were all that.\' \'With extras?\' asked triumphantly. Alice in sight, he found out like to Alice. \'I.', 'Caterpillar called after her. \'I\'ve something important to say!\' This sounded promising, certainly: Alice turned and came back again. \'Keep your temper,\' said the Mock Turtle. \'She can\'t explain.', 4.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (92, 'Oren Kilback', 'https://lorempixel.com/640/480/cats/?47374', 2, 75821, 'Soup,\" will do, lying round it: for the Hatter. \'You may as large letters. It was, no time she was so useful, and added with the whole pack of nursing it, yer honour!\' (He pronounced it to get out.\".', 'I will tell you my history, and you\'ll understand why it is you hate--C and D,\' she added aloud. \'Do you know what it meant till now.\' \'If that\'s all I can reach the key; and if it had fallen into.', 3.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (93, 'Carolanne Metz IV', 'https://lorempixel.com/640/480/cats/?48561', 5, 2814, 'I don\'t know what he went on, \'if people near the same thing sat still and a smile. There was such dainties would be the same little glass table and gloves. \'How do something or later. However.', 'Caterpillar decidedly, and there was hardly room for this, and she tried to curtsey as she came up to the little golden key and hurried off to the Queen, and Alice was beginning to get very tired of.', 4.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (94, 'Prof. Adrien Friesen', 'https://lorempixel.com/640/480/cats/?60982', 3, 91459, 'King, and the Queen\'s ears--\' the Rabbit as she be QUITE right, Five! Always lay the Eaglet bent down again, the Gryphon, and the Owl had put it was Mystery,\' the air. She was indeed: she grew no.', 'YOU,\"\' said Alice. \'Off with his head!\' or \'Off with their heads!\' and the turtles all advance! They are waiting on the door opened inwards, and Alice\'s elbow was pressed hard against it, that.', 1.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (95, 'Kirstin Bauch', 'https://lorempixel.com/640/480/cats/?37392', 2, 41524, 'Drawling--the Drawling-master was now about the one only a song?\' \'Oh, I\'m NOT SWIM--\" you fond--of--of dogs?\' The first question was more puzzled, but she had got up my dear Sir, With gently.', 'Gryphon: \'I went to school in the house before she gave her one, they gave him two, You gave us three or more; They all sat down with wonder at the top of the evening, beautiful Soup! \'Beautiful.', 5.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (96, 'Alessandra Metz', 'https://lorempixel.com/640/480/cats/?63339', 7, 39837, 'Queen, and said, turning to her repeating all that beautiful Soup? Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Soo--oop of speaking to nine feet high, and a hoarse and whiskers, how she went by.', 'Alice thought she might find another key on it, or at any rate a book written about me, that there ought! And when I breathe\"!\' \'It IS the use of a muchness\"--did you ever saw. How she longed to get.', 4.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (97, 'Lynn Grady', 'https://lorempixel.com/640/480/cats/?17522', 7, 2573, 'Lizard, who is May it would feel very important,\' the same thing,\' Alice aloud, addressing nobody in a shriek, and found it yet,\' said the opportunity of half of Hearts were learning to think that.', 'England the nearer is to find that the way of nursing it, (which was to find her in the morning, just time to go, for the hot day made her feel very queer indeed:-- \'\'Tis the voice of the bill.', 1.00, NULL, NULL, 1);
INSERT INTO `products` VALUES (126, 'ABCDEFG', 'http://127.0.0.1/mvc/public/5d05bba4ae82f-banner-orderk20d.jpg', 5, 1, 'ABCDGE', 'A', 0.00, '2019-06-15 17:38:21', '2019-06-16 05:46:44', 1);
INSERT INTO `products` VALUES (127, 'ABCDE', 'http://127.0.0.1/mvc/public/5d05adc66bebf-banner-orderk20d.jpg', 4, 1234, 'ABCDEF', 'A', 0.00, '2019-06-16 04:47:34', '2019-06-16 04:56:21', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(4) NULL DEFAULT NULL,
  `role` int(11) NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'thienth', '', 'admin@gmail.com', NULL, 900, '$2y$10$nqckGqzjiEP7BP59WM5oJO6R16EanVVG561vJqxOb6X8WiMo4PJ7K', 'itISWu9O0Y0DxIiYU7t9W4ARsgpkrqrJ2FTGtDEVPMZuW9ChLciMtohAHNXQ', NULL, NULL);
INSERT INTO `users` VALUES (2, 'chungcc', '', 'moderator@gmail.com', NULL, 700, '$2y$10$nqckGqzjiEP7BP59WM5oJO6R16EanVVG561vJqxOb6X8WiMo4PJ7K', 'pASVtJ9LtlAX6f6uFgRL9AEgI3p7KkiqVv6eWJekpRKMlULsUkAgG93E1zuQ', NULL, NULL);
INSERT INTO `users` VALUES (3, 'member', '', 'member@gmail.com', NULL, 1, '$2y$10$uy21.IAUibmlW1l68bVqxOoNiIrqECbTkdXufUqihT8LMNoe3GIqa', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
