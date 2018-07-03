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

