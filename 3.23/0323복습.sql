--실습1
SELECT 학생ID
     , ROUND(AVG(성적),1) AS 평균성적
  FROM 성적표
 GROUP BY 학생ID ;
 
 --2
 SELECT MAX(연봉)
      , MIN(연봉)
  FROM 직원 ;
  
SELECT 소속반 
     , COUNT(소속반) AS 반별인원수
  FROM 수강생정보
 GROUP BY 소속반 ;
 
--4
