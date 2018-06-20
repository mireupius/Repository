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

insert into sale_delivery values('aaa',	'2018052291233612',	'2018052252351030',	null,	null,	null,	'장희원',	'aa',	'장희원',	'발송대기',	'신규주문',	2500,	'2917445930',	'헤어핀2',	'조합형옵션상품',	'컬러:블루',	2,	0,	5600,	5600,	5600,	null,	'010-0000-0001',	'서울특별시 송파구 오금로32길 5 (송파동, 가락삼익맨숀) 000동000호',	'010-4717-0038',	'05674',	'부재시 경비실에 맡겨주세요',	'(04306) 서울특별시 용산구 청파로71길  77-77',	to_date('20180522','yyyyMMdd'),	null,	'신용카드',null,null	);
insert into sale_delivery values('aaa',	'2018052291233613',	'2018052252351030',	null,	null,	null,	'장희원',	'aa',	'장희원',	'발송대기',	'신규주문',	2500,	'2917445931',	'헤어핀3',	'조합형옵션상품',	'컬러:블랙',	2,	0,	5700,	5700,	5700,	null,	'010-0000-0002',	'서울특별시 송파구 오금로32길 5 (송파동, 가락삼익맨숀) 000동000호',	'010-4717-0039',	'05675',	null,	'(04306) 서울특별시 용산구 청파로71길  77-77',	to_date('20180522','yyyyMMdd'),	null,	'신용카드',null,null	);
insert into sale_delivery values('aaa',	'2018052391233614',	'2018052352351031',	null,	null,	null,	'김덕순',	'bb',	'김덕순',	'발송대기',	'신규주문',	2500,	'2917445932',	'바지1',	'조합형옵션상품',	'컬러:블랙/사이즈:100',	1,	0,	5800,	5800,	5800,	null,	'010-0000-0003',	'부산광역시 아파트',	'010-4717-0040',	'05676',	'부재시 경비실에 맡겨주세요',	'(04306) 서울특별시 용산구 청파로71길  77-77',	to_date('20180523','yyyyMMdd'),	null,	'신용카드',null,null	);
insert into sale_delivery values('aaa',	'2018052391233615',	'2018052352351031',	null,	null,	null,	'김덕순',	'bb',	'김덕순',	'발송대기',	'신규주문',	2500,	'2917445933',	'바지1',	'조합형옵션상품',	'컬러:레드/사이즈:100',	3,	0,	5900,	5900,	5900,	null,	'010-0000-0004',	'부산광역시 아파트',	'010-4717-0041',	'05677',	'부재시 경비실에 맡겨주세요',	'(04306) 서울특별시 용산구 청파로71길  77-77',	to_date('20180523','yyyyMMdd'),	null,	'신용카드',null,null	);
insert into sale_delivery values('aaa',	'2018052391233616',	'2018052352351032',	null,	null,	null,	'이영희',	'cc',	'이영희',	'발송대기',	'신규주문',	2500,	'2917445934',	'참기름',	null,	null,	1,	0,	6000,	6000,	6000,	null,	'010-0000-0005',	'서울 가좌동 32길 5 (가좌동, 주공아파트) 000동000호',	'010-4717-0042',	'05678',	null,	'(04306) 서울특별시 용산구 청파로71길  77-77',	to_date('20180523','yyyyMMdd'),	null,	'신용카드',null,null	);
insert into sale_delivery values('aaa',	'2018052391233617',	'2018052352351033',	null,	null,	null,	'박순례',	'dd',	'박순례',	'발송대기',	'신규주문',	2500,	'2917445935',	'떡볶이',	null,	null,	2,	0,	6100,	6100,	6100,	null,	'010-0000-0006',	'의정부',	'010-4717-0043',	'05679',	'부재시 경비실에 맡겨주세요',	'(04306) 서울특별시 용산구 청파로71길  77-77',	to_date('20180523','yyyyMMdd'),	null,	'신용카드',null,null	);
insert into sale_delivery values('aaa',	'2018052391233618',	'2018052352351033',	null,	null,	null,	'박순례',	'dd',	'박순례',	'발송대기',	'신규주문',	2500,	'2917445936',	'떡볶이',	null,	null,	1,	0,	6200,	6200,	6200,	null,	'010-0000-0007',	'의정부',	'010-4717-0044',	'05680',	'부재시 경비실에 맡겨주세요',	'(04306) 서울특별시 용산구 청파로71길  77-77',	to_date('20180523','yyyyMMdd'),	null,	'신용카드',null,null	);
insert into sale_delivery values('aaa',	'2018052491233619',	'2018052452351033',	null,	null,	null,	'박순례',	'dd',	'박순례',	'발송대기',	'신규주문',	2500,	'2917445937',	'떡볶이',	'조합형옵션상품',	'치즈추가',	3,	1000,	6300,	6300,	7300,	null,	'010-0000-0008',	'의정부',	'010-4717-0045',	'05681',	'부재시 경비실에 맡겨주세요',	'(04306) 서울특별시 용산구 청파로71길  77-77',	to_date('20180524','yyyyMMdd'),	null,	'신용카드',null,null	);
insert into sale_delivery values('aaa',	'2018052491233620',	'2018052452351033',	null,	null,	null,	'박순례',	'dd',	'박순례',	'발송대기',	'신규주문',	2500,	'2917445938',	'떡볶이',	null,	null,	1,	0,	6400,	6400,	6400,	null,	'010-0000-0009',	'의정부',	'010-4717-0046',	'05682',	null,	'(04306) 서울특별시 용산구 청파로71길  77-77',	to_date('20180524','yyyyMMdd'),	null,	'신용카드',null,null	);
insert into sale_delivery values('aaa',	'2018052491233621',	'2018052452351034',	null,	null,	null,	'강하나',	'ee',	'강하나',	'발송대기',	'신규주문',	2500,	'2917445939',	'김밥',	null,	null,	3,	0,	6500,	6500,	6500,	null,	'010-0000-0010',	'대전',	'010-4717-0047',	'05683',	'부재시 경비실에 맡겨주세요',	'(04306) 서울특별시 용산구 청파로71길  77-77',	to_date('20180524','yyyyMMdd'),	null,	'신용카드',null,null	);
insert into sale_delivery values('aaa',	'2018052491233622',	'2018052452351034',	null,	null,	null,	'강하나',	'ee',	'강하나',	'발송대기',	'신규주문',	2500,	'2917445940',	'김밥',	null,	null,	1,	0,	6600,	6600,	6600,	null,	'010-0000-0011',	'대전',	'010-4717-0048',	'05684',	'부재시 경비실에 맡겨주세요',	'(04306) 서울특별시 용산구 청파로71길  77-77',	to_date('20180524','yyyyMMdd'),	null,	'신용카드',null,null	);
insert into sale_delivery values('aaa',	'2018052491233623',	'2018052452351034',	null,	null,	null,	'강하나',	'ee',	'강하나',	'발송대기',	'신규주문',	2500,	'2917445941',	'김밥',	null,	null,	3,	0,	6700,	6700,	6700,	null,	'010-0000-0012',	'대전',	'010-4717-0049',	'05685',	null,	'(04306) 서울특별시 용산구 청파로71길  77-77',	to_date('20180524','yyyyMMdd'),	null,	'신용카드',null,null	);
insert into sale_delivery values('aaa',	'2018052491233624',	'2018052452351034',	null,	null,	null,	'강하나',	'ee',	'강하나',	'발송대기',	'신규주문',	2500,	'2917445942',	'김밥',	null,	null,	1,	0,	6800,	6800,	6800,	null,	'010-0000-0013',	'대전',	'010-4717-0050',	'05686',	null,	'(04306) 서울특별시 용산구 청파로71길  77-77',	to_date('20180524','yyyyMMdd'),	null,	'신용카드',null,null	);
insert into sale_delivery values('aaa',	'2018052491233625',	'2018052452351035',	null,	null,	null,	'홍길동',	'ff',	'홍길동',	'발송대기',	'신규주문',	2500,	'2917445943',	'티셔츠',	'조합형옵션상품',	'컬러:블랙,사이즈:100',	2,	0,	6900,	6900,	6900,	null,	'010-0000-0014',	'제주도',	'010-4717-0051',	'05687',	null,	'(04306) 서울특별시 용산구 청파로71길  77-77',	to_date('20180524','yyyyMMdd'),	null,	'신용카드',null,null	);
insert into sale_delivery values('aaa',	'2018052491233626',	'2018052452351036',	null,	null,	null,	'박정희',	'ff',	'박정희',	'발송대기',	'신규주문',	2500,	'2917445944',	'청바지',	'조합형옵션상품',	'컬러:레드,사이즈:100',	1,	0,	7000,	7000,	7000,	null,	'010-0000-0015',	'일산',	'010-4717-0052',	'05688',	'부재시 경비실에 맡겨주세요',	'(04306) 서울특별시 용산구 청파로71길  77-77',	to_date('20180524','yyyyMMdd'),	null,	'신용카드',null,null	);



/* 주문 */
DROP TABLE sale_delivery 
	CASCADE CONSTRAINTS purge;

ALTER TABLE sale_delivery add(sd_go_delivery_date date);
ALTER TABLE sale_delivery add(d_seller_id varchar2 (12 char));

ALTER TABLE sale_delivery RENAME COLUMN sd_delivery_method TO sd_delivery_type;


ALTER TABLE sale_delivery
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* 주문 */
DROP TABLE sale_delivery 
	CASCADE CONSTRAINTS;

/* 주문 */
CREATE TABLE sale_delivery (
	sd_seller_id varchar2(12 char) NOT NULL, /* 판매자ID */
	sd_delivery_pno varchar2(16 char) primary key, /* 상품주문번호 */
	sd_delivery_no varchar2(16 char) NOT NULL, /* 주문번호 */
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
	sd_go_delivery_date date, /* 발송일 */
	sd_delivery_type varchar2(10 char) /* 배송방법 */
);


select * from sale_delivery where sd_delivery_pno = 2018052391233610;

select count(*) from sale_delivery where sd_state_detail = '신규주문'
