create database BigMart_DB
go

use BigMart_DB
go

create table tblKhachHang
(
    id int primary key,
    ho varchar(64) not null,
    ten varchar(64) not null,
    gioitinh tinyint default(1),
    ngaysinh date check (ngaysinh > '1930-01-01'),
    dienthoai varchar(11) not null unique,
    diachi varchar(128),
    email varchar(128) not null unique,
    ngaytao date default(getDate()),
    ngaycapnhat date check (ngaycapnhat < getDate()),
    trangthai bit default(1)
)
go

create table tblDiemThuong
(
    id int primary key,
    idkhachhang int foreign key references tblKhachHang(id),
    noidung varchar(128),
    diem smallint,
    ngaytao date default(getDate())
)
go

create table tblCuaHang
(
    id int primary key,
    tencuahang varchar(128) not null,
    diachi varchar(128) not null,
    sdt1 varchar(11) not null unique,
    sdt2 varchar(11),
    idnhanvien int,
    giomocua tinyint,
    giodongcua tinyint,
    ghichu varchar(256)
)
go

create table tblPhanQuyen
(
    id int primary key,
    tenquyen varchar(8) not null,
    vitri varchar(64) not null,
    ngaytao date default(getDate()),
    ghichu varchar(256)
)
go

create table tblNhanVien
(
    id int primary key,
    hovaten varchar(64) not null,
    gioitinh tinyint default(1),
    ngaysinh date not null,
    ngayvaolam date default(getDate()),
    ngaycapnhat date,
    didong varchar(11) not null unique,
    dtgiadinh varchar(11),
    email varchar(128) unique,
    diachi varchar(128),
    idphanquyen int foreign key references tblPhanQuyen(id),
    luongcoban float default(0),
    username varchar(64),
    [password] varchar(64),
    ghichu varchar(256),
    trangthai bit default(1)
)
go

create table tblChungLoai
(
    id int primary key,
    ten varchar(64) not null,
    mota varchar(128),
    anhminhhoa varchar(256) not null,
    ngaytao date,
    ngaycapnhat date,
    trangthai bit default (1)
)
go

create table tblDonViTinh
(
    id int primary key,
    tendonvi varchar(32) not null,
    ghichu varchar(256)
)
go

create table tblNhaCungCap
(
    id int primary key,
    tennhacc varchar(128) not null,
    diachi varchar(128) not null,
    sdt1 varchar(11) not null,
    sdt2 varchar(11),
    fax varchar(16),
    email varchar(256) not null unique,
    website varchar(256) not null unique,
    ngaytao date default(getDate()),
    ngaycapnhat date,
    taxcode varchar(64), -- Mã số thuế
    ghichu varchar(256),
    trangthai bit default(1)
)
go



create table tblVanCHuyen
(
    id int primary key,
    ten varchar(64),
    ghichu varchar(128),
    trangthai bit default(1)
)
go

create table tblThanhToan
(
    id int primary key,
    ten varchar(64),
    ghichu varchar(128),
    trangthai bit default(1)
)
go

create table tblHoaDon
(
    id int primary key,
    ngaytao datetime default(getDate()),
    ngaygiaohang datetime default(getDate()),
    idvanchuyen int foreign key references tblVanCHuyen(id),
    idthanhtoan int foreign key references tblThanhToan(id),
    idkhachhang int foreign key references tblKhachHang(id),
    idnhanvien int foreign key references tblNhanVien(id),
    trangthai bit default(1),
    diachinhan varchar(128) not null,
    sdtnhan varchar(11) not null ,
    ghichu varchar(128)
)
go

create table tblHangHoa
(
    id int primary key,
    barcode varchar(32) not null, -- Mã vạch
    tenhanghoa varchar(128) not null,
    idchungloai int foreign key references tblChungLoai(id),
    iddonvitinh int foreign key references tblDonViTinh(id),
    idnhacc int foreign key references tblNhaCungCap(id),
    soluong float default(0),
    gianhap float default(0),
    giaxuat float default(0),
    ngaytao date default(getDate()),
    ngaycapnhat date,
    ghichu varchar(128)
)
go

create table tblHoaDonChiTiet
(
    idhoadon int foreign key references tblHoaDon(id),
    idhanghoa int foreign key references tblHangHoa(id),
    soluong float check(soluong>0),
    gia float check(gia>=0), -- Giá bán
    primary key(idhoadon, idhanghoa)
)
go

create table tblHinhAnh
(
    id int primary key,
    idhanghoa int foreign key references tblHangHoa(id),
    ghichu varchar(64),
    stt tinyint, -- Thứ tự ảnh
    trangthai bit default(1)
)
go
