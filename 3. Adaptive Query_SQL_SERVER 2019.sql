--****************************************************************
--*** Adaptive Query 
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
   sorderLine.Quantity,
   sorderLine.UnitPrice
FROM [Sales].[Orders] sorder  
INNER JOIN [Sales].[OrderLines] sorderLine
ON sorder.OrderID = sorderLine.OrderID
WHERE sorderLine.Quantity> 50
--****************************************************************************
--*** 4.Change compatiblity to 150 (SQL SERVER 2019) and re run above query  *
--****************************************************************************
ALTER DATABASE WideWorldImporters SET COMPATIBILITY_LEVEL = 150
