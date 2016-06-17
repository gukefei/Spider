-- --------------------------------------------------------
-- 主机:                           192.168.10.180
-- 服务器版本:                        5.6.17-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 spider.sp_category 结构
CREATE TABLE IF NOT EXISTS `sp_category` (
  `cat_id` varchar(10) NOT NULL COMMENT '类目id',
  `name_cn` varchar(10) DEFAULT '' COMMENT '类目中文名称',
  `name_en` varchar(100) DEFAULT '' COMMENT '类目因为名称',
  `remark` varchar(255) DEFAULT '' COMMENT '类目描述',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类目';

-- 正在导出表  spider.sp_category 的数据：~206 rows (大约)
/*!40000 ALTER TABLE `sp_category` DISABLE KEYS */;
INSERT INTO `sp_category` (`cat_id`, `name_cn`, `name_en`, `remark`) VALUES
	('01', '美妆个护\n', '', ''),
	('0101', '彩妆\n', '', ''),
	('010101', '面部\n', '', ''),
	('01010101', '粉底\n', '', ''),
	('01010102', '有色面霜\n', '', ''),
	('01010103', 'BB霜CC霜\r ', '', ''),
	('01010104', '隔离/妆前乳\n', '', ''),
	('01010105', '散粉\n', '', ''),
	('01010106', '腮红\n', '', ''),
	('01010107', '遮瑕膏\n', '', ''),
	('01010108', '卸妆\n', '', ''),
	('010102', '眼部\n', '', ''),
	('01010201', '眼影\n', '', ''),
	('01010202', '睫毛膏\n', '', ''),
	('01010203', '眼线\n', '', ''),
	('01010204', '眉笔/眉粉\n', '', ''),
	('010103', '唇部\n', '', ''),
	('01010301', '口红\n', '', ''),
	('01010302', '唇彩/染唇液\n', '', ''),
	('010104', '化妆工具	\n', '', ''),
	('0102', '香水\n', '', ''),
	('010201', '香膏', '', ''),
	('010202', '香水\r ', '', ''),
	('0103', '面部护肤\n', '', ''),
	('010301', '洁面\n', '', ''),
	('010302', '化妆水/爽肤水\n', '', ''),
	('010303', '乳液/面霜\n', '', ''),
	('010304', '面部精华\n', '', ''),
	('010306', '眼霜\n', '', ''),
	('010307', '护肤油\n', '', ''),
	('010308', '防晒\n', '', ''),
	('010309', '面膜\n', '', ''),
	('0104', '身体护理\n', '', ''),
	('010401', '沐浴露\n', '', ''),
	('010402', '身体磨砂\n', '', ''),
	('010403', '润肤乳\n', '', ''),
	('0105', '指甲护理\n', '', ''),
	('010501', '指甲油\n', '', ''),
	('010502', '美甲套装\n', '', ''),
	('010503', '指甲护理/卸甲水	\n', '', ''),
	('0106', '头发护理\n', '', ''),
	('010601', '洗发水\n', '', ''),
	('010602', '护发素\n', '', ''),
	('010603', '造型\n', '', ''),
	('0107', '剃须&脱毛\n', '', ''),
	('010701', '手动剃须刀\n', '', ''),
	('010702', '电动剃须刀\n', '', ''),
	('010703', '剃须膏\n', '', ''),
	('010704', '须后膏\n', '', ''),
	('010705', '脱毛膏\n', '', ''),
	('010706', '蜜蜡脱毛	\n', '', ''),
	('0108', '口腔护理\n', '', ''),
	('010801', '牙刷\n', '', ''),
	('010802', '牙膏\n', '', ''),
	('010803', '牙线\n', '', ''),
	('010804', '漱口水	\n', '', ''),
	('0109', '女性护理\n', '', ''),
	('010901', '卫生巾\n', '', ''),
	('010902', '卫生棉条	\n', '', ''),
	('02', '服饰鞋包\n', '', ''),
	('0201', '女装', '', ''),
	('020101', 'T恤/衬衣', '', ''),
	('020102', '外套 \n', '', ''),
	('020103', '小西装 \n', '', ''),
	('020104', '针织衫/卫衣/毛衣', '', ''),
	('020105', '连衣裙 \n', '', ''),
	('020106', '牛仔裤 \n', '', ''),
	('020107', '文胸/文胸套装 \n', '', ''),
	('020108', '睡衣/家居服	\n', '', ''),
	('0202', '男装', '', ''),
	('020201', '针织衫/毛衣/卫衣\n', '', ''),
	('020202', '外套/大衣/羽绒服\n', '', ''),
	('020204', '西装\n', '', ''),
	('020205', '牛仔裤 \n', '', ''),
	('020206', '裤子\n', '', ''),
	('020207', '男士睡衣/家居服 \n', '', ''),
	('020208', '内裤 /袜子\n', '', ''),
	('020209', '短袖/T恤', '', ''),
	('0203', '宝宝服饰\n', '', ''),
	('020301', '身衣/连爬服 \n', '', ''),
	('020302', '裤子 \n', '', ''),
	('020303', '上衣\n', '', ''),
	('020304', '其他 	\n', '', ''),
	('0204', '箱包靴鞋\n', '', ''),
	('020401', '时尚女包 \n', '', ''),
	('020402', '女士钱包 \n', '', ''),
	('020403', '精品男包 \n', '', ''),
	('020404', '男士钱包 \n', '', ''),
	('020405', '旅行箱包 \n', '', ''),
	('020406', '高跟鞋\n', '', ''),
	('020407', '女靴', '', ''),
	('020408', '休闲鞋女鞋\n', '', ''),
	('020409', '流行男鞋 \n', '', ''),
	('020410', '男靴 \n', '', ''),
	('020411', '男士休闲皮鞋', '', ''),
	('020412', '帆布鞋/休闲鞋\n', '', ''),
	('0205', '运动户外\n', '', ''),
	('020501', '运动鞋 \n', '', ''),
	('020502', '跑步鞋 \n', '', ''),
	('020503', '休闲板鞋\n', '', ''),
	('020504', '篮球鞋 \n', '', ''),
	('020505', '户外服装/装备 	\n', '', ''),
	('0206', '饰品手表\n', '', ''),
	('020601', '项链/吊坠 \n', '', ''),
	('020602', '手链/手镯 \n', '', ''),
	('020603', '戒指 \n', '', ''),
	('020604', '耳环 \n', '', ''),
	('020605', '手表\n', '', ''),
	('020606', '帽子 \n', '', ''),
	('020607', '围巾/手套\n', '', ''),
	('020608', '腰带/皮带/腰链	\n', '', ''),
	('03', '母婴用品\n', '', ''),
	('0301', '宝宝食品\n', '', ''),
	('030101', '奶粉\n', '', ''),
	('030102', '豆奶粉\n', '', ''),
	('030103', '宝宝辅食及零食\n', '', ''),
	('0302', '宝宝用品\n', '', ''),
	('030201', '纸尿裤\n', '', ''),
	('03020101', '尿布裤/训练裤', '', ''),
	('030202', '安全座椅\n', '', ''),
	('030203', '其他养娃神器\n', '', ''),
	('0303', '宝宝洗护\n', '', ''),
	('030301', '驱蚊防虫\n', '', ''),
	('030302', '爽身防痱\n', '', ''),
	('030303', '宝贝防晒\n', '', ''),
	('030304', '宝贝护肤\n', '', ''),
	('030305', '宝宝口腔护理\n', '', ''),
	('030306', '宝宝洗衣液\n', '', ''),
	('030307', '宝宝护臀\n', '', ''),
	('030308', '洗发沐浴\n', '', ''),
	('0304', '宝宝服饰/玩具\n', '', ''),
	('030401', '连体衣/连爬服\n', '', ''),
	('030402', '裤子\n', '', ''),
	('030403', '上衣\n', '', ''),
	('030404', '帽子及配饰\n', '', ''),
	('030405', '宝宝礼服\n', '', ''),
	('030406', '玩具\n', '', ''),
	('0305', '孕产妇用品\n', '', ''),
	('030501', '孕妇装\n', '', ''),
	('030502', '产妇卫生巾\n', '', ''),
	('030503', '孕产妇维生素\n', '', ''),
	('030504', '哺乳用品\n', '', ''),
	('03050401', '奶瓶\n', '', ''),
	('03050402', '奶嘴\n', '', ''),
	('03050403', '吸奶器\n', '', ''),
	('03050404', '催奶发奶\n', '', ''),
	('03050405', '防溢乳垫\n', '', ''),
	('04', '食品保健', '', ''),
	('0401', '进口食品\n', '', ''),
	('040101', '零食\n', '', ''),
	('040102', '生鲜\n', '', ''),
	('040103', '干货\n', '', ''),
	('0402', '进口饮料\n', '', ''),
	('040201', '成人奶粉\n', '', ''),
	('040202', '茶\r ', '', ''),
	('040203', '咖啡\n', '', ''),
	('040204', '营养代餐\n', '', ''),
	('040205', '进口瓶装水\n', '', ''),
	('040206', '其他\n', '', ''),
	('0403', '保健品\n', '', ''),
	('040301', '心脑血管\n', '', ''),
	('040302', '排毒清肠', '', ''),
	('040303', '体重管理\n', '', ''),
	('040304', '骨骼关节养护\n', '', ''),
	('040305', '眼部保养\n', '', ''),
	('040306', '改善睡眠', '', ''),
	('040307', '内分泌调理', '', ''),
	('040308', '其他补品	\n', '', ''),
	('05', '生活数码', '', ''),
	('0501', '生活用品\n', '', ''),
	('050101', '打火机\n', '', ''),
	('050102', '厨房用品\n', '', ''),
	('05010201', '锅具\n', '', ''),
	('05010202', '保温杯\n', '', ''),
	('050103', '文具	\n', '', ''),
	('05010301', '钢笔', '', ''),
	('0502', '家用电器\n', '', ''),
	('050201', '料理机\n', '', ''),
	('050202', '厨师机\n', '', ''),
	('050203', '慢炖锅\n', '', ''),
	('050204', '面包机\n', '', ''),
	('050205', '咖啡机\n', '', ''),
	('050206', '吐司机\n', '', ''),
	('050207', '果汁机\n', '', ''),
	('050208', '空气净化器\n', '', ''),
	('050209', '除湿器\n', '', ''),
	('050210', '加湿器\n', '', ''),
	('050211', '加热器\n', '', ''),
	('050212', '吸尘器\n', '', ''),
	('050213', '净水器\n', '', ''),
	('0503', '数码产品\n', '', ''),
	('050301', '相机及配件\n', '', ''),
	('05030101', '移动硬盘\n', '', ''),
	('05030102', '闪存\n', '', ''),
	('05030103', '储存卡\n', '', ''),
	('050302', '数码存储\n', '', ''),
	('050303', '移动穿戴\n', '', ''),
	('05030301', '健身运动\n', '', ''),
	('05030302', '虚拟现实眼罩\n', '', ''),
	('050304', '创新产品\n', '', ''),
	('05030401', '3D打印机\r ', '', ''),
	('0504', '娱乐玩具\n', '', ''),
	('050401', '遥控玩具\n', '', ''),
	('050402', '积木玩具\n', '', ''),
	('050403', '模型玩具\n', '', ''),
	('0505', '乐器配件\n', '', '');
/*!40000 ALTER TABLE `sp_category` ENABLE KEYS */;


-- 导出  表 spider.sp_detail_pattern 结构
CREATE TABLE IF NOT EXISTS `sp_detail_pattern` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(10) unsigned NOT NULL COMMENT '采集站点id',
  `name_pattern` varchar(100) DEFAULT NULL COMMENT '商品名称的匹配规则',
  `price_pattern` varchar(100) DEFAULT NULL COMMENT '价格的匹配规则',
  `img_pattern` varchar(100) DEFAULT NULL COMMENT '图片的匹配规则',
  `description_pattern` varchar(100) DEFAULT NULL COMMENT '描述的匹配规则',
  PRIMARY KEY (`id`),
  KEY `website_id` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='采集站点详情页的匹配规则';

-- 正在导出表  spider.sp_detail_pattern 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sp_detail_pattern` DISABLE KEYS */;
/*!40000 ALTER TABLE `sp_detail_pattern` ENABLE KEYS */;


-- 导出  表 spider.sp_detail_urls 结构
CREATE TABLE IF NOT EXISTS `sp_detail_urls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(10) unsigned NOT NULL COMMENT '采集站点id',
  `url` varchar(255) NOT NULL COMMENT '采集url',
  `rule_id` int(10) unsigned DEFAULT NULL COMMENT '采集规则id',
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '1-可以采集，2-不再采集',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `website_id` (`website_id`),
  KEY `status` (`status`),
  KEY `rule_id` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集url-详情页';

-- 正在导出表  spider.sp_detail_urls 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sp_detail_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `sp_detail_urls` ENABLE KEYS */;


-- 导出  表 spider.sp_goods 结构
CREATE TABLE IF NOT EXISTS `sp_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url_id` int(10) unsigned NOT NULL COMMENT '商品在采集站点的url的id，对应于sp_urls的id',
  `name_en` varchar(255) DEFAULT NULL COMMENT '商品英文标题',
  `website_id` int(10) unsigned NOT NULL COMMENT '采集站点id',
  `cat_id` varchar(10) DEFAULT NULL COMMENT '类目id',
  `name_cn` varchar(255) DEFAULT NULL COMMENT '商品中文标题',
  `content` text COMMENT '商品详情描述',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '商品价格',
  `currency` varchar(1) NOT NULL COMMENT '币种，对应于sp_websites中的currency',
  `img` text COMMENT '商品图片',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated` timestamp NULL DEFAULT NULL COMMENT '最后一次更新的时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_id` (`url_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集的内容';

-- 正在导出表  spider.sp_goods 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sp_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `sp_goods` ENABLE KEYS */;


-- 导出  表 spider.sp_goods_history 结构
CREATE TABLE IF NOT EXISTS `sp_goods_history` (
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '价格',
  `updated` int(10) unsigned NOT NULL COMMENT '更新时间',
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品更新历史';

-- 正在导出表  spider.sp_goods_history 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sp_goods_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sp_goods_history` ENABLE KEYS */;


-- 导出  表 spider.sp_list_pattern 结构
CREATE TABLE IF NOT EXISTS `sp_list_pattern` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(10) unsigned NOT NULL COMMENT '采集站点id',
  `cat_id` varchar(10) DEFAULT NULL COMMENT '商品的类目id',
  `pattern` varchar(100) DEFAULT NULL COMMENT '大前提下的匹配规则',
  `name_pattern` varchar(100) DEFAULT NULL COMMENT '商品名称的匹配规则',
  `name_pattern_attr` varchar(30) DEFAULT NULL COMMENT '商品名称的抽取规则，如果有则代表以该名称作为属性来抽取，否则以该标签的内容作为抽取规则',
  `url_pattern` varchar(100) DEFAULT NULL COMMENT '商品详情页链接地址的匹配规则',
  `url_pattern_attr` varchar(30) DEFAULT 'href' COMMENT '商品详情页链接地址的抽取规则',
  `price_pattern` varchar(100) DEFAULT NULL COMMENT '价格的匹配规则',
  `price_pattern_attr` varchar(30) DEFAULT NULL COMMENT '价格的抽取规则',
  `img_pattern` varchar(100) DEFAULT NULL COMMENT '图片的匹配规则',
  `img_pattern_attr` varchar(30) DEFAULT 'src' COMMENT '图片的抽取规则',
  `description_pattern` varchar(100) DEFAULT NULL COMMENT '描述的匹配规则',
  `description_pattern_attr` varchar(30) DEFAULT NULL COMMENT '描述的抽取规则',
  `page` varchar(20) DEFAULT NULL COMMENT 'url地址中页码的变量名称',
  `page_step` varchar(10) DEFAULT NULL COMMENT '页数每次增加的幅度',
  PRIMARY KEY (`id`),
  KEY `website_id` (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='采集站点列表页特殊匹配规则';

-- 正在导出表  spider.sp_list_pattern 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sp_list_pattern` DISABLE KEYS */;
INSERT INTO `sp_list_pattern` (`id`, `website_id`, `cat_id`, `pattern`, `name_pattern`, `name_pattern_attr`, `url_pattern`, `url_pattern_attr`, `price_pattern`, `price_pattern_attr`, `img_pattern`, `img_pattern_attr`, `description_pattern`, `description_pattern_attr`, `page`, `page_step`) VALUES
	(1, 1, NULL, 'ul.s-result-list li', 'a h2', NULL, NULL, NULL, '.a-spacing-top-small .a-row a.a-text-normal span.a-color-price', NULL, '.s-consumables-image img', 'src', NULL, NULL, 'page', '1'),
	(2, 2, NULL, '.grid div.items .item', '.title a.J_ClickStat', NULL, '.pic a', 'data-href', '.price', NULL, '.pic img', 'data-src', NULL, NULL, 's', '60');
/*!40000 ALTER TABLE `sp_list_pattern` ENABLE KEYS */;


-- 导出  表 spider.sp_list_urls 结构
CREATE TABLE IF NOT EXISTS `sp_list_urls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(10) unsigned NOT NULL COMMENT '采集站点id',
  `url` varchar(255) NOT NULL COMMENT '采集url',
  `rule_id` int(10) unsigned DEFAULT NULL COMMENT '采集规则id',
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '1-可以采集，2-不再采集',
  `created` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `website_id` (`website_id`),
  KEY `status` (`status`),
  KEY `rule_id` (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='采集url-列表页';

-- 正在导出表  spider.sp_list_urls 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sp_list_urls` DISABLE KEYS */;
INSERT INTO `sp_list_urls` (`id`, `website_id`, `url`, `rule_id`, `status`, `created`) VALUES
	(1, 1, 'https://www.amazon.com/b/ref=s9_acss_bw_cg_BeautCat_2a1?node=11060451&pf_rd_m=ATVPDKIKX0DER&pf_rd_s=', 1, '1', 1465784128),
	(2, 2, 'https://s.taobao.com/list?q=%E9%98%B2%E6%99%92&cat=1801%2C50071436%2C50010788&style=grid&seller_type=taobao', 2, '1', 1466049231);
/*!40000 ALTER TABLE `sp_list_urls` ENABLE KEYS */;


-- 导出  表 spider.sp_websites 结构
CREATE TABLE IF NOT EXISTS `sp_websites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL COMMENT '网站英文名',
  `name_cn` varchar(255) DEFAULT NULL COMMENT '网站中文名',
  `url` varchar(255) DEFAULT NULL COMMENT '网站地址',
  `content` text COMMENT '网站描述',
  `currency` varchar(1) DEFAULT '1' COMMENT '1-人民币，2-美金，3-加币',
  `remark` varchar(255) DEFAULT NULL COMMENT '网站备注',
  `created` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='采集站点';

-- 正在导出表  spider.sp_websites 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `sp_websites` DISABLE KEYS */;
INSERT INTO `sp_websites` (`id`, `name_en`, `name_cn`, `url`, `content`, `currency`, `remark`, `created`) VALUES
	(1, 'Amazon.com', '亚马逊（美国）', 'http://www.amazon.com', NULL, '2', NULL, 1465784128),
	(2, 'Taobao.com', '淘宝网', 'http://www.taobao.com', NULL, '1', NULL, 1466049231);
/*!40000 ALTER TABLE `sp_websites` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
