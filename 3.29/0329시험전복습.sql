select * from ���� where rownum <=3 ;


--rownum = 2 �̱�
SELECT *
  FROM   (
            SELECT ROWNUM AS RN
                 , ����ID
                 , �̸�
              FROM ����
          )
 WHERE RN = 2 ;
 
--COALESCE()
SELECT ����ID
     , ����
     , COALESCE(����,null) 
  FROM ���� ;
  
--AND , OR �켱����
SELECT *
  FROM ����
 WHERE (�μ�ID = 'D001'
   OR �μ�ID = 'D002')
   AND �̸� = '��ö��' ;
   
SELECT * FROM ���� WHERE �̸� != '������' ;

SELECT A.����ȣ
     , A.����
     , B.��ȭ��ȣ
  FROM �� A
     , ����ȭ��ȣ B
 WHERE A.����ȣ = B.����ȣ(+) ;
 
select * from �� ;
select * from ����ȭ��ȣ ;

SELECT �Ҽӹ� , COUNT(�л��̸�)
  FROM ����������
 GROUP BY �Ҽӹ� ;
 
SELECT �Ҽӹ�
     , COUNT(�Ҽӹ�) AS �ο���
  FROM ����������
 GROUP BY �Ҽӹ�
 HAVING COUNT(�Ҽӹ�) >=3 ;
 
SELECT �μ�ID
     , MAX(����) AS �ְ���
  FROM ����
 GROUP BY �μ�ID
 HAVING MAX(����) >= 7500 ;
 
 
SELECT * FROM ����ǥ ;
SELECT �л�ID
     , AVG(����) AS ��ռ���
  FROM ����ǥ
 GROUP BY �л�ID 
 HAVING AVG(����) IS NOT NULL ;