/*
    DDL
    1. Data Definition Language
    2. 데이터베이스 객체를 다루는 언어
    3. 트랜잭션 대상이 아니다.(작업을 취소할 수 없다.)
        ㄴ트랜잭션 = 반드시 한번에 작업해야 하는 내용
    4. 종류
        -CREATE   : 생성
        -ALTER    : 수정
        -DROP     : 삭제
        -TRUNCATE : 삭제(내용(ROW)만 삭제)
*/
--테이블 삭제
DROP TABLE CUSTOMER_TBL;
DROP TABLE BANK_TBL;

--BANK 테이블 생성
CREATE TABLE BANK_TBL(
    BANK_CODE VARCHAR2(20),
    BANK_NAME VARCHAR2(30),
    CONSTRAINT PK_BANK PRIMARY KEY(BANK_CODE)
);

--CUSTOMER 테이블 생성
CREATE TABLE CUSTOMER_TBL(
    NO        NUMBER,
    NAME      VARCHAR2(30)  NOT NULL,
    PHONE     VARCHAR2(30)  UNIQUE,
    AGE       NUMBER,
    BANK_CODE VARCHAR2(20),
    CONSTRAINT PK_CUSTOMER PRIMARY KEY(NO),
    CONSTRAINT CHECK_AGE CHECK(AGE BETWEEN 0 AND 100),
    CONSTRAINT FK_BANK_CUSTOMER FOREIGN KEY(BANK_CODE) REFERENCES BANK_TBL(BANK_CODE)
);


/*
    테이블 수정하기
    1. 칼럼 추가   : ALTER TABLE [테이블명] ADD [칼럼명] [데이터타입] [제약조건]
    2. 칼럼 수정   : ALTER TABLE [테이블명] MODIFY [칼럼명] [데이터타입] [제약조건]
    3. 칼럼 삭제   : ALTER TABLE [테이블명] DROP COLUMN [칼럼명]
    4. 칼럼 이름   : ALTER TABLE [테이블명] RENAME COLUMN [기존 칼럼명] TO [신규 칼럼명]
    5. 테이블 이름 : ALTER TABLE [테이블명] RENAME TO [신규 테이블명]
    6. PK/FK 제약조건
        1)PK
            (1) 추가
                ALTER TABLE [테이블명] ADD CONSTRAINT [제약조건명] PRIMARY KEY(칼럼명)
            (2) 삭제
                ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건명]
                ALTER TABLE [테이블명] DROP PRIMARY KEY
        2)FK
            (1) 추가
                ALTER TABLE [자식 테이블명] ADD CONSTRAINT [제약조건명] FOREIGN KEY(칼럼명) REFERENCES [부모테이블명](참조할 칼럼)
            (2) 삭제
                ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건명]
            (3) 일시중지
                ALTER TABLE [테이블명] DISABLE CONSTRAINT [제약조건명]
            (4) 활성화
                ALTER TABLE [테이블명] ENABLE CONSTRAINT [제약조건명]
*/

--실습

--1. 은행 테이블에 연락처(BANK_TEL) 칼럼을 추가 하시오.
ALTER TABLE BANK_TBL ADD BANK_TEL VARCHAR2(15) NOT NULL;

--2. 은행 테이블의 은행명(BANK_NAME) 칼럼의 데이터타입을 VARCHAR2(15 BYTE)로 변경하시오.
ALTER TABLE BANK_TBL MODIFY BANK_NAME VARCHAR2(15);

--3. 고객 테이블의 나이(AGE) 칼럼을 삭제하시오.
ALTER TABLE CUSTOMER_TBL DROP COLUMN AGE;

--4. 고객 테이블의 고객번호(NO) 칼럼명을 CUST_NO으로 변경하시오.
ALTER TABLE CUSTOMER_TBL RENAME COLUMN NO TO CUST_NO;




--5. 고객 테이블에 GRADE 칼럼을 추가하시오. ('VIP','GOLD','SILVER','BRONZE' 중 하나의 값을 가지도록 한다.)
ALTER TABLE CUSTOMER_TBL ADD GRADE VARCHAR2(6) CHECK(GRADE IN ('VIP','GOLD','SILVER','BRONZE'));

--6. 고객 테이블의 고객명(NAME)과 연락처(PHONE) 칼럼 이름을 CUST_NAME,CUST_PHONE으로 변경하시오.
ALTER TABLE CUSTOMER_TBL RENAME COLUMN NAME TO CUST_NAME;
ALTER TABLE CUSTOMER_TBL RENAME COLUMN PHONE TO CUST_PHONE;

--7. 고객 테이블의 연락처(CUST_PHONE) 칼럼을 필수 칼럼으로 변경하시오.
ALTER TABLE CUSTOMER_TBL MODIFY CUST_PHONE VARCHAR2(30) NOT NULL;

--8. 고객 테이블의 고객명(CUST_NAME) 칼럼의 필수 제약조건을 없애시오.
ALTER TABLE CUSTOMER_TBL MODIFY CUST_NAME VARCHAR2(30) NULL;

--테이블 구조 확인하기
DESCRIBE BANK_TBL;
DESC CUSTOMER_TBL;