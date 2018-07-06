create table category_tb		
(		
ct_no varchar2(3 char)	primary key,
ct_clfname varchar2(50 char)	not null,
ct_clf varchar2(1 char)	not null,
ct_parentno varchar2(3 char)
);	/*카테고리 테이블*/

create sequence category_sq
MAXVALUE 999
START WITH 100
CYCLE 
NOCACHE;/*카테고리 sequence*/

update sale_delivery
		set sd_claim = NULL
		where sd_customer_id = 'junyoung12'

select sum(sd_total_price)
		from sale_delivery;
		where sd_delivery_state = '구매확정' and sd_customer_id = 'junyoung12';

insert into category_tb values(to_char(category_sq.nextval),'패션의류',1,null);
insert into category_tb values(to_char(category_sq.nextval),'잡화/보석',1,null);
insert into category_tb values(to_char(category_sq.nextval),'스포츠/아웃도어',1,null);
insert into category_tb values(to_char(category_sq.nextval),'뷰티',1,null);
insert into category_tb values(to_char(category_sq.nextval),'식품/주방',1,null);
insert into category_tb values(to_char(category_sq.nextval),'출산/유아동',1,null);
insert into category_tb values(to_char(category_sq.nextval),'가구/인테리어',1,null);
insert into category_tb values(to_char(category_sq.nextval),'생활/건강/취미',1,null);
insert into category_tb values(to_char(category_sq.nextval),'가전/디지털',1,null);
/*대분류*/

insert into category_tb values(to_char(category_sq.nextval),'여성의류',2,100);
insert into category_tb values(to_char(category_sq.nextval),'남성의류',2,100);
insert into category_tb values(to_char(category_sq.nextval),'캐주얼의류',2,100);
insert into category_tb values(to_char(category_sq.nextval),'언더웨어',2,100);

insert into category_tb values(to_char(category_sq.nextval),'가방/지갑/패션소품',2,101);
insert into category_tb values(to_char(category_sq.nextval),'슈즈/스니커즈',2,101);
insert into category_tb values(to_char(category_sq.nextval),'쥬얼리/시계',2,101);
insert into category_tb values(to_char(category_sq.nextval),'수입명품',2,101);

insert into category_tb values(to_char(category_sq.nextval),'스포츠/아웃도어 의류',2,102);
insert into category_tb values(to_char(category_sq.nextval),'스포츠잡화/슈즈',2,102);
insert into category_tb values(to_char(category_sq.nextval),'수영/스키/기타스포츠',2,102);
insert into category_tb values(to_char(category_sq.nextval),'헬스/요가/자전거',2,102);
insert into category_tb values(to_char(category_sq.nextval),'골프',2,102);
insert into category_tb values(to_char(category_sq.nextval),'캠핑/등산/낚시',2,102);

insert into category_tb values(to_char(category_sq.nextval),'화장품/향수',2,103);
insert into category_tb values(to_char(category_sq.nextval),'명품화장품',2,103);
insert into category_tb values(to_char(category_sq.nextval),'헤어/바디/미용기기',2,103);

insert into category_tb values(to_char(category_sq.nextval),'주방용품',2,104);
insert into category_tb values(to_char(category_sq.nextval),'신선식품',2,104);
insert into category_tb values(to_char(category_sq.nextval),'가공식품',2,104);
insert into category_tb values(to_char(category_sq.nextval),'건강식품/다이어트',2,104);

insert into category_tb values(to_char(category_sq.nextval),'기저귀/물티슈',2,105);
insert into category_tb values(to_char(category_sq.nextval),'임신/출산/이유식',2,105);
insert into category_tb values(to_char(category_sq.nextval),'위생/스킨케어',2,105);
insert into category_tb values(to_char(category_sq.nextval),'외출용품/유모차',2,105);
insert into category_tb values(to_char(category_sq.nextval),'유아가구/매트',2,105);
insert into category_tb values(to_char(category_sq.nextval),'유아동도서',2,105);
insert into category_tb values(to_char(category_sq.nextval),'유아완구',2,105);
insert into category_tb values(to_char(category_sq.nextval),'유아동패션',2,105);

insert into category_tb values(to_char(category_sq.nextval),'거실/침실가구',2,106);
insert into category_tb values(to_char(category_sq.nextval),'학생/주방/시스템가구',2,106);
insert into category_tb values(to_char(category_sq.nextval),'침구/커튼/카페트',2,106);
insert into category_tb values(to_char(category_sq.nextval),'홈데코/인테리어소품',2,106);

insert into category_tb values(to_char(category_sq.nextval),'생활/수납/청소',2,107);
insert into category_tb values(to_char(category_sq.nextval),'세제/제지/위생',2,107);
insert into category_tb values(to_char(category_sq.nextval),'건강/안마용품',2,107);
insert into category_tb values(to_char(category_sq.nextval),'도서/악기',2,107);
insert into category_tb values(to_char(category_sq.nextval),'문구/오피스/꽃배달',2,107);
insert into category_tb values(to_char(category_sq.nextval),'디자인/취미/여행용품',2,107);
insert into category_tb values(to_char(category_sq.nextval),'반려동물',2,107);

insert into category_tb values(to_char(category_sq.nextval),'TV/냉장고/세탁기',2,108);
insert into category_tb values(to_char(category_sq.nextval),'계절가전/에어컨',2,108);
insert into category_tb values(to_char(category_sq.nextval),'생활가전',2,108);
insert into category_tb values(to_char(category_sq.nextval),'주방가전',2,108);
insert into category_tb values(to_char(category_sq.nextval),'영상/음향가전',2,108);
insert into category_tb values(to_char(category_sq.nextval),'컴퓨터/주변기기',2,108);
insert into category_tb values(to_char(category_sq.nextval),'휴대폰/주변기기',2,108);
insert into category_tb values(to_char(category_sq.nextval),'디카/게임기/태블릿',2,108);
insert into category_tb values(to_char(category_sq.nextval),'블랙박스/자동차',2,108);
/*중분류*/

insert into category_tb values(to_char(category_sq.nextval),'티셔츠',3,109);
insert into category_tb values(to_char(category_sq.nextval),'블라우스/셔츠',3,109);
insert into category_tb values(to_char(category_sq.nextval),'니트/가디건',3,109);
insert into category_tb values(to_char(category_sq.nextval),'원피스/투피스',3,109);
insert into category_tb values(to_char(category_sq.nextval),'스커트',3,109);
insert into category_tb values(to_char(category_sq.nextval),'팬츠/데님',3,109);
insert into category_tb values(to_char(category_sq.nextval),'자켓/점퍼/코트',3,109);
insert into category_tb values(to_char(category_sq.nextval),'한복/테마의류',3,109);

insert into category_tb values(to_char(category_sq.nextval),'아우터',3,110);
insert into category_tb values(to_char(category_sq.nextval),'정장',3,110);
insert into category_tb values(to_char(category_sq.nextval),'상의',3,110);
insert into category_tb values(to_char(category_sq.nextval),'하의',3,110);

insert into category_tb values(to_char(category_sq.nextval),'티셔츠',3,111);
insert into category_tb values(to_char(category_sq.nextval),'셔츠/남방',3,111);
insert into category_tb values(to_char(category_sq.nextval),'니트/가디건/조끼',3,111);
insert into category_tb values(to_char(category_sq.nextval),'바지/청바지',3,111);
insert into category_tb values(to_char(category_sq.nextval),'자켓/점퍼/코트',3,111);
insert into category_tb values(to_char(category_sq.nextval),'트레이닝',3,111);

insert into category_tb values(to_char(category_sq.nextval),'여성언더웨어',3,112);
insert into category_tb values(to_char(category_sq.nextval),'남성언더웨어',3,112);
insert into category_tb values(to_char(category_sq.nextval),'주니어언더웨어',3,112);
insert into category_tb values(to_char(category_sq.nextval),'보정웨어',3,112);
insert into category_tb values(to_char(category_sq.nextval),'파자마/이지웨어/내의',3,112);
insert into category_tb values(to_char(category_sq.nextval),'양말',3,112);
insert into category_tb values(to_char(category_sq.nextval),'스타킹/레깅스',3,112);
insert into category_tb values(to_char(category_sq.nextval),'임산부언더웨어',3,112);
insert into category_tb values(to_char(category_sq.nextval),'섹시언더웨어',3,112);
insert into category_tb values(to_char(category_sq.nextval),'언더웨어소품',3,112);

insert into category_tb values(to_char(category_sq.nextval),'여성가방',3,113);
insert into category_tb values(to_char(category_sq.nextval),'남성가방',3,113);
insert into category_tb values(to_char(category_sq.nextval),'여행가방',3,113);
insert into category_tb values(to_char(category_sq.nextval),'여성지갑',3,113);
insert into category_tb values(to_char(category_sq.nextval),'남성지갑',3,113);
insert into category_tb values(to_char(category_sq.nextval),'패션소품',3,113);

insert into category_tb values(to_char(category_sq.nextval),'여성슈즈',3,114);
insert into category_tb values(to_char(category_sq.nextval),'남성슈즈',3,114);
insert into category_tb values(to_char(category_sq.nextval),'스니커즈/운동화',3,114);
insert into category_tb values(to_char(category_sq.nextval),'유아동신발',3,114);
insert into category_tb values(to_char(category_sq.nextval),'효도화/컴포트화',3,114);
insert into category_tb values(to_char(category_sq.nextval),'슈즈소품',3,114);

insert into category_tb values(to_char(category_sq.nextval),'귀걸이',3,115);
insert into category_tb values(to_char(category_sq.nextval),'목걸이/펜던트/체인',3,115);
insert into category_tb values(to_char(category_sq.nextval),'반지/커플링',3,115);
insert into category_tb values(to_char(category_sq.nextval),'팔찌/발찌',3,115);
insert into category_tb values(to_char(category_sq.nextval),'쥬얼리세트',3,115);
insert into category_tb values(to_char(category_sq.nextval),'시계',3,115);
insert into category_tb values(to_char(category_sq.nextval),'순금/순은바',3,115);
insert into category_tb values(to_char(category_sq.nextval),'순금쥬얼리',3,115);
insert into category_tb values(to_char(category_sq.nextval),'헤어/쥬얼리소품',3,115);

insert into category_tb values(to_char(category_sq.nextval),'여성가방',3,116);
insert into category_tb values(to_char(category_sq.nextval),'여성지갑',3,116);
insert into category_tb values(to_char(category_sq.nextval),'여성신발',3,116);
insert into category_tb values(to_char(category_sq.nextval),'여성의류',3,116);
insert into category_tb values(to_char(category_sq.nextval),'남성가방',3,116);
insert into category_tb values(to_char(category_sq.nextval),'남성지갑',3,116);
insert into category_tb values(to_char(category_sq.nextval),'남성신발',3,116);
insert into category_tb values(to_char(category_sq.nextval),'남성의류',3,116);
insert into category_tb values(to_char(category_sq.nextval),'패션소품',3,116);
insert into category_tb values(to_char(category_sq.nextval),'명품유아동',3,116);

insert into category_tb values(to_char(category_sq.nextval),'남성스포츠의류',3,117);
insert into category_tb values(to_char(category_sq.nextval),'여성스포츠의류',3,117);
insert into category_tb values(to_char(category_sq.nextval),'유아동스포츠의류',3,117);
insert into category_tb values(to_char(category_sq.nextval),'아웃도어의류',3,117);

insert into category_tb values(to_char(category_sq.nextval),'남성스포츠화',3,118);
insert into category_tb values(to_char(category_sq.nextval),'여성스포츠화',3,118);
insert into category_tb values(to_char(category_sq.nextval),'아동스포츠화',3,118);
insert into category_tb values(to_char(category_sq.nextval),'스포츠가방',3,118);
insert into category_tb values(to_char(category_sq.nextval),'스포츠모자',3,118);
insert into category_tb values(to_char(category_sq.nextval),'스포츠소품',3,118);

insert into category_tb values(to_char(category_sq.nextval),'실내수영복',3,119);
insert into category_tb values(to_char(category_sq.nextval),'여성비치웨어',3,119);
insert into category_tb values(to_char(category_sq.nextval),'남성비치웨어',3,119);
insert into category_tb values(to_char(category_sq.nextval),'아동비치웨어',3,119);
insert into category_tb values(to_char(category_sq.nextval),'수영/비치용품',3,119);
insert into category_tb values(to_char(category_sq.nextval),'스킨스쿠버/카약장비',3,119);
insert into category_tb values(to_char(category_sq.nextval),'스키/보드복',3,119);
insert into category_tb values(to_char(category_sq.nextval),'스키장비',3,119);
insert into category_tb values(to_char(category_sq.nextval),'보드장비',3,119);
insert into category_tb values(to_char(category_sq.nextval),'스키보드용품',3,119);
insert into category_tb values(to_char(category_sq.nextval),'기타스포츠',3,119);

insert into category_tb values(to_char(category_sq.nextval),'헬스/요가',3,120);
insert into category_tb values(to_char(category_sq.nextval),'자전거/부품',3,120);
insert into category_tb values(to_char(category_sq.nextval),'자전거의류',3,120);
insert into category_tb values(to_char(category_sq.nextval),'자전거잡화/용품',3,120);
insert into category_tb values(to_char(category_sq.nextval),'인라인/킥보드/전동휠',3,120);

insert into category_tb values(to_char(category_sq.nextval),'골프의류/잡화',3,121);
insert into category_tb values(to_char(category_sq.nextval),'골프클럽',3,121);
insert into category_tb values(to_char(category_sq.nextval),'골프용품',3,121);

insert into category_tb values(to_char(category_sq.nextval),'캠핑',3,122);
insert into category_tb values(to_char(category_sq.nextval),'등산',3,122);
insert into category_tb values(to_char(category_sq.nextval),'낚시',3,122);

insert into category_tb values(to_char(category_sq.nextval),'스킨케어',3,123);
insert into category_tb values(to_char(category_sq.nextval),'클렌징',3,123);
insert into category_tb values(to_char(category_sq.nextval),'베이스메이크업',3,123);
insert into category_tb values(to_char(category_sq.nextval),'포인트메이크업',3,123);
insert into category_tb values(to_char(category_sq.nextval),'선케어',3,123);
insert into category_tb values(to_char(category_sq.nextval),'더모코스메틱',3,123);
insert into category_tb values(to_char(category_sq.nextval),'남성화장품',3,123);
insert into category_tb values(to_char(category_sq.nextval),'네일케어',3,123);
insert into category_tb values(to_char(category_sq.nextval),'향수/홈프래그런스',3,123);
insert into category_tb values(to_char(category_sq.nextval),'미용소품',3,123);

insert into category_tb values(to_char(category_sq.nextval),'스킨케어',3,124);
insert into category_tb values(to_char(category_sq.nextval),'클렌징',3,124);
insert into category_tb values(to_char(category_sq.nextval),'베이스메이크업',3,124);
insert into category_tb values(to_char(category_sq.nextval),'포인트메이크업',3,124);
insert into category_tb values(to_char(category_sq.nextval),'선케어',3,124);
insert into category_tb values(to_char(category_sq.nextval),'남성화장품',3,124);
insert into category_tb values(to_char(category_sq.nextval),'향수/홈프래그런스',3,124);
insert into category_tb values(to_char(category_sq.nextval),'헤어케어',3,124);
insert into category_tb values(to_char(category_sq.nextval),'바디케어',3,124);
insert into category_tb values(to_char(category_sq.nextval),'핸드/풋/덴탈케어',3,124);
insert into category_tb values(to_char(category_sq.nextval),'피부/바디기기',3,124);
insert into category_tb values(to_char(category_sq.nextval),'미용소품',3,124);

insert into category_tb values(to_char(category_sq.nextval),'헤어케어',3,125);
insert into category_tb values(to_char(category_sq.nextval),'헤어스타일링',3,125);
insert into category_tb values(to_char(category_sq.nextval),'샤워/입욕용품',3,125);
insert into category_tb values(to_char(category_sq.nextval),'바디케어',3,125);
insert into category_tb values(to_char(category_sq.nextval),'바디스페셜케어',3,125);
insert into category_tb values(to_char(category_sq.nextval),'핸드/풋/덴탈케어',3,125);
insert into category_tb values(to_char(category_sq.nextval),'헤어기기',3,125);
insert into category_tb values(to_char(category_sq.nextval),'피부/바디기기',3,125);

insert into category_tb values(to_char(category_sq.nextval),'냄비/솥',3,126);
insert into category_tb values(to_char(category_sq.nextval),'후라이팬/그릴',3,126);
insert into category_tb values(to_char(category_sq.nextval),'식기/홈세트',3,126);
insert into category_tb values(to_char(category_sq.nextval),'보관/밀폐용기/쌀통',3,126);
insert into category_tb values(to_char(category_sq.nextval),'보온/보냉용품',3,126);
insert into category_tb values(to_char(category_sq.nextval),'주전자/포트',3,126);
insert into category_tb values(to_char(category_sq.nextval),'컵/머그/잔',3,126);
insert into category_tb values(to_char(category_sq.nextval),'칼/도마/가위',3,126);
insert into category_tb values(to_char(category_sq.nextval),'조리도구',3,126);
insert into category_tb values(to_char(category_sq.nextval),'커트러리',3,126);
insert into category_tb values(to_char(category_sq.nextval),'주방수납용품',3,126);
insert into category_tb values(to_char(category_sq.nextval),'주방잡화',3,126);
insert into category_tb values(to_char(category_sq.nextval),'베이킹/커피용품',3,126);

insert into category_tb values(to_char(category_sq.nextval),'쌀',3,127);
insert into category_tb values(to_char(category_sq.nextval),'잡곡/혼합곡',3,127);
insert into category_tb values(to_char(category_sq.nextval),'과일',3,127);
insert into category_tb values(to_char(category_sq.nextval),'뿌리채소/열매채소',3,127);
insert into category_tb values(to_char(category_sq.nextval),'견과',3,127);
insert into category_tb values(to_char(category_sq.nextval),'건과/건채소',3,127);
insert into category_tb values(to_char(category_sq.nextval),'한우/육우',3,127);
insert into category_tb values(to_char(category_sq.nextval),'돼지고기',3,127);
insert into category_tb values(to_char(category_sq.nextval),'수입 소고기/돼지고기',3,127);
insert into category_tb values(to_char(category_sq.nextval),'닭고기',3,127);
insert into category_tb values(to_char(category_sq.nextval),'오리고기',3,127);
insert into category_tb values(to_char(category_sq.nextval),'생선',3,127);
insert into category_tb values(to_char(category_sq.nextval),'해산물/어패류',3,127);
insert into category_tb values(to_char(category_sq.nextval),'건어물/해조류',3,127);









/*소분류*/

select * from category_tb;
drop table category_tb cascade constraint purge;
drop sequence category_sq;


/*************************************************
alter table category_tb add(parentno varchar2(3 char));
alter table category_tb RENAME COLUMN parentno to ct_parentno;

update category_tb set ct_parentno='100' where ct_clf='2';
update category_tb set ct_parentno='109' where ct_clf='3';


drop table category_tb cascade constraint purge;
drop sequence category_sq;