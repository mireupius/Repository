create sequence goods_sq
MAXVALUE 9999
CYCLE
NOCACHE;

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
 gd_sellerid				varchar2 (12 char)		not null,
 gd_outarea					varchar2 (12 char)		not null
);

create sequence goodsdtl_sq
MAXVALUE 99999
CYCLE 
NOCACHE;

create table goodsdtl_tb
(
gt_no					varchar2(5 char)		primary key,
gt_gdno					varchar2(13 char)		not null,
gt_mdlname  			varchar2(20 char),
gt_maker    			varchar2(20 char),
gt_brand    			varchar2(20 char),
gt_mfd      			varchar2(20 char),
gt_exp      			varchar2(20 char),
gt_material 			varchar2(20 char),
gt_weight   			varchar2(20 char),
gt_volume   			varchar2(20 char),
gt_origin   			varchar2(20 char),
gt_keyword  			varchar2 (40 char),
gt_detail   			clob 					not null 
);


-- ↓↓↓↓↓↓↓↓↓↓  FK 설정  ↓↓↓↓↓↓↓↓↓↓↓↓↓↓
ALTER TABLE goodsdtl_tb
ADD CONSTRAINTS FK_GT_GDNO FOREIGN KEY(gt_gdno)
REFERENCES goods_tb(gd_no);
-- ↑↑↑↑↑↑↑↑↑↑↑ FK 설정 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

create sequence option_sq
MAXVALUE 99999
CYCLE 
NOCACHE;

create table option_tb
(
op_no				varchar2(5 char)			primary key,
op_gdno 			varchar2(13 char)			not null,
op_name 			varchar2(20 char) 			not null,
op_price 			number(7) 					not null,
op_stock 			number(4) 					not null 
);

-- ↓↓↓↓↓↓↓↓↓↓  FK 설정  ↓↓↓↓↓↓↓↓↓↓↓↓↓↓
ALTER TABLE option_tb
ADD CONSTRAINTS FK_OP_GDNO FOREIGN KEY(op_gdno)
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
ct_no 					varchar2 (3 char)		primary key,
ct_clfname  			varchar2(50 char)		not null,
ct_clf      			varchar2(1 char)		not null,
ct_parentno				varchar2 (3 char)
);


--=====================================================================

insert into goods_tb values('1001091130001','티셔츠1','69900','58900','5000','20180626150037-fe3-ede06d317c41.jpg','20180626150037-fe3-ede06d317c41.jpg','20180626150037-fe3-ede06d317c41.jpg','20180626150037-fe3-ede06d317c41.jpg','100','109','113','cyh524','대한통운');
insert into goods_tb values('1001091140002','블라우스1','68000','68000','5000','20180626150339-c84-e53d97fbf24d.jpg','20180626150339-c84-e53d97fbf24d.jpg','20180626150339-c84-e53d97fbf24d.jpg','20180626150339-c84-e53d97fbf24d.jpg','100','109','114','cyh524','대한통운');
insert into goods_tb values('1001091170004','아티스트노보','68900','65000','2500','20180626150835-1cc-6f0c11419ff6.png','20180626150835-1cc-6f0c11419ff6.png','20180626150835-1cc-6f0c11419ff6.png','20180626150835-1cc-6f0c11419ff6.png','100','109','117','aaaaaaaaaaaa','종로11');
insert into goods_tb values('1001091150005','상품명가디건','58900','58900','5000','20180626153851-ab7-ed68f4ad9908.jpg','20180626153851-ab7-ed68f4ad9908.jpg','20180626153851-ab7-ed68f4ad9908.jpg','20180626153851-ab7-ed68f4ad9908.jpg','100','109','115','cyh524','대한통운');
insert into goods_tb values('1001091160007','기본원피스','88000','88000','5000','20180626154314-8c7-23895544d0c5.jpg','20180626154314-8c7-23895544d0c5.jpg','20180626154314-8c7-23895544d0c5.jpg','20180626154314-8c7-23895544d0c5.jpg','100','109','116','cyh524','대한통운');
insert into goods_tb values('1001091170008','썸머플리츠스커트3종세트','89900','39900','5000','20180626154528-ae9-048df43298f1.jpg','20180626154528-ae9-048df43298f1.jpg','20180626154528-ae9-048df43298f1.jpg','20180626154528-ae9-048df43298f1.jpg','100','109','117','cyh524','대한통운');


insert into goodsdtl_tb values('1','1001091130001','티셔츠M1','(주)쎄레뜨','펠틱스','20180520','NULL','NULL','200g','NULL','태국','티셔츠','<p><br></p><p style="text-align: center;"><img src="/mall/upload/board/images/20180626145743-51f-e8cbfe4ff11f.jpg" class="txc-image" style="clear:none;float:none;" /></p><p style="text-align: center;">티셔츠1</p><p><br></p>');
insert into goodsdtl_tb values('2','1001091140002','보헤미안블라우스','주식회사베프글로벌','A+G','NULL','NULL','NULL','NULL','NULL','중국','블라우스','<p><br></p><p style="text-align: center;"><img src="/mall/upload/board/images/20180626150148-519-b674d385d165.jpg" class="txc-image" style="clear:none;float:none;" /></p><p style="margin-left: 14em;"> 블라우스1<br></p>');
insert into goodsdtl_tb values('4','1001091170004','아티스트00','엠에스텍스','엠에스텍스','20180626','NULL','면60%,모달40%','1','20','한국','노보','<p><br></p><p style="text-align: center;"><br></p><p style="text-align: center;"><img src="/mall/upload/board/images/20180626150111-b7a-da0b96d18ca1.png" class="txc-image" style="clear:none;float:none;" /></p><p style="text-align: center;"><br></p><p style="text-align: center;"><img src="/mall/upload/board/images/20180626150120-3fc-c8807d738ce0.png" class="txc-image" style="clear:none;float:none;" /></p><p style="text-align: center;"><br></p><p style="text-align: center;"><img src="/mall/upload/board/images/20180626150130-a1c-5dd1ab058c6e.png" class="txc-image" style="clear:none;float:none;" /></p><p style="text-align: center;"><br></p><p><br></p>');
insert into goodsdtl_tb values('5','1001091150005','샬라얀이태리원사','엠에이치코퍼레이션','Chalayan','NULL','NULL','NULL','NULL','NULL','한국','가디건','<p><br></p><p style="text-align: center;"><img src="/mall/upload/board/images/20180626153725-a7c-00dded08b971.jpg" class="txc-image" style="clear:none;float:none;" /></p><p style="margin-left: 24em;">가디건<br></p>');
insert into goodsdtl_tb values('7','1001091160007','썸머시그니처원피스','J&K','래비티','NULL','NULL','NULL','NULL','NULL','태국','원피스','<p><br></p><p style="text-align: center;"><img src="/mall/upload/board/images/20180626154201-ddf-21bc3fbd1ddb.jpg" class="txc-image" style="clear:none;float:none;" /></p><p style="margin-left: 22em;">원피스!<br></p>');
insert into goodsdtl_tb values('8','1001091170008','썸머플리츠스커트','엠프로미스','리베레츠','NULL','NULL','NULL','NULL','NULL','중국','스커트','<p><br></p><p style="text-align: center;"><img src="/mall/upload/board/images/20180626154424-a6e-36bb1e7470c0.jpg" class="txc-image" style="clear:none;float:none;" /></p><p style="margin-left: 24em;">스커트<br></p>');


insert into option_tb values('1','1001091130001','95','58900','20');
insert into option_tb values('2','1001091130001','100','58900','15');
insert into option_tb values('3','1001091130001','105','58900','10');
insert into option_tb values('4','1001091140002','4set/55','68000','5');
insert into option_tb values('5','1001091140002','4set/66','68000','10');
insert into option_tb values('6','1001091140002','4set/77','68000','2');
insert into option_tb values('7','1001091170004','5set/44','68900','20');
insert into option_tb values('8','1001091170004','5set/55','68900','20');
insert into option_tb values('9','1001091170004','5set/66','69000','20');
insert into option_tb values('10','1001091150005','펄블랙/55','58900','2');
insert into option_tb values('11','1001091150005','펄블랙/66','58900','0');
insert into option_tb values('12','1001091150005','펄블랙/77','58900','1');
insert into option_tb values('13','1001091160007','블랙/44','88000','2');
insert into option_tb values('14','1001091160007','블랙/55','88000','0');
insert into option_tb values('15','1001091160007','블랙/66','88000','2');
insert into option_tb values('16','1001091170008','블랙/44','88000','2');
insert into option_tb values('17','1001091170008','블랙/55','88000','0');
insert into option_tb values('18','1001091170008','블랙/66','88000','2');

--=====================================================================


drop table goods_tb cascade constraint purge;
drop sequence goods_sq;
drop table goodsdtl_tb cascade constraint purge;
drop sequence goodsdtl_sq;
drop table category_tb cascade constraint purge;
drop sequence category_sq;
drop table option_tb cascade constraint purge;
drop sequence option_sq;

