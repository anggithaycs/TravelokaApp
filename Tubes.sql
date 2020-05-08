CREATE TABLE Penumpang
(
    emailPenumpang VARCHAR(30),
    noHP VARCHAR(15),
    namaPenumpang VARCHAR(30),
    Profile_Image BLOB,
    passPenumpang VARCHAR(20),
    CONSTRAINT Penumpang_PK PRIMARY KEY (emailPenumpang) ENABLE
);

CREATE TABLE Flight
(
    Flight_Code VARCHAR(10),
    Kota_Asal VARCHAR(20),
    Kota_Tujuan VARCHAR(20),
    Tanggal_Berangkat DATE,
    Jumlah_Penumpang INTEGER,
    Jenis_Tiket VARCHAR (20),
    Durasi_Penerbangan TIMESTAMP WITH TIME ZONE,
    CONSTRAINT Flight_PK PRIMARY KEY (Flight_Code) ENABLE
);

CREATE TABLE Search_n_Select
(
    chosen_id VARCHAR (255),
    emailPenumpang VARCHAR(30),
    Flight_Code VARCHAR(10),
    CONSTRAINT Search_n_Select_PK PRIMARY KEY (chosen_id) ENABLE,
    CONSTRAINT Search_n_Select_FK1 FOREIGN KEY (emailPenumpang) REFERENCES penumpang (emailPenumpang),
    CONSTRAINT Search_n_Select_FK2 FOREIGN KEY (Flight_Code) REFERENCES flight (Flight_Code)
);

CREATE TABLE Booking_Details
(
    Booking_ID VARCHAR (255),
    Full_Name VARCHAR (255),
    Passenger_Email VARCHAR (255),
    Passenger_HP VARCHAR (255),
    Deparature_Date DATE,
    Baggage_Facilities INTEGER,
    Insurance_Option CHAR(1),
    Ticket_Price INTEGER,
    chosen_id VARCHAR (255),
    CONSTRAINT Booking_Details_PK PRIMARY KEY (Booking_ID) ENABLE,
    CONSTRAINT Booking_Details_FK1 FOREIGN KEY (chosen_id) REFERENCES Search_n_Select (chosen_id)
);

CREATE TABLE Payment(
    Payment_Code VARCHAR(255) NOT NULL,
    Payment_Deadline TIMESTAMP WITH TIME ZONE,
    Payment_Method VARCHAR2(255),
    Admin_Fee INTEGER,
    Total_Paid INTEGER,
    Booking_ID VARCHAR2(255),
    Booking_Code VARCHAR2(15),
    CONSTRAINT Payment_PK PRIMARY KEY (Payment_Code) ENABLE,
    CONSTRAINT Payment_FK1 FOREIGN KEY (Booking_ID) REFERENCES Booking_Details (Booking_ID),
    CONSTRAINT Payment_FK2 FOREIGN KEY (Booking_Code) REFERENCES e_Ticket (Booking_Code)
);

CREATE TABLE e_Ticket
(
    Booking_Code VARCHAR(15),
    Nama_Penumpang VARCHAR(30),
    Jenis_Tiket VARCHAR(10),
    Bagasi_Penumpang INTEGER,
    Durasi_Penerbangan TIMESTAMP WITH TIME ZONE,
    Rute_Penerbangan VARCHAR(30),
    Airlines_Name VARCHAR(30),
    CONSTRAINT e_Ticket_PK PRIMARY KEY (Booking_Code) ENABLE
);

alter session set nls_date_format= 'dd-month-yyyy';

INSERT INTO PENUMPANG VALUES('andika@gmail.com','082235467890','Andika',null,'gatau');
INSERT INTO PENUMPANG VALUES('annisaamalik@gmail.com','081280639988','Annisa Malik',null,'durumbuspuy');
INSERT INTO PENUMPANG VALUES('githacantique@gmail.com','082290232184','Anggitha Yohana Clara',null,'loveyourself');
INSERT INTO PENUMPANG VALUES('yudagosssip@gmail.com','082229754902','Yuda Prasetia',null,'parampa');
INSERT INTO PENUMPANG VALUES('ch123@gmail.com','0812309726312','Chairful  Vikri',null,'sayarempong');
INSERT INTO PENUMPANG VALUES('taranta@gmail.com','087092345678','Thalita Kayla',null,'qwertyop');
INSERT INTO PENUMPANG VALUES('pohonhijau@gmail.com','0812789090628','Green Burner',null,'doremi');
INSERT INTO PENUMPANG VALUES('asdfghjklad@gmail.com','081234568312','John Marvel',null,'inthedream');
INSERT INTO PENUMPANG VALUES('durumbuboy@gmail.com','082267812890','Doraemon Hilss',null,'restinpeace');
INSERT INTO PENUMPANG VALUES('whatyouseeisnotwhatitseems@gmail.com','081280639912','William Dieas',null,'password');
INSERT INTO PENUMPANG VALUES('totoroiscute@yahoo.com','082235480976','Jeon Soo You',null,'sumberairbersih');
INSERT INTO PENUMPANG VALUES('sayurbayam@yahoo.com','082280767345','Nuraini Niken',null,'sheisbeautiful');
INSERT INTO PENUMPANG VALUES('bluesky1221@gmail.com','081122334455','Pelita Angkasa',null,'birulangit');
INSERT INTO PENUMPANG VALUES('kerisajaib@gmail.com','081565467890','Faris Karim',null,'malesbanget');
INSERT INTO PENUMPANG VALUES('kacamatahitam@gmail.com','080985467890','Devani Permadi',null,'gituhaja');
INSERT INTO PENUMPANG VALUES('overlordgorengan@gmail.com','086339895890','Faizal Akbari',null,'1234hu321');
INSERT INTO PENUMPANG VALUES('permadihelmi@gmail.com','087635467534','Helmi Sendy Permadi',null,'47qwvsd');
INSERT INTO PENUMPANG VALUES('gerryFe@gmail.com','084563578725','Gerry Fernando',null,'0987sfdsd');
INSERT INTO PENUMPANG VALUES('zzez@gmail.com','085433123258','Zikri Pandu Hidayatulah',null,'!hjsdf');
INSERT INTO PENUMPANG VALUES('arl1234@gmail.com','082235534586','Aurelia Mahesa',null,'0vfsgawasad@r4%32');
INSERT INTO PENUMPANG VALUES('arianagrendong@gmail.com','081267450123','Ariana Venti',null,'thankunext');


INSERT INTO FLIGHT VALUES('001','BDO','DPS','20-December-2018',45,'FIRST','20-December-2018 10:23:54AM+07');
INSERT INTO FLIGHT VALUES('002','BDO','PLN','18-January-2018',10,'ECONOMY','19-January-2018 11:21:52PM+07');
INSERT INTO FLIGHT VALUES('003','WRT','DPS','06-February-2018',15,'BUSINESS','06-February-2018 00:23:14AM+07');
INSERT INTO FLIGHT VALUES('004','BDO','SAY','12-March-2018',51,'FIRST','12-March-2018 04:23:52AM+07');
INSERT INTO FLIGHT VALUES('005','BDO','MLE','21-April-2018',111,'ECONOMY','21-April-2018 09:23:54PM+07');
INSERT INTO FLIGHT VALUES('006','BRG','JKT','29-May-2018',34,'ECONOMY','29-May-2018 03:23:54PM+07');
INSERT INTO FLIGHT VALUES('007','JKT','SKT','21-June-2018',70,'FIRST','21-June-2018 01:23:00PM+07');
INSERT INTO FLIGHT VALUES('008','BTN','ACH','28-July-2018',123,'ECONOMY','28-July-2018 02:23:24PM+07');
INSERT INTO FLIGHT VALUES('009','BKS','KPS','17-August-2018',212,'FIRST','17-August-2018 10:23:44AM+07');
INSERT INTO FLIGHT VALUES('010','TGR','MNT','07-September-2018',70,'ECONOMY','07-September-2018 10:23:24PM+07');
INSERT INTO FLIGHT VALUES('011','MND','JKT','10-October-2018',167,'ECONOMY','10-October-2018 07:23:14PM+07');
INSERT INTO FLIGHT VALUES('012','JKT','BDO','15-November-2018',87,'BUSINESS','15-November-2018 11:23:24PM+07');
INSERT INTO FLIGHT VALUES('013','SYN','POS','13-December-2018',45,'ECONOMY','13-December-2018 02:43:50AM+07');
INSERT INTO FLIGHT VALUES('014','NYK','DPS','05-December-2018',76,'ECONOMY','05-December-2018 05:53:54AM+07');
INSERT INTO FLIGHT VALUES('015','MKS','DPS','11-January-2018',98,'ECONOMY','11-January-2018 06:13:44AM+07');
INSERT INTO FLIGHT VALUES('016','BDO','MKS','31-January-2018',56,'FIRST','31-January-2018 08:23:54AM+07');
INSERT INTO FLIGHT VALUES('017','BDO','DPS','30-March-2018',25,'FIRST','30-March-2018 05:27:54AM+07');
INSERT INTO FLIGHT VALUES('018','BDO','NYK','21-April-2018',12,'BUSINESS','21-April-2018 07:53:54AM+07');
INSERT INTO FLIGHT VALUES('019','QWR','DPS','02-April-2018',10,'BUSINESS','02-April-2018 03:34:54AM+07');
INSERT INTO FLIGHT VALUES('020','BGR','NYK','21-May-2018',14,'BUSINESS','21-May-2018 02:11:54AM+07');


INSERT INTO SEARCH_N_SELECT VALUES('01','andika@gmail.com','001');
INSERT INTO SEARCH_N_SELECT VALUES('02','annisaamalik@gmail.com','020');
INSERT INTO SEARCH_N_SELECT VALUES('03','githacantique@gmail.com','003');
INSERT INTO SEARCH_N_SELECT VALUES('04','yudagosssip@gmail.com','011');
INSERT INTO SEARCH_N_SELECT VALUES('05','ch123@gmail.com','002');
INSERT INTO SEARCH_N_SELECT VALUES('06','taranta@gmail.com','007');
INSERT INTO SEARCH_N_SELECT VALUES('07','pohonhijau@gmail.com','004');
INSERT INTO SEARCH_N_SELECT VALUES('08','asdfghjklad@gmail.com','005');
INSERT INTO SEARCH_N_SELECT VALUES('09','durumbuboy@gmail.com','006');
INSERT INTO SEARCH_N_SELECT VALUES('10','totoroiscute@yahoo.com','008');
INSERT INTO SEARCH_N_SELECT VALUES('11','totoroiscute@yahoo.com','011');
INSERT INTO SEARCH_N_SELECT VALUES('12','sayurbayam@yahoo.com','009');
INSERT INTO SEARCH_N_SELECT VALUES('13','bluesky1221@gmail.com','001');
INSERT INTO SEARCH_N_SELECT VALUES('14','kerisajaib@gmail.com','013');
INSERT INTO SEARCH_N_SELECT VALUES('15','kacamatahitam@gmail.com','012');
INSERT INTO SEARCH_N_SELECT VALUES('16','overlordgorengan@gmail.com','014');
INSERT INTO SEARCH_N_SELECT VALUES('17','gerryFe@gmail.com','015');
INSERT INTO SEARCH_N_SELECT VALUES('18','zzez@gmail.com','019');
INSERT INTO SEARCH_N_SELECT VALUES('19','arl1234@gmail.com','016');
INSERT INTO SEARCH_N_SELECT VALUES('20','arianagrendong@gmail.com','018');
INSERT INTO SEARCH_N_SELECT VALUES('21','yudagosssip@gmail.com','011');
INSERT INTO SEARCH_N_SELECT VALUES('22','arianagrendong@gmail.com','018');
INSERT INTO SEARCH_N_SELECT VALUES('23','annisaamalik@gmail.com','001');
INSERT INTO SEARCH_N_SELECT VALUES('24','arianagrendong@gmail.com','010');

INSERT INTO BOOKING_DETAILS VALUES('001','I Gede Andika Yudantara','andika@gmail.com','082235467890','20-December-2018','20','N','5000000','01');
INSERT INTO BOOKING_DETAILS VALUES('002','Annisa Malik','annisamalik@gmail.com','081280639988','21-May-2018','20','Y','5500000','20');
INSERT INTO BOOKING_DETAILS VALUES('003','Anggita Yohana Clara','githacantique@gmail.com','082290232184','18-January-2018','20','N','5500000','03');
INSERT INTO BOOKING_DETAILS VALUES('004', 'Yuda Prasetia' , 'yudagosssip@gmail.com' , '082229754902' , '10-October-2018' , '20' , 'Y' , '600000' , '11');
INSERT INTO BOOKING_DETAILS VALUES('005', 'Chairful  Vikri' , 'ch123@gmail.com','0812309726312', '18-January-2018' , '20' , 'N', '480000' ,'02');
INSERT INTO BOOKING_DETAILS VALUES('006' , 'Green Burner' , 'pohonhijau@gmail.com','0812789090628', '21-June-2018', '20' , 'Y' , '605000' , '07');
INSERT INTO BOOKING_DETAILS VALUES('007' , 'John Marvel' , 'asdfghjklad@gmail.com','081234568312','12-March-2018', '20' , 'N' , '710000' , '04');
INSERT INTO BOOKING_DETAILS VALUES('008' , 'Doraemon Hilss', 'durumbuboy@gmail.com','082267812890','21-April-2018' ,  '20' , 'Y' , '480000', '05');
INSERT INTO BOOKING_DETAILS VALUES('009' , 'William Dieas' , 'whatyouseeisnotwhatitseems@gmail.com','081280639912', '29-May-2018', '20', 'N', '465000' , '06');
INSERT INTO BOOKING_DETAILS VALUES('010' , 'Jeon Soo You' , 'totoroiscute@yahoo.com','082235480976','21-April-2018' , '20' , 'Y' , '570000' , '08');
INSERT INTO BOOKING_DETAILS VALUES('011', 'Jeon Soo You', 'totoroiscute@yahoo.com', '082235480976' ,'10-October-2018', '20' , 'N','800000','11');
INSERT INTO BOOKING_DETAILS VALUES('012', 'Nuraini Niken', 'sayurbayam@yahoo.com', '082280767345', '17-August-2018' ,'20', 'Y', '700000', '09');
INSERT INTO BOOKING_DETAILS VALUES('013', 'Pelita Angkasa', 'bluesky1221@gmail.com','081122334455', '20-December-2018' ,'20', 'N','809000','01');
INSERT INTO BOOKING_DETAILS VALUES('014', 'Faris Karim' , 'kerisajaib@gmail.com','081565467890','13-December-2018' , '20','Y', '706000', '13');
INSERT INTO BOOKING_DETAILS VALUES('015', 'Devani Permadi', 'kacamatahitam@gmail.com','080985467890','15-November-2018'  ,'20','N','819000','12');
INSERT INTO BOOKING_DETAILS VALUES('016' , 'Faizal Akbari','overlordgorengan@gmail.com','086339895890', '05-December-2018' ,'20', 'Y', '670000', '14');
INSERT INTO BOOKING_DETAILS VALUES('017','Gerry Fernando', 'gerryFe@gmail.com','084563578725','11-January-2018' ,'20', 'N','819500','05');
INSERT INTO BOOKING_DETAILS VALUES('018','Zikri Pandu Hidayatulah','zzez@gmail.com','085433123258', '02-April-2018' ,'20', 'Y', '675000', '19');
INSERT INTO BOOKING_DETAILS VALUES('019', 'Aurelia Mahesa' , 'arl1234@gmail.com','082235534586', '31-January-2018','20', 'N','719500','16');
INSERT INTO BOOKING_DETAILS VALUES('020' , 'Ariana Venti', 'arianagrendong@gmail.com','081267450123', '21-April-2018' ,'20', 'Y', '475000', '18');
INSERT INTO BOOKING_DETAILS VALUES('021','Yuda Prasetia' , 'yudagosssip@gmail.com' , '082229754902' , '10-October-2018' , '20' , 'N','720500','11');
INSERT INTO BOOKING_DETAILS VALUES('022', 'Ariana Venti', 'arianagrendong@gmail.com','081267450123', '21-April-2018'  ,'20', 'N', '465000', '18');
INSERT INTO BOOKING_DETAILS VALUES('023','Annisa Malik','annisamalik@gmail.com','081280639988', '20-December-2018' , '20' , 'N','780000','01');
INSERT INTO BOOKING_DETAILS VALUES('024' ,'Ariana Venti', 'arianagrendong@gmail.com','081267450123', '07-September-2018' , 'Y', '485000', '10');


INSERT INTO E_TICKET VALUES ('5001','Andika','First',20,'20-December-2018 10:23:54AM+07','BDO-DPS','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5002','Annisa Malik','Business',5,'2-October-2018 10:23:54AM+07','BDO-CGK','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5003','Anggitha Yohana Clara','First',20,'11-December-2018 10:23:54AM+07','BDO-HLP','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5004','Yuda Prasetia','Business',30,'24-January-2018 10:23:54AM+07','BDO-DPS','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5005','Chairful Vikri','Business',25,'25-March-2018 10:23:54AM+07','BDO-DPS','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5006','Thalita Kayla','First',5,'10-May-2018 10:23:54AM+07','BDO-SUB','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5007','Green Burner','First',2,'14-October-2018 10:23:54AM+07','DPS-BDO','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5008','John Marvel','First',6,'1-December-2018 10:23:54AM+07','SUB-HLP','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5009','Doraemon Hilss','Economy',21,'24-December-2018 10:23:54AM+07','BDO-DPS','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5010','Jeon Soo You','Economy',25,'24-December-2018 10:23:54AM+07','SUB-DPS','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5011','Nuriani Niken','Economy',22,'2-December-2018 10:23:54AM+07','HLP-DPS','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5012','Pelita Angkasa','Economy',13,'10-December-2018 10:23:54AM+07','BDO-DPS','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5013','Faris Karim','Economy',15,'30-December-2018 10:23:54AM+07','HLP-DPS','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5014','Devani Permadi','Economy',4,'29-December-2018 10:23:54AM+07','CGK-DPS','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5015','Faizal Akbari','First',6,'28-December-2018 10:23:54AM+07','DPS-CGK','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5016','Helmi Sendy Permadi','First',27,'14-December-2018 10:23:54AM+07','DPS-HLP','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5017','Gerry Fernando','Business',17,'10-April-2018 10:23:54AM+07','DPS-SUB','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5018','Zikri Pandu Hidayatulah','First',13,'11-June-2018 10:23:54AM+07','SUB-CGK','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5019','Aurelia Mahesa','Economy',28,'17-December-2018 10:23:54AM+07','CGK-SUB','GARUDA INDONESIA');
INSERT INTO E_TICKET VALUES ('5020','Ariana Venti','First',21,'9-December-2018 10:23:54AM+07','HLP-BDO','GARUDA INDONESIA');

INSERT INTO PAYMENT VALUES('601','10-December-2018 10:23:54AM+07','Mobile Banking',10000,5010000,   '001','5001');
INSERT INTO PAYMENT VALUES('602','21-September-2018 10:23:54AM+07','ATM Transfer',80000,5580000,    '002','5002');
INSERT INTO PAYMENT VALUES('603','1-December-2018 10:23:54AM+07','Mobile Banking',60000,5560000,    '003','5003');
INSERT INTO PAYMENT VALUES('604','12-January-2018 10:23:54AM+07','Mobile Banking',50000,650000,     '004','5004');
INSERT INTO PAYMENT VALUES('605','15-March-2018 10:23:54AM+07','ATM Transfer',10000,500000,         '005','5005');
INSERT INTO PAYMENT VALUES('606','1-May-2018 10:23:54AM+07','ATM Transfer',50000,655000,            '006','5006');
INSERT INTO PAYMENT VALUES('607','4-October-2018 10:23:54AM+07','Mobile Banking',80000,790000,      '007','5007');
INSERT INTO PAYMENT VALUES('608','20-November-2018 10:23:54AM+07','Mobile Banking',10000,490000,    '008','5008');
INSERT INTO PAYMENT VALUES('609','14-December-2018 10:23:54AM+07','Mobile Banking',10000,475000,    '009','5009');
INSERT INTO PAYMENT VALUES('610','14-December-2018 10:23:54AM+07','ATM Transfer',10000,580000,    '010','5010');
INSERT INTO PAYMENT VALUES('611','22-November-2018 10:23:54AM+07','ATM Transfer',10000,810000,    '011','5011');
INSERT INTO PAYMENT VALUES('612','30-November-2018 10:23:54AM+07','Mobile Banking',10000,710000,  '012','5012');
INSERT INTO PAYMENT VALUES('613','20-December-2018 10:23:54AM+07','ATM Transfer',10000,819000,    '013','5013');
INSERT INTO PAYMENT VALUES('614','19-December-2018 10:23:54AM+07','Mobile Banking',10000,716000,    '014','5014');
INSERT INTO PAYMENT VALUES('615','18-December-2018 10:23:54AM+07','Mobile Banking',10000,829000,  '015','5015');
INSERT INTO PAYMENT VALUES('616','4-December-2018 10:23:54AM+07','ATM Transfer',20000,690000,       '016','5016');
INSERT INTO PAYMENT VALUES('617','1-April-2018 10:23:54AM+07','Mobile Banking',10000,829500,        '017','5017');
INSERT INTO PAYMENT VALUES('618','2-June-2018 10:23:54AM+07','Mobile Banking',10000,685000,       '018','5018');
INSERT INTO PAYMENT VALUES('619','7-December-2018 10:23:54AM+07','ATM Transfer',50000,769500,     '019','5019');
INSERT INTO PAYMENT VALUES('620','30-November-2018 10:23:54AM+07','ATM Transfer',10000,485000,    '020','5020');


SELECT namapenumpang || ' memiliki alamat email ' ||  emailpenumpang AS "DATA EMAIL" from penumpang;

SELECT full_name, sum(ticket_price)  AS "Jumlah yang Harus Dibayar", count(full_name) AS "Jumlah Booking" from booking_details group by full_name;

SELECT full_name, sum(ticket_price)  AS "Jumlah yang Harus Dibayar", count(full_name) AS "Jumlah Booking" , 
sum(total_paid) AS "YANG DIBAYARKAN", (sum(ticket_price)-sum(total_paid)-sum(admin_fee)) AS "Kembalian/Hutang" from booking_details
join payment using (booking_id) group by full_name;
