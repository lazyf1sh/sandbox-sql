
```
rem	Author:		Ivan Kopylov

col sysdt new_value sysdt_var
col myuser new_value myuser_var;
col myhost new_value myhost_var;
SELECT TO_CHAR(SYSDATE, 'yyyymmdd_hh24miss') sysdt FROM DUAL;
SELECT user myuser FROM DUAL;
SELECT UTL_INADDR.get_host_name myhost FROM dual;
DEFINE LOGFILE=spooldata\&&myhost_var.___&&myuser_var.___&&sysdt_var..log
spool &&LOGFILE
```

