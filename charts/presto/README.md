# How to add catalog

1. base64 encode/decode on bing
2. add catalogs in values

# How to use it for SPDB
```sql
SELECT * FROM hive."default".t_user ;
SELECT * FROM postgresql.public."user" ;

SELECT a.*, b.firstname, b.lastname 
FROM hive."default".t_user AS a,
postgresql.public."user" AS b
WHERE a.id = b.id;
```

# How to use it for thingsboard
```sql
CREATE SCHEMA memory.iot_device_manager;

DROP VIEW IF EXISTS memory.iot_device_manager.device;
CREATE OR REPLACE VIEW memory.iot_device_manager.device AS
SELECT 
	CONCAT(
		SUBSTR(id, 8, 8),
		'-',
		SUBSTR(id, 4, 4),
		'-1',
		SUBSTR(id, 1, 3),
		'-',
		SUBSTR(id, 16, 4),
		'-',
		SUBSTR(id, 20)
	) AS _id, *
FROM mysql.iot_device_manager.device;

SELECT a.id, a.name, b.entity_id, b."key", b.long_v 
FROM 
memory.iot_device_manager.device AS a,
cassandra.iot_time_series.ts_kv_latest_cf AS b 
WHERE b.entity_id = a._id;

SELECT * FROM mysql.iot_device_manager.device LIMIT 10;
SELECT * FROM cassandra.iot_time_series.ts_kv_latest_cf LIMIT 10;
SELECT * FROM memory.iot_device_manager.device LIMIT 10;


CREATE SCHEMA memory.iot_time_series;

SELECT COUNT(1) FROM cassandra.iot_time_series.event;

DROP TABLE IF EXISTS memory.iot_time_series.event;
CREATE TABLE memory.iot_time_series.event AS

SELECT COUNT(1) FROM memory.iot_time_series.event;
```
