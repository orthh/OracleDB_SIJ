--중첩서브쿼리
SELECT *
  FROM 직원 A
 WHERE 연봉 = ( SELECT MIN(연봉)
                 FROM 직원
                 WHERE 부서ID = A.부서ID ) ;
                 

--문제1
SELECT *
  FROM 직원 A
 WHERE 연봉 = ( SELECT MAX(연봉)
                 FROM 직원
                WHERE 부서ID = A.부서ID  
              ) 
 ORDER BY 부서ID ;

--문제2
SELECT *
  FROM 직원
 WHERE 입사일시 = ( SELECT MAX(입사일시)
                     FROM 직원
                 ) ;

--문제3
SELECT *
  FROM 직원
 WHERE 연봉 = ( SELECT MAX(연봉)
                 FROM 직원 
              ) ;

--다중행

--IN
SELECT *
  FROM 직원
 WHERE 연봉 IN (
                SELECT MAX(연봉)
                  FROM 직원
                 GROUP BY 부서ID
               )
 ORDER BY 부서ID ;
 
 --위는 아래같이 읽는다.
 
 SELECT *
  FROM 직원
 WHERE 연봉 IN (
                7500,7000,7500,9000,9300,6000
               )
 ORDER BY 부서ID ;
 
 --ANY
 SELECT 직원id, 이름,연봉
  FROM 직원
 WHERE 연봉 =  ANY (
                SELECT MAX(연봉)
                  FROM 직원
                 GROUP BY 부서ID
               )
 ORDER BY 부서ID ;
 
 --ALL
  SELECT *
  FROM 직원
 WHERE 연봉 >=  ALL (
                SELECT MAX(연봉)
                  FROM 직원
                 GROUP BY 부서ID
               )
 ORDER BY 부서ID ;
 