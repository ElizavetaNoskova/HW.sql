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
HAVING COUNT(first_name)>1;