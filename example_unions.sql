-- # Какую проблему решает UNION
-- - 
-- - (пример) Если есть база, где данные архивируются в другую таблицу, то удобно доставать данные из двух таблиц сразу.
--
-- - UNION [ALL] не гарантирует порядок строк
-- - UNION ALL не убирает дубликаты
-- - UNION        убирает дубликаты


-- # UNION syntax
-- SELECT column_name(s) FROM table1
-- UNION
-- SELECT column_name(s) FROM table2;

-- # Попытка сравнения с JOIN
-- Join & union are different operators. They return different things. JOIN and UNION have two different purposes. JOIN is used to add additional tables to a query for the purpose of adding selection criteria and possibly additional columns. UNION is used to combine the results of two distinct queries with the same columns.

-- # Другая информация
--  - В оптимизаторе строка CONCATENATION заменена на UNION-ALL с какой-то версии Oracle. В 11g план показывает UNION-ALL
--  - Each UNION-ALL branch may be subject to further query transformations
--  - Parallel queries can execute UNION-ALL branches concurrently

DROP TABLE TABLE1;
DROP TABLE TABLE2;

CREATE TABLE TABLE1
(
    name varchar2(10 CHAR)
);

CREATE TABLE TABLE2
(
    name varchar2(10 CHAR)
);


INSERT INTO TABLE1 VALUES ('Jonathan');
INSERT INTO TABLE1 VALUES ('Vasia');
INSERT INTO TABLE1 VALUES ('John');
INSERT INTO TABLE2 VALUES ('Petya');
INSERT INTO TABLE2 VALUES ('Jonathan');
--------------------------------------------------------------
PROMPT UNION

SELECT * FROM TABLE1
UNION
SELECT * FROM TABLE2;

--------------------------------------------------------------
PROMPT UNION ALL
SELECT * FROM TABLE1
UNION ALL
SELECT * FROM TABLE2;

--------------------------------------------------------------
PROMPT UNION WITH EQUALS OPERATOR

SELECT * FROM TABLE1 WHERE NAME = 'Vasia'
UNION ALL
SELECT * FROM TABLE2 WHERE NAME = 'Jonathan';

--------------------------------------------------------------
CREATE INDEX TABLE1_IDX ON TABLE1(NAME);
CREATE INDEX TABLE2_IDX ON TABLE2(NAME);

--------------------------------------------------------------

PROMPT UNION WITH: EQUALS OPERATOR; INDEX;

SELECT * FROM TABLE1 WHERE NAME = 'Vasia'
UNION ALL
SELECT * FROM TABLE2 WHERE NAME = 'Jonathan';