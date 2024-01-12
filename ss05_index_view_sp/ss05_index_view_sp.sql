create database ss05_index_view_sp;
use ss05_index_view_sp;

create table products(
id int primary key auto_increment,
product_code int,
product_name varchar(50),
product_price double,
product_amount int,
product_description varchar(50),
product_status varchar(50)
);

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)

create unique index i_code on products(product_code);  

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)

create index i_composite on products(product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào

explain select * from products where product_name like 'm%' and product_price > 6000;

-- So sánh câu truy vấn trước và sau khi tạo index

explain select * from products where product_amount > 5;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products

create view products_view as
select product_code, product_name, product_price, product_status
from products;
select * from products_view;

-- Tiến hành sửa đổi view

create or replace view products_view as
select product_code
from products
where product_code = '1111';

-- Tiến hành xoá view

drop view products_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

delimiter //
create procedure get_all_product()
begin
select * from products;
end //
delimiter ;
call get_all_product();
-- Tạo store procedure thêm một sản phẩm mới

delimiter //
create procedure add_new_product(product_code int, product_name varchar(50), product_price int, product_amount int, product_status varchar(50))
begin
insert into products(product_code, product_name, product_price, product_amount, product_status)
values (product_code, product_name, product_price, product_amount, product_status);
end //
delimiter ;
call add_new_product(7777,'may do EC',66666666,4,'đang sử dụng');
-- Tạo store procedure sửa thông tin sản phẩm theo id

delimiter //
create procedure update_product_by_id(in product_id int, in new_name varchar(50))
begin
update products
set product_name = new_name
where id = product_id;
end //
delimiter ;
call update_product_by_id(1, 'máy đo nồng độ cồn');

-- Tạo store procedure xoá sản phẩm theo id

delimiter //
create procedure delete_product_by_id(in product_id int)
begin
delete from products
where id = product_id;
end //
delimiter ;
call delete_product_by_id(7);
