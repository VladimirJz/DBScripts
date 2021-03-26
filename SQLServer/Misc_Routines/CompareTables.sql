SET @Par_TableSource ='TMP1'
SET @Par_TableTarget ='TMP2'

exec COMPARETABLES 'TMP1', 'TMP2','Col1'

GO
drop PROCEDURE  if exists [dbo].[COMPARETABLES]
go
create PROCEDURE [dbo].[COMPARETABLES] ( @Par_TableSource varchar(50),  
                                         @Par_TableTarget varchar(50) ,
                                         @Par_KeyField  varchar(50)

                                        )
WITH EXEC AS CALLER
AS
BEGIN 
SET NOCOUNT ON
DECLARE @Var_ColDataType varchar(20)
DECLARE @Var_ColumnID INT
DECLARE @Var_NumDiff INT
DECLARE @Var_SQL nvarchar(500)
DECLARE @Var_SQLParams nvarchar(500)
DECLARE @Var_ColumNames     VARCHAR(max)

DECLARE @Var_ColumnName     Varchar(50)

DECLARE @Var_StructSource TABLE
(
    ColumnID int,
    ColumnName varchar(50),
    Datatype varchar(10) 
)

/*
DECLARE @Var_StructTarget TABLE
(
    ColumnID int,
    ColumnName varchar(50),
    Datatytpe varchar(10) 
) -- this can be deleted  (unused)

*/


drop table if exists TMPRESULTS
CREATE TABLE TMPRESULTS
(
    RowID int,
    MessageText varchar(220),
    ColumnName varchar(50),
    Detail varchar(500)

)





-- create a copy of databases and add a internal key (ID)
drop table if exists TMPTABLESOURCE
SET @Var_SQL='SELECT TOP 0 * INTO TMPTABLESOURCE from ' + @Par_TableSource
execute sp_executesql @Var_SQL

drop table if exists TMPTABLETARGET
SET @Var_SQL='SELECT TOP 0 * INTO TMPTABLETARGET from ' + @Par_TableTarget
execute sp_executesql @Var_SQL

IF(@Par_KeyField='')
    BEGIN
    Alter table TMPTABLESOURCE ADD RowID INT IDENTITY(1,1)
    Alter table TMPTABLETARGET ADD RowID INT IDENTITY(1,1)
    END


SET @Var_ColumNames= ( SELECT STRING_AGG(concat('[',COLUMN_NAME,']'),',') 
                                            FROM INFORMATION_SCHEMA.COLUMNS
                                            WHERE TABLE_NAME = @Par_TableSource )


-- copy data

SET @Var_SQL= 'insert into TMPTABLESOURCE ( ' + @Var_ColumNames +' ) select '+ @Var_ColumNames + ' from '+ @Par_TableSource
execute sp_executesql @Var_SQL
SET @Var_SQL= 'insert into TMPTABLETARGET ( ' + @Var_ColumNames +' ) select '+ @Var_ColumNames + ' from '+ @Par_TableTarget
execute sp_executesql @Var_SQL


IF(@Par_KeyField='')
    BEGIN
    create index idx_SourceID on TMPTABLESOURCE(RowID)
    create index idx_TargetID on TMPTABLESOURCE(RowID)
    END



 -- To compare Datatype and length  (TODO)
-- /*CONCAT(DATA_TYPE,''-'',coalesce(CHARACTER_MAXIMUM_LENGTH,NUMERIC_PRECISION))*/
SET @Var_SQL='select ORDINAL_POSITION,COLUMN_NAME,DATA_TYPE from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME=@Var_NombreTabla'
SET @Var_SQLParams='@Var_NombreTabla VARCHAR(50)'
insert into @Var_StructSource execute sp_executesql @Var_SQL, @Var_SQLParams, @Var_NombreTabla=@Par_TableTarget

/*
SET @Var_SQL='select ORDINAL_POSITION,COLUMN_NAME,CONCAT(DATA_TYPE,''-'',coalesce(CHARACTER_MAXIMUM_LENGTH,NUMERIC_PRECISION)) from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME=@Var_NombreTabla'
SET @Var_SQLParams='@Var_NombreTabla VARCHAR(50)'
insert into @Var_StructTarget execute sp_executesql @Var_SQL, @Var_SQLParams, @Var_NombreTabla=@Par_TableTarget
*/
-- 2:38

select * from  @Var_StructSource


        SELECT @Var_ColumnID = COUNT(*) FROM @Var_StructSource ;

        WHILE @Var_ColumnID > 0
        BEGIN
            -- print @Var_ColumnID
            SET @Var_ColumnName=(select top 1 ColumnName from @Var_StructSource  )
            SET @Var_ColDataType=(select top 1 Datatype from @Var_StructSource  )
            
            print @Var_ColumnName
            IF(@Var_ColDataType='decimal')
            BEGIN
            SET @Var_SQL='insert into TMPRESULTS select tgt.RowID,''El valor del campo no coincide'',PARSENAME('''   + @Var_ColumnName + ''',1), concat(tgt.'+@Var_ColumnName +','' != '', src.' + @Var_ColumnName +')  ' 
                       IF(@Par_KeyField='') -- si no se proporciona una tabla
                            BEGIN
                            SET @Var_SQL+='from TMPTABLESOURCE  src inner join  TMPTABLETARGET tgt on src.RowID=tgt.RowID ' 
                            END
                        ELSE
                            BEGIN
                            SET @Var_SQL+='from TMPTABLESOURCE  src inner join  TMPTABLETARGET tgt on src.'+ @Par_KeyField +'=tgt.'+@Par_KeyField 
                            END
                        
                        SET @Var_SQL+= 'where src.' + @Var_ColumnName+ '<> tgt.' + @Var_ColumnName  
            END
            -- print @Var_SQL
            execute sp_executesql @Var_SQL


            DELETE TOP (1) FROM @Var_StructSource
            -- select * from @Var_StructSource
            SELECT @Var_ColumnID = COUNT(*) FROM @Var_StructSource;
        END -- 



select * from TMPRESULTS

END


