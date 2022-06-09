insert into tblKhachHang(ten,gioitinh,ngaysinh,dienthoai,diachi,email,ngaytao,ngaycapnhat,trangthai) values 
('Nguyễn Ngọc Thúy',0,'1990-11-23','0832536199','Khu tập thể A3 Nam Đồng, A1P49, Phố P. Hồ Đắc Di, Nam Đồng, Đống Đa, Hà Nội','nguyenngocthuy@gmail.com','2022-06-09','',1),
('Đáo Đức Thành',1,'1991-11-23','0832536200','Tòa nhà C´Land, 156 Ng. Xã Đàn 2, Nam Đồng, Đống Đa, Hà Nội','daoducthanh@gmail.com','2022-06-09','',0),
('Tô Nghị',2,'1992-11-23','0832536201','Trần Hưng Đạo, Hoàn Kiếm, Hà Nội','tonghi@gmail.com','2022-06-09','',1),
('Nguyễn Lê Tuấn',0,'1993-11-23','0832536202','81 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội','nguyenletuan@gmail.com','2022-06-09','',0),
('Trần Thị Thu',1,'1994-11-23','0832536203','6 Ng. 84 P. Trần Quang Diệu, Chợ Dừa, Đống Đa, Hà Nội','tranthithu@gmail.com','2022-06-09','',1),
('Phạm Duy Hồng',2,'1995-11-23','0832536204','65 Nguyễn Đình Thi, Thuỵ Khuê, Tây Hồ, Hà Nội','phamduyhong@gmail.com','2022-06-09','',0),
('Lê Hồng Nguyên',0,'1996-11-23','0832536205','51 Đ. Âu Cơ, Tứ Liên, Tây Hồ, Hà Nội','lehongnguyen@gmail.com','2022-06-09','',1),
('Hồ Cung Đạt Nhân',1,'1997-11-23','0832536206','Hàng Bột, Đống Đa, Hà Nội','hocungdatnhan@gmail.com','2022-06-09','',0),
('Chu Văn Nam',2,'1998-11-23','0832536207','9b Nguyễn Đình Thi, Thuỵ Khuê, Tây Hồ, Hà Nội','chuvannam@gmail.com','2022-06-09','',1),
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
('Toàn bộ','Chủ cửa hàng','2022-06-09','Đây là chủ tịch'),
('Phụ trách thu chi','Kế toán','2022-06-09','Đây là kế toán'),
('Phụ trách kho hàng','Quản lý kho','2022-06-09','Đây là quản lý kho'),
('Phụ trách sản phẩm','Thu mua','2022-06-09','Đây là quản lý cửa hàng'),
('Phụ trách đơn hàng','Bán hàng','2022-06-09','Đây là quản lý hàng hóa'),
('Phụ trách nhân sự','Quản lý nhân viên','2022-06-09','Đây là quản lý nhân viên');

insert into tblNhanVien(ten,gioitinh,ngaysinh,ngayvaolam,ngaycapnhat,sdt,email,diachi,idphanquyen,luongcoban,username,`password`,ghichu,trangthai) values 
('Võ Thị Thanh Thảo',0,'1990-11-23','2022-06-09','','0832536199','vothithanhthao@gmail.com','',1,1000,'vothithanhthao','vothithanhthao','',1),
('Lày A Cẩu',1,'1991-11-23','2022-06-09','','0832536200','layacau@gmail.com','',2,2000,'layacau','layacau','',1),
('Bùi Mạnh Quốc Huy',2,'1992-11-23','2022-06-09','','0832536201','buimanhquochuy@gmail.com','',3,3000,'buimanhquochuy','buimanhquochuy','',1),
('Lê Thị Mai',0,'1993-11-23','2022-06-09','','0832536202','lethimai@gmail.com','',4,4000,'lethimai','lethimai','',1),
('Trần Kim Ngọc',1,'1994-11-23','2022-06-09','','0832536203','trankimngoc@gmail.com','',5,5000,'trankimngoc','trankimngoc','',1),
('Lai Như Quỳnh',2,'1995-11-23','2022-06-09','','0832536204','lainhuquynh@gmail.com','',6,6000,'lainhuquynh','lainhuquynh','',1),
('Đặng Ngọc Thanh Loan',0,'1996-11-23','2022-06-09','','0832536205','dangngocthanhloan@gmail.com','',1,1000,'dangngocthanhloan','dangngocthanhloan','',1),
('Lê Thị Đào',1,'1997-11-23','2022-06-09','','0832536206','lethidao@gmail.com','',2,2000,'lethidao','lethidao','',1),
('Phạm Đoàn Minh Hiếu',2,'1998-11-23','2022-06-09','','0832536207','phamdoanminhhieu@gmail.com','',3,3000,'phamdoanminhhieu','phamdoanminhhieu','',1),
('Cao Ngọc Phương Trinh',0,'1999-11-23','2022-06-09','','0832536208','caongocphuongtrinh@gmail.com','',4,4000,'caongocphuongtrinh','caongocphuongtrinh','',1);

insert into tblChungLoai(ten,mota,anhminhhoa,ngaytao,ngaycapnhat,trangthai) values 
('Đệm','','','2022-06-09','',1),
('Bim Bim','','','2022-06-09','',0),
('Bếp','','','2022-06-09','',1),
('Bàn chải','','','2022-06-09','',0),
('Cốc','','','2022-06-09','',1),
('Sữa chua','','','2022-06-09','',0),
('Sữa','','','2022-06-09','',1),
('Nước tăng lực','','','2022-06-09','',0),
('Nước giải khát','','','2022-06-09','',1),
('Nước lọc','','','2022-06-09','',0);

insert into tblDonViTinh(tendonvi,ghichu) values 
('Việt Nam đồng','VND'),
('Đô la Mỹ','USD'),
('đồng EURO','EUR');

insert into tblNhaCungCap(tennhacc,diachi,sdt,email,ngaytao,ngaycapnhat,ghichu,trangthai) values 
('Công ty Cổ phần an ninh an toàn thông tin CMC','Tầng 4, tòa nhà CMC, phố Duy Tân, phường Dịch Vọng Hậu, quận Cầu Giấy, Thành phố Hà Nội','0832536199','tahoanglinh@gmail.com','2022-06-09','','',1),
('Công ty Cổ phần Thương mại Tin học và Viễn thông Sao Việt','Số 16, Ngách 82/5, Ngõ 651, Phố Minh Khai, Phường Thanh Lương, Quận Hai Bà Trưng, Thành phố Hà Nội','0832536201','leminhhai@gmail.com','2022-06-09','','',0),
('Công ty Cổ phần công nghệ truyền thông DTS','Số 287B Điện Biên Phủ, Phường 7, Quận 3, Thành phố Hồ Chí Minh','0832536202','tohuyhoang@gmail.com','2022-06-09','','',1),
('Tập đoàn Bưu chính Viễn thông Việt Nam','Số 57 phố Huỳnh Thúc Kháng, Phường Láng Hạ, Quận Đống Đa, Thành phố Hà Nội, Việt Nam','0832536203','phamduclong@gmail.com','2022-06-09','','',0),
('Công ty Cổ phần Dịch vụ Công nghệ Tin học HPT','Tầng 9 Tòa nhà Paragon, số 3 Nguyễn Lương Bằng, Phường Tân Phú, Quận 7, Thành phố Hồ Chí Minh, Việt Nam','0832536204','dinhhaduylinh@gmail.com','2022-06-09','','',1),
('Công ty Cổ phần giải pháp công nghệ SAVIS Việt Nam','Số 22, lô 1C, đường Trung Yên, 11C, KĐT Trung Yên, Phường Trung Hòa, Quận Cầu Giấy, Thành phố Hà Nội, Việt Nam','0832536205','hoangnguyenvan@gmail.com','2022-06-09','','',0),
('Công ty TNHH Thông tin NTT (Việt Nam)','Tòa nhà Vincom, số 72 đường Lê Thánh Tôn, phường Bến Nghé, quận 1, thành phố Hồ Chí Minh, Việt Nam','0832536206','kinyahasegawa@gmail.com','2022-06-09','','',1),
('Công ty Cổ phần Công nghệ Mạng và Truyền thông','Số 36 phố Trúc Khê, Phường Láng Hạ, Quận Đống Đa, Thành phố Hà Nội, Việt Nam','0832536207','lengoctu@gmail.com','2022-06-09','','',0),
('Công ty TNHH Hệ thống thông tin FPT','Tầng 22 tòa nhà Keangnam Landmark72, E6, đường Phạm Hùng, phường Mễ Trì, quận Nam Từ Liêm, thành phố Hà Nội, Việt Nam','0832536208','phamminhtuan@gmail.com','2022-06-09','','',1),
('Công ty Cổ phần An ninh mạng Việt Nam','Biệt thự số 26 – BT2 – khu đô thị Văn Quán, Phường Văn Quán, Quận Hà Đông, Thành phố Hà Nội, Việt Nam','0832536209','truongducluong@gmail.com','2022-06-09','','',0);

insert into tblVanChuyen(ten,ghichu,trangthai) values 
('Giao hàng nhanh','GHN',1),
('Giao hàng tiết kiệm','GHTK',0),
('Viettel Post','',1),
('J&T Express','',0),
('Ahamove','',1);

insert into tblThanhToan(ten,ghichu,trangthai) values 
('Thanh toán tiền mặt tại quầy','',1),
('Thanh toán bằng thẻ ngân hàng','',0),
('Chuyển khoản ngân hàng','',1),
('Ship COD','',0),
('Thanh toán tích điểm','',1);

insert into tblHoaDon(ngaytao,ngaygiaohang,idvanchuyen,idthanhtoan,idkhachhang,idnhanvien,trangthai,diachinhan,sdtnhan,ghichu) values 
();

insert into tblHangHoa(ten,idchungloai,iddonvitinh,idnhacc,soluong,gianhap,giaxuat,ngaytao,ngaycapnhat,ghichu) values 
('Đệm Everon',1,1,1,10,1000,1500,'2022-06-09','',''),
('Bim Bim Oishi',2,1,2,20,2000,2500,'2022-06-09','',''),
('Bếp hồng ngoại',3,1,3,30,3000,3500,'2022-06-09','',''),
('Bàn chải điện',4,1,4,40,4000,4500,'2022-06-09','',''),
('Cốc viễn đông',5,1,5,50,5000,5500,'2022-06-09','',''),
('Sữa chua trân châu',6,1,6,60,6000,6500,'2022-06-09','',''),
('Sữa tiệt trùng vinamilk',7,1,7,70,7000,7500,'2022-06-09','',''),
('Sting',8,1,8,80,8000,8500,'2022-06-09','',''),
('Trà xanh không độ',9,1,9,90,9000,9500,'2022-06-09','',''),
('Lavie',10,1,10,100,10000,15000,'2022-06-09','','');

insert into tblHoaDonChiTiet(idhoadon,idhanghoa,soluong,giaban) values 
();

insert into tblHinhAnh(idhanghoa,ghichu,sothutu,trangthai) values 
();