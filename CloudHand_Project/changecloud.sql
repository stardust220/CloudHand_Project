DROP DATABASE IF EXISTS cloudhand;
CREATE DATABASE cloudhand DEFAULT CHARSET=utf8;

USE cloudhand;

DROP TABLE IF EXISTS customers;
CREATE TABLE  customers (
  id char(10) NOT NULL,
  password varchar(20) NOT NULL,
  name varchar(20) NOT NULL,
  email varchar(30) NOT NULL,
  gender char(1) NOT NULL,
  birthday date DEFAULT NULL,
  phone varchar(20) DEFAULT NULL,
  address varchar(100) DEFAULT NULL,
  married tinyint(1) NOT NULL DEFAULT '0',
  blood_type varchar(2) DEFAULT NULL,
  type varchar(10) DEFAULT 'Customer',
  discount int(10) unsigned DEFAULT 0,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO customers (id, password, name, email, gender)
VALUES('A123456789','123456','張三','sammul.chang.tw@gmail.com','M');

INSERT INTO customers (id, password, name, email, gender,birthday,phone,address,married,blood_type,type,discount)
VALUES('A223456781','123456','林梅莉','marie.lin.tw@gmail.com','F',
    '1996-9-20','0225149191','台北市復興北路99號14F',true,'B','VIP',15);
    
DROP TABLE IF EXISTS category;
CREATE TABLE  category (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(45) NOT NULL,
  /*contactor varchar(20) NOT NULL,*/
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO category(id,name)
VALUES(1, 'Logo');
INSERT INTO category(id,name)
VALUES(2, 'Translator');
INSERT INTO category(id,name)
VALUES(3, 'Business');
INSERT INTO category(id,name)
VALUES(4, 'Video');
INSERT INTO category(id,name)
VALUES(5, 'Programming');

DROP TABLE IF EXISTS services;
CREATE TABLE  services (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  title varchar(40) NOT NULL,
  description varchar(100) DEFAULT NULL,
  author_name varchar(20) NOT NULL,
  list_price double unsigned NOT NULL,
  extra_fees int(10) unsigned NULL DEFAULT '100',
  category_id int(10) unsigned NOT NULL,
  photo_url varchar(200) DEFAULT NULL,
  review int(1) unsigned NULL DEFAULT '3',

  PRIMARY KEY (id),
  KEY FK_services_category (category_id),
  CONSTRAINT FK_services_category FOREIGN KEY (category_id) REFERENCES category (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Services(id,title,author_name,list_price,extra_fees,category_id,photo_url,review)
VALUES(1, 'English logo Design','XavierYu',1178,100,1,'http://99job.tw/wp-content/uploads/2016/06/117-300x207.jpg',1);

INSERT INTO Services(id,title,author_name,list_price,extra_fees,category_id,photo_url,review)
VALUES(2, 'Business LOGO DESIGN','Kingword',1074,350,1,'http://99job.tw/wp-content/uploads/2016/01/FireShot-Capture-22-do-flat-logo-desi_-https___www.fiverr.com_professional_d_do-flat-logo-design-300x207.png',1);

INSERT INTO Services(id,title,author_name,list_price,extra_fees,category_id,photo_url,review)
VALUES(3, 'WangIn-Ne Logo Design','WangYiRen',1005,50,1,'http://99job.tw/wp-content/uploads/2016/06/49-300x207.jpg',4);

INSERT INTO Services(id,title,author_name,list_price,extra_fees,category_id,photo_url,review)
VALUES(4, 'JackyChen Logo Design','Homeman',972,200,1,'http://99job.tw/wp-content/uploads/2016/06/d8d187d3e4c89239c08877de12443f196da7fe79-300x207.jpg',2);

INSERT INTO Services(id,title,author_name,list_price,extra_fees,category_id,photo_url,review)
VALUES(5, '500 Words Ghost Writer','Eeee',1162,50,2,'http://99job.tw/wp-content/uploads/2016/01/aaa1-300x207.png',5);

INSERT INTO Services(id,title,author_name,list_price,extra_fees,category_id,photo_url,review)
VALUES(6, 'Chinese-English Translation','Aytranslator',917,350,2,'http://99job.tw/wp-content/uploads/2016/07/1335484306517-300x207.jpg',5);

INSERT INTO Services(id,title,author_name,list_price,extra_fees,category_id,photo_url,review)
VALUES(7, 'Create Transcript for your Video','Nearkao',908,200,2,'http://99job.tw/wp-content/uploads/2016/03/product-pic-4-268x158.png',4);

INSERT INTO Services(id,title,author_name,list_price,extra_fees,category_id,photo_url,review)
VALUES(8, 'Check Your LinkedIn Profile','Michael',1161,200,2,'http://99job.tw/wp-content/uploads/2016/03/linkedin-blunders1-300x207.jpg',1);

INSERT INTO Services(id,title,author_name,list_price,extra_fees,category_id,photo_url,review)
VALUES(9, 'English translation for your video','mollymao',1016,100,2,'https://cldn0.fiverrcdn.com/fiverr/t_medium5_x2/gigs/1516019/original/b709118c3dead33342178683f7fe518614557a44.jpg',1);

INSERT INTO Services(id,title,author_name,list_price,extra_fees,category_id,photo_url,review)
VALUES(10, 'Write contracts or any agreement','Fan_LI_YE',904,150,3,'https://cldn0.fiverrcdn.com/fiverr/t_main2_video/v1474616387/vzrthumb/3298335/image',2);