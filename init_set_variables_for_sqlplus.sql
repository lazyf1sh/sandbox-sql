sqlplus

```
rem	Author:		Ivan Kopylov
rem This is my personal baseline of settings. After each script that modifies parameters, this one should be called



SET LINESIZE 32767
-- SET TRIMSPOOL ON otherwise every line in the spoolfile is filled up with blanks until the linesize is reached.
SET TRIMSPOOL ON
--SET TRIMOUT ON otherwise every line in the output is filled up with blanks until the linesize is reached.
SET TRIMOUT ON
--SET WRAP OFF Truncates the line if its is longer then LINESIZE. This should not happen if linesize is large enough.
SET WRAP OFF
--SET TERMOUT OFF -- suppresses the printing of the results to the output. The lines are still written to the spool file. This may accelerate the exectution time of a statement a lot.
SET TERMOUT ON
SET COLSEP |
SET PAGESIZE 100
--SET FEEDBACK ON Shows 'N rows selected.' after each query
SET FEEDBACK ON
SET AUTOCOMMIT ON
set HEADING ON
```
