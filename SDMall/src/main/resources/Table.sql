create sequence goods_sq;		
create table goods_tb			
(			
 gdno  number (13) primary key,			
 gdname   varchar2 (20 char) not null,			
 gtprice     number (7)	not null,	
 gtdlvchrg    varchar2 (20 char) not null,			
 gdcsmprice  number (7) not null,			
 gdimgl   varchar2 (200 char) not null,			
 gdimgm   varchar2 (200 char) not null,			
 gdimgs   varchar2 (200 char) not null,			
 gdimgss  varchar2 (200 char) not null,			
 gdclfl   number (3) not null,			
 gdclfm   number (3),			
 gdclfs   number (3)			
);

create sequence goodsdtl_sq;	
create table goodsdtl_tb			
(			
gtno        number (5) primary key,
gtgdno      number (13) not null,
gtmdlname   varchar2 (20 char),		
gtmaker     varchar2 (20 char),			
gtbrand     varchar2 (20 char),			
gtmfd       varchar2 (20 char),			
gtexp       varchar2 (20 char),			
gtmaterial  varchar2 (20 char),			
gtweight    varchar2 (20 char),			
gtvolume    varchar2 (20 char),			
gtorigin    varchar2 (20 char),			
gtstock     number (7) not null ,			
gtkeyword   varchar2 (40 char),			
gtdetail    varchar2 (1000 char) not null 			
);			
			
create sequence category_sq	;		
create table category_tb			
(			
ctno         number (3) primary key,			
ctclfname    varchar2 (50 char) not null,			
ctclf        varchar2 (1 char) not null			
);			
			
create sequence option_sq;		
create table option_tb			
(			
	opno  number(5) primary key,		
	opgdno  number(13) not null,		
	opname  varchar2 (20 char) not null,		
	opprice  number(7) not null,		
	opstock  number(4) not null		
);			
			
create table viewdgd_tb			
(			
	csmid varchar2(12) not null ,		
	gdnos varchar2(12)		
);			

create table customer_reg(
csm_id varchar2(12 char) primary key,
csm_pw varchar2(15 char) not null,
csm_name varchar2(10 char) not null,
csm_birth date not null,
csm_phoneNo varchar2(11 char) not null,
csm_emailAddress varchar2(30 char) not null
);


create table seller_reg(
sl_id varchar2(12 char) primary key,
sl_pw varchar2(15 char) not null,
sl_coName varchar2(10 char) not null,
sl_coRegNo varchar2(10 char) not null,
sl_phoneNo varchar2(11 char) not null,
sl_emailAddress varchar2(30 char) not null
);


create table membership(
ms_id varchar2(12 char) primary key,
ms_grade varchar2(5 char) not null,
ms_totalBuy number(10) not null,
ms_point number(7) not null
);


create table questionAnswer(
qa_RegNo number(4) primary key,
qa_orderNo varchar2(13 char) not null,
qa_csm_id varchar2(12 char) not null,
qa_pName varchar2(50 char) not null,
qa_question varchar2(100 char) not null,
qa_answer varchar2(100 char) not null,
qa_regDate date not null
);
