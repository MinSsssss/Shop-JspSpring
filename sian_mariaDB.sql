UPDATE tbl_member_auth 
SET auth = 'ROLE_ADMIN'
WHERE mem_id = 'admin';

insert into tbl_member_auth(mem_id,auth)
values('admin','ROLE_ADMIN');
USE sianmaria;

SELECT * FROM tbl_notice orders LIMIT 10;
SELECT mem_id FROM tbl_member
		WHERE mem_id = 'cda01';

Create Database sianmaria;

select * from tbl_member;
CREATE DATABASE `sian_db` /*!40100 COLLATE 'utf8_general_ci' */

select * from tbl_member_auth;

select * from tbl_category;

SELECT * from tbl_product;

		
select * from tbl_cart;

select * from tbl_order;

select * from tbl_order_detail;

select * from tbl_payment;

select * from tbl_category;

select * from tbl_wishlist;

select * from tbl_review;

select * from tbl_faq;

select * from tbl_notice;

select * from tbl_qna;

select * from tbl_product_images;

select * from tbl_courier;


SELECT HOST, USER, PASSWORD FROM USER;
GRANT ALL PRIVILEGES ON siandb.* TO 'siandb'@'%';
FLUSH PRIVILEGES;

SELECT qna_no,qna_title,cate.category_no,cate.category_name,
			qna_status,qna_date,qna_writer,mem_id 
 			FROM tbl_qna qna,tbl_category cate
 			WHERE qna.category_no=cate.category_no
 			
 			AND mem_id='cda09'
			ORDER BY qna_no desc
			LIMIT 0,5

CREATE USER 'siandb'@'%' IDENTIFIED BY 'vlsltl12';

SHOW DATABASES;


commit;
SHOW DATABASES;


CREATE TABLE tbl_member (
	mem_id	varchar(50) primary key	 NOT NULL,
	mem_pwd	varchar(100)		NOT NULL,
	mem_name	varchar(100)	    NOT NULL,
	mem_email	varchar(50)		NOT NULL,
	mem_tel	varchar(20)		NOT NULL,
	mem_joindate datetime default NOW(),
	enabled char(1) default '1',
    full_address VARCHAR(500) NOT NULL
);

insert into tbl_member
values('cda01','1234','dd','dd','dd',sysdate(),1,'123');
commit;

create table tbl_member_auth(
    mem_id varchar(50) not null,
    auth varchar(50)  default 'ROLE_MEMBER' not null,
    constraint fk_member_auth foreign key(mem_id) references tbl_member(mem_id)
    ON DELETE CASCADE
);

CREATE TABLE tbl_category (
	category_no	double,
    category_class varchar(30) NOT NULL,
	category_name	varchar(30) NOT NULL
);
ALTER TABLE tbl_category ADD UNIQUE(category_name,category_class);




SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TBL_FAQ';


CREATE TABLE tbl_product (
	product_no	double,
	category_no	double,
	product_name	varchar(100)	UNIQUE NOT NULL,
	product_price	int		NOT NULL,
	product_detail	varchar(2000)		NOT NULL,
    product_content varchar(2000),
    product_thumb_img	varchar(500),

	product_regdate	datetime default sysdate() NOT NULL,
    product_updatedate	datetime default sysdate() NOT NULL,
	product_hit	double default 0 NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY(product_no)
);

DELETE FROM tbl_product
		WHERE product_no=22;

CREATE TABLE tbl_product_images(
    uuid varchar(500) not null,
    uploadPath varchar(500) not null,
    fileName varchar(500) not null,
    filetype char(1) default 'i',
    product_no double
);
ALTER TABLE tbl_product_images ADD CONSTRAINT pk_product_images primary key(UUID);
ALTER TABLE tbl_product_images ADD CONSTRAINT fk_product_attach foreign key(product_no)
REFERENCES tbl_product(product_no) ON DELETE CASCADE;
ALTER TABLE tbl_product_images DROP CONSTRAINT fk_product_attach;
commit;


  
        

--  SQLINES DEMO *** �는 회원탈퇴 불가능

 SET sql_mode = '';
CREATE TABLE tbl_order (
	order_no varchar(18) primary key,
	mem_id	varchar(50)		NOT NULL,
	receiver_name	varchar(20)		NOT NULL,
	receiver_tel	varchar(20)		NOT NULL,
	receiver_addr	varchar(100)		NOT NULL,
   order_date	datetime	DEFAULT sysdate()	 NOT NULL,
   order_request_msg varchar(1000),
   order_status varchar(20) DEFAULT '결제완료' NOT NULL,
   merchant_uid varchar(100),
   imp_uid varchar(100),
    
    constraint fk_order_mem_id foreign key(mem_id) references tbl_member(mem_id)
);

select * from tbl_order
where order_status = '결제완료';
commit;

CREATE TABLE tbl_order_detail (
	order_detail_no	varchar(13) primary key,
	order_no	varchar(18)		NOT NULL,
	product_no	smallint		NOT NULL,
	order_qty	smallint default 0 not null ,
    sub_total double default 0 not null, 
    constraint fk_order_no foreign key(order_no) references tbl_order(order_no)
    ON DELETE CASCADE
);

CREATE TABLE tbl_courier(
    order_no varchar(18) UNIQUE,
    courier_code varchar(3),
    courier_name varchar(30),
    invoice_no double
);



CREATE TABLE tbl_payment(
    pay_no bigint primary key,
    mem_id varchar(50) NOT NULL,
    order_no varchar(18) NOT NULL,
    pay_method varchar(20) NOT NULL,
    pay_name varchar(100) NOT NULL,
    pay_amount double
);

commit;




--  SQLINES DEMO *** �도 리뷰는 남아있어야함

CREATE TABLE tbl_review (
	review_no double,
	order_detail_no	varchar(13) UNIQUE NOT NULL,
    mem_id	varchar(50) NOT NULL,
	review_title	varchar(300)	NOT NULL,
	review_content	varchar(1000),
	review_date	DATETIME DEFAULT sysdate() NOT NULL,
    review_star tinyint DEFAULT 0 NOT NULL,
	review_hit	double DEFAULT 0	NOT NULL,
    CONSTRAINT pk_review PRIMARY KEY(review_no)
);


--  SQLINES DEMO *** �면 카트도 없어져야함
--  SQLINES DEMO *** �면 카트에 있던 상품도 삭제되야함

create table tbl_cart(
    product_no double, 
    mem_id varchar(50)  not null,
    cart_qty smallint default 0 not null ,
    sub_total double default 0 not null, 
    cart_date datetime default sysdate() not null,
    constraint fk_cart_mem_id foreign key(mem_id) references tbl_member(mem_id)
    ON DELETE CASCADE,
    constraint fk_cart_product_no foreign key(product_no) references tbl_product(product_no)
    ON DELETE CASCADE
);
ALTER TABLE tbl_cart ADD UNIQUE(product_no,mem_id);
commit;


create table tbl_wishlist(
    product_no double, 
    mem_id varchar(50)  not null,
    wish_date datetime default sysdate() not null,
    constraint fk_wish_mem_id foreign key(mem_id) references tbl_member(mem_id)
    ON DELETE CASCADE,
    constraint fk_wish_product_no foreign key(product_no) references tbl_product(product_no)
    ON DELETE CASCADE
);

ALTER TABLE tbl_wishlist ADD UNIQUE(product_no,mem_id);


commit;
set names utf8;

CREATE TABLE tbl_qna (
	qna_no	double,
	category_no	double		NOT NULL,
    order_no varchar(18),
    mem_id varchar(50),
	qna_title	varchar(100)		NOT NULL,
    qna_pwd varchar(100) NOT NULL,
	qna_writer	varchar(12)		NOT NULL,
    qna_tel varchar(20) NOT NULL,
	qna_content	varchar(1000)		NOT NULL,
    qna_status varchar(20) DEFAULT '접수' NOT NULL,
	qna_date	datetime default sysdate()	NOT NULL,
    qna_answer varchar(1000),
	--  SQLINES DEMO *** ault 0	NOT NULL
    CONSTRAINT PRIMARY KEY(qna_no)
);
SELECT schema_name, default_character_set_name FROM information_schema.schemata;

CREATE TABLE tbl_faq (
	faq_no	double,
	category_no	double		NOT NULL,
	faq_title	varchar(100)		NOT NULL,
	faq_content	varchar(1000)		NOT NULL,
	faq_hit	double DEFAULT 0 	NOT NULL,
    CONSTRAINT PRIMARY KEY(faq_no)
);
ALTER DATABASE sianmaria DEFAULT CHARACTER SET utf8;

CREATE TABLE tbl_notice (
	notice_no	double,
	notice_title	varchar(100)	NOT NULL,
	notice_content	varchar(1000)	NOT NULL,
    notice_writer varchar(30) NOT NULL,
    notice_date DATETIME DEFAULT sysdate() NOT NULL,
	notice_hit	double DEFAULT 0 	NOT NULL,
    CONSTRAINT PRIMARY KEY(notice_no)
);



CREATE TABLE tbl_qna_comment (
	qna_com_no	varchar(13) primary key,
	qna_no	varchar(13) NOT NULL,
	qna_com_date	datetime	NULL,
	qna_com_content	varchar(1000)	NULL,
	qna_com_writer	varchar(12) NULL
);
CREATE SEQUENCE seq_category;
CREATE SEQUENCE seq_courier;
CREATE SEQUENCE seq_faq;
CREATE SEQUENCE seq_notice;
CREATE SEQUENCE seq_order_detail;
CREATE SEQUENCE seq_product;
CREATE SEQUENCE seq_qna;
CREATE SEQUENCE seq_review;
CREATE SEQUENCE seq_pay;
CREATE SEQUENCE seq_order;

COMMIT;

DROP SEQUENCE seq_faq;
DROP SEQUENCE seq_order_detail;
DROP SEQUENCE seq_pay_no;
DROP SEQUENCE seq_product;
DROP SEQUENCE seq_review;
DROP SEQUENCE seq_courier;
DROP SEQUENCE seq_category;
DROP SEQUENCE seq_qna;
DROP SEQUENCE seq_notice;
DROP SEQUENCE seq_pay;
DROP SEQUENCE seq_order;



drop table tbl_qna_comment;
drop table tbl_courier;
drop table tbl_product_images;
drop table tbl_qna;
drop table tbl_notice;
drop table tbl_faq;
drop table tbl_review;
drop table tbl_payment;
drop table tbl_order_detail;
drop table tbl_order;
drop table tbl_wishlist;
drop table tbl_cart;
drop table tbl_product;
drop table tbl_category;
drop table tbl_member_auth;
drop table tbl_member;