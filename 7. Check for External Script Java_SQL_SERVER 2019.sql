--****************************************************************
--*** Check for External Scripts Enable (Python /Java/R) 
--****************************************************************
SELECT * FROM sys.configurations WHERE name= N'external scripts enabled'

--****************************************************************
--*** enable External Scripts Enable (Python /Java/R) 
--****************************************************************
EXEC sp_configure 'external scripts enabled', 1
RECONFIGURE WITH OVERRIDE
