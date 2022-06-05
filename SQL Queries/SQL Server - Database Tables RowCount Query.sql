select schema_name(tab.schema_id) + '.' + tab.name as [table],
sum(part.rows) as [rows]
from sys.tables as tab
inner join sys.partitions as part
on tab.object_id = part.object_id
where part.index_id IN (1, 0) -- 0 - table without PK, 1 table with PK
group by schema_name(tab.schema_id) + '.' + tab.name
order by sum(part.rows) asc