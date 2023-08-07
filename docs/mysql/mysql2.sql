
# 数据准备
# 创建数据库和表

drop database if exists mydb2;
create database if not exists mydb2;
use mydb2;

# 创建商品表
drop table if exists product;
create table if not exists product (
    pid int primary key auto_increment comment '商品编号',
    pname varchar(20) not null comment '商品名称',
    price double comment '商品价格',
    category_id varchar(20) comment '商品所属分类'
);


# 添加数据

insert into product values (null, '海尔洗衣机', 5000, 'c001');
insert into product values(null,'美的冰箱',3000,'c001');
insert into product values(null,'格力空调',5000,'c001');
insert into product values(null,'九阳电饭煲',200,'c001')
;
insert into product values(null,'啄木鸟衬衣',300,'c002');
insert into product values(null,'恒源祥西裤',800,'c002');
insert into product values(null,'花花公子夹克',440,'c002');
insert into product values(null,'劲霸休闲裤',266,'c002');
insert into product values(null,'海澜之家卫衣',180,'c002');
insert into product values(null,'杰克琼斯运动裤',430,'c002');

insert into product values(null,'兰蔻面霜',300,'c003');
insert into product values(null,'雅诗兰黛精华水',200,'c003');
insert into product values(null,'香奈儿香水',350,'c003');
insert into product values(null,'SK-II神仙水',350,'c003');
insert into product values(null,'资生堂粉底液',180,'c003');

insert into product values(null,'老北京方便面',56,'c004');
insert into product values(null,'良品铺子海带丝',17,'c004');
insert into product values(null,'三只松鼠坚果',88, null);

-- 简单查询
select * from product;

# 查询商品名和商品价格
select `pname`, `price` from product;

# 别名查询， 使用的关键字是 as (as 可以省略)
# 表别名：
select * from product as p;
# 列别名查询
select pname as pn from product;

# 去掉重复值
select distinct price from product;

# 查询结果是表达式（运算查询）： 将所有商品的价格 + 10 元进行显示
select pname, price + 10 from product;

-- 运算符

# 算数运算符
select 6 + 2;
select 6 - 2;
select 6 * 2;
select 6 / 2;
select 6 % 2;

select pname, price * 1.1 as new_price  from product;

# 条件查询
select * from product where pname = '海尔洗衣机';

select * from product where price = 800;

# 不等于800
select * from product where price <> 800;

# 查询商品价格大于60的所有信息
select * from product where price > 60;

select * from product where price >= 200 and price <= 10000;

select * from product where price = 200 or price = 800;
select * from product where price in (200, 800);

# 模糊查询
select * from product where pname like '%裤%';
# 以海开头
select * from product where pname like '海%';

# 第二个字为蔻的所有商品
select * from product where pname like '_蔻%';

# 查询category_id 为 null的商品
select * from product where category_id is null;

select * from product where category_id is not null;

# 使用least求最小值
select least(10, 20, 30);
select least(10, null, 30);

# 使用greatest求最大值
select greatest(10, 20, 30);

# 位运算（了解）
select 3 & 5;  # 位与
select 3 | 5;  # 位或
select 3^5;    # 位异或
select 3 >> 1; # 3 右移 1位
select 3 << 1; # 3 左移 1位
select ~3; # 取反

# 排序查询
# 使用价格排序（降序）
select * from product order by price desc ;
# 在价格排序的基础上，以分类排行（升序）
select * from product order by price desc , category_id asc ;

# 显示商品的价格（去重复）、并排序
select distinct price from product order by price desc ;

# 聚合查询
select count(*) from product;

select count(*) from product where price > 200;

# c001所有商品价格的总和
select sum(price) from product where category_id='c001';
select max(price) from product;
select min(price) from product;
select avg(price) from product where category_id='c002';

# null 值处理
drop table if exists test_null;
create table if not exists test_null(
    c1 varchar(20),
    c2 int
);

insert into test_null values ('aaa', 3);
insert into test_null values('bbb',3);
insert into test_null values('ccc',null);
insert into test_null values('ddd',6);

# 测试
select count(*), count(c1), count(c2) from test_null;
select sum(c2), max(c2), min(c2), avg(c2) from test_null;