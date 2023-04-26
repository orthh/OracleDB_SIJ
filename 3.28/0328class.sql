--페이징
--ROWNUM : 테이블의 튜플(행)에 임시로 부여되는 번호
SELECT ROWNUM AS RN
     , 직원ID
     , 이름
     , 연봉
     , 부서ID
  FROM 직원 ;
--ROWNUM 처럼 실제 테이블에 없는데 사용되는 애들을 가짜컬럼(의사커럼) 이라고 한다.
--보통 WHERE에 많이 사용함
SELECT ROWNUM AS RN
     , 직원ID
     , 이름
     , 연봉
     , 부서ID
  FROM 직원
 WHERE ROWNUM <=3 ;
 
 SELECT 직원ID
      , 이름
      , 연봉
      , 부서ID
  FROM 직원
 WHERE ROWNUM <=3 ;
 
 --ROWNUM 을 SELECT 에 안써줘도 됨.
 --ROWNUM 은 1을 접근해야 2를 쓸수있다. 
 SELECT 직원ID
      , 이름
      , 연봉
      , 부서ID
  FROM 직원
 WHERE ROWNUM =1 ;
 
 SELECT 직원ID
      , 이름
      , 연봉
      , 부서ID
  FROM 직원
 WHERE ROWNUM =2 ; --아무것도 안나옴
 
--ROWNUM 2를 뽑기위한 방법
SELECT *
  FROM (
        SELECT ROWNUM AS RN
             , 직원ID
             , 이름
             , 연봉
             , 부서ID
          FROM 직원 
          )
 WHERE RN = 2;
 
 --TOP-N 기술 : 상위 N 개의 데이터만 뽑는 기술
 
SELECT *
  FROM 직원
 WHERE 연봉 IS NOT NULL
 ORDER BY 연봉 DESC ;
 
SELECT *
  FROM 직원
 WHERE 연봉 IS NOT NULL
 ORDER BY 연봉 DESC ;
 
SELECT *                             --(3)
  FROM (                             --(1)
      SELECT *                       --3
        FROM 직원                     --1
       WHERE 연봉 IS NOT NULL         --2
       ORDER BY 연봉 DESC             --4
       )
 WHERE ROWNUM <= 5;                  --(2) 
 
--1.

SELEcT * 
  FROM (
        SELECT * 
          FROM 직원
         WHERE 연봉 IS NOT NULL
         ORDER BY 연봉 
        )
 WHERE ROWNUM <=3 ;
--2.
SELECT *
  FROM (
        SELECT *
          FROM 직원
         WHERE 입사일시 IS NOT NULL
         ORDER BY 입사일시 DESC
        )
 WHERE ROWNUM <= 3;


--페이징 : 데이터를 조금씩 보여주는 기술
CREATE TABLE 게시판 ( 
게시판번호 NUMBER(9) PRIMARY KEY , 
작성자 VARCHAR2(50) NOT NULL , 
게시물내용 VARCHAR2(4000) NOT NULL , 
작성일시 DATE NOT NULL 
) ;
INSERT INTO 게시판
SELECT LEVEL -- 게시판번호
, '아이디' || MOD(LEVEL , 10000) -- 작성자
, '아이디' || 
MOD(LEVEL , 10000) || 
'님이 작성하신 게시물입니다. 이 게시물은 게시판 번호가 ' 
|| LEVEL 
|| '입니다' -- 게시물내용
, TO_DATE('20000101') + LEVEL --2022년 1월1일부터 하루씩 게시물이 입력되는 것
FROM DUAL
CONNECT BY LEVEL <=1000000; --100만건의 데이터 입력
COMMIT;

SELEcT * FROM 게시판 ; --oracleDB도 페이징작업이 되서 50건씩 나옴.
 
 --20개 데이터 뽑기
SELECT *
  FROM (
      SELECT *
        FROM 게시판
       ORDER BY 작성일시 DESC 
       )
 WHERE ROWNUM <=20 ;
 
-- 21~40번째 게시물은 어떻게 뽑을것인가 ? 
--1. 상위 40개까지 뽑는다.
SELECT *
  FROM (
      SELECT *
        FROM 게시판
       ORDER BY 작성일시 DESC 
       )
 WHERE ROWNUM <=40 ;
 
--2. 그 중에서 21번째부터 뽑는다.
SELECT * 
  FROM (
        SELECT ROWNUM AS RN
             , A.*
          FROM (
              SELECT *
                FROM 게시판
               ORDER BY 작성일시 DESC 
               ) A
         WHERE ROWNUM <=40  --1page
)
WHERE RN >= 21;  --2page

--









--최근 작성게시물 31~60번째 데이터
SELECT *
  FROM (
      SELECT ROWNUM AS RN
           , A.*
        FROM (
              SELECT *
                FROM 게시판 
               ORDER BY 작성일시 DESC
              ) A
        WHERE ROWNUM <= 60
        ) 
 WHERE RN >= 31;
 
SELECT 연봉 AS "salary" --출력되는 컬럼 결과 : salary 소문자로 나옴. 
  FROM 직원 ;

--서브쿼리 : 작성된 쿼리 내부에 다른 쿼리를 삽입
ALTER TABLE 직원 MODIFY (부서ID NULL) ;
UPDATE 직원 SET 부서ID = NULL WHERE 직원ID = 'A0005' ;
COMMIT;

--스칼라 서브쿼리
--SELECT 에서 사용되는 서브쿼리로 하나의 컬럼에 대해 하나의 행만 반환하는 특징을 가진다.
--출력되는 하나의 값이 없다면 NULL 을 반환한다.
SELECT A.직원ID
     , A.연봉
     , A.부서ID
     , (
       SELECT 부서명 --1개의 컬럼, 1개의 행만 가져올 수 있다.
         FROM 부서
        WHERE 부서ID = A.부서ID ) AS 부서명
  FROM 직원 A
 WHERE 직원ID BETWEEN 'A0001' AND 'A0006' ;
 
--위와 아래는 동일한 출력값을 가짐.
--조인
SELECT A.직원ID
     , A.연봉
     , A.부서ID
     , B.부서명
  FROM 직원 A , 부서 B
 WHERE A.부서ID = B.부서ID(+)
   AND 직원ID BETWEEN 'A0001' AND 'A0006'
 ORDER BY 부서ID , 연봉 ;
 
--ANSI
SELECT A.직원ID
     , A.연봉
     , A.부서ID
     , B.부서명
  FROM 직원 A LEFT OUTER JOIN 부서 B
    ON (A.부서ID = B.부서ID)
 WHERE 직원ID BETWEEN 'A0001' AND 'A0006'
 ORDER BY 부서ID , 연봉 ;
 

























--문제1.
SELECT A.직원ID
     , A.연봉
     , A.부서ID
     , (SELECT 부서명
          FROM 부서
         WHERE A.부서ID = 부서ID 
        ) AS 부서명
  FROM 직원 A
 WHERE 직원ID BETWEEN 'A0001' AND 'A0006' ;
 
--문제1. 오라클조인
SELECT A.직원ID
     , A.연봉
     , A.부서ID
     , B.부서명
  FROM 직원 A  , 부서 B
 WHERE A.부서ID = B.부서ID(+)
   AND A.직원ID BETWEEN 'A0001' AND 'A0006';
 
 --문제1 ANSI
SELECT A.직원ID
     , A.연봉
     , A.부서ID
     , B.부서명
  FROM 직원 A  LEFT OUTER JOIN 부서 B
    ON (A.부서ID = B.부서ID) 
   WHERE A.직원ID BETWEEN 'A0001' AND 'A0006';
 

--문제2.
SELECT 직원ID
     , 이름
     , 주민등록번호
     , (SELECT 연락처
          FROM 직원연락처
         WHERE 직원ID = A.직원ID
           AND 구분코드 = '휴대폰'
        ) AS 휴대폰번호
  FROM 직원 A
 WHERE 직원ID BETWEEN 'A0006' AND 'A0010' ;
 
 --문제2. 오라클조인
SELECT A.직원ID
     , A.이름
     , A.주민등록번호
     , B.연락처
  FROM 직원 A , 직원연락처 B
 WHERE A.직원ID = B.직원ID(+)
   AND (B.구분코드 = '휴대폰' OR B.구분코드 IS NULL)
   AND A.직원ID BETWEEN 'A0006' AND 'A0010' ;

SELECT A.직원ID
     , A.이름
     , A.주민등록번호
     , B.연락처
  FROM 직원 A , 직원연락처 B
 WHERE A.직원ID = B.직원ID(+)
   AND B.구분코드(+) = '휴대폰'
   AND A.직원ID BETWEEN 'A0006' AND 'A0010' ;

     
--문제3.
SELECT 직원ID
     , 이름
     , 주민등록번호
     , (SELECT 연락처
          FROM 직원연락처
         WHERE 직원ID = A.직원ID
           AND 구분코드 = '휴대폰'
        ) AS 휴대폰번호
     , (SELECT 주소
          FROM 직원주소
         WHERE 직원ID = A.직원ID
           AND 구분코드 = '집'
        ) AS 집주소
  FROM 직원 A
 WHERE 직원ID BETWEEN 'A0006' AND 'A0010' ;
 
 --문제3 -> 오라클조인
 
 --인라인 뷰
 SELECT A.직원ID
      , A.이름
      , A.연봉
      , B.부서별최고연봉
  FROM 직원 A
     , (
        SELECT 부서ID, MAX(연봉) AS 부서별최고연봉
          FROM 직원
         WHERE 부서ID IS NOT NULL
         GROUP BY 부서ID
        ) B
  WHERE A.부서ID = B.부서ID
    AND A.연봉 = B.부서별최고연봉;
    
























--1. 부서별로 가장 낮은 연봉을 가진 직원들의 모든 정보를 출력하시오
SELECT A.직원ID
     , A.이름
     , A.연봉
     , (
         SELECT 부서명
           FROM 부서
          WHERE 부서ID = A.부서ID
        ) AS 부서명
     , B.부서별최저연봉
  FROM 직원 A , (
                  SELECT 부서ID
                       , MIN(연봉) AS 부서별최저연봉
                  FROM 직원
                  WHERE 부서ID IS NOT NULL
                  GROUP BY  부서ID
                ) B
 WHERE A.부서ID = B.부서ID
   AND A.연봉 = B.부서별최저연봉 ;
     
--2.
SELECT *
  FROM (
        SELECT *
          FROM 직원
         WHERE 나이 IS NOT NULL
         ORDER BY 나이
        )
 WHERE ROWNUM <= 3;

--비상관 서브쿼리
SELECT *
  FROM 직원
 WHERE 연봉 >= (SELECT AVG(연봉)
                 FROM 직원
               ) ;
