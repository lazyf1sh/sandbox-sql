column column_name format a30
column TABLE_NAME format a25
column R_TABLE_NAME format a15
column COMMENTS format a70
column DATA_TYPE format a15
column DATA_DEFAULT format a20
column CONSTRAINT_NAME format a20
column R_CONSTRAINT_NAME format a20
column OWNER format a15
column CGBS_BIGSTRINGVALUE format a200
column COLUMN_ID format 00

-- TODO read previous value and restore it later
SET LONG 50000 
-- TODO read previous value and restore it later 
SET WRAP ON 

SELECT dbms_metadata.get_ddl( 'TABLE', '&1', null ) FROM dual;

SELECT * FROM USER_TAB_COMMENTS WHERE TABLE_NAME = '&1';

SELECT
clmns.COLUMN_ID, clmns.TABLE_NAME, clmns.COLUMN_NAME, comments.COMMENTS, clmns.DATA_TYPE, clmns.DATA_LENGTH, clmns.CHAR_LENGTH, clmns.DATA_DEFAULT,
clmns_cnst.OWNER, clmns_cnst.CONSTRAINT_NAME, usercons.R_CONSTRAINT_NAME,
usercons2.CONSTRAINT_NAME,
usercons2.TABLE_NAME R_TABLE_NAME, clmns.COLUMN_ID
FROM USER_TAB_COLUMNS clmns
LEFT JOIN USER_CONS_COLUMNS clmns_cnst ON clmns_cnst.COLUMN_NAME = clmns.COLUMN_NAME AND clmns_cnst.TABLE_NAME = clmns.TABLE_NAME
JOIN USER_COL_COMMENTS comments ON comments.COLUMN_NAME = clmns.COLUMN_NAME
LEFT JOIN USER_CONSTRAINTS usercons ON usercons.CONSTRAINT_NAME = clmns_cnst.CONSTRAINT_NAME
LEFT JOIN USER_CONSTRAINTS usercons2 ON usercons2.CONSTRAINT_NAME = usercons.R_CONSTRAINT_NAME
WHERE clmns.TABLE_NAME = '&1'
ORDER BY clmns.COLUMN_ID;

-- TODO read previous value and restore it later
SET LONG 80
-- TODO read previous value and restore it later
SET WRAP OFF