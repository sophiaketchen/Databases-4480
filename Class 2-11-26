create table ingredients(
  ing_id varchar2(4) primary key not null,
  ing_name varchar(16)
);

insert into ingredients values('1234', 'bread');
insert into ingredients values('1235', 'cheese');
insert into ingredients values('PB23', 'penaut butter');
insert into ingredients values('JE23', 'jelly');
insert into ingredients values('M234', 'milk');
insert into ingredients values('CC12', 'cheerios');
insert into ingredients values('EE12', 'eggs');

select * from ingredients;

create table recipes(
  rec_id varchar2(6) primary key not null,
  rec_name varchar(16)
);

insert into recipes values('FT01', 'french toast');
insert into recipes values('GC01', 'grilled cheese');


select * from recipes;

create table ing2rec(
  ing_id varchar2(4),
  rec_id varchar2(16)
);

insert into ing2rec values('1234', 'FT01');
insert into ing2rec values('M234', 'FT01');
insert into ing2rec values('EE12', 'FT01');

select * from ing2rec;

select rec_name, ing_name from recipes, ingredients, ing2rec
where recipes.rec_id = ing2rec.rec_id 
and ingredients.ing_id = ing2rec.ing_id 
and recipes.rec_id = 'FT01';

select rec_name, ing_id  from  recipes, ingredients
join ing2rec on ing2rec.ing_id = ingredients.ing_id;


