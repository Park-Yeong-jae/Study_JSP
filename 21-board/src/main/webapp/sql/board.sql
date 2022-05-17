-- * 익명 게시판 글관리
-- 1) 테이블 생성
create table board2 (
    board_num number,                       -- 글번호
    board_name varchar2(20) not null,       -- 글작성자
    board_pass varchar2(15) not null,       -- 글비밀번호
    board_subject varchar2(200) not null,   -- 글제목
    board_content varchar2(4000) not null,  -- 글내용
    board_file varchar2(50) not null,       -- 첨부파일
    board_re_ref number not null,           -- 관련 글번호
    board_re_lev number not null,           -- 답글 레벨
    board_re_seq number not null,           -- 관련 글중 출력순서
    board_readcount number default 0,       -- 조회수
    board_date date,                        -- 작성일
    primary key(board_num)
);
-- 2) 테이블 삭제
drop table board2 purge;
-- 3) 테이블 확인
select * from tab;

-- 4) 시퀀스 객체 생성
create sequence seq_num nocycle nocache;
-- 5) 시퀀스 객체 삭제
drop sequence seq_num;

-- 6) insert : 데이터 저장
insert into board2 values
(seq_num.nextval, '홍길동', '1234', '내일은', '웃으리', 'aa.jpg',
seq_num.currval, 0, 0, 0, sysdate);

-- 7) select : 검색
select * from board2;
select * from board2 where board_num=1;

-- 8) 전체 데이터 개수 구하기
select count(*) as cnt from board2;

-- 9) 데이터 삭제
delete board2 where board_num=1;

-- 10) 데이터 저장
commit;

-- 11) 인덱스 뷰
select * from
(select ROWNUM rn, tt.* from
(select * from board2 order by board_num desc)tt)
where rn >= 1 and rn <=10;

-- 12) 글쓴이 인지 확인
select * from board2 where board_num=45;
-- 결과값에서 board_pass로 확인

-- 13) 글수정
-- 1) 글번화와 비밀번호를 함께 확인하고 수정
--  => 경고메시지를 "수정 실패입니다."만 사용할수 있음
update board2 set board_name='홍길동', 
board_subject='오늘은', board_content='크게 웃으리', board_date=sysdate 
where board_num=45 and board_pass='1234';
-- 2) 글쓴이를 확인하고 수정
--  => 경고메시지를 "수정할 권한이 없습니다.", "수정 실패입니다."로 사용할 수 있음
update board2 set board_name='홍길동', 
board_subject='오늘은', board_content='크게 웃으리', board_date=sysdate 
where board_num=45;

-- 14) 답글저장
-- 1. 기존글의 re_seq값 정리 : 같은 그룹에서 원글 보다 큰 re_seq값을 1씩 증가
update board2 set board_re_seq = board_re_seq + 1
where board_re_ref=72 and board_re_seq>0;

-- 2. 답글저장
-- re_ref = 원글의 re_ref
-- re_lev = 원글의 re_lev + 1
-- re_seq = 원글의 re_seq + 1
insert into board2 values
(seq_num.nextval, '홍길동', '1234', '내일은', '웃으리', ' ',
72, 1, 1, 0, sysdate);

-- 15) 답글에 대한 인덱스 뷰
-- => re_ref 기준 내림차순, 같은 값들은 re_seq 기준 오름차순으로 정렬시킴
select * from
(select ROWNUM rn, tt.* from
(select * from board2 order by board_re_ref desc, board_re_seq asc)tt)
where rn >= 1 and rn <=10;