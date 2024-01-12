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
