-- 宿舍管理系统数据库初始化脚本
-- 数据库名：dormitory_management

-- 切换到dormitory_management数据库
USE dormitory_management;

-- 临时禁用外键检查
SET FOREIGN_KEY_CHECKS = 0;

-- 创建管理员表
CREATE TABLE IF NOT EXISTS admin (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    age INT,
    phone_num VARCHAR(20),
    email VARCHAR(100),
    avatar VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 创建宿舍楼表
CREATE TABLE IF NOT EXISTS dorm_build (
    dormbuild_id INT NOT NULL PRIMARY KEY,
    dormbuild_name VARCHAR(100) NOT NULL,
    dormbuild_detail TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 创建宿舍管理员表
CREATE TABLE IF NOT EXISTS dorm_manager (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    dormbuild_id INT,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    age INT,
    phone_num VARCHAR(20),
    email VARCHAR(100),
    avatar VARCHAR(255)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 创建宿舍房间表
CREATE TABLE IF NOT EXISTS dorm_room (
    dormroom_id INT PRIMARY KEY,
    dormbuild_id INT NOT NULL,
    floor_num INT NOT NULL,
    max_capacity INT NOT NULL DEFAULT 4,
    current_capacity INT NOT NULL DEFAULT 0,
    first_bed VARCHAR(50),
    second_bed VARCHAR(50),
    third_bed VARCHAR(50),
    fourth_bed VARCHAR(50)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 创建学生表
CREATE TABLE IF NOT EXISTS student (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(50) NOT NULL,
    age INT,
    gender VARCHAR(10),
    phone_num VARCHAR(20),
    email VARCHAR(100),
    avatar VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 创建公告表
CREATE TABLE IF NOT EXISTS notice (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    author VARCHAR(50) NOT NULL,
    release_time DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 创建报修单表
CREATE TABLE IF NOT EXISTS repair (
    id INT PRIMARY KEY,
    repairer VARCHAR(50) NOT NULL,
    dormbuild_id INT NOT NULL,
    dormroom_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    state VARCHAR(20) NOT NULL DEFAULT '待处理',
    order_buildtime DATETIME NOT NULL,
    order_finishtime DATETIME

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 创建访客表
CREATE TABLE IF NOT EXISTS visitor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    phone_num VARCHAR(20) NOT NULL,
    origin_city VARCHAR(100),
    visit_time DATETIME NOT NULL,
    content TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 创建调宿申请表
CREATE TABLE IF NOT EXISTS adjust_room (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    currentroom_id INT NOT NULL,
    currentbed_id INT NOT NULL,
    towardsroom_id INT NOT NULL,
    towardsbed_id INT NOT NULL,
    state VARCHAR(20) NOT NULL DEFAULT '待审核',
    apply_time DATETIME NOT NULL,
    finish_time DATETIME

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 插入初始数据

-- 插入管理员账号
INSERT INTO admin (username, password, name, gender, age, phone_num, email) VALUES 
('admin', '123456', '系统管理员', '男', 30, '13800138000', 'admin@example.com');

-- 插入宿舍楼数据
INSERT INTO dorm_build (dormbuild_id, dormbuild_name, dormbuild_detail) VALUES 
(1, '男生1号楼', '男生宿舍1号楼'),
(2, '男生2号楼', '男生宿舍2号楼'),
(3, '女生1号楼', '女生宿舍1号楼'),
(4, '女生2号楼', '女生宿舍2号楼');

-- 插入宿舍管理员数据
INSERT INTO dorm_manager (username, password, dormbuild_id, name, gender, age, phone_num, email) VALUES 
('dm001', '123456', 1, '张阿姨', '女', 45, '13900139001', 'dm001@example.com'),
('dm002', '123456', 2, '李叔叔', '男', 50, '13900139002', 'dm002@example.com'),
('dm003', '123456', 3, '王阿姨', '女', 48, '13900139003', 'dm003@example.com'),
('dm004', '123456', 4, '赵叔叔', '男', 52, '13900139004', 'dm004@example.com');

-- 插入宿舍房间数据
-- 男生1号楼房间
INSERT INTO dorm_room (dormroom_id, dormbuild_id, floor_num, max_capacity, current_capacity) VALUES 
(101, 1, 1, 4, 0),
(102, 1, 1, 4, 0),
(201, 1, 2, 4, 0),
(202, 1, 2, 4, 0);

-- 男生2号楼房间
INSERT INTO dorm_room (dormroom_id, dormbuild_id, floor_num, max_capacity, current_capacity) VALUES 
(301, 2, 1, 4, 0),
(302, 2, 1, 4, 0),
(401, 2, 2, 4, 0),
(402, 2, 2, 4, 0);

-- 女生1号楼房间
INSERT INTO dorm_room (dormroom_id, dormbuild_id, floor_num, max_capacity, current_capacity) VALUES 
(501, 3, 1, 4, 0),
(502, 3, 1, 4, 0),
(601, 3, 2, 4, 0),
(602, 3, 2, 4, 0);

-- 女生2号楼房间
INSERT INTO dorm_room (dormroom_id, dormbuild_id, floor_num, max_capacity, current_capacity) VALUES 
(701, 4, 1, 4, 0),
(702, 4, 1, 4, 0),
(801, 4, 2, 4, 0),
(802, 4, 2, 4, 0);

-- 插入示例学生数据
INSERT INTO student (username, password, name, gender, age, phone_num, email) VALUES 
('20230001', '123456', '张三', '男', 18, '13700137001', 'student1@example.com'),
('20230002', '123456', '李四', '男', 19, '13700137002', 'student2@example.com'),
('20230003', '123456', '王五', '男', 18, '13700137003', 'student3@example.com'),
('20230004', '123456', '赵六', '男', 20, '13700137004', 'student4@example.com'),
('20230005', '123456', '陈七', '女', 18, '13700137005', 'student5@example.com'),
('20230006', '123456', '林八', '女', 19, '13700137006', 'student6@example.com'),
('20230007', '123456', '黄九', '女', 18, '13700137007', 'student7@example.com'),
('20230008', '123456', '周十', '女', 20, '13700137008', 'student8@example.com');

-- 插入示例公告数据
INSERT INTO notice (title, content, author, release_time) VALUES 
('新学期宿舍管理规定', '为了维护良好的宿舍环境，请所有同学遵守宿舍管理规定，按时作息，保持卫生。', 'admin', NOW()),
('水电费缴纳通知', '请各位同学及时缴纳水电费，逾期将影响正常用水用电。', 'admin', NOW()),
('宿舍安全提醒', '请注意宿舍安全，离开时请关好门窗，贵重物品妥善保管。', 'admin', NOW());

-- 插入示例报修单数据
INSERT INTO repair (id, repairer, dormbuild_id, dormroom_id, title, content, state, order_buildtime) VALUES 
(1, '20230001', 1, 101, '灯管损坏', '宿舍内灯管不亮，需要更换。', '待处理', NOW());

-- 插入示例访客数据
INSERT INTO visitor (name, gender, phone_num, origin_city, visit_time, content) VALUES 
('李家长', '男', '13600136001', '北京', NOW(), '看望学生');

-- 插入示例调宿申请
INSERT INTO adjust_room (username, name, currentroom_id, currentbed_id, towardsroom_id, towardsbed_id, state, apply_time) VALUES 
('20230001', '张三', 101, 1, 102, 1, '待审核', NOW());

-- 用户添加说明：
-- 1. 管理员账号：admin / 123456
-- 2. 宿舍管理员账号：dm001-dm004 / 123456
-- 3. 学生账号：20230001-20230008 / 123456
-- 4. 可以根据需要添加更多用户账号
-- 5. 密码建议在实际使用时修改为更安全的密码
