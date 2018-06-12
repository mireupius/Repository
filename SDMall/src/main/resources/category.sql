create table category_tb		
(		
ct_no varchar2(3 char)	primary key,
ct_clfname varchar2(50 char)	not null,
ct_clf varchar2(1 char)	not null,
ct_parentno varchar2(3 char)
);		

create sequence category_sq
MAXVALUE 999
START WITH 100
CYCLE 
NOCACHE;

drop table category_tb cascade constraint purge;
drop sequence category_sq;


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

select * from category_tb;


alter table category_tb add(parentno varchar2(3 char));
alter table category_tb RENAME COLUMN parentno to ct_parentno;

update category_tb set ct_parentno='100' where ct_clf='2';
update category_tb set ct_parentno='109' where ct_clf='3';

