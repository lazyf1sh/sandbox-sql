DROP TABLE T1;

CREATE TABLE T1
(
    VAL varchar2(256 CHAR)
);

INSERT INTO T1 VALUES ('John');
INSERT INTO T1 VALUES ('John');
INSERT INTO T1 VALUES ('John2');
INSERT INTO T1 VALUES ('John2');
INSERT INTO T1 VALUES ('John3');
INSERT INTO T1 VALUES ('John3');

SET AUTOTRACE ON

SELECT 
	VAL
FROM	
	T1
GROUP BY
	VAL;

SET AUTOTRACE OFF