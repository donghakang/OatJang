
-- address
create table address(
addrid number,
addr1 varchar(100),
addr2 varchar(100),
addr3 varchar(100),
lat number,
lng number
)



create sequence addr_seq nocycle nocache;

drop table address;
drop sequence addr_seq;

select * from address;
