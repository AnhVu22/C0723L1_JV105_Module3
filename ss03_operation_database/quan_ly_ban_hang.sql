create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;

-- Customer Table
create table customer(
c_id int primary key auto_increment,
c_name varchar(50),
c_age tinyint
);

-- Product Table
create table product(
p_id int primary key auto_increment,
p_name varchar(50),
p_price int
);

-- Order Table
create table order_table(
o_id int,
c_id int,
primary key(o_id, c_id),
foreign key(c_id) references customer(c_id),
o_date date,
o_total_price int 
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

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

select * from order_table;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách hàng

select c.c_id, c.c_name, p.p_id, p.p_name
from customer c
left join order_table o on c.c_id = o.c_id
left join order_detail od on o.o_id = od.o_id
left join product p on od.p_id = p.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

select c.c_id, c.c_name
from customer c
left join order_table o on c.c_id = o.c_id
where o.o_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice) 

select o.o_id, o.o_date, SUM(od.o_qty * p.p_price) AS o_total_price
from order_table o
join order_detail od on o.o_id = od.o_id
join product p on od.p_id = p.p_id
group by o.o_id, o.o_date;
       
