drop table tbl_qna_comment;
drop table tbl_qna_catecory;
drop table tbl_qna;
--drop table tbl_cart_product;
drop table tbl_review_comment;
drop table tbl_review;
drop table tbl_order_detail;
drop table tbl_order;

drop table tbl_cart;
drop table tbl_product;
drop table tbl_category;
drop table tbl_member_auth;
drop table tbl_member;

UPDATE tbl_member_auth
SET auth = 'ROLE_ADMIN'
WHERE mem_id = 'cda01';

SELECT mem.mem_id,mem_pwd,mem_name,mem_email,mem_tel,mem_joindate,enabled, auth
			FROM tbl_member mem LEFT OUTER JOIN tbl_member_auth auth on mem.mem_id = auth.mem_id
			WHERE mem.mem_id = 'admin1';

insert into tbl_member values('admin2','1234','test','test@test.com','1234',sysdate,'1');
insert into tbl_member_auth values('admin2','ROLE_ADMIN');
commit;

DELETE FROM tbl_cart   
WHERE product_no=(SELECT product_no FROM tbl_product WHERE product_name='고고고고');
--create SEQUENCE seq_tbl_member;
select * from tbl_member;
select * from tbl_member_auth;
select * from tbl_category;
select * from tbl_product;
select * from tbl_cart;
update tbl_cart
set cart_qty=7,
sub_total=(select product_price from tbl_product where product_no=102 )
where product_no=102 AND mem_id='cda03';

commit;
SELECT pro.product_image1,pro.product_name,pro.product_price,cart.cart_qty,cart.sub_total
FROM tbl_product pro,tbl_cart cart
WHERE pro.product_no=cart.product_no AND cart.mem_id='cda03';

UPDATE tbl_cart
		SET cart_qty=9,
		sub_total=((SELECT product_price FROM tbl_product WHERE product_no=102 )*9)
		WHERE product_no=102 AND mem_id='cda03';

CREATE TABLE tbl_member (
	--mem_no	varchar2(13) primary key,
	mem_id	varchar2(50) primary key	 NOT NULL,
	mem_pwd	varchar2(100)		NOT NULL,
	mem_name	varchar2(100)	    NOT NULL,
	mem_email	varchar2(50)		NOT NULL,
	mem_tel	varchar2(20)		NOT NULL,
	mem_joindate date default sysdate,
	enabled char(1) default '1'
   
);

create table tbl_member_auth(
    mem_id varchar2(50) not null,
    auth varchar2(50)  default 'ROLE_MEMBER' not null,
    constraint fk_member_auth foreign key(mem_id) references tbl_member(mem_id)
);
select * from tbl_product;
select * from tbl_category;
select * from tbl_cart_product;
insert all
into tbl_member(mem_id,mem_pwd,mem_name,mem_email,mem_tel)
values ('id','1234','ad','ad@ad','0101010')
into tbl_member_auth (mem_id,auth) VALUES ('id','ROLE_MEMBER')
select * from dual;





CREATE TABLE tbl_order (
	order_no	varchar2(13) primary key,
	mem_id	varchar2(50)		NOT NULL,
	order_date	date		 NOT NULL,
	receiver_name	varchar2(20)		NOT NULL,
	receiver_tel	varchar2(20)		NOT NULL,
	receiver_addr1	varchar2(100)		NOT NULL,
	receicer_addr2	varchar2(100)		NOT NULL
);

CREATE TABLE tbl_order_detail (
	order_detail_no	varchar2(13) primary key,
	order_no	varchar2(13)		NOT NULL,
	product_no	varchar2(13)		NOT NULL,
	order_qty	number(3)		NULL,
	order_status	varchar2(20)		NULL
);

CREATE TABLE tbl_category (
	category_no	number(2) primary key,
	category_name	varchar2(30)	NOT NULL
);
CREATE SEQUENCE seq_tbl_product_no
    INCREMENT BY 1
    START WITH 101
    MINVALUE 101
    MAXVALUE 999
    NOCYCLE
    NOCACHE
    NOORDER;

CREATE TABLE tbl_product (
	product_no	number(3) primary key,
	category_no	number(2) default 10 NOT NULL,
	product_name	varchar2(100)	NOT NULL,
	product_price	number(6)		NOT NULL,
	product_detail	varchar2(1000)		NOT NULL,
	product_image1	varchar2(1000) NOT NULL,
	--product_image2	varchar2(1000)		NULL,
	product_regdate	date default sysdate NOT NULL,
    product_updatedate	date default sysdate NOT NULL,
	product_hit	number default 0 NOT NULL
);
INSERT INTO tbl_product(product_no,category_no,product_name,product_price,
 		product_detail,product_image1)
 		VALUES (seq_tbl_product_no.nextval,(
 		SELECT category_no FROM tbl_category WHERE category_name='커피'
 		)
 		,'커피1',12345,
 		'하하하하','qwe.qwe');


ALTER TABLE tbl_product ADD CONSTRAINT tbl_cate_no_pk FOREIGN KEY(category_no) REFERENCES tbl_category(category_no);

CREATE TABLE tbl_review (
	review_no	varchar2(13) primary key,
	product_no	varchar2(13)		NOT NULL,
	review_title	varchar2(100)		NULL,
	revire_writer	varchar2(12)		NULL,
	review_content	varchar2(1000)		NULL,
	review_date	date		NULL,
	review_hit	number		NULL
);

CREATE TABLE tbl_review_comment (
	review_com_no	varchar2(13) primary key,
	review_no	varchar2(13)		NOT NULL,
	review_com_date	date		NULL,
	review_com_content	varchar2(1000)		NULL,
	review_com_writer	varchar2(12)		NULL
);
--CREATE SEQUENCE seq_tbl_cart_no;
select * from tbl_cart;
create table tbl_cart(
    product_no number(3), 
    mem_id varchar2(50)  not null,
    cart_qty number(3) default 0 not null ,
    sub_total number default 0 not null, 
    constraint fk_cart_mem_id foreign key(mem_id) references tbl_member(mem_id),
    constraint fk_cart_product_no foreign key(product_no) references tbl_product(product_no)
);
ALTER TABLE tbl_cart ADD UNIQUE(product_no,mem_id);
commit;
--create table tbl_cart_product(
--    product_no number(3),
--    cart_no number,
--    cart_qty number(3) default 0 not null ,
--    cart_price number default 0 not null,
--    constraint fk_cart_product_no foreign key(product_no) references tbl_product(product_no),
--    constraint fk_cart_no foreign key(cart_no) references tbl_cart(cart_no)
--);
 		SELECT pro.product_image1,pro.product_name,pro.product_price,cp.cart_qty,cp.cart_price
		FROM tbl_product pro,tbl_cart cart,tbl_cart_product cp
		WHERE cart.cart_no=cp.cart_no AND cp.product_no=pro.product_no AND cart.mem_id='cda03';

CREATE TABLE tbl_qna (
	qna_no	varchar2(13) primary key,
	qna_cate_no	varchar2(13)		NOT NULL,
	qna_title	varchar2(100)		NULL,
	qna_writer	varchar2(12)		NULL,
	qna_content	varchar2(1000)		NULL,
	qna_date	date		NULL,
	qna_hit	number		NULL
);

CREATE TABLE tbl_qna_catecory (
	qna_cate_no	varchar2(13) primary key,
	qna_cate_name	varchar2(50)		NULL
);

CREATE TABLE tbl_qna_comment (
	qna_com_no	varchar2(13) primary key,
	qna_no	varchar2(13) NOT NULL,
	qna_com_date	date	NULL,
	qna_com_content	varchar2(1000)	NULL,
	qna_com_writer	varchar2(12) NULL
);

