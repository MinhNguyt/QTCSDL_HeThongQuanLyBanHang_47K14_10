CREATE DATABASE QuanLyBanHang
------ TAO BANG
---TAIKHOAN---
CREATE TABLE TAIKHOAN (TenTK varchar(4) primary key not null,
					MatKhau varchar(10) NOT NULL,
					ChucVu bit) --0: Nhân viên, 1: Quản lý

--MON AN
CREATE TABLE MONAN (MaMA varchar(8) primary key,
					TenMon nvarchar(50),
					DonGia Numeric(12,0),
					TrangThai tinyint default 0);
-- BAN
CREATE TABLE BAN (MaBan varchar(4) primary key,
						TrangThai nvarchar(10)default N'Không')-- 1: có, 0: không 
--HOA DON 
CREATE TABLE HOADON (MaHD varchar(6) primary key,ThoiGian datetime,MaBan varchar(4) FOREIGN KEY (MaBan) REFERENCES BAN(MaBan), TrangThai bit default 0,--1: Đã thanh toán, 0: chưa thanh toán
						Thanhtien numeric(15,0)) 

--HOADONCHITIET
CREATE TABLE HOADONCHITIET (MaHDCT varchar(8) primary key,MaMA varchar(8) FOREIGN KEY (MaMA) REFERENCES MONAN(MaMA),
						SoLuong Int,MaHD varchar(6) FOREIGN KEY (MaHD) REFERENCES HOADON(MaHD) )

-- CAP NHAT


-- NGUYEN LIEU
CREATE TABLE  NGUYENLIEU (MaNL VARCHAR(5) PRIMARY KEY,
							TenNL NVARCHAR(50),
							DVT NVARCHAR(10),
							DonGiaNL NUMERIC(12,0),
							TrangThai tinyint default 0);
-- DON VI NHAP
CREATE TABLE DONVINHAP (MaDV VARCHAR(5) PRIMARY KEY,
						 TenDVNH NVARCHAR(50),
						 DiaChiNH NVARCHAR(100),
						 TrangThai tinyint default 0);

-- NHAP HANG
CREATE TABLE NHAPHANG (MaNH varchar(5) primary key,
						 ThoiGian DATETIME,
						 SoLuong int,
						 ThanhTien Numeric(12,0))

-- CAP NHAT NHAP HANG
ALTER TABLE NHAPHANG ADD MaNL VARCHAR(5),MaDV varchar(5)

----------------------------------NHẬP HÀNG------------------------------------------

-- NOI BANG NHAP HANG VA NGUYEN LIEU
ALTER TABLE NHAPHANG ADD CONSTRAINT NHAPHANG_FK_NGUYENLIEU FOREIGN KEY (MaNL) REFERENCES NGUYENLIEU (MANL);
-- NOI BANG NHAP HANG VOI DON VI NHAP
ALTER TABLE NHAPHANG ADD CONSTRAINT NHAPHANG_FK_DONVINHAP FOREIGN KEY (MaDV) REFERENCES DONVINHAP (MADV);


INSERT INTO TAIKHOAN (TenTK, MatKhau, ChucVu)
VALUES ('TK01','12345','1'),
	   ('TK02','45678','0')
Select * from TAIKHOAN

INSERT INTO MONAN (MaMA, TenMon, DonGia)
VALUES ('MA001', N'CƠM GÀ QUAY', 50000),
       ('MA002', N'CƠM GÀ XÉ', 50000),
       ('MA003', N'CƠM GÀ XÉ SỢI', 50000),
       ('MA004', N'CƠM BA CHỈ QUAY GIÒN DA', 40000),
       ('MA005', N'CƠM SƯỜN GIÒN', 40000),
       ('MA006', N'CƠM CHIÊN HẢI SẢN', 40000),
       ('MA007', N'CƠM CHIÊN DƯƠNG CHÂU', 40000),
       ('MA008', N'CƠM XÁ XÍU', 40000),
       ('MA009', N'CƠM SƯỜN RIM', 35000),
       ('MA010', N'CƠM CHIÊN TRỨNG', 30000),
       ('MA011', N'CƠM CẢI XÀO TIM CẬT', 45000),
       ('MA012', N'CƠM CẢI XÀO BÒ', 50000),
       ('MA013', N'CƠM CẢI XÀO HẢI SẢN', 55000),
       ('MA014', N'CƠM CẢI THẬP CẨM', 60000),
       ('MA015', N'CƠM THÊM', 10000),
	   ('MA016', N'MÌ XÀO MỀM LAGIM', 35000),
	   ('MA017', N'MÌ XÀO MỀM TIM CẬT', 45000),
	   ('MA018', N'MÌ XÀO MỀM BÒ', 50000),
	   ('MA019', N'MÌ XÀO MỀM HẢI SẢN', 55000),
	   ('MA020', N'MÌ XÀO MỀM THẬP CẨM', 60000),
	   ('MA021', N'MÌ XÀO GIÒN TIM CẬT', 45000),
	   ('MA022', N'GÀ QUAY', 190000),
	   ('MA023', N'GÀ XÉ', 190000),
	   ('MA024', N'GÀ LUỘC', 190000),
	   ('MA026', N'MÌ THÊM', 10000),
	   ('MA027', N'SƯỜN TRIM THÊM', 25000),
	   ('MA028', N'THỊT BA CHỈ GIÒN DA THÊM', 30000),
	   ('MA029', N'THỊT SƯỜN GIÒN THÊM', 30000),
	   ('MA030', N'THỊT XÁ XÍU THÊM', 30000),
	   ('MA031', N'CẢI XÀO TỎI', 60000),
	   ('MA032', N'CẢI XÀO TIM CẬT', 30000),
	   ('MA033', N'CẢI XÀO BÒ', 45000),
	   ('MA034', N'CẢI XÀO HẢI SẢN', 50000),
	   ('MA035', N'CẢI XÀO THẬP CẨM', 55000),
	   ('MA036', N'CƠM CẢI THẬP CẨM', 60000);

select * from MONAN
-- BAN (MaBan,TrangThai)
INSERT INTO BAN
VALUES ('B1',N'Không'),
		('B2',N'Không'),
		('B3',N'Không'),
		('B4',N'Không'),
		('B5',N'Không'),
		('B6',N'Không'),
		('B7',N'Không'),
		('B8',N'Không'),
		('B9',N'Không'),
		('B10',N'Không'),
		('B11',N'Không'),
		('B12',N'Không');

--NGUYENLIEU	
INSERT INTO NGUYENLIEU(MaNL, TenNL,DVT, DonGiaNL)
VALUES ('NL001', N'Thịt gà', 'kg', 120000),
	   ('NL002', N'Gạo', 'kg', 17000),
	   ('NL003', N'Mì vàng', 'kg', 31500),
	   ('NL004', N'Sườn heo', 'kg', 200000),
	   ('NL005', N'Thịt ba chỉ', 'kg', 120000),
	   ('NL006', N'Thịt bò', 'kg', 220000),
	   ('NL007', N'Tôm', 'kg', 175000),
	   ('NL008', N'Mực', 'kg', 16000),
	   ('NL009', N'Trứng', N'quả', 1700),
	   ('NL010', N'Tim heo', 'kg', 180500),
	   ('NL011', N'Cật heo', 'kg', 133000),
	   ('NL012', N'Xúc xích', 'kg', 120000),
	   ('NL013', N'Cải thìa', 'kg', 30000),
	   ('NL014', N'Cải cay', 'kg', 31000),
	   ('NL015', N'Mộc nhĩ', 'kg', 150000),
	   ('NL016', N'Cà rốt', 'kg', 12000),
	   ('NL017', N'Rau mùi', 'kg', 18000),
	   ('NL018', N'Rau răm', 'kg', 52000),
	   ('NL019', N'Hà tây', 'kg', 34000),
	   ('NL020', N'Chả', 'kg', 52000);

--DONVINHAP
INSERT INTO DONVINHAP(MaDV, TenDVNH, DiaChiNH)
VALUES ('DV001', N'Chợ Cồn', N'290 Hùng Vương, phường Vĩ Trung, quận Hải Châu, thà phố Đà Nẵng'),
       ('DV002', N'Chợ Đầu Mối thủy sản Thọ Quang', N'20 Vân Đồn, phường Thọ Quang, quận Sơn Trà, thà phố Đà Nẵng');

--HOA DON
--HOADONCHITIET


Select * from DONVINHAP

select * from HOADON
select * from HOADONCHITIET
select * from MONAN

go
SELECT * from HOADON where maban = 'B1' and TrangThai = 0
SELECT * FROM HOADONCHITIET WHERE MaMA= 'HD0001'
----TỰ ĐỘNG MÃ HÓA KHI INSERT
CREATE or ALTER TRIGGER trig_Insert_MK ON TAIKHOAN
AFTER INSERT AS
BEGIN
    UPDATE t
    SET t.MatKhau = SUBSTRING(CONVERT(VARCHAR(10), HASHBYTES('SHA2_256', i.MatKhau), 1), 1, 64)
    FROM TAIKHOAN t
    INNER JOIN INSERTED i ON t.TenTK = i.TenTK;
END;
-- tự động mã hóa khi update
CREATE or ALTER TRIGGER trig_Update_MK ON TAIKHOAN
FOR UPDATE AS
BEGIN
	IF UPDATE(MatKhau)
		BEGIN
		UPDATE TAIKHOAN
		SET MatKhau = (SELECT CONVERT(VARCHAR(10),
					   HASHBYTES ('SHA2_256', i.MatKhau),1)
					   FROM INSERTED i)
		WHERE TenTK = (SELECT i.TenTK From INSERTED i)
	END
END
-- mã hóa mật khẩu
UPDATE TAIKHOAN 
SET MatKhau= '45678' where TenTK ='TK02'

select * from TAIKHOAN
--- PROC
go
CREATE or alter PROC USP_DANGNHAP -- đăng nhập
@tenTk varchar(4), @matkhau varchar(10)
as
begin 
	SET @matkhau = CONVERT(varchar(10), HASHBYTES('SHA2_256', @matkhau), 1);
	print @matkhau
	SELECT * FROM dbo.TAIKHOAN where TenTK =@tenTk and MatKhau = @matkhau
end
go

exec USP_DANGNHAP 'TK01','12345'
select * from TAIKHOAN

declare @matkhau varchar(10) = CONVERT(varchar(10), HASHBYTES('SHA2_256','12345'), 1);
print @matkhau
--Thêm bàn
create or alter PROC USP_LayDSBan
AS 
begin 
	SELECT * FROM BAN order by Cast(SUBSTRING(MaBan,2,2) as int) asc 
end

-- Tạo mã HD mới
create or alter function fmaHD()
returns varchar(10)
as
begin 
	declare @MaHD varchar(10),@MaHDnew varchar(10)
	set @MAHD = (select max(MaHD) from HOADON);
	if @maHD is null
	begin
		set @maHDnew = 'HD0001'
	end
	else
	begin
		set @MaHDnew =RIGHT(@MaHD,4) + 1;
		set @MAHDnew = 'HD'+REPLICATE('0',4-len(@MaHDnew))+cast(@MaHDnew as varchar)
	end
	
	return @MaHDnew
end

select dbo.fmaHD()

-- Thêm Hóa đơn 
go 
create or alter proc USP_ThemHoaDon
@MaBan varchar(4)
as 
begin 
	Insert into HoaDon(MaHD,ThoiGian,MaBan)
	values(dbo.fmaHD(), GETDATE(), @MaBan);
end

--Thêm hóa đơn thì đổi trạng thái bàn sang 0
go 
create or alter trigger tThemHD
on HOADON
for insert
as
begin
	Update BAN
	set TrangThai = N'Có'
	where MaBan = (select MaBan from inserted)
end

-- Them hoadonchitiet
-- tạo mã hdct
create or alter function fmaHDCT()
returns varchar(10)
as
begin 
	declare @MaHDCT varchar(10),@MaHDCTnew varchar(10)
	set @MAHDCT = (select max(MaHDCT) from HOADONCHITIET);
	if @MaHDCT is null
	begin
		set @MaHDCTnew = 'HDCT001'
	end
	else
	begin
		set @MaHDCTnew =RIGHT(@MaHDCT,3) + 1;
		set @MAHDCTnew = 'HDCT'+REPLICATE('0',3-len(@MaHDCTnew))+cast(@MaHDCTnew as varchar)
	end
	
	return @MaHDCTnew
end
--them
create or alter proc USP_ThemHoaDonChiTiet
@MaHD varchar(10), @MaMA varchar(10), @SoLuong int
as
begin
		declare @MaHDCTtest varchar(10) ;
		declare @SoLuongMon int =1;
		select @MaHDCTtest = MaHDCT,@SoLuongMon= SoLuong from HOADONCHITIET where MaHD = @MaHD and MaMA = @MaMA
		
		if(@MaHDCTtest is not null )
		begin
			declare @newsoluong int = @SoLuongMon +@SoLuong
			if (@newsoluong >0)
			begin
				update HOADONCHITIET set SoLuong = @SoLuongMon + @SoLuong where MaMA = @MaMA
			end
			else
			begin
				delete HOADONCHITIET where MaHD = @MaHD and MaMA = @MaMA
			end
		end
		else
		begin
			Insert into HOADONCHITIET(MaHDCT,MaMA,SoLuong,MaHD)
			values(dbo.fmaHDCT(),@MaMA,@SoLuong,@MaHD);
		end	
end



--SuaHD
create or alter proc USP_SuaHoaDon
@MaHD varchar(10)
as 
begin 
	Update HOADON set TrangThai = 1 where MaHD =@MaHD
end
go
---- trigger
create or alter trigger UdateThemHD
on HOADON
for Update
as
begin
    declare @Trangthaimoi bit = (select trangthai from inserted)
	if @Trangthaimoi = 1
	begin
		Update BAN
		set TrangThai = N'Không'
		where MaBan = (select MaBan from inserted)
	end
end


-- Lấy ds doanh thu theo ngày
create or alter proc USP_layDSDoanhThu @thoigian datetime
as
begin
	select MaHD as [Mã Hóa Đơn],format(ThoiGian,'yyyy-MM-dd') as [Thời Gian], MaBan as [Mã Bàn], thanhtien as [Tổng Tiền]  from HOADON
	where format(ThoiGian,'yyyyMMdd') = format( @thoigian ,'yyyyMMdd') and TrangThai = 1
end

exec USP_layDSDoanhThu '2023-11-24 19:22:06.340'
select format( '2023-11-24 19:22:06.340' ,'yyyyMMdd')
---Lấy ds nhập hàng theo mã đơn vị
INSERT INTO NHAPHANG
VALUES ('NH001',GETDATE(),4, 4000000, 'NL001','DV001')
---
create or alter proc USP_LayDSNhapHangTheoDV @madv varchar(5)
as
begin
	select TenNL,SoLuong, DonGiaNL as DonGia, ThanhTien from NHAPHANG	join NGUYENLIEU 
															on NHAPHANG.MaNL = NGUYENLIEU.MaNL 
															join DONVINHAP 
															on NHAPHANG.madv = DONVINHAP.MaDV
	where NHAPHANG.maDV = @madv
	
end
exec USP_LayDSNhapHangTheoDV 'DV001'


--Tạo mamon
create or alter function fmaMon()
returns varchar(10)
as
begin 
	declare @MaMA varchar(10),@MaMAnew varchar(10)
	set @MaMA = (select max(MaMA) from MONAN);
	if @MaMA is null
	begin
		set @MaMAnew = 'MA001'
	end
	else
	begin
		set @MaMAnew =RIGHT(@MaMA,3) + 1;
		set @MaMAnew = 'MA'+REPLICATE('0',3-len(@MaMAnew))+cast(@MaMAnew as varchar)
	end
	
	return @MaMAnew
end
select dbo.fmaMon()
--Thêm món ăn
Insert into MONAN(MaMA,TenMon,DonGia)values(dbo.fmaMon(),N'',1234 );

--Sửa 
update MONAN set TenMon =N'', DonGia = 0 where MaMA = 'id'



---Thêm Nguyên Liệu
create or alter function fmaNL()
returns varchar(10)
as
begin 
	declare @MaNL varchar(10),@MaNLnew varchar(10)
	set @MaNL = (select max(MaNL) from NGUYENLIEU);
	if @MaNL is null
	begin
		set @MaNLnew = 'NL001'
	end
	else
	begin
		set @MaNLnew =RIGHT(@MaNL,3) + 1;
		set @MaNLnew = 'NL'+REPLICATE('0',3-len(@MaNLnew))+cast(@MaNLnew as varchar)
	end
	
	return @MaNLnew
end
select dbo.fmaNL()

--Tạo mã đơn vị nhập mới
create or alter function fmaDVN()
returns varchar(10)
as
begin 
	declare @MaDVN varchar(10),@MaDVNnew varchar(10)
	set @MaDVN = (select max(MaDV) from DONVINHAP);
	if @MaDVN is null
	begin
		set @MaDVNnew = 'DV001'
	end
	else
	begin
		set @MaDVNnew =RIGHT(@MaDVN,3) + 1;
		set @MaDVNnew = 'MA'+REPLICATE('0',3-len(@MaDVNnew))+cast(@MaDVNnew as varchar)
	end
	return @MaDVNnew
end
select dbo.fmaDVN()
-----
----------------------------------------- LAY DANH SACH DON VI NHAP
create or alter PROC USP_LayDSDonViNhap
AS 
begin 
	SELECT * FROM DONVINHAP where TrangThai =0
end
EXEC USP_LayDSDonViNhap
------------------------------------------ MA NHAP HANG
CREATE OR ALTER FUNCTION fMANHAPHANG()
RETURNS VARCHAR(5)
AS
BEGIN
	declare @MaNH varchar(10),@MaNHnew varchar(10)
	set @MaNH = (select max(MaNH) from NHAPHANG);
	if @MaNH is null
	begin
		set @MaNHnew = 'NH001'
	end
	else
	begin
		set @MaNHnew =RIGHT(@MaNH,3) + 1;
		set @MaNHnew = 'NH'+REPLICATE('0',3-len(@MaNHnew))+cast(@MaNHnew as varchar)
	end
	return @MaNHnew
END

------------------------------------- THEM NGUYEN LIEU THEO DON VI NHAP

CREATE OR ALTER PROC USP_THEMNGUYENLIEU @MADV VARCHAR(10),@MANL VARCHAR(10), @SOLUONG INT
AS
BEGIN
	DECLARE @THANHTIEN NUMERIC(15,0) = NULL, @SOLUONGMOI INT
	IF EXISTS (SELECT 1 FROM NHAPHANG WHERE MaNL = @MANL AND MADV = @MADV)
	BEGIN
		if @soluong <0
		begin
			IF @SOLUONG -(SELECT SOLUONG FROM NHAPHANG WHERE MaNL = @MANL AND MADV = @MADV) <=0
			BEGIN
				DELETE NHAPHANG
				WHERE MANL = @MANL AND MADV = @MADV
			END
			ELSE
			BEGIN
				UPDATE NHAPHANG
				SET ThoiGian = GETDATE(), SoLuong = SoLuong + @SOLUONG, ThanhTien = SoLuong * (SELECT DONGIANL FROM NGUYENLIEU WHERE MaNL = @MANL)
				WHERE MaNL = @MANL AND MADV = @MADV
			END
		end
		else
		begin
			UPDATE NHAPHANG
			SET ThoiGian = GETDATE(), SoLuong = SoLuong + @SOLUONG, ThanhTien = SoLuong * (SELECT DONGIANL FROM NGUYENLIEU WHERE MaNL = @MANL)
			WHERE MaNL = @MANL AND MADV = @MADV
		end
	END
	ELSE
	BEGIN
		IF @SOLUONG >0
		BEGIN
			SET @THANHTIEN = @SOLUONG*(SELECT DonGiaNL FROM NGUYENLIEU WHERE MaNL = @MANL)
	
			INSERT INTO NHAPHANG
			VALUES (DBO.fMANHAPHANG(),GETDATE(),@SOLUONG,@THANHTIEN,@MANL,@MADV)
		END
	END
END

--

select * from MONAN 
--
select * from NGUYENLIEU
---
select * from TAIKHOAN

select MaNH,FORMAT(thoigian,'yyyy-MM-dd'),SoLuong,TenNL, TenDVNH from NHAPHANG, NGUYENLIEU, DONVINHAP where Nhaphang.MaNL = NGUYENLIEU.MaNL and NHAPHANG.MaDV = DONVINHAP.MaDV

