select * FROM QUIZ_TABLE ;

--코멘트 입력법
COMMENT ON TABLE QUIZ_TABLE IS '퀴즈정보가 들어간 테이블' ;
COMMENT ON COLUMN QUIZ_TABLE.Q_ID IS '퀴즈ID' ;

CREATE TABLE bbb(
col1 VaRCHAR2(100) 
) ;

select * FROM bbb; 

--DROP
--DROP TABLE 테이블명 [CASCADE CONSTRAINT]
DROP TABLE 회원정보 ;  -- 외래키에 의해 참조된경우 에러

--CASCADE CONSTRAINT : (CASCADE : 연쇄적으로 ) 
DROP TABLE 회원정보 CASCADE CONSTRAINT ; --참조된경우 관계 모두 끊고 삭제

SELECT * FROM 회원정보 ;

--TRUNCATE 는 테이블의 데이터를 삭제한다.

--1. DELETE (ROLLBACK이 가능) : 되돌릴 수 있다 , 로그를 남기면서 삭제 . 속도 느림
DELETE FROM 성적표 ; --데이터 날림  , COMMIT 시 영구삭제

--2. TRUNCATE ( ROLLBACK이 불가능 ) : 영구삭제 , 로그x, 속도빠름 , 복원불가
TRUNCATE FROM 성적표 ;  -- where 사용불가, 모든데이터 날리기용 , table은 유지

--3. DROP (ROLLBACK 불가능) : 영구삭제
DROP TABLE 성적표 ; --테이블 날림

--RENAME : 테이블 이름 바꾸기

--시퀀스 : "순차적인"을 의미 , 자동으로 증가하는 값을 만들어주는 객체
CREATE SEQUENCE 직원ID_SEQ 
       INCREMENT BY 1  -- 증가할 시퀀스값
       START WITH 1    -- 
       MINVALUE 1
       MAXVALUE 9999 ;
       
select 직원ID_SEQ.NEXTVAL FROM DUAL ; --NEXTVAL : 다음값

INSERT INTO 직원 (
직원ID
, 비밀번호
, 이름
, 성별
, 나이
, 입사일시
, 주민등록번호
, 연봉
, 부서ID
) VALUES ( 
'A' || LPAD( 직원ID_SEQ.NEXTVAL , 4 , '0' )  -- LPAD : LEFTPAD  LPAD(넣을값,자릿수,LEFT비었을시 채울값)
, '비밀번호123' 
, '새직원'
, '여'
, 30
, SYSDATE 
, '930711-2441223' 
, 5000 
, 'D006' 
);
select * FROM 직원 ;
SELECT 'A' || LPAD( 직원ID_SEQ.NEXTVAL , 4 , '0' ) FROM DUAL;

DROP SEQUENCE 직원ID_SEQ ;

--뷰(VIEW) : 이 쿼리 자주 쓰니까 따로 저장좀 하고싶다. 
--AS 이하 문 쿼리 저장
CREATE VIEW 부서별최고연봉_VIEW AS 
SELECT 부서ID
     , MAX(연봉) AS 부서별최고연봉
  FROM 직원
 GROUP BY 부서ID
 ORDER BY 부서ID ;
 
DELETE FROM 직원 WHERE 이름 = '새직원' ;
COMMIT ; 

--뷰 사용법
SELECT * FROM 부서별최고연봉_VIEW ;

--주의사항
--Q. 뷰는 물리적인/실제 데이터를 가지고 있다 . (틀림) : 그냥 우리가 만들때 써놓은 쿼리(SQL)
--   을 재작성(REWRITE)할 뿐이다.

--뷰는 테이블같이 사용가능하다.
SELECT A.이름
     , A.연봉
     , B.부서별최고연봉
  FROM 직원 A
     , 부서별최고연봉_VIEW B
 WHERE A.부서ID = B.부서ID
   AND A.연봉 = B.부서별최고연봉 ; 
   
--인라인 뷰 : 서브쿼리 기술 중 하나로 FROM절에 쿼리를 작성해 가상의 테이블 처럼 사용하는 방식.
--위와 아래는 같은코드
SELECT A.이름
     , A.연봉
     , B.부서별최고연봉
  FROM 직원 A
     , (  
       SELECT 부서ID, MAX(연봉) AS 부서별최고연봉
         FROM 직원
        GROUP BY 부서ID
        ORDER BY 부서ID
        ) B
 WHERE A.부서ID = B.부서ID
   AND A.연봉 = B.부서별최고연봉 ; 
--뷰를 만든다는건 자주 쓰는 쿼리를 저장해놓고 쉽게 쓴다는것, 4줄정도는 그냥 인라인뷰로 넣어버린다.
--원하는 데이터만 보여줄 수 있게 해 보안 목적으로 사용 할 수 있다.
CREATE VIEW 직원_민감정보제외 AS
SELECT 직원ID
     , 이름
     , 부서ID
  FROM 직원 ;
   
SELEcT * FROM 직원_민감정보제외 ;

DROP VIEW 부서별최고연봉_VIEW ;

--TCL
--트랜잭션 이해
--트랜잭션 : 업무를 처리하기 위한 일련의 과정
--트랜잭션 도중에 하나라도 오류가 생기면 이전에 했던 모든 활동이 ROLLBACK된다.
--트랜잭션 특징 : 원자성(Atomicity), 일관성(Consistency)
             --, 고립성(isolation), 영속성/지속성(Duability)
--원자성 : 트랜잭션이 모두 완료되거나 하나라도 실패시 모두 원상복구 되어야한다.(ALL OR NOTHING)
--일관성 : 항상 일관적인 형태를 가져야한다. 트랜잭션 실행전이 정상이라면 실행 후도 정상이어야한다.
--고립성 : 트랜잭션은 서로 간섭하면 안된다.
--영속성 : 영구 저장을 했으면 반드시 반영되어야 한다.


UPDATE 직원
   SET 연봉 = 연봉 + 1000
 WHERE 직원ID = 'A0005';
 
 commit ; --반드시 commit 해야 데이터가 영구반영된다.
 
 select 직원ID,이름,연봉 from 직원 where 직원id = 'A0005';
 
--SAVEPOINT

--LOCK
UPDATE 직원
   SET 연봉 = 9999
 WHERE 직원ID = 'A0003' ;
 
 ROLLBACK ;
 
--오라클
 DML(데이터 조작어) : INSERT, UPDATE, DELETE            => 직접 COMMIT 을 해줘야 영구반영이 된다.
 DDL(데이터 정의어) : CREATE, ALTER, DROP, TRUNCATE     => 실행할때마다 자동으로 알아서 COMMIT 이 된다.
 
 INSERT ...
 CREATE ...   위에INSERT 도 알아서 COMMIT 이 된다.
 
 
 -----
 INSERT INTO ...
 COMMIT ;
 
 INSERT INTO ...
 DELETE ...
 UPDATE ...
 
 ROLLBACK ; --마지막 COMMIT 시점까지 돌아감.
  
 
 
--DCL
select * FROM 직원 ;
 
 