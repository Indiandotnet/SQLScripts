--***************************************************************
--** Description: Get the list All the Coulums from a table     *
--** Name : Rajat  Jaiswal                                      *
--** Email: Rajatjai@gmail.com                                  *
--** TIP: 02                                                    *
--***************************************************************

--********************************************
-- 1. GET LIST OF using Sys.Columns 
--********************************************
SELECT st.name, sc.name,sc.is_identity AS IdentityColumn, 
sc.is_nullable AS NullableColumn,
sc.max_length as colmaxlength,
sty.name as columnType
FROM sys.columns sc
INNER JOIN sys.tables st ON st.object_id  = sc.object_id
INNER JOIN systypes sty on sty.xtype = sc.system_type_id 
ORDER By st.name,sc.name
GO

--********************************************
-- 1. GET LIST OF using Information Schema
--********************************************

SELECT TABLE_NAME,COLUMN_NAME,DATA_TYPE,
CHARACTER_MAXIMUM_LENGTH,
IS_NULLABLE 
FROM [INFORMATION_SCHEMA].[COLUMNS]
