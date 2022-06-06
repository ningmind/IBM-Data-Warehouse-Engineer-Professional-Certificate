## [Hands-on Lab] Getting Started with Data Warehousing and BI Analytics
#### Lab: Create Db2 service instance and Get started with the Db2 console  
https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Sign%20up%20for%20IBM%20Cloud%20-%20Create%20Db2%20service%20instance%20-%20Get%20started%20with%20the%20Db2%20console/instructional-labs.md.html?origin=www.coursera.org

#### Lab: Create the schema on the data warehouse  
Step 1: Start the postgresql server.  
start_postgres  
Step 2: Create the database on the data warehouse.  
createdb -h localhost -U postgres -p 5432 billingDW  
Step 3: Download the schema .sql file.  
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Working%20with%20Facts%20and%20Dimension%20Tables/star-schema.sql  
Step 4: Create the schema.  
psql -h localhost -U postgres -p 5432 billingDW < star-schema.sql  

#### Lab: Setting up a staging area  
Step 1: Start the postgresql server.  
start_postgres  
Step 2: Create Database.  
createdb -h localhost -U postgres -p 5432 billingDW  
Step 3: Download the schema files.  
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Setting%20up%20a%20staging%20area/billing-datawarehouse.tgz  
tar -xvzf billing-datawarehouse.tgz  
Step 4: Create the schema.  
psql  -h localhost -U postgres -p 5432 billingDW < star-schema.sql  
Step 5: Load data into DimCustomer table.  
psql  -h localhost -U postgres -p 5432 billingDW < DimCustomer.sql  
Step 6: Load data into DimMonth table.  
psql  -h localhost -U postgres -p 5432 billingDW < DimMonth.sql  
Step 7: Load data into FactBilling table.  
psql  -h localhost -U postgres -p 5432 billingDW < FactBilling.sql  
Step 8: Run a sample query.  
psql  -h localhost -U postgres -p 5432 billingDW < verify.sql  

#### Lab: Verifying Data Quality for a Data Warehouse  
Step 1: Start the postgresql server.  
start_postgres  
Step 2: Download the staging area setup script.  
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Verifying%20Data%20Quality%20for%20a%20Data%20Warehouse/setup_staging_area.sh  
Step 3: Run the setup script.  
bash setup_staging_area.sh  
Step 4: Download the testing framework.  
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Verifying%20Data%20Quality%20for%20a%20Data%20Warehouse/dataqualitychecks.py  
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Verifying%20Data%20Quality%20for%20a%20Data%20Warehouse/dbconnect.py  
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Verifying%20Data%20Quality%20for%20a%20Data%20Warehouse/mytests.py  
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Verifying%20Data%20Quality%20for%20a%20Data%20Warehouse/generate-data-quality-report.py  
ls  
Step 5: Install the python driver for Postgresql.  
pip install psycopg2  
Step 6: Test database connectivity.  
python3 dbconnect.py  
Step 7: Create a sample data quality report.  
python3 generate-data-quality-report.py  
```
test1={
  "testname":"Check for nulls",
  "test":check_for_nulls,
  "column": "monthid",
  "table": "DimMonth"
}
test2={
  "testname":"Check for min and max",
  "test":check_for_min_max,
  "column": "monthid",
  "table": "DimMonth",
  "minimum":1,
  "maximum":12
}
test3={
  "testname":"Check for valid values",
  "test":check_for_valid_values,
  "column": "category",
  "table": "DimCustomer",
  "valid_values":{'Individual','Company'}
}
test4={
  "testname":"Check for duplicates",
  "test":check_for_duplicates,
  "column": "monthid",
  "table": "DimMonth"
}
```
#### Lab: Populating a Data Warehouse  
Step 1: We add the database, host, port and the security mode details.  
db2cli writecfg add -database BLUDB -host 0c77d6f2-5da9-48a9-81f8-86b520b87518.bs2io90l08kqb1od8lcg.databases.appdomain.cloud -port 31198 -parameter "SecurityTransportMode=SSL"  
Step 2: We give a name to the data source we just created.  
db2cli writecfg add -dsn production -database BLUDB -host 0c77d6f2-5da9-48a9-81f8-86b520b87518.bs2io90l08kqb1od8lcg.databases.appdomain.cloud -port 31198  
Step 3: Verify a db2cli dsn. (change user and pw)  
db2cli validate -dsn production -connect -user jrg38634 -passwd SuWySBe5Y4MsYnh9  
Step 4: Download the schema file.  
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Populating%20a%20Data%20Warehouse/star-schema.sql  
Step 5: Create the schema on production data warehouse. (change user and pw)  
db2cli execsql -dsn production -user jrg38634 -passwd SuWySBe5Y4MsYnh9 -inputsql star-schema.sql  
Step 6: Download the data files.  
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Populating%20a%20Data%20Warehouse/DimCustomer.sql  
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Populating%20a%20Data%20Warehouse/DimMonth.sql  
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Populating%20a%20Data%20Warehouse/FactBilling.sql  
Step 7: Load the data in the data warehouse. (change user and pw)  
db2cli execsql -dsn production -user jrg38634 -passwd SuWySBe5Y4MsYnh9 -inputsql DimCustomer.sql  
db2cli execsql -dsn production -user jrg38634 -passwd SuWySBe5Y4MsYnh9 -inputsql DimMonth.sql  
db2cli execsql -dsn production -user jrg38634 -passwd SuWySBe5Y4MsYnh9 -inputsql FactBilling.sql  
Step 8: Download the verification sql file.  
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Populating%20a%20Data%20Warehouse/verify.sql  
Step 9: Verify the data in the data warehouse. (change user and pw)  
db2cli execsql -dsn production -user jrg38634 -passwd SuWySBe5Y4MsYnh9 -inputsql verify.sql  
Step 10: Work with db2cli interactive command line. (change user and pw)  
db2cli execsql -dsn production -user jrg38634 -passwd SuWySBe5Y4MsYnh9  
select count(*) from DimMonth;  

#### Lab: Querying the Data Warehouse  
https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Querying%20the%20Data%20Warehouse%20-Cubes,%20Rollups,%20Grouping%20Sets%20and%20Materialized%20Views/Querying%20the%20Data%20Warehouse%20-Cubes,%20Rollups,%20Grouping%20Sets%20and%20Materialized%20Views.md.html?origin=www.coursera.org  

#### Lab: Getting Started with Cognos Analytics  
https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DV0130EN-SkillsNetwork/Hands-on%20Labs/Lab%204%20-%20Getting%20Started%20with%20Cognos%20Analytics/instructions.md.html?origin=www.coursera.org  

#### Lab: Different Methods for Creating Dashboard Visualizations with Cognos Analytics  
https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DV0130EN-SkillsNetwork/Hands-on%20Labs/Lab%205%20-%20Different%20Methods%20for%20Creating%20Dashboard%20Visualizations%20with%20Cognos%20Analytics/instructions.md.html?origin=www.coursera.org  

#### Lab: Advanced Dashboard Capabilities in Cognos Analytics  
https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DV0130EN-SkillsNetwork/Hands-on%20Labs/Lab%206%20-%20%20Advanced%20Dashboard%20Capabilities%20in%20Cognos%20Analytics/instructions.md.html?origin=www.coursera.org  

#### Lab: Analyzing DB2 Data With Cognos Analytics  
https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/AnalyzingDataWithCognos/HandsOn_DB2CognosAnalytics.md.html?origin=www.coursera.org  
