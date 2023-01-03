

UPDATE tbl_member_auth
SET auth = 'ROLE_ADMIN'
WHERE mem_id = 'cda01';
insert into tbl_member_auth(mem_id,auth)
values('cda01','ROLE_ADMIN');


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


select order_no
FROM (SELECT * FROM tbl_order ORDER BY order_date DESC)
WHERE ROWNUM=1 AND mem_id='cda02';

		SELECT re.review_no, od.order_detail_no, re.review_star,
		re.review_title, re.review_content, re.review_date,
		pro.product_image1, pro.product_name, re.mem_id
        
		FROM tbl_review re,tbl_order_detail od,tbl_product pro
        
		WHERE re.order_detail_no=od.order_detail_no
		AND od.product_no=pro.product_no;

commit;

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
ALTER TABLE tbl_member ADD full_address VARCHAR2(500);
create table tbl_member_auth(
    mem_id varchar2(50) not null,
    auth varchar2(50)  default 'ROLE_MEMBER' not null,
    constraint fk_member_auth foreign key(mem_id) references tbl_member(mem_id)
);
CREATE TABLE tbl_category (
	category_no	number(2) primary key,
	category_name	varchar2(30)	NOT NULL
);
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

CREATE TABLE tbl_order (
	order_no varchar2(13) primary key,
	mem_id	varchar2(50)		NOT NULL,
	receiver_name	varchar2(20)		NULL,
	receiver_tel	varchar2(20)		NULL,
	receiver_addr1	varchar2(100)		NULL,
	receicer_addr2	varchar2(100)		NULL,
    order_date	date	DEFAULT sysdate	 NOT NULL,
    order_request_msg varchar2(1000),
    order_status varchar2(20) default '결제 완료' NOT NULL,
    constraint fk_order_mem_id foreign key(mem_id) references tbl_member(mem_id)
);

CREATE TABLE tbl_order_detail (
	order_detail_no	varchar2(13) primary key,
	order_no	varchar2(16)		NOT NULL,
	product_no	number(3)		NOT NULL,
	order_qty	number(3) default 0 not null ,
    sub_total number default 0 not null, 
    constraint fk_order_no foreign key(order_no) references tbl_order(order_no)
    ON DELETE CASCADE,
    constraint fk_order_product_no foreign key(product_no) references tbl_product(product_no)
    
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


ALTER TABLE tbl_product ADD CONSTRAINT tbl_cate_no_pk FOREIGN KEY(category_no) REFERENCES tbl_category(category_no);

CREATE SEQUENCE seq_review_no;
CREATE TABLE tbl_review (
	review_no	number primary key,
	order_detail_no	varchar2(13)  NOT NULL,
    mem_id	varchar2(50) NOT NULL,
	review_title	varchar2(300)	NOT NULL,
	review_content	varchar2(1000),
	review_date	DATE DEFAULT sysdate NOT NULL,
    review_star number(1) DEFAULT 0 NOT NULL,
	review_hit	number DEFAULT 0	NOT NULL
    
);
ALTER TABLE tbl_review ADD UNIQUE(order_detail_no);



CREATE TABLE tbl_review_comment (
	review_com_no	number primary key,
	review_no	number		NOT NULL,
	review_com_date	DATE DEFAULT sysdate	NOT NULL,
	review_com_content	varchar2(1000)		NULL,
	review_com_writer	varchar2(12)		NULL,
    constraint fk_review foreign key(review_no) references tbl_review(review_no)
);

create table tbl_cart(
    product_no number(3), 
    mem_id varchar2(50)  not null,
    cart_qty number(3) default 0 not null ,
    sub_total number default 0 not null, 
    constraint fk_cart_mem_id foreign key(mem_id) references tbl_member(mem_id),
    constraint fk_cart_product_no foreign key(product_no) references tbl_product(product_no)
);
ALTER TABLE tbl_cart ADD UNIQUE(product_no,mem_id);
create table tbl_wishlist(
    product_no number(3), 
    mem_id varchar2(50)  not null,
    constraint fk_wish_mem_id foreign key(mem_id) references tbl_member(mem_id),
    constraint fk_wish_product_no foreign key(product_no) references tbl_product(product_no)
);
ALTER TABLE tbl_wishlist ADD UNIQUE(product_no,mem_id);


commit;

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

drop table tbl_qna_comment;
drop table tbl_qna_catecory;
drop table tbl_qna;
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