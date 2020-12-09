--edu:1234

select * from tab;
select * from item;
drop table item purge;

--primary key : unique + not null
create table item(
    iid number(10) primary key,
    userid number(10),
    title varchar(30) not null,
    price number(10) not null,
    images varchar(50),
    description varchar(100),
    category NUMBER(10),
    success number(1),
    bid varchar(10),
    hit number default 0,
    logtime date default sysdate,
    constraint fk_item foreign key(userid) references users(userid));

-- insert into users(id,pwd,name,point) values('admin','1111','어드민',35.34);
-- insert into users(id,pwd,name,point) values('abcd','1111','테스트',65.78);
commit
create sequence seq_item increment by 1 start with 1 nocycle nocache;
select * from item;
drop sequence seq_item;
delete item;