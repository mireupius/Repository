

/* 테이블 생성 */

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
	sd_delivery_type varchar2(10 char), /* 배송방법 */
	sd_review varchar2(1 char), /*구매평 여부 */
	sd_is_calculate varchar2(1 char) /*정산여부 여부 */
);


/* 샘플데이터 - 에러나면 한줄씩 실행해보세요*/

insert into sale_delivery values('2018052291233613','2018052252351030','aaa',NULL,NULL,NULL,'장희원','xx','장희원','구매확정','신규주문',2500,'2917445931','헤어핀3','조합형옵션상품','컬러:블랙',2,0,5700,5700,5700,NULL,'010-0000-0002','서울특별시 송파구 오금로32길 5 (송파동, 가락삼익맨숀) 000동000호','010-4717-0039','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77',sysdate,NULL,'신용카드',NULL,NULL);
insert into sale_delivery values('2018052291233614','2018052252351031','aaa',NULL,NULL,NULL,'장희원','xx','장희원','구매확정','신규주문',2500,'2917445931','헤어핀3','조합형옵션상품','컬러:블랙',2,0,5700,5700,5700,NULL,'010-0000-0002','서울특별시 송파구 오금로32길 5 (송파동, 가락삼익맨숀) 000동000호','010-4717-0039','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77',sysdate,NULL,'신용카드',NULL,NULL);
insert into sale_delivery values('2018052291233615','2018052252351032','bbb',NULL,NULL,NULL,'김덕순','yy','장희원','구매확정','신규주문',2500,'2917445931','헤어핀3','조합형옵션상품','컬러:블랙',2,0,5700,5700,5700,NULL,'010-0000-0002','부산광역시 아파트','010-4717-0039','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77',sysdate,NULL,'신용카드',NULL,NULL);
insert into sale_delivery values('2018052291233616','2018052252351032','bbb',NULL,NULL,NULL,'이영희','zz','장희원','구매확정','신규주문',2500,'2917445931','헤어핀3','조합형옵션상품','컬러:블랙',2,0,5700,5700,5700,NULL,'010-0000-0002','서울 가좌동 32길 5 (가좌동, 주공아파트) 000동000호','010-4717-0039','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77',sysdate,NULL,'신용카드',NULL,NULL);

select * from SALE_DELIVERY;


drop table sale_delivery cascade constraint purge;
CREATE TABLE sale_delivery 