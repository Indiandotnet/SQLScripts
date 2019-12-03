--***************************************************************
--** Description: Magic of Go Statement                         *
--** Name : Rajat  Jaiswal                                      *
--** Email: Rajatjai@gmail.com                                  *
--** TIP: 14                                                   *
--***************************************************************

--********************************************
-- 1. Go statement
--********************************************

 CREATE TABLE #tmpNumber (SerialNumber INT)
 GO
 

 INSERT INTO #tmpNumber ( SerialNumber)
 SELECT FLOOR(10000 * RAND())
GO 100

SELECT * FROM #tmpNumber

GO
DROP TABLE tempdb..#tmpNumber


