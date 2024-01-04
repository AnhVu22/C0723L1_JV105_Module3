create database if not exists ss01_sql;
use ss01_sql;

create table if not exists class(
`id` int primary key auto_increment,
`name` varchar(50) unique
);

create table if not exists teacher(
`id` int primary key auto_increment,
`name` varchar(50) unique,
`age` int unique,
`country` varchar(50)
);
