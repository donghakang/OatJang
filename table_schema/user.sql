--edu:1234

select * from tab;
select * from users;
drop table users purge;

drop table emp;
--primary key : unique + not null



create table users(
U_ID      NUMBER(10) PRIMARY KEY,
ID       VARCHAR2(10) unique,
PW       VARCHAR2(10) not null,
NAME     VARCHAR2(10) not null,
NICKNAME VARCHAR2(10),
AGE      NUMBER(10),
PHONE    VARCHAR2(20),
ADDR     VARCHAR2(50));     

insert into users values (1, 'abcd', '1234', 'amy', 'bamy', 24, '01029028330', 'seoul');
-- insert into users(id,pwd,name,point) values('admin','1111','어드민',35.34);
-- insert into users(id,pwd,name,point) values('abcd','1111','테스트',65.78);
commit

select * from users;