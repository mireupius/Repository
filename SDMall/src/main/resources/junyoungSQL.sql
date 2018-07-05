-- 구매자 회원가입
create table customer_reg(
csm_id varchar2(12 char) primary key,
csm_pw varchar2(15 char) not null,
csm_name varchar2(10 char) not null,
csm_birth date not null,
csm_phoneNo varchar2(11 char) not null,
csm_emailAddress varchar2(30 char) not null
);


select * 
		from sale_delivery, goods_tb
		where ((sd_customer_id = 'junyoung12' and sd_claim is null)
		or ((sd_customer_id = 'junyoung12' and sd_claim not like '%'||'교환'||'%')
			 and (sd_customer_id = 'junyoung12' and sd_claim not like '%'||'취소'||'%')
			 and (sd_customer_id = 'junyoung12' and sd_claim not like '%'||'반품'||'%'))
		)
		and gd_no = sd_product_no and sd_customer_id = 'junyoung12'
		and (sd_order_date between (select add_months(SYSDATE, -6) from dual) and (select SYSDATE from dual))




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
CREATE SEQUENCE question_Answer_seq
START WITH 1
MAXVALUE 9999
MINVALUE 1
CYCLE
NOCACHE
;

create table question_Answer(
qa_regNo varchar2(12 char) primary key,
qa_orderNo varchar2(16 char) not null,
qa_csm_id varchar2(12 char) not null,
qa_sl_id varchar2(12 char) not null,
qa_gdNo varchar2(13 char) not null,
qa_gdName varchar2(20 char) not null,
qa_questionTitle varchar2(20 char) not null,
qa_questionContent varchar2(200 char) not null,
qa_answer varchar2(200 char),
qa_qRegDate varchar2(20 char) not null,
qa_aRegDate varchar2(20 char),
qa_sort varchar2(10 char) not null,
qa_check varchar2(5 char) not null

);

drop table question_Answer cascade constraint purge;
drop sequence question_Answer_seq;
select * from question_Answer

-- 샘플 데이터
insert into question_Answer values(
	to_char(SYSDATE,'yyyyMMdd') || LPAD(question_Answer_seq.nextval, 4, 0),
		'15313135', 'junyoung00',
		'seller00','7777888855553', '연필', '배송문의요', '어제 상품주문했는데 배송언제되요',
		'오늘이나 내일 출고됩니다','2018-08-09', '2018-08-09', '배송', '미답변'
	)


-- 상품평 테이블
-- 따로 직접 insert 할 필요없음(마이페이지에서 직접 입력하고 테스트 해봐야함)
CREATE SEQUENCE product_Review_seq
START WITH 1
MAXVALUE 9999
MINVALUE 1
CYCLE
NOCACHE
;

create table product_Review(
pr_regNo varchar2(12 char) primary key,
pr_orderNo varchar2(16 char) not null,
pr_csm_id varchar2(12 char) not null,
pr_comment varchar2(100 char) not null,
pr_gdNo varchar2(13 char) not null,
pr_gdName varchar2(20 char) not null,
pr_star varchar2(1 char) not null,
pr_regDate varchar2(8 char) not null
);

drop table product_Review cascade constraint purge;
drop sequence product_Review_seq;


-- 샘플 데이터
insert into product_Review values(
	to_char(SYSDATE,'yyyyMMdd') || LPAD(product_Review_seq.nextval, 4, 0),
		'15313135', 'dsfsdfs',
		'sdfsfdsd', '131311', 'dsfsdf', '1', '2018-08-09'
	)
	
select * from product_Review


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
	
insert into sale_delivery values('2018052291233613','2018052252351030','seller123',NULL,NULL,NULL,'장희원','junyoung12','장희원','구매확정','신규주문',2500,'2917445931','헤어핀1번','조합형옵션상품','컬러:레드',2,0,5700,5700,5700,NULL,'010-0000-0002','서울특별시 송파구 오금로32길 5 (송파동, 가락삼익맨숀) 000동000호','010-4717-0039','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77','2018-06-25',NULL,'신용카드',NULL,NULL, 'Y')
insert into sale_delivery values('2018052291233614','2018052252351031','aaa',NULL,NULL,NULL,'장희원','xx','장희원','구매확정','신규주문',2500,'2917445931','헤어핀notjunyoung','조합형옵션상품','컬러:블랙',2,0,5700,5700,5700,NULL,'010-0000-0002','서울특별시 송파구 오금로32길 5 (송파동, 가락삼익맨숀) 000동000호','010-4717-0039','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77',sysdate,NULL,'신용카드',NULL,NULL, null)
insert into sale_delivery values('2018052291233615','2018052252351032','seller123',NULL,NULL,NULL,'김덕순','junyoung12','장희원','결제완료','신규주문',2500,'2917445931','헤어핀3번','조합형옵션상품','컬러:블루',2,0,5700,5700,5700,NULL,'010-0000-0002','부산광역시 아파트','010-4717-0039','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77','2017-01-08',NULL,'신용카드',NULL,NULL, null)
insert into sale_delivery values('2018052291233616','2018052252351032','seller123',NULL,NULL,NULL,'이영희','junyoung12','장희원','배송중','신규주문',2500,'2917445931','헤어핀4번','조합형옵션상품','컬러:옐로우',2,0,5700,5700,5700,NULL,'010-0000-0002','서울 가좌동 32길 5 (가좌동, 주공아파트) 000동000호','010-4717-0039','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77','2017-08-22',NULL,'신용카드',NULL,NULL, null)
insert into sale_delivery values('2018052291233617','2018052252351036','seller123',NULL,NULL,NULL,'영구','junyoung12','장희원','구매확정','신규주문',2500,'2917445931','헤어핀5번','조합형옵션상품','컬러:옐로우',2,0,5700,5700,5700,NULL,'010-0000-0002','서울 연남동 192길 12 (연남동, 삼성아파트) 000동000호','010-3369-2239','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77','2017-01-30',NULL,'신용카드',NULL,NULL, 'Y')
insert into sale_delivery values('2018052291233618','2018052252351040','seller123',NULL,NULL,NULL,'뇌병','junyoung12','장희원','배송중','신규주문',2500,'2917445931','헤어핀6번','조합형옵션상품','컬러:퍼플',2,0,5700,5700,5700,NULL,'010-0000-0002','서울 연남동 192길 12 (연남동, 삼성아파트) 000동000호','010-3369-2239','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77','2017-01-30',NULL,'신용카드',NULL,NULL, null)
insert into sale_delivery values('2018052291233619','2018052252351040','seller123',NULL,NULL,NULL,'염탁','junyoung12','장희원','구매확정','신규주문',2500,'2917445931','헤어핀7번','조합형옵션상품','컬러:그린',2,0,5700,5700,5700,NULL,'010-0000-0002','서울 연남동 192길 12 (연남동, 삼성아파트) 000동000호','010-3369-2239','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77','2017-01-30',NULL,'신용카드',NULL,NULL, null)
insert into sale_delivery values('2018052291233620','2018052252351040','seller123',NULL,NULL,NULL,'강운지','junyoung12','장희원','구매확정','신규주문',2500,'2917445931','헤어핀8번','조합형옵션상품','컬러:마젠다',2,0,5700,5700,5700,NULL,'010-0000-0002','서울 연남동 192길 12 (연남동, 삼성아파트) 000동000호','010-3369-2239','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77','2017-01-30',NULL,'신용카드',NULL,NULL, null)

insert into sale_delivery values('2018052291233630','2018052252351040','seller123',NULL,NULL,NULL,'강운지','junyoung12','장희원','구매확정','신규주문',2500,'1001091580001','헤어핀8번','조합형옵션상품','컬러:마젠다',2,0,5700,5700,5700,NULL,'010-0000-0002','서울 연남동 192길 12 (연남동, 삼성아파트) 000동000호','010-3369-2239','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77','2017-01-30',NULL,'신용카드',NULL,NULL, null);
insert into sale_delivery values('2018052291233631','2018052252351040','seller123',NULL,NULL,NULL,'강운지','junyoung12','장희원','구매확정','신규주문',2500,'1001111710002','헤어핀10번','조합형옵션상품','컬러:마젠다',2,0,5700,5700,5700,NULL,'010-0000-0002','서울 연남동 192길 12 (연남동, 삼성아파트) 000동000호','010-3369-2239','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77','2017-01-30',NULL,'신용카드',NULL,NULL, null);

insert into sale_delivery values('2018052291233639','2018052252351040','seller123',NULL,NULL,NULL,'강운지','junyoung12','장희원','구매확정','신규주문',2500,'1001111710002','헤어핀10번','조합형옵션상품','컬러:마젠다',2,0,5700,5700,5700,NULL,'010-0000-0002','서울 연남동 192길 12 (연남동, 삼성아파트) 000동000호','010-3369-2239','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77','2018-05-30',NULL,'신용카드',NULL,NULL, null);
insert into sale_delivery values('2018052291233640','2018052252351040','seller123',NULL,NULL,NULL,'강운지','junyoung12','장희원','구매확정','신규주문',2500,'1001111710002','헤어핀10번','조합형옵션상품','컬러:마젠다',2,0,5700,5700,5700,NULL,'010-0000-0002','서울 연남동 192길 12 (연남동, 삼성아파트) 000동000호','010-3369-2239','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77','2018-02-20',NULL,'신용카드',NULL,NULL, null);
insert into sale_delivery values('2018052291233641','2018052252351040','seller123',NULL,NULL,NULL,'강운지','junyoung12','장희원','구매확정','신규주문',2500,'1001111710001','헤어핀10번','조합형옵션상품','컬러:마젠다',2,0,5700,5700,5700,NULL,'010-0000-0002','서울 연남동 192길 12 (연남동, 삼성아파트) 000동000호','010-3369-2239','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77','2018-03-21',NULL,'신용카드',NULL,NULL, null);
insert into sale_delivery values('2018052291233642','2018052252351040','seller123',NULL,NULL,NULL,'강운지','junyoung12','장희원','구매확정','신규주문',2500,'1001111710001','헤어핀10번','조합형옵션상품','컬러:마젠다',2,0,5700,5700,5700,NULL,'010-0000-0002','서울 연남동 192길 12 (연남동, 삼성아파트) 000동000호','010-3369-2239','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77','2018-03-21',NULL,'신용카드',NULL,NULL, null);



insert into sale_delivery values('2018071711153333','2018052252351040','seller123',NULL,NULL,NULL,'강운지','junyoung12','장희원','구매확정','신규주문',2500,'2917445931','헤어핀8번','조합형옵션상품','컬러:마젠다',2,0,5700,5700,5700,NULL,'010-0000-0002','서울 연남동 192길 12 (연남동, 삼성아파트) 000동000호','010-3369-2239','05675',NULL,'(04306) 서울특별시 용산구 청파로71길  77-77','2017-01-30',NULL,'신용카드',NULL,NULL, null)
insert into product_Review values(
	to_char(SYSDATE,'yyyyMMdd') || LPAD(product_Review_seq.nextval, 4, 0),
		'2018071711153333', 'xcvxcv',
		'uiyu', '846448', 'vbvnv', '1', '2018-08-10'
	)
	


select * from sale_delivery;