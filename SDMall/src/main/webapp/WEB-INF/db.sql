	-- 장바구니테이블은 옵션테이블이랑 상품테이블 조인시켜사용 --
	-- 장바구니 --
create table shoppingBasket(
sb_gd_no number(13) not null,
sb_csm_id varchar2(12 char) not null, 
sb_Pname varchar2 (20 char) not null,
sb_Pprice number (7) not null,
sb_PSprice number (7) not null,
sb_Img varchar2 (200 char) not null,  
sb_optionName varchar2 (20 char) not null,  -- 옵션이름
sb_optionPrice number (7) not null,  		-- 옵션 가격
sb_quantity number (4) not null,			-- 구매수량
sb_shippingFee varchar2 (20 char) not null	-- 택배비
);



delete from shoppingBasket where sb_gd_no=1111111111111 and sb_csm_id='cyh524';
select sb_PSprice*sb_quantity+sb_optionPrice as summoney from shoppingBasket where sb_csm_id='cyh524';
select sb_PSprice*sb_quantity+sb_optionPrice as summoneyALL from shoppingBasket where sb_csm_id='cyh524';
insert into shoppingBasket values(1111111111111,'cyh524','사과',2000,1000,'apple.png','알맹이실한거',2000,10,'5000'); 
insert into shoppingBasket values(2222222222222,'moon1765','사과',2000,1000,'apple.png','배',2000,5,'0'); 
insert into shoppingBasket values(3333333333333,'cyh524','원피스',50000,43000,'onepiece.jpg','여자 26L',500,1,'0'); 
insert into shoppingBasket values(4444444444444,'moon1765','모자',70000,60000,'manshoes.jpg','썬크림',10000,2,'2500'); 
insert into shoppingBasket values(5555555555555,'cyh524','단화',34000,30000,'Shoes.jpg','265mm',1000,1,'5000'); 
select * from shoppingBasket;

drop table  cascade constraint purge;

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

select op_no,op_gdno,op_name,op_price,op_stock from option_tb,shoppingBasket where sb_gd_no=op_gdno;


insert into option_tb values(11111,1111111111111,'알맹이실한거',2000,20);
insert into option_tb values(11112,1111111111111,'비실비실한거',1000,20);
insert into option_tb values(11113,1111111111111,'말랑말랑한거',500,20);
insert into option_tb values(11114,1111111111111,'익다만사과',100,20);
insert into option_tb values(33333,3333333333333,'여자 26L',500,20);
insert into option_tb values(55555,5555555555555,'265mm',1000,20);
insert into option_tb values(55556,5555555555555,'270mm',1500,20);
delete from option_tb where op_gdno=1111111111111;
select * from option_tb;

--옵션테이블 상품테이블 조인시키기--
select * from goods_tb,option_tb where op_gdno=gd_no;      

select * from 

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
insert into customer_reg values('moon1765','123123','최완희',sysdate,'01051990686','moon1765@naver.com');

select * from customer_reg;

select sb_PSprice*sb_quantity+sb_optionPrice as summoney from shoppingBasket where
		sb_csm_id = 'cyh524'
