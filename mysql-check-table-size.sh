     # Find size of single db
    SELECT table_schema "Database Name", SUM( data_length + index_length)/1024/1024
    "Database Size (MB)" FROM information_schema.TABLES where table_schema = '<db name here>';
    
     # All db 
     SELECT table_schema "Database Name", SUM(data_length+index_length)/1024/1024
     "Database Size (MB)"  FROM information_schema.TABLES GROUP BY table_schema;
     
     #check single table size
     SELECT table_name "Table Name", table_rows "Rows Count", round(((data_length + index_length)/1024/1024),2)
"Table Size (MB)" FROM information_schema.TABLES WHERE table_schema = "mydb" AND table_name ="table_one";
 
 
      #check all table size
      SELECT table_name "Table Name", table_rows "Rows Count", round(((data_length + index_length)/1024/1024),2)
"Table Size (MB)" FROM information_schema.TABLES WHERE table_schema = "mydb";
