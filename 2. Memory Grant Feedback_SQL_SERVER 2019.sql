--****************************************************************
--*** Memory Grant Feedback 
--****************************************************************
Use WideWorldImporters
GO 
--****************************************************************
--*** 1.Change compatiblity to 130 or previous 
--****************************************************************
ALTER DATABASE WideWorldImporters SET COMPATIBILITY_LEVEL = 130

--****************************************************************
--*** 2. check compatiblity LEVEL
--****************************************************************
SELECT cmptlevel FROM sysdatabases Where name = 'WideWorldImporters'

--****************************************************************
--*** 3. Run query with actual plan		
--****************************************************************
SELECT 
  sorder.CustomerID,
  sorder.CustomerPurchaseOrderNumber,
  sorder.InternalComments,
  sorderLine.Quantity,
  sorderLine.UnitPrice,
  sorderLine.TaxRate
FROM [Sales].[Orders] sorder
INNER JOIN [Sales].[OrderLines] sorderLine
ON sorder.OrderID = sorderLine.OrderID
ORDER BY sorder.[Comments]
--****************************************************************************
--*** 4.Change compatiblity to 150 (SQL SERVER 2019) and re run above query  *
--****************************************************************************
ALTER DATABASE WideWorldImporters SET COMPATIBILITY_LEVEL = 150

--************************************************************************************************
--*** 5.if you want to disable memory grant then I don't think you will but below is the command *
--************************************************************************************************
 ALTER DATABASE SCOPED CONFIGURATION SET DISABLE_BATCH_MODE_MEMORY_GRANT_FEEDBACK = ON;