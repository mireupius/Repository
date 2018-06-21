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


select *
from membership, CUSTOMER_REG
where ms_csm_id = csm_id
and ms_csm_id = 'love77';



select * from membership;

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
drop table shoppingBasket cascade constraint purge;

select * from customer_reg;
select * from membership;

create table shoppingBasket(
sb_gd_no number(13) primary key,
sb_csm_id varchar2(12 char) not null, 
sb_Pname varchar2 (20 char) not null,
sb_Pprice number (7) not null,
sb_PSprice number (7) not null,
sb_Img varchar2 (200 char) not null,  
sb_optionName varchar2 (20 char) not null,  -- 옵션이름
sb_optionPrice number (7) not null,  		-- 옵션 가격
sb_quantity number (4) not null,			-- 구매수량
sb_shippingFee varchar2 (20 char) not null,	-- 택배비
sb_orderDate date not null
);

sb_searchMonth number(2) not null

select * from shoppingBasket;

select SYSDATE AS BASIC, TO_CHAR(SYSDATE, 'YYYY.MM.DD')
from dual
where BASIC between (SELECT BASIC + 1 FROM DUAL) AND (SELECT SYSDATE+ 6 FROM DUAL)
;

SELECT SYSDATE + 6 FROM DUAL
SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD')) - TO_DATE(TO_CHAR(SELECT SYSDATE + 6 FROM DUAL, 'YYYYMMDD')) FROM DUAL;

SELECT * FROM shoppingBasket WHERE sb_orderDate BETWEEN (SELECT ADD_MONTHS(SYSDATE, -3) FROM dual) and (SELECT SYSDATE FROM dual);

SELECT *
FROM shoppingBasket
WHERE sb_csm_id = 'vip150'
AND sb_orderDate BETWEEN (SELECT ADD_MONTHS(SYSDATE, -3) FROM dual) and (SELECT SYSDATE FROM dual);

insert into shoppingBasket values(1111111111111,'vip150','사과',2000,1000,'apple.png','사과',2000,10,'5000', '2018-04-13'); 
insert into shoppingBasket values(2222222222222,'vip150','배',2000,1000,'pear.png','배',2000,5,'0', '2018-03-12'); 
insert into shoppingBasket values(3333333333333,'vip150','원피스',50000,43000,'onepiece.jpg','머리끈',500,1,'0', '2018-02-10'); 
insert into shoppingBasket values(4444444444444,'vip150','모자',70000,60000,'manshoes.jpg','썬크림',10000,2,'2500', '2018-05-22'); 
insert into shoppingBasket values(5555555555555,'vip150','단화',34000,30000,'Shoes.jpg','검은양말',1000,1,'5000', '2018-01-30');
insert into shoppingBasket values(6666666666666,'vip150','단소',36000,800,'Shoes.jpg','파란셔츠',1000,1,'8000', '2017-11-25');
insert into shoppingBasket values(7777777777777,'vip150','귤',1500,900,'Shoes.jpg','손수건',1000,1,'2000', '2017-08-11');

insert into shoppingBasket values(1111111111111,'vip150','사과',2000,1000,'apple.png','배',2000,10,'5000', '2018-04-13', 0); 
insert into shoppingBasket values(2222222222222,'vip150','사과',2000,1000,'apple.png','배',2000,5,'0', '2018-03-12', 0); 
insert into shoppingBasket values(3333333333333,'vip150','원피스',50000,43000,'onepiece.jpg','머리끈',500,1,'0', '2018-02-10', 0); 
insert into shoppingBasket values(4444444444444,'vip150','모자',70000,60000,'manshoes.jpg','썬크림',10000,2,'2500', '2018-05-22', 0); 
insert into shoppingBasket values(5555555555555,'vip150','단화',34000,30000,'Shoes.jpg','검은양말',1000,1,'5000', '2018-01-30', 0);


