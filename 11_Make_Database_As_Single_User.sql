--***************************************************************
--** Description:Make Database as single User                   *
--** Name : Rajat  Jaiswal                                      *
--** Email: Rajatjai@gmail.com                                  *
--** TIP: 11                                                   *
--***************************************************************

--********************************************
-- 1. Make database as single user
--********************************************
GO
ALTER DATABASE AdventureWorks
SET SINGLE_USER  
WITH  ROLLBACK IMMEDIATE;
GO

--*****************************************************************************************************
-- Here ROLLBACK IMMEDIATE  means if any transaction going on by other user then Rollback that data.
--*****************************************************************************************************
