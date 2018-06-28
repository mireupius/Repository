CREATE TABLE SHOPPINGBAG_TB(
SB_NO  VARCHAR2(13 CHAR) PRIMARY KEY,
SB_CSMID  VARCHAR2(12 CHAR) NOT NULL,
SB_GDNO VARCHAR2(13 CHAR) NOT NULL,
SB_OPNO VARCHAR2(5 char) NOT NULL,
SB_QUANTITY NUMBER(3) NOT NULL
);

SELECT SB_NO, GD_NAME, GD_IMGM, OP_NAME, SB_QUANTITY, OP_PRICE, GD_PRICE FROM SHOPPINGBAG_TB, GOODS_TB, OPTION_TB WHERE 
GD_NO = SB_GDNO AND OP_NO = SB_OPNO and SB_CSMID = 'vip150';


create sequence shoppingbag_seq;

drop sequence SHOPPINGBAG_Seq;

drop table SHOPPINGBAG_TB cascade constraint purge;
drop table option_tb cascade constraint purge;


create table goods_tb
(
 gd_no 						varchar2 (13 char)		primary key,
 gd_name  					varchar2(20 char) 		not null,
 gd_csmprice 				number(7) 				not null,
 gd_price    				number(7) 				not null,
 gd_dlvchrg   				varchar2(20 char) 		not null,
 gd_imgl  					varchar2(200 char) 		not null,
 gd_imgm  					varchar2(200 char) 		not null,
 gd_imgs  					varchar2(200 char) 		not null,
 gd_imgss 					varchar2(200 char) 		not null,
 gd_clfl  					varchar2(3 char)		not null,
 gd_clfm   					varchar2(3 char),
 gd_clfs   					varchar2(3 char),
 gd_sellerid				varchar2 (12 char)		not null
);


insert into SHOPPINGBAG_TB values('8888888888888','vip150','7777777777777','옵션1',5);
insert into SHOPPINGBAG_TB values('9999999999999','vip150','0000000010002','옵션1',4);
insert into SHOPPINGBAG_TB values('3333333333333','vip150','0000000010003','옵션1',3);
insert into SHOPPINGBAG_TB values('2222222222222','vip150','0000000010004','옵션1',2);
insert into SHOPPINGBAG_TB values('6666666666666','vip150','0000000010005','옵션1',1);

select * from GOODS_TB;
select * from SHOPPINGBAG_TB;
select * from OPTION_TB;

SELECT SB_NO, GD_NAME, GD_IMGM, OP_NAME, SB_QUANTITY, OP_PRICE, GD_PRICE FROM SHOPPINGBAG_TB, GOODS_TB, OPTION_TB WHERE 
GD_NO = SB_GDNO AND OP_NO = SB_OPNO and SB_CSMID = 'vip150';





ALTER TABLE SHOPPINGBAG_TB
ADD CONSTRAINTS FK_SB_CSMID FOREIGN KEY(SB_CSMID)
REFERENCES CUSTOMER_REG(CSM_ID);

ALTER TABLE SHOPPINGBAG_TB
ADD CONSTRAINTS FK_SB_GDNO FOREIGN KEY(SB_GDNO)
REFERENCES GOODS_TB(GD_NO);

ALTER TABLE SHOPPINGBAG_TB
ADD CONSTRAINTS FK_SB_OPNO FOREIGN KEY(SB_OPNO)
REFERENCES OPTION_TB(OP_NO);

select * from SHOPPINGBAG_TB;

