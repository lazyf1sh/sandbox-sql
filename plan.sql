

```
--
-- An example of retrieving a useful SQL Execution Plan
--

SELECT * FROM table(DBMS_XPLAN.DISPLAY_CURSOR(FORMAT=>'ALL +OUTLINE'));
```
