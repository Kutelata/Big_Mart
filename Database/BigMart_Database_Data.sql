insert into tblCustomer(`name`,gender,birthday,phone,`address`,email,`password`,`status`) values 
('Nguyễn Ngọc Thúy',0,'1990-11-23','0832536199','Khu tập thể A3 Nam Đồng, A1P49, Phố P. Hồ Đắc Di, Nam Đồng, Đống Đa, Hà Nội','nguyenngocthuy@gmail.com','123',1),
('Đáo Đức Thành',1,'1991-11-23','0832536200','Tòa nhà C´Land, 156 Ng. Xã Đàn 2, Nam Đồng, Đống Đa, Hà Nội','daoducthanh@gmail.com','123',0),
('Tô Nghị',2,'1992-11-23','0832536201','Trần Hưng Đạo, Hoàn Kiếm, Hà Nội','tonghi@gmail.com','123',1),
('Nguyễn Lê Tuấn',0,'1993-11-23','0832536202','81 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội','nguyenletuan@gmail.com','123',0),
('Trần Thị Thu',1,'1994-11-23','0832536203','6 Ng. 84 P. Trần Quang Diệu, Chợ Dừa, Đống Đa, Hà Nội','tranthithu@gmail.com','123',1),
('Phạm Duy Hồng',2,'1995-11-23','0832536204','65 Nguyễn Đình Thi, Thuỵ Khuê, Tây Hồ, Hà Nội','phamduyhong@gmail.com','123',0),
('Lê Hồng Nguyên',0,'1996-11-23','0832536205','51 Đ. Âu Cơ, Tứ Liên, Tây Hồ, Hà Nội','lehongnguyen@gmail.com','123',1),
('Hồ Cung Đạt Nhân',1,'1997-11-23','0832536206','Hàng Bột, Đống Đa, Hà Nội','hocungdatnhan@gmail.com','123',0),
('Chu Văn Nam',2,'1998-11-23','0832536207','9b Nguyễn Đình Thi, Thuỵ Khuê, Tây Hồ, Hà Nội','chuvannam@gmail.com','123',1),
('Huỳnh Đức Long',0,'1999-11-23','0832536208','88 P.Yên Lãng, Láng Hạ, Đống Đa, Trung Hoà Cầu Giấy Hà Nội','huynhduclong@gmail.com','123',0);

insert into tblRole(`name`) values 
('Chủ cửa hàng'),
('Kế toán'),
('Kho'),
('Nhập hàng'),
('Bán hàng'),
('Nhân sự');

insert into tblUser(`name`,`image`,account,`password`,role_id) values 
('Võ Thị Thanh Thảo','','vothithanhthao','vothithanhthao',1),
('Lày A Cẩu','','layacau','layacau',2),
('Bùi Mạnh Quốc Huy','','buimanhquochuy','buimanhquochuy',3),
('Lê Thị Mai','','lethimai','lethimai',4),
('Trần Kim Ngọc','','trankimngoc','trankimngoc',5),
('Lai Như Quỳnh','','lainhuquynh','lainhuquynh',6),
('Đặng Ngọc Thanh Loan','','dangngocthanhloan','dangngocthanhloan',7),
('Lê Thị Đào','','lethidao','lethidao',8),
('Phạm Đoàn Minh Hiếu','','phamdoanminhhieu','phamdoanminhhieu',9),
('Cao Ngọc Phương Trinh','','caongocphuongtrinh','caongocphuongtrinh',10);

insert into tblCategory(`name`,`image`,`status`) values 
('Đệm','dem.png',0),
('Bim Bim','bim_bim.png',1),
('Bếp','bep.png',0),
('Bàn chải','ban_chai.png',1),
('Cốc','coc.png',0),
('Sữa chua','sua_chua.png',1),
('Sữa','sua.png',0),
('Nước tăng lực','nuoc_tang_luc.png',1),
('Nước giải khát','nuoc_giai_khat.png',0),
('Nước lọc','nuoc_loc.png',1);

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

insert into tblShipment(`name`,code,price,`status`) values 
('Giao hàng nhanh','GHN',1000,1),
('Giao hàng tiết kiệm','GHTK',2000,0),
('Viettel Post','VP',3000,1),
('J&T Express','JE',4000,0),
('Ahamove','AM',5000,1);

insert into tblPayment(`name`,code,price,`status`) values 
('Thanh toán tiền mặt tại quầy','HERE',1000,1),
('Thanh toán bằng thẻ ngân hàng','CARD',2000,0),
('Chuyển khoản ngân hàng','CKNH',3000,1),
('Ship COD','SSS',4000,0),
('Thanh toán tích điểm','TTTD',5000,1);

insert into tblInvoice(shipment_id,payment_id,customer_id,total,`status`) values 
(1,1,1,10000,1),
(1,1,2,20000,0),
(1,1,3,30000,1),
(1,1,4,40000,0),
(1,1,5,50000,1),
(1,1,6,60000,0),
(1,1,7,70000,1),
(1,1,8,80000,0),
(1,1,9,90000,1),
(1,1,10,100000,0);

insert into tblProduct(`name`,`image`,category_id,provider_id,quantity,price,saleable_qty,point,`status`,`description`,created_at,updated_at) values 
('Đệm Everon','dem_everon.png',1,1,10,1000,15,1,1,'','2022-06-09',''),
('Bim Bim Oishi','bim_bim_oishi.png',2,2,20,2000,25,2,0,'','2022-06-09',''),
('Bếp hồng ngoại','bep_hong_ngoai.png',3,3,30,3000,35,3,1,'','2022-06-09',''),
('Bàn chải điện','ban_chai_dien.png',4,4,40,4000,45,4,0,'','2022-06-09',''),
('Cốc viễn đông','coc_vien_dong.png',5,5,50,5000,55,5,1,'','2022-06-09',''),
('Sữa chua trân châu','sua_chua_tran_chau.png',6,6,60,6000,65,6,0,'','2022-06-09',''),
('Sữa tiệt trùng vinamilk','sua_tiet_trung_vinamilk.png',7,7,70,7000,75,7,1,'','2022-06-09',''),
('Sting','sting.png',8,8,80,8000,85,8,0,'','2022-06-09',''),
('Trà xanh không độ','tra_xanh_khong_do.png',9,9,90,9000,95,9,1,'','2022-06-09',''),
('Lavie','lavie.png',10,10,100,10000,105,10,0,'','2022-06-09','');

insert into tblInvoiceDetail(invoice_id,product_id,quantity,row_total) values 
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