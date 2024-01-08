create database if not exists quan_ly_kho;
use quan_ly_kho;

-- so dien thoai 
create table so_dien_thoai(
ma_sdt int primary key auto_increment,
sdt varchar(10)
);

-- phieu nhap 
create table phieu_nhap(
so_pn int primary key auto_increment,
ngay_nhap datetime
);

-- phieu xuat 
create table phieu_xuat(
so_px int primary key auto_increment,
ngay_xuat datetime
);

-- nha cung cap 
create table nha_cc(
ma_ncc int primary key auto_increment,
ten_ncc varchar(50),
dia_chi varchar(50),
ma_sdt int,
foreign key(ma_sdt) references so_dien_thoai(ma_sdt)
);

-- vat tu 
create table vat_tu(
ma_vtu int primary key auto_increment,
ten_vtu varchar(50)
);

-- don dat hang 
create table don_hang(
so_dh int primary key auto_increment,
ngay_dat_hang datetime,
ma_ncc int,
foreign key(ma_ncc) references nha_cc(ma_ncc)
);

-- Chi tiet phieu nhap  
create table phieu_nhap_detail(
so_pn int,
ma_vtu int,
primary key(so_pn, ma_vtu),
foreign key(so_pn) references phieu_nhap(so_pn),
foreign key(ma_vtu) references vat_tu(ma_vtu),
don_gia_nhap int,
so_luong_nhap int
);

-- Chi tiet phieu xuat
create table phieu_xuat_detail(
so_px int,
ma_vtu int,
primary key(so_px, ma_vtu),
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vtu) references vat_tu(ma_vtu),
don_gia_xuat int,
so_luong_xuat int
);

-- chi tiet don hang 
create table don_hang_detail(
so_dh int,
ma_vtu int,
primary key(so_dh, ma_vtu),
foreign key(so_dh) references don_hang(so_dh),
foreign key(ma_vtu) references vat_tu(ma_vtu)
);

