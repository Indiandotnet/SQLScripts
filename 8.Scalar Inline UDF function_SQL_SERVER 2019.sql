--****************************************************************
--***  User define inline function example 
--****************************************************************
Use WideWorldImporters
GO 
--****************************************************************
--*** 1.Create function 
--****************************************************************
DROP FUNCTION SalesPersonGrade
CREATE FUNCTION dbo.SalesPersonGrade(@SalesPersonId INT)
RETURNS VARCHAR(10)
AS 
BEGIN
  DECLARE @SalesGrade AS VARCHAR(10)
  DECLARE @TotalSales AS INT
  SELECT @TotalSales = COUNT(1) FROM Sales.Invoices WHERE SalespersonPersonID = @SalesPersonId
  IF (@TotalSales <5)
    SET @SalesGrade = 'Bronze'
  ELSE IF (@TotalSales >=5 AND @TotalSales <10)
    SET @SalesGrade = 'Silver'
  ELSE IF (@TotalSales >=10 AND @TotalSales <15)
    SET @SalesGrade = 'Gold'
  ELSE 
    SET @SalesGrade = 'Platinum'
  RETURN @SalesGrade 
END 

--****************************************************************
--*** 2.  Enable Scalar UDF Inline 
--****************************************************************

ALTER DatABASE  SCOPED CONFIGURATION  SET TSQL_SCALAR_UDF_INLINING = ON ;

--****************************************************************
--*** 2.  clear the cache before running 
--****************************************************************
ALTER DATABASE SCOPED CONFIGURATION CLEAR PROCEDURE_CACHE;

--****************************************************************
--*** 3. call simple statement  which call function to identity category 
--****************************************************************
SELECT FullName,EmailAddress, dbo.SalesPersonGrade(PersonId)as category FROM Application.People

--****************************************************************************
--*** 4.Now Check iteration  (see Blank :D)
--****************************************************************************
SELECT [function] = OBJECT_NAME([object_id]), execution_count 
  FROM sys.dm_exec_function_stats
  WHERE object_name(object_id) IS NOT NULL



--****************************************************************************
--*** 4.Enable TSQL_SCALAR_UDF_INLINE  and re run above statement 
--****************************************************************************
ALTER DatABASE  SCOPED CONFIGURATION  SET TSQL_SCALAR_UDF_INLINING = OFF ;
