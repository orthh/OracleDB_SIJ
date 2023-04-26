select * from 직원 ;
select 직원ID, 패스워드,이름, 성별, 연봉 --원하는 컬럼만 가져온다,
FROM 직원 --데이터를 가져올 테이블을 정한다. 
WHERE 성별 = '남'; --원하는 행만 가져오도록 조건을 준다.
--실행은 CTRL + ENTER

--주석  한줄
/*
 abcc
*/

-- 문자 ' ' 사용



select 이름
     , 나이 
  from  직원 
  where 직원ID = 'A0001';
select * from 직원 where 직원ID = 'A0001' AND 패스워드='12345';
select * from 직원 where 직원ID = 'A0001' OR 직원ID = 'A0002';


/************************** 실습 *****************************/ 
SELECT  직원ID
     ,  입사일시 
     ,  주민등록번호
     ,  연봉
     ,  부서ID 
  FROM  직원 ;
  
SELECT 부서ID
     , 부서명
     , 근무지 
  FROM 부서 ;
  
SELECT 직원ID
     , 구분코드
     , 연락처 
  FROM 직원연락처 ;
  
 
SELECT *
  FROM 직원 ;

SELECT *
  FROM 직원주소 ;
  
SELECT * 
  FROM 직원연락처 ;
  
SELECT 
  DISTINCT 직원ID 
  FROM 직원연락처 ;
  
/**************************실무 TIP*****************************/
SELECT 
  DISTINCT 성별
  FROM 직원 ;

SELECT
  DISTINCT 성별,이름
  FROM 직원 ;
  
/************************** AS구문 *****************************/
SELECT 직원ID      AS EMP_ID 
     , 패스워드     AS PASSWD
     , 이름        AS NAME
  FROM 직원 ;
  
SELECT 직원ID      AS EMP_ID --띄어쓰기 불가
     , 패스워드     AS PASSWD100 --숫자,특수문자시작불가
     , 이름        AS abc$ --특수문자는 $,_,#만 가능
     , 연봉        AS pep -- 예약어 불가
  FROM 직원;  

/************************** NULL *****************************/
SELECT * 
  FROM 직원
  WHERE 직원ID = 'A0003' ;

INSERT INTO 직원 ( 
직원ID
, 패스워드
, 이름
, 성별
, 입사일시
, 주민등록번호
, 연봉
, 부서ID
) VALUES (
'A0011' 
, 'newman'
, '신입'
, '남' 
, SYSDATE 
, '940123-1332219' 
, 3000 
, 'D004' 
) ;

COMMIT ;

SELECT * FROM 직원;

CREATE TABLE 테스트테이블 ( --테스트테이블 이라는 이름의 테이블을 만듭니다. 
문자형 VARCHAR2(10) , --문자형 이라는 컬럼에 문자형자료형(VARCHAR2)부여
숫자형 NUMBER , --숫자형 이라는 컬럼에 숫자형자료형(NUMBER) 부여
날짜형 DATE ) ; --날짜형 이라는 컬럼에 날짜형자료형(DATE) 부여

SELECT * 
  FROM 테스트테이블 ;
  
INSERT INTO 테스트테이블 ( 문자형 , 숫자형 , 날짜형 ) VALUES ( 'A' , 1 , SYSDATE ); --될까요? O
INSERT INTO 테스트테이블 ( 문자형 , 숫자형 , 날짜형 ) VALUES ( 'A' , '3' , SYSDATE ); --될까요? O 
INSERT INTO 테스트테이블 ( 문자형 , 숫자형 , 날짜형 ) VALUES ( 'A' , 3 , 1 ); --될까요? X
INSERT INTO 테스트테이블 ( 문자형 , 숫자형 , 날짜형 ) VALUES ( 'BB' , '3' , SYSDATE ); --될까요? O
INSERT INTO 테스트테이블 ( 문자형 , 숫자형 , 날짜형 ) VALUES ( 'ABC' , 2 , '230314'); -- 자유롭게 입력해봅시다 O
INSERT INTO 테스트테이블 ( 문자형 , 숫자형 , 날짜형 ) VALUES ( 'ABC' , 2 , '23/03/14'); -- 자유롭게 입력해봅시다 O
INSERT INTO 테스트테이블 ( 문자형 , 숫자형 , 날짜형 ) VALUES ( 'ABC' , 2 , '2322222222'); -- 자유롭게 입력해봅시다 X
INSERT INTO 테스트테이블 ( 문자형 , 숫자형 , 날짜형 ) VALUES ( 'ABC' , 2 , '23-03-14'); -- 자유롭게 입력해봅시다 O

SELECT * 
  FROM 직원
  WHERE 부서ID = 'D001' ;

SELECT * 
  FROM 직원 ;
  
SELECT *
  FROM 직원
  WHERE 입사일시 >= '21/09/11' ;
  
SELECT *
  FROM 직원
  WHERE 성별= '남' ;
  
SELECT *
  FROM 직원
  WHERE 연봉 >= 8000 ;

/******************************* 실습 *****************************/

--1
SELECT 직원ID
     , 이름
     , 나이
     , 입사일시 
  FROM 직원 
 WHERE 연봉 > 9000 ;
  
--2
SELECT * 
  FROM 직원 
 WHERE 이름 = '이현정' ;
  
--3
SELECT *
  FROM 직원연락처
 WHERE 연락처 = '010-1231-1234';
  
--4
SELECT 부서명 
  FROM 부서 
 WHERE 근무지 = '서울' ;
  
--5
SELECT 주소
  FROM 직원주소
 WHERE 직원ID = 'A0007' ;
 
 /************************** 코드 *****************************/
 
 SELECT 직원ID
      , 성별
      , 나이
      , 부서ID
  FROM  직원 
 WHERE  성별 = '남' 
   AND  나이 > 28
   ORDER BY 나이
   ;
   
SELECT * 
  FROM 직원
 WHERE 부서ID = 'D002'
    OR 부서ID = 'D004' ;
    
/*********************** 실습 *********************************************/

--1
SELECT 연락처 
  FROM 직원연락처 
 WHERE 직원ID = 'A0001' 
   AND 구분코드 = '집전화' ;
 

 
--2
SELECT *
  FROM 직원 
 WHERE 부서ID = 'D003'
   AND 성별 = '여'
   AND 나이 >= 30 ;
   
--3
SELECT *
  FROM 직원
 WHERE 직원ID = 'A0001'
    OR 직원ID = 'A0005'
    OR 직원ID = 'A0007' ;

--ex
SELECT *
  FROM 직원
 WHERE 직원ID = 'A0001' OR 'A0005' OR 'A0007' ; --error 이렇게는 불가
  
  
SELECT *
  FROM 직원
 WHERE 부서ID = 'D001'
    OR 부서ID = 'D002'
   AND 이름   = '김철수' ;