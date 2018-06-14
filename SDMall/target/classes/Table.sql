create sequence goods_sq
MAXVALUE 9999
CYCLE
NOCACHE;

--상품코드(카테고리 9자리 + 시퀀스4)
create table goods_tb				
(				
 gd_no 		varchar2 (13 char)	primary key,				
 gd_name  	varchar2(20 char) 	not null,				
 gd_csmprice 	number(7) 		not null,				
 gd_price    	number(7) 		not null,				
 gd_dlvchrg   	varchar2(20 char) 	not null,				
 gd_imgl  	varchar2(200 char) 	not null,				
 gd_imgm  	varchar2(200 char) 	not null,				
 gd_imgs  	varchar2(200 char) 	not null,				
 gd_imgss 	varchar2(200 char) 	not null,				
 gd_clfl  	number(3)		not null,				
 gd_clfm   	number(3),				
 gd_clfs   	number(3)				
);				

create sequence goodsdtl_sq		
MAXVALUE 99999
CYCLE 
NOCACHE;

create table goodsdtl_tb				
(				
gt_no		varchar2(5)		primary key,				
gt_gdno		varchar2(13)	not null,				
gt_mdlname  varchar2(20 char),				
gt_maker    varchar2(20 char),				
gt_brand    varchar2(20 char),				
gt_mfd      varchar2(20 char),				
gt_exp      varchar2(20 char),				
gt_material varchar2(20 char),				
gt_weight   varchar2(20 char),				
gt_volume   varchar2(20 char),				
gt_origin   varchar2(20 char),				
gt_stock    number(7)		not null,				
gt_keyword  varchar2 (40 char),				
gt_detail   clob 	not null 				
);


-- ↓↓↓↓↓↓↓↓↓↓  FK 설정  ↓↓↓↓↓↓↓↓↓↓↓↓↓↓
ALTER TABLE goodsdtl_tb
ADD CONSTRAINTS FK_GT_GDNO FOREIGN KEY(gt_gdno)
REFERENCES goods_tb(gd_no);
-- ↑↑↑↑↑↑↑↑↑↑↑ FK 설정 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑


--카테고리번호 (시퀀스번호3자리)
create sequence category_sq
MAXVALUE 999
START WITH 100
CYCLE 
NOCACHE;

create table category_tb				
(				
ct_no 		varchar2 (3 char)	primary key,				
ct_clfname  varchar2(50 char)	not null,				
ct_clf      varchar2(1 char)	not null,
ct_parentno	varchar2 (3 char)
);

insert into category_tb values(to_char(category_sq.nextval),'패션의류',1,null);
insert into category_tb values(to_char(category_sq.nextval),'잡화/보석',1,null);
insert into category_tb values(to_char(category_sq.nextval),'스포츠/아웃도어',1,null);
insert into category_tb values(to_char(category_sq.nextval),'뷰티',1,null);
insert into category_tb values(to_char(category_sq.nextval),'식품/주방',1,null);
insert into category_tb values(to_char(category_sq.nextval),'출산/유아동',1,null);
insert into category_tb values(to_char(category_sq.nextval),'가구/인테리어',1,null);
insert into category_tb values(to_char(category_sq.nextval),'생활/건강/취미',1,null);
insert into category_tb values(to_char(category_sq.nextval),'가전/디지털',1,null);

insert into category_tb values(to_char(category_sq.nextval),'여성의류',2,100);
insert into category_tb values(to_char(category_sq.nextval),'남성의류',2,100);
insert into category_tb values(to_char(category_sq.nextval),'캐주얼의류',2,100);
insert into category_tb values(to_char(category_sq.nextval),'언더웨어',2,100);

insert into category_tb values(to_char(category_sq.nextval),'티셔츠',3,109);
insert into category_tb values(to_char(category_sq.nextval),'블라우스/셔츠',3,109);
insert into category_tb values(to_char(category_sq.nextval),'니트/가디건',3,109);
insert into category_tb values(to_char(category_sq.nextval),'원피스/투피스',3,109);
insert into category_tb values(to_char(category_sq.nextval),'스커트',3,109);
insert into category_tb values(to_char(category_sq.nextval),'팬츠/데님',3,109);
insert into category_tb values(to_char(category_sq.nextval),'자켓/점퍼/코트',3,109);
insert into category_tb values(to_char(category_sq.nextval),'한복/테마의류',3,109);

				
create sequence option_sq
MAXVALUE 99999
CYCLE 
NOCACHE;

create table option_tb				
(				
op_no		varchar2(5)		primary key,				
op_gdno 	varchar2(13)		not null,				
op_name 	varchar2(20 char) 	not null,				
op_price 	number(7) 		not null,				
op_stock 	number(4) 		not null 				
);				
				
create table viewdgd_tb				
(				
vg_csmid	varchar2(12) not null,				
vg_gdno 	varchar2(1000)				
);


drop table goods_tb cascade constraint purge;
drop sequence goods_sq;
drop table goodsdtl_tb cascade constraint purge;
drop sequence goodsdtl_sq;
drop table category_tb cascade constraint purge;
drop sequence category_sq;
drop table option_tb cascade constraint purge;
drop sequence option_sq;
drop table viewdgd_tb cascade constraint purge;
drop table customer_reg cascade constraint purge;
drop table seller_reg cascade constraint purge;
drop table membership cascade constraint purge;
drop table questionAnswer cascade constraint purge;


insert into category_tb values(category_sq.nextval, '대분류1' , 1);
insert into category_tb values(category_sq.nextval, '중분류2' , 2);
insert into category_tb values(category_sq.nextval, '소분류3' , 3);

select * from category_tb;

create table test_editor (
daumcontent clob
);

drop table test_editor cascade constraint purge;

select * from test_editor;

desc test_editor



