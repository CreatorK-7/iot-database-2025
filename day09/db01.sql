DROP TABLE IF EXISTS students; -- 현재 테이블 삭제
CREATE TABLE students(
        std_id      INTEGER      PRIMARY KEY AUTO_INCREMENT, -- AUTO_INCREMENT는 MySQL 옵션.
        std_name    VARCHAR(100) NOT NULL,
        std_mobile  VARCHAR(20)  NULL,
        std_regyear INTEGER      NOT NULL
        );
        
-- 더미데이터 추가
INSERT INTO students (std_name, std_mobile, std_regyear)
VALUES ('홍길동', '010-9999-9999', 2020);