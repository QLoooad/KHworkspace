


-- 1. 춘천대 학과 이름, 계열 표시 
--		출력헤더는 학과 명, 계열
SELECT DEPARTMENT_NAME "학과 명", CATEGORY "계열" 
FROM TB_DEPARTMENT;

-- 2.
SELECT DEPARTMENT_NAME || '의 정원은 ' || CAPACITY || '명 입니다.' "학과별 정원"
FROM TB_DEPARTMENT;

-- 3. "국어국문학과" 휴학생 여부
SELECT STUDENT_NAME 
FROM TB_DEPARTMENT
JOIN TB_STUDENT USING(DEPARTMENT_NO)
WHERE ABSENCE_YN = 'Y' 
AND DEPARTMENT_NAME = '국어국문학과' 
AND SUBSTR(STUDENT_SSN, 8, 1) = '2' ;


-- 4. 도서 장기 연체자 이름
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NAME DESC;


-- 5. 입학정원 20명 이상 30명 이하인 학과 이름, 계열


SELECT DEPARTMENT_NAME , CATEGORY  
FROM TB_DEPARTMENT
WHERE CAPACITY >= 20 AND CAPACITY <= 30;
--CAPACITY BETWEEN 20 AND 30;



-- 6. 춘 대학교는 총장 제외 모든 교수는 소속학과를 가짐
--		춘 대학교의 총장 이름을 알수있는 SQL 문장 작성

SELECT PROFESSOR_NAME 
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;


-- 7. 학과 없는 학생 출력(서가람 018 A213046)
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;


-- 8. 선수과목이 존재하는 과목의 과목번호 조회

SELECT CLASS_NO 
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

-- 9. 춘 대학교의 계열
SELECT DISTINCT CATEGORY 
FROM TB_DEPARTMENT;

-- 10. 02학번 전주 거주자 모임, 휴학 제외, 학번 이름 주민번호
SELECT STUDENT_NO, STUDENT_NAME , STUDENT_SSN
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) = '2002'
AND STUDENT_ADDRESS LIKE '%전주%'
AND ABSENCE_YN = 'N';

