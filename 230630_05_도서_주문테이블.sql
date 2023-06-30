/*
    도서 쇼핑몰 DATABASE 테이블 구현
*/
--테이블 삭제
DROP TABLE ORDER_T;
DROP TABLE TAX_T;
DROP TABLE CUSTOMER_T;
DROP TABLE BOOK_T;

--도서 테이블 도서번호, 도서이름, 출판사이름, 도서단가
CREATE TABLE BOOK_T(
    BOOK_NO    NUMBER       NOT NULL,
    BOOK_NAME  VARCHAR2(32) NOT NULL,
    BOOK_PUB   VARCHAR2(32) NOT NULL,
    BOOK_PRICE NUMBER       NOT NULL,
    CONSTRAINT PK_BOOK PRIMARY KEY(BOOK_NO)
);

--고객 테이블 고객번호, 고객이름, 주소, 전화번호
CREATE TABLE CUSTOMER_T(
    CUSTOMER_NO     NUMBER       NOT NULL,
    CUSTOMER_NAME   VARCHAR(32)  NOT NULL,
    CUSTOMER_ADRESS VARCHAR(100) NOT NULL,
    CUSTOMER_PHONE  VARCHAR(32)  NOT NULL,
    CONSTRAINT PK_CUSTOMER PRIMARY KEY(CUSTOMER_NO)
);

--택배 테이블 택배번호, 택배이름, 택배시간

CREATE TABLE TAX_T(
    TAX_NO   NUMBER      NOT NULL,
    TAX_NAME VARCHAR(32) NOT NULL,
    TAX_TIME DATE        NOT NULL,
    CONSTRAINT PK_TAX PRIMARY KEY(TAX_NO)
);
--주문 테이블 주문번호, 고객번호, 도서번호, 주문일자, 주문금액
CREATE TABLE ORDER_T(
    ORDER_NO    NUMBER NOT NULL,
    CUSTOMER_NO NUMBER NOT NULL,
    BOOK_NO     NUMBER,
    TAX_NO      NUMBER NOT NULL,
    ORDER_DATE  DATE   NOT NULL,
    ORDER_PRICE NUMBER NOT NULL,
    CONSTRAINT PK_ORDER PRIMARY KEY(ORDER_NO),
    CONSTRAINT FK_CUSTOMER_ORDER FOREIGN KEY(CUSTOMER_NO) REFERENCES CUSTOMER_T(CUSTOMER_NO) ON DELETE CASCADE,
    CONSTRAINT FK_BOOK_ORDER FOREIGN KEY(BOOK_NO) REFERENCES BOOK_T(BOOK_NO) ON DELETE SET NULL,
    CONSTRAINT FK_TAX_ORDER FOREIGN KEY(TAX_NO) REFERENCES TAX_T(TAX_NO)
);
