SELECT TO_NUMBER('1') FROM DUAL ; -- ������('1')�� ������(1) �� ����ȯ�� ���
SELECT TO_CHAR(1) FROM DUAL ; --������(1)�� ������('1') �� ����ȯ�� ���
SELECT TO_CHAR(SYSDATE , 'YYYY/MM/DD HH24:MI:SS') FROM DUAL ; 
SELECT TO_DATE('20230101' , 'YYYY/MM/DD') FROM DUAL ; 
SELECT TO_DATE('20230101141212' , 'YYYY/MM/DD HH24:MI:SS') FROM DUAL;

--������� (������ 8�ڸ��� �ִ´�. YYYYMMDD)
SELECT SYSDATE
  FROM DUAL ;
  
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') 
  FROM DUAL ;
  
SELECT TO_DATE('20230101' , 'YYYY/MM/DD') FROM DUAL ;

--�ǽ�1
SELECT ����ID
     , �Ի��Ͻ�
     , TO_CHAR(�Ի��Ͻ�, 'YYYY') AS �Ի翬��  --�Ի��Ͻ� : DATEŸ�� , to_char
  FROM ���� ;
  

--���ڿ� + ����
SELECT �̸� + 1000 --���� 
  FROM ���� ;

--�� �Ʒ� �������� ��¥ > ���� > ����
SELECT TO_NUMBER(�̸�) + 1000 FROM ���� ;

SELECT '1' + 1 FROM DUAL ; --2 
--������ ���� �Ʒ��� �ڵ� ����ȯ�̵�
SELECT TO_NUMBER('1') + 1 FROM DUAL ;

SELECT �̸� + ����
  FROM ���� ; -- ���� || ���
  
SELECT * FROM ���� ;

SELECT ����ID
     , ����
     , NVL(����, 0) + 20 AS ��������
  FROM ���� ;
  
SELECT ����ID
     , ����
     , NVL2(����, ����, 0)
  FROM ���� ;
  
SELECT ����ID
     , �μ�ID
     , DECODE(�μ�ID, 'D001', 'ok', 'no')
  FROM ���� ;
  
SELECT COALESCE(NULL, NULL, NULL, 1, NULL) 
  FROM DUAL ;
  
SELECT COALESCE(5, NULL, NULL, 1, NULL) 
  FROM DUAL;
  
--1
SELECT NVL(NULL, '1') FROM DUAL; --1

--2
SELECT COALESCE(NULL, NULL, '2') FROM DUAL ; --2

--3
SELECT NVL('1','5') FROM DUAL ; --1


--�ǽ�1
SELECT ����ID
     , �н�����
     , NVL(����, 20) AS ����
  FROM ���� ;
  
--�ǽ�2
SELECT ����ID
     , ����
     , ����
     , DECODE(����, '��', '�����Դϴ�', '�����Դϴ�') AS ����Ȯ��
  FROM ���� ;
  
  
  
--WHERE�� -��������
SELECT *
  FROM ����
 WHERE NOT �̸� = '������' ;
 
SELECT * 
  FROM ����
 WHERE �̸� != '������' ;
  
SELECT *
  FROM ����
 WHERE �̸� <> '������' ;
 
--����1 ) ��������ó ���̺��� �����ڵ尡 ���޴����� �� �ƴ� �������� ��� ������ ������ּ���
SELECT * 
  FROM ��������ó
 WHERE �����ڵ� != '�޴���' ;
 
--����2 ) ���̰� 50�� �̸��� �ƴ� ������ ����ID , �̸� , ���� , ���� �� ������ּ�
SELECT ����ID
     , �̸�
     , ����
     , ����
  FROM ���� 
 WHERE ���� >= 50 ;

SELECT *
  FROM ����
 WHERE ���� = NULL ; --�ȳ��� NULL �� ������� �Ұ�
 
SELECT *
  FROM ����
 WHERE ���� IS NULL ; --����
 
SELECT *
  FROM ����
 WHERE ���� IS NOT NULL ; --����
 
 
 --����1 ) ���� ���̺��� ���̰� NULL �� �ƴ� ������ ��� ������ּ���
SELECT *
  FROM ����
 WHERE ���� IS NOT NULL ;
 
 
 
-- ����2 ) ���� �߿� �Ի��Ͻð� �������� ���� ������ ������ּ���. 
SELECT *
  FROM ����
 WHERE �Ի��Ͻ� IS NULL ;
  
--IN ������(SQL������)
SELECT *
  FROM ����
 WHERE ����ID = 'A0001' OR ����ID = 'A0003' OR ����ID = 'A0005' OR ����ID = 'A0007' ;
 
---�Ʒ��� ���� ������ ���� ������.
SELECT *
  FROM ����
 WHERE ����ID NOT IN ('A0001','A0003', 'A0005', 'A0007', NULL) ;
  
SELECT *
  FROM ����
 WHERE ���� >= 20
   AND ���� <=29 ;

SELECT *
  FROM ����
 WHERE ���� BETWEEN 20 AND 29 ;
 
--���ǻ��� 3����
--��� �ڷ��� ����(��¥��, ������, ������ �� �� �� �ִ�.)
--OR�� �ƴ�, ������ AND�̴�
--�̻� , ������
--ù���� ���� �ι�° ���� ���ų� �۾ƾ��Ѵ�.

SELECT *
  FROM ����
 WHERE �Ի��Ͻ� BETWEEN SYSDATE - 365 AND SYSDATE ; --����

SELECT *
  FROM ����
 WHERE ����ID BETWEEN 'A0001' AND 'A0005' ; --����
  
--LIKE �� ��Ī ������ �Ҽ� �ִ�.
--���� 1 ) ������ �� �̸��� ������ ���� �����ϴ� ��� ����� ������ּ���.
SELECT *
  FROM ����
 WHERE �̸� LIKE '��%' ;
--%�� 0�� �̻��� ���ڸ� ��Ī�� �� �ִ�. '��' �� �����. 0���� ����

--���� 2 ) ������ �� �̸� �߿� ��ȫ�� �� ���Ե� ��� ����� ������ּ���.
SELECT *
  FROM ����
 WHERE �̸� LIKE '%ȫ%' ;
 
--���� 3 ) ������ �� �н����尡 ��123�� ���� ������ ��� ����� ������ּ���.
SELECT *
  FROM ����
 WHERE �н����� LIKE '%123' ;
  
--���� 4 ) ������ �� �̸��� ����° ���ڰ� ������ �� �������� ��� ����� ������ּ���.
SELECT * 
  FROM ����
 WHERE �̸� LIKE '__��' ;
 
--���� 5 ) �μ��̸� �� @@��ó�� 3���ڷ� �̷����� �η� ������ ��� ����� ������ּ���
SELECT *
  FROM �μ�
 WHERE �μ��� LIKE '__��' ;
 
 
--EX) ������ �� 2015�⿡ �Ի��� ����� ������ּ���.
--1.TO_CHAR�� Ȱ���� ��� (�ʺ���)
SELECT *
  FROM ����
 WHERE TO_CHAR(�Ի��Ͻ�, 'YYYY') = '2015' ;

--2.TO_DATE�� Ȱ���� ��� (�߱���)
SELECT *
  FROM ����
 WHERE �Ի��Ͻ� BETWEEN TO_DATE('20150101') AND TO_DATE('20160101') ;
 
SELECT *
  FROM ����
 WHERE �Ի��Ͻ� >= TO_DATE('20150101')
   AND �Ի��Ͻ� < TO_DATE('20160101') ;
   
   
   
--����1 ) ���� ���̺��� �̸��� ��ö�� �� ���ԵǴ� ������ ����ID , �̸�, ���̸� ������ּ���.
SELECT ����ID
     , �̸�
     , ����
  FROM ����
 WHERE �̸� LIKE '%ö%';
 
--����2 ) ���� �߿� 2015�⵵�� �Ի縦 �߰ų�, �Ի��Ͻð� �������� ���� ������ ��� ������ ������ּ���
SELECT *
  FROM ����
 WHERE �Ի��Ͻ� BETWEEN TO_DATE('20150101000000', 'YYYY/MM/DD HH24:MI:SS') 
   AND TO_DATE('20151231235959' , 'YYYY/MM/DD HH24:MI:SS') 
    OR �Ի��Ͻ� IS NULL ;


--����3 ) 2017�� ���ĺ��� ���� �������� �Ի��� ��� ������ ������ּ���.
SELECT *
  FROM ����
 WHERE �Ի��Ͻ� >= TO_DATE('20170101000000', 'YYYYMMDDHH24MISS') ;

--����4 ) ���� �߿� ������ 7000 ~ 9000 ������ �������� ����ID , ���� , �Ի��Ͻø� ������ּ���.
SELECT ����ID
     , ����
     , �Ի��Ͻ�
  FROM ����
 WHERE ���� BETWEEN 7000 AND 9000 ;
 
--����5 ) �����ּ� ���̺��� �ּҰ� �������� �� �����ϴ� ��� �����͸� ������ּ���
SELECT ����ID
     , �����ڵ�
     , �ּ�
  FROM �����ּ�
 WHERE �ּ� LIKE '����%' ;
 
 
 --FROM
SELECT SERVICE.����.����ID
  FROM SERVICE.����
 WHERE SERVICE.����.����ID = 'A0005';
 
SELECT ����ID
  FROM ����
 WHERE ����ID = 'A0005' ;
 
SELECT * 
  FROM ���� , ��������ó ;
  
SELECT ����.����ID
     , ����.�̸�
     , ����.����
     , ����.����
     , ��������ó.����ID
     , ��������ó.����ó
  FROM ����, ��������ó
 WHERE ����.����ID = ��������ó.����ID ;
 
SELECT A.����ID
     , A.�̸�
     , A.����
     , A.����
     , B.����ID
     , B.����ó
  FROM ���� A , ��������ó B
 WHERE A.����ID = B.����ID ;
 
 --FROM�� ���� ���� ����
 
 
 --����
 SELEcT * FROM ���� ; 
 
SELECT  A.����ID
      , A.�̸�
      , A.����
      , B.����ó
  FROM  ���� A
      , ��������ó B
 WHERE A.����ID = B.����ID
   AND A.����ID = 'A0006'
   AND B.�����ڵ� = '�޴���' ;
 
 