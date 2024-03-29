## Getting Started with Data Warehousing and BI Analytics
- Data Warehouse
    - Data warehouse is a system that aggregates data from one or more sources into a single consistent data store to support data analytics (data mining, ai, ml, front-end reporting, OLAP)
    - Who uses data warehouses?
        - Retail and e-Commerce (analyze sales performance, create ml shop recommendations)
        - Transportation
        - Medical (apply ai to assist with diagnosis and treatment)
        - Banking (including fin-tech)
        - Social media (measure customer sentiment and project product sales)
        - Government (analyze and evaluate citizen-focused programs and assist with policy change decisions)
    - Benefits of a data warehouse (Better data quality → Faster business insights → Smarter decisions)
        - Centralizes data from disparate sources
        - Creates a single source of truth
        - Leverages all the data while enhancing speed to access
        - Facilitates smarter decisions using BI
- Data Warehouse Systems
    - Data warehouse systems categorization
        - Appliances: Oracle Exadata, IBM Netezza, Amazon RedShift
        - Cloud only: Snowflake, Google BigQuery
        - On premises and cloud: Microsoft Azure Synapse Analytics, Teradata Vantage, IBM Db2 Warehouse, Vertica
    - Evaluating data warehouse systems
        - Features and capabilities: security, data privacy requirements, speed, architecture and structure (vendor-specific architecture, multicloud installation, scalable, supported data types)
        - Compatibility and implementation: governance, data migration, transformation capabilities, optimization, user management, notifications and reports
        - Ease of use and skills: staff implementation skills, vendor or implementation partner’s data warehouse implementation skills, technical and engineering staff front-end and administration skills for querying/reporting/visualization tools
        - Support: consolidated support benefits, service-level agreements, convenient support contact methods, self-service solutions and a rich user community
        - Costs (Cost of ownership / TCO): infrastructure, software licensing, cloud services, data migration and integration, administration, support and maintenance
- Data Marts
    - Data marts (Sales, Finance, Marketing, Enterprise, Warranty, Manufacturing, Shipping) are used to:
        - Provide support for tactical decision-making
        - Help end users focus only on relevant data
        - Save time otherwise spent searching the data warehouse for answers
    - Data mart structure
        - Relational database
        - Start or snowflake schema
        - Central fact table of business metrics
        - Surrounded by associated dimension tables
    - Types of data marts
        - Dependent data marts: draw data from the enterprise warehouse - inherit security from the EDW, use cleaned and transformed data
        - Independent: bypass the data warehouse and are created directly from sources - require custom ETL data pipelines, may require additional security measures
        - Hybrid: depend partially on the data warehouse
    - Data mart purpose: provide timely/relevant data, rapid query responses, cost efficiency, secure access
- Data Lakes
    - Data lake is a data repository of raw data straight from the source that could store large amounts of structured, semi-structured, and unstructured data in their native format. Data can be loaded without defining the structure or schema of data and use cases do not need to be known in advance.
    - Data lake is a reference architecture that combines multiple technologies. Could be deployed using cloud object storage, large-scale distributed systems, relational databse management systems, NoSQL data repositories.
    - Data lake benefits
        - Handles all types of data: unstructured, semi-structured, structured
        - Scalable storage capacity
        - Saves time that would have been used to define structures, create schemas, and transform data
        - Can quickly repurpose data for a wide range of use cases
    - Vendors for data lakes: Amazon, Microsoft, Oracle, Cloudera, Google, IBM, Snowflake, Informatica, Teradata, Zaloni, SAS
    - Data lakes vs Data warehouses
        - Data lake
            - Data: loaded in its raw and unstructured form
            - Schema: no need to define schema prior to loading
            - Data quality: any data that might or might not be curated, data is agile and might not comply with governance guidelines
            - Users: data scientists, data developers, and business analysts using curated data
        - Data warehouses
            - Data: has been processed prior to loading
            - Schema: schema need to be designed prior to loading
            - Data quality: data is curated and follows data governance practices
            - Users: business analysts, data analysts
- Data Warehouse Architecture
    - Data warehouse architecture details depend on use cases
        - Report generation and dashboarding
        - Exploratory data analysis
        - Automation and machine learning
        - Self-serve analytics
    - Cubes, Rollups, and Materialized Views and Tables
        - Data Cube: Coordinates = dimensions, Cells = facts (provide summary reports)
            - Slicing: reduces cube dimension
            - Dicing: shrinks a dimension
            - Drilling up and down: drills into subcategories within a dimension
            - Pivoting
            - Rolling up: summarizes a dimension, aggregates using COUNT, MIN, MAX, SUM, AVERAGE
        - Materialized Views: snapshot containing results of a query (faster query)
            - Used to replicate data in a staging database
            - Precompute expensive queries for a data warehouse
            - Automatically keep query results synced to database
            - Safely work without affecting source database
            - Can be set up for different refresh options: Never (populated on creation only), Upon request (manually or scheduled), Immediately (automatically, after every statement)
    - Data warehouse staging areas
        - A staging area is
            - Intermediate storage for ETL processing
            - Bridge between data sources and the target system
            - Sometimes transient
            - Sometimes held for archiving or troubleshooting
            - Used to optimize and monitor ETL jobs
        - Staging areas can be implemented as
            - Flat files + Python
            - SQL tables + Db2
            - Database + Cognos
        - Functions of a staging area: Integration, Change detection, Scheduling, Cleansing data, Aggregation, Normalization
        - Why use a staging area?
            - Separate location where data from source systems is extracted to
            - Decouples operations such as validation, cleansing and other processes
            - Minimizes corruption risk
            - Simplifies ETL workflows and recovery
    - Populating a data warehouse
        - Loading frequency
            - Initial load + periodic incremental loads
            - Full refreshes due to schema changes or catastrophic failure are rate
            - Fact tables need more frequent updating than dimension tables
            - City and store lists change slowly, unlike sales transactions
        - Typical ways of loading data
            - Db2 has a load utility that is faster than inserting a row at a time
            - Automate loading as part of your ETL pipeline using tools like Apache Airflow and Kafka
            - Use tools like Bash, Python, and SQL to build your data pipeline and schedule it with cron
            - InfoSphere DataStage allows you to compile and run jobs to load your data
        - Populating your data warehouse
            - Preparation: schema has been modeled, data has been staged
            - Setup and initial load: instantiate the data warehouse and its schema, create production tables, establish relations between tables, load your transformed and cleaned data
            - Ongoing loads: automate incremental loads using a script, incremental loading requires you to have a method to correctly detect new and changed data
- Data Quality Verification
    - Data verification is about
        - Managing data quality
        - Enhancing data reliability
    - Data verification provides you with
        - A complete and connected view of your organization
        - Data ready for advanced analysis
        - Statistical modeling and machine learning
    - Data quality concerns
        - Accuracy: source and destination records match, duplicated records, typos (out-of-range values, spelling errors), misalignment
        - Completeness: locating missing values (null fields, placeholders), locating mising data records due to system failures
        - Consistency: non-conformance to standard terms, date formatting, inconsistent data entry, inconsistent units
        - Currency: avoiding outdated informaton (updated addresses and name changes)
    - Managing data quality: Detect → Capture → Report, Investigate → Diagnose → Correct
        - Write SQL queries to detect and test for these conditions
        - Create rules for correcting and managing those conditions
        - Create a script that runs the data validation SQL queries every night
        - Automate the script created in last step that performs detection and correction processes
        - Review the automated report and address issues that could not be resolved automatically
    - Data quality solutions
        - IBM InfoSphere Server, & IBM Data Refinery
        - Information Data Quality
        - SAP Data Quality Management
        - SAS Data Quality
        - Talend Open Studio for Data Quality
        - Precisely Spectrum Quality
        - Microsoft Data Quality Services
- Data Modeling
    - Facts and Dimensional Modeling
        - Fact tables: facts of a business process, foreign keys to dimension tables, can contain detail level facts or facts that have been aggregated, summary tables contain aggregated facts
        - Dimensions: categorize facts, called categorical variables in stats and machine learning, used to answer business questions, used for filtering/grouping/labelling, dimension table stores dimensions of a fact
    - Star and Snowflake Schemas
        - Star schemas: graph whose edges are relations between facts and dimensions (used for data marts)
        - Snowflake schemas (normalized start schemas): dimension tables split into child tables, snowflakes don’t need to be fully normalized
- Data Warehouse Analytics
    - Analytics: the methodical compilation and dissection of data, statistics and operations research to build models that enable better decisions
    - Tools-revolutionizing analytics → process more data → faster processing, more accurate
        - Compute storage: available in larger sizes
        - Compute processors: work faster and can work simultaneously
        - Compute memory: faster
    - Analytics in action and results: insightful outcomes
        - Descriptive outcomes: what happened in the past
        - Prescriptive outcomes: what can happen in the future
        - Predictive outcomes: what should happen in the future
    - Business Intelligence (BI) tools: IBM Cognos Analytics (AI and NLP), Microsoft Power BI (security), Tableau (visualization), Oracle Analytics Cloud (conversational analytics), SAP Business Objects (smarter analytics), Tibco Spotfire (AI-infused visual analytics and custom analytics app creation)
        - Enable data preparation, mining, management, and visualization
        - Focus on the “what” and the “why”
        - Apply statistics and operations research
        - Harness the power of descriptive, diagnostic, predictive and prescriptive analytics
        - Dashboarding, reporting and self-serve analytics
        - Transform data into opportunity
