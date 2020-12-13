oracle sqlplus

```
rem	Author:		Ivan Kopylov

--host cls
host mode con: cols=5000 lines=9999
-- Executes an operating system command without leaving SQL*Plus
PROMPT ################################################################
PROMPT executing glogin.sql commands...
PROMPT 'SET' changes will be lost after closing session
PROMPT
PROMPT ################################################################
PROMPT 'host cd'
host cd
PROMPT ################################################################
PROMPT 'user'
show user
-- SET PAGESIZE 0 to set an infinite pagesize and avoid headings, titles and so on.
-- There are some other SETparamters concering output (NUMWIDTH, NUMFORMAT, LONG, COLSEP) and performance (ARRAYSIZE,LONGCHUNKSIZE)
--SELECT table_name FROM all_tables;
PROMPT ################################################################
SELECT * FROM v$version;
--PROMPT ################################################################
--SELECT pname, pval1 FROM SYS.AUX_STATS$;
PROMPT ################################################################
PROMPT 'select sum(bytes)/1024/1024 from dba_data_files;'
select sum(bytes)/1024/1024 from dba_data_files;
PROMPT ################################################################
SELECT file_name, autoextensible, round(bytes/1024/1024,2) as bytes_in_mb, round(maxbytes/1024/1024,2) as maxbytes_in_mb FROM dba_data_files;
PROMPT ################################################################
```
