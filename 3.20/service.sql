SELECT *
  FROM ����
 WHERE �μ�ID = 'D001'
    OR �μ�ID = 'D002'
   AND �̸�   = '��ö��' ; --�⺻������ AND���� ���

SELECT * FROM ���� ;

SELECT *
  FROM ����
 WHERE (�μ�ID = 'D001' OR �μ�ID = 'D002') --OR���� ���
   AND �̸�   = '��ö��' ; 

SELECT ����ID
     , ����
     , 1
  FROM ���� ;

SELECT ����ID
     , ����
     , 1 AS ���ͷ�
  FROM ���� ;
  
SELECT ����ID
     , ����
     , 1000
     , ���� + 1000
  FROM ���� ;
  
SELECT ����ID
     , ����
     , 1000
     , ���� - 1000 AS ����
  FROM ���� ;
  
SELECT ����ID
     , ����
     , ���� * 0.1          AS ���ʽ�
     , ���� + (���� * 0.1) AS �Ǽ��ɾ�
  FROM ���� ;

SELECT ����ID
     , ���� || '���̺�'
  FROM ���� ;
  

SELECT �̸�
     , ����
     , �̸� || ' ������ ������ ' || ���� || ' ���� �Դϴ�.'
  FROM ���� ;
  

SELECT LOWER('ABCDE123@@') AS LOWER���
  FROM DUAL; --DUAL�� �׽�Ʈ �� �� ���� ���̺�

SELECT �н�����, UPPER(�н�����) AS UPPER���н�����
  FROM ���� ;
  
SELECT �н�����
     , SUBSTR(�н�����,2,3) AS SUBSTR���н����� --SUBSTR(�÷�,START(���۰�1),HOW)
  FROM  ���� ;

SELECT TRIM('   �ȳ��ϼ���    '), TRIM(    '�� �� �ϼ���  ')
  FROM DUAL ;
  
--ex ) ����ڰ� ' 01083470096' �Է��ϸ� �״�� ��.
--TRIM(' 01083470096')

SELECT TRIM(' 01082282828  ')FROM DUAL ;

--REPLACE(���������ͷ�1�� , �ٲ� , �ٲܰ�) 
SELECT �ֹε�Ϲ�ȣ
     , REPLACE(�ֹε�Ϲ�ȣ , '-', '') AS ����
  FROM ���� ;

SELECT REPLACE('010-8347-0096' , '-' , '')  FROM DUAL ;


--1.
SELECT SUBSTR('https://smhrd.or.kr/', 9,5) 
  FROM DUAL ;
  
--2.
SELECT ����ID
     , �ֹε�Ϲ�ȣ
     , SUBSTR(�ֹε�Ϲ�ȣ, 1, 6 ) AS �������
  FROM ���� ;
  
--3.
SELECT ����ID
     , �����ڵ�
     , ����ó
     , REPLACE(����ó , '-', '')
  FROM ��������ó ;

--MOD (������)
SELECT ����
     , MOD(����, 1000)
  FROM ���� ;
  
--ROUND(�ݿø�)
--ROUND(������ ���ͷ�, �Ҽ��� �ڸ���)

SELECT ROUND(1.452, 2)
     , ROUND(1.452, 1)
  FROM DUAL ;
  
--��¥�� �Լ�
--SYSDATE
SELECT SYSDATE
  FROM DUAL ;
  
SELECT SYSDATE
     , SYSDATE + 1 AS �Ϸ����
     , SYSDATE + 1/24 AS �ѽð�����
     , SYSDATE + 1/24/60 AS �Ϻд���
     , SYSDATE + 1/24/60/60 AS ���ʴ���
  FROM DUAL ;
  
--ADD_MONTHS(��¥��, ������ ���ͷ�) ���������ͷ� : 1�� 1����
SELECT ����ID, �Ի��Ͻ� FROM ���� ;
SELECT ����ID
     , �Ի��Ͻ�
     , ADD_MONTHS(�Ի��Ͻ�, 60)
     , ADD_MONTHS(�Ի��Ͻ�, -60)
  FROM ���� ;
  

--4.
SELECT ����ID
     , �Ի��Ͻ�
     , ADD_MONTHS(�Ի��Ͻ�, 60) AS �������Ի��Ͻ�
  FROM ���� ;
  
--5
SELECT SYSDATE + 3
  FROM DUAL ;


SELECT TO_NUMBER('1') FROM DUAL ; -- ������('1')�� ������(1) �� ����ȯ�� ���
SELECT TO_CHAR(1) FROM DUAL ; --������(1)�� ������('1') �� ����ȯ�� ���

--Ư�� �������� �ٲ� �߿�
SELECT TO_CHAR(SYSDATE , 'YYYY/MM/DD HH24:MI:SS') 
  FROM DUAL ;

SELECT TO_CHAR(SYSDATE , 'YYYY/MM/DD') 
  FROM DUAL ;
  

-- ���� 
--YYYY : ����4�ڸ�
--  MM : �� 2�ڸ� (1���̶�� 01)
--  DD : �� 2�ڸ� (1���̶�� 01, 20���̶�� 20)
--HH24 : �ð��� �ǹ� (24�ð���) 0~23��
--  HH : �ð��� �ǹ� (12�ð���)
--  MI : ��(0~59)
--  SS : �� (0~59) 
  
  
  
  
  
SELECT TO_DATE('20230101' , 'YYYY/MM/DD') FROM DUAL ; 
SELECT TO_DATE('20230101141212' , 'YYYY/MM/DD HH24:MI:SS') FROM DUAL; 