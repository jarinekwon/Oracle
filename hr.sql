-- #INFORMATION Command
DESC employees;
INFO departments;
INFO+ employees;

-- #SQL Statement Basics
SELECT * FROM employees;
SELECT * FROM departments;

-- #Oracle Error Messages
SELECT * employees;
SELECT 1 + 'abc' FROM dual;
SELECT 1 + 2 FROM dual;
CREATE OR REPLACE PUBLIC SYNONYM jobs FOR hr.jobs;

-- #Using SELECT Statements
--Retrieving all the columns(fields) from a table. 
SELECT * FROM employees;
 
--Retrieving specific column(s) from a table.
SELECT first_name, last_name, email FROM EMPLOYEES;

-- #Using Column Aliases
SELECT first_name, last_name, email FROM employees; 
SELECT first_name AS name, last_name as surname, email FROM employees; 
SELECT first_name AS "My     Name", email "E-mail" FROM employees; 
SELECT first_name AS "My Name", email "E-mail" FROM employees; 
SELECT employee_id, salary + nvl(salary*commission_pct,0) + 1000 new_salary, salary FROM employees;

-- #Quote(Q) Operator
select * from dual;
select 'My Name is Adam' as "Output" from dual;
select 'I''m using quote operator in SQL statements' as "Output" from dual;
select q'[I'm using quote operator in SQL statements]' as "Quote Operator" from dual;
select q'<I'm using quote operator in SQL statements>' as "Quote Operator" from dual;
select q'dI'm using quote operator in SQL statementsd' as "Quote Operator" from dual;

-- #DISTINCT and UNIQUE Operators
SELECT first_name FROM employees;
SELECT distinct first_name FROM employees;
SELECT unique first_name FROM employees;
SELECT distinct job_id, distinct department_id FROM employees;
SELECT distinct job_id, department_id FROM employees;
SELECT distinct job_id FROM employees;
SELECT distinct job_id, department_id, first_name FROM employees;
SELECT job_id, distinct department_id, first_name FROM employees;

-- #Concatenation Operators
SELECT 'My Name is Alex' FROM employees;
SELECT 'My Name is ' || first_name FROM employees;
SELECT 'The commission percentage is ' || commission_pct AS concatenation,commission_pct FROM employees;
SELECT first_name || ' ' || last_name AS "full name" FROM employees;
SELECT * FROM employees;
SELECT * FROM locations;
SELECT street_address || ',' || city || ',' || postal_code || ',' || state_province || ',' || country_id AS "full address" 
FROM locations;

-- #Arithmetic Expressions and NULL Values
SELECT * FROM employees;
SELECT employee_id, salary, salary*12 as annual_salary FROM employees;
SELECT employee_id, salary, salary+100*12 as annual_salary FROM employees;
SELECT employee_id, salary, (salary+100)*12 as annual_salary FROM employees;
SELECT sysdate FROM dual;
SELECT sysdate + 4 FROM dual;
SELECT employee_id, hire_date, hire_date+5 FROM employees;
SELECT salary, salary*commission_pct, commission_pct FROM employees; 

-- #Using WHERE Clause
SELECT * FROM employees;
SELECT * FROM employees WHERE salary > 10000;
SELECT * FROM employees WHERE job_id = 'IT_PROG';

-- #Comparison Operators
SELECT * FROM employees;
SELECT * FROM employees WHERE salary > 10000;
SELECT * FROM employees WHERE salary < 10000;
SELECT * FROM employees WHERE hire_date > '01-JUN-05';
SELECT * FROM employees WHERE hire_date = '21-MAY-07';
SELECT * FROM employees WHERE manager_id = 100;

-- #BETWEEN AND Operator
SELECT * FROM employees WHERE salary BETWEEN 10000 AND 14000;
SELECT * FROM employees WHERE hire_date BETWEEN '07-JUN-02' AND '29-JAN-08';
SELECT * FROM employees WHERE hire_date BETWEEN '07-JUN-02' AND '29-JAN-05';

-- #IN Operator
SELECT * FROM employees 
    WHERE employee_id IN (50, 100, 65, 210)
SELECT * FROM employees 
    WHERE employee_id IN (50, 100, 65, 210, 150);
SELECT * FROM employees 
    WHERE first_name IN ('Steven', 'Peter', 'Adam');
SELECT * FROM employees 
    WHERE first_name IN ('Steven', 'Peter', 'Adam', 'aa');
SELECT * FROM employees 
    WHERE hire_date IN ('08-MAR-08', '30-JAN-05');
    
-- #LIKE Operator
SELECT * FROM employees;
SELECT * FROM employees WHERE job_id = 'SA_REP';
SELECT * FROM employees WHERE job_id LIKE 'SA_REP';
SELECT * FROM employees WHERE job_id LIKE 'SA%';
SELECT * FROM employees WHERE first_name LIKE 'A%';
SELECT * FROM employees WHERE first_name LIKE '%A';
SELECT * FROM employees WHERE first_name LIKE '%a';
SELECT * FROM employees WHERE first_name LIKE '%a%';
SELECT * FROM employees WHERE first_name LIKE '_r%';

-- #IS NULL Operator
SELECT * FROM employees WHERE commission_pct = NULL;
SELECT * FROM employees WHERE commission_pct IS NULL;
SELECT * FROM employees WHERE commission_pct IS NOT NULL;

-- #Logical Operators
SELECT * FROM employees WHERE job_id = 'SA_REP' OR salary > 10000;
SELECT * FROM EMPLOYEES WHERE salary > 10000 AND job_id IN ('SA_MAN', 'SA_REP');
SELECT * FROM EMPLOYEES WHERE salary > 10000 AND job_id NOT IN ('SA_MAN', 'SA_REP');

-- #Rules of Precedence
SELECT first_name, last_name, job_id, salary FROM employees 
WHERE (job_id = 'IT_PROG' or job_id = 'ST_CLERK') and salary > 5000;
 
SELECT first_name, last_name, job_id, salary FROM employees 
WHERE job_id = 'IT_PROG' or (job_id = 'ST_CLERK' and salary > 5000);
 
SELECT first_name, last_name, job_id, salary FROM employees 
WHERE job_id = 'IT_PROG' or job_id = 'ST_CLERK' and salary > 5000;
 
SELECT first_name, last_name, department_id, salary
FROM employees
WHERE salary > 10000 AND department_id = 20 OR department_id = 30;
 
SELECT first_name, last_name, department_id, salary
FROM employees
WHERE salary > 10000 AND (department_id = 20 OR department_id = 30);

-- #ORDER BY Clause
SELECT * FROM employees;
SELECT first_name, last_name, salary FROM employees ORDER BY first_name;
SELECT first_name, last_name, salary FROM employees ORDER BY last_name;
SELECT first_name, last_name, salary, (10*(salary/5) + 3000) - 100 NEW_SALARY
FROM employees ORDER BY NEW_SALARY;
SELECT first_name, last_name, salary, (10*(salary/5) + 3000) - 100 NEW_SALARY
FROM employees ORDER BY 1;
SELECT first_name, last_name, salary, (10*(salary/5) + 3000) - 100 NEW_SALARY
FROM employees ORDER BY 2;
SELECT *
FROM employees ORDER BY 2;
SELECT *
FROM employees ORDER BY 5;
SELECT *
FROM employees ORDER BY first_name, last_name;
SELECT *
FROM employees ORDER BY first_name, job_id, salary;

-- #ASC and DESC Operators
select employee_id, first_name, last_name, salary from employees order by first_name;
select employee_id, first_name, last_name, salary from employees order by first_name asc;
select employee_id, first_name, last_name, salary from employees order by first_name desc;
select employee_id, first_name, last_name, salary from employees order by first_name desc, last_name;
select employee_id, first_name, last_name, salary from employees order by first_name desc, last_name desc;
select employee_id, first_name, last_name, salary from employees order by first_name desc, salary desc;
select employee_id, first_name, last_name, salary s from employees order by first_name desc, s desc;
select employee_id, first_name, last_name, salary s from employees order by 2 desc, s desc;
select first_name, salary, commission_pct from employees order by commission_pct;

-- #NULLS FIRST and NULLS LAST Operators
select first_name, salary, commission_pct from employees order by commission_pct;
select first_name, salary, commission_pct from employees order by commission_pct NULLS FIRST;
select first_name, salary, commission_pct from employees order by commission_pct ASC NULLS FIRST;
select first_name, salary, commission_pct from employees order by commission_pct DESC;
select first_name, salary, commission_pct from employees order by commission_pct DESC NULLS LAST;

-- #ROWNUM & ROWID in SQL
SELECT employee_id, first_name, last_name, salary, rowid, rownum from employees;
SELECT employee_id, first_name, last_name, salary, rowid, rownum from employees where department_id = 60;
SELECT employee_id, first_name, last_name, salary, rowid, rownum from employees where department_id = 80;
SELECT employee_id, first_name, last_name, salary, rowid, rownum from employees 
WHERE department_id = 80 and rownum <= 5 order by salary desc;

-- #Oracle FETCH Clause
SELECT first_name, last_name, salary FROM employees 
ORDER BY salary DESC
OFFSET 1 ROW FETCH FIRST 10 ROWS ONLY;
 
SELECT first_name, last_name, salary FROM employees 
ORDER BY salary DESC
OFFSET 1 ROW FETCH FIRST 10 ROWS WITH TIES;
 
SELECT first_name, last_name, salary FROM employees 
OFFSET 1 ROW FETCH FIRST 10 ROWS WITH TIES;
 
SELECT first_name, last_name, salary FROM employees
ORDER BY salary DESC
FETCH FIRST 10 ROWS WITH TIES;
 
SELECT first_name, last_name, salary FROM employees
ORDER BY salary DESC
OFFSET 5 ROW;
 
SELECT first_name, last_name, salary FROM employees 
ORDER BY salary DESC
OFFSET 1 ROWS FETCH FIRST 10 ROWS WITH TIES;
 
SELECT first_name, last_name, salary FROM employees 
ORDER BY salary DESC
OFFSET 1 ROWS FETCH FIRST 10 ROWS WITH TIES;

-- #Substitution Variable
SELECT employee_id, first_name, last_name, department_id
FROM employees WHERE department_id = 30;
 
SELECT employee_id, first_name, last_name, department_id
FROM employees WHERE department_id = &department_no;
 
SELECT employee_id, first_name, last_name, department_id
FROM employees WHERE first_name = '&name';
 
SELECT employee_id, first_name, last_name, department_id
FROM employees WHERE first_name = &name;
 
SELECT employee_id, first_name, last_name, &column_name
FROM &table_name 
WHERE &condition
ORDER BY &order_by_clause;

-- #Double Ampersand(&&) and DEFINE & UNDEFINE Commands
SELECT employee_id, first_name, last_name, salary
FROM employees 
WHERE salary BETWEEN &sal AND &sal + 1000; 
 
SELECT employee_id, first_name, last_name, salary
FROM employees 
WHERE salary BETWEEN &&sal AND &sal + 1000; 
 
SELECT employee_id, first_name, last_name, &&column_name 
FROM employees
ORDER BY &column_name;
 
SELECT &&column_name 
FROM employees
GROUP BY &column_name
ORDER BY &column_name;
 
DEFINE emp_num = 100;
SELECT * FROM employees WHERE employee_id = &emp_num;
DEFINE emp_num = 200;
DEFINE column_name = 'first_name';
UNDEFINE emp_num;
DEFINE;
DEFINE column_name;
UNDEF column_name;
DEF column_name;	

-- #ACCPET and PROMPT Commands
ACCEPT emp_id PROMPT 'Please Enter a valid Employee ID:';
 
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE employee_id = &emp_id;
 
UNDEFINE emp_id;
 
ACCEPT min_salary PROMPT 'Please specify the MINIMUM salary:'
ACCEPT max_salary PROMPT 'Please specify the MAXIMUM salary:'
SELECT employee_id, last_name, salary 
FROM employees
WHERE salary BETWEEN &min_salary AND &max_salary;
UNDEFINE min_sal;
UNDEF max_sal;

-- #SET VERIFY ON-OFF Commands
SELECT employee_id, first_name, last_name, department_id
FROM employees WHERE department_id = &dept_id;
 
SET VERIFY ON;
SET VERIFY OFF;
 
SELECT * FROM departments WHERE department_name = 'R&D';
SET DEFINE OFF;
SET DEFINE ON;

-- #Case Conversion(LOWER, UPPER, INITCAP) Functions
SELECT first_name, UPPER(first_name), 
       last_name, LOWER(last_name), 
       email, INITCAP(email) FROM employees;
       
SELECT first_name, UPPER(first_name), 
       last_name, LOWER(last_name), 
       email, INITCAP(email) FROM employees
WHERE job_id = 'IT_PROG';
 
SELECT first_name, UPPER(first_name), 
       last_name, LOWER(last_name), 
       email, INITCAP(email),
       UPPER('bmw i8')FROM employees
WHERE job_id = 'IT_PROG';
 
SELECT * FROM employees
WHERE last_name = 'KING';
 
SELECT * FROM employees
WHERE last_name = 'king';
 
SELECT * FROM employees
WHERE LOWER(last_name) = 'king';
 
SELECT * FROM employees
WHERE UPPER(last_name) = 'KING';
 
SELECT * FROM employees
WHERE INITCAP(last_name) = 'King';

-- #Character Manupulation Functions Part 1
SELECT first_name, SUBSTR(first_name,3,6), SUBSTR(first_name,3),
    last_name, LENGTH(last_name)
    FROM employees;
SELECT CONCAT(first_name,last_name)
    FROM employees;
SELECT CONCAT(CONCAT(first_name,last_name),employee_id)
    FROM employees;
SELECT first_name || last_name || employee_id
    FROM employees;
SELECT INSTR('I am learning how to use functions in Oracle', 'o', 17, 3) FROM dual; 
SELECT INSTR('I am learning how to use functions in Oracle', 'o', 1, 3) FROM dual;
SELECT INSTR('I am learning how to use functions in Oracle', 'o', -1, 3) FROM dual;
SELECT INSTR('I am learning how to use functions in Oracle', 'o', -1, 1) FROM dual;
SELECT INSTR('I am learning how to use functions in Oracle', 'in', -1, 1) FROM dual;
SELECT INSTR('I am learning how to use functions in Oracle', 'in', 1, 1) FROM dual;
SELECT first_name,INSTR(first_name,'a') from employees;
 
SELECT TRIM ('     My Name is Adam   ') trm from dual;
SELECT TRIM (' ' FROM '     My Name is Adam   ') trm from dual;
SELECT TRIM (BOTH ' ' FROM '     My Name is Adam   ') trm from dual;
SELECT TRIM (LEADING ' ' FROM '     My Name is Adam   ') trm from dual;
SELECT TRIM (TRAILING ' ' FROM '     My Name is Adam   ') trm from dual;
SELECT TRIM (TRAILING 'm' FROM '     my Name is Adam   ') trm from dual;
SELECT TRIM (TRAILING 'm' FROM 'my Name is Adam') trm from dual;
SELECT TRIM (TRAILING 'm' FROM 'my Name is Adammmmm') trm from dual;
SELECT TRIM (LEADING 'm' FROM 'my Name is Adam') trm from dual;
SELECT TRIM (BOTH 'm' FROM 'my Name is Adam') trm from dual;
SELECT TRIM ('m' FROM 'my Name is Adam') trm from dual;
SELECT TRIM ('m' FROM 'my Name is Ada') trm from dual;
SELECT TRIM (TRAILING 'm' FROM 'my Name is Ada') trm from dual;
SELECT TRIM (TRAILING 'my' FROM 'my Name is Ada') trm from dual;
 
SELECT RTRIM ('  my Name is Adam  ') trm from dual;
SELECT LTRIM ('  my Name is Adam  ') trm from dual;
SELECT LTRIM ('  my Name is Adam  ', 'my') trm from dual;
SELECT LTRIM ('my Name is Adam', 'my') trm from dual;
SELECT RTRIM ('my Name is Adam', 'my') trm from dual;
SELECT RTRIM ('my Name is Adammmm', 'my') trm from dual;
SELECT LTRIM ('www.mywebsite.com', 'w.') trm from dual;
SELECT LTRIM ('234234217www.mywebsite.com', '0123456789') trm from dual;
 
select first_name, replace(first_name,'a') rpl from employees;
select first_name, replace(first_name,'a','-') rpl from employees;
select first_name, replace(first_name,'le','-') rpl from employees;
select first_name, replace(first_name,'und','-') rpl from employees;
 
select first_name, LPAD(first_name,10,'*') pad from employees;
select first_name, RPAD(first_name,10,'*') pad from employees;
select first_name, RPAD(first_name,6,'*') pad from employees;
select first_name, LPAD(first_name,6,'*') pad from employees;
select first_name, LPAD('My name is ',20,'-') pad from employees;
select first_name, LPAD('My name is '||last_name ,20,'-') pad from employees;

-- #Character Manipulation Functions Part 2(INSTR Functions)
SELECT INSTR('I am learning how to use functions in Oracle', 'o', 17, 3) FROM dual; 
SELECT INSTR('I am learning how to use functions in Oracle', 'o', 1, 3) FROM dual;
SELECT INSTR('I am learning how to use functions in Oracle', 'o', -1, 3) FROM dual;
SELECT INSTR('I am learning how to use functions in Oracle', 'o', -1, 1) FROM dual;
SELECT INSTR('I am learning how to use functions in Oracle', 'in', -1, 1) FROM dual;
SELECT INSTR('I am learning how to use functions in Oracle', 'in', 1, 1) FROM dual;
SELECT first_name,INSTR(first_name,'a') from employees;

-- #Character Functions Part 3(TRIM, LTRIM, RTRIM Functions)
SELECT TRIM ('     My Name is Adam   ') trimmed_text from dual;
SELECT TRIM (' ' FROM '     My Name is Adam   ') trimmed_text from dual;
SELECT TRIM (BOTH ' ' FROM '     My Name is Adam   ') trimmed_text from dual;
SELECT TRIM (LEADING ' ' FROM '     My Name is Adam   ') trimmed_text from dual;
SELECT TRIM (TRAILING ' ' FROM '     My Name is Adam   ') trimmed_text from dual;
SELECT TRIM (TRAILING 'm' FROM '     my Name is Adam   ') trimmed_text from dual;
SELECT TRIM (TRAILING 'm' FROM 'my Name is Adam') trimmed_text from dual;
SELECT TRIM (TRAILING 'm' FROM 'my Name is Adammmmm') trimmed_text from dual;
SELECT TRIM (LEADING 'm' FROM 'my Name is Adam') trimmed_text from dual;
SELECT TRIM (BOTH 'm' FROM 'my Name is Adam') trimmed_text from dual;
SELECT TRIM ('m' FROM 'my Name is Adam') trimmed_text from dual;
SELECT TRIM ('m' FROM 'my Name is Ada') trimmed_text from dual;
SELECT TRIM (TRAILING 'm' FROM 'my Name is Ada') trimmed_text from dual;
SELECT TRIM (TRAILING 'my' FROM 'my Name is Ada') trimmed_text from dual;
 
SELECT RTRIM ('  my Name is Adam  ') r_trimmed_text from dual;
SELECT LTRIM ('  my Name is Adam  ') l_trimmed_text from dual;
SELECT LTRIM ('my Name is Adam', 'my') l_trimmed_text from dual;
SELECT RTRIM ('my Name is Adam', 'my') r_trimmed_text from dual;
SELECT RTRIM ('my Name is Adammmm', 'my') r_trimmed_text from dual;
SELECT LTRIM ('www.yourwebsite.com', 'w.') l_trimmed_text from dual;
SELECT RTRIM(LTRIM('www.yourwebsitename.com', 'w.'),'.com') trimmed_text from dual;
SELECT ltrim('1237982434www.yourwebsitename.com', '0123456789') trimmed_text from dual;

-- #Character Functions Part 4(REPLACE, LPAD, RPAD Functions)
SELECT first_name, REPLACE(first_name,'a') rpl FROM employees;
SELECT first_name, REPLACE(first_name,'a','-') rpl FROM employees;
SELECT first_name, REPLACE(first_name,'le','-') rpl FROM employees;
SELECT first_name, REPLACE(first_name,'und','-') rpl FROM employees;
SELECT first_name, lpad(first_name,10,'*') pad FROM employees;
SELECT first_name, rpad(first_name,10,'*') pad FROM employees;
SELECT first_name, rpad(first_name,6,'*') pad FROM employees;
SELECT first_name, lpad(first_name,6,'*') pad FROM employees;
SELECT first_name, lpad('My name is ',20,'-') pad FROM employees;
SELECT first_name, lpad('My name is '||last_name ,20,'-') pad FROM employees;

-- #Numeric Functions
SELECT round(12.536,2) FROM dual;
SELECT TRUNC(12.536,2) FROM dual;
SELECT ceil(12.536) FROM dual;
SELECT ceil(12.001) FROM dual;
SELECT ceil(12.999) FROM dual;
SELECT ceil(12) FROM dual;
SELECT floor(12.12) FROM dual;
SELECT floor(12.99) FROM dual;
SELECT MOD(8, 5) FROM dual;
SELECT MOD(8, 2) FROM dual;
SELECT MOD(1800, 70) FROM dual;

-- #Nested Functions
SELECT SUBSTR('John Smith', INSTR('John Smith', ' ')+1,LENGTH('John Smith')) output 
FROM dual;
 
SELECT SUBSTR('John Smith', INSTR('John Smith', ' ')+1) output 
FROM dual;
 
SELECT first_name|| ' ' || last_name full_name, 
SUBSTR(first_name|| ' ' || last_name, 
              INSTR(first_name|| ' ' || last_name, ' ')+1) output 
FROM employees;
 
SELECT first_name|| ' ' || last_name full_name, 
SUBSTR(concat(concat(first_name,' '),last_name), 
              INSTR(first_name|| ' ' || last_name, ' ')+1) output 
FROM employees;

-- #Date Functions & Arithmetic Operations on Dates
SELECT sysdate FROM dual;
SELECT sysdate, current_date, sessiontimezone, systimestamp, current_timestamp 
FROM dual;
SELECT sysdate FROM dual;
SELECT sysdate, sysdate + 4 FROM dual;
SELECT sysdate, sysdate - 4 FROM dual;
SELECT sysdate, sysdate + 1/24 FROM dual;
SELECT sysdate, sysdate + 1/(24*60) FROM dual;
SELECT employee_id, hire_date,sysdate FROM employees;
SELECT employee_id, hire_date,sysdate, sysdate-hire_date worked_in_days
FROM employees;
SELECT employee_id, hire_date,sysdate,trunc(sysdate-hire_date) worked_in_days 
FROM employees;
SELECT employee_id, hire_date,sysdate,trunc((sysdate-hire_date)/365) worked_in_years 
FROM employees
ORDER BY worked_in_years DESC;

-- #Date Manupulation Functions in SQL
SELECT sysdate, add_months(sysdate,2) FROM dual;
SELECT sysdate, add_months(sysdate,-2) FROM dual;
SELECT sysdate, add_months(sysdate,30) FROM dual;
SELECT sysdate, add_months('12-JUL-21',30) FROM dual;
SELECT employee_id, hire_date, 
    trunc(hire_date,'MONTH') truncated_result, round(hire_date,'MONTH') rounded_result
FROM employees;
SELECT employee_id, hire_date, 
    trunc(hire_date,'YEAR') truncated_result, round(hire_date,'YEAR') rounded_result
FROM employees;	
SELECT extract(year from sysdate) extracted_result FROM dual;
SELECT extract(month from sysdate) extracted_result FROM dual;
SELECT extract(day from sysdate) extracted_result FROM dual;
SELECT next_day(sysdate,'SUNDAY') next_day_result FROM dual;
SELECT last_day(sysdate) last_day_result FROM dual;
SELECT last_day('04-JUL-20') last_day_result FROM dual;

-- #Conversion Functions
--Implicit Conversion FROM a VARCHAR2 value TO a "NUMBER" value.
SELECT * FROM EMPLOYEES WHERE salary > '5000';
 
--Implicit Conversion FROM a VARCHAR2 value TO a "DATE" value. 
SELECT * FROM EMPLOYEES WHERE HIRE_DATE = '17-JUN-03';
 
--Implicit Conversion FROM a NUMBER value TO a VARCHAR2 value. 
SELECT DEPARTMENT_ID || DEPARTMENT_NAME FROM DEPARTMENTS;
 
--Implicit Conversion FROM a DATE value TO a VARCHAR2 value. 
SELECT FIRST_NAME || SYSDATE FROM EMPLOYEES;

-- #TO_CHAR, TO_DATE, TO_NUMBER Functions(Part 1)
SELECT first_name, hire_date FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'YYYY') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'YY') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'RR') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'YEAR') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'MM') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'MM-YYYY') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'MON-YYYY') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'MON-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'mon-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Mon-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'MONTH-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Month-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'DD-Month-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'DY-Month-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Dy-Month-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Day-Month-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Dy-Month-yyyy HH12') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Dy-Month-yyyy HH24') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Dy-Month-yyyy HH24:MI') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Dy-Month-yyyy HH24:MI:SS') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(sysdate,'Dy-Month-yyyy HH24:MI:SS') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'DDTH-Month-yyyy HH24:MI:SS') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'DDTH-MMTH-yyyy HH24:MI:SS') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'DDSP-MMTH-yyyy HH24:MI:SS') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'DDSPTH-MMTH-yyyy HH24:MI:SS') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'DDTHSP-MMTH-yyyy HH24:MI:SS') "Formatted Date" FROM employees;

-- #TO_CHAR, TO_DATE, TO_NUMBER Functions(Part 2)
SELECT salary*commission_pct*100 "Original", 
       TO_CHAR(salary*commission_pct*100, '$999,999.00') "Formatted Version"
FROM employees WHERE commission_pct IS NOT NULL;
 
SELECT salary*commission_pct*100 "Original", 
       TO_CHAR(salary*commission_pct*100, 'L999,999.00') "Formatted Version"
FROM employees WHERE commission_pct IS NOT NULL;
 
SELECT salary*commission_pct*100 "Original", 
       TO_CHAR(salary*commission_pct*100, '$099,999.00') "Formatted Version"
FROM employees WHERE commission_pct IS NOT NULL;
 
SELECT salary*commission_pct*100 "Original", 
       TO_CHAR(salary*commission_pct*100, '$009,999.00') "Formatted Version"
FROM employees WHERE commission_pct IS NOT NULL;
 
SELECT to_number('$5,322.33', '$99,999.00') formatted_number FROM dual;

-- #Null-Related(NVL, NVL2, NULLIF, COALESCE) Functions
SELECT employee_id, salary, commission_pct, salary + salary * commission_pct 
FROM employees;
 
SELECT employee_id, salary, commission_pct, salary + salary * nvl(commission_pct,0) nvl_new_sal 
FROM employees;
 
SELECT first_name, last_name, 
length(first_name) len1, length(first_name) len2, 
nullif(length(first_name),length(last_name)) result
FROM employees;
 
SELECT coalesce(null,null,null,1,2,3, null) FROM dual;
SELECT coalesce(null,null,null,null) FROM dual;
 
SELECT state_province, city, coalesce(state_province,city) FROM locations;

-- #Oracle Conditional Expressions:CASE Expressions
select first_name, last_name, job_id, salary,
        case job_id
            when 'ST_CLERK' then salary * 1.2
            when 'SA_REP' then salary * 1.3
            when 'IT_PROG' then salary * 1.4
            else salary
        end "updated salary"
    from employees;
    
select first_name, last_name, job_id, salary,
        case 
            when job_id = 'ST_CLERK' then salary * 1.2
            when job_id = 'SA_REP' then salary * 1.3
            when job_id = 'IT_PROG' then salary * 1.4
            when job_id = 'AD_PRES' then salary * 1.2
            when last_name = 'King' then 2 * salary
            else salary
        end "updated salary"
    from employees;
-- ���� �� ������ ����

select first_name, last_name, job_id, salary
    from employees
    where (case
            when job_id = 'IT_PROG' and salary > 5000 then 1
            when job_id = 'SA_MAN' and salary > 10000 then 1
            else 0
          end) = 1;

-- #Oracle Conditional Expressions:DECODE Function
select decode(1, 1, 'one', 2, 'two') result from dual;
select decode(2, 1, 'one', 2, 'two') result from dual;
select decode(3, 1, 'one', 2, 'two', 3, 'three') result from dual;
select decode(25, 1, 'one', 2, 'two', 3, 'three', 'Not found') result from dual;

select first_name, last_name, job_id, salary,
        decode(job_id, 'ST_CLERK', salary * 1.20,
                        'SA_REP', salary * 1.30,
                        'IT_PROG', salary * 1.50,
                         salary) as updated_salary
    from employees;

-- #AVG Function
select avg(salary), avg(all salary), avg(distinct salary)
    from employees
    where job_id = 'IT_PROG';

select avg(commission_pct), avg(nvl(commission_pct, 0)) from employees;

-- #COUNT Function
select count(*), count(commission_pct), count(distinct commission_pct),
        count(nvl(commission_pct, 0)), count(distinct nvl(commission_pct, 0))
    from employees;

-- #MAX Function
select max(salary), max(hire_date), max(first_name) from employees;
select * from employees order by first_name;

-- #MIN Function
select min(salary), min(commission_pct), min(nvl(commission_pct, 0)),
        min(hire_date), min(first_name)
    from employees;

-- #SUM Function
select sum(salary), sum(all salary), sum(distinct salary) from employees;    

-- #LISTAGG Function
select listagg(distinct salary, ' - ') within group (order by salary desc) Employees
    from employees
    where job_id = 'ST_CLERK';
    
select listagg(city, ', ') within group(order by city) as cities 
    from locations
    where country_id = 'UK';
-- within group�� ���Ÿ� order by�� �ʼ��� ����Ͽ��� �ϰ� �Ⱦ��Ÿ� within group���� �� ���� �ؾ���

select j.job_title,
        listagg(e.first_name, ', ') within group(order by e.first_name) employees_list
    from employees e, jobs j
    where e.job_id = j.job_id
    group by j.job_title;

-- #Overview Of Group Functions
select sum(salary), avg(salary), max(hire_date), min(commission_pct),
        count(distinct manager_id), listagg(job_id, ', ')
    from employees;

-- #GROUP BY Clause(Part 1)
select avg(salary) from employees
    where job_id = 'IT_PROG' or job_id = 'SA_REP';
    
select job_id, avg(salary) from employees
    group by job_id
    order by avg(salary) desc;

select job_id, department_id, manager_id, avg(salary), count(*) from employees
    group by job_id, department_id, manager_id
    order by count(*) desc;

-- #GROUP BY Clause(Part 2)
select job_id, department_id, avg(salary) from employees
    group by job_id, department_id;
select job_id, avg(salary), sum(salary), max(hire_date), count(*) from employees
    where job_id in ('IT_PROG', 'ST_MAN', 'AC_ACCOUNT')
    group by job_id;

-- #Having Clause
select job_id, avg(salary) from employees
    where manager_id = 101
    group by job_id
    having avg(salary) > 10000;
-- having ��ġ�� group by ���ķ� ���� �������

select job_id, avg(salary) from employees
--    where manager_id = 101
    group by job_id
    having avg(salary) > 5000;

-- #Nested Group Functions
select max(avg(salary)), min(avg(salary)) from employees
    group by department_id;

-- #Natural Join    
select * from employees;
select * from departments;

desc employees;
desc departments;

select * from employees natural join departments;
select * from departments natural join employees;
-- natural join�� on�� �Ἥ �����ų �ʿ䰡 ����

-- #Join with the Using Clause
select * from employees join departments using (department_id, manager_id);
-- join �ϰ���� ���� ������ �ִٸ� using ���

-- #Handling Ambiguous Column Names
select e.first_name, last_name, department_name, d.manager_id
    from employees e join departments d
    using (department_id);
    
select employees.first_name, last_name, department_name, departments.manager_id
    from employees join departments
    using (department_id);
-- alias�� �������� �ʰ� ���̺�����ε� ����
-- alias�� �����ϰ�� ���̺������ �Ұ���

select e.first_name, last_name, department_name, manager_id
    from employees e join departments d
    using (manager_id);
-- using ���� ����� column�� alias�� ����� �� ����

-- #Inner Join & Join with the ON Clause
select e.first_name, e.last_name, d.manager_id, d.department_name
    from employees e inner join departments d
    on (e.department_id = d.department_id and e.manager_id = d.manager_id);

select e.first_name, e.last_name, manager_id, d.department_name
    from employees e inner join departments d
    using (department_id, manager_id);
-- using ���� ����� column�� alias�� ����� �� ����
-- on�� ���� ���� using�� ���� �� ���� ȿ���� ������ �������� on�� column�� alias�� �� �� �ְ� using�� ��Ȯ�� column�� �� �� ����

select e.first_name, e.last_name, d.manager_id, d.department_name
    from employees e inner join departments d
    on (e.department_id = d.department_id and e.employee_id = d.manager_id);
-- on�� ���ϴ� column�� ���� ���� �ʾƵ� ��

-- #Multiple Join Operations
select * from employees;
select * from departments;
select * from locations;
select * from countries;

select first_name, last_name, d.department_name, city, postal_code, 
        street_address, country_id
    from employees e join departments d
    on (e.department_id = d.department_id)
    join locations l
    -- on (l.location_id = d.location_id);
    using (location_id)
    join countries
    using (country_id);
-- join�� ���� join ������ �߿�
-- country ���̺��� location ���̺��� ���� join �Ǿ��⿡ join ����(location ���� ������ ���� ����)

-- #Restricting Joins
select first_name, last_name, d.department_name, city, postal_code, 
        street_address
    from employees e join departments d
    on (e.department_id = d.department_id)
    join locations l
    on (l.location_id = d.location_id)
    -- where e.job_id = 'IT_PROG';
    and e.job_id = 'IT_PROG'
    and e.first_name = 'David';
-- where�� �������� ������ �� �� ������ on ~ and�� ���� ���� ���� ����

-- #Self Join
select worker.first_name, worker.last_name, worker.employee_id, worker.manager_id,
        manager.employee_id, manager.first_name, manager.last_name,
        worker.salary, manager.salary
    from employees worker join employees manager
    on (worker.manager_id = manager.employee_id);

-- Non-Equijoins
select * from employees;
select * from jobs;

select e.employee_id, e.first_name, e.last_name, e.job_id, e.salary,
        j.min_salary, j.max_salary, j.job_id
    from employees e join jobs j
    on e.salary > j.max_salary
    and j.job_id = 'SA_REP';
    
select e1.employee_id, e1.first_name, e1.last_name
    from employees e1 join employees e2
    on e1.employee_id <> e2.employee_id
    -- and e1.first_name = e2.first_name;
    and e1.last_name = e2.last_name;
    
--Step 1: Creates the payouts table to store monthly payment of each employee.
CREATE TABLE hr.payouts
(employee_id   NUMBER NOT NULL, --Employeee ID
 payment_date  DATE,            --Payment date
 payment_type  VARCHAR2(10),    --Payments can be two types, "Salary" and "Bonus"
 payout_amount NUMBER);         --The amount of the payment.
/

--Step 2: Fills out related data into the payouts table.
DECLARE
  v_date      DATE := to_date('01/01/2020','DD/MM/YYYY');
  TYPE        t_employees IS TABLE OF employees%rowtype;
  r_employees t_employees; 
BEGIN
  SELECT * BULK COLLECT INTO r_employees FROM employees;
    
  WHILE v_date < to_date('01/01/2025','DD/MM/YYYY') LOOP

    FOR t in 1..r_employees.count() LOOP
      INSERT INTO payouts values (r_employees(t).employee_id, v_date,'Salary',r_employees(t).salary);
    END LOOP;
    
    v_date := add_months(v_date,1);
    IF EXTRACT(month from v_date) = 1 then
      FOR i in 1..r_employees.count LOOP
        r_employees(i).salary := r_employees(i).salary*1.1; -- 10% salary raise by every year.
      END LOOP;
    END IF;  

  END LOOP;
  commit;
END;
/
--Step 3: Queries the table.
SELECT * FROM payouts
    where employee_id = 100
    order by payment_date;
/
--Step 4: Computes a running total of a particular column using the Non-Equijoins
SELECT p1.payment_date, p1.payout_amount, SUM(p2.payout_amount) AS total_payout
FROM payouts p1 JOIN payouts p2
ON p1.payment_date >= p2.payment_date
AND p1.employee_id = p2.employee_id
WHERE p1.employee_id = 100
GROUP BY p1.payout_amount, p1.payment_date
ORDER BY p1.payment_date;

DROP TABLE payouts;

-- OUTER JOINS
select first_name, last_name, department_name
    from employees join departments
    using (department_id);
    
select d.department_id, d.department_name, e.first_name, e.last_name
    from departments d join employees e
    on (d.manager_id = e.employee_id);

-- LEFT OUTER JOIN(LEFT JOIN) & RIGHT OUTER JOIN(RIGHT JOIN)    
-- select e.first_name, e.last_name, d.department_id, d.department_name
select d.department_id, d.department_name, e.first_name, e.last_name 
    -- from employees e left join departments d
    from departments d left join employees e 
    -- using (department_id);
    on (e.department_id = d.department_id);
-- left join�� ���� ���̺��� ��� ���� ��ȯ�ϰ� �������� �ش��ϴ� �͸� ��ȯ

select first_name, last_name, department_name, e.department_id, d.department_id
    from employees e right outer join departments d
    on (e.department_id = d.department_id);
    
select first_name, last_name, department_name, e.department_id, d.department_id
    from employees e left outer join departments d
    on (e.department_id = d.department_id);
    
select first_name, last_name, department_name, e.department_id, d.department_id
    from departments d left outer join employees e 
    on (e.department_id = d.department_id);
    

select first_name, last_name, department_name, e.department_id, d.department_id,
        location_id
    from employees e right outer join departments d
    on (e.department_id = d.department_id)
    left outer join locations l
    using (location_id);

-- #FULL OUTER JOIN(FULL JOIN)    
select first_name, last_name, department_name, e.department_id, d.department_id
    from employees e full join departments d
    on (e.department_id = d.department_id);
-- full = left + right

-- Cross Join(Cartesian Product/Cross Product)
select first_name, last_name, department_name
    from employees cross join departments;
-- cross join�� ���� ���̺��� �� ���� join�� ���̺��� ��� ���� �������Ƿ� ������ �� �� ���� rows * rows
-- on, using���� ������ �������� �ʾƵ� ��

select first_name, last_name, department_name, job_title
    from employees cross join departments
    cross join jobs;
    
select * from employees, departments;
-- ����ϸ� �ȵ� ����̱� �ѵ� from �ڿ� ���̺��� �ѹ��� ������ cross join�� ���� ȿ��

select first_name, last_name, department_name, job_title
    from employees cross join departments
    cross join jobs
    where job_title = 'Finance Manager';
    
select d.department_name, j.job_title, count(*) as employee_count
    from employees e join departments d on (e.department_id = d.department_id)
    join jobs j on (j.job_id = e.job_id)
    group by d.department_name, j.job_title
    order by d.department_name, j.job_title;

select c.department_name, c.job_title, count(*) as employee_count
    from
        (select d.department_name, j.job_title, j.job_id, d.department_id
            from departments d cross join jobs j) c
    left outer join employees e
    on (e.job_id = c.job_id and e.department_id = c.department_id)
    group by c.department_name, c.job_title
    order by c.department_name, c.job_title;
    
select c.department_name, c.job_title, count(e.employee_id) as employee_count
    from
        (select d.department_name, j.job_title, j.job_id, d.department_id
            from departments d cross join jobs j) c
    left outer join employees e
    on (e.job_id = c.job_id and e.department_id = c.department_id)
    group by c.department_name, c.job_title
    order by c.department_name, c.job_title;

-- #Oracle's Old Style Join Syntax(ANSI vs Non-ANSI Joins)
-- Non-ANSI Standard Syntax(���� ���(���� ������ ����))
select e.first_name, e.last_name, d.department_name, l.city, l.street_address
    from employees e, departments d, locations l
    where e.department_id = d.department_id
    and d.location_id = l.location_id
    and d.department_name = 'Finance';
    
select e.first_name, e.last_name, d.department_name
    from employees e, departments d
    -- where e.department_id = d.department_id(+);
    where e.department_id(+) = d.department_id;
-- (+)�� �ۼ������ν� ���� ���̺��� ��� ���� �������� ������ ���̺��� �ɼ� ���̺��� ��
-- ���� ���̺� (+) -> right join, ������ ���̺� (+) -> left join

select e.first_name, e.last_name, d.department_name
    from employees e, departments d
    where e.department_id(+) = d.department_id
union
select e.first_name, e.last_name, d.department_name
    from employees e, departments d
    where e.department_id = d.department_id(+);
-- union�� ���ؼ� left, right�� �����ϸ� full

select first_name, last_name, department_name, e.department_id, d.department_id,
        l.location_id
    from employees e, departments d, locations l
    where e.department_id(+) = d.department_id
    and d.location_id(+) = l.location_id;
-- join�� 2�� �� ���
-- ���� ������ right join�� �ι� �� ���
-- ������ ������ �����ϴ� ���� �ִ� ���̺��� ����

select first_name, last_name, department_name, j.job_title, ed.job_id, j.job_id
    from (
            select first_name, last_name, job_id, department_name
                from employees e, departments d
                where e.department_id(+) = d.department_id
        ) ed, jobs j
    where ed.job_id(+) = j.job_id;
    
select d.department_name, e.first_name, e.department_id, d.department_id, e.salary
    from departments d left join employees e
    on d.department_id = e.department_id
    and e.salary >= 5000
    -- where d.department_id >= 40
    where e.department_id >= 40
    -- and e.salary >= 5000
    order by d.department_name, e.first_name;
-- ������ ��� ��ġ�ϴ��� ���� �����ϴ����� ���� ����Ǵ� �������� ���� �޶���

-- #Using Subqueries
select salary from employees
    where employee_id = 145;
select * from employees
    where salary > 14000;
select * from employees
    where salary > (select salary from employees
                        where employee_id = 145);

-- #Single Row Subqueries
select department_id from employees
where employee_id = 145;
    
select * from employees
where department_id = (select department_id from employees
                        where employee_id = 145)
and salary <= (select salary from employees
                where employee_id = 145);

select min(hire_date) from employees;

select * from employees
where hire_date = (select max(hire_date) from employees
                    group by department_id);
                    
select department_id from employees
where employee_id = 178;

select * from employees
where department_id = (select department_id from employees
                        where employee_id = 178);
                        
-- #Multiple Row Subqueries                        
select first_name, last_name, department_id, salary
from employees
where salary in (select min(salary)
                 from employees
                 group by department_id);

select first_name, last_name, department_id, salary
from employees
where salary in (select salary
                 from employees
                 where job_id = 'SA_MAN');

select first_name, last_name, department_id, salary
from employees
where salary > any (select salary
                 from employees
                 where job_id = 'SA_MAN');
-- any�� �ּڰ�, �ִ� �� �ϳ��� ũ�ų� ���� ��

select first_name, last_name, department_id, salary
from employees
where salary > all (select salary
                 from employees
                 where job_id = 'SA_MAN');
-- all�� ��� ������ ũ�ų� ���� ��    
                        
select first_name, last_name, department_id, salary
from employees
where department_id in (select department_id
                        from departments
                        where location_id in (select location_id
                                              from locations
                                              where country_id in (select country_id
                                                                   from countries
                                                                   where country_name = 'United Kingdom')));

-- #Multiple Column Subqueries                                                                   
select employee_id, first_name, last_name, department_id, salary
from employees
where department_id in (select department_id from employees
                        where employee_id in (103, 105, 110)
and salary in (select salary from employees
               where employee_id in (103, 105, 110)));

select employee_id, first_name, last_name, department_id, salary
from employees
where (department_id, salary) in (select department_id, salary from employees
                        where employee_id in (103, 105, 110));
-- ���� ������ ����ϴ� ���� �ٸ� ������ �Ʒ�(�ֹ��� ��)�� ��� �� ���� ���ÿ� ��ġ�ϴ� ������ ã�� ����
-- ���� department_id�� salary�� ���������� ������ ���� ������ ���̰� �߻�

select employee_id, first_name, last_name, department_id, salary
from employees
where (department_id, salary) in (select department_id, max(salary) from employees
                                  group by department_id);
-- ���������� �ؾ߸� ���� ���� �ƴ�
-- ���������� ���� ��� �������� �κ��� ���� �� �ֱ⿡ �ֹ����� ���� ���������� ������ ���� �Ǵ�

select employee_id, first_name, last_name, job_id, salary
from employees
where (job_id, salary) in (select job_id, max_salary from jobs);

-- #Using Subqueries as a Table
select *
from (select department_id, department_name, state_province, city
      from departments join locations
      using (location_id)
      order by department_id);

select manager_id
from (select *
      from departments join locations
      using (location_id)
      order by department_id);

select *
from (select *
      from departments join locations
      using (location_id)
      order by department_id);

select e.employee_id, e.first_name, e.last_name, b.department_name, b.city, b.state_province
from employees e join (select department_id, department_name, state_province, city
                       from departments join locations
                       using (location_id)
                       order by department_id) b
using (department_id);

-- #SCALAR Subqueries
select (select sysdate from dual) from dual;

select avg(salary) from employees;

select first_name, last_name, job_id
from employees
where salary > (select avg(salary) from employees);

select department_id from employees
where first_name = 'Luis';

select * from employees
where department_id = (select department_id from employees
                       where first_name = 'Luis');

select * from employees
where department_id = (select department_id from employees
                       where first_name = 'Luisee');
-- ���������� ���� Null�̸� ��ü ������ Null�� ��ȯ

select * from employees
where department_id = (select department_id from employees
                       where first_name = 'David');
-- ���������� ���� �ϳ��� �ƴϸ� ��ü ������ �۵����� ����

select employee_id, first_name, last_name,
        (case
            when  location_id = (select location_id from locations where postal_code = '99236') then 'San Francisco'
            else 'Other'
        end) ciry
from employees natural join departments;
          
select * from employees
where (department_id, manager_id) = (select department_id, manager_id from employees
                                     where first_name = 'Luis');

-- #Correlated Subqueries                                    
select employee_id, first_name, last_name, department_id, salary
from employees a
where salary = (select max(salary)
                from employees b
                where b.department_id = a.department_id);
-- ���������� ���೪�� a�� department_id�� ã�� ���ϱ⿡ ������ �߻�        
                       
select employee_id, first_name, last_name, department_id, salary
from employees a
where (salary, department_id) in (select max(salary)
                from employees b
                group by department_id);                    

select employee_id, first_name, last_name, department_id, salary
from employees a
where salary < (select avg(salary)
                from employees b
                where b.department_id = a.department_id);                    
                       
select employee_id, first_name, last_name, a.department_id, salary
from employees a join (select avg(salary) avg_sal, department_id
                       from employees
                       group by department_id) b
on (a.department_id = b.department_id)
where a.salary < b.avg_sal;

select employee_id, first_name, last_name, department_name, salary,
       (select round(avg(salary))
        from employees 
        where department_id = d.department_id) "DEPARTMENT'S AVERAGE SALARY"
from employees e join departments d
on (e.department_id = d.department_id)
order by e.employee_id;

-- # EXISTS Operator & Semijoins
select employee_id, first_name, last_name, department_id
from employees a
where exists
            (select null from employees where manager_id = a.employee_id);

-- #NOT EXISTS Operator            
select *
from departments d
where not exists
                (select null
                 from employees e
                 where e.department_id = d.department_id);
                       
select *
from departments d
where department_id not in
                          (select department_id from employees);
-- �߸��� ����

CREATE TABLE retired_employees AS 
SELECT * FROM employees WHERE job_id = 'IT_PROG' AND ROWNUM <5; --Creates the table, and adds 4 IT Programmers into the retired_employees table.

--Adds a new record.
INSERT INTO retired_employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES (1,'Larry', 'McCain', 'LMCCAIN', '951.742.6792', '96/03/24','AD_PRES', 30000, '0.5', NULL, 90);
--Adds another record.
INSERT INTO retired_employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES (2, 'Mary', 'Walker', 'MWALKER', '314.680.1441', '99/09/13', 'SA_REP', 9000, '0.2', 1, 80);
COMMIT;

-- #UNION and UNION ALL Operators
select * from retired_employees
union
select * from employees;
-- �ߺ�X

select * from retired_employees
union
select * from employees
where job_id = 'IT_PROG';

select first_name, last_name, email, hire_date, salary from retired_employees
union
select first_name, last_name, email, hire_date, salary from employees;
-- Ư�� ���� �߰��� ���� �����ϴ� ���̺��� ���� ���� ������Ÿ������ ���־�� ��
-- �� ���� ���� �ʿ�� ������ ���ڸ� ����, ���ڸ� ���ڷ�
-- ������ ����ε� �����͸� ���� �����̸� ���� ���� ��ġ�����ִ°� ����

select first_name, last_name, email, hire_date, salary, job_id from retired_employees
union all
select first_name, last_name, email, hire_date, salary, job_id from employees;
-- �ߺ�O

-- #INTERSECT Operator
select first_name, last_name, email, hire_date, salary from retired_employees
intersect
select first_name, last_name, email, hire_date, salary from employees;
-- ����� �͸�

-- # MINUS Operator
select first_name, last_name, email, hire_date, salary from retired_employees
minus
select first_name, last_name, email, hire_date, salary from employees;
-- ù�������� ��°������ ����

-- #Matching Unmatched Queries in SET Operations
select job_id, department_id, first_name, last_name from employees
union all
select job_id, department_id, null, null from job_history;

select job_id, null department_id, first_name, last_name from employees
union all
select job_id, department_id, null, null from job_history;
-- ���� ���� �ȵ� null�� ����

select job_id, 0 department_id, first_name, last_name from employees
union all
select job_id, department_id, null, null from job_history;

-- #Using the ORDER BY Clause with SET Operators
select first_name, last_name, salary, department_id from employees
union all
select first_name, last_name, salary, department_id from employees where department_id = 30
union
select first_name, last_name, salary, department_id from retired_employees
order by salary desc;

select first_name, last_name, salary s, department_id from employees
union all
select first_name, last_name, salary s, department_id from employees where department_id = 30
union
select first_name, last_name, salary, department_id from retired_employees
order by s desc;
-- ���� alias�� ������ �������� ������ ����
-- ���� alias�� �����ϰ� �ʹٸ� �ּ� ù ������ �ι�° ���� ���ÿ� ����ϰ� order by���� ����ÿ��� ����

select first_name, last_name, salary s, department_id from employees
union all
select null, last_name, salary s, department_id from employees where department_id = 30
union
select first_name, last_name, salary, department_id from retired_employees;

-- #Combining Multiple Queries Using the SET Operators
--Example 1:
SELECT first_name, last_name, salary, department_id FROM employees
UNION ALL
SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
UNION
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary;

--Example 2:
SELECT first_name, last_name, salary, department_id FROM employees
UNION ALL
SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
MINUS
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary;

--Example 3:
SELECT first_name, last_name, salary, department_id FROM employees
MINUS 
SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
INTERSECT
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary;

--Example 4: Using parentheses will change the execution order of the queries in Compound Queries.
SELECT first_name, last_name, salary, department_id FROM employees
MINUS
(SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
INTERSECT
SELECT first_name, last_name, salary, department_id FROM retired_employees)
ORDER BY salary;

--Example 5: This query will not run. order by�� ���� ������ ����ϰ� ��ȣ�ȿ� ���� �� ���� ����
SELECT first_name, last_name, salary, department_id FROM employees
MINUS
(SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
INTERSECT
SELECT first_name, last_name, salary, department_id FROM retired_employees
ORDER BY salary);

--Example 6: This query will also not run. order by�� ���� ������ ����ϰ� ��ȣ�ȿ� ���� �� ���� ����
(SELECT first_name, last_name, salary, department_id FROM employees
MINUS
SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 30
INTERSECT
SELECT first_name, last_name, salary, department_id FROM retired_employees)
ORDER BY salary);

-- #CREATE TABLE Statement                       
create table my_employees(
    employee_id number(3) not null,
    first_name varchar2(50) default 'No Name',
    last_name varchar2(50),
    hire_date date default sysdate not null
);                     

select * from my_employees;

info my_employees;
                       
create table my_employees(
    employee_id number(3) not null,
    first_name varchar2(50) default 'No Name',
    last_name varchar2(50),
    hire_date date default sysdate not null,
    email varchar2(20)
);                       

-- #CREATE TABLE AS SELECT(CTAS) Statement in Oracle                   
create table employees_copy2 as select * from employees;
select * from employees;
select * from employees_copy;
select * from employees_copy2;

create table employees_copy3 
    as select * from employees where 1=2; 
select * from employees_copy3;

create table employees_copy4 
    as select * from employees where job_id = 'IT_PROG'; 
select * from employees_copy4;

create table employees_copy5 
    as select first_name, last_name, salary from employees; 
select * from employees_copy5;

create table employees_copy6 
    as select first_name, last_name l_name, salary from employees; 
select * from employees_copy6;                   
                   
create table employees_copy7(name, surname, annual_salary)
    as select first_name, last_name l_name, salary * 12 from employees;
select * from employees_copy7;
desc employees_copy7;

-- #ALTER TABLE Statement
create table my_employees(
    employee_id number(3) not null,
    first_name varchar2(50) default 'No Name',
    hire_date date default sysdate not null,
    phone varachar2(20)
);         

desc employees_copy;
info employees_copy;
alter table employees_copy add ssn varchar2(11);
select * from employees_copy;
alter table employees_copy add (fax_number varchar2(11),
                                birth_date date,
                                password varchar2(10) default 'abc1234@');
alter table employees_copy modify password varchar2(50);
alter table employees_copy modify (fax_number varchar2(11) default '-',
                                   password varchar2(10));                                   
alter table employees_copy modify (fax_number varchar2(11) default null,
                                   password varchar2(10) not null);                               
alter table employees_copy modify (fax_number varchar2(11) default null,
                                   password varchar2(10) default '0000');
-- ������ �ִ� abc1234@�� �ٲ��� ������ ���Ӱ� ���ԵǴ� �����Ϳ��� 0000�� ����                                   
                                    
alter table employees_copy drop column ssn;                   
alter table employees_copy drop (fax_number, password);
alter table employees_copy drop (birth_date);
-- column�� �� ������ �ʾƵ� ��

-- #Marking Columns Unused(Using The SET UNUSED Clause)
select * from employees_copy;
desc employees_copy;
info employees_copy;
alter table employees_copy set unused (first_name, phone_number, salary);
select * from user_unused_col_tabs;
alter table employees_copy set unused column last_name online;
-- column�� �� ������ �ʾƵ� ��
alter table employees_copy drop unused columns;

-- #READ-ONLY TABLES in SQL
create table emp_temp as select * from employees;
select * from emp_temp;
alter table emp_temp read only;
delete emp_temp;
alter table emp_temp add gender varchar2(1);
alter table emp_temp drop (gender);
drop table emp_temp;
alter table emp_temp read write;

-- #DROP TABLE Statement
select * from employees_copy4;
drop table employees_copy4;
-- ���� ���̺��� �ѹ��� ���� �� ����
flashback table employees_copy4 to before drop;
drop table employees_copy4 purge;
-- purge�� ���� flashback �Ұ�

-- #TRUNCATE TABLE Statement
select * from employees_copy;
delete from employees_copy;
truncate table employees_copy;
drop table employees_copy;

create table employees_performance_test as
    select e1.first_name, e1.last_name, e1.department_id, e1.salary
    from employees e1 cross join employees e2 cross join employees e3;
select count(*) from employees_performance_test;
delete from employees_performance_test;
truncate table employees_performance_test;
-- truncate�� delete���� �ξ� ����
-- truncate�� ����� ���ÿ� commit ����(rollback �ȵ�)
drop table employees_performance_test;

-- #COMMENT Statement
create table employees_copy as select * from employees;
comment on column employees_copy.job_id is 'Stores job title abbreviations';
comment on table employees_copy is 'This is a copy of employees table';
comment on column employees_copy.hire_date is 'This is a sample comment';
comment on column employees_copy.hire_date is ''; -- �ּ��� drop�ϴ� ���
select * from user_tab_comments where table_name = 'EMPLOYEES_COPY'; -- ���̺�� �빮�ڷ� �ۼ�
select * from user_col_comments where table_name = 'EMPLOYEES_COPY';
info employees_copy;

-- #RENAME Statement
desc employees_copy;
alter table employees_copy rename column hire_date to start_date;
alter table employees_copy rename column start_date to hire_date;
rename employees_copy to employees_backup;
select * from employees_copy;
select * from employees_backup;
rename employees_backup to employees_copy;

-- #INSERT Statement(Part 1)                       
create table jobs_copy as select * from jobs;
select * from jobs_copy;
desc jobs_copy;
insert into jobs_copy (job_id, job_title, min_salary, max_salary)
values ('GR_LDR', 'Group Leader', 8500, 20000);
insert into jobs_copy (job_id, job_title, min_salary, max_salary)
values ('PR_MGR', 'Project Manager', 7000, 10000);
insert into jobs_copy (job_title, min_salary, job_id, max_salary)
values ('Architect', 6500, 'ARCH', 18000);
insert into jobs_copy 
values ('DATA_ENG', 'Data Engineer', 6000, 21000);
-- ���� �������ִ°� �� ������
insert into jobs_copy (job_id, job_title, min_salary)
values ('DATA_ARCH', 'Data Architecture', 8000);
alter table jobs_copy modify max_salary default 10000;
insert into jobs_copy (job_id, job_title, min_salary)
values ('DATA_ARCH2', 'Data Architecture2', 8000);

-- #INSERT Statement(Part 2)
info jobs_copy;
insert into jobs_copy (job_id, min_salary)
values ('DATA_ARCH2', 8000);

select * from jobs_copy;
insert into jobs_copy
values ('DATA_ARCH3', 'Data Architecture3', 8000, null);
insert into jobs_copy
values ('DATA_ARCH4', upper('Data Architecture4'), 8000, null);

select * from employees_copy;
insert into employees_copy select * from employees;
insert into employees_copy select * from employees where job_id = 'IT_PROG';
insert into employees_copy (first_name, last_name, email, hire_date, job_id)
    select first_name, last_name, email, hire_date, job_id 
    from employees where job_id = 'IT_PROG';

select * from employee_addresses;
insert into employee_addresses
    select employee_id, first_name, last_name, city || ' - ' || street_address address
    from employees
    join departments using (department_id)
    join locations using (location_id);
create table employee_addresses as
    select employee_id, first_name, last_name, city || ' - ' || street_address address
    from employees
    join departments using (department_id)
    join locations using (location_id)
    where 1=2; -- column�� ����� ���� false�� ����

-- #Unconditional Insert Statements    
create table employees_history as
    select employee_id, first_name, last_name, hire_date
    from employees where 1=2;
create table salary_history as
    select employee_id, 1234 as year, 12 as month, salary, commission_pct
    from employees where 1=2;
insert all
    into employees_history values (employee_id, first_name, last_name, hire_date)
    into salary_history values (employee_id, extract(year from sysdate),
                                extract(month from sysdate), salary, commission_pct)
select * from employees where hire_date > '08/03/15';

select * from employees_history;
select * from salary_history;

insert all
    into employees_history values (105, 'Adam', 'Smith', sysdate)
    into employees_history values (106, 'Paul', 'Smith', sysdate + 1)
select * from dual;

-- #Conditional INSERT ALL Statements
create table it_programmers as
    select employee_id, first_name, last_name, hire_date from employees where 1=2;
create table working_in_the_us as
    select employee_id, first_name, last_name, job_id, department_id from employees where 1=2;
insert all
    when hire_date > to_date('08/03/15') then
        into employees_history values (employee_id, first_name, last_name, hire_date)
        into salary_history values (employee_id, extract(year from sysdate),
                                    extract(month from sysdate), salary, commission_pct)
    when job_id = 'IT_PROG' then
        into it_programmers values (employee_id, first_name, last_name, hire_date)
    when department_id in
        (select department_id from departments where location_id in
            (select location_id from locations where country_id = 'US')) then
        into working_in_the_us values (employee_id, first_name, last_name, job_id, department_id)
select * from employees;

select * from it_programmers;
select * from working_in_the_us;
select * from employees_history;

insert all
    when hire_date > to_date('08/03/15') then
        into salary_history values (employee_id, extract(year from sysdate),
                                    extract(month from sysdate), salary, commission_pct)
    when job_id = 'IT_PROG' then
        into it_programmers values (employee_id, first_name, last_name, hire_date)
    when department_id in
        (select department_id from departments where location_id in
            (select location_id from locations where country_id = 'US')) then
        into working_in_the_us values (employee_id, first_name, last_name, job_id, department_id)
    else
        into employees_history values (employee_id, first_name, last_name, hire_date)
select * from employees;
insert all
    when hire_date > to_date('08/03/15') then
        into salary_history values (employee_id, extract(year from sysdate),
                                    extract(month from sysdate), salary, commission_pct)
    when 1=1 then -- ��� ��쿡 �� �����ϵ��� ������ ����
        into it_programmers values (employee_id, first_name, last_name, hire_date)
    when department_id in
        (select department_id from departments where location_id in
            (select location_id from locations where country_id = 'US')) then
        into working_in_the_us values (employee_id, first_name, last_name, job_id, department_id)
    else
        into employees_history values (employee_id, first_name, last_name, hire_date)
select * from employees;

-- #Conditional INSERT FIRST Statements
create table low_salaries as
    select employee_id, department_id, salary from employees where 1=2;
create table average_salaries as
    select employee_id, department_id, salary from employees where 1=2;
create table high_salaries as
    select employee_id, department_id, salary from employees where 1=2;
    
select * from low_salaries;
select * from average_salaries;
select * from high_salaries;

insert first
    when salary < 5000 then
        into low_salaries values (employee_id, department_id, salary)
    when salary between 5000 and 10000 then
        into average_salaries values (employee_id, department_id, salary)
    else
        into high_salaries values (employee_id, department_id, salary)
select * from employees;

-- #Pivoting Insert
create table emp_sales (employee_id number(6),
                        week_id number(2),
                        sales_mon number,
                        sales_tue number,
                        sales_wed number,
                        sales_thu number,
                        sales_fri number);
                        
create table emp_sales_normalized (employee_id number(6),
                                   week_id number(2),                        
                                   sales number,
                                   day varchar2(3));
                                   
insert all
    into emp_sales values (105, 23, 2500, 3200, 4700, 5600, 2900)
    into emp_sales values (106, 24, 2740, 3060, 4920, 5650, 2800)
select * from dual;

select * from emp_sales;
select * from emp_sales_normalized;

insert all
    into emp_sales_normalized values (employee_id, week_id, sales_mon, 'MON')
    into emp_sales_normalized values (employee_id, week_id, sales_tue, 'TUE')
    into emp_sales_normalized values (employee_id, week_id, sales_wed, 'WED')
    into emp_sales_normalized values (employee_id, week_id, sales_thu, 'THU')
    into emp_sales_normalized values (employee_id, week_id, sales_fri, 'FRI')
select * from emp_sales;

-- #UPDATE Statement
drop table employees_copy;
create table employees_copy as select * from employees;

select * from employees_copy;

update employees_copy
set salary = 500;

select * from employees_copy
where job_id = 'IT_PROG';

update employees_copy
set salary = 50000
where job_id = 'IT_PROG';

update employees_copy
set salary = 9999,
    department_id = null
where job_id = 'IT_PROG';

update employees_copy
set (salary, commission_pct) = (select max(salary), max(commission_pct) from employees)
where job_id = 'IT_PROG';

update employees_copy
set salary = 100000
where hire_date = (select max(hire_date) from employees);

-- #DELETE Statement
select * from employees_copy;

delete from employees_copy;

delete from employees_copy
where job_id = 'IT_PROG';

delete from employees_copy
where department_id in (select department_id
                        from departments
                        where upper(department_name) like '%SALES%');

-- #MERGE Statement
select * from employees_copy;
delete from employees_copy;
insert into employees_copy
    select * from employees where job_id = 'SA_REP';
update employees_copy set first_name = 'Alex';

merge into employees_copy c
using (select * from employees) e
on (c.employee_id = e.employee_id)
when matched then
    update set 
        c.first_name = e.first_name,
        c.last_name = e.last_name,
        c.salary = e.salary
    delete where department_id is null -- delete�� ���û���
when not matched then
    insert values (e.employee_id, e.first_name, e.last_name, e.email, e.phone_number,
                   e.hire_Date, e.job_id, e.salary, e.commission_pct, e.manager_id, e.department_id);

merge into employees_copy c
using employees e
on (c.employee_id = e.employee_id)
when matched then
    update set 
        c.first_name = e.first_name,
        c.last_name = e.last_name,
        c.salary = e.salary
    delete where department_id is null -- delete�� ���û���
when not matched then
    insert values (e.employee_id, e.first_name, e.last_name, e.email, e.phone_number,
                   e.hire_Date, e.job_id, e.salary, e.commission_pct, e.manager_id, e.department_id);

merge into employees_copy c
using (select * from employees where job_id = 'IT_PROG') e
on (c.employee_id = e.employee_id)
when matched then
    update set 
        c.first_name = e.first_name,
        c.last_name = e.last_name,
        c.salary = e.salary
    delete where department_id is null -- delete�� ���û���
when not matched then
    insert values (e.employee_id, e.first_name, e.last_name, e.email, e.phone_number,
                   e.hire_Date, e.job_id, e.salary, e.commission_pct, e.manager_id, e.department_id);

-- # COMMIT and ROLLBACK Statement                   
select * from employees_copy;
delete employees_copy where job_id = 'SA_REP';
rollback; -- f12
update employees_copy set first_name = 'John';
commit; -- f11

update employees_copy c
set first_name = (select first_name from employees e
                  where e.employee_id = c.employee_id);
     
insert into employees_copy (select * from employees
                            where job_id = 'SA_REP');
                            
create table temp (tmp date);
drop table temp;
-- DDL, DCL�� ����� ��� ��� auto commit ��

-- #Row Lock in Oracle
update employees_copy
set salary = salary + 500
where employee_id = 102;

select employee_id, first_name, last_name, salary
from employees_copy
where employee_id = 102;
-- ���� �ٸ� ��Ű������ ����� ���̺�� ������ �۾��� �� �� ���� �۾��� ������ ��Ű������ Ŀ���̳� �ѹ� ���� ������ ������ �� �� ����(Row Lock)

update employees_copy
set salary = salary + 1000
where employee_id = 103;
-- ���� �ٸ��� �۾��� �� �� ������ ���� �ٲ� �κ��� Ŀ�Ե��� ����

select employee_id, first_name, last_name, salary
from employees_copy
where employee_id = 103;

update employees_copy
set first_name = 'Alex';
where employee_id = 102;
-- �÷��� �ٸ����� ���� ������ ��밡 Ŀ�ԵǱ� ������ �۾� �Ұ�

-- system ��Ű�� �۾�(Row Lock)
--select employee_id, first_name, last_name, salary
--from hr.employees_copy
--where employee_id = 102;
--
--select employee_id, first_name, last_name, salary
--from hr.employees_copy
--where employee_id = 103;
--
--update hr.employees_copy
--set salary = salary + 1000
--where employee_id = 102;

-- #SAVEPOINT Statement
select * from employees_copy;
select * from jobs_copy;
create table jobs_copy as select * from jobs;

delete from employees_copy where job_id = 'IT_PROG';
savepoint a;

update employees_copy
set salary = 1.2 * salary;
savepoint b;

insert into jobs_copy values ('PY_DEV', 'Python Developer', 12000, 20000);
savepoint c;

delete from employees_copy where job_id = 'SA_REP';
savepoint d;
-- save point�� �̸��� ���� �Ǹ� ���� �ۼ��� save point�� �����

rollback;
rollback to a;
-- rollback to�� save point�� �̵��ϸ� �� ���Ŀ� �ۼ��� save point�� ������

-- #FOR UPDATE Statement
select * from employees_copy
where job_id = 'IT_PROG' for update;

select first_name, last_name, salary
from employees_copy e join departments d
using (department_id)
where location_id = 1400
for update;

select first_name, last_name, salary
from employees_copy e join departments d
using (department_id)
where location_id = 1400
-- for update of first_name, last_name;
for update of first_name, location_id;
-- of�� ����� column�� �ְ� �Ǹ� �ش� column�� ���Ե� table�� lock

select first_name, last_name, salary
from employees_copy e join departments d
using (department_id)
where location_id = 1400
for update of first_name, location_id nowait;

select first_name, last_name, salary
from employees_copy e join departments d
using (department_id)
where location_id = 1400
for update of first_name, location_id wait 5;

select first_name, last_name, salary
from employees_copy e join departments d
using (department_id)
where location_id = 1400
for update of first_name skip locked;

-- system ��Ű�� �۾�(For Update)
--select * from hr.employees_copy
--where job_id = 'IT_PROG';
--
--update hr.employees_copy set salary = 1
--where employee_id = 104;
---- �ٸ� ��Ű������ for update�� �۾��� �ɷ������� �ٸ� ��Ű������ ���� �Ұ�
---- for update �۾� ���� ��Ű���� Ŀ���̳� �ѹ��� �ϸ� ���� ����
--update hr.employees_copy set salary = 1
--where employee_id = 100;
--
--update hr.departments set manager_id = 100
--where department_id = 60;

-- # FLASHBACK Operations
-- flashback�� �����͸� ��ã�� ������ ����(����X)
select * from recyclebin;
-- drop�� ���̺� ���� �� �� ����
select * from employees_copy;
delete from employees_copy where salary > 5000;
flashback table employees_copy to timestamp sysdate - 5/(24*60);
-- �ð��� ������ �ٲ���� ��(5/(24*60)
alter table employees_copy enable row movement;
-- ���̺��� DDL ������ �����ϸ� ���̺��� ������ �ٲٱ� ������ flashback�� ����� �� ����
-- �� ��쿡�� ����̳� flashback archive�� ����ؾ���(������ ����X, DBA ����)
select dbms_flashback.get_system_change_number as scn from dual;
-- sys ��Ű���� ���ؼ� ���� ����
-- hr ��Ű���� ���� X
flashback table employees_copy to scn 21968818;
insert into employees_copy select * from employees;
update employees_copy set salary = 10000;
select ora_rowscn, first_name from employees_copy;
-- row�� �ý��� ���� ��ȣ
update employees_copy set first_name = 'Farah' where first_name = 'Sarah';
drop table employees_copy;
-- drop�ϸ� ������ scn(�ý��� ���� ��ȣ)�δ� flashback �Ұ���
select * from "BIN$W0PxDIBSQOalMPccUWOPxw==$0";
-- recyclebin���� object_name���� ������ ���̺��� �б� �������� �θ� �� ����
flashback table employees_copy to before drop;
-- �ٽ� �ҷ����� recyclebin ���̺����� �����
create restore point rp_test; -- sys ��Ű�� ���
flashback table hr.employees_copy to restore point rp_test;

-- #PURGE Operations
select * from recyclebin;
purge recyclebin;
-- purge -> ���� ����
drop table employees_copy3;
select * from employees_copy;
flashback table employees_copy to before drop;
drop table employees_copy purge;
-- drop�� �� purge�� ���� ���� drop�� ���ÿ� ���� ����
create table employees_copy3 as select * from employees;
purge table employees_copy3;

-- #Tracking Changes In Data In a Particular Time
select * from employees_copy;
select dbms_flashback.get_system_change_number from dual; -- sys ��Ű�� ����
update employees_copy set salary = 10000 where employee_id = 100;
select * from employees_copy as of timestamp (sysdate - interval '3' minute)
where employee_id = 100;
select * from employees_copy as of scn 21974885
where employee_id = 100;
select versions_starttime, versions_endtime, versions_startscn, versions_endscn,
       versions_operation, versions_xid, employees_copy.*
from employees_copy versions between scn minvalue and maxvalue
where employee_id = 100;
-- ���� �������� ���̺� alias ��� �Ұ�
select versions_starttime, versions_endtime, versions_startscn, versions_endscn,
       versions_operation, versions_xid, employees_copy.*
from employees_copy versions between timestamp (sysdate - interval '5' minute) and sysdate
where employee_id = 100;

-- #NOT NULL Constraint
desc jobs;
insert into jobs values (100, null, 1, 10000);
insert into jobs values (100, 'My_Job', 1, 10000);
insert into jobs(job_id, min_salary, max_salary) values (100, 1, 10000);

create table managers (manager_id number not null,
                       first_name varchar2(50),
                       last_name varchar2(50) constraint lname_nn not null,
                       department_id number not null);
desc managers;                       
-- table���� ��ü �����ϰ� shift+f4 -> ���̺� ����
-- ���࿡ �̸��� �������� ������ sys_c�� �����ϴ� �̸����� ����Ŭ�� �ڵ� ����

-- #UNIQUE Constraint
drop table managers;
create table managers (manager_id number constraint mgr_mid_uk unique,
                       first_name varchar2(50),
                       last_name varchar2(50),
                       department_id number not null,
                       phone_number varchar2(11) unique not null,
--                       phone_number varchar2(11) constraint pnum_uk unique constraint pnum_nn not null
                       -- �� �� �̸��� ������ ���� ����
                       email varchar2(100),
                       unique(email),
                       constraint mgr_composite_uk unique(first_name, last_name, department_id)
                      );
insert into managers values (100, 'Alex', 'Brown', 80);
insert into managers values (101, 'Alex', 'Brown', 80);
insert into managers values (100, 'Alex', 'Brown', 80, '123-456-789', 'abrown');
insert into managers values (101, 'Alex', 'Brown', 90, '123-456-780', 'abrown2');
insert into managers values (null, null, null, 90, '123-456-781', null);
insert into managers values (null, null, null, 100, '123-456-782', null);
select * from managers;
update managers set department_id = 90 where manager_id = 100;

-- #PRIMARY KEY Constraint
create table directors
    (director_id number constraint dir_did_pk primary key,
     first_name varchar2(50),
     last_name varchar2(50)
    );
create table executives
    (executive_id number,
     first_name varchar2(50),
     last_name varchar2(50),
     constraint exec_eid_pk primary key(executive_id, last_name)
    );
-- �ٸ� ���̺��̴��� ���� ��Ű������ ���� �̸��� ���������� ����� �� ����
insert into directors values(100, 'John', 'Goodman');
insert into directors values(null, 'John', 'Goodman');
-- primary key = unique + not null
insert into executives values(100, 'John', null);
drop table executives;

-- #FOREIGN KEY Constraint
drop table managers;
create table managers (manager_id number constraint mgr_mid_pk primary key,
                       first_name varchar2(50),
                       last_name varchar2(50),
                       department_id number not null,
                       phone_number varchar2(11) unique not null,
                       email varchar2(100),
                       unique(email),
                       constraint mgr_emp_fk foreign key(manager_id) references employees_copy(employee_id)
                      );
select * from employees;
select * from employees_copy;
drop table employees_copy;
create table employees_copy
(
    employee_id number(6) constraint emp_cpy_eid_pk primary key,
    first_name varchar2(20),
    last_name varchar2(20),
    department_id number(4)
);
insert into employees_copy
    select employee_id, first_name, last_name, department_id
    from employees;
    
select * from managers;
select * from employees_copy;
insert into managers values(100, 'John', 'King', 90, '123-456-789', 'jking');
update managers
set manager_id = 70
where manager_id = 100;

delete from employees_copy
where employee_id = 100;

update employees_copy
set employee_id = 80
where employee_id = 100;

update managers
set manager_id = 101
where manager_id = 100;

update managers
set manager_id = null;

drop table managers;
create table managers (manager_id number constraint mgr_mid_uk unique,
                       first_name varchar2(50),
                       last_name varchar2(50),
                       department_id number not null,
                       phone_number varchar2(11) unique not null,
                       email varchar2(100),
                       unique(email),
                       constraint mgr_emp_fk foreign key(manager_id) references employees_copy(employee_id),
                       constraint mgr_names_fk foreign key(first_name, last_name) references employees_copy(first_name, last_name)
                      );
                      
insert into managers values(103, 'John', 'King', 90, '123-456-789', 'jking');            

drop table employees_copy;
create table employees_copy
(
    employee_id number(6) constraint emp_cpy_eid_pk primary key,
    first_name varchar2(20),
    last_name varchar2(20),
    department_id number(4),
    constraint emp_cpy_names_uk unique(first_name, last_name)
);
insert into employees_copy
    select employee_id, first_name, last_name, department_id
    from employees;

-- child ���̺��� parent ���̺��� �����ϴ� �� parent ���ڵ带 ������ �� ����
-- �ڽ� ���ڵ� ���� null�� �����ϰų� �ڽķ��ڵ���� ���� ������ ���� �θ�Ű�� ����
-- ���� ���̺��� �����ϴ� ���, on delete cascade/on delete set null ���

-- The ON DELETE CASCADE | ON DELETE SET NULL Clause
drop table managers;
create table managers (manager_id number constraint mgr_mid_uk unique,
                       first_name varchar2(50),
                       last_name varchar2(50),
                       department_id number not null,
                       phone_number varchar2(11) unique not null,
                       email varchar2(100),
                       unique(email),
                       -- constraint mgr_emp_fk foreign key(manager_id) references employees_copy(employee_id) on delete set null);
                       constraint mgr_emp_fk foreign key(manager_id) references employees_copy(employee_id) on delete cascade);
                      
insert into managers values(103, 'John', 'King', 90, '123-456-789', 'jking');
insert into managers values(104, 'John2', 'King', 90, '123-456-780', 'jking2');
insert into managers values(105, 'John3', 'King', 90, '123-456-781', 'jking3');

select * from managers;
select * from employees_copy;

delete from employees_copy
where employee_id = 103;
delete from employees_copy
where employee_id = 104;

update employees_copy
set employee_id = 300
where employee_id = 105;
-- on delete cascade -> �θ� ���� ������ �� �θ� ��� �Բ� ���� ���� ���� �ڵ����� ������ ���Ἲ ���� ���� ������ �߻���Ű�� ����
-- on delete set null -> �θ� ����� �����ϸ� ���õ� �ڳ� ����� ���� null�� ����
-- ���� �� ����� delete���� ����(update�� �ȵ�)

-- #CHECK Constraints
create table managers2
(
    manager_id number,
    first_name varchar2(50),
    salary number,
    constraint salary_check check (salary > 100 and salary < 50000)
);

insert into managers2 values(1, 'Steven', 50);
insert into managers2 values(1, 'Steven', 2500);

update managers2
set salary = 20
where manager_id = 1;
update managers2
set salary = 65000
where manager_id = 1;

drop table managers2;
create table managers2
(
    manager_id number,
    first_name varchar2(50),
    salary number,
    email varchar2(100),
    constraint demo_check check (salary > 100 and salary < 50000 and upper(email) like '%.COM')
);
insert into managers2 values(1, 'Steven', 2500, 'thisisademoemail.xyz');
insert into managers2 values(1, 'Steven', 2500, 'thisisademoemail.com');

-- #Adding Constraints via ALTER TABLE Statements
drop table managers;
drop table employees_copy;
create table employees_copy as select * from employees;

alter table employees_copy add constraint emp_cpy_email_uk unique(email);
alter table employees_copy add constraint emp_cpy_names_uk unique (first_name, last_name);
alter table employees_copy add unique (phone_number);
alter table employees_copy add check (salary >= 10000);
-- �̹� �ִ� �÷����� ���� ���ǿ� ���ݵǴ°� ������ alter �Ұ���
alter table employees_copy add check (salary >= 1000);
alter table employees_copy add constraint emp_cpy_emp_id_pk primary key (employee_id);
alter table employees_copy add constraint emp_cpy_dept_fk foreign key (department_id) references departments(department_id);
alter table employees_copy modify salary constraint emp_cpy_salary_nn not null;
alter table employees_copy modify last_name not null;
-- �̹� ���� ������ ������ ���� �Ұ�
alter table employees_copy modify first_name not null;

-- #Dropping(Removing) Constraints
select * from employees_copy;
create table managers (manager_id number constraint mgr_mid_pk primary key,
                       first_name varchar2(50),
                       last_name varchar2(50),
                       department_id number not null,
                       phone_number varchar2(11) unique not null,
                       email varchar2(100),
                       unique(email),
                       constraint mgr_emp_fk foreign key(manager_id) references employees_copy(employee_id));
drop table managers;

alter table employees_copy drop constraint emp_cpy_emp_id_pk;
-- primary key�� �����ϴ� foreign key�� �ֱ� ������ ���� ������ ������ �� ����(cascade�� ����ؾ� ��)
alter table employees_copy drop constraint emp_cpy_emp_id_pk cascade;
alter table employees_copy drop primary key cascade;
alter table employees_copy drop constraint SYS_C008297 online;

-- #Cascading Constraints in Oracle
drop table employees_copy;
drop table departments_copy;
create table employees_copy as select * from employees;
create table departments_copy as select * from departments;

alter table departments_copy add constraint dept_id_pk primary key (department_id);
-- �� ��Ű������ ���� ���� ���� �̸��� ����� �� ����
alter table departments_copy add constraint dept_cpy_id_pk primary key (department_id);

alter table employees_copy
add constraint emp_dept_cpy_fk foreign key (department_id) references departments_copy (department_id);

alter table departments_copy drop column department_id;
-- department_id column�� �ܷ�Ű ���� ������ �־ drop �Ұ�(cascade constraint ���)
alter table departments_copy drop column department_id cascade constraint;

alter table employees_copy add unique (first_name, last_name);

alter table employees_copy drop column last_name;
-- ����-�� ���ǿ� ����
alter table employees_copy drop column last_name cascade constraint;
-- cascade constraint -> ���� ���Ἲ ����

-- #Renaming Constraints
create table employees_copy as select * from employees;
alter table employees_copy rename constraint SYS_C008325 to email_nn;

-- #Disabling Constraints
drop table employees_copy;
drop table departments_copy;
create table employees_copy as select * from employees;
create table departments_copy as select * from departments;

-- alter table departments_copy add constraint dept_cpy_id_pk primary key (department_id);
alter table departments_copy 
add constraint dept_cpy_id_pk primary key (department_id) disable;

alter table employees_copy
add constraint emp_dept_cpy_fk foreign key (department_id) references departments_copy (department_id);

update departments_copy
set department_name = null
where department_id = 10;

alter table departments_copy
disable constraint SYS_C008332;

update departments_copy
set department_id = 5
where department_id = 80;

alter table departments_copy
disable constraint dept_cpy_id_pk;
-- �ܷ�Ű ���� ������ �ִ� �ٸ� ���̺���� ��� disable �ؾ� ��
alter table departments_copy
disable constraint dept_cpy_id_pk cascade;
-- ���� �ܷ�Ű ���� ���Ǳ��� ��� disable�� ����

select * from departments_copy order by department_id;

-- #Enabling Constraints
insert into departments_copy values (10, 'TempDept', 100, 1700);

alter table departments_copy enable constraint DEPT_CPY_ID_PK;
-- disable ���¿��� ���� ���ǿ� ������� ���ڵ带 �߰��ߴٸ� enable �Ұ�

delete from departments_copy where department_name = 'TempDept';

-- #Status of Constraints
drop table departments_copy;
create table departments_copy as select * from departments;
alter table departments_copy add constraint dept_cpy_id_pk primary key (department_id);

alter table departments_copy disable constraint dept_cpy_id_pk;
-- ��ȿ�� �˻糪 ��ȿ�� �˻� �ɼ� ���� ���� ������ ��Ȱ��ȭ �ϸ� ��ȿ�� �˻簡 ���� ����(not validated)
alter table departments_copy disable novalidate constraint dept_cpy_id_pk;
alter table departments_copy disable validate constraint dept_cpy_id_pk;
alter table departments_copy enable constraint dept_cpy_id_pk;
alter table departments_copy enable novalidate constraint dept_cpy_id_pk;

update departments_copy set department_id = 10 where department_id = 20;
select * from departments_copy;
delete from departments_copy where department_id = 10;
update departments_copy set department_name = 'Temp' where department_id = 30;
update departments_copy set department_id = null where department_id = 40;
update departments_copy set department_id = null where department_id = 50;

-- #Deferring Constraints(Part 1)
drop table departments_copy;
create table departments_copy as select * from departments;

alter table departments_copy
add constraint dept_cpy_id_pk primary key (department_id) deferrable initially deferred;

insert into departments_copy values (10, 'Temp Department', 200, 1700);

-- #Deferring Constraints(Part 2)
set constraint dept_cpy_id_pk immediate;

insert into departments_copy values (10, 'Temp Department', 200, 1700);

set constraint dept_cpy_id_pk deferred;

set constraint all immediate;

alter session set constraint = immediate;

alter table departments_copy drop constraint dept_cpy_id_pk;
-- ������ �ٲٷ��� ���� ������ �����ϰ� �ٽ� �����ؾ���(deferred, immediate �� �� ����)

alter table departments_copy
add constraint dept_cpy_id_pk primary key (department_id) not deferrable;

set constraint dept_cpy_id_pk immediate;
set constraint dept_cpy_id_pk deferred;

-- #Creating Simple Views
create view empvw90 as
select * from employees where department_id = 90;

select * from empvw90;
select * from empvw90 where salary < 20000;

create view empvw20 as
select employee_id, first_name, last_name from employees where department_id = 20;

select * from empvw20;
select first_name, last_name from empvw20;

create view empvw30 as
select employee_id e_id, first_name name, last_name surname from employees where department_id = 30;

select * from empvw30;

create view empvw40 (e_id, name, surname, email) as
select employee_id, first_name, last_name, email from employees where department_id = 40;

select * from empvw40;

create view empvw41 (e_id, name, surname, email) as
select employee_id eid, first_name, last_name, email from employees where department_id = 40;

select * from empvw41;

-- #Creating Complex Views
create view emp_cx_vw (dname, min_sal, max_sal) as
    select distinct upper(department_name), min(salary), max(salary)
    from employees e join departments d
    using(department_id)
    group by department_name;
    
select * from emp_cx_vw;

-- #Modifying Views
select * from empvw30;

create or replace view empvw30 as
select employee_id e_id, first_name name, last_name surname, job_id
from employees where department_id = 30;

create or replace view empvw30 as
select employee_id e_id, first_name ||' '|| last_name name, job_id
from employees where department_id = 30;

-- #Performing DML Operations with Views
-- simple view
drop table employees_copy cascade constraints;
create table employees_copy as select * from employees;

create view empvw60 as
select employee_id, first_name, last_name, email, hire_date, job_id
from employees_copy
where department_id = 60;

select * from employees_copy;
select * from employees_copy where department_id = 60;
select * from empvw60;

insert into empvw60 values (213, 'Alex', 'Hummel', 'AHUMMEL', sysdate, 'IT_PROG');
-- insert�� ���������� view���� ������ ����
-- view�� �������̺����� ������ ���� select�������� ǥ�õ��� ������ ������ ���� ��ü ���̺� ��ȸ������ �� �� ����(60�� department_id�� insert�� ���� �ʾұ⿡)

create or replace view empvw60 as
select employee_id, first_name, last_name, email, hire_date, job_id, department_id
from employees_copy
where department_id = 60;

insert into empvw60 values (214, 'Alex', 'Hummel', 'AHUMMEL', sysdate, 'IT_PROG', 60);
-- ���⼭�� department_id�� 60�� �߰� �߱⿡ where department_id = 60���� ��ȸ�� ��� ��ȸ�� �����ϰ� view������ �� �� ����
update empvw60 set job_id = 'SA_MAN' where employee_id = 214;
delete from empvw60;

-- complex view
drop table employees_copy cascade constraints;
create table employees_copy as select * from employees;

create or replace view empvw60 as
select distinct employee_id, first_name, last_name, email, hire_date, job_id, department_id
from employees_copy
where department_id = 60;

insert into empvw60 values (214, 'Alex', 'Hummel', 'AHUMMEL', sysdate, 'IT_PROG', 60);
update empvw60 set job_id = 'SA_MAN' where employee_id = 214;
delete from empvw60;

create or replace view empvw60 as
select distinct employee_id, first_name, last_name, email, hire_date, job_id, department_id
from employees_copy
where department_id = 60;

insert into empvw60 values (1, 214, 'Alex', 'Hummel', 'AHUMMEL', sysdate, 'IT_PROG', 60);
update empvw60 set job_id = 'SA_MAN' where employee_id = 214;
delete from empvw60;

create or replace view empvw60 as
select employee_id, first_name, last_name, email, hire_date, job_id, department_id, salary*12 annual_salary
from employees_copy
where department_id = 60;

insert into empvw60 values (214, 'Alex', 'Hummel', 'AHUMMEL', sysdate, 'IT_PROG', 60, 120000);
update empvw60 set job_id = 'SA_MAN' where employee_id = 107;
delete from empvw60 where employee_id = 107;
-- update�� delete�� ����
-- � ��쿡�� ������ �۾��� �ְ�, � ��쿡�� �Ұ����� �۾��� ����

select * from employees_copy where department_id = 60;
select * from empvw60;
-- complex view������ DML �۾��� ���� �Ұ�����(�Ǵ� ��쵵 ����)
-- view���� DML�۾��� �ϴ� ���� ��õ���� ����

-- #Using the WITH CHECK OPTION Clause in SQL
drop table employees_copy;
create table employees_copy as select * from employees;

create or replace view empvw80 as
    select employee_id, first_name, last_name, email, hire_date, job_id
    from employees_copy
    where department_id = 80;
    
select * from empvw80;

insert into empvw80 values (215, 'John', 'Brown', 'JBROWN', sysdate, 'SA_MAN');

select * from employees_copy;
-- department_id�� insert���� �ʾұ⿡ view������ Ȯ���� �Ұ��������� ���̺����� Ȯ���� ����

create or replace view empvw80 as
    select employee_id, first_name, last_name, email, hire_date, job_id
    from employees_copy
    where department_id = 80
with check option constraint emp_dept80_chk;

insert into empvw80 values (216, 'John2', 'Brown2', 'JBROWN2', sysdate, 'SA_MAN');
-- check option�� where�� 80�̱⿡ 80�� ���Ե��� �ʾ� �߰� �Ұ�

create or replace view empvw80 as
    select employee_id, first_name, last_name, email, hire_date, job_id, department_id
    from employees_copy
    where department_id = 80
with check option;

insert into empvw80 values (217, 'John3', 'Brown3', 'JBROWN3', sysdate, 'SA_MAN', 80);
-- check option�� where�� 80�̱⿡ 80�� ���ԵǾ� �߰� ����
insert into empvw80 values (218, 'John4', 'Brown4', 'JBROWN4', sysdate, 'SA_MAN', 60);
-- check option�� where�� 80�̱⿡ 80�� ���Ե��� �ʾ� �߰� �Ұ�

create or replace view empvw80 as
    select employee_id, first_name, last_name, email, hire_date, job_id, department_id
    from employees_copy
    where department_id = 80
    and job_id = 'SA_MAN'
with check option;

insert into empvw80 values (219, 'John5', 'Brown5', 'JBROWN5', sysdate, 'IT_PROG', 80);
-- check option�� where�� 'SA_MAN'�̱⿡ 'SA_MAN'�� ���Ե��� �ʾ� �߰� �Ұ�
update empvw80 set first_name = 'Steve' where employee_id = 217;
update empvw80 set department_id = 70 where employee_id = 217;
-- check option�� ���Ե��� ���� column�� ������ ���������� ���Ե� column�� ���� �Ұ�

-- check option�� ���Ե� view�� complex view�� �з�

select * from user_constraints where table_name = 'EMPVW80';

-- #Using the WITH READ ONLY Clause on Views(Preventing DMLs)
-- READ ONLY�� �ϸ� DML ������ ���� �Ұ�
create or replace view empvw80 as
    select employee_id, first_name, last_name, email, hire_date, job_id, department_id
    from employees_copy
    where department_id = 80
    and job_id = 'SA_MAN'
with read only;

select * from empvw80;

insert into empvw80 values (219, 'John3', 'Brown3', 'JBROWN3', sysdate, 'IT_PROG', 80);
update empvw80 set first_name = 'Steve' where employee_id = 217;
delete from empvw80 where employee_id = 217;
-- DML ����� ���� �Ұ���

-- #Dropping Views
select * from user_constraints where table_name = 'EMPVW80';
drop view empvw20;
drop view empvw30;
drop view empvw40;
drop view empvw41;
drop view empvw60;
drop view empvw80;
-- view�� drop�ϸ� ��� ���� ���� ���ǵ� drop

-- #The Dictionary view
select * from dictionary;
-- hr, sys ��Ű���� �����ϸ� dictionary�� ��� ���̺� �������� �� ���� comments�� ���� ���� ������ ������
-- sys-cdb ��Ű���� �����ϸ� �� ���� ���̺��� �� �� �ְ� comments�� ������ �� �� ����

select * from dict;
-- dictionary�� ����

select * from dictionary
where table_name = 'USER_CONSTRAINTS';

select * from dictionary
where upper(comments) like '%CONSTRAINT%';

-- #Difference Between USER, ALL, DBA and V$ Prefixes
-- USER_ Prefixes < ALL_ Prefixes < DBA_ Prefixes
-- USER Prefix: ������� ��Ű���� ���Ե� ��� ��ü�� ����
-- ALL Prefix: ������� ��Ű���� ���Ե� ��� ��ü�Ӹ� �ƴ϶�, ����ڰ� ������ �� �ִ� ��� ��Ű���� ��ü�� ����
-- DBA Prefix: ��� ������� ��� ��ü�� ����. ���� DBA�� �ʿ��� ������ ���� ����ڸ� Data Dictionary view�� ���� ����
-- V$ Prefix: �����ͺ��̽� ���ɿ� ���� ������ �����ϴ� �� ����. ���� DBA�� �ʿ��� ������ ���� ����ڸ� Data Dictionary view�� ���� ����

-- #USER_OBJECTS, ALL_OBJECTS and DBA_OBJECTS Views
select * from user_objects;
-- � ��Ű���� ����ϴ��Ŀ� ���� ��ü ���� �޶���
select * from user_catalog;
select * from cat;
-- cataglog�� cat�� ���� ����

select * from all_objects;
-- ��Ű���� ��� ��ü�� �� �� ����
-- � ��Ű���� ����ϴ��Ŀ� ���� ��ü ���� �޶���

select * from dba_objects;
-- hr ��Ű���� �ʼ� ������ ���� ������ �� �� ����(system ��Ű���� ����)

-- #USER_TABLES Data Dictionary View
select * from user_tables;
select * from tabs;

select * from all_tables;

select * from dba_tables;
-- system ��Ű���� ��� ����

-- #USER_TAB_COLUMNS Data Dictionary View
select * from user_tab_columns;
select * from cols;

select * from user_tab_columns
where table_name = 'DEPARTMENTS';

select * from all_tab_columns;

-- #USER_CONSTRAINTS Data Dictionary View
-- type of constraint
-- C -> Check Constraint
-- P -> Primary Key
-- U -> Unique Key
-- R -> Refrential Integirity(Foreign Key)
-- V -> With Check Option(Used For Views)
-- O -> With Read-Only(Used For Views)

select * from user_constraints;
select * from all_constraints;
select * from dba_constraints;

-- #USER_CONS_COLUMNS Data Dictionary View
select * from user_cons_columns
where table_name = 'EMPLOYEES';

select b.constraint_type, a.*, b.r_constraint_name from user_cons_columns a join user_constraints b
on (a.table_name = b. table_name and a.constraint_name = b.constraint_name)
order by a.table_name, a.constraint_name;

select * from all_cons_columns;
select * from dba_cons_columns;

-- #USER_VIEWS Data Dictionary View
select * from user_views;

-- #USER_TAB_COMMENTS and USER_COL_COMMENTS Data Dictionary Views
select * from user_tab_comments
where upper(comments) like '%EMPLOYEE%';

select * from user_col_comments
where upper(comments) like '%SALARY%';