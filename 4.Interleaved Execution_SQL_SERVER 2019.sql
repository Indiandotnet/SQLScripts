--****************************************************************
--*** Interleaved Execution 
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
--*** 3. Create below function which return table 		
--****************************************************************

CREATE FUNCTION dbo.GetInvoiceDetail(@quantity INT)
RETURNS @tblInvoiceDetail TABLE(InvoiceLineID INT, InvoiceID INT, 
    Quantity INT, Total DECIMAL)
WITH SCHEMABINDING
AS
BEGIN
  INSERT @tblInvoiceDetail
  SELECT InvoiceLineID, InvoiceID, Quantity, ExtendedPrice
  FROM Sales.InvoiceLines
  WHERE Quantity > @quantity
  RETURN
END;
GO

--****************************************************************
--*** 4. call the function in below query with query plan
--****************************************************************

SELECT tmp.InvoiceLineID, tmp.Quantity, tmp.Total, invoice.InvoiceDate
FROM dbo.GetInvoiceDetail(50) tmp
INNER JOIN Sales.Invoices invoice  ON invoice.InvoiceID = tmp.InvoiceID
WHERE tmp.Total > 1000;


--****************************************************************************
--*** 4.Change compatiblity to 150 (SQL SERVER 2019) and re run above query  *
--****************************************************************************
ALTER DATABASE WideWorldImporters SET COMPATIBILITY_LEVEL = 150
