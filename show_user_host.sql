rem	Author:		Ivan Kopylov

--PROMPT ################################################################
col sysdt new_value sysdt_var
col myuser new_value myuser_var;
col myhost new_value myhost_var;
SELECT TO_CHAR(SYSDATE, 'yyyymmdd_hh24miss') sysdt FROM DUAL;
SELECT user myuser FROM DUAL;
SELECT UTL_INADDR.get_host_name myhost FROM dual;
DEFINE LOGFILE=C:\1\OracleXE_112_Win64\app\oracle\product\11.2.0\server\!my_spools\&&myhost_var.___&&myuser_var.___&&sysdt_var..log
spool &&LOGFILE

PROMPT &&myhost_var. &&myuser_var.