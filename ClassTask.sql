

select 'public '+ COLUMN_NAME +' {get;set;}' from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME ='Employees' and TABLE_SCHEMA='dbo' 



select 'public '+ DATA_TYPE+' ' + + COLUMN_NAME +' { get; set; }' 

from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME ='Employees' and TABLE_SCHEMA='dbo'


select 'public '+ IIF(DATA_TYPE='nvarchar' or DATA_TYPE='nchar' or DATA_TYPE='ntext' ,'string',
                  IIF(DATA_TYPE='int','int',DATA_TYPE))+' ' + + COLUMN_NAME +' { get; set; }' 

from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME ='Employees' and TABLE_SCHEMA='dbo'



-- Correct Query

SELECT 
CASE
WHEN 
   DATA_TYPE='nvarchar' or 
   DATA_TYPE='ntext' or 
   DATA_TYPE='nchar' or  
   DATA_TYPE='text' or  
   DATA_TYPE='varchar' or
   DATA_TYPE='char'
   and IS_NULLABLE='NO' then 'public string?  '+COLUMN_NAME+ ' { get; set; }'
when 
    DATA_TYPE='nvarchar'  or 
	DATA_TYPE='ntext' or 
	DATA_TYPE='nchar' or  
	DATA_TYPE='text' or  
	DATA_TYPE='varchar' or
   DATA_TYPE='char'
	and IS_NULLABLE='YES' then 'public string  '+COLUMN_NAME+ ' { get; set; }=null!;'

when 
     DATA_TYPE = 'int' or 
	 DATA_TYPE = 'smallint' or
	 DATA_TYPE = 'bigint'
	 and IS_NULLABLE='NO' then  'public int?  '+COLUMN_NAME+ ' { get; set; }'

when 
     DATA_TYPE = 'int' or 
	 DATA_TYPE = 'smallint' or
	 DATA_TYPE = 'bigint'
	and IS_NULLABLE='Yes' then  'public int  '+COLUMN_NAME+ ' { get; set; }=null!;'

when 
    DATA_TYPE='date' or 
	DATA_TYPE='datetime' or 
	DATA_TYPE='datetimeoffset'
	and IS_NULLABLE='NO' then  'public DateTime?  '+COLUMN_NAME+ ' { get; set; }'

when 
    DATA_TYPE='date' or 
	DATA_TYPE='datetime' or 
	DATA_TYPE='datetimeoffset'
	and IS_NULLABLE='Yes' then  'public DateTime  '+COLUMN_NAME+ ' { get; set; }=null!;'

when 
    DATA_TYPE='image' or
	DATA_TYPE='FILESTREAM ' or
	DATA_TYPE='binary '
	and IS_NULLABLE='NO' then  'public Byte[]?  '+COLUMN_NAME+ ' { get; set; }'

	when 
    DATA_TYPE='image' or
	DATA_TYPE='FILESTREAM ' or
	DATA_TYPE='binary '
	and IS_NULLABLE='Yes' then  'public Byte[]  '+COLUMN_NAME+ ' { get; set; }=null!;'
end  as ' '
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME ='Employees' and TABLE_SCHEMA='dbo'