
create sequence seq_reply increment by 1 start with 1 nocycle nocache;
create sequence seq_item increment by 1 start with 1 nocycle nocache;
create sequence addr_seq nocycle nocache;
create sequence user_seq nocycle nocache;

create table users(
userid number(10) primary key,
id varchar(10) unique,
pw varchar(10) not null,
name varchar(10) not null,
nickname varchar(10),
age number(10),
phone number(10),
addrid number(10));

create table address(
addrid number,
roadAddrPart1 varchar(100),
roadAddrPart2 varchar(100),
addrDetail varchar(100),
lat number,
lng number
)

create table item(
    iid number(10) primary key,
    userid number(10),
    addrid number(10),
    title varchar2(30) not null,
    price number(10) not null,
    images varchar2(500),
    description varchar2(500),
    category NUMBER(10),
    success number(1),
    bid varchar2(20),
    reply number(6) default 0,
    hit number default 0,
    logtime date default sysdate,
    constraint fk_item foreign key(userid) references users(userid));
    

create table reply(
rid NUMBER PRIMARY KEY,
iid NUMBER,
nickname VARCHAR2(10) NOT NULL,
content VARCHAR2(100),
ref NUMBER NOT NULL,
step NUMBER NOT NULL,
logtime DATE,
constraint fk_reply foreign key(iid) references item(iid) ON DELETE CASCADE);

select * from tab;


