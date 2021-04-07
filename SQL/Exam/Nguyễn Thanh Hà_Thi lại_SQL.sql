DROP DATABASE IF EXISTS ThucTap;
CREATE DATABASE IF NOT EXISTS ThucTap;
USE ThucTap;


/* 1. Tạo table với các ràng buộc và kiểu dữ liệu
Thêm ít nhất 3 bản ghi vào table*/
-- CREATE TABLE
DROP TABLE IF EXISTS `GiangVien`;
CREATE TABLE `GiangVien`(
	magv TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    hoten VARCHAR(100) NOT NULL,
    luong INT NOT NULL
);

DROP TABLE IF EXISTS `SinhVien`; 
CREATE TABLE `SinhVien`(
	masv TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    hoten VARCHAR(100) NOT NULL,
    namsinh DATE NOT NULL,
    quequan varchar(100) NOT NULL
); 

DROP TABLE IF EXISTS `DeTai`;
CREATE TABLE `DeTai`(
	madt TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tendt VARCHAR(100) DEFAULT 'Chưa có',
    kinhphi INT,
    NoiThucTap VARCHAR(100)
);

drop table if exists `HuongDan`;
CREATE TABLE `HuongDan`(
	id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    masv TINYINT UNSIGNED,
    FOREIGN KEY (masv) REFERENCES SinhVien(masv),
    madt TINYINT UNSIGNED ,
    FOREIGN KEY (madt) REFERENCES DeTai(madt),
    magv TINYINT UNSIGNED,
    FOREIGN KEY (magv) REFERENCES GiangVien(magv),
    ketqua VARCHAR(50)
);	

-- INSERT DATA
INSERT INTO `GiangVien` (hoten,luong)
VALUES  ('Nguyen Van A', 5000),
		('Tran Thi B', 3500),
		('Le Van C', 6000),
        ('Nguyen Thanh Ha', 7000),
        ('Giang Van Minh', 4000);
        
INSERT INTO `SinhVien` (hoten,namsinh,quequan)
VALUES  ('Trinh Van Duy', '1998-12-08', 'Ha Nam'),
		('Pham Huy Hoang', '1999-01-30', 'Quang Ninh'),
		('Tran Trung Hieu', '1999-12-01', 'TP HCM'),
		('Luong Thanh Nam', '2000-07-22', 'Bac Giang'),
		('Nguyen Phuong Thao', '1999-10-04', 'Cao Bang');
        
INSERT INTO `DeTai` (tendt,kinhphi,NoiThucTap)
VALUES  ('CONG NGHE SINH HOC', 2000,'Ha Noi'),
		('CONG NGHE HOA HOC', 3000,'Ha Noi'),
        ('CONG NGHE TOAN HOC', 4000,'Ha Noi'),
        ('CONG NGHE VAT LY', 5000,'Ha Noi'),
        (DEFAULT ,0,'NONE');
        
INSERT INTO `HuongDan` (masv,madt,magv,ketqua)
VALUES  (1, 2, 1, 'TOT'),
		(2, 1, 2, 'KHA'),
		(3, 3, 1, 'KHA'),
		(4, 5, 1, 'NONE'),
		(5, 4, 4, 'TOT');
        
        
/* 
2. Viết lệnh để
a) Lấy tất cả các sinh viên chưa có đề tài hướng dẫn
b) Lấy ra số sinh viên làm đề tài ‘CONG NGHE SINH HOC’
*/

-- a 

SELECT hd.masv AS Mã_SV, sv.hoten AS Họ_tên, dt.tendt AS Tên_đề_tài, hd.ketqua AS Kết_quả
FROM `HuongDan` hd
LEFT JOIN `SinhVien` sv on hd.masv = sv.masv
LEFT JOIN`DeTai` dt on hd.madt = dt.madt
WHERE dt.tendt = 'Chưa có' ;


-- b 
SELECT count(1) AS Số_lượng_sv_đề_tài_sinh_học FROM `HuongDan` hd
LEFT JOIN `DeTai` dt ON hd.madt = dt.madt
WHERE dt.tendt = 'CONG NGHE SINH HOC';


/*
3. Tạo view có tên là "SinhVienInfo" lấy các thông tin về học sinh bao gồm:
mã số, họ tên và tên đề tài
(Nếu sinh viên chưa có đề tài thì column tên đề tài sẽ in ra "Chưa có")
*/

DROP VIEW IF EXISTS SinhVienInfo;
CREATE VIEW SinhVienInfo AS
SELECT sv.masv AS Mã_số, sv.hoten AS Họ_tên, dt.tendt AS Tên_đề_tài
FROM `SinhVien` sv 
LEFT JOIN `HuongDan` hd ON sv.masv = hd.masv
LEFT JOIN `DeTai`dt ON hd.madt = dt.madt;


/*
4. Tạo trigger cho table SinhVien khi insert sinh viên có năm sinh <= 1900
thì hiện ra thông báo "năm sinh phải > 1900"
*/

DROP TRIGGER IF EXISTS checkinsert;
DELIMITER $$
	CREATE TRIGGER checkinsert
    BEFORE INSERT ON `SinhVien` FOR EACH ROW
	BEGIN
		DECLARE get_birth_date INT;
        SELECT YEAR(namsinh) INTO get_birth_date  FROM `SinhVien` WHERE NEW.namsinh = namsinh;
        IF get_birth_date <= 1900 THEN
			SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = 'Năm sinh phải > 1900';
		END IF ;
    END $$
DELIMITER ;

/*
5. Hãy cấu hình table sao cho khi xóa 1 sinh viên nào đó thì sẽ tất cả thông
tin trong table HuongDan liên quan tới sinh viên đó sẽ bị xóa đi
*/

DROP TRIGGER IF EXISTS deletedata;
DELIMITER $$
	CREATE TRIGGER deletedata
	AFTER DELETE ON `SinhVien` 
    FOR EACH ROW
    BEGIN
		UPDATE `HuongDan`
        SET id = NULL, masv = NULL, madt = NULL, magv = NULL, ketqua = NULL
        WHERE masv = OLD.masv;
    END $$
DELIMITER ;



/*END*/


