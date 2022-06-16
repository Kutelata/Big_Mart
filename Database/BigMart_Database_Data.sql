insert into tblCustomer(`name`,gender,birthday,phone,`address`,email,`status`,created_at,updated_at) values 
('Nguyễn Ngọc Thúy',0,'1990-11-23','0832536199','Khu tập thể A3 Nam Đồng, A1P49, Phố P. Hồ Đắc Di, Nam Đồng, Đống Đa, Hà Nội','nguyenngocthuy@gmail.com',1,'2022-06-09',''),
('Đáo Đức Thành',1,'1991-11-23','0832536200','Tòa nhà C´Land, 156 Ng. Xã Đàn 2, Nam Đồng, Đống Đa, Hà Nội','daoducthanh@gmail.com',0,'2022-06-09',''),
('Tô Nghị',2,'1992-11-23','0832536201','Trần Hưng Đạo, Hoàn Kiếm, Hà Nội','tonghi@gmail.com',1,'2022-06-09',''),
('Nguyễn Lê Tuấn',0,'1993-11-23','0832536202','81 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội','nguyenletuan@gmail.com',0,'2022-06-09',''),
('Trần Thị Thu',1,'1994-11-23','0832536203','6 Ng. 84 P. Trần Quang Diệu, Chợ Dừa, Đống Đa, Hà Nội','tranthithu@gmail.com',1,'2022-06-09',''),
('Phạm Duy Hồng',2,'1995-11-23','0832536204','65 Nguyễn Đình Thi, Thuỵ Khuê, Tây Hồ, Hà Nội','phamduyhong@gmail.com',0,'2022-06-09',''),
('Lê Hồng Nguyên',0,'1996-11-23','0832536205','51 Đ. Âu Cơ, Tứ Liên, Tây Hồ, Hà Nội','lehongnguyen@gmail.com',1,'2022-06-09',''),
('Hồ Cung Đạt Nhân',1,'1997-11-23','0832536206','Hàng Bột, Đống Đa, Hà Nội','hocungdatnhan@gmail.com',0,'2022-06-09',''),
('Chu Văn Nam',2,'1998-11-23','0832536207','9b Nguyễn Đình Thi, Thuỵ Khuê, Tây Hồ, Hà Nội','chuvannam@gmail.com',1,'2022-06-09',''),
('Huỳnh Đức Long',0,'1999-11-23','0832536208','88 P.Yên Lãng, Láng Hạ, Đống Đa, Trung Hoà Cầu Giấy Hà Nội','huynhduclong@gmail.com',0,'2022-06-09','');

insert into tblGiftPoint(customer_id,content,`point`,created_at) values 
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

insert into tblStore(`name`,`address`,phone,employee_id,open_time,close_time) values 
('Big Mart 1','Số 349 đường 3/2, TT. Đức Tài, H. Đức Linh, T. Bình Thuận (Đối diện bến xe Đức Tài)','0832536199',1,7,19),
('Big Mart 2','Tiểu khu 7, Thị Trấn Thuận Châu, Huyện Thuận Châu, Tỉnh Sơn La','0832536200',2,7,19),
('Big Mart 3','Số 473, đường Tô Hiệu, TT. Ít Ong, H. Mường La, T. Sơn La','0832536201',3,7,19),
('Big Mart 4','Tổ 9, Phường Tân Phong, Thành Phố Lai Châu, Tỉnh Lai Châu','0832536202',4,7,19),
('Big Mart 5','Số 69 Đường Hồng Bàng, P. Sở Dầu, Q. Hồng Bàng, TP. Hải Phòng','0832536203',5,7,19),
('Big Mart 6','Quốc lộ 27, Thôn Hạnh Trí 1, X. Quảng Sơn, H. Ninh Sơn, T. Ninh Thuận (gần chợ Quảng Sơn)','0832536204',6,7,19),
('Big Mart 7','Phố Ba Mỏ, TT. Thanh Sơn, H. Thanh Sơn, T. Phú Thọ (Gần ngã tư bến xe Thanh Sơn)','0832536205',7,7,19),
('Big Mart 8','485 Hùng Vương, TT. Vạn Giã, H. Vạn Ninh, T. Khánh Hòa','0832536206',8,7,19),
('Big Mart 9','226 Trần Hưng Đạo, Phường Nam Lý, Thành phố Đồng Hới, Tỉnh Quảng Bình','0832536207',9,7,19),
('Big Mart 10','Quốc Lộ 1A, Thôn Dinh Mười, X. Gia Ninh, H. Quảng Ninh, T. Quảng Bình','0832536208',10,7,19);

insert into tblRole(`name`,position) values 
('Toàn bộ','Chủ cửa hàng'),
('Phụ trách thu chi','Kế toán'),
('Phụ trách kho hàng','Quản lý kho'),
('Phụ trách sản phẩm','Thu mua'),
('Phụ trách đơn hàng','Bán hàng'),
('Phụ trách nhân sự','Quản lý nhân viên');

insert into tblEmployee(`name`,gender,birthday,phone,email,`address`,role_id,salary,username,`password`,`status`,created_at,updated_at) values 
('Võ Thị Thanh Thảo',0,'1990-11-23','0832536199','vothithanhthao@gmail.com','',1,1000,'vothithanhthao','vothithanhthao',1,'2022-06-09',''),
('Lày A Cẩu',1,'1991-11-23','0832536200','layacau@gmail.com','',2,2000,'layacau','layacau',1,'2022-06-09',''),
('Bùi Mạnh Quốc Huy',2,'1992-11-23','0832536201','buimanhquochuy@gmail.com','',3,3000,'buimanhquochuy','buimanhquochuy',1,'2022-06-09',''),
('Lê Thị Mai',0,'1993-11-23','0832536202','lethimai@gmail.com','',4,4000,'lethimai','lethimai',1,'2022-06-09',''),
('Trần Kim Ngọc',1,'1994-11-23','0832536203','trankimngoc@gmail.com','',5,5000,'trankimngoc','trankimngoc',1,'2022-06-09',''),
('Lai Như Quỳnh',2,'1995-11-23','0832536204','lainhuquynh@gmail.com','',6,6000,'lainhuquynh','lainhuquynh',1,'2022-06-09',''),
('Đặng Ngọc Thanh Loan',0,'1996-11-23','0832536205','dangngocthanhloan@gmail.com','',1,1000,'dangngocthanhloan','dangngocthanhloan',1,'2022-06-09',''),
('Lê Thị Đào',1,'1997-11-23','0832536206','lethidao@gmail.com','',2,2000,'lethidao','lethidao',1,'2022-06-09',''),
('Phạm Đoàn Minh Hiếu',2,'1998-11-23','0832536207','phamdoanminhhieu@gmail.com','',3,3000,'phamdoanminhhieu','phamdoanminhhieu',1,'2022-06-09',''),
('Cao Ngọc Phương Trinh',0,'1999-11-23','0832536208','caongocphuongtrinh@gmail.com','',4,4000,'caongocphuongtrinh','caongocphuongtrinh',1,'2022-06-09','');

insert into tblCategory(`name`,`description`,`image`) values 
('Đệm','','dem.png'),
('Bim Bim','','bim_bim.png'),
('Bếp','','bep.png'),
('Bàn chải','','ban_chai.png'),
('Cốc','','coc.png'),
('Sữa chua','','sua_chua.png'),
('Sữa','','sua.png'),
('Nước tăng lực','','nuoc_tang_luc.png'),
('Nước giải khát','','nuoc_giai_khat.png'),
('Nước lọc','','nuoc_loc.png');

insert into tblUnit(`name`,note) values 
('Việt Nam đồng','VND'),
('Đô la Mỹ','USD'),
('đồng EURO','EUR');

insert into tblProvider(`name`,`address`,phone,email,`status`) values 
('Công ty Cổ phần an ninh an toàn thông tin CMC','Tầng 4, tòa nhà CMC, phố Duy Tân, phường Dịch Vọng Hậu, quận Cầu Giấy, Thành phố Hà Nội','0832536199','tahoanglinh@gmail.com',1),
('Công ty Cổ phần Thương mại Tin học và Viễn thông Sao Việt','Số 16, Ngách 82/5, Ngõ 651, Phố Minh Khai, Phường Thanh Lương, Quận Hai Bà Trưng, Thành phố Hà Nội','0832536201','leminhhai@gmail.com',0),
('Công ty Cổ phần công nghệ truyền thông DTS','Số 287B Điện Biên Phủ, Phường 7, Quận 3, Thành phố Hồ Chí Minh','0832536202','tohuyhoang@gmail.com',1),
('Tập đoàn Bưu chính Viễn thông Việt Nam','Số 57 phố Huỳnh Thúc Kháng, Phường Láng Hạ, Quận Đống Đa, Thành phố Hà Nội, Việt Nam','0832536203','phamduclong@gmail.com',0),
('Công ty Cổ phần Dịch vụ Công nghệ Tin học HPT','Tầng 9 Tòa nhà Paragon, số 3 Nguyễn Lương Bằng, Phường Tân Phú, Quận 7, Thành phố Hồ Chí Minh, Việt Nam','0832536204','dinhhaduylinh@gmail.com',1),
('Công ty Cổ phần giải pháp công nghệ SAVIS Việt Nam','Số 22, lô 1C, đường Trung Yên, 11C, KĐT Trung Yên, Phường Trung Hòa, Quận Cầu Giấy, Thành phố Hà Nội, Việt Nam','0832536205','hoangnguyenvan@gmail.com',0),
('Công ty TNHH Thông tin NTT (Việt Nam)','Tòa nhà Vincom, số 72 đường Lê Thánh Tôn, phường Bến Nghé, quận 1, thành phố Hồ Chí Minh, Việt Nam','0832536206','kinyahasegawa@gmail.com',1),
('Công ty Cổ phần Công nghệ Mạng và Truyền thông','Số 36 phố Trúc Khê, Phường Láng Hạ, Quận Đống Đa, Thành phố Hà Nội, Việt Nam','0832536207','lengoctu@gmail.com',0),
('Công ty TNHH Hệ thống thông tin FPT','Tầng 22 tòa nhà Keangnam Landmark72, E6, đường Phạm Hùng, phường Mễ Trì, quận Nam Từ Liêm, thành phố Hà Nội, Việt Nam','0832536208','phamminhtuan@gmail.com',1),
('Công ty Cổ phần An ninh mạng Việt Nam','Biệt thự số 26 – BT2 – khu đô thị Văn Quán, Phường Văn Quán, Quận Hà Đông, Thành phố Hà Nội, Việt Nam','0832536209','truongducluong@gmail.com',0);

insert into tblShipment(`name`,note,`status`) values 
('Giao hàng nhanh','GHN',1),
('Giao hàng tiết kiệm','GHTK',0),
('Viettel Post','',1),
('J&T Express','',0),
('Ahamove','',1);

insert into tblPayment(`name`,note,`status`) values 
('Thanh toán tiền mặt tại quầy','',1),
('Thanh toán bằng thẻ ngân hàng','',0),
('Chuyển khoản ngân hàng','',1),
('Ship COD','',0),
('Thanh toán tích điểm','',1);

insert into tblInvoice(created_at,ship_at,shipment_id,payment_id,customer_id,employee_id,`status`,addredd_ship,phone_ship,note) values 
('2022-06-09','2022-06-10',1,1,1,1,1,'Ng. 102 Trường Chinh, Phương Đình, Đống Đa, Hà Nội','0832536199',''),
('2022-06-09','2022-06-10',1,1,2,2,0,'43 P.Hàm Long, Hàng Bài, Hoàn Kiếm, Hà Nội','0832535200',''),
('2022-06-09','2022-06-10',1,1,3,3,1,'1A Ng. 165 P. Thái Hà, Láng Hạ, Đống Đa, Hà Nội','0832535201',''),
('2022-06-09','2022-06-10',1,1,4,4,0,'140 P. Vũ Thạnh, Chợ Dừa, Đống Đa, Hà Nội','0832535202',''),
('2022-06-09','2022-06-10',1,1,5,5,1,'380 P. Xã Đàn, Nam Đồng, Đống Đa, Hà Nội','0832535203',''),
('2022-06-09','2022-06-10',1,1,6,6,0,'1 P. Thái Hà, Trung Liệt, Đống Đa, Hà Nội','0832535204',''),
('2022-06-09','2022-06-10',1,1,7,7,1,'378B P. Xã Đàn, Nam Đồng, Đống Đa, Hà Nội','0832535205',''),
('2022-06-09','2022-06-10',1,1,8,8,0,'Số 8 Ngh. 180/29 P. Kim Hoa, Phương Liên, Đống Đa, Hà Nội','0832535206',''),
('2022-06-09','2022-06-10',1,1,9,9,1,'Bà Triệu, Nguyễn Du, Hai Bà Trưng, Hà Nội','0832535207',''),
('2022-06-09','2022-06-10',1,1,10,10,0,'8 Ngh. 180/29 P. Kim Hoa, Phương Liên, Đống Đa, Hà Nội','0832535208','');

insert into tblProduct(`name`,`image`,category_id,unit_id,provider_id,`number`,import_price,export_price,created_at,updated_at) values 
('Đệm Everon','dem_everon.png',1,1,1,10,1000,1500,'2022-06-09',''),
('Bim Bim Oishi','bim_bim_oishi.png',2,1,2,20,2000,2500,'2022-06-09',''),
('Bếp hồng ngoại','bep_hong_ngoai.png',3,1,3,30,3000,3500,'2022-06-09',''),
('Bàn chải điện','ban_chai_dien.png',4,1,4,40,4000,4500,'2022-06-09',''),
('Cốc viễn đông','coc_vien_dong.png',5,1,5,50,5000,5500,'2022-06-09',''),
('Sữa chua trân châu','sua_chua_tran_chau.png',6,1,6,60,6000,6500,'2022-06-09',''),
('Sữa tiệt trùng vinamilk','sua_tiet_trung_vinamilk.png',7,1,7,70,7000,7500,'2022-06-09',''),
('Sting','sting.png',8,1,8,80,8000,8500,'2022-06-09',''),
('Trà xanh không độ','tra_xanh_khong_do.png',9,1,9,90,9000,9500,'2022-06-09',''),
('Lavie','lavie.png',10,1,10,100,10000,10500,'2022-06-09','');

insert into tblInvoiceDetail(invoice_id,product_id,`number`,export_price) values 
(1,1,1,1500),
(2,2,1,2500),
(3,3,1,3500),
(4,4,1,4500),
(5,5,1,5500),
(6,6,1,6500),
(7,7,1,7500),
(8,8,1,8500),
(9,9,1,9500),
(10,10,1,10500);