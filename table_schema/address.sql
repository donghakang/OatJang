
-- address
create table address(
addrid number,
roadAddrPart1 varchar(100),
roadAddrPart2 varchar(100),
addrDetail varchar(100),
lat number,
lng number
)



create sequence addr_seq nocycle nocache;

drop table address;
drop sequence addr_seq;

select * from address;
