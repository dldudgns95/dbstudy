/*
    테이블
    1. 데이터베이스에서 데이터를 저장하는 객체이다.
    2. 표 형식으로 구성된다.
    3. 행(ROW)와 열(COLUMN)의 집합 형태이다
*/

/*
    데이터타입 종류
    1. NUMBER(p,s) : 정밀도 p,스케일 s로 표현하는 숫자 형식
        1)정밀도 p : 전체 유효 숫자의 갯수(디폴트 : 38)
            ex) 1 , 01 , 001 은 전부 같은 정밀도(1)를 가진다.
        2)스케일 s : 소수부의 유효 숫자의 갯수(디폴트 : 0)
            ex) 0.1 , 0.10 은 같은 스케일(1)을 가지고 0.01 은 스케일(2)를 가진다.
        ex) NUMBER(2,2) = 0.01 ~ 0.99
    2. CHAR(size) : 고정 문자(character)
        1)글자 수가 고정된 타입 (예시 : 핸드폰번호, 주민번호 등)
        2)size : 최대 2000 byte 
    3. VARCHAR2(size) : 가변 문자
        1)글자 수가 고정되지 않은 타입(예시 : 이름, 이메일, 주소 등)
        2)size : 최대 4000 byte
    4. CLOB : 큰 텍스트 타입
    5. DATE : 날짜와 시간을 동시에 표현하는 타입(년, 월, 일, 시, 분, 초)
    6. TIMESTAMP : 날짜와 시간을 동시에 표현하는 타입(년, 월, 일, 시, 분, 초, 마이크로초(백만분의1초))
*/

/*
    테이블 제약조건 5가지
    1. NOT NULL     : 필수
    2. UNIQUE       :중복 불가
    3. PRIMARY KEY  : 기본키
    4. FOREIGN KEY  : 외래키
    5. CHECK        : 값의 제한
*/
//고객 테이블
DROP TABLE CUSTOMER_T;
CREATE TABLE CUSTOMER_T(
    NO         NUMBER       NOT NULL    PRIMARY KEY,
    ID         VARCHAR2(32) NOT NULL    UNIQUE,
    NAME       VARCHAR2(32) NOT NULL,
    JOB        VARCHAR2(32),
    PHONE      VARCHAR2(13) UNIQUE,
    JUBUN      VARCHAR2(14) UNIQUE
);
