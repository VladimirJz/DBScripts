DECLARE @Var_ColumnID INT
DECLARE @Var_NumDiff INT
DECLARE @Var_TablaOrigen VARCHAR(50)
DECLARE @Var_TablaDestino VARCHAR(50)
DECLARE @Var_SQL nvarchar(500)
DECLARE @Var_SQLParams nvarchar(500)
DECLARE @Var_ColumNames     VARCHAR(max)
DECLARE @Var_ColumnName     Varchar(50)
DECLARE @Var_StructSource TABLE
(
    ColumnID int,
    ColumnName varchar(50),
    Datatytpe varchar(10) 
)

DECLARE @Var_StructTarget TABLE
(
    ColumnID int,
    ColumnName varchar(50),
    Datatytpe varchar(10) 
)


SET @Var_TablaOrigen ='TMP1'
SET @Var_TablaDestino ='TMP2'
drop table if exists TMPRESULTS
CREATE TABLE TMPRESULTS
(
    RowID int,
    MessageText varchar(220),
    ColumnName varchar(50),
    Detail varchar(500)

)




drop table if exists TMPTABLESOURCE
SET @Var_SQL='SELECT TOP 0 * INTO TMPTABLESOURCE from ' + @Var_TablaOrigen
execute sp_executesql @Var_SQL

drop table if exists TMPTABLETARGET
SET @Var_SQL='SELECT TOP 0 * INTO TMPTABLETARGET from ' + @Var_TablaDestino
execute sp_executesql @Var_SQL

Alter table TMPTABLESOURCE ADD RowID INT IDENTITY(1,1)
Alter table TMPTABLETARGET ADD RowID INT IDENTITY(1,1)



SET @Var_ColumNames= ( SELECT STRING_AGG(concat('[',COLUMN_NAME,']'),',') 
                                            FROM INFORMATION_SCHEMA.COLUMNS
                                            WHERE TABLE_NAME = @Var_TablaOrigen )



SET @Var_SQL= 'insert into TMPTABLESOURCE ( ' + @Var_ColumNames +' ) select '+ @Var_ColumNames + ' from '+ @Var_TablaOrigen
execute sp_executesql @Var_SQL
SET @Var_SQL= 'insert into TMPTABLETARGET ( ' + @Var_ColumNames +' ) select '+ @Var_ColumNames + ' from '+ @Var_TablaDestino
execute sp_executesql @Var_SQL

create index idx_SourceID on TMPTABLESOURCE(RowID)
create index idx_TargetID on TMPTABLESOURCE(RowID)


 -- To compare Datatype and length  (TODO)

SET @Var_SQL='select ORDINAL_POSITION,COLUMN_NAME,CONCAT(DATA_TYPE,''-'',coalesce(CHARACTER_MAXIMUM_LENGTH,NUMERIC_PRECISION)) from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME=@Var_NombreTabla'
SET @Var_SQLParams='@Var_NombreTabla VARCHAR(50)'
insert into @Var_StructSource execute sp_executesql @Var_SQL, @Var_SQLParams, @Var_NombreTabla=@Var_TablaDestino


SET @Var_SQL='select ORDINAL_POSITION,COLUMN_NAME,CONCAT(DATA_TYPE,''-'',coalesce(CHARACTER_MAXIMUM_LENGTH,NUMERIC_PRECISION)) from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME=@Var_NombreTabla'
SET @Var_SQLParams='@Var_NombreTabla VARCHAR(50)'
insert into @Var_StructTarget execute sp_executesql @Var_SQL, @Var_SQLParams, @Var_NombreTabla=@Var_TablaDestino

2:38

-- select * from  @Var_StructSource


        SELECT @Var_ColumnID = COUNT(*) FROM @Var_StructSource ;

        WHILE @Var_ColumnID > 0
        BEGIN
            print @Var_ColumnID
            SET @Var_ColumnName=(select top 1 ColumnName from @Var_StructSource  )
            print @Var_ColumnName
            SET @Var_SQL='insert into TMPRESULTS select tgt.RowID,''El valor del campo no coincide'',PARSENAME('''   + @Var_ColumnName + ''',1), concat(tgt.'+@Var_ColumnName +','' != '', src.' + @Var_ColumnName +')  from TMPTABLESOURCE  src inner join  TMPTABLETARGET tgt on src.RowID=tgt.RowID ' + 
                        'where src.' + @Var_ColumnName+ '<> tgt.' + @Var_ColumnName  
            -- print @Var_SQL
            execute sp_executesql @Var_SQL


            DELETE TOP (1) FROM @Var_StructSource
            -- select * from @Var_StructSource
            SELECT @Var_ColumnID = COUNT(*) FROM @Var_StructSource;
        END -- 



select * from TMPRESULTS


select count(*) from TMP2
select count(*)  from TMP1




/*




        DECLARE @Var_ColumnID INT;
        SELECT @Var_ColumnID = COUNT(*) FROM @Var_StructSource ;

        WHILE @Var_ColumnID > 0
        BEGIN
         (select ColumnName from  @Var_StructSource where ColumnID=@Var_ColumnID)

            SET @Var_SQL = (Select concat('select * from @Var_StructSource Src inner join @Var_StructSource Tgt on Src.',ColumnName,'=Tgt.',ColumnName,'  and ')
                            from @Var_StructSource where ColumnID=@Var_ColumnID)
            execute sp_executesql @Var_SQL,
            
            SELECT @Var_ColumnID = @Var_ColumnID-1;
        END --  del while

-- Todo: Validaciones Numero de campos, nombre de campos

37 min */
2:38 min




