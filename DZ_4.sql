#1. Создать VIEW на основе запросов, которые вы сделали в ДЗ к уроку 3.
CREATE VIEW Город AS
SELECT _cities.title_en  AS 'City' , _countries.title_en AS 'land', _regions.title_en AS 'area' FROM _cities
 join _countries on _cities.country_id = _countries.id
 join _regions on _cities.region_id = _regions.region_id;
 
 CREATE VIEW Область AS
  SELECT _cities.title_en AS 'cit_title', _regions.title_en AS 'reg_title' FROM _cities
 join _regions on _regions.title_en = 'Московская область';
 
 CREATE VIEW Зарплата AS
 SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name, MAX(salaries.salary)
  from employees
  join salaries  on employees.emp_no = salaries.emp_no
  join dept_emp on dept_emp.emp_no = employees.emp_no
  join departments on departments.dept_no = dept_emp.dept_no;
 
#2. Создать функцию, которая найдет менеджера по имени и фамилии.
CREATE FUNCTION findFIO1 (firstname VARCHAR(14), lastname VARCHAR(16))
RETURNS VARCHAR(35) DETERMINISTIC  
READS SQL DATA
RETURN(SELECT CONCAT (employees.first_name, ' ', employees.last_name) from employees
where first_name = firstname and last_name = lastname);

#3. Создать триггер, который при добавлении нового сотрудника будет выплачивать ему вступительный бонус, занося запись об этом в таблицу salary.
ALTER TABLE `les3`.`salaries` 
ADD COLUMN `initital_bonus` INT NOT NULL AFTER `to_date`;
Create trigger entersomeinfo 
after insert on employees
for each row
insert into salaries (emp_no, initital_bonus) VALUES (NEW.emp_no, 199)#Предполагается, что остальные данные подтягиваются из табл empployees при добавлении туда нового сотрудника

