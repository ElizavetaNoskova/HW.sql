CREATE
DATABASE skypro;
\
c
skypro;
CREATE TABLE employee
(
    id         BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    gender     VARCHAR(6)  NOT NULL,
    age        INT         NOT NULL
);
INSERT INTO employee(first_name, last_name, gender, age)
VALUES ('LIZA', 'NOSKOVA', 'WOMAN', 21),
       ('ROMA', 'KOTOV', 'MAN', 23),
       ('ROMA', 'petrov', 'MAN', 23);
UPDATE employee
SET first_name = 'Ivan',
    last_name  = 'noskov',
    age        = 98
WHERE last_name = 'KOTOV';
SELECT *
FROM employee;
DELETE
FROM employee
WHERE id = 1;
SELECT *
FROM employee;
/* zadanie 1*/
INSERT INTO employee(first_name, last_name, gender, age)
VALUES ('LENA', 'NOSOVA', 'WOMAN', 76),
       ('ALEX', 'SEMENOV', 'MAN', 23);
SELECT first_name AS Имя,
       last_name  AS Фамилия
FROM employee;
SELECT age
FROM employee
WHERE age < 30
   OR age > 50;
SELECT age
FROM employee
WHERE age > 30
  AND age < 50;
SELECT last_name
FROM employee
ORDER BY last_name DESC;
SELECT first_name
FROM employee
where LENGTH(first_name) > 4;
UPDATE employee
SET first_name = 'LENA',
    last_name  = 'Petrova',
    age        = 70
WHERE last_name = 'NOSKOVA';
select first_name as Имя, SUM(age) as Суммарный_возраст
from employee
group by Имя;
select first_name, age
FROM employee
WHERE age = (SELECT MIN(age) FROM employee);
select first_name AS имя, MAX(age) AS МАКСИМАЛЬНЫЙ_ВОЗРАСТ
FROM employee
GROUP BY first_name
HAVING COUNT(first_name) > 1;
CREATE TABLE city;
( city_id BIGSERIAL NOT NULL PRIMARY KEY,
    city_name VARCHAR (50) NOT NULL );
ALTER TABLE employee
    add column city_id INT;
--Назначьте эту колонку внешним ключом. Свяжите таблицу employee с таблицей city
alter table employee
add foreign key (city_id) references city(city_id);
insert into city(city_name)
values ('Tver'),
        ('Moskva'),
        ('Omsk'),
        ('S.T.Petersburg');
UPDATE employee SET city_id = 1 WHERE id = 2;
UPDATE employee SET city_id = 2 WHERE id = 5;
UPDATE employee SET city_id = 3 WHERE id = 3;
UPDATE employee SET city_id = 4 WHERE id = 4;
UPDATE employee SET city_id = 5 WHERE id = 6;
select employee.first_name, employee.last_name, city.city_name from employee
join city on employee.city_id = city.city_id;

select city.city_name, employee.first_name, employee.last_name from city
left join employee on employee.city_id = city.city_id;
select employee.first_name, city.city_name
from employee
full join city on employee.city_id = city.city_id;

select employee.first_name, city.city_name
from employee
left join city on employee.city_id = city.city_id;

select city.city_name
from employee
right join city on employee.city_id = city.city_id
where employee.first_name is null;