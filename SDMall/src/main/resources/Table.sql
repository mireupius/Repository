create sequence goods_sq
MAXVALUE 9999
CYCLE
NOCACHE;

create table goods_tb				
(				
 gd_no 		number(13)		primary key,				
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
gt_gdno		varchar2(13)		not null,				
gt_mdlname   	varchar2(20 char),				
gt_maker     	varchar2(20 char),				
gt_brand     	varchar2(20 char),				
gt_mfd       	varchar2(20 char),				
gt_exp       	varchar2(20 char),				
gt_material  	varchar2(20 char),				
gt_weight    	varchar2(20 char),				
gt_volume    	varchar2(20 char),				
gt_origin    	varchar2(20 char),				
gt_stock     	number(7)		not null,				
gt_keyword   	varchar2 (40 char),				
gt_detail    	varchar2 (1000 char) 	not null 				
);				
				
create sequence category_sq
MAXVALUE 999
START WITH 100
CYCLE 
NOCACHE;

create table category_tb				
(				
ct_no 		number(3)		primary key,				
ct_clfname   	varchar2(50 char)	not null,				
ct_clf       	varchar2(1 char)	not null 				
);

				
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


insert into category_tb values(category_sq.nextval, '대분류3' , 1);
insert into category_tb values(category_sq.nextval, '중분류4' , 2);
insert into category_tb values(category_sq.nextval, '소분류4' , 3);



create table test_editor (
daumcontent long
);

drop table test_editor cascade constraint purge;

select * from test_editor;