create table TEST_TABLE_OIDSJL (
 idx number,
 name varchar2(255)
);

INSERT INTO TEST_TABLE_OIDSJL
(SELECT ROWNUM, OBJECT_NAME FROM ALL_OBJECTS WHERE ROWNUM < 5);

SELECT * FROM TEST_TABLE_OIDSJL;