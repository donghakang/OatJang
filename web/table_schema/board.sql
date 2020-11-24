select * from tab;
drop table board purge;
select * from board;

CREATE TABLE board(
     seq NUMBER NOT NULL,                     --글번호
     id VARCHAR2(20) NOT NULL,              --아이디
     name VARCHAR2(40) NOT NULL,         --이름
     email VARCHAR2(40),                         --이메일
     subject VARCHAR2(255) NOT NULL,     --제목
     content VARCHAR2(4000) NOT NULL,   --내용 

     ref NUMBER NOT NULL,                       --그룹번호
     lev NUMBER DEFAULT 0 NOT NULL,      --단계
     step NUMBER DEFAULT 0 NOT NULL,    --글순서
     pseq NUMBER DEFAULT 0 NOT NULL,   --원글번호
     reply NUMBER DEFAULT 0 NOT NULL,   --답변수

     hit NUMBER DEFAULT 0,                      --조회수
     logtime DATE DEFAULT SYSDATE
 );

select * from board;

--☆ 시퀀스 객체 작성
create sequence 시퀀스객체명
create sequence seq_board  nocache nocycle;

--☆ 시퀀스 객체 삭제
drop   sequence 시퀀스객체명
drop   sequence seq_board

--☆ 자동으로 1씩 증가하는 값을 얻어오기
select seq_board.nextval from dual


select * from board;