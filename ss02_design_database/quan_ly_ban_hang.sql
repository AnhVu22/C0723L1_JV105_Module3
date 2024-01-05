create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;

-- Customer Table
create table customer(
c_id int primary key auto_increment,
c_name varchar(50),
c_age int unique
);

-- Product Table
create table product(
p_id int primary key auto_increment,
p_name varchar(50),
p_price int unique
);

-- Order Table
create table order_table(
o_id int,
c_id int,
primary key(o_id, c_id),
foreign key(c_id) references customer(c_id),
o_Date date unique,
o_total_price int unique
);

-- Order Detail
 create table order_detail(
o_id int,
p_id int,
primary key(o_id, p_id),
foreign key(o_id) references order_table(o_id),
foreign key(p_id) references product(p_id),
o_qty int
);
