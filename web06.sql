

--데이터베이스 만들기(6일차)

CREATE DATABASE web06_db;

--데이터베이스 선택
USE web06_db;

-- 데이터베이스 용 계정 만들기
GRANT ALL PRIVILEGES ON web06_db.* TO web06@'%' IDENTIFIED BY '12345';
-- web06_db의 모든 권한(ALL PRIVILEGES)을 web06이라는 아이디를 가진 전체계정에 부여
-- web06 계정의 접근위치는 외부 전체(%)mysql
-- ex) 172.1.1.3 이라는 클라이언트만 접근하게 하겠다 TO web06@'172.1.1.3'
GRANT ALL PRIVILEGES ON web06_db.* TO web06@localhost IDENTIFIED BY '12345';

SELECT VERSION();


USE mysql;

SELECT user,host FROM USER 
--테이블 만들기
CREATE TABLE web06_user(-- excel sheet명은 web06_user)
-- excel colimn명 정의하는 곳
user_no INT,
user_name VARCHAR(50), -- 50자 가변 문자열
user_pwd VARCHAR(50),
insertDate DATETIME DEFAULT CURRENT_TIMESTAMP);

--만들어진 테이블 확인
SHOW TABLES;

--테이블 구조 확인
DESC web06_user;
--테이블 데이터 확인
SELECT * -- 모든컬럼
FROM web06_user;

--데이터 입력

INSERT INTO web06_user -- web06_user에 삽입
(
	user_no,
	user_name,
	user_pwd
	-- 데이터를 넣을 대상(컬럼)
) VALUES(
	1,
	'이찬진',
	1234
	-- 집어 넣을  데이터
)
INSERT INTO web06_user -- web06_user에 삽입
(
	user_no,
	user_name,
	user_pwd
	-- 데이터를 넣을 대상(컬럼)
) VALUES(
	1,
	'이찬진3',
	1234
)
	-- 집어 넣을  데이터
INSERT INTO web06_user -- web06_user에 삽입
(
	user_no,
	user_name,
	user_pwd
	-- 데이터를 넣을 대상(컬럼)
) VALUES(
	3,
	'lee',
	123
)
	-- 집어 넣을  데이터

-- 전체 컬럼 확인
SELECT *FROM web06_user;

-- 필요 컬럼 확인
SELECT user_name, user_pwd FROM web06_user;

SELECT * FROM web06_user

--데이터 수정하기
UPDATE 테이블명 SET 대상컬럼=값 (WHERE 컬럼명=값 혹은 !=<> >= ...)

-- user_no 가 1인 ROW user_name값을 killer로 변경
UPDATE web06_user SET user_name='killer' WHERE user_no=1;

SELECT * FROM web06_user

UPDATE web06_user SET user_name='killer';

--삭제(where 조건절없으면 data 전체 삭제)
DELETE FROM 테이블명 (WHERE 컬럼명=값)

--user_name이 killer인 회원 삭제
DELETE FROM web06_user WHERE user_name='killer'


-- user_no를 사용자 키로 변경(입력 안해도 자동으로 +1해줄수있게변경)
-- auto_INCREMENT
-- 테이블 수정은 alter 키워드 사용

DESC web06_user;

DELETE FROM web06_user;

ALTER TABLE web06_user MODIFY user_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

DESC web06_user;

INSERT INTO web06_user (user_name, user_pwd) VALUES('111','222');
SELECT * from web06_user;

INSERT INTO web06_user (user_name, user_pwd) VALUES('cks','123');

select * from web06_user where user_name = '' or 1=1 -- '
