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
    aname  VARCHAR(32),
    apwd VARCHAR(64)
    -- role INT
);
INSERT INTO ct_admin VALUES(null,'tom',md5("123456")); 

-- 功能二:创建项目全局设置表 ct_settings
-- sid         INT 主键    编号
-- appName     VARCHAR(32)    应用/店家名称
-- apiUrl      VARCHAR(64)  数据API 子系统地址
-- adminUrl    VARCHAR(64)  管理后台子系统地址
-- appUrl      VARCHAR(64)   顾客API 子系统地址
-- icp         VARCHAR(64)  系统备案号
--copyright    VARCHAR(128)  系统版权声明
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


-- 功能三:创建管理员信息表 ct_table
-- tid    INT主键    桌台编号
-- tname   VARCHAR(64)允许为空 桌台昵称
-- type   VARCHAR(64)  桌台类型   如3~4人桌
-- status    INT 1=空闲  2=预定 3=占用 0=其他    当前状态
CREATE TABLE ct_table(
    tid   INT PRIMARY KEY AUTO_INCREMENT,
    tname   VARCHAR(64),
    type   VARCHAR(64),
    status    INT
);
INSERT INTO ct_table VALUES(null,'牡丹桌',"3~4人桌",1); 

-- 功能四:桌台预定表 ct_reservation
-- rid    INT主键    预定信息编号
-- contactName   VARCHAR(64)  联系姓名
--phone   VARCHAR(16)  联系电话
-- contactTime    BIGINT    联系时间
-- dinnerTime    BIGINT    预约用餐时间




-- 功能五:菜品分类表 ct_category
-- cid    INT主键    类别编号
-- cname   VARCHAR(64)  类别名称


-- 功能六:菜品信息表 ct_dish
-- did    INT主键    菜品编号,起始值:100000
-- title   VARCHAR(32)  菜品名称/标题
--imgUrl   VARCHAR(128)  图片地址
-- price    DECIMAL(6,2)   价格
-- detail   VARCHAR(128)    详细描述信息
--categoryld  INT外键,参考类别.cid    所属类别的编号
