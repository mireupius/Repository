create sequence sale_order_seq MAXVALUE 999999 CYCLE;
create sequence sale_delivery_seq MAXVALUE 999999 CYCLE;

drop sequence sale_order_seq;
drop sequence sale_delivery_seq;
drop table sale_order cascade constraint purge; 
drop table sale_delivery cascade constraint purge; 

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



