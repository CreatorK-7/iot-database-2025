-- 쿼리 3-1 : 모든 도서의 이름과 가격을 검색하시오.
SELECT bookname, price
  FROM Book;
  
  -- 워크벤치에서 쿼리 실행할 땐 편함
SELECT *
  FROM Book;
  
  
-- 3-2 : 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오.
-- 파이썬, C# 등 프로그래밍언어로 가져갈 땐, 컬럼 이름 컬럼개수를 모두 파악해야 하기 때문에 아래와 같이 사용
SELECT bookid, bookname, publisher, price
  FROM Book;
  
-- 3-3 : 도서 테이블의 모든 출판사를 검색하시오.
-- 출판사별로 한번만 출력하면 좋겠음
-- ALL - 전부 다, DISTINCT - 중복제거하고 하나만
SELECT DISTINCT publisher
  FROM Book;
  
  
-- 3-4 : 도서 중 가격이 20000원 미만인 것을 검색하시오.
-- > 미만 < 초과 >= 이하 <= 이상 <> 같지 않다 != 같지 않다 = 같다(프로그래밍언어와 차이)
SELECT *
  FROM Book 
 WHERE price < 20000 
   AND publisher = '굿스포츠';
   
-- 3-5 : 가격이 10000원 이상 20000원 이하인 도서를 검색하시오.
SELECT * 
  FROM Book
 WHERE price >= 10000 AND price <= 20000;
 
SELECT * 
  FROM Book
 WHERE price BETWEEN 10000 AND 20000;
 
-- 3-6 : 출판사가 '굿스포츠' 또는 '대한미디어'인 도서를 검색하시오.
SELECT *
  FROM Book
 WHERE publisher IN ('굿스포츠', '대한미디어');
 
 SELECT *
  FROM Book
 WHERE publisher NOT IN ('굿스포츠', '대한미디어');
 
 
-- 3-7 : '축구의 역사'를 출간한 출판사를 검색하시오.
SELECT publisher
  FROM Book
 WHERE bookname = '축구의 역사';
 
-- 패턴
-- % 개수와 상관없이 글자가 포함되는 것
-- [] 은 MySQL에서는 사용불가
-- [0-5] 1개의 문자가 일치, 한글자 0에서 5의 숫자를 포함한다
-- [^} 1개의 문자가 일치하지 않는 것
-- _ 특정위치의 1개의 문자가 일치할 때 EX) _구 : 첫번째 글자는 뭐든지 상관없고 두번째 글자가 구로 되고 뒤에 글이 더 있다
 SELECT *
  FROM Book
 WHERE bookname LIKE '%_구%';
 
-- 추가 : 고객 중에서 전화번호가 없는 사람을 검색하시오.
SELECT *
  FROM Customer
 WHERE phone is NULL;
 
 SELECT *
  FROM Customer
 WHERE phone is NOT NULL;
 
-- 3-10 : 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.
SELECT *
  FROM Book
 WHERE bookname LIKE '%축구%' AND price >= 20000;
 
-- 3-12 : 도서를 이름 순(오름차순)으로 검색하시오.
-- ASC(ending), DESC(ending) - 오름차순은 생략 가능
SELECT *
  FROM Book
-- ORDER BY bookname ASC;
 ORDER BY bookname DESC;
 
-- 3-13 : 도서를 가격 순으로 검색하고, 가격이 같으면 이름 순으로 검색하시오.
SELECT *
  FROM Book
 ORDER BY price, bookname;
 
-- 3-14 : 도서 가격을 내림차순으로 검색하시오. 가격이 같다면 출판사를 오름차순으로 출력하시오.
SELECT *
  FROM Book
 ORDER BY price DESC, publisher;