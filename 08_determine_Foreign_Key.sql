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
SELECT NAME As ForeignKeyName,
OBJECT_NAME(Parent_Object_Id) As PrimaryTable,
object_Name(Referenced_Object_Id) As ReferenceTable,
create_Date
FROM sys.Foreign_Keys
WHERE type ='F'

--*****************************************************************************************************
-- 2. GET LIST OF using ForeignKeys wuth more detail using sys.Foreign_keys and Foreign_key_column
--*****************************************************************************************************

SELECT 
   Keys.name As ForeignKeyName,
   OBJECT_NAME(Keys.parent_object_id) PrimaryTableName,
   COL_NAME(KeyColumn.parent_object_id,KeyColumn.parent_column_id) PrimaryTableColumnName,
   object_Name(Keys.Referenced_Object_Id) As ReferenceTable,
   COL_NAME(KeyColumn.referenced_object_id,KeyColumn.referenced_column_id) ReferenceTableColumnName
FROM sys.foreign_keys AS Keys
INNER JOIN sys.foreign_key_columns AS KeyColumn   ON Keys.OBJECT_ID = KeyColumn.constraint_object_id
INNER JOIN sys.tables t  ON t.OBJECT_ID = KeyColumn.referenced_object_id

GO

--*****************************************************************************************************
-- 2. GET LIST OF using Foreign keys wuth more detail using sys.INFORMATION_SCHEMA and Foreign_key_column
--*****************************************************************************************************

SELECT 
    tmpConstraintColumn.table_name AS PrimaryTable
    ,tmpConstraintColumn.constraint_name  As ForeignKeyName
    ,tmpConstraintColumn.column_name AS SecondaryTableColumn
    ,tmpKeyColumn.table_name AS SecondaryTable
    ,tmpKeyColumn.column_name AS SecondaryTable
FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE tmpConstraintColumn
    INNER JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS tmpReferential
        ON tmpConstraintColumn.CONSTRAINT_NAME = tmpReferential.CONSTRAINT_NAME 
    INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE tmpKeyColumn 
        ON tmpKeyColumn.CONSTRAINT_NAME = tmpReferential.UNIQUE_CONSTRAINT_NAME  


