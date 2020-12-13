
--select 'column ' || column_name || ' format a' || data_length
--from all_tab_cols
--where table_name='YOUR_TABLE'
--/
--spool off

--@t1.sql
--set pagesize 24
--set heading on
--spool result.txt
--select * 
--from  YOUR_TABLE;
--and   rownum < 30;
--spool off


set termout off
set feedback off
set heading off

spool adjust_cols_generated_statements.sql

SELECT 'COLUMN ' || column_name || ' FORMAT ' ||
       CASE
          WHEN data_type = 'DATE' THEN
           'A9'
          WHEN data_type LIKE '%CHAR%' THEN
           'A' ||
           TRIM(TO_CHAR(LEAST(GREATEST(LENGTH(column_name),
                        data_length), 40))) ||
           CASE
              WHEN data_length > 40 THEN
               ' TRUNC'
              ELSE
               NULL
           END
          WHEN data_type = 'NUMBER' THEN
           LPAD('0', GREATEST(LENGTH(column_name),
           NVL(data_precision, data_length)), '9') ||
           DECODE(data_scale, 0, NULL, NULL, NULL, '.' ||
           LPAD('0', data_scale, '0'))
          WHEN data_type IN ('RAW', 'LONG') THEN
           'A1 NOPRINT'
          WHEN data_type LIKE '%LOB' THEN
           'A1 NOPRINT'
          ELSE
           'A' || TRIM(TO_CHAR(GREATEST(LENGTH(column_name), data_length)))
       END AS format_cols
  FROM dba_tab_columns
   WHERE upper(table_name) = '&1';

spool off
@adjust_cols_generated_statements
@init_set_variables_for_sqlplus