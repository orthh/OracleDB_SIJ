--��ø��������
SELECT *
  FROM ���� A
 WHERE ���� = ( SELECT MIN(����)
                 FROM ����
                 WHERE �μ�ID = A.�μ�ID ) ;
                 

--����1
SELECT *
  FROM ���� A
 WHERE ���� = ( SELECT MAX(����)
                 FROM ����
                WHERE �μ�ID = A.�μ�ID  
              ) 
 ORDER BY �μ�ID ;

--����2
SELECT *
  FROM ����
 WHERE �Ի��Ͻ� = ( SELECT MAX(�Ի��Ͻ�)
                     FROM ����
                 ) ;

--����3
SELECT *
  FROM ����
 WHERE ���� = ( SELECT MAX(����)
                 FROM ���� 
              ) ;

--������

--IN
SELECT *
  FROM ����
 WHERE ���� IN (
                SELECT MAX(����)
                  FROM ����
                 GROUP BY �μ�ID
               )
 ORDER BY �μ�ID ;
 
 --���� �Ʒ����� �д´�.
 
 SELECT *
  FROM ����
 WHERE ���� IN (
                7500,7000,7500,9000,9300,6000
               )
 ORDER BY �μ�ID ;
 
 --ANY
 SELECT ����id, �̸�,����
  FROM ����
 WHERE ���� =  ANY (
                SELECT MAX(����)
                  FROM ����
                 GROUP BY �μ�ID
               )
 ORDER BY �μ�ID ;
 
 --ALL
  SELECT *
  FROM ����
 WHERE ���� >=  ALL (
                SELECT MAX(����)
                  FROM ����
                 GROUP BY �μ�ID
               )
 ORDER BY �μ�ID ;
 