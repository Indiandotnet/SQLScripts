--****************************************************************
--*** Batch Mode on Row Store 
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
--*** 3. run below query with query plan and check cluster index scan 
--****************************************************************

SELECT InvoiceID,
       SUM(Quantity) As TotalQuantity,
	   SUM(TaxAmount) As TotalTaxAmount,
	   SUM(LineProfit) As TotalProfit,
	   SUM(ExtendedPrice) AS TotalExtendPrice
FROM Sales.InvoiceLines
Group BY InvoiceID

GO


--****************************************************************************
--*** 4.Change compatiblity to 150 (SQL SERVER 2019) and re run above query  *
--****************************************************************************
ALTER DATABASE WideWorldImporters SET COMPATIBILITY_LEVEL = 150
