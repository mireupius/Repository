create sequence goods_sq
MAXVALUE 9999
CYCLE
NOCACHE;

create table goods_tb
(
 gd_no 						varchar2 (13 char)		primary key,
 gd_name  					varchar2(20 char) 		not null,
 gd_csmprice 				number(7) 				not null,
 gd_price    				number(7) 				not null,
 gd_dlvchrg   				varchar2(20 char) 		not null,
 gd_imgl  					varchar2(200 char) 		not null,
 gd_imgm  					varchar2(200 char) 		not null,
 gd_imgs  					varchar2(200 char) 		not null,
 gd_imgss 					varchar2(200 char) 		not null,
 gd_clfl  					varchar2(3 char)		not null,
 gd_clfm   					varchar2(3 char),
 gd_clfs   					varchar2(3 char),
 gd_sellerid				varchar2 (12 char)		not null
);


create sequence goodsdtl_sq
MAXVALUE 99999
CYCLE 
NOCACHE;

create table goodsdtl_tb
(
gt_no					varchar2(5 char)		primary key,
gt_gdno					varchar2(13 char)		not null,
gt_mdlname  			varchar2(20 char),
gt_maker    			varchar2(20 char),
gt_brand    			varchar2(20 char),
gt_mfd      			varchar2(20 char),
gt_exp      			varchar2(20 char),
gt_material 			varchar2(20 char),
gt_weight   			varchar2(20 char),
gt_volume   			varchar2(20 char),
gt_origin   			varchar2(20 char),
gt_keyword  			varchar2 (40 char),
gt_detail   			clob 					not null 
);


-- ↓↓↓↓↓↓↓↓↓↓  FK 설정  ↓↓↓↓↓↓↓↓↓↓↓↓↓↓
ALTER TABLE goodsdtl_tb
ADD CONSTRAINTS FK_GT_GDNO FOREIGN KEY(gt_gdno)
REFERENCES goods_tb(gd_no);
-- ↑↑↑↑↑↑↑↑↑↑↑ FK 설정 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

create sequence option_sq
MAXVALUE 99999
CYCLE 
NOCACHE;

create table option_tb
(
op_no				varchar2(5 char)			primary key,
op_gdno 			varchar2(13 char)			not null,
op_name 			varchar2(20 char) 			not null,
op_price 			number(7) 					not null,
op_stock 			number(4) 					not null 
);

--카테고리번호 (시퀀스번호3자리)
create sequence category_sq
MAXVALUE 999
START WITH 100
CYCLE 
NOCACHE;

create table category_tb
(
ct_no 					varchar2 (3 char)		primary key,
ct_clfname  			varchar2(50 char)		not null,
ct_clf      			varchar2(1 char)		not null,
ct_parentno				varchar2 (3 char)
);

create table viewdgd_tb
(
vg_csmid				varchar2(12 char) 		not null,
vg_gdno 				varchar2(1000 char)
);


CREATE TABLE sale_delivery (
sd_delivery_pno 		varchar2(16 char) 		PRIMARY KEY, /* 상품주문번호 */
sd_delivery_no 			varchar2(16 char) 		NOT NULL, /* 주문번호 */
sd_seller_id 			varchar2(12 char) 		NOT NULL, /* 판매자ID */
sd_courier 				varchar2(8 char), /* 택배사 */
sd_invoice_no 			varchar2(14 char), /* 송장번호 */
sd_delivery_done_date 	date, /* 배송완료일 */
sd_customer_name 		varchar2(10 char) 		NOT NULL, /* 구매자명 */
sd_customer_id 			varchar2(12 char) 		NOT NULL, /* 구매자ID */
sd_taker_name 			varchar2(10 char) 		NOT NULL, /* 수취인명 */
sd_delivery_state 		varchar2(8 char) 		NOT NULL, /* 주문상태 */
sd_state_detail 		varchar2(8 char) 		NOT NULL, /* 주문세부상태 */
sd_delivery_cost 		number(5) 				NOT NULL, /* 배송비 */
sd_product_no 			varchar2(13 char) 		NOT NULL, /* 상품번호 */
sd_product_name 		varchar2(30 char) 		NOT NULL, /* 상품명 */
sd_option_type 			varchar2(30 char), /* 옵션종류 */
sd_option_info 			varchar2(30 char), /* 옵션정보 */
sd_amount 				number(5) 				NOT NULL, /* 수량(구입수량) */
sd_option_price 		number(7), /* 옵션가격 */
sd_product_price 		number(8) 				NOT NULL, /* 상품가격 */
sd_product_sellprice 	number(8) 				NOT NULL, /* 판매가격 */
sd_total_price 			number(8) 				NOT NULL, /* 상품별 총 주문금액 */
sd_check_date 			date, /* 발주확인일 */
sd_taker_phone 			varchar2(15 char) 		NOT NULL, /* 수취인연락처1 */
sd_take_area 			varchar2(100 char) 		NOT NULL, /* 배송지 */
sd_customer_ph 			varchar2(15 char) 		NOT NULL, /* 구매자연락처 */
sd_postno				varchar2(6 char) 		NOT NULL, /* 우편번호 */
sd_message 				varchar2(15 char), /* 배송메세지 */
sd_out_area 			varchar2(100 char) 		NOT NULL, /* 출고지 */
sd_order_date 			date NOT NULL, /* 주문일시 */
sd_claim 				varchar2(20 char), /* 클레임상태 */
sd_pay_method 			varchar2(10 char) 		NOT NULL, /* 결제수단 */
sd_go_delivery_date 	date, /* 발송처리일 */
sd_delivery_method 		varchar2(10 char) /* 배송방법 */
);


select * from goods_tb a, goodsdtl_tb b 
where a.gd_no = b.gt_gdno 
and a.gd_no = '1001091160005';



drop table goods_tb cascade constraint purge;
drop sequence goods_sq;
drop table goodsdtl_tb cascade constraint purge;
drop sequence goodsdtl_sq;
drop table category_tb cascade constraint purge;
drop sequence category_sq;
drop table option_tb cascade constraint purge;
drop sequence option_sq;
drop table viewdgd_tb cascade constraint purge;
drop table customer_reg cascade constraint purge;
drop table seller_reg cascade constraint purge;
drop table membership cascade constraint purge;
drop table questionAnswer cascade constraint purge;



select * from category_tb;

--///////////////////////////////////////////////

create sequence test_sq;
create table test_editor (
daumcontent clob
);


insert into test_editor values(
  LPAD(goods_sq.nextval,4,0)
);
drop table test_editor cascade constraint purge;

select * from test_editor;

desc test_editor

insert into goodsdtl_tb values(
'1', '1'||'1'||'1'||LPDA(goods_sq.nextval,4,'0'), '1', '1',
'1', '1', '1', '1',
'1', '1', '1', '1',
'1', '1'
);

create sequence t1_sq;
create table t1 (
a1 varchar2(2 char) primary key,
a2 varchar2(2 char)
);

create sequence t2_sq;
create table t2 (
a3 varchar2(2 char) primary key,
a4 varchar2(2 char) not null
);


ALTER TABLE t2
ADD CONSTRAINTS FK_a1 FOREIGN KEY(a4)
REFERENCES t1(a1);


insert into t1 values(
t1_sq.nextval,'t1'
);
insert into t2 values(
t2_sq.nextval,t1_sq.currval 
);

select * from t1;
select * from t2;

drop table t1 cascade constraint purge;
drop table t2 cascade constraint purge;
drop sequence t1_sq;
drop sequence t2_sq;

values(to_char(카테고리 9자리) || LPAD(시퀀스.nextval,3,0)
nvl (컬럼,0)->널일 때 0으로

gd_no ---> ct_no1+ct_no2+ct_no3 || LPDA(goods_sq.nextval,4,0)
--상품코드(카테고리 9자리 + 시퀀스4)

select * from goods_tb
order by gd_no desc; 
select * from goodsdtl_tb;
select * from option_tb;
select * from goods_tb a, goodsdtl_tb b 
where a.gd_no = b.gt_gdno ;

select * from category_tb
where ct_no = '100' OR ct_no = '109' OR ct_no = '116'
order by ct_clf;
and ct_clf  = #{ct_clf}

--=====================================================================

insert into goods_tb values(
'0000000010002','상품1',10000,8000,'2500','imgl1.jpg','imgl1.jpg','imgl1.jpg','imgl1.jpg','100','109','115','seller1'
);

insert into goodsdtl_tb values(
'디테일1','0000000010002','모델1','제조사1','브랜드1','20180620','20200707','소재1','무게kg','부피','원산지1','검색어1','상세페이지'
);

insert into option_tb values(
'옵션1','0000000010002','옵션명1','2000','100'
);

insert into category_tb values(to_char(category_sq.nextval),'패션의류',1,null);
insert into category_tb values(to_char(category_sq.nextval),'잡화/보석',1,null);
insert into category_tb values(to_char(category_sq.nextval),'스포츠/아웃도어',1,null);
insert into category_tb values(to_char(category_sq.nextval),'뷰티',1,null);
insert into category_tb values(to_char(category_sq.nextval),'식품/주방',1,null);
insert into category_tb values(to_char(category_sq.nextval),'출산/유아동',1,null);
insert into category_tb values(to_char(category_sq.nextval),'가구/인테리어',1,null);
insert into category_tb values(to_char(category_sq.nextval),'생활/건강/취미',1,null);
insert into category_tb values(to_char(category_sq.nextval),'가전/디지털',1,null);

insert into category_tb values(to_char(category_sq.nextval),'여성의류',2,100);
insert into category_tb values(to_char(category_sq.nextval),'남성의류',2,100);
insert into category_tb values(to_char(category_sq.nextval),'캐주얼의류',2,100);
insert into category_tb values(to_char(category_sq.nextval),'언더웨어',2,100);

insert into category_tb values(to_char(category_sq.nextval),'티셔츠',3,109);
insert into category_tb values(to_char(category_sq.nextval),'블라우스/셔츠',3,109);
insert into category_tb values(to_char(category_sq.nextval),'니트/가디건',3,109);
insert into category_tb values(to_char(category_sq.nextval),'원피스/투피스',3,109);
insert into category_tb values(to_char(category_sq.nextval),'스커트',3,109);
insert into category_tb values(to_char(category_sq.nextval),'팬츠/데님',3,109);
insert into category_tb values(to_char(category_sq.nextval),'자켓/점퍼/코트',3,109);
insert into category_tb values(to_char(category_sq.nextval),'한복/테마의류',3,109);


insert into goods_tb values('0000000010002','상품1','10000','8000','2500','imgl1.jpg','imgl1.jpg','imgl1.jpg','imgl1.jpg','100','109','114','seller1');
insert into goods_tb values('0000000010003','상품2','10001','8001','2501','imgl2.jpg','imgl2.jpg','imgl2.jpg','imgl2.jpg','100','109','115','seller2');
insert into goods_tb values('0000000010004','상품3','10002','8002','2502','imgl3.jpg','imgl3.jpg','imgl3.jpg','imgl3.jpg','100','109','116','seller3');
insert into goods_tb values('0000000010005','상품4','10003','8003','2503','imgl4.jpg','imgl4.jpg','imgl4.jpg','imgl4.jpg','100','109','117','seller4');
insert into goods_tb values('0000000010006','상품5','10004','8004','2504','imgl5.jpg','imgl5.jpg','imgl5.jpg','imgl5.jpg','100','109','118','seller5');
insert into goods_tb values('0000000010007','상품6','10005','8005','2505','imgl6.jpg','imgl6.jpg','imgl6.jpg','imgl6.jpg','100','109','119','seller6');
insert into goods_tb values('0000000010008','상품7','10006','8006','2506','imgl7.jpg','imgl7.jpg','imgl7.jpg','imgl7.jpg','100','109','120','seller7');
insert into goods_tb values('0000000010009','상품8','10007','8007','2507','imgl8.jpg','imgl8.jpg','imgl8.jpg','imgl8.jpg','100','109','121','seller8');
insert into goods_tb values('0000000010010','상품9','10008','8008','2508','imgl9.jpg','imgl9.jpg','imgl9.jpg','imgl9.jpg','100','109','118','seller9');
insert into goods_tb values('0000000010011','상품10','10009','8009','2509','imgl10.jpg','imgl10.jpg','imgl10.jpg','imgl10.jpg','100','109','119','seller10');
insert into goods_tb values('0000000010012','상품11','10010','8010','2510','imgl11.jpg','imgl11.jpg','imgl11.jpg','imgl11.jpg','100','109','120','seller11');
insert into goods_tb values('0000000010013','상품12','10011','8011','2511','imgl12.jpg','imgl12.jpg','imgl12.jpg','imgl12.jpg','100','109','121','seller12');



insert into goodsdtl_tb values('디테일1','0000000010002','모델1','제조사1','브랜드1','20180620','20200707','소재1','무게kg','부피','원산지1','검색어1','상세페이지');
insert into goodsdtl_tb values('디테일2','0000000010003','모델2','제조사2','브랜드2','20180620','20200707','소재2','무게kg','부피','원산지2','검색어2','상세페이지');
insert into goodsdtl_tb values('디테일3','0000000010004','모델3','제조사3','브랜드3','20180620','20200707','소재3','무게kg','부피','원산지3','검색어3','상세페이지');
insert into goodsdtl_tb values('디테일4','0000000010005','모델4','제조사4','브랜드4','20180620','20200707','소재4','무게kg','부피','원산지4','검색어4','상세페이지');
insert into goodsdtl_tb values('디테일5','0000000010006','모델5','제조사5','브랜드5','20180620','20200707','소재5','무게kg','부피','원산지5','검색어5','상세페이지');
insert into goodsdtl_tb values('디테일6','0000000010007','모델6','제조사6','브랜드6','20180620','20200707','소재6','무게kg','부피','원산지6','검색어6','상세페이지');
insert into goodsdtl_tb values('디테일7','0000000010008','모델7','제조사7','브랜드7','20180620','20200707','소재7','무게kg','부피','원산지7','검색어7','상세페이지');
insert into goodsdtl_tb values('디테일8','0000000010009','모델8','제조사8','브랜드8','20180620','20200707','소재8','무게kg','부피','원산지8','검색어8','상세페이지');
insert into goodsdtl_tb values('디테일9','0000000010010','모델9','제조사9','브랜드9','20180620','20200707','소재9','무게kg','부피','원산지9','검색어9','상세페이지');
insert into goodsdtl_tb values('디테일10','0000000010011','모델10','제조사10','브랜드10','20180620','20200707','소재10','무게kg','부피','원산지10','검색어10','상세페이지');
insert into goodsdtl_tb values('디테일11','0000000010012','모델11','제조사11','브랜드11','20180620','20200707','소재11','무게kg','부피','원산지11','검색어11','상세페이지');
insert into goodsdtl_tb values('디테일12','0000000010013','모델12','제조사12','브랜드12','20180620','20200707','소재12','무게kg','부피','원산지12','검색어12','상세페이지');


insert into option_tb values('옵션1','0000000010002','옵션명1','2000','100');
insert into option_tb values('옵션2','0000000010003','옵션명2','2000','100');
insert into option_tb values('옵션3','0000000010004','옵션명3','2000','100');
insert into option_tb values('옵션4','0000000010005','옵션명4','2000','100');
insert into option_tb values('옵션5','0000000010006','옵션명5','2000','100');
insert into option_tb values('옵션6','0000000010007','옵션명6','2000','100');
insert into option_tb values('옵션7','0000000010008','옵션명7','2000','100');
insert into option_tb values('옵션8','0000000010009','옵션명8','2000','100');
insert into option_tb values('옵션9','0000000010010','옵션명9','2000','100');
insert into option_tb values('옵션10','0000000010011','옵션명10','2000','100');
insert into option_tb values('옵션11','0000000010012','옵션명11','2000','100');
insert into option_tb values('옵션12','0000000010013','옵션명12','2000','100');

