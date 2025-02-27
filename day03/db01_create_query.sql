-- 데이터베이스 생성
CREATE DATABASE sample;

-- 데이터베이스 생성(CharSet, Collatin 지정)
CREATE DATABASE sample2
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- 데이터베이스 변경
ALTER DATABASE sample
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- 데이터베이스 삭제
-- 운영 DB에서 실행하면 .............
DROP DATABASE sample2;

-- 테이블 생성
-- 3-34 NewBook 테이블 생성하세요. 정수현은 Integer사용, 문자형은 가변형인 Varchar를 사용하십시오.
-- 기본키를 설정합니다.
-- 기본키가 두개 이상일 경우 아래와 같이 작성해야함
CREATE TABLE NewBook(
					 bookId 		INTEGER,
					 bookName 		VARCHAR(255),
					 publisher		VARCHAR(50),
                     price			INTEGER,
                     PRIMARY KEY	(bookId, publisher)
					);

-- 기본키가 하나면 컬럼 하나에 작성 가능. 키본키가 두개 이상일 경우
-- 컬럼에 PRIMARY KEY 두군데 이상 작성 불가
CREATE TABLE NewBook(
					 bookId 	INTEGER	 PRIMARY KEY,
					 bookName 	VARCHAR(255),
					 publisher	VARCHAR(50),
                     price		INTEGER
					);
                    
DROP TABLE NewBook;

-- 테이블 생성시, 제약조건을 추가하는 기능
-- bookname은 NULL을 가질 수 없고, publisher는 같은 값이 있으면 안 됨.
-- price는 값이 입력되지 않은 경우 기본값인 10000을 저장
-- 최소가격은 1000원이상으로 한다

CREATE TABLE NewBook (
					 bookId 		INTEGER,
					 bookName 		VARCHAR(255) 	NOT NULL,
					 publisher		VARCHAR(50) 	UNIQUE,
                     price			INTEGER			DEFAULT 10000 CHECK (price >= 1000),
                     PRIMARY KEY	(bookId)
				     );
                     
-- 3-35 아래 속성의 NewCustomer 테이블을 생성하시오.
-- custId - INTEGER, 기본키
-- name - VARCHAR(100) NOT NULL
-- address - VARCHAR(255) NOT NULL
-- phone -VARCHAR(30) NOT NULL
CREATE TABLE NewCustomer(
					custId	INTEGER 		PRIMARY KEY,
					name  	VARCHAR(100) 	NOT NULL,
					address VARCHAR(255) 	NOT NULL,
					phone 	VARCHAR(30) 	NOT NULL
						 );
                        
-- 3-36 다음과 같은 속성의 NewOrders를 생성하시오
-- orderId - INTEGER, PRIMARY KEY
-- bookId - INTEGER, NOTNULL, FOREING KEY(NewBooK bookId)
-- custId - INTEGER, NOTNULL, FOREING KEY(NewCustomer custId)
-- saleprice - INTEGER
-- orderdate - DATE
CREATE TABLE NewOrders(
					orderId 	INTEGER, 
					bookId 		INTEGER 	NOT NULL,
					custId 		INTEGER 	NOT NULL,
					saleprice 	INTEGER,
					orderdate 	DATE,
					PRIMARY KEY (orderId),
					FOREIGN KEY (bookId) 	REFERENCES NewBook(bookId) ON DELETE CASCADE,
					FOREIGN KEY (custId) 	REFERENCES NewCustomer(custId) ON DELETE CASCADE
					   );
