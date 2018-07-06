create table seller_account(
 sa_id varchar2(12 char) primary key,
 sa_account_num varchar2(16 char),
 sa_account_bank varchar2(12 char)
);
		select sum(sd_total_price)
		from sale_delivery
		where sd_seller_id = 'ioso1212'
		and sd_delivery_state = '구매확정'
		and sd_is_calculate = 'N';
select * from seller_account
delete from seller_account;
select * from seller_account