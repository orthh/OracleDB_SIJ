--UPDATE ���̺�� SET �ٲ��÷� = �ٲܰ� WHERE �ٲٰ���������� ;

--DELETE FROM ���̺�� WHERE ������;

SELECT * FROM ��������ó WHERE ����ID = 'A0008' ;

--DDL(Data Definition Language)
--�ڷ��� 
--NUMBER(n,m) n�ڸ���ŭ �Է� �ް� m�ڸ���ŭ �Ҽ��ڸ��� ���ڴ�.
--�ǹ������� �׳ɳѹ��ξ�

CREATE TABLE QUIZ_TABLE (
   
   Q_ID        NUMBER(3,0) NOT NULL ,
   
   Q_CONTENT   VARCHAR2(200) NOT NULL,
   
   Q_ANSWER    VARCHAR2(100) , 
   
   REG_DATE    DATE DEFAULT SYSDATE
   
) ;

INSERT INTO QUIZ_TABLE (
       Q_ID
     , Q_CONTENT
     , Q_ANSWER
)VALUES (
       1
     , '��� ����� �����ϱ��?'
     , 'mouse'
) ;

INSERT INTO QUIZ_TABLE (
       Q_ID
     , Q_CONTENT
     , Q_ANSWER
)VALUES (
       2
     , '�޷��� ����� �����ϱ��?'
     , 'calendar'
) ;

INSERT INTO QUIZ_TABLE (
       Q_ID
     , Q_CONTENT
     , Q_ANSWER
)VALUES (
       3
     , '���̴� ����� �����ϱ��?'
     , 'paper'
) ;

--�ǽ�1
CREATE TABLE ȸ������ (

   ȸ��ID      VARCHAR2(10) NOT NULL ,
   
   �̸�        VARCHAR2(20) NOT NULL ,
   
   ��������     DATE ,
   
   ����        CHAR(3) DEFAULT 0
   
) ;

CREATE TABLE ȸ������ó (

   ȸ��ID      VARCHAR2(10) NOT NULL ,
   
   �����ڵ�     VARCHAR2(10) NOT NULL ,
   
   ����ó      VARCHAR2(15) NOT NULL 
   
) ;

CREATE TABLE ȸ���ּ� (
   
   ȸ��ID       VARCHAR(10) NOT NULL ,
   
   ���θ��ּ�    VARCHAR(200) NOT NULL 
   
) ;

--�ǽ�2
ALTER TABLE ȸ������ ADD CONSTRAINT PK_ȸ������ PRIMARY KEY (ȸ��ID) ;
ALTER TABLE ȸ������ó ADD CONSTRAINT PK_ȸ������ó PRIMARY KEY (ȸ��ID, �����ڵ�) ;
ALTER TABLE ȸ���ּ� ADD CONSTRAINT PK_ȸ���ּ� PRIMARY KEY (ȸ��ID) ;

COMMIT ;

--�ǽ�3
ALTER TABLE ȸ������ó ADD CONSTRAINT FK_ȸ������ó 
      FOREIGN KEY (ȸ��ID) REFERENCES ȸ������(ȸ��ID) ;
      
ALTER TABLE ȸ���ּ� ADD CONSTRAINT FK_ȸ���ּ�
      FOREIGN KEY (ȸ��ID) REFERENCES ȸ������(ȸ��ID) ;
      
COMMIT ;

--ALTER ���̺��� �߸� ���� ���� ����
ALTER TABLE ���� ADD ( ������� VARCHAR2(8) ) ;

select * FROM ���� ;
ALTER TABLE ���� DROP COLUMN ������� ;

ALTER TABLE ���� MODIFY (�н����� VARCHAR2(300) ) ;

ALTER TABLE ���� RENAME COLUMN �н����� TO ��й�ȣ ; 
