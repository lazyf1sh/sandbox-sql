DROP TABLE G;

CREATE TABLE G
(
 G_KEY number,
 G_VALUE varchar(10 CHAR)
);

INSERT INTO G VALUES(1, 'FOO');
INSERT INTO G VALUES(2, 'FOO');
INSERT INTO G VALUES(5, 'BAR');

-- GROUP BY Ищет колонки с одинаковыми значениями
-- Мы обязаны применить аггрегирующую функцию 
SELECT SUM(G_KEY) FROM G GROUP BY G_VALUE;
-- ИЛИ добавить в список колонок ту колоноку, по которой группируем:
SELECT G_VALUE FROM G GROUP BY G_VALUE;