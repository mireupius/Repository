create table customer_reg(

csm_id varchar2(12 char) primary key,
csm_pw varchar2(15 char) not null,
csm_name varchar2(10 char) not null,
csm_birth date not null,
csm_phoneNo varchar2(11 char) not null,
csm_emailAddress varchar2(30 char) not null

);

select * from CUSTOMER_REG;
select * from SELLER_REG;

create table seller_reg(

sl_id varchar2(12 char) primary key,
sl_pw varchar2(15 char) not null,
sl_coName varchar2(10 char) not null,
sl_coRegNo varchar2(10 char) not null,
sl_phoneNo varchar2(11 char) not null,
sl_emailAddress varchar2(30 char) not null

);

select * from seller_reg;

create table membership(
ms_id varchar2(12 char) primary key,
ms_grade varchar2(5 char) not null,
ms_totalBuy number(10) not null,
ms_point number(7) not null
);

create table questionAnswer(
qa_no number(4) primary key,
qa_orderNo varchar2(13 char) not null,
qa_csm_id varchar2(12 char) not null,
qa_pName varchar2(50 char) not null,
qa_question varchar2(100 char) not null,
qa_answer varchar2(100 char) not null,
qa_regDate date not null,
);

create table productReview(

pr_no number(4) primary key,
pr_orderNo varchar2(13 char) not null,
pr_csm_id varchar2(12 char) not null,
pr_comment varchar2(100 char) not null,
pr_pCode number(13) not null,
pr_pName varchar2(50 char) not null,
pr_star number(1) not null,
);


create table test_product(
tp_seq number(3) primary key,
tp_no varchar2(20 char) not null,
tp_name varchar2(13 char) not null
);

create sequence test_product_seq;


drop table test_product cascade constraint purge;  
select * from test_product;


