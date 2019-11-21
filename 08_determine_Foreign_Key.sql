--***************************************************************
--** Description: Get Foreign Key List                          *
--** Name : Rajat  Jaiswal                                      *
--** Email: Rajatjai@gmail.com                                  *
--** TIP: 08                                                   *
--***************************************************************

--********************************************
-- 1. GET LIST OF using Sys.ForeignKeys 
--********************************************
GO
SELECT NAME,
OBJECT_NAME(Parent_Object_Id) As PrimaryTable,
object_Name(Referenced_Object_Id) As ReferenceTable,
create_Date
FROM sys.Foreign_Keys
WHERE type ='F'

GO

GO

