create database furama_resort_management;
use furama_resort_management;

-- TẠO BẢNG
-- Vị trí 
create table position (
position_id int primary key auto_increment,
position_name varchar(45) unique
);

-- Trình độ
create table level_employee (
level_id int primary key auto_increment,
level_name varchar(45) unique
);

-- Bộ phận
create table department (
department_id int primary key auto_increment,
department_name varchar(45) unique
);

-- Nhân viên
create table employee (
employee_id int primary key auto_increment,
employee_fullname varchar(45) not null,
employee_birthday date not null, 
employee_id_number varchar(45) not null unique,
salary double not null,
employee_phone_number varchar(45) not null unique,
employee_email varchar(45) unique,
employee_address varchar(45),
position_id int,
level_id int,
department_id int,
foreign key (position_id) references position (position_id),
foreign key (level_id) references level_employee (level_id),
foreign key (department_id) references department (department_id)
);

-- Loại khách hàng
create table class_customer (
class_cus_id int primary key auto_increment,
class_cus_name varchar(45)
);

-- Khách hàng
create table customer (
customer_id int primary key auto_increment,
class_cus_id int,
customer_fullname varchar(45) not null,
customer_birthday date not null,
customer_gender bit(1) not null,
customer_id_number varchar(45) not null unique,
customer_phone_number varchar(45) not null unique,
customer_email varchar(45) unique,
customer_address varchar(45),
foreign key (class_cus_id) references class_customer (class_cus_id)
);

-- Loại dịch vụ
create table service_type (
service_type_id int primary key auto_increment,
service_type_name varchar(45)
);

-- Kiểu thuê
create table rental_type (
rental_id int primary key auto_increment,
rental_name varchar(45)
);

-- Dịch vụ
create table service (
service_id int primary key auto_increment,
service_name varchar(45) not null,
area int,
rental_cost double not null,
max_person int,
rental_id int,
service_type_id int,
standard_room varchar(45),
other_convenient_describe varchar(45),
pool_area double,
floor_number int,
free_service_inclued text,
foreign key (rental_id) references rental_type (rental_id),
foreign key (service_type_id) references service_type (service_type_id)
);

-- Dịch vụ đi kèm
create table other_service (
other_service_id int primary key auto_increment,
other_service_name varchar(45) not null,
price double not null,
unit varchar(10) not null,
status_other_service varchar(45)
);

-- Hợp đồng
create table contract (
contract_id int primary key auto_increment,
contract_date datetime not null,
contract_end_date datetime not null,
deposit_money double not null,
employee_id int,
customer_id int,
service_id int,
foreign key (employee_id) references employee (employee_id),
foreign key (customer_id) references customer (customer_id),
foreign key (service_id) references service (service_id)
);

-- Hợp đồng chi tiết
create table contract_detail (
contract_detail_id int primary key auto_increment,
contract_id int,
other_service_id int,
amount int not null,
foreign key (contract_id) references contract (contract_id),
foreign key (other_service_id) references other_service (other_service_id)
);

-- THÊM DATA
-- Thêm thông tin vị trí
insert into position (position_name)
values ('Quản Lý'), ('Nhân Viên');

-- Thêm thông tin trình độ
insert into level_employee (level_name)
values ('Trung cấp'), ('Cao Đẳng'), ('Đại Học'), ('Sau Đại Học');
        
-- Thêm thông tin bộ phận
insert into department (department_name)
values ('Sale-Marketing'), ('Hành chính'), ('Phục vụ'), ('Quản lý');
 
 -- Thêm thông tin nhân viên
insert into employee (employee_fullname, employee_birthday, employee_id_number, salary, employee_phone_number, employee_email, employee_address, position_id, level_id, department_id)
values 
	('Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
	('Lê Văn Bình', '1997-04-09', '654231234', 7000000,'0934212314','binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2),
	('Hồ Thị Yến','1995-12-12','999231723',14000000, '0412352315', 'thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
	('Võ Công Toản','1980-04-04','123231365',17000000,'0374443232','toan0404@gmail.com','77 Hoàng Diệu Quảng Trị', 1, 4, 4),
	('Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1),
	('Khúc Nguyễn An Nghi',	'2000-11-08','964542311',7000000, '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
	('Nguyễn Hữu Hà','1993-01-01','534323231',8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
	('Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4),
	('Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
	('Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai',	2, 3, 2);
 
-- Thêm thông tin loại khách
insert into class_customer (class_cus_name)
values ('Diamond'), ('Platinium'), ('Gold'), ('Silver'), ('Member');

-- Thêm thông tin khách hàng
insert into customer (customer_fullname, customer_birthday, customer_gender, customer_id_number, customer_phone_number, customer_email, customer_address, class_cus_id)
values
	('Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng', 5),
	('Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị', 3),
	('Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh', 1),
	('Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng', 1),
	('Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai', 4),
	('Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng', 4),
	('Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh', 1),
	('Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum', 3),
	('Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi', 1),
	('Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng', 2);

-- Thêm thông tin kiểu thuê
insert into rental_type (rental_name)
values ('year'), ('month'), ('day'), ('hour');

-- Thêm thông tin loại dịch vụ
insert into service_type (service_type_name)
values ('Villa'), ('House'), ('Room');

-- Thêm thông tin dịch vụ
insert into service (service_name, area, rental_cost, max_person,standard_room, other_convenient_describe, pool_area, floor_number, free_service_inclued,rental_id,service_type_id)
values
	('Villa Beach Front', 25000, 1000000, 10, 'vip', 'Có hồ bơi', 500, 4, null, 3, 1),
	('House Princess 01', 14000, 5000000, 7, 'vip', 'Có thêm bếp nướng', null, 3, null, 2, 2),
	('Room Twin 01', 5000, 1000000, 2, 'normal', 'Có tivi', null, null, '1 Xe máy, 1 Xe đạp', 4, 3),
	('Villa No Beach Front', 22000, 9000000, 8, 'normal', 'Có hồ bơi', 300, 3, null, 3, 1),
	('House Princess 02', 10000, 4000000, 5, 'normal', 'Có thêm bếp nướng', null, 2, null, 3, 2),
	('Room Twin 02', 3000, 900000, 2, 'normal', 'Có tivi', null, null, '1 Xe máy', 4, 3);

-- Thêm thông tin dịch vụ đi kèm
insert into other_service (other_service_name, price, unit, status_other_service)
values
	('Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
	('Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
	('Thuê xe đạp', 20000, 'chiếc', 'tốt'),
	('Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
	('Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
	('Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');

-- Thêm thông tin hợp đồng
insert into contract (contract_date, contract_end_date, deposit_money, employee_id, customer_id, service_id)
values
	('2020-12-08', '2020-12-08', 0, 3, 1, 3),
	('2020-07-14', '2020-07-21', 200000, 7, 3, 1),
	('2021-03-15', '2021-03-17', 50000, 3, 4, 2),
	('2021-01-14', '2021-01-18', 100000, 7, 5, 5),
	('2021-07-14', '2021-07-15', 0, 7, 2, 6),
	('2021-06-01', '2021-06-03', 0, 7, 7, 6),
	('2021-09-02', '2021-09-05', 100000, 7, 4, 4),
	('2021-06-17', '2021-06-18', 150000, 3, 4, 1),
	('2020-11-19', '2020-11-19', 0, 3, 4, 3),
	('2021-04-12', '2021-04-14', 0, 10, 3, 5),
	('2021-04-25', '2021-04-25', 0, 2, 2, 1),
	('2021-05-25', '2021-05-27', 0, 7, 10, 1);

-- Thêm thông tin hợp đồng chi tiết
insert into contract_detail (amount, contract_id, other_service_id)
values (5,2,4), (8,2,5), (15,2,6), (1,3,1), (11,3,2), (1,1,3), (2,1,2), (2,12,2);

-- SQL CƠ BẢN
-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự

select * from employee where employee_fullname like 'H%' or employee_fullname like 'T%' or employee_fullname like 'K%' and length(employee_fullname) <= 15;

-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select * from customer
where timestampdiff(year, customer_birthday, curdate()) between 18 and 50 -- timestampdiff(): hàm tính độ tuổi dựa trên ngày sinh và ngày hiện tại
and customer_address like '%Đà Nẵng' or customer_address like '%Quảng Trị';

-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select c.customer_id, c.customer_fullname, count(ct.contract_id) as 'Total Booking'
from customer c	
left join contract ct on c.customer_id = ct.customer_id
join class_customer clc on c.class_cus_id = clc.class_cus_id
where clc.class_cus_name = 'Diamond'
group by c.customer_id, c.customer_fullname
order by count(ct.contract_id) asc;

-- 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, 
-- với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). 

select 
c.customer_id as ma_khach_hang,
c.customer_fullname as ho_ten,
clc.class_cus_name as ten_loai_khach,
ct.contract_id as ma_hop_dong,
sv.service_name as ten_dich_vu,
ct.contract_date as ngay_lam_hop_dong,
ct.contract_end_date as ngay_ket_thuc, 
ifnull(rental_cost + sum(ctd.amount*osv.price),0) as tong_tien
from customer c
left join class_customer clc on c.class_cus_id = clc.class_cus_id
left join contract ct on c.customer_id = ct.customer_id
left join service sv on ct.service_id = sv.service_id
left join contract_detail ctd on ct.contract_id = ctd.contract_id
left join other_service osv on ctd.other_service_id = osv.other_service_id
group by c.customer_id, c.customer_fullname, clc.class_cus_name, ct.contract_id, sv.service_name, ct.contract_date, ct.contract_end_date;

-- 6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select sv.service_id, sv.service_name, sv.area, sv.rental_cost, svt.service_type_name from service sv 
join service_type svt on sv.service_type_id = svt.service_type_id
where sv.service_id not in 
(select sv.service_id from contract ct
where ct.service_id = sv.service_id
and year(ct.contract_date) = 2021
and quarter(ct.contract_date) = 1)
group by sv.service_id, sv.service_name, sv.area, sv.rental_cost, svt.service_type_name;	

-- 7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select sv.service_id, sv.service_name, sv.area, sv.max_person, sv.rental_cost,svt.service_type_name from service sv
join service_type svt on sv.service_type_id = svt.service_type_id
where sv.service_id not in
(select distinct ct.service_id from contract ct
where year(ct.contract_date) = 2021)
and sv.service_id in 
(select distinct ct.service_id from contract ct
where year(ct.contract_date) = 2020)
group by sv.service_id, sv.service_name, sv.area, sv.max_person, sv.rental_cost,svt.service_type_name;

-- 8. Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau. Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

select distinct customer_fullname as ho_ten from customer;

select customer_fullname as ho_ten from customer
group by ho_ten;

select min(customer_fullname) as ho_ten from customer
group by customer_fullname;

-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(contract_date) as thang, count(distinct customer_id) as so_khach_hang_dat_phong
from contract where year(contract_date) = 2021
group by thang
order by thang;

-- 10. Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select co.contract_id, co.contract_date, co.contract_end_date, co.deposit_money, ifnull((sum(cd.amount)),0) as so_luong_dich_vu_di_kem
from contract co
left join contract_detail cd on co.contract_id = cd.contract_id
group by co.contract_id, co.contract_date, co.contract_end_date, co.deposit_money;

-- 11. Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select dvdk.other_service_id, dvdk.other_service_name from other_service dvdk 
join contract_detail hdct on dvdk.other_service_id = hdct.other_service_id
join contract hd on hdct.contract_id = hd.contract_id
join customer kh on hd.customer_id = kh.customer_id
join class_customer lk on kh.class_cus_id = lk.class_cus_id
where lk.class_cus_name like 'Diamond'
and (kh.customer_address like '%Vinh%' or kh.customer_address = '%Quảng Ngãi%')
group by dvdk.other_service_id, dvdk.other_service_name;

-- 12. Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select 
hd.contract_id,
nv.employee_fullname,
kh.customer_fullname,
kh.customer_phone_number,
dv.service_name,
hd.deposit_money as tien_dat_coc,
ifnull(sum(hdct.amount),0) as so_luong_dich_vu_di_kem
from contract hd
left join employee nv on hd.employee_id = nv.employee_id
left join customer kh on hd.customer_id = kh.customer_id
left join service dv on hd.service_id = dv.service_id
left join contract_detail hdct on hd.contract_id = hdct.contract_id
where dv.service_id not in 
(select dv.service_id from service dv 
join contract hd on dv.service_id = hd.service_id
where year(hd.contract_date) = 2021 and (quarter(hd.contract_date) = 1 and quarter(hd.contract_date) = 2))
and dv.service_id in 
(select dv.service_id from service dv 
join contract hd on dv.service_id = hd.service_id
where year(hd.contract_date) = 2020 and (quarter(hd.contract_date) = 4))
group by hd.contract_id;

-- 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

-- Tạo View để lấy thông tin bảng join 
create view v_thong_tin as
select dvdk.other_service_id, dvdk.other_service_name, 
ifnull(sum(hdct.amount),0) as so_luong_dich_vu_di_kem
from other_service dvdk
join contract_detail hdct on dvdk.other_service_id = hdct.other_service_id
group by dvdk.other_service_id;

select * from v_thong_tin where so_luong_dich_vu_di_kem = (select max(so_luong_dich_vu_di_kem) from v_thong_tin);

-- 14. Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, 
-- so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.contract_id as ma_hop_dong,
ldv.service_type_name as ten_loai_dich_vu,
dvdk.other_service_name as ten_dich_vu_di_kem,
count(hdct.other_service_id) as so_lan_su_dung
from service_type ldv
join service dv on ldv.service_type_id = dv.service_type_id
join contract hd on dv.service_id = hd.service_id
join contract_detail hdct on hd.contract_id = hdct.contract_id
join other_service dvdk on hdct.other_service_id = dvdk.other_service_id
group by ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem
having so_lan_su_dung = 1;

-- 15. Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, 
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.employee_id as ma_nhan_vien,
nv.employee_fullname as ho_ten,
td.level_name as ten_trinh_do,
bp.department_name,
nv.employee_phone_number as so_dien_thoai,
nv.employee_address as dia_chi
from level_employee td
join employee nv on nv.level_id = td.level_id
join department bp on nv.department_id = bp.department_id
join contract hd on nv.employee_id = hd.employee_id
where year(hd.contract_date) between 2020 and 2021
group by ma_nhan_vien
having count(hd.employee_id) <=3;

-- 16. Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.



-- 17. Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.



-- 18. Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).



-- 19. Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.



-- 20. Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select nv.employee_id as id,
nv.employee_fullname as ho_ten,
nv.employee_email as email,
nv.employee_phone_number as so_dien_thoai,
nv.employee_birthday as ngay_sinh,
nv.employee_address as dia_chi from employee nv
union all
select kh.customer_id as id,
kh.customer_fullname as ho_ten,
kh.customer_email as email,
kh.customer_phone_number as so_dien_thoai,
kh.customer_birthday as ngay_sinh,
kh.customer_address as dia_chi from customer kh;

-- SQL NÂNG CAO
-- 21. Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

create view v_nhan_vien as 
select * from employee
where employee_address like '%Đà Nẵng%';

select * from v_nhan_vien nv
join contract hd on nv.employee_id = hd.employee_id
where hd.contract_date like '12/12/2019';

-- 22. Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.



-- 23. Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.



-- 24. Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.



-- 25. Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong 
-- ra giao diện console của database.



-- 26. Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, 
-- với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, 
-- nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database. 
							-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console --
                            
                            


-- 27. Tạo Function thực hiện yêu cầu sau:
-- a. Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.



-- b. Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng 
-- đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, 
-- không xét trên toàn bộ các lần làm hợp đồng). Mã của khách hàng được truyền vào như là 1 tham số của function này.



-- 28. Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 
-- để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) 
-- và xóa những hop_dong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.



