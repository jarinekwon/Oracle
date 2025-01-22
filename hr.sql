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

select avg(salary), avg(all salary), avg(distinct salary)
    from employees
    where job_id = 'IT_PROG';

select avg(commission_pct), avg(nvl(commission_pct, 0)) from employees;

select count(*), count(commission_pct), count(distinct commission_pct),
        count(nvl(commission_pct, 0)), count(distinct nvl(commission_pct, 0))
    from employees;

select max(salary), max(hire_date), max(first_name) from employees;
select * from employees
    order by first_name;

select min(salary), min(commission_pct), min(nvl(commission_pct, 0)),
        min(hire_date), min(first_name)
    from employees;
    
select sum(salary), sum(all salary), sum(distinct salary) from employees;    

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

select sum(salary), avg(salary), max(hire_date), min(commission_pct),
        count(distinct manager_id), listagg(job_id, ', ')
    from employees;

select avg(salary) from employees
    where job_id = 'IT_PROG' or job_id = 'SA_REP';
    
select job_id, avg(salary) from employees
    group by job_id
    order by avg(salary) desc;

select job_id, department_id, manager_id, avg(salary), count(*) from employees
    group by job_id, department_id, manager_id
    order by count(*) desc;
    
select job_id, department_id, avg(salary) from employees
    group by job_id, department_id;
select job_id, avg(salary), sum(salary), max(hire_date), count(*) from employees
    where job_id in ('IT_PROG', 'ST_MAN', 'AC_ACCOUNT')
    group by job_id;

select job_id, avg(salary) from employees
    where manager_id = 101
    group by job_id
    having avg(salary) > 10000;
-- having ��ġ�� group by ���ķ� ���� �������

select job_id, avg(salary) from employees
--    where manager_id = 101
    group by job_id
    having avg(salary) > 5000;

select max(avg(salary)), min(avg(salary)) from employees
    group by department_id;
    
select * from employees;
select * from departments;

desc employees;
desc departments;

select * from employees natural join departments;
select * from departments natural join employees;
-- natural join�� on�� �Ἥ �����ų �ʿ䰡 ����

select * from employees join departments using (department_id, manager_id);
-- join �ϰ���� ���� ������ �ִٸ� using ���

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

select worker.first_name, worker.last_name, worker.employee_id, worker.manager_id,
        manager.employee_id, manager.first_name, manager.last_name,
        worker.salary, manager.salary
    from employees worker join employees manager
    on (worker.manager_id = manager.employee_id);

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

select first_name, last_name, department_name
    from employees join departments
    using (department_id);
    
select d.department_id, d.department_name, e.first_name, e.last_name
    from departments d join employees e
    on (d.manager_id = e.employee_id);
    
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
    
select first_name, last_name, department_name, e.department_id, d.department_id
    from employees e full join departments d
    on (e.department_id = d.department_id);
-- full = left + right

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

--------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------

select salary from employees
    where employee_id = 145;
select * from employees
    where salary > 14000;
select * from employees
    where salary > (select salary from employees
                        where employee_id = 145);

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
                       
select employee_id, first_name, last_name, department_id, salary
from employees a
where salary = (select max(salary)
                from employees b
                where b.department_id = a.department_id);
-- ���������� ���೪�� a�� department_id�� ã�� ���ϱ⿡ ������ �߻�        
                       
select employee_id, first_name, last_name, department_id, salary
from employees a
where (salary, department_id) in (select max(salary), department_id
                                  from employees b
                                  group by department_id);
                                  
select employee_id, first_name, last_name, a.department_id, salary
from employees a join (select avg(salary) avg_sal, department_id
                       from employees
                       group by department_id) bselect employee_id, first_name, last_name, department_id, salary
from employees a
where salary < (select avg(salary)
                from employees b
                where b.department_id = a.department_id);
select employee_id, first_name, last_name, department_id, salary
from employees a
where (salary, department_id) in (select max(salary), department_id
                                  from employees b
                                  group by department_id);
select employee_id, first_name, last_name, department_id, salary
from employees a
where salary = (select max(salary)
                from employees b
                where b.department_id = a.department_id);
select * from employees
where (department_id, manager_id) = (select department_id, manager_id from employees
                                     where first_name = 'Luis');
select employee_id, first_name, last_name, department_id, salary
from employees a
where salary = (select max(salary)
                from employees b
                where b.department_id = a.department_id);
select employee_id, first_name, last_name, department_id, salary
from employees a
where (salary, department_id) in (select max(salary), department_id
                                  from employees b
                                  group by department_id);
select employee_id, first_name, last_name, department_id, salary
from employees a
where salary < (select avg(salary)
                from employees b
                where b.department_id = a.department_id);
select employee_id, first_name, last_name, department_id, salary
from employees a
where (salary, department_id) in (select max(salary), department_id
                                  from employees b
                                  group by department_id);
select employee_id, first_name, last_name, department_id, salary
from employees a
where salary = (select max(salary)
                from employees b
                where b.department_id = a.department_id);
select * from employees
where (department_id, manager_id) = (select department_id, manager_id from employees
                                     where first_name = 'Luis');
select department_id, manager_id from employees
                                     where first_name = 'Luis'
select first_name, last_name, salary, (10*(salary/5) + 3000) - 100 new_salary from employees order by first_name desc, salary desc;
select employee_id, hire_date, trunc(hire_date, 'year') truncated_result,
        round(hire_date, 'year') rounded_result
    from employees;
set define on;
select rtrim(ltrim('www.yourwebsitename.com', 'w.'), '.com') trimmed_text from dual;
select ltrim('         my Name is Adam      ', 'my') trimmed_text from dual;
select department_id, avg(salary) from employees
    group by department_id;
select * from employees
    where first_name in ('Steven', 'Peter', 'Adam', 'aa');
select first_name, hire_date, to_char(hire_date, 'MON')" Formatted Date" 
    from employees;
select first_name, last_name
       from employees;
select * from employees join departments using (department_id, manager_id);
select department_id from employees
where first_name = 'Luis';
select employee_id, first_name, last_name, salary from employees
    where employee_id = &emp_id;
select round(12.536, 3) from dual;
select trim(leading 'm' from 'My Name is Adam') trimmed_text from dual;
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

select avg(salary), avg(all salary), avg(distinct salary)
    from employees
    where job_id = 'IT_PROG';

select avg(commission_pct), avg(nvl(commission_pct, 0)) from employees;

select count(*), count(commission_pct), count(distinct commission_pct),
        count(nvl(commission_pct, 0)), count(distinct nvl(commission_pct, 0))
    from employees;

select max(salary), max(hire_date), max(first_name) from employees;
select * from employees
    order by first_name;

select min(salary), min(commission_pct), min(nvl(commission_pct, 0)),
        min(hire_date), min(first_name)
    from employees;
    
select sum(salary), sum(all salary), sum(distinct salary) from employees;    

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

select sum(salary), avg(salary), max(hire_date), min(commission_pct),
        count(distinct manager_id), listagg(job_id, ', ')
    from employees;

select avg(salary) from employees
    where job_id = 'IT_PROG' or job_id = 'SA_REP';
    
select job_id, avg(salary) from employees
    group by job_id
    order by avg(salary) desc;

select job_id, department_id, manager_id, avg(salary), count(*) from employees
    group by job_id, department_id, manager_id
    order by count(*) desc;
    
select job_id, department_id, avg(salary) from employees
    group by job_id, department_id;
select job_id, avg(salary), sum(salary), max(hire_date), count(*) from employees
    where job_id in ('IT_PROG', 'ST_MAN', 'AC_ACCOUNT')
    group by job_id;

select job_id, avg(salary) from employees
    where manager_id = 101
    group by job_id
    having avg(salary) > 10000;
-- having ��ġ�� group by ���ķ� ���� �������

select job_id, avg(salary) from employees
--    where manager_id = 101
    group by job_id
    having avg(salary) > 5000;

select max(avg(salary)), min(avg(salary)) from employees
    group by department_id;
    
select * from employees;
select * from departments;

desc employees;
desc departments;

select * from employees natural join departments;
select * from departments natural join employees;
-- natural join�� on�� �Ἥ �����ų �ʿ䰡 ����

select * from employees join departments using (department_id, manager_id);
-- join �ϰ���� ���� ������ �ִٸ� using ���

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

select worker.first_name, worker.last_name, worker.employee_id, worker.manager_id,
        manager.employee_id, manager.first_name, manager.last_name,
        worker.salary, manager.salary
    from employees worker join employees manager
    on (worker.manager_id = manager.employee_id);

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

select first_name, last_name, department_name
    from employees join departments
    using (department_id);
    
select d.department_id, d.department_name, e.first_name, e.last_name
    from departments d join employees e
    on (d.manager_id = e.employee_id);
    
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
    
select first_name, last_name, department_name, e.department_id, d.department_id
    from employees e full join departments d
    on (e.department_id = d.department_id);
-- full = left + right

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

--------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------

select salary from employees
    where employee_id = 145;
select * from employees
    where salary > 14000;
select * from employees
    where salary > (select salary from employees
                        where employee_id = 145);

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

select employee_id, first_name, last_name, department_id
from employees a
where exists
            (select null from employees where manager_id = a.employee_id);
            
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

select first_name, last_name, email, hire_date, salary from retired_employees
intersect
select first_name, last_name, email, hire_date, salary from employees;
-- ����� �͸�

select first_name, last_name, email, hire_date, salary from retired_employees
minus
select first_name, last_name, email, hire_date, salary from employees;
-- ù�������� ��°������ ����

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

select * from employees_copy;
desc employees_copy;
info employees_copy;
alter table employees_copy set unused (first_name, phone_number, salary);
select * from user_unused_col_tabs;
alter table employees_copy set unused column last_name online;
-- column�� �� ������ �ʾƵ� ��
alter table employees_copy drop unused columns;

create table emp_temp as select * from employees;
select * from emp_temp;
alter table emp_temp read only;
delete emp_temp;
alter table emp_temp add gender varchar2(1);
alter table emp_temp drop (gender);
drop table emp_temp;
alter table emp_temp read write;

select * from employees_copy4;
drop table employees_copy4;
-- ���� ���̺��� �ѹ��� ���� �� ����
flashback table employees_copy4 to before drop;
drop table employees_copy4 purge;
-- purge�� ���� flashback �Ұ�

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

create table employees_copy as select * from employees;
comment on column employees_copy.job_id is 'Stores job title abbreviations';
comment on table employees_copy is 'This is a copy of employees table';
comment on column employees_copy.hire_date is 'This is a sample comment';
comment on column employees_copy.hire_date is ''; -- �ּ��� drop�ϴ� ���
select * from user_tab_comments where table_name = 'EMPLOYEES_COPY'; -- ���̺�� �빮�ڷ� �ۼ�
select * from user_col_comments where table_name = 'EMPLOYEES_COPY';
info employees_copy;

desc employees_copy;
alter table employees_copy rename column hire_date to start_date;
alter table employees_copy rename column start_date to hire_date;
rename employees_copy to employees_backup;
select * from employees_copy;
select * from employees_backup;
rename employees_backup to employees_copy;
                       
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

select * from employees_copy;

delete from employees_copy;

delete from employees_copy
where job_id = 'IT_PROG';

delete from employees_copy
where department_id in (select department_id
                        from departments
                        where upper(department_name) like '%SALES%');

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