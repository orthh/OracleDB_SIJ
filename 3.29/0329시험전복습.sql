select * from 직원 where rownum <=3 ;


--rownum = 2 뽑기
SELECT *
  FROM   (
            SELECT ROWNUM AS RN
                 , 직원ID
                 , 이름
              FROM 직원
          )
 WHERE RN = 2 ;
 
--COALESCE()
SELECT 직원ID
     , 나이
     , COALESCE(나이,null) 
  FROM 직원 ;
  
--AND , OR 우선순위
SELECT *
  FROM 직원
 WHERE (부서ID = 'D001'
   OR 부서ID = 'D002')
   AND 이름 = '김철수' ;
   
SELECT * FROM 직원 WHERE 이름 != '이현정' ;

SELECT A.고객번호
     , A.고객명
     , B.전화번호
  FROM 고객 A
     , 고객전화번호 B
 WHERE A.고객번호 = B.고객번호(+) ;
 
select * from 고객 ;
select * from 고객전화번호 ;

SELECT 소속반 , COUNT(학생이름)
  FROM 수강생정보
 GROUP BY 소속반 ;
 
SELECT 소속반
     , COUNT(소속반) AS 인원수
  FROM 수강생정보
 GROUP BY 소속반
 HAVING COUNT(소속반) >=3 ;
 
SELECT 부서ID
     , MAX(연봉) AS 최고연봉
  FROM 직원
 GROUP BY 부서ID
 HAVING MAX(연봉) >= 7500 ;
 
 
SELECT * FROM 성적표 ;
SELECT 학생ID
     , AVG(성적) AS 평균성적
  FROM 성적표
 GROUP BY 학생ID 
 HAVING AVG(성적) IS NOT NULL ;