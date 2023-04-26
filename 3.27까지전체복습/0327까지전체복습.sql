SELECT 직원ID
     , TO_CHAR(입사일시, 'YY/MM/DD') AS 입사일시
     , TO_CHAR(ADD_MONTHS(입사일시, 60), 'YY/MM/DD') AS 오년후입사일시
  FROM 직원
 ORDER BY 직원ID ;

SELECT SYSDATE + 3 
  FROM DUAL ;
  
SELECT TO_NUMBER('12') FROM DUAL ;
SELECT TO_CHAR(111) FROM DUAL ;
  
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') FROM DUAL ;  
SELECT TO_DATE('20230101' , 'YYYY/MM/DD') FROM DUAL ;
SELECT TO_DATE('20230101010101' , 'YYYYMMDDHH24MISS') FROM DUAL ;

--실습1
SELECT 직원ID
     , 입사일시
     , TO_CHAR(입사일시, 'YYYY') AS 입사연도
  FROM 직원 ;
  
SELECT '1' + 1 FROM DUAL ; --2

--1.
SELECT 직원ID
     , 나이
     , 나이 + 1 AS 올해나이
  FROM 직원;
  
--NVL 함수
--NVL(a,b) : if(a == null) return b; if(a!=null) return a;
SELECT 직원ID
     , 나이
     , NVL(나이, 0)
  FROM 직원 ;
--NVL2(a,b,c) : if(a==null) return c; if(a!=null) return b;
SELECT 직원ID
     , 나이
     , NVL2(나이, 나이, 100)
  FROM 직원 ;

--DECODE
SELECT 직원ID
     , 나이
     , DECODE(나이,NULL, 100, 나이) 
  FROM 직원 ;
  
--1.
SELECT 직원ID
     , 비밀번호
     , NVL(나이, 20) AS 나이
  FROM 직원 ;
  
--2.
SELECT 직원ID
     , 성별
     , 연봉
     , DECODE(성별, '남', '남성입니다', '여성입니다') AS 남녀확인 
  FROM 직원 ;
  
--------------------------------------- WHERE -----------------------------------------------
SELECT *
  FROM 직원
 WHERE 입사일시 BETWEEN TO_DATE('20150101000000','YYYYMMDDHH24MISS')
                                 AND TO_DATE('20151231235959','YYYYMMDDHH24MISS')
    OR 입사일시 IS NULL ;
    
--문제3
SELECT *
  FROM 직원
 WHERE 입사일시 >= '20170101' ;
 
SELECT 부서ID
     , MAX(연봉) AS 부서별최고연봉
  FROM 직원
 GROUP BY 부서ID
 ORDER BY 부서ID ;
 

SELECT *
  FROM (
          SELECT * 
          FROM 게시판
         ORDER BY 작성일시 DESC 
        )
 WHERE ROWNUM <=100 ;

  
