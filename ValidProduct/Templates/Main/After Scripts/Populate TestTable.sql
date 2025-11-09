/*
DECLARE @TableData VARCHAR(MAX) = '{{TestTableData}}'

insert dbo.testtable (datecreated, parentid, sometext, [status], testid)
  select datecreated, parentid, sometext, [status], testid
    from openjson(@tabledata) with (
      [datecreated] datetime '$.datecreated',
      [sometext] varchar(2000) '$.sometext',
      [parentid] uniqueidentifier '$.parentid',
      [testid] uniqueidentifier '$.testid',
      [status] tinyint '$.status'
      ) t
    where not exists (select * from {{testquerytoken}}.dbo.testtable tt where tt.testid = t.testid)
*/