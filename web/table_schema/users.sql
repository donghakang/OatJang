--edu:1234

select * from tab;
select * from users;
drop table users purge;

--primary key : unique + not null
create table users(
userid number(10) primary key,
id varchar(10) unique,
pw varchar(10) not null,
name varchar(10) not null,
nickname varchar(10),
age number(10),
phone number(10),
addrid number(10));
-- insert into users(id,pwd,name,point) values('admin','1111','어드민',35.34);
-- insert into users(id,pwd,name,point) values('abcd','1111','테스트',65.78);
commit
--insert into users values(1,'abcd','1111','테스트','테스트',20,1111,'서울');
select * from users;


-- address
create table address(
addrid number,
addr1 varchar(100),
addr2 varchar(100),
addr3 varchar(100),
lat number,
lng number
)


create sequence user_seq nocycle nocache;
create sequence addr_seq nocycle nocache;

drop table users;
drop table address;
drop sequence user_seq;
drop sequence addr_seq;

select * from users;
select * from address;
