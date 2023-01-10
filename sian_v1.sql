UPDATE tbl_member_auth
SET auth = 'ROLE_ADMIN'
WHERE mem_id = 'cda01';
insert into tbl_member_auth(mem_id,auth)
values('cda010','ROLE_ADMIN');


commit;

DELETE FROM tbl_cart   
WHERE product_no=(SELECT product_no FROM tbl_product WHERE product_name='고고고고');
--create SEQUENCE seq_tbl_member;

select * from tbl_member;
select * from tbl_member_auth;
select * from tbl_category;
select * from tbl_product;
select * from tbl_cart;
select * from tbl_order;
select * from tbl_order_detail;
select * from tbl_wishlist;
select * from tbl_review;
select * from tbl_faq;
select * from tbl_notice;
select * from tbl_qna;
select * from tbl_product_images;
commit;

select



update tbl_order
set order_status = '배송 완료'
where order_no = 45;
commit;



CREATE TABLE tbl_member (
	--mem_no	varchar2(13) primary key,
	mem_id	varchar2(50) primary key	 NOT NULL,
	mem_pwd	varchar2(100)		NOT NULL,
	mem_name	varchar2(100)	    NOT NULL,
	mem_email	varchar2(50)		NOT NULL,
	mem_tel	varchar2(20)		NOT NULL,
	mem_joindate date default sysdate,
	enabled char(1) default '1',
    full_address VARCHAR2(500) NOT NULL
);

create table tbl_member_auth(
    mem_id varchar2(50) not null,
    auth varchar2(50)  default 'ROLE_MEMBER' not null,
    constraint fk_member_auth foreign key(mem_id) references tbl_member(mem_id)
    ON DELETE CASCADE
);
CREATE TABLE tbl_category (
	category_no	number,
    category_class varchar2(30) NOT NULL,
	category_name	varchar2(30) NOT NULL
);

ALTER TABLE tbl_category ADD UNIQUE(category_name,category_class);


CREATE SEQUENCE seq_category;
    
CREATE TABLE tbl_product_images(
    uuid varchar2(100) not null,
    uploadPath varchar2(200) not null,
    fileName varchar2(100) not null,
    filetype char(1) default 'i',
    product_no number
);

ALTER TABLE tbl_product_images ADD CONSTRAINT pk_product_images primary key(uuid);
ALTER TABLE tbl_product_images ADD CONSTRAINT fk_product_attach foreign key(product_no)
REFERENCES tbl_product(product_no);


CREATE TABLE tbl_product (
	product_no	number primary key,
	category_no	number,
	product_name	varchar2(100)	UNIQUE NOT NULL,
	product_price	number(6)		NOT NULL,
	product_detail	varchar2(1000)		NOT NULL,
    product_thumb_img	varchar2(500),
	--product_image2	varchar2(1000)		NULL,
    
	product_regdate	date default sysdate NOT NULL,
    product_updatedate	date default sysdate NOT NULL,
	product_hit	number default 0 NOT NULL
);

--배송완료 전에는 회원탈퇴 불가능
CREATE TABLE tbl_order (
	order_no varchar2(13) primary key,
	mem_id	varchar2(50)		NOT NULL,
	receiver_name	varchar2(20)		NOT NULL,
	receiver_tel	varchar2(20)		NOT NULL,
	receiver_addr	varchar2(100)		NOT NULL,
    order_date	date	DEFAULT sysdate	 NOT NULL,
    order_request_msg varchar2(1000),
    order_status varchar2(20) default '결제 완료' NOT NULL,
    constraint fk_order_mem_id foreign key(mem_id) references tbl_member(mem_id)
);
commit;
CREATE TABLE tbl_order_detail (
	order_detail_no	varchar2(13) primary key,
	order_no	varchar2(16)		NOT NULL,
	product_no	number(3)		NOT NULL,
	order_qty	number(3) default 0 not null ,
    sub_total number default 0 not null, 
    constraint fk_order_no foreign key(order_no) references tbl_order(order_no)
    ON DELETE CASCADE
);

CREATE SEQUENCE seq_order_no;
CREATE SEQUENCE seq_order_detail_no;
DROP SEQUENCE seq_order_no;
DROP SEQUENCE seq_order_detail_no;
CREATE SEQUENCE seq_tbl_product_no
    INCREMENT BY 1
    START WITH 101
    MINVALUE 101
    MAXVALUE 999
    NOCYCLE
    NOCACHE
    NOORDER;


--ALTER TABLE tbl_product ADD CONSTRAINT tbl_cate_no_pk FOREIGN KEY(category_no) REFERENCES tbl_category(category_no);

CREATE SEQUENCE seq_review_no;
DROP SEQUENCE seq_review_no;
--회원이 탈퇴해도 리뷰는 남아있어야함
CREATE TABLE tbl_review (
	review_no	number primary key,
	order_detail_no	varchar2(13) UNIQUE NOT NULL,
    mem_id	varchar2(50) NOT NULL,
	review_title	varchar2(300)	NOT NULL,
	review_content	varchar2(1000),
	review_date	DATE DEFAULT sysdate NOT NULL,
    review_star number(1) DEFAULT 0 NOT NULL,
	review_hit	number DEFAULT 0	NOT NULL
);



CREATE TABLE tbl_review_comment (
	review_com_no	number primary key,
	review_no	number		NOT NULL,
	review_com_date	DATE DEFAULT sysdate	NOT NULL,
	review_com_content	varchar2(1000)		NULL,
	review_com_writer	varchar2(12)		NULL,
    constraint fk_review foreign key(review_no) references tbl_review(review_no)
);

--회원이 탈퇴하면 카트도 없어져야함
--상품이 삭제되면 카트에 있던 상품도 삭제되야함
create table tbl_cart(
    product_no number, 
    mem_id varchar2(50)  not null,
    cart_qty number(3) default 0 not null ,
    sub_total number default 0 not null, 
    constraint fk_cart_mem_id foreign key(mem_id) references tbl_member(mem_id)
    ON DELETE CASCADE,
    constraint fk_cart_product_no foreign key(product_no) references tbl_product(product_no)
    ON DELETE CASCADE
);
ALTER TABLE tbl_cart ADD UNIQUE(product_no,mem_id);

create table tbl_wishlist(
    product_no, 
    mem_id varchar2(50)  not null,
    constraint fk_wish_mem_id foreign key(mem_id) references tbl_member(mem_id)
    ON DELETE CASCADE,
    constraint fk_wish_product_no foreign key(product_no) references tbl_product(product_no)
    ON DELETE CASCADE
);

ALTER TABLE tbl_wishlist ADD UNIQUE(product_no,mem_id);



commit;

CREATE TABLE tbl_qna (
	qna_no	number primary key,
	category_no	number		NOT NULL,
	qna_title	varchar2(100)		NOT NULL,
	qna_writer	varchar2(12)		NOT NULL,
	qna_content	varchar2(1000)		NOT NULL,
	qna_date	date default sysdate	NOT NULL,
	qna_hit	number default 0	NOT NULL
);


CREATE TABLE tbl_faq (
	faq_no	number primary key,
	category_no	number		NOT NULL,
	faq_title	varchar2(100)		NOT NULL,
	faq_content	varchar2(1000)		NOT NULL,
	faq_hit	number DEFAULT 0 	NOT NULL
);
CREATE SEQUENCE seq_faq;

CREATE TABLE tbl_notice (
	notice_no	number(3) primary key,
	notice_title	varchar2(100)	NOT NULL,
	notice_content	varchar2(1000)	NOT NULL,
    notice_writer varchar2(30) NOT NULL,
    notice_date DATE DEFAULT sysdate NOT NULL,
	notice_hit	number DEFAULT 0 	NOT NULL
);



CREATE SEQUENCE seq_notice;


CREATE TABLE tbl_qna_comment (
	qna_com_no	varchar2(13) primary key,
	qna_no	varchar2(13) NOT NULL,
	qna_com_date	date	NULL,
	qna_com_content	varchar2(1000)	NULL,
	qna_com_writer	varchar2(12) NULL
);

drop table tbl_product_images;
drop table tbl_qna_comment;
drop table tbl_qna;
drop table tbl_notice;
drop table tbl_faq;
drop table tbl_review_comment;
drop table tbl_review;
drop table tbl_order_detail;
drop table tbl_order;
drop table tbl_wishlist;
drop table tbl_cart;
drop table tbl_product;
drop table tbl_category;
drop table tbl_member_auth;
drop table tbl_member;