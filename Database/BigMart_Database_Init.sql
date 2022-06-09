create database BigMart_DB;

use BigMart_DB;

create table tblKhachHang
(
    id int auto_increment primary key,
    ten varchar(64) not null,
    gioitinh tinyint default(1),
    ngaysinh date,
    dienthoai varchar(11) not null unique,
    diachi varchar(128),
    email varchar(128) not null unique,
    ngaytao date,
    ngaycapnhat date,
    trangthai bit default(1)
);

create table tblDiemThuong
(
    id int auto_increment primary key,
    idkhachhang int,
    noidung varchar(128),
    diem smallint,
    ngaytao date,
    foreign key (idkhachhang) references tblKhachHang(id)
);

create table tblCuaHang
(
    id int auto_increment primary key,
    tencuahang varchar(128) not null,
    diachi varchar(128) not null,
    sdt varchar(11) not null unique,
    idnhanvien int,
    giomocua tinyint,
    giodongcua tinyint,
    ghichu varchar(256)
);

create table tblPhanQuyen
(
    id int auto_increment primary key,
    tenquyen varchar(8) not null,
    vitri varchar(64) not null,
    ngaytao date,
    ghichu varchar(256)
);

create table tblNhanVien
(
    id int auto_increment primary key,
    ten varchar(64) not null,
    gioitinh tinyint default(1),
    ngaysinh date not null,
    ngayvaolam date,
    ngaycapnhat date,
    sdt varchar(11) not null unique,
    email varchar(128) unique,
    diachi varchar(128),
    idphanquyen int,
    luongcoban float default(0),
    username varchar(64),
    `password` varchar(64),
    ghichu varchar(256),
    trangthai bit default(1),
    foreign key (idphanquyen) references tblPhanQuyen(id)
);

create table tblChungLoai
(
    id int auto_increment primary key,
    ten varchar(64) not null,
    mota varchar(128),
    anhminhhoa varchar(256) not null,
    ngaytao date,
    ngaycapnhat date,
    trangthai bit default (1)
);

create table tblDonViTinh
(
    id int auto_increment primary key,
    tendonvi varchar(32) not null,
    ghichu varchar(256)
);

create table tblNhaCungCap
(
    id int auto_increment primary key,
    tennhacc varchar(128) not null,
    diachi varchar(128) not null,
    sdt varchar(11) not null,
    email varchar(256) not null unique,
    ngaytao date,
    ngaycapnhat date,
    ghichu varchar(256),
    trangthai bit default(1)
);

create table tblVanCHuyen
(
    id int auto_increment primary key,
    ten varchar(64),
    ghichu varchar(128),
    trangthai bit default(1)
);

create table tblThanhToan
(
    id int auto_increment primary key,
    ten varchar(64),
    ghichu varchar(128),
    trangthai bit default(1)
);

create table tblHoaDon
(
    id int auto_increment primary key,
    ngaytao datetime,
    ngaygiaohang datetime,
    idvanchuyen int,
    idthanhtoan int,
    idkhachhang int,
    idnhanvien int ,
    trangthai bit default(1),
    diachinhan varchar(128) not null,
    sdtnhan varchar(11) not null ,
    ghichu varchar(128),
    foreign key (idvanchuyen) references tblVanCHuyen(id),
    foreign key (idthanhtoan) references tblThanhToan(id),
    foreign key (idkhachhang) references tblKhachHang(id),
    foreign key (idnhanvien) references tblNhanVien(id)
);

create table tblHangHoa
(
    id int auto_increment primary key,
    ten varchar(128) not null,
    idchungloai int,
    iddonvitinh int,
    idnhacc int,
    soluong float default(0),
    gianhap float default(0),
    giaxuat float default(0),
    ngaytao date,
    ngaycapnhat date,
    ghichu varchar(128),
    foreign key (idchungloai) references tblChungLoai(id),
    foreign key (iddonvitinh) references tblDonViTinh(id),
    foreign key (idnhacc) references tblNhaCungCap(id)
);

create table tblHoaDonChiTiet
(
    idhoadon int,
    idhanghoa int,
    soluong float,
    giaban float,
    primary key(idhoadon, idhanghoa),
    foreign key (idhoadon) references tblHoaDon(id),
    foreign key (idhanghoa) references tblHangHoa(id)
);

create table tblHinhAnh
(
    id int auto_increment primary key,
    idhanghoa int,
    ghichu varchar(64),
    sothutu tinyint,
    trangthai bit default(1),
    foreign key (idhanghoa) references tblHangHoa(id)
);