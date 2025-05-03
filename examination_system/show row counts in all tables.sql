SELECT 
    t.name AS TableName,
    s.name AS SchemaName,
    p.rows AS RowCounts
FROM 
    sys.tables t
JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
JOIN 
    sys.partitions p ON t.object_id = p.object_id
WHERE 
    p.index_id IN (0, 1) -- 0=Heap, 1=Clustered
ORDER BY 
    RowCounts DESC;