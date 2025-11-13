USE maintain;
CALL create_partition_by_month('maintain', 'jtt808_position');
CALL create_partition_by_month('maintain', 'jtt808_alarm');

USE cbus;
CALL create_partition_by_month('gps', 'device_position');
CALL create_partition_by_month('gps', 'device_depart_arrive');
CALL create_partition_by_month('gps', 'device_alarm');
