/*
    조인(JOIN)
    1. 2개 이상의 테이블을 한번에 조회하는 방식이다.
    2. 각 테이블의 관계(1:M)를 이용해서 조인 조건을 만든다.
    3. 조인 종류
        1) 내부 조인 : 2개 테이블에 모두 존재하는 데이터만 조회하는 방식
        2) 외부 조인 : 2개 테이블에 모두 존재하지 않더라도 조회하는 방식
*/

/*
    드라이브 테이블 VS 드리븐 테이블
    
    1. 드라이브 테이블
        1) 조인 관계를 처리하는 메인 테이블
        2) 1:M 관계에서 1에 해당하는 테이블
        3) 일반적으로 데이터의 갯수가 적다.
        4) PK를 조인 조건으로 사용하기 때문에 인덱스(INDEX) 사용이 가능 (빠르다는 의미)
    2. 드리븐 테이블
        1) 1:M 관계에서 M에 해당하는 테이블
        2) 일반적으로 데이터의 갯수가 많다.
        3) FK를 조인 조건으로 사용하기 때문에 인덱스(INDEX) 사용이 불가능 (느리다는 의미)
    3. 드라이브 테이블을 드리블 테이블보다 먼저 작성하면 성능에 도움이 된다.
*/

-- 내부 조인

--1. 사원번호, 사원명, 부서번호, 부서명을 조회하시오.
SELECT E.EMPLOYEE_ID                                 AS 사원번호
     , CONCAT(CONCAT(E.FIRST_NAME,' '), E.LAST_NAME) AS 사원명
     , E.DEPARTMENT_ID                               AS 부서번호
     , D.DEPARTMENT_NAME                             AS 부서명           -- 2개의 테이블에 모두 있는 칼럼은 반드시 테이블(오너)을 명시해야 한다.
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
    
--2. 사원번호, 사원명, 직업, 직업별 최대연봉, 직업별 최소연봉을 조회하시오
SELECT EMPLOYEE_ID                               AS 사원번호
     , CONCAT(CONCAT(FIRST_NAME,' '), LAST_NAME) AS 사원명
     , E.JOB_ID                                  AS 직업번호
     , JOB_TITLE                                 AS 직업명
     , SALARY                                    AS 연봉
     , MAX_SALARY                                AS 직업별_최대연봉
     , MIN_SALARY                                AS 직업별_최소연봉
  FROM EMPLOYEES E INNER JOIN JOBS J
    ON E.JOB_ID = J.JOB_ID;
    
-- 외부 조인

--3. 모든 사원들의(부서가 없는 사원도 포함) 사원번호, 사원명, 부서번호, 부서명을 조회하시오.
SELECT EMPLOYEE_ID
     , CONCAT(CONCAT(FIRST_NAME,' '), LAST_NAME) AS 사원명
     , D.DEPARTMENT_ID
     , DEPARTMENT_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E           --오른쪽 테이블(EMPLOYEES)의 모든 데이터를 조회한다.(부서번호가 없는 사원도 조회한다.)
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
    
--4. 사원번호, 사원명, 부서번호, 부서명을 조회하시오. 사원이 근무하지 않는 유령 부서도 조회하시오.
SELECT EMPLOYEE_ID
     , CONCAT(CONCAT(FIRST_NAME,' '), LAST_NAME) AS 사원명
     , D.DEPARTMENT_ID
     , DEPARTMENT_NAME
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E            --왼쪽 테이블(DEPARTMENTS)의 모든 데이터를 조회한다.(사원이 근무하지 않는 부서도 조회한다.)
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);
    
-- 3개 이상 테이블 조인하기

--5. 사원번호, 사원명, 부서번호, 부서명, 근무지역을 조회하시오.
SELECT EMPLOYEE_ID                               AS 사원번호
     , CONCAT(CONCAT(FIRST_NAME,' '), LAST_NAME) AS 사원명
     , D.DEPARTMENT_ID                           AS 부서번호
     , DEPARTMENT_NAME                           AS 부서명
     , L.LOCATION_ID                             AS 근무번호
     , CITY                                      AS 근무지역
  FROM LOCATIONS L INNER JOIN DEPARTMENTS D
    ON L.LOCATION_ID = D.LOCATION_ID INNER JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;
    
--6. 부서번호, 부서명, 근무도시, 근무국가를 조회하시오.
SELECT DEPARTMENT_ID        AS 부서번호
     , DEPARTMENT_NAME      AS 부서명
     , CITY                 AS 근무도시
     , COUNTRY_NAME         AS 근무국가
  FROM COUNTRIES C INNER JOIN LOCATIONS L
    ON C.COUNTRY_ID = L.COUNTRY_ID INNER JOIN DEPARTMENTS D
    ON L.LOCATION_ID = D.LOCATION_ID;