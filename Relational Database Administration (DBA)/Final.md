## Final Project

#### Task 1.1 - Find the settings in PostgreSQL
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/labs/Final%20Assignment/postgres-setup.sh  
bash postgres-setup.sh  
cd postgres/data  
cat postgresql.conf  
Maximum number of connections: 100

#### Task 1.2 - Create a User
CREATE USER backup_operator WITH PASSWORD 'backup_operator';

#### Task 1.3 - Create a Role
CREATE ROLE backup;

#### Task 1.4 - Grant privileges to the role
GRANT CONNECT ON DATABASE tolldata TO backup;  
GRANT SELECT ON ALL TABLES IN SCHEMA toll TO backup;

#### Task 1.5 - Grant role to an user
GRANT backup TO backup_operator;

##

#### Task 2.1 - Restore MySQL server using a previous backup
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/labs/Final%20Assignment/billingdata.sql  
mysql --host=127.0.0.1 --port=3306 --user=root --password=<your_password>  
create database billing;  
use billing;  
source billingdata.sql;  
SHOW FULL TABLES;

#### Task 2.2 - Find the table data size
SELECT TABLE_NAME, (data_length+index_length)/1024 AS DATA_SIZE_KB FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'billdata';

#### Task 2.3 - Baseline query performance
SELECT * FROM billdata WHERE billedamount > 19999;

#### Task 2.4 - Create an index
CREATE INDEX amount ON billdata(billedamount);

#### Task 2.5 - Document the improvement in query performance
SELECT * FROM billdata WHERE billedamount > 19999;

#### Task 2.6 - Find supported storage engines
SHOW ENGINES;

#### Task 2.7 - Find the storage engine of a table
SELECT TABLE_NAME, ENGINE FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'billdata';

##

#### Task 3.2 - Create a view named basicbilldetailswith the columns customerid, month, billedamount
CREATE VIEW basicbilldetails AS
SELECT CUSTOMERID, MONTH, BILLEDAMOUNT
FROM BILLING;

#### Task 3.3 - Baseline query performance
SELECT * FROM BILLING WHERE BILLEDAMOUNT = 19929;

#### Task 3.4 - Create an index
CREATE INDEX billingamount ON BILLING(BILLEDAMOUNT);

#### Task 3.5 - Document the improvement in query performance
SELECT * FROM BILLING WHERE BILLEDAMOUNT = 19929;

##

#### References from Lab:

https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/labs/PostgreSQL/Lab%20-%20User%20Management%20and%20Access%20Control/instructional-labs.md.html

https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/labs/PostgreSQL/Lab%20-%20Backup%20and%20Restore%20using%20PostgreSQL/Backup_Restore_postgreSQL.md.html

https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/labs/MySQL/Lab%20-%20Automate%20Backup%20in%20MySQL/AutomatingSQLTasks.md.html

https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/labs/MySQL/Lab%20-%20MySQL%20Storage%20Engines%20and%20System%20Tables/instructions.md.html
