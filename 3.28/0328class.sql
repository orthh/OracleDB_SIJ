--����¡
--ROWNUM : ���̺��� Ʃ��(��)�� �ӽ÷� �ο��Ǵ� ��ȣ
SELECT ROWNUM AS RN
     , ����ID
     , �̸�
     , ����
     , �μ�ID
  FROM ���� ;
--ROWNUM ó�� ���� ���̺� ���µ� ���Ǵ� �ֵ��� ��¥�÷�(�ǻ�Ŀ��) �̶�� �Ѵ�.
--���� WHERE�� ���� �����
SELECT ROWNUM AS RN
     , ����ID
     , �̸�
     , ����
     , �μ�ID
  FROM ����
 WHERE ROWNUM <=3 ;
 
 SELECT ����ID
      , �̸�
      , ����
      , �μ�ID
  FROM ����
 WHERE ROWNUM <=3 ;
 
 --ROWNUM �� SELECT �� �Ƚ��൵ ��.
 --ROWNUM �� 1�� �����ؾ� 2�� �����ִ�. 
 SELECT ����ID
      , �̸�
      , ����
      , �μ�ID
  FROM ����
 WHERE ROWNUM =1 ;
 
 SELECT ����ID
      , �̸�
      , ����
      , �μ�ID
  FROM ����
 WHERE ROWNUM =2 ; --�ƹ��͵� �ȳ���
 
--ROWNUM 2�� �̱����� ���
SELECT *
  FROM (
        SELECT ROWNUM AS RN
             , ����ID
             , �̸�
             , ����
             , �μ�ID
          FROM ���� 
          )
 WHERE RN = 2;
 
 --TOP-N ��� : ���� N ���� �����͸� �̴� ���
 
SELECT *
  FROM ����
 WHERE ���� IS NOT NULL
 ORDER BY ���� DESC ;
 
SELECT *
  FROM ����
 WHERE ���� IS NOT NULL
 ORDER BY ���� DESC ;
 
SELECT *                             --(3)
  FROM (                             --(1)
      SELECT *                       --3
        FROM ����                     --1
       WHERE ���� IS NOT NULL         --2
       ORDER BY ���� DESC             --4
       )
 WHERE ROWNUM <= 5;                  --(2) 
 
--1.

SELEcT * 
  FROM (
        SELECT * 
          FROM ����
         WHERE ���� IS NOT NULL
         ORDER BY ���� 
        )
 WHERE ROWNUM <=3 ;
--2.
SELECT *
  FROM (
        SELECT *
          FROM ����
         WHERE �Ի��Ͻ� IS NOT NULL
         ORDER BY �Ի��Ͻ� DESC
        )
 WHERE ROWNUM <= 3;


--����¡ : �����͸� ���ݾ� �����ִ� ���
CREATE TABLE �Խ��� ( 
�Խ��ǹ�ȣ NUMBER(9) PRIMARY KEY , 
�ۼ��� VARCHAR2(50) NOT NULL , 
�Խù����� VARCHAR2(4000) NOT NULL , 
�ۼ��Ͻ� DATE NOT NULL 
) ;
INSERT INTO �Խ���
SELECT LEVEL -- �Խ��ǹ�ȣ
, '���̵�' || MOD(LEVEL , 10000) -- �ۼ���
, '���̵�' || 
MOD(LEVEL , 10000) || 
'���� �ۼ��Ͻ� �Խù��Դϴ�. �� �Խù��� �Խ��� ��ȣ�� ' 
|| LEVEL 
|| '�Դϴ�' -- �Խù�����
, TO_DATE('20000101') + LEVEL --2022�� 1��1�Ϻ��� �Ϸ羿 �Խù��� �ԷµǴ� ��
FROM DUAL
CONNECT BY LEVEL <=1000000; --100������ ������ �Է�
COMMIT;

SELEcT * FROM �Խ��� ; --oracleDB�� ����¡�۾��� �Ǽ� 50�Ǿ� ����.
 
 --20�� ������ �̱�
SELECT *
  FROM (
      SELECT *
        FROM �Խ���
       ORDER BY �ۼ��Ͻ� DESC 
       )
 WHERE ROWNUM <=20 ;
 
-- 21~40��° �Խù��� ��� �������ΰ� ? 
--1. ���� 40������ �̴´�.
SELECT *
  FROM (
      SELECT *
        FROM �Խ���
       ORDER BY �ۼ��Ͻ� DESC 
       )
 WHERE ROWNUM <=40 ;
 
--2. �� �߿��� 21��°���� �̴´�.
SELECT * 
  FROM (
        SELECT ROWNUM AS RN
             , A.*
          FROM (
              SELECT *
                FROM �Խ���
               ORDER BY �ۼ��Ͻ� DESC 
               ) A
         WHERE ROWNUM <=40  --1page
)
WHERE RN >= 21;  --2page

--









--�ֱ� �ۼ��Խù� 31~60��° ������
SELECT *
  FROM (
      SELECT ROWNUM AS RN
           , A.*
        FROM (
              SELECT *
                FROM �Խ��� 
               ORDER BY �ۼ��Ͻ� DESC
              ) A
        WHERE ROWNUM <= 60
        ) 
 WHERE RN >= 31;
 
SELECT ���� AS "salary" --��µǴ� �÷� ��� : salary �ҹ��ڷ� ����. 
  FROM ���� ;

--�������� : �ۼ��� ���� ���ο� �ٸ� ������ ����
ALTER TABLE ���� MODIFY (�μ�ID NULL) ;
UPDATE ���� SET �μ�ID = NULL WHERE ����ID = 'A0005' ;
COMMIT;

--��Į�� ��������
--SELECT ���� ���Ǵ� ���������� �ϳ��� �÷��� ���� �ϳ��� �ุ ��ȯ�ϴ� Ư¡�� ������.
--��µǴ� �ϳ��� ���� ���ٸ� NULL �� ��ȯ�Ѵ�.
SELECT A.����ID
     , A.����
     , A.�μ�ID
     , (
       SELECT �μ��� --1���� �÷�, 1���� �ุ ������ �� �ִ�.
         FROM �μ�
        WHERE �μ�ID = A.�μ�ID ) AS �μ���
  FROM ���� A
 WHERE ����ID BETWEEN 'A0001' AND 'A0006' ;
 
--���� �Ʒ��� ������ ��°��� ����.
--����
SELECT A.����ID
     , A.����
     , A.�μ�ID
     , B.�μ���
  FROM ���� A , �μ� B
 WHERE A.�μ�ID = B.�μ�ID(+)
   AND ����ID BETWEEN 'A0001' AND 'A0006'
 ORDER BY �μ�ID , ���� ;
 
--ANSI
SELECT A.����ID
     , A.����
     , A.�μ�ID
     , B.�μ���
  FROM ���� A LEFT OUTER JOIN �μ� B
    ON (A.�μ�ID = B.�μ�ID)
 WHERE ����ID BETWEEN 'A0001' AND 'A0006'
 ORDER BY �μ�ID , ���� ;
 

























--����1.
SELECT A.����ID
     , A.����
     , A.�μ�ID
     , (SELECT �μ���
          FROM �μ�
         WHERE A.�μ�ID = �μ�ID 
        ) AS �μ���
  FROM ���� A
 WHERE ����ID BETWEEN 'A0001' AND 'A0006' ;
 
--����1. ����Ŭ����
SELECT A.����ID
     , A.����
     , A.�μ�ID
     , B.�μ���
  FROM ���� A  , �μ� B
 WHERE A.�μ�ID = B.�μ�ID(+)
   AND A.����ID BETWEEN 'A0001' AND 'A0006';
 
 --����1 ANSI
SELECT A.����ID
     , A.����
     , A.�μ�ID
     , B.�μ���
  FROM ���� A  LEFT OUTER JOIN �μ� B
    ON (A.�μ�ID = B.�μ�ID) 
   WHERE A.����ID BETWEEN 'A0001' AND 'A0006';
 

--����2.
SELECT ����ID
     , �̸�
     , �ֹε�Ϲ�ȣ
     , (SELECT ����ó
          FROM ��������ó
         WHERE ����ID = A.����ID
           AND �����ڵ� = '�޴���'
        ) AS �޴�����ȣ
  FROM ���� A
 WHERE ����ID BETWEEN 'A0006' AND 'A0010' ;
 
 --����2. ����Ŭ����
SELECT A.����ID
     , A.�̸�
     , A.�ֹε�Ϲ�ȣ
     , B.����ó
  FROM ���� A , ��������ó B
 WHERE A.����ID = B.����ID(+)
   AND (B.�����ڵ� = '�޴���' OR B.�����ڵ� IS NULL)
   AND A.����ID BETWEEN 'A0006' AND 'A0010' ;

SELECT A.����ID
     , A.�̸�
     , A.�ֹε�Ϲ�ȣ
     , B.����ó
  FROM ���� A , ��������ó B
 WHERE A.����ID = B.����ID(+)
   AND B.�����ڵ�(+) = '�޴���'
   AND A.����ID BETWEEN 'A0006' AND 'A0010' ;

     
--����3.
SELECT ����ID
     , �̸�
     , �ֹε�Ϲ�ȣ
     , (SELECT ����ó
          FROM ��������ó
         WHERE ����ID = A.����ID
           AND �����ڵ� = '�޴���'
        ) AS �޴�����ȣ
     , (SELECT �ּ�
          FROM �����ּ�
         WHERE ����ID = A.����ID
           AND �����ڵ� = '��'
        ) AS ���ּ�
  FROM ���� A
 WHERE ����ID BETWEEN 'A0006' AND 'A0010' ;
 
 --����3 -> ����Ŭ����
 
 --�ζ��� ��
 SELECT A.����ID
      , A.�̸�
      , A.����
      , B.�μ����ְ���
  FROM ���� A
     , (
        SELECT �μ�ID, MAX(����) AS �μ����ְ���
          FROM ����
         WHERE �μ�ID IS NOT NULL
         GROUP BY �μ�ID
        ) B
  WHERE A.�μ�ID = B.�μ�ID
    AND A.���� = B.�μ����ְ���;
    
























--1. �μ����� ���� ���� ������ ���� �������� ��� ������ ����Ͻÿ�
SELECT A.����ID
     , A.�̸�
     , A.����
     , (
         SELECT �μ���
           FROM �μ�
          WHERE �μ�ID = A.�μ�ID
        ) AS �μ���
     , B.�μ�����������
  FROM ���� A , (
                  SELECT �μ�ID
                       , MIN(����) AS �μ�����������
                  FROM ����
                  WHERE �μ�ID IS NOT NULL
                  GROUP BY  �μ�ID
                ) B
 WHERE A.�μ�ID = B.�μ�ID
   AND A.���� = B.�μ����������� ;
     
--2.
SELECT *
  FROM (
        SELECT *
          FROM ����
         WHERE ���� IS NOT NULL
         ORDER BY ����
        )
 WHERE ROWNUM <= 3;

--���� ��������
SELECT *
  FROM ����
 WHERE ���� >= (SELECT AVG(����)
                 FROM ����
               ) ;
