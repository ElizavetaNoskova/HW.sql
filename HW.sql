CREATE
DATABASE skypro;
\c
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