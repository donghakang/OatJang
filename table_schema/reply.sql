--edu:1234

select * from tab;
select * from reply;
drop table reply purge;

--primary key : unique + not null
create table reply(
rid NUMBER PRIMARY KEY,
iid NUMBER,
nickname VARCHAR2(10) NOT NULL,
content VARCHAR2(100),
ref NUMBER NOT NULL,
step NUMBER NOT NULL,
logtime DATE,
constraint fk_reply foreign key(iid) references item(iid) ON DELETE CASCADE);

create sequence seq_reply increment by 1 start with 1 nocycle nocache;
drop sequence seq_reply;
--commit