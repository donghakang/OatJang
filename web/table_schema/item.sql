--edu:1234

select * from tab;
select * from item;
drop table item purge;

--primary key : unique + not null
create table item(
    iid number(10) primary key,
    uid number(10) foreign key,
    title varchar(30) not null,
    price number(10) not null,
    images varchar(30),
    description varchar(100),
    category NUMBER(10),
    success number(1),
    bid varchar(10));

-- insert into users(id,pwd,name,point) values('admin','1111','어드민',35.34);
-- insert into users(id,pwd,name,point) values('abcd','1111','테스트',65.78);
commit

select * from item;