--****************************************************************
--*** Accelerated Database Recovery 
--****************************************************************
Use WideWorldImporters
GO 
--****************************************************************
--*** 1.Check Accelerated database recovery status 
--****************************************************************
SELECT is_accelerated_database_recovery_on,* FROM sys.databases 

--****************************************************************
--*** 2. Disable feature 
--****************************************************************
ALTER  DATABASE WideWorldImporters SET ACCELERATED_DATABASE_RECOVERY = OFF;

--****************************************************************
--*** 3. run below query without rollback command
--****************************************************************

BEGIN TRANSACTION 
DECLARE @Counter INT
SET @Counter = 1
WHILE (@Counter <10)
BEGIN
  UPDATE sales.InvoiceLines
  SET ExtendedPrice = ExtendedPrice +1000
  SET @Counter = @Counter +1 
END

GO


--****************************************************************************
--*** 4.Now Rollback 
--****************************************************************************
ROLLBACK TRANSACTION

--****************************************************************************
--*** 4.Enable ADR  by disconnecting all the connection check recovery time 
--****************************************************************************
USE Master 
GO 
ALTER  DATABASE WideWorldImporters SET ACCELERATED_DATABASE_RECOVERY = ON;