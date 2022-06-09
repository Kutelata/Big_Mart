insert into tblKhachHang(ten,gioitinh,ngaysinh,dienthoai,diachi,email,ngaytao,ngaycapnhat,trangthai) values 
('Nguyễn Ngọc Thúy',1,'1990-11-23','0832536199','Khu tập thể A3 Nam Đồng, A1P49, Phố P. Hồ Đắc Di, Nam Đồng, Đống Đa, Hà Nội','nguyenngocthuy@gmail.com','2022-06-09','',1),
('Đáo Đức Thành',0,'1991-11-23','0832536200','Tòa nhà C´Land, 156 Ng. Xã Đàn 2, Nam Đồng, Đống Đa, Hà Nội','daoducthanh@gmail.com','2022-06-09','',0),
('Tô Nghị',1,'1992-11-23','0832536201','Trần Hưng Đạo, Hoàn Kiếm, Hà Nội','tonghi@gmail.com','2022-06-09','',1),
('Nguyễn Lê Tuấn',0,'1993-11-23','0832536202','81 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội','nguyenletuan@gmail.com','2022-06-09','',0),
('Trần Thị Thu',1,'1994-11-23','0832536203','6 Ng. 84 P. Trần Quang Diệu, Chợ Dừa, Đống Đa, Hà Nội','tranthithu@gmail.com','2022-06-09','',1),
('Phạm Duy Hồng',0,'1995-11-23','0832536204','65 Nguyễn Đình Thi, Thuỵ Khuê, Tây Hồ, Hà Nội','phamduyhong@gmail.com','2022-06-09','',0),
('Lê Hồng Nguyên',1,'1996-11-23','0832536205','51 Đ. Âu Cơ, Tứ Liên, Tây Hồ, Hà Nội','lehongnguyen@gmail.com','2022-06-09','',1),
('Hồ Cung Đạt Nhân',0,'1997-11-23','0832536206','Hàng Bột, Đống Đa, Hà Nội','hocungdatnhan@gmail.com','2022-06-09','',0),
('Chu Văn Nam',1,'1998-11-23','0832536207','9b Nguyễn Đình Thi, Thuỵ Khuê, Tây Hồ, Hà Nội','chuvannam@gmail.com','2022-06-09','',1),
('Huỳnh Đức Long',0,'1999-11-23','0832536208','88 P.Yên Lãng, Láng Hạ, Đống Đa, Trung Hoà Cầu Giấy Hà Nội','huynhduclong@gmail.com','2022-06-09','',0);

insert into tblDiemThuong(idkhachhang,noidung,diem,ngaytao) values 
(1,'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi',1,'2022-06-09'),
(2,'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi',2,'2022-06-09'),
(3,'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi',3,'2022-06-09'),
(4,'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi',4,'2022-06-09'),
(5,'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi',5,'2022-06-09'),
(6,'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi',6,'2022-06-09'),
(7,'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi',7,'2022-06-09'),
(8,'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi',8,'2022-06-09'),
(9,'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi',9,'2022-06-09'),
(10,'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi',10,'2022-06-09');

insert into tblCuaHang(tencuahang,diachi,sdt,idnhanvien,giomocua,giodongcua,ghichu) values 
('Big Mart 1','Số 349 đường 3/2, TT. Đức Tài, H. Đức Linh, T. Bình Thuận (Đối diện bến xe Đức Tài)','0832536199',1,7,19,'Cửa hàng thứ nhất'),
('Big Mart 2','Tiểu khu 7, Thị Trấn Thuận Châu, Huyện Thuận Châu, Tỉnh Sơn La','0832536200',2,7,19,'Cửa hàng thứ hai'),
('Big Mart 3','Số 473, đường Tô Hiệu, TT. Ít Ong, H. Mường La, T. Sơn La','0832536201',3,7,19,'Cửa hàng thứ ba'),
('Big Mart 4','Tổ 9, Phường Tân Phong, Thành Phố Lai Châu, Tỉnh Lai Châu','0832536202',4,7,19,'Cửa hàng thứ tư'),
('Big Mart 5','Số 69 Đường Hồng Bàng, P. Sở Dầu, Q. Hồng Bàng, TP. Hải Phòng','0832536203',5,7,19,'Cửa hàng thứ năm'),
('Big Mart 6','Quốc lộ 27, Thôn Hạnh Trí 1, X. Quảng Sơn, H. Ninh Sơn, T. Ninh Thuận (gần chợ Quảng Sơn)','0832536204',6,7,19,'Cửa hàng thứ sáu'),
('Big Mart 7','Phố Ba Mỏ, TT. Thanh Sơn, H. Thanh Sơn, T. Phú Thọ (Gần ngã tư bến xe Thanh Sơn)','0832536205',7,7,19,'Cửa hàng thứ bảy'),
('Big Mart 8','485 Hùng Vương, TT. Vạn Giã, H. Vạn Ninh, T. Khánh Hòa','0832536206',8,7,19,'Cửa hàng thứ tám'),
('Big Mart 9','226 Trần Hưng Đạo, Phường Nam Lý, Thành phố Đồng Hới, Tỉnh Quảng Bình','0832536207',9,7,19,'Cửa hàng thứ chín'),
('Big Mart 10','Quốc Lộ 1A, Thôn Dinh Mười, X. Gia Ninh, H. Quảng Ninh, T. Quảng Bình','0832536208',10,7,19,'Cửa hàng thứ mười');

insert into tblPhanQuyen(tenquyen,vitri,ngaytao,ghichu) values 
();

insert into tblNhanVien(ten,gioitinh,ngaysinh,ngayvaolam,ngaycapnhat,sdt,email,diachi,idphanquyen,luongcoban,username,`password`,ghichu,trangthai) values 
();

insert into tblChungLoai(ten,mota,anhminhhoa,ngaytao,ngaycapnhat,trangthai) values 
();

insert into tblDonViTinh(tendonvi,ghichu) values 
();

insert into tblNhaCungCap(tennhacc,diachi,sdt,email,ngaytao,ngaycapnhat,ghichu,trangthai) values 
();

insert into tblVanChuyen(ten,ghichu,trangthai) values 
();

insert into tblThanhToan(ten,ghichu,trangthai) values 
();

insert into tblHoaDon(ngaytao,ngaygiaohang,idvanchuyen,idthanhtoan,idkhachhang,idnhanvien,trangthai,diachinhan,sdtnhan,ghichu) values 
();

insert into tblHangHoa(ten,idchungloai,iddonvitinh,idnhacc,soluong,gianhap,giaxuat,ngaytao,ngaycapnhat,ghichu) values 
();

insert into tblHoaDonChiTiet(idhoadon,idhanghoa,soluong,giaban) values 
();

insert into tblHinhAnh(idhanghoa,ghichu,sothutu,trangthai) values 
();