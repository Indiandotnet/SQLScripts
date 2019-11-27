--***************************************************************
--** Description: Make Database as multiuser access             *
--** Name : Rajat  Jaiswal                                      *
--** Email: Rajatjai@gmail.com                                  *
--** TIP: 12                                                   *
--***************************************************************

--********************************************
-- 1. SEt multi user access
--********************************************
GO
ALTER DATABASE AdventureWorks
SET MULTI_USER  
WITH  NO_WAIT;
GO




--*****************************************************************************************************
-- Here NO_WAIT means not wait for statement with immediate response.
--*****************************************************************************************************

