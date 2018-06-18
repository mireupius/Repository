create table customer_reg(
csm_id varchar2(12 char) primary key,
csm_pw varchar2(15 char) not null,
csm_name varchar2(10 char) not null,
csm_birth date not null,
csm_phoneNo varchar2(11 char) not null,
csm_emailAddress varchar2(30 char) not null
);

select * from customer_reg;

create table seller_reg(
sl_id varchar2(12 char) primary key,
sl_pw varchar2(15 char) not null,
sl_coName varchar2(10 char) not null,
sl_coRegNo varchar2(10 char) not null,
sl_phoneNo varchar2(11 char) not null,
sl_emailAddress varchar2(30 char) not null
);

create table membership(
ms_csm_id varchar2(12 char) primary key,
ms_grade varchar2(5 char) not null,
ms_totalBuy number(10) not null,
ms_point number(7) not null
);

create table question_Answer(
qa_Regno number(4) primary key,
qa_orderNo varchar2(13 char) not null,
qa_csm_id varchar2(12 char) not null,
qa_sl_id varchar2(12 char) not null
qa_pName varchar2(50 char) not null,
qa_question varchar2(200 char) not null,
qa_answer varchar2(200 char) not null,
qa_regDate date not null,
qa_sort varchar2(10 char) not null,
);

create table product_Review(
pr_no number(4) primary key,
pr_orderNo varchar2(13 char) not null,
pr_csm_id varchar2(12 char) not null,
pr_comment varchar2(100 char) not null,
pr_pCode number(13) not null,
pr_pName varchar2(50 char) not null,
pr_star number(1) not null,
);

drop table customer_reg cascade constraint purge;
drop table membership cascade constraint purge;

select * from customer_reg;
select * from membership;

