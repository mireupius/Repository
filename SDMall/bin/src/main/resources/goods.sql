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