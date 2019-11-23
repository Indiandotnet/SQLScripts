--***************************************************************
--** Description: Get MDF/LDF information                       *
--** Name : Rajat  Jaiswal                                      *
--** Email: Rajatjai@gmail.com                                  *
--** TIP: 09                                                   *
--***************************************************************

--********************************************
-- 1. GET MDF /LDF details of the database 
--********************************************
GO
GO
EXEC sp_MSforeachdb 'USE ?  Execute sp_helpFile'
GO


--*****************************************************************************************************
-- 2. GET File Location by Sys.Master_Files
--*****************************************************************************************************

SELECT *
From sys.master_Files


GO

--*****************************************************************************************************
-- 3. Specific detail of Ldf & Mdf 
--*****************************************************************************************************
select 
    d.name as 'database',
    mdf.physical_name as 'mdf_file',
    ldf.physical_name as 'log_file',
	(mdf.size*8)/1024 MdfSizeinMB,
	(ldf.size*8)/1024 ldfSizeinMB
from sys.databases d
inner join sys.master_files mdf on 
    d.database_id = mdf.database_id and mdf.[type] = 0
inner join sys.master_files ldf on 
    d.database_id = ldf.database_id and ldf.[type] = 1