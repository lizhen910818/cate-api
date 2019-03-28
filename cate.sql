 -- 创建数据库cate
-- 1.设置客户端连接sql  使用编码UTF-8
SET NAMES UTF8;
-- 2.丢弃、删除指定的数据库如果存在的话
DROP DATABASE IF EXISTS cate;
-- 3.创建新的数据库
CREATE DATABASE cate CHARSET=UTF8;
-- 4.进入创建好的数据库
USE cate;

-- 功能一:创建管理员信息表 ct_admin
-- aid    INT主键  管理员编号
-- aname   VARCHAR(32)唯一 管理员用户名
-- apwd   VARCHAR(64)加密存储  管理员密码
-- role    ...............    管理员角色
CREATE TABLE ct_admin(
    aid   INT PRIMARY KEY AUTO_INCREMENT,
    aname  VARCHAR(32) UNIQUE,
    apwd VARCHAR(64)
    -- role INT
);
-- 对数据进行加密:md5() 或者 PASSWORD()
INSERT INTO ct_admin VALUES(null,'admin',md5("123456")); 
INSERT INTO ct_admin VALUES(null,'boss',md5("999999")); 

/*-- 功能二:创建项目全局设置表 ct_settings
-- sid         INT 主键    编号
-- appName     VARCHAR(32)    应用/店家名称
-- apiUrl      VARCHAR(64)  数据API 子系统地址
-- adminUrl    VARCHAR(64)  管理后台子系统地址
-- appUrl      VARCHAR(64)   顾客API 子系统地址
-- icp         VARCHAR(64)  系统备案号
--copyright    VARCHAR(128)  系统版权声明*/
CREATE TABLE ct_settings(
   sid INT PRIMARY KEY AUTO_INCREMENT,
    appName VARCHAR(32),
    apiUrl VARCHAR(64),
    adminUrl VARCHAR(64),
    appUrl VARCHAR(64), 
    icp VARCHAR(64),
    copyright VARCHAR(128)
);
INSERT INTO ct_settings VALUES(null,'美味灶台',"http://127.0.0.1:8090","http://127.0.0.1:8091","http://127.0.0.1:8092","京ICP备12003709号-3","Copyright ©2002-2019 北京达内金桥科技有限公司版权所有"); 


-- -- 功能三:创建管理员信息表 ct_table
-- -- tid    INT主键    桌台编号
-- -- tname   VARCHAR(64)允许为空 桌台昵称
-- -- type   VARCHAR(64)  桌台类型   如3~4人桌
-- -- status    INT 1=空闲  2=预定 3=占用 0=其他    当前状态
CREATE TABLE ct_table(
    tid   INT PRIMARY KEY AUTO_INCREMENT,
    tname   VARCHAR(32),
    type   VARCHAR(32),
    status    INT
);
INSERT INTO ct_table VALUES(1,'福满堂',"6人桌",1); 
INSERT INTO ct_table VALUES(2,'金镶玉',"4人桌",2); 
INSERT INTO ct_table VALUES(3,'寿齐天',"10人桌",3); 
INSERT INTO ct_table VALUES(5,'全家福',"2人桌",2); 
INSERT INTO ct_table VALUES(6,'玉如意',"6-8人桌",1); 
INSERT INTO ct_table VALUES(7,'福临门',"4人桌",2); 
INSERT INTO ct_table VALUES(8,'展宏图',"10人桌",3); 
INSERT INTO ct_table VALUES(9,'万年长',"2人桌",3); 
INSERT INTO ct_table VALUES(10,'百事通',"8人桌",1); 
INSERT INTO ct_table VALUES(11,'满堂彩',"4人桌",2); 
INSERT INTO ct_table VALUES(12,'鸿运头',"10人桌",3); 
INSERT INTO ct_table VALUES(13,'齐天寿',"2人桌",2); 
INSERT INTO ct_table VALUES(15,'福满堂',"12人桌",1); 


-- -- 功能四:桌台预定表 ct_reservation
-- -- rid    INT主键    预定信息编号
-- -- contactName   VARCHAR(64)  联系姓名
-- --phone   VARCHAR(16)  联系电话
-- -- contactTime    BIGINT    联系时间
-- -- dinnerTime    BIGINT    预约用餐时间
CREATE TABLE ct_reservation(
    rid INT PRIMARY KEY AUTO_INCREMENT,
    contactName VARCHAR(32),
    phone VARCHAR(16),
    contactTime BIGINT,
    dinnerTime BIGINT,
    tableId INT,
    FOREIGN KEY(tableId) REFERENCES ct_table(tid)
);

INSERT INTO ct_reservation VALUES
(NULL, '丁丁', '13501234561', '1548311700000', '1549011000000', '1'),
(NULL, '当当', '13501234562', '1548311710000', '1549011100000', '1'),
(NULL, '豆豆', '13501234563', '1548311720000', '1549011200000', '2'),
(NULL, '丫丫', '13501234564', '1548311730000', '1549011300000', '2'),
(NULL, '丁丁', '13501234565', '1548311740000', '1549011400000', '3'),
(NULL, '当当', '13501234566', '1548311750000', '1549011500000', '3'),
(NULL, '豆豆', '13501234561', '1548311760000', '1549011600000', '5'),
(NULL, '丫丫', '13501234562', '1548311770000', '1549011700000', '5'),
(NULL, '丁丁', '13501234563', '1548311780000', '1549011800000', '6'),
(NULL, '当当', '13501234564', '1548311790000', '1549011900000', '6'),
(NULL, '豆豆', '13501234565', '1548311800000', '1549011000000', '7'),
(NULL, '丫丫', '13501234566', '1548311810000', '1549011100000', '8'),
(NULL, '豆豆', '13501234567', '1548311820000', '1549011200000', '9'),
(NULL, '丫丫', '13501234561', '1548311840000', '1549011300000', '10'),
(NULL, '丁丁', '13501234562', '1548311850000', '1549011400000', '10'),
(NULL, '当当', '13501234563', '1548311860000', '1549011500000', '11'),
(NULL, '豆豆', '13501234564', '1548311870000', '1549011600000', '11'),
(NULL, '丫丫', '13501234565', '1548311880000', '1549011600000', '12'),
(NULL, '豆豆', '13501234566', '1548311890000', '1549011500000', '13'),
(NULL, '当当', '13501234567', '1548311900000', '1549011300000', '13'),
(NULL, '丫丫', '13501234568', '1548311910000', '1549011200000', '15');


-- -- 功能五:菜品分类表 ct_category
-- -- cid    INT主键    类别编号
-- -- cname   VARCHAR(64)  类别名称
CREATE TABLE ct_category(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    cname VARCHAR(32)
);
INSERT INTO ct_category VALUES(null,"肉类"); 
INSERT INTO ct_category VALUES(null,"丸滑类"); 
INSERT INTO ct_category VALUES(null,"海鲜河鲜"); 
INSERT INTO ct_category VALUES(null,"蔬菜豆制品"); 
INSERT INTO ct_category VALUES(null,"菌菇类"); 

-- -- 功能六:菜品信息表 ct_dish
-- -- did    INT主键    菜品编号,起始值:100000
-- -- title   VARCHAR(32)  菜品名称/标题
-- --imgUrl   VARCHAR(128)  图片地址
-- -- price    DECIMAL(6,2)   价格
-- -- detail   VARCHAR(128)    详细描述信息
-- --categoryId  INT外键,参考类别.cid    所属类别的编号
CREATE TABLE ct_dish(
    did INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(32),
    imgUrl VARCHAR(128),
    price DECIMAL(6,2),
    detail VARCHAR(128),
    categoryId  INT,
    FOREIGN KEY(categoryId) REFERENCES ct_category(cid)
);
INSERT INTO ct_dish VALUES(100000,"草鱼片","CE7I9470.jpg",35,"选鲜活草鱼，切出鱼片冷鲜保存。锅开后再煮1分钟左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"脆皮肠","CE7I9017.jpg",35,"锅开后再煮3分钟左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"酥肉","HGS_4760.jpg",45,"选用冷鲜五花肉，加上鸡蛋，淀粉等原料炸制，色泽黄亮，酥软醇香，肥而不腻。锅开后再煮3分钟左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"现炸酥肉(非清真)","HGS_47601.jpg",35,"选用冷鲜五花肉，加上鸡蛋，淀粉等原料炸制，色泽黄亮，酥软醇香，肥而不腻。锅开后再煮1分钟左右即可食用，也可直接食用",1); 
INSERT INTO ct_dish VALUES(NULL,"牛百叶","CE7I9302.jpg",45,"毛肚切丝后，配以调味料腌制而成。锅开后再煮2分钟左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"腰花","CE7I9287.jpg",15,"选用大型厂家冷鲜腰花，经过解冻、清洗、切片而成。锅开后涮30秒左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"猪脑花","2345.jpg",25,"选用大型厂家冷鲜猪脑经过清洗，过水、撕膜而成。肉质细腻，锅开后再煮8分钟左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"午餐肉","wucanr.jpg",35,"锅开后再煮2分钟左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"牛仔骨","1-CE7I5290.jpg",45,"牛仔骨又称牛小排，选自资质合格的厂家生产配送。锅开后再煮5分钟左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"新西兰羊肉卷","CE7I88041.jpg",35,"选用新西兰羔羊肉的前胸和肩胛为原料，在国内经过分割、压制成型，肥瘦均匀。锅开后涮30秒左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"捞派黄喉","EU0A01121.jpg",35,"黄喉主要是猪和牛的大血管，以脆爽见长，是四川火锅中的经典菜式。捞派黄喉选用猪黄喉，相比牛黄喉，猪黄喉只有30cm可用，肉质比牛黄喉薄，口感更脆。 捞派黄喉，通过去筋膜、清水浸泡15小时以上，自然去除黄喉的血水和腥味。口感脆嫩弹牙，是川味火锅的经典菜式",1); 
INSERT INTO ct_dish VALUES(NULL,"千层毛肚","CE7I89001.jpg",45,"选自牛的草肚，加入葱、姜、五香料一起煮熟后切片而成。五香味浓、耙软化渣。锅开后再煮3分钟左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"捞派脆脆毛肚","cuiciumaod.jpg",55,"选自牛的草肚，采用流水清洗、撕片等工艺，加入各种调味料腌制而成。口感脆嫩，锅开后再采用“七上八下”的方法涮15秒即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"捞派嫩羊肉","nenyangr.jpg",35,"羊后腿肉肉质紧实，肥肉少，以瘦肉为主；肉中夹筋，筋肉相连。肉质相比前腿肉更为细嫩，用途广，一般用于烧烤、酱制等用途。海底捞只选用生长周期达到6—8个月的草原羔羊，肉嫩筋少而膻味少。精选羔羊后腿肉，肉质紧实，瘦而不柴，再用红油腌制入味，肉香与油香充分融合，一口咬下去鲜嫩多汁、肉味十足",1); 
INSERT INTO ct_dish VALUES(NULL,"草原羔羊肉","CE7I6859.jpg",45,"
选自内蒙锡林郭勒大草原10月龄以下羔羊，经过排酸、切割、冷冻而成。锅开后涮30秒左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"澳洲肥牛(和牛)","CE7I88713.jpg",35,"百分百澳洲牛肉的前胸部位，口感香嫩，汁浓味厚。锅开后涮30秒即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"捞派滑牛肉","laopaihuaniurou.jpg",45,"捞派滑牛肉使用的牛肉是大小米龙和嫩肩肉，是牛的后腿和前腿部位，最嫩的部位，形状像黄瓜，俗称：黄瓜条。每份滑牛都要经过解冻、去筋膜、分割、切片、腌制等9道复杂工序，口感滑嫩，久煮不老，是海底捞必点菜品",1); 
INSERT INTO ct_dish VALUES(NULL,"血旺","CE7I68261.jpg",35,"选用资质合格的厂家配送。锅开后再煮5分钟左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"捞派肥牛","CE7I69031.jpg",45,"肥牛是经过排酸处理后切成薄片的牛肉。排酸是指通过一定的温度、湿度、风速的环境下使牛的肌肉纤维发生变化，其口感更细腻、化渣。海底捞的捞派肥牛，精选谷饲100天以上的牛，自然块分割，肉味十足，久涮不淡",1); 
INSERT INTO ct_dish VALUES(NULL,"捞派鸭肠","pailaoc7.jpg",45,"火锅三宝之一。鸭肠，具有韧性。口感脆爽有嚼劲，是火锅中经常用到的食材。 捞派鸭肠，选用资质和证件齐全的屠宰场鸭肠。经过掏肠、去大油、结石、抛肠、清洗、刀工去小油、清洗等步骤，确保每根鸭肠无杂物。捞派鸭肠口感自然脆爽，下锅涮食20-25秒左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"捞派毛肚","CE7I6805.jpg",35,"选自牛的草肚，采用流水清洗、撕片等工艺，加入葱姜、料酒、花椒浸泡而成。口感脆嫩，锅开后涮10-15秒即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"羊排卷","CE7I69262.jpg",45,"甄选12月龄以下放牧羔羊，以肥瘦相间的腹肉部位加工而成。口感细嫩化渣，锅开后涮30秒左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"手切羊肉","CE7I88331.jpg",35,"甄选12月龄以下羔羊后腿以及羊霖，经过切配、装盘而成。锅开后再煮1分钟左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"火边子牛肉","HGS_60461.jpg",45,"沿用四川自贡盐井的名菜火边子牛肉工艺，主要采用黄瓜条、多种炒香辣椒面、香辛料配制而成。颜色红亮，口味香辣刺激。锅开后再煮4分钟左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"派精品肥牛","CE7I68611.jpg",35,"是经过排酸处理后切成薄片的牛肉。排酸是指通过一定的温度、湿度、风速的环境下使牛的肌肉纤维发生变化，其口感更细腻、化渣。 海底捞的精品肥牛，精选进口、自然生长谷饲100天以上的牛。每头牛只选用牛背部第1-6根肋骨上脑部位，一头牛产20公斤左右。经过排酸处理后，自然块分割，涮食时不易散，肉味浓，保证牛肉原有的香味",1); 
INSERT INTO ct_dish VALUES(NULL,"羊眼","CE7I5311.jpg",45,"羊眼经过排酸、切割、冷冻而成。锅开后再煮5分钟左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"猪蹄","CE7I9134.jpg",35,"猪蹄斩成小块，经过清洗，过水，用十余种符合国家食品安全的食材一起炖煮而成。锅开后再煮5分钟即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"派小鲜肉(非清真)","HGS_5710.jpg",45,"将上好猪颈肉切片腌制，口感鲜香、脆嫩、爽滑，这就是您的小鲜肉。锅开后再煮3分钟左右即可食用",1); 
INSERT INTO ct_dish VALUES(NULL,"捞派九尺鸭肠","6.jpg",35,"选自资质合格的供应商配送的鲜鸭肠。锅开后再“七上八下”涮食15秒即可食用",1); 

-- -- 功能七:订单表：订单表：ct_order
-- oid	INT 主键	订单编号
-- startTime	BIGINT	开始用餐时间
-- endTime	BIGINT	用餐结束时间
-- customerCount	INT	用餐人数
-- tableId	INT 外键，参考桌台.tid	桌台编号


CREATE TABLE ct_order(
    oid INT PRIMARY KEY AUTO_INCREMENT,
    startTime BIGINT,
    endTime BIGINT,
    customerCount INT,
    tableId INT,
    FOREIGN KEY(tableId) REFERENCES ct_table(tid)
);
INSERT INTO ct_order VALUES
(100000, '1547800000000', '1547814918000', '2', '1'),
(NULL, '1547801000000', '1547824918000', '4', '2'),
(NULL, '1547802000000', '1547834918000', '3', '3'),
(NULL, '1547803000000', '1547844918000', '5', '5'),
(NULL, '1547804000000', '1547854918000', '8', '6'),
(NULL, '1547805000000', '1547864918000', '2', '7'),
(NULL, '1547806000000', '1547874918000', '1', '8'),
(NULL, '1547807000000', '1547884918000', '2', '9'),
(NULL, '1547808000000', '1547894918000', '6', '10'),
(NULL, '1547809000000', '1547804918000', '3', '11'),
(NULL, '1547800000000', '1547814918000', '10', '12'),
(NULL, '1547801000000', '1547824918000', '2', '13'),
(NULL, '1547802000000', '1547834918000', '4', '15'),
(NULL, '1547800000000', '1547814918000', '2', '1'),
(NULL, '1547801000000', '1547824918000', '4', '2'),
(NULL, '1547802000000', '1547834918000', '3', '3');


-- -- 功能八:订单表：xfn_order_detail
-- oid	INT 主键	订单编号
-- dishId	INT 外键，参考菜品.did	菜品编号/*菜品编号*/
-- dishCount	INT	菜品数量/*份数*/
-- customerName	VARCHAR(64)	点餐用户的称呼/*顾客名称*/
-- orderId	INT外键，参考订单.oid	订单编号，指明所属订单/*订单编号*/

CREATE TABLE ct_order_detail(
   oid INT PRIMARY KEY AUTO_INCREMENT,
    dishId INT,
    dishCount INT,
    customerName VARCHAR(32),
    orderId INT,
    FOREIGN KEY(dishId) REFERENCES ct_dish(did),
    FOREIGN KEY(orderId) REFERENCES ct_order(oid)
);
INSERT INTO ct_order_detail VALUES
(NULL, '100001', '2', '丁丁', '100000'),
(NULL, '100002', '2', '丁丁', '100002'),
(NULL, '100003', '2', '丁丁', '100003'),
(NULL, '100004', '2', '丁丁', '100004'),
(NULL, '100005', '2', '丁丁', '100005'),
(NULL, '100006', '2', '丁丁', '100006'),
(NULL, '100007', '2', '丁丁', '100007'),
(NULL, '100008', '2', '丁丁', '100008'),
(NULL, '100009', '2', '丁丁', '100009'),
(NULL, '100010', '2', '丁丁', '100010');
