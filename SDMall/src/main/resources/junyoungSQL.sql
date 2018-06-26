-- 구매자 회원가입
create table customer_reg(
csm_id varchar2(12 char) primary key,
csm_pw varchar2(15 char) not null,
csm_name varchar2(10 char) not null,
csm_birth date not null,
csm_phoneNo varchar2(11 char) not null,
csm_emailAddress varchar2(30 char) not null
);

-- 구매자 insert
-- 비번은 준영 1212
insert into customer_reg values('junyoung12', 'wnsdud1212', '준영', '1980-02-16', '01033369944', 'junyoung@naver.com');

-- 구매자 조회
select * from customer_reg;

-- 구매자 삭제
drop table customer_reg cascade constraint purge;



-- 판매자 회원가입
create table seller_reg(
sl_id varchar2(12 char) primary key,
sl_pw varchar2(15 char) not null,
sl_coName varchar2(10 char) not null,
sl_coRegNo varchar2(10 char) not null,
sl_phoneNo varchar2(11 char) not null,
sl_emailAddress varchar2(30 char) not null
);

-- 판매자 insert
-- 비번은 준영 1212
insert into seller_reg values('seller123', 'wnsdud1212', '솔데스크', '1108864455', '01088993333', 'seller@naver.com');

-- 판매자 테이블 삭제

drop table seller_reg cascade constraint purge;

-- 멤버쉽 테이블
-- 따로 직접 insert 할 필요없음(회원 가입시 자동 생성)
create table membership(
ms_csm_id varchar2(12 char) primary key,
ms_grade varchar2(5 char) not null,
ms_totalBuy number(10) not null,
ms_point number(7) not null
);

-- 멤버쉽 insert

insert into membership values('junyoung12', '실버', 0, 0);


-- 멤버쉽 조회
select *
from membership, customer_reg
where ms_csm_id = csm_id
and ms_csm_id = 'junyoung12';

-- 멤버쉽 테이블 삭제

drop table membership cascade constraint purge;


-- 질문과 답변 테이블
-- 따로 직접 insert 할 필요없음(마이페이지에서 직접 입력하고 테스트 해봐야함)
create table question_Answer(
qa_Regno varchar2(4 char) primary key,
qa_orderNo varchar2(13 char) not null,
qa_csm_id varchar2(12 char) not null,
qa_sl_id varchar2(12 char) not null
qa_gdName varchar2(20 char) not null,
qa_question varchar2(200 char) not null,
qa_answer varchar2(200 char) not null,
qa_regDate date not null,
qa_sort varchar2(10 char) not null
);

-- 상품평 테이블
-- 따로 직접 insert 할 필요없음(마이페이지에서 직접 입력하고 테스트 해봐야함)
create table product_Review(
pr_RegNo varchar2(4 char) primary key,
pr_orderNo varchar2(13 char) not null,
pr_csm_id varchar2(12 char) not null,
pr_comment varchar2(100 char) not null,
pr_gdNo varchar2(13 char) not null,
pr_gdName varchar2(20 char) not null,
pr_star varchar2(1 char) not null
);

create sequence product_Review_seq;

drop sequence product_Review_seq;
-- 날짜
select * from '테이블명' where '날짜칼럼명' between (select add_months(sysdate, -3) from dual) and (select sysdate from dual);

select sd_delivery_pno, sd_delivery_no, sd_product_name, sd_delivery_state, sd_amount, sd_option_info, sd_total_price
		from sale_delivery
		where (sd_customer_id = 'junyoung12' and not sd_claim like '%취소%') or (sd_customer_id = 'junyoung12' and sd_claim is null)
		and sd_order_date between (select add_months(SYSDATE, -#{sb_searchMonth}) from dual) and (select SYSDATE from dual);
select *
		from sale_delivery
		where sd_customer_id = 'junyoung12' and not sd_customer_name like '%장희원%';

-- test용도


insert into sale_delivery values('2018052291233613','2018052252351030','seller123',NULL,NULL,NULL,'장희원','junyoung12','장희원','구매확정','신규주문',2500,'2917445931','헤어핀3','조합형옵션상품','컬러:블랙',2,0,5700,5700,5700,NULL,'010-0000-0002','서울특별시 송파구 오금로32길 5 (송파동, 가락삼익맨숀) 000동000호','010-4717-0039','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77',sysdate,NULL,'신용카드',NULL,NULL)
insert into sale_delivery values('2018052291233614','2018052252351031','aaa',NULL,NULL,NULL,'장희원','xx','장희원','구매확정','신규주문',2500,'2917445931','헤어핀3','조합형옵션상품','컬러:블랙',2,0,5700,5700,5700,NULL,'010-0000-0002','서울특별시 송파구 오금로32길 5 (송파동, 가락삼익맨숀) 000동000호','010-4717-0039','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77',sysdate,NULL,'신용카드',NULL,NULL)
insert into sale_delivery values('2018052291233615','2018052252351032','seller123',NULL,NULL,NULL,'김덕순','junyoung12','장희원','구매확정','신규주문',2500,'2917445931','헤어핀3','조합형옵션상품','컬러:블랙',2,0,5700,5700,5700,NULL,'010-0000-0002','부산광역시 아파트','010-4717-0039','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77',sysdate,NULL,'신용카드',NULL,NULL)
insert into sale_delivery values('2018052291233616','2018052252351032','bbb',NULL,NULL,NULL,'이영희','zz','장희원','구매확정','신규주문',2500,'2917445931','헤어핀3','조합형옵션상품','컬러:블랙',2,0,5700,5700,5700,NULL,'010-0000-0002','서울 가좌동 32길 5 (가좌동, 주공아파트) 000동000호','010-4717-0039','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77',sysdate,NULL,'신용카드',NULL,NULL)

