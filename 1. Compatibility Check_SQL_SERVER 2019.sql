--****************************************************************
--*** 1. Check database compatibility level it should be 150 
--****************************************************************
   SELECT * FROM sys.databases 

--****************************************************************
--*** 2. change database compatibility level
--****************************************************************
ALTER DATABASE WideWorldImporters SET COMPATIBILITY_LEVEL =150

