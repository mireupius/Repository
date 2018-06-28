-- 장바구니테이블은 옵션테이블이랑 상품테이블 조인시켜사용 --
-- 장바구니 --
CREATE TABLE SHOPPINGBASKET(
SB_NO NUMBER(13) PRIMARY KEY
SB_GD_NO NUMBER(13) PRIMARY NOT NULL,
SB_CSM_ID VARCHAR2(12 CHAR) NOT NULL, 
SB_PNAME VARCHAR2 (20 CHAR) NOT NULL,
SB_PPRICE NUMBER (7) NOT NULL,
SB_PSPRICE NUMBER (7) NOT NULL,
SB_IMG VARCHAR2 (200 CHAR) NOT NULL,  
SB_OPTIONNAME VARCHAR2 (20 CHAR) NOT NULL,  -- 옵션이름
SB_OPTIONPRICE NUMBER (7) NOT NULL,  		-- 옵션 가격
SB_QUANTITY NUMBER (4) NOT NULL,			-- 구매수량
SB_SHIPPINGFEE VARCHAR2 (20 CHAR) NOT NULL	-- 택배비
SB_ORDERDATE DATE NOT NULL					-- 주문일
);

insert into shoppingBasket values(1111111111111,'cyh524','사과',2000,1000,'apple.png','배',2000,10,'5000'); 
insert into shoppingBasket values(2222222222222,'moon1765','사과',2000,1000,'apple.png','배',2000,5,'0'); 
insert into shoppingBasket values(3333333333333,'cyh524','원피스',50000,43000,'onepiece.jpg','머리끈',500,1,'0'); 
insert into shoppingBasket values(4444444444444,'moon1765','모자',70000,60000,'manshoes.jpg','썬크림',10000,2,'2500'); 
insert into shoppingBasket values(5555555555555,'cyh524','단화',34000,30000,'Shoes.jpg','검은양말',1000,1,'5000'); 

select * from shoppingBasket where sb_csm_id = 'cyh524';




drop table shoppingBasket cascade constraint purge;

	-- 기본거주지 --
create table ShippingInformation(
si_csm_id varchar2(12 char) primary key,
si_name varchar2(10char) not null,
si_address varchar2(100 char) not null,
si_Cphone varchar2(10char) not null
);

-- 상품테이블 --  
create table goods_tb(
gd_no number(13) primary key,			-- 상품번호 --
gd_name varchar2(20 char) not null,		-- 상품이름 --
gd_csmprice number(7) not null,         -- 구매자가격 --
gd_price number(7) not null,			-- 상품가격 --
gd_dlvchrg varchar2(20 char) not null,	-- 배송비 --
gd_imgl varchar2(200 char) not null, 	-- 이미지라지 --
gd_imgm varchar2(200 char) not null,	-- 이미지미디엄 --
gd_imgs varchar2(200 char) not null, 	-- 이미지스몰 --
gd_imgss varchar2(200 char) not null,	-- 이미지베리스몰 --
gd_clfl number(3) not null, 			-- 상품분류 --
gd_clfm number(3),						-- 상품분류 --
gd_clfs number(3)						-- 상품분류 --
);

insert into goods_tb (gd_no,gd_name,gd_csmprice,gd_price,gd_dlvchrg,gd_imgl,gd_imgm,gd_imgs,gd_imgss,gd_clfl)values(1111111111111,
'구두',
17000,
18000,
'5000',
'apple.png',
'apple.png',
'apple.png',
'apple.png',
24);

select * from goods_tb;


-- option --
create table option_tb(
op_no varchar2(5) primary key,		-- 옵션번호
op_gdno varchar2(13) not null,		-- 상품번호
op_name varchar2 (20 char) not null,-- 옵션이름
op_price number(7) not null,		-- 옵션가격
op_stock number(4) not null         -- 재고--
);


insert into option_tb values(1,1111111111111,'발목양말',2000,1);
select * from option_tb;

--옵션테이블 상품테이블 조인시키기--
select * from goods_tb,option_tb where op_gdno=gd_no;      


-- 구매자 --
create table customer_reg(
csm_id varchar2(12 char) primary key,
csm_pw varchar2(15 char) not null,
csm_name varchar2(10 char) not null,
csm_birth date not null,
csm_phoneNo varchar2(11 char) not null,
csm_emailAddress varchar2(30 char) not null
);

insert into customer_reg values('cyh524','123123','최완희',sysdate,'01051990686','moon1765@naver.com');

select * from customer_reg;

		select * from customer_reg	where csm_id = 'aaa'
select * from sale_delivery where sd_delivery_state != '배송중' order by sd_order_date
select sd_delivery_type from sale_delivery;

update sale_delivery set sd_delivery_state = '구매확정'  where  sd_delivery_pno = 2018052291233612;
update sale_delivery set sd_delivery_state = '구매확정'  where  sd_delivery_pno = 2018052291233613;
update sale_delivery set sd_claim = '반품'  where  sd_delivery_pno = '2018052391233614';
update sale_delivery set sd_claim = '반품'  where  sd_delivery_pno = '2018052391233615';
update sale_delivery set sd_claim = '교환'  where  sd_delivery_pno = '2018052391233616';
update sale_delivery set sd_claim = '교환'  where  sd_delivery_pno = '2018052391233617';
update sale_delivery set sd_claim = '취소'  where  sd_delivery_pno = '2018052391233618';
update sale_delivery set sd_claim = '취소'  where  sd_delivery_pno = '2018052491233619';

select * from sale_delivery where sd_delivery_state != '諛곗넚以�' order by sd_order_date


insert into sale_delivery values('2018052291233612', '2018052252351030', 'aaa',	null,	null,	null,	'dsfsdf',	'vip150',	'오준영',	'구매완료',	'신규주문',	2500,	'2917445930',	'0000000010002',	'상품1',	'而щ윭:釉붾（',	2,	0,	5600,	5600,	5600,	null,	'010-0000-0001',	'�꽌�슱�듅蹂꾩떆 �넚�뙆援� �삤湲덈줈32湲� 5 (�넚�뙆�룞, 媛��씫�궪�씡留⑥�) 000�룞000�샇',	'010-4717-0038',	'05674',	'배송잘해주세요',	'(04306) �꽌�슱�듅蹂꾩떆 �슜�궛援� 泥��뙆濡�71湲�  77-77',	to_date('20180522','yyyyMMdd'),	null,	'�떊�슜移대뱶',null,null	);
insert into sale_delivery values('aaa',	'2018052291233613',	'2018052252351030',	null,	null,	null,	'�옣�씗�썝',	'aa',	'�옣�씗�썝',	'諛쒖넚��湲�',	'�떊洹쒖＜臾�',	2500,	'2917445931',	'�뿤�뼱��3',	'議고빀�삎�샃�뀡�긽�뭹',	'而щ윭:釉붾옓',	2,	0,	5700,	5700,	5700,	null,	'010-0000-0002',	'�꽌�슱�듅蹂꾩떆 �넚�뙆援� �삤湲덈줈32湲� 5 (�넚�뙆�룞, 媛��씫�궪�씡留⑥�) 000�룞000�샇',	'010-4717-0039',	'05675',	null,	'(04306) �꽌�슱�듅蹂꾩떆 �슜�궛援� 泥��뙆濡�71湲�  77-77',	to_date('20180522','yyyyMMdd'),	null,	'�떊�슜移대뱶',null,null	);
insert into sale_delivery values('aaa',	'2018052391233614',	'2018052352351031',	null,	null,	null,	'源��뜒�닚',	'bb',	'源��뜒�닚',	'諛쒖넚��湲�',	'�떊洹쒖＜臾�',	2500,	'2917445932',	'諛붿�1',	'議고빀�삎�샃�뀡�긽�뭹',	'而щ윭:釉붾옓/�궗�씠利�:100',	1,	0,	5800,	5800,	5800,	null,	'010-0000-0003',	'遺��궛愿묒뿭�떆 �븘�뙆�듃',	'010-4717-0040',	'05676',	'遺��옱�떆 寃쎈퉬�떎�뿉 留↔꺼二쇱꽭�슂',	'(04306) �꽌�슱�듅蹂꾩떆 �슜�궛援� 泥��뙆濡�71湲�  77-77',	to_date('20180523','yyyyMMdd'),	null,	'�떊�슜移대뱶',null,null	);
insert into sale_delivery values('aaa',	'2018052391233615',	'2018052352351031',	null,	null,	null,	'源��뜒�닚',	'bb',	'源��뜒�닚',	'諛쒖넚��湲�',	'�떊洹쒖＜臾�',	2500,	'2917445933',	'諛붿�1',	'議고빀�삎�샃�뀡�긽�뭹',	'而щ윭:�젅�뱶/�궗�씠利�:100',	3,	0,	5900,	5900,	5900,	null,	'010-0000-0004',	'遺��궛愿묒뿭�떆 �븘�뙆�듃',	'010-4717-0041',	'05677',	'遺��옱�떆 寃쎈퉬�떎�뿉 留↔꺼二쇱꽭�슂',	'(04306) �꽌�슱�듅蹂꾩떆 �슜�궛援� 泥��뙆濡�71湲�  77-77',	to_date('20180523','yyyyMMdd'),	null,	'�떊�슜移대뱶',null,null	);
insert into sale_delivery values('aaa',	'2018052391233616',	'2018052352351032',	null,	null,	null,	'�씠�쁺�씗',	'cc',	'�씠�쁺�씗',	'諛쒖넚��湲�',	'�떊洹쒖＜臾�',	2500,	'2917445934',	'李멸린由�',	null,	null,	1,	0,	6000,	6000,	6000,	null,	'010-0000-0005',	'�꽌�슱 媛�醫뚮룞 32湲� 5 (媛�醫뚮룞, 二쇨났�븘�뙆�듃) 000�룞000�샇',	'010-4717-0042',	'05678',	null,	'(04306) �꽌�슱�듅蹂꾩떆 �슜�궛援� 泥��뙆濡�71湲�  77-77',	to_date('20180523','yyyyMMdd'),	null,	'�떊�슜移대뱶',null,null	);
insert into sale_delivery values('aaa',	'2018052391233617',	'2018052352351033',	null,	null,	null,	'諛뺤닚濡�',	'dd',	'諛뺤닚濡�',	'諛쒖넚��湲�',	'�떊洹쒖＜臾�',	2500,	'2917445935',	'�뼞蹂띠씠',	null,	null,	2,	0,	6100,	6100,	6100,	null,	'010-0000-0006',	'�쓽�젙遺�',	'010-4717-0043',	'05679',	'遺��옱�떆 寃쎈퉬�떎�뿉 留↔꺼二쇱꽭�슂',	'(04306) �꽌�슱�듅蹂꾩떆 �슜�궛援� 泥��뙆濡�71湲�  77-77',	to_date('20180523','yyyyMMdd'),	null,	'�떊�슜移대뱶',null,null	);
insert into sale_delivery values('aaa',	'2018052391233618',	'2018052352351033',	null,	null,	null,	'諛뺤닚濡�',	'dd',	'諛뺤닚濡�',	'諛쒖넚��湲�',	'�떊洹쒖＜臾�',	2500,	'2917445936',	'�뼞蹂띠씠',	null,	null,	1,	0,	6200,	6200,	6200,	null,	'010-0000-0007',	'�쓽�젙遺�',	'010-4717-0044',	'05680',	'遺��옱�떆 寃쎈퉬�떎�뿉 留↔꺼二쇱꽭�슂',	'(04306) �꽌�슱�듅蹂꾩떆 �슜�궛援� 泥��뙆濡�71湲�  77-77',	to_date('20180523','yyyyMMdd'),	null,	'�떊�슜移대뱶',null,null	);
insert into sale_delivery values('aaa',	'2018052491233619',	'2018052452351033',	null,	null,	null,	'諛뺤닚濡�',	'dd',	'諛뺤닚濡�',	'諛쒖넚��湲�',	'�떊洹쒖＜臾�',	2500,	'2917445937',	'�뼞蹂띠씠',	'議고빀�삎�샃�뀡�긽�뭹',	'移섏쫰異붽�',	3,	1000,	6300,	6300,	7300,	null,	'010-0000-0008',	'�쓽�젙遺�',	'010-4717-0045',	'05681',	'遺��옱�떆 寃쎈퉬�떎�뿉 留↔꺼二쇱꽭�슂',	'(04306) �꽌�슱�듅蹂꾩떆 �슜�궛援� 泥��뙆濡�71湲�  77-77',	to_date('20180524','yyyyMMdd'),	null,	'�떊�슜移대뱶',null,null	);
insert into sale_delivery values('aaa',	'2018052491233620',	'2018052452351033',	null,	null,	null,	'諛뺤닚濡�',	'dd',	'諛뺤닚濡�',	'諛쒖넚��湲�',	'�떊洹쒖＜臾�',	2500,	'2917445938',	'�뼞蹂띠씠',	null,	null,	1,	0,	6400,	6400,	6400,	null,	'010-0000-0009',	'�쓽�젙遺�',	'010-4717-0046',	'05682',	null,	'(04306) �꽌�슱�듅蹂꾩떆 �슜�궛援� 泥��뙆濡�71湲�  77-77',	to_date('20180524','yyyyMMdd'),	null,	'�떊�슜移대뱶',null,null	);
insert into sale_delivery values('aaa',	'2018052491233621',	'2018052452351034',	null,	null,	null,	'媛뺥븯�굹',	'ee',	'媛뺥븯�굹',	'諛쒖넚��湲�',	'�떊洹쒖＜臾�',	2500,	'2917445939',	'源�諛�',	null,	null,	3,	0,	6500,	6500,	6500,	null,	'010-0000-0010',	'���쟾',	'010-4717-0047',	'05683',	'遺��옱�떆 寃쎈퉬�떎�뿉 留↔꺼二쇱꽭�슂',	'(04306) �꽌�슱�듅蹂꾩떆 �슜�궛援� 泥��뙆濡�71湲�  77-77',	to_date('20180524','yyyyMMdd'),	null,	'�떊�슜移대뱶',null,null	);
insert into sale_delivery values('aaa',	'2018052491233622',	'2018052452351034',	null,	null,	null,	'媛뺥븯�굹',	'ee',	'媛뺥븯�굹',	'諛쒖넚��湲�',	'�떊洹쒖＜臾�',	2500,	'2917445940',	'源�諛�',	null,	null,	1,	0,	6600,	6600,	6600,	null,	'010-0000-0011',	'���쟾',	'010-4717-0048',	'05684',	'遺��옱�떆 寃쎈퉬�떎�뿉 留↔꺼二쇱꽭�슂',	'(04306) �꽌�슱�듅蹂꾩떆 �슜�궛援� 泥��뙆濡�71湲�  77-77',	to_date('20180524','yyyyMMdd'),	null,	'�떊�슜移대뱶',null,null	);
insert into sale_delivery values('aaa',	'2018052491233623',	'2018052452351034',	null,	null,	null,	'媛뺥븯�굹',	'ee',	'媛뺥븯�굹',	'諛쒖넚��湲�',	'�떊洹쒖＜臾�',	2500,	'2917445941',	'源�諛�',	null,	null,	3,	0,	6700,	6700,	6700,	null,	'010-0000-0012',	'���쟾',	'010-4717-0049',	'05685',	null,	'(04306) �꽌�슱�듅蹂꾩떆 �슜�궛援� 泥��뙆濡�71湲�  77-77',	to_date('20180524','yyyyMMdd'),	null,	'�떊�슜移대뱶',null,null	);
insert into sale_delivery values('aaa',	'2018052491233624',	'2018052452351034',	null,	null,	null,	'媛뺥븯�굹',	'ee',	'媛뺥븯�굹',	'諛쒖넚��湲�',	'�떊洹쒖＜臾�',	2500,	'2917445942',	'源�諛�',	null,	null,	1,	0,	6800,	6800,	6800,	null,	'010-0000-0013',	'���쟾',	'010-4717-0050',	'05686',	null,	'(04306) �꽌�슱�듅蹂꾩떆 �슜�궛援� 泥��뙆濡�71湲�  77-77',	to_date('20180524','yyyyMMdd'),	null,	'�떊�슜移대뱶',null,null	);
insert into sale_delivery values('aaa',	'2018052491233625',	'2018052452351035',	null,	null,	null,	'�솉湲몃룞',	'ff',	'�솉湲몃룞',	'諛쒖넚��湲�',	'�떊洹쒖＜臾�',	2500,	'2917445943',	'�떚�뀛痢�',	'議고빀�삎�샃�뀡�긽�뭹',	'而щ윭:釉붾옓,�궗�씠利�:100',	2,	0,	6900,	6900,	6900,	null,	'010-0000-0014',	'�젣二쇰룄',	'010-4717-0051',	'05687',	null,	'(04306) �꽌�슱�듅蹂꾩떆 �슜�궛援� 泥��뙆濡�71湲�  77-77',	to_date('20180524','yyyyMMdd'),	null,	'�떊�슜移대뱶',null,null	);
insert into sale_delivery values('aaa',	'2018052491233626',	'2018052452351036',	null,	null,	null,	'諛뺤젙�씗',	'ff',	'諛뺤젙�씗',	'諛쒖넚��湲�',	'�떊洹쒖＜臾�',	2500,	'2917445944',	'泥�諛붿�',	'議고빀�삎�샃�뀡�긽�뭹',	'而щ윭:�젅�뱶,�궗�씠利�:100',	1,	0,	7000,	7000,	7000,	null,	'010-0000-0015',	'�씪�궛',	'010-4717-0052',	'05688',	'遺��옱�떆 寃쎈퉬�떎�뿉 留↔꺼二쇱꽭�슂',	'(04306) �꽌�슱�듅蹂꾩떆 �슜�궛援� 泥��뙆濡�71湲�  77-77',	to_date('20180524','yyyyMMdd'),	null,	'�떊�슜移대뱶',null,null	);

select * from sale_delivery

/* 二쇰Ц */
DROP TABLE sale_delivery CASCADE CONSTRAINTS purge;

ALTER TABLE sale_delivery add(sd_go_delivery_date date);
ALTER TABLE sale_delivery add(d_seller_id varchar2 (12 char));

ALTER TABLE sale_delivery RENAME COLUMN sd_delivery_method TO sd_delivery_type;


ALTER TABLE sale_delivery
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;


DROP TABLE sale_delivery 
	CASCADE CONSTRAINTS;


CREATE TABLE sale_delivery (
	sd_delivery_pno varchar2(16 char) PRIMARY KEY, /* 상품주문번호 */
	sd_delivery_no varchar2(16 char) NOT NULL, /* 주문번호 */
	sd_seller_id varchar2(12 char) NOT NULL, /* 판매자ID */
	sd_courier varchar2(8 char), /* 택배사 */
	sd_invoice_no varchar2(14 char), /* 송장번호 */
	sd_delivery_done_date date, /* 배송완료일 */
	sd_customer_name varchar2(10 char) NOT NULL, /* 구매자명 */
	sd_customer_id varchar2(12 char) NOT NULL, /* 구매자ID */
	sd_taker_name varchar2(10 char) NOT NULL, /* 수취인명 */
	sd_delivery_state varchar2(8 char) NOT NULL, /* 주문상태 */
	sd_state_detail varchar2(8 char) NOT NULL, /* 주문세부상태 */
	sd_delivery_cost number(5) NOT NULL, /* 배송비 */
	sd_product_no varchar2(13 char) NOT NULL, /* 상품번호 */
	sd_product_name varchar2(30 char) NOT NULL, /* 상품명 */
	sd_option_type varchar2(30 char), /* 옵션종류 */
	sd_option_info varchar2(30 char), /* 옵션정보 */
	sd_amount number(5) NOT NULL, /* 수량(구입수량) */
	sd_option_price number(7), /* 옵션가격 */
	sd_product_price number(8) NOT NULL, /* 상품가격 */
	sd_product_sellprice number(8) NOT NULL, /* 판매가격 */
	sd_total_price number(8) NOT NULL, /* 상품별 총 주문금액 */
	sd_check_date date, /* 발주확인일 */
	sd_taker_phone varchar2(15 char) NOT NULL, /* 수취인연락처1 */
	sd_take_area varchar2(100 char) NOT NULL, /* 배송지 */
	sd_customer_ph varchar2(15 char) NOT NULL, /* 구매자연락처 */
	sd_postno varchar2(6 char) NOT NULL, /* 우편번호 */
	sd_message varchar2(15 char), /* 배송메세지 */
	sd_out_area varchar2(100 char) NOT NULL, /* 출고지 */
	sd_order_date date NOT NULL, /* 주문일시 */
	sd_claim varchar2(20 char), /* 클레임상태 */
	sd_pay_method varchar2(10 char) NOT NULL, /* 결제수단 */
	sd_go_delivery_date date, /* 발송처리일 */
	sd_delivery_method varchar2(10 char) /* 배송방법 */
);

insert into sale_delivery values('2018052291233612', '2018052252351030', )

