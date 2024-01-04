create database if not exists ss01_sql;
use ss01_sql;

create table if not exists class(
`id_class` int primary key auto_increment,
`name_class` varchar(50) unique
);

create table if not exists teacher(
`id_teacher` int primary key auto_increment,
`name_teacher` varchar(50) unique,
`age` int unique,
`country` varchar(50) unique
);

insert into class (id_class, name_class) value(1,'C0723L1 JV105');
insert into class value(2,'C0523L1 JV101');
insert into teacher value(1,'Anh Vũ',31,'VN');
insert into teacher(id_teacher,name_teacher,age,country) value(2,'Dikei',23,'US');
select * from class;
select * from teacher;
