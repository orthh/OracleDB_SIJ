SELECT �Ҽӹ�
     , COUNT(*) AS �ο���
  FROM ����������
 GROUP BY �Ҽӹ� ;
 
SELEcT * FROM ����ǥ ;
 
 --�������
SELECT �л�ID
     , COUNT(*) -- * �� �ǹ� : NULL ������ ����
     , COUNT(����)  -- NULL ������ ����
  FROM ����ǥ --1
 GROUP BY �л�ID ; --2 . �л�ID�������� ����.
 
SELECT COUNT(*)
  FROM ����ǥ ;
  -- �� �Ʒ� ����
SELEcT COUNT(*)
  FROM ����ǥ 
 GROUP BY();
 
SELECT MAX(����) FROM ���� ;
SELECT MIN(�Ի��Ͻ�) FROM ���� ;
SELECT MAX(�Ի��Ͻ�) FROM ���� ;

--�����Լ��� �⺻������ NULL ����
SELECT �л�ID
     , ROUND(AVG(����),1) --ROUND(���� , �Ҽ����ڸ���) 
  FROM ����ǥ
 GROUP BY �л�ID ; --GROUP BY �Ӽ� ���� �׷���(GROUPING)��, �����Լ�(�÷�)�׷����� 
                  --�Ÿ� �������� �����Լ� ����
                  
--�ǽ�1
-- �ظ��ϸ� GROUP BY�� �ۼ��� �÷�����밡��.
SELECT �л�ID
     , ROUND(AVG(����),1) AS ��ռ���
  FROM ����ǥ
 GROUP BY �л�ID ;
 
--�ǽ�2
SELECT MAX(����) AS �ְ���
     , MIN(����) AS ��������
  FROM ����
 GROUP BY();
  
--�ǽ�3
SELECT �Ҽӹ�
     , COUNT(�Ҽӹ�) AS �ݺ��ο���
  FROM ����������
 GROUP BY �Ҽӹ� ;
     
--�ǽ�4
SELECT �л�ID 
     , ROUND(AVG(����),1) AS �������������
  FROM ����ǥ
 WHERE ���� NOT IN '����' 
 GROUP BY �л�ID ;
 
--�ǽ�5
SELECT * FROM ���� ;
SELECT �μ�ID
     , SUM(����) AS �μ��������հ�
  FROM ����
 GROUP BY �μ�ID
 ORDER BY �μ�ID ;
 
--�ǽ�6
SELECT A.����ID
     , COUNT(B.����ó) AS ����ó����
  FROM ���� A
     , ��������ó B
 WHERE A.����ID = B.����ID(+)
 GROUP BY A.����ID
 ORdER BY A.����ID ;
 
--������
SELECT * FROM ���� ;
--�������̺��� ����,���� �ο��� ���ϱ�
SELECT ����
     , COUNT(����) AS �ο���
  FROM ����
 GROUP BY ���� ;

--HAVING
--HAVING������ ���谡 �Ϸ�� ����� ���͸� �ϴ� ����
SELECT �л�ID, ROUND(AVG(����),1) AS ��ռ���
  FROM ����ǥ
 GROUP BY �л�ID 
 HAVING AVG(����) <= 75 
 ORDER BY �л�ID ;
 
--HAVING�� �����Լ��� �����ټ��ִ�.
--WHERE�� �����Լ��� �����ټ�����.

SELECT �л�ID
     , ROUND(AVG(����),1) AS ��ռ���
  FROM ����ǥ --���� : 1
 GROUP BY �л�ID  --����:3 
 WHERE AVG(����) <= 75 --error  -- ���� :2
 ORDER BY �л�ID ;
 
 --�ǽ�1
 SELECT �Ҽӹ�
      , COUNT(�Ҽӹ�) AS �ο���
   FROM ����������
  GROUP BY �Ҽӹ�
 HAVING COUNT(�Ҽӹ�) >= 3
  ORDER BY �Ҽӹ� ;
 
--�ǽ�2
SELECT �μ�ID
     , MAX(����) AS �ְ���
  FROM ���� 
 GROUP BY �μ�ID
 HAVING MAX(����) = 7500
 ORDER BY �μ�ID ;

--�ǽ�3
SELECT �л�ID
     , ROUND( AVG(����) , 1) AS ��ռ���
  FROM ����ǥ
 GROUP BY �л�ID
 HAVING AVG(����) IS NOT NULL 
 ORDER BY(�л�ID) ;
 
---������---
SELECT * FROM ���� ;

--ORDER BY �⺻������ ASC(�������� ����)
SELECT * 
  FROM ����
 ORDER BY �̸�;

--�������� : DESC
SELECT * 
  FROM ����
 ORDER BY �̸� DESC ;

SELECT *
  FROM ����
 ORDER BY �μ�ID, �̸� DESC ; 
 --�μ�ID�� �������� �������� ������ �ϵ�, �̸��� �������� �����ϰڴ�.

SELECT ����ID
     , �̸�
     , ���� AS �������ǿ���
     , ���� * 0.1 AS ���ʽ�
  FROM ����
 ORDER BY 3 ; --����ID : 1, �̸� : 2, �������ǿ��� : 3 ... 3�̹Ƿ� �������ǿ�����
              --�������� (default ASC) �����ϰڴ�.
              
SELECT ����ID
     , �̸�
     , ���� AS �������ǿ���
     , ���� * 0.1 AS ���ʽ�
  FROM ����
 ORDER BY �������ǿ��� ; --ORDER BY�� SELECT���� �ʰ� ����ǹǷ� ����


--DML
--INSERT
INSERT INTO ���� (
       ����ID
     , �н�����
     , �̸�
     , ����
     , ����
     , �Ի��Ͻ�
     , �ֹε�Ϲ�ȣ
     , �μ�ID
) VALUES (
       'A0012'
     , 'pass1234'
     , '������'
     , '��'
     , 31
     , SYSDATE
     , '930911-1255231'
     , 'D001'
) ;
--Primary KEY ����NULL �Ұ�, �ߺ�x

INSERT INTO ����  --��� �÷� ���ָ� ������ ���� �ǹ����� �� �Ⱦ�.
VALUES (
'A0014' 
, 'hipasswd'
, '������'
, '��'
, 50
, sysdate
, '740922-2555111'
, 7000
, 'D002'
) ; 

select * from ���� ;

COMMIT ;

SELECT ����ID, �̸�, ���� FROM ���� ;

ROLLBACK ; 
UPDATE ����
   SET ���� = 9999
 WHERE ����ID = 'A0001' ;

COMMIT ;