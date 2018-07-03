create sequence sale_order_seq MAXVALUE 999999 CYCLE;
create sequence sale_delivery_seq MAXVALUE 999999 CYCLE;

drop sequence sale_order_seq;
drop sequence sale_delivery_seq;
drop table sale_order cascade constraint purge; 

select * from sale_delivery;

select * from sale_delivery

create table sale_order (
so_delivery_no varchar2(16 char)	primary key,
so_seller_id varchar2(12 char)	not null,
so_customer_name varchar2(10 char)	not null,
so_customer_id varchar2(12 char)	not null,
so_taker_name	varchar2(10 char)	not null,
so_taker_phone	varchar2(15 char)	not null,
so_take_area	varchar2(100 char)	not null,
so_take_area_detail	varchar2(100 char)	not null,
so_customer_ph	varchar2(15 char)	not null,
so_postno	varchar2(6 char)	not null,
so_order_date	date	not null,
so_pay_method	varchar2(10 char)	not null,
so_message varchar2(20 char),
so_is_order	varchar2(1 char)	not null
);



delete from sale_delivery;
delete from sale_order;



insert into sale_delivery
(
	sd_delivery_pno,
	sd_delivery_no,
	sd_seller_id,
	sd_customer_name,
	sd_customer_id,
	sd_taker_name,
	sd_delivery_state,
	sd_state_detail,
	sd_delivery_cost,
	sd_product_no,
	sd_product_name,
	sd_option_type,
	sd_option_info,
	sd_amount,
	sd_option_price,
	sd_product_price,
	sd_product_sellprice,
	sd_total_price,
	sd_taker_phone,
	sd_take_area,
	sd_customer_ph,
	sd_postno,
	sd_message,
	sd_out_area,
	sd_order_date,
	sd_pay_method,
	sd_review
) select
	concat( to_char(sysdate,'yyyyMMdd'), to_char(sale_delivery_seq.nextVal,'FM000000')),
	'1112312312',
	'xxxx',
	so_customer_name,
	so_customer_id,
	so_taker_name,
	'배송준비중',
	'신규주문',
	5000,
	5000,
	5000,
	'선택형 옵션',
	'xxx',
	3,
	5000,
	5000,
	5000,
	5000,
	'22222222',
	'xxxxxxxx',
	'23423423',
	'98978',
	'ㅇㅇㅇㅇㅇ',
	'갈월동',
	sysdate,
	'신용카드',
	'N'
from sale_order where so_is_order = 'N' and so_seller_id = 'aaaa';
 

select * from sale_order where so_customer_id = 'xxxx' and so_is_order ='N';


select * from sale_order;
select * from sale_delivery;

select * from sale_order where so_seller_id = 'xxxx' and so_customer_id = 'customerID' and so_is_order ='N';






concat( to_char(sysdate,'yyyyMMdd'), to_char(sale_delivery_seq.nextVal,'FM000000')),
so_delivery_no,
'aaa',
NULL,
NULL,
NULL,
so_customer_name,
so_customer_id,
so_taker_name,
'구매확정',
'신규주문',
#{sd_delivery_cost},
#{sd_product_no},
#{sd_product_name},
'조합형옵션상품',
#{sd_option_info},
#{sd_amount},
#{sd_option_price},
#{sd_product_price},
#{sd_product_sellprice},
#{sd_total_price},
NULL,
'010-0000-0002',
'서울특별시 송파구 오금로32길 5 (송파동, 가락삼익맨숀) 000동000호',
'010-4717-0039',
'05675',
so_message,
#{sd_out_area},
sysdate,
NULL,
'신용카드',
NULL,
NULL
) 
select * from sale_order where so_is_order = 'N' and so_seller_id = 'aaaa';

select * from sale_order where so_seller_id = 'aaaa' and so_customer_id = 'customerID' and so_is_order ='N';


select * from sale_order
