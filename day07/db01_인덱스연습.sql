-- 기존테이블 삭제
drop table if exists NewBook;

-- 테이블 생성
create table NewBook (
	bookid INTEGER auto_increment primary key,
	bookname varchar(100),
    publisher varchar(100),
    price INTEGER
);

-- 500만건 더미 데이터 생성 설정
SET SESSION cte_max_recursion_depth = 5000000;

-- 더미 데이터 생성
insert into NewBook (bookname, publisher, price)
with recursive cte(n) as
(
	select 1
    union all
    select n+1 from cte where n < 5000000
)
select concat('Book', lpad(n, 7, '0'))	-- Book5000000
	 , concat('Book', lpad(n, 7, '0'))	-- Comp5000000
     , floor(3000 + rand() * 30000) as price	-- 책가격 300~33000
from cte;

-- 데이터 확인
select count(*) from NewBook;

-- 가격을 7개 정도 검색할 수 있는 쿼리 작성
select * from NewBook
 WHERE price in (8377, 14567, 24500, 33000, 5600, 6700, 15000);
 
-- 인덱스 생성
create index idx_book on NewBook(price);