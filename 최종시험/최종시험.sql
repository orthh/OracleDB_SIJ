----------------------------------시험------------------------------------------
--문제1.
--에러의 내용을일고 
--1. 에러가 발생한 원인
--2. 그 조치사항(올바른 SQL구문) 작성

--1.원인 : SERVICE 계정을 올바르게 생성하였으나, 세션을 만들기 위한
--         권한 설정이 되지 않은 경우이다.

--2. 조치사항
  --SQL COMMAND LINE 에서 관리자 계정(SYSTEM)으로 접속하여 SERVICE 에 CREATE SESSION 권한을 주는 명령어를 실행한다.
  --sql구문 :  GRANT CREATE SESSION TO SERVICE ;






--문제2.
--조인, 에러발생
--1. 발생한 원인
    --FROM에서 별칭을 주어서 별칭만 사용해야하는데, WHERE절에서 별칭이 아닌 테이블명 자체를 기술하였다.

--2. 해결할 수 있는 조치사항
    -- WHERE절에서 테이블명 자체로 기술된 곳을 그 테이블의 별칭으로 지정한 B를 사용한다.
SELECT A.CUST_NO 
     , A.CUST_NAME 
     , B.TEL_DVCD 
     , B.TEL_NO 
  FROM CUST_INFO A 
     , CUST_TEL_INFO B 
 WHERE A.CUST_NO = B.CUST_NO ;








--문제푸는중
--문제
SELECT 부서ID 
     , SUM(연봉) AS 합계 
     , AVG(연봉) AS 평균 
     , COUNT(*) AS 직원수
 FROM 직원
WHERE 연봉 > 6000 
GROUP BY 부서ID
ORDER BY 부서ID ;

--문제풀이
SELECT 부서ID 
     , SUM(연봉) AS 합계 
     , AVG(연봉) AS 평균 
     , COUNT(*) AS 직원수
 FROM 직원
GROUP BY 부서ID
HAVING AVG(연봉) > 6000
ORDER BY 부서ID ;



--문제3.
--부서별 평균연봉 6000 초과 부서
--1.원인
    --1.부서별 평균 연봉이 6000만원을 초과하는 부서를 조회하는 문제인데, WHERE절에서
        --평균 연봉이 아닌 연봉 컬럼을 6000 초과하게 하였다.
    --2.평균인 AVG집계함수는 HAVING에서 조건을 줄수 있지만,
      --WHERE절은 GROUP BY보다 먼저 실행되기 떄문에 사용시 집계함수를 사용할수 없다.
--2.조치사항
    --HAVING을 사용하여 AVG함수를 이용하여 평균연봉을 구한 뒤 출력한다.
    --sql구문을 올바르게 수정한다
    -- sql : 
SELECT 부서ID 
     , SUM(연봉) AS 합계 
     , AVG(연봉) AS 평균 
     , COUNT(*) AS 직원수
  FROM 직원
 WHERE 연봉 IS NOT NULL
 GROUP BY 부서ID
 HAVING AVG(연봉) > 6000
 ORDER BY 부서ID ;


--문제4

SELECT ROWNUM, 이름 , 연봉 
FROM 직원
WHERE ROWNUM <=3
ORDER BY 연봉 DESC;
--원인 : WHERE절은 ORDER BY 보다 먼저 실행되기 때문에, ORDER BY 연봉 DESC 가 실행되기 전에
       -- WHERE절에서 ROWNUM 을 뽑고, 그 후에 ORDER BY 가 작동하여 3개의 값만 비교한다.
       
--조치사항
  -- 정렬 처리가 완료되어 있는 가공된 테이블이 필요하다.
SELECT * 
  FROM (
          SELECT ROWNUM
             , 이름 
             , 연봉 
          FROM 직원
         WHERE 연봉 IS NOT NULL
         ORDER BY 연봉 DESC
        )
 WHERE ROWNUM <= 3 ;



--문제5
FROM -> WHERE  -> GROUP BY -> HAVING -> SELECT -> ORDER BY



--6
SELECT A.직원ID 
     , A.이름 
     , B.부서명 
 FROM 직원 A LEFT OUTER JOIN 부서 B
   ON (A.부서ID = B.부서ID ) ;

--7
--7-1
CREATE TABLE PEOPLE (
    NAME VARCHAR2(20) NOT NULL ,
    AGE  NUMBER(5)
) ;

--7-2
ALTER TABLE PEOPLE ADD CONSTRAINT PK_NAME_PEOPLE PRIMARY KEY(NAME) ;


--7-3
INSERT INTO PEOPLE (
       NAME
     , AGE
) VALUES (
       '박희순'
     , 40
) ;
INSERT INTO PEOPLE (
       NAME
     , AGE
) VALUES (
       '김태희'
     , 25
) ;
INSERT INTO PEOPLE (
       NAME
) VALUES (
       '마동석'
) ;
INSERT INTO PEOPLE (
       NAME
     , AGE
) VALUES (
       '김희연'
     , 40
) ;

--7-4
SELECT NAME
     , AGE
  FROM PEOPLE
 WHERE AGE IS NULL
    OR AGE = 40;
    
    
--문제8
--SQL COMMAND LINE에서 기본적으로 관리자계정(SYSTEM)에 접속한다.
-- conn SYSTEM/비밀번호 
--8.1
 CREATE USER OTHERSERVICE IDENTIFIED BY 12345;

--8.2
  --1.CREATE SESSION 권한을 준다.
  GRANT CREATE SESSION TO OTHERSERVICE ;
  
  --2. SERVICE계정의 직원 테이블을 SELECT할수 있는 권한을 준다.
  GRANT SELECT ON SERVICE.직원 TO OTHERSERVICE ;
  
--8.3
  REVOKE SELECT ON SERVICE.직원 FROM OTHERSERVICE ;
  
--8.4
  GRANT RESOURCE , CONNECT TO OTHERSERVICE ;
  
  
  --test
  INSERT INTO PEOPLE ( NAME, AGE ) VALUES ( '박희순' , 40 ) ;
INSERT INTO PEOPLE ( NAME, AGE ) VALUES ( '김태희' , 25 ) ;
INSERT INTO PEOPLE ( NAME ) VALUES ( '마동석' ) ;
INSERT INTO PEOPLE ( NAME, AGE ) VALUES ( '김희연' , 40) ;