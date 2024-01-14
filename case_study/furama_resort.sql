create database furama_resort_management;
use furama_resort_management;

create table position (
position_id int primary key auto_increment,
position_name varchar(45)
);

create table level_employee (
level_id int primary key auto_increment,
level_name varchar(45)
);

create table department (
department_id int primary key auto_increment,
department_name varchar(45)
);

create table class_customer (
class_cus_id int primary key auto_increment,
class_cus_name varchar(45)
);

create table service_type (
service_type_id int primary key auto_increment,
service_type_name varchar(45)
);

create table rental_type (
rental_id int primary key auto_increment,
rental_name varchar(45)
);

create table other_service (
other_service_id int primary key auto_increment,
other_service_name varchar(45),
price double,
unit varchar(10),
status_other_service varchar(45)
);

create table employee (
employee_id int,
employee_fullname varchar(45),
employee_birthday date,
employee_id_number varchar(45),
salary double,
employee_phone_number varchar(45),
employee_email varchar(45),
employee_address varchar(45),
position_id int,
level_id int,
department_id int,
primary key (employee_id, position_id, level_id, department_id),
foreign key (position_id) references position (position_id),
foreign key (level_id) references level_employee (level_id),
foreign key (department_id) references department (department_id)
);

create table customer (
customer_id int,
class_cus_id int,
customer_fullname varchar(45),
customer_birthday date,
customer_gender bit(1),
customer_id_number varchar(45),
customer_phone_number varchar(45),
customer_email varchar(45),
customer_address varchar(45),
primary key (customer_id,class_cus_id),
foreign key (class_cus_id) references class_customer (class_cus_id)
);

create table service (
service_id int,
service_name varchar(45),
area int,
rental_cost double,
max_person int,
rental_id int,
service_type_id int,
standard_room varchar(45),
other_convenient_describe varchar(45),
pool_area double,
floor_number int,
free_service_inclued text,
primary key (service_id,rental_id, service_type_id),
foreign key (rental_id) references rental_type (rental_id),
foreign key (service_type_id) references service_type (service_type_id)
);

create table contract (
contract_id int,
contract_date datetime,
contract_end_date datetime,
deposit_money double,
employee_id int,
customer_id int,
service_id int,
primary key (contract_id,employee_id, customer_id, service_id),
foreign key (employee_id) references employee (employee_id),
foreign key (customer_id) references customer (customer_id),
foreign key (service_id) references service (service_id)
);

create table contract_detail (
contract_detail_id int,
contract_id int,
other_service_id int,
amount int,
primary key (contract_detail_id, contract_id, other_service_id),
foreign key (contract_id) references contract (contract_id),
foreign key (other_service_id) references other_service (other_service_id)
);

-- INSERT DATA
-- Insert position
insert into position (position_id,position_name)
values 	(1, 'Quản Lý'),
		(2, 'Nhân Viên');

-- Insert Level Employee
insert into level_employee (level_id,level_name)
values 	(1, 'Trung cấp'),
		(2, 'Cao Đẳng'),
        (3, 'Đại Học'),
        (4, 'Sau Đại Học');
        
-- Insert Department
insert into department (department_id,department_name)
values 	(1, 'Sale-Marketing'),
		(2, 'Hành chính'),
        (3, 'Phục vụ'),
        (4, 'Quản lý');
        
-- Insert Department
insert into department (department_id,department_name)
values 	(1, 'Sale-Marketing'),
		(2, 'Hành chính'),
        (3, 'Phục vụ'),
        (4, 'Quản lý');
        
-- Insert Class Customer
insert into class_customer (class_cus_id, class_cus_name)
values 	(1, 'Diamond'),
		(2, 'Platinium'),
        (3, 'Gold'),
        (4, 'Silver'),
        (5, 'Member');

-- Insert Customer
insert into customer (customer_id, class_cus_id, customer_fullname, customer_birthday, customer_gender, customer_id_number, customer_phone_number, customer_email, customer_address)
values
(1, 5, 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng'),
(2, 3, 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị'),
(3, 1, 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh'),
(4, 1, 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng'),
(5, 4, 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai'),
(6, 4, 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng'),
(7, 1, 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh'),
(8, 3, 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum'),
(9, 1, 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi'),
(10, 2, 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');

-- Insert Rental Type
insert into rental_type (rental_name)
values
('year'),
('month'),
('day'),
('hour');

-- Insert Services Type
insert into service_type (service_type_name)
values
('Villa'),
('House'),
('Room');

-- Insert Services
INSERT INTO service (service_id, service_name, area, rental_cost, max_person,standard_room, other_convenient_describe, pool_area, floor_number, free_service_inclued,rental_id,service_type_id)
VALUES
(1, 'Villa Beach Front', 25000, 1000000, 10, 'vip', 'Có hồ bơi', 500, 4, null, 3, 1),
(2, 'House Princess 01', 14000, 5000000, 7, 'vip', 'Có thêm bếp nướng', null, 3, null, 2, 2),
(3, 'Room Twin 01', 5000, 1000000, 2, 'normal', 'Có tivi', null, null, '1 Xe máy, 1 Xe đạp', 4, 3),
(4, 'Villa No Beach Front', 22000, 9000000, 8, 'normal', 'Có hồ bơi', 300, 3, null, 3, 1),
(5, 'House Princess 02', 10000, 4000000, 5, 'normal', 'Có thêm bếp nướng', null, 2, null, 3, 2),
(6, 'Room Twin 02', 3000, 900000, 2, 'normal', 'Có tivi', null, null, '1 Xe máy', 4, 3);

-- Insert Other Services
INSERT INTO other_service (other_service_id, other_service_name, price, unit, status_other_service)
VALUES
(1, 'Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
(2, 'Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
(3, 'Thuê xe đạp', 20000, 'chiếc', 'tốt'),
(4, 'Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
(5, 'Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
(6, 'Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');

-- Insert Employee


-- Insert Contract
INSERT INTO contract (contract_id, contract_date, contract_end_date, deposit_money, employee_id, customer_id, service_id)
VALUES
(1, '2020-12-08', '2020-12-08', 0, 3, 1, 3),
(2, '2020-07-14', '2020-07-21', 200000, 7, 3, 1),
(3, '2021-03-15', '2021-03-17', 50000, 3, 4, 2),
(4, '2021-01-14', '2021-01-18', 100000, 7, 5, 5),
(5, '2021-07-14', '2021-07-15', 0, 7, 2, 6),
(6, '2021-06-01', '2021-06-03', 0, 7, 7, 6),
(7, '2021-09-02', '2021-09-05', 100000, 7, 4, 4),
(8, '2021-06-17', '2021-06-18', 150000, 3, 4, 1),
(9, '2020-11-19', '2020-11-19', 0, 3, 4, 3),
(10, '2021-04-12', '2021-04-14', 0, 10, 3, 5),
(11, '2021-04-25', '2021-04-25', 0, 2, 2, 1),
(12, '2021-05-25', '2021-05-27', 0, 7, 10, 1);
