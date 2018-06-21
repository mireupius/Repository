create table goods_tb		
(		
 gd_no 	varchar2(13)	primary key,
 gd_name  	varchar2(20 char) 	not null,
 gd_csmprice 	number(7) 	not null,
 gd_price    	number(7) 	not null,
 gd_dlvchrg   	varchar2(20 char) 	not null,
 gd_imgl  	varchar2(200 char) 	not null,
 gd_imgm  	varchar2(200 char) 	not null,
 gd_imgs  	varchar2(200 char) 	not null,
 gd_imgss 	varchar2(200 char) 	not null,
 gd_clfl  	varchar2 (3char)	not null,
 gd_clfm   	varchar2 (3char),	
 gd_clfs   	varchar2 (3char),	
 gd_sellerid	varchar2 (12char)	not null
);		

drop table goods_tb cascade constraint purge;

insert into goods_tb values('9998887774445','tomcat',10000,9000,'0,0','방사능 고양이.png','방사능 고양이.png','방사능 고양이.png','방사능 고양이.png','100','109','113','apache');
insert into goods_tb values('3338777498778','tomdog',20000,20000,'0,2500','방사능 고양이.png','방사능 고양이.png','방사능 고양이.png','방사능 고양이.png','100','109','113','apache');
insert into goods_tb values('1184523498778','호랑이',70000,33000,'0,2500','방사능 고양이.png','방사능 고양이.png','방사능 고양이.png','방사능 고양이.png','100','109','113','apache');

select * from goods_tb;
select * from goods_tb

create table goodsdtl_tb		
(		
gt_no	varchar2(5)	primary key,
gt_gdno	varchar2(13)	not null,
gt_mdlname   	varchar2(20 char),	
gt_maker     	varchar2(20 char),	
gt_brand     	varchar2(20 char),	
gt_mfd       	varchar2(20 char),	
gt_exp       	varchar2(20 char),	
gt_material  	varchar2(20 char),	
gt_weight    	varchar2(20 char),	
gt_volume    	varchar2(20 char),	
gt_origin    	varchar2(20 char),	
gt_stock     	number(7)	not null,
gt_keyword   	varchar2 (40 char),	
gt_detail    	clob 	not null 
);		

create sequence goodsdtl_sq
MAXVALUE 99999
CYCLE 
NOCACHE;

ALTER TABLE goodsdtl_tb
ADD CONSTRAINTS FK_GT_GDNO FOREIGN KEY(gt_gdno)
REFERENCES goods_tb(gd_no);

insert into goodsdtl_tb values(to_char(goodsdtl_sq.nextval),'9998887774445','고양이1','톰캣제조사','아파치','2055/09/15','2065/06/01','가죽','10','80','미국',20,'고양이,가죽,아파치','고양이제품상세');
insert into goodsdtl_tb values(to_char(goodsdtl_sq.nextval),'3338777498778','고양이2','톰캣제조사','아파치','2015/09/15','2035/06/01','인조가죽','20','50','미국',22,'고양이,가죽,아파치','고양이제품상세');
insert into goodsdtl_tb values(to_char(goodsdtl_sq.nextval),'1184523498778','호랑이1','호랑이굴','아파치2','2025/09/15','2045/06/01','호랑이가죽','55','180','미국',5,'호랑이,가죽,아파치','호랑이제품상세');

select * from goodsdtl_tb;

create table option_tb		
(		
op_no	varchar2(5)	primary key,
op_gdno 	varchar2(13 char)	not null,
op_name 	varchar2(20 char) 	not null,
op_price 	number(7) 	not null,
op_stock 	number(4) 	not null 
);		

create sequence option_sq
MAXVALUE 99999
CYCLE 
NOCACHE;


insert into OPTION_TB values(to_char(option_sq.nextval),'9998887774445','블랙',8000,100);
insert into OPTION_TB values(to_char(option_sq.nextval),'9998887774445','화이트',5000,50);
insert into OPTION_TB values(to_char(option_sq.nextval),'9998887774445','레드',0,200);
select * from option_tb;