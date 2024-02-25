create database product_management;
use product_management;

-- TABLE--
create table product (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 price double NOT NULL,
 description varchar(120),
 PRIMARY KEY (id)
);
