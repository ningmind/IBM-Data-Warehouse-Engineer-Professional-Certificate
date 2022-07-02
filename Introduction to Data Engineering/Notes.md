- Modern Data Ecosystem
    - Key players
        - Data Engineer: extract, integrate, and organize data from disparate sources; clean, transform, and prepare data; design, store, and manage data in data repositories
        - Data Analyst: inspect and clean data for deriving insights; identify correlations, find patterns, and apply statistical methods to analyze and mine data; visualize data to interpret and present the findings of data analysis
        - Data Scientist: analyze data for actionable insights; create predictive models using Machine Learning and Deep Learning
        - Business Analyst and BI Analyst: Focus on market forces and external influences that shape their business; organize and monitor data on different business functions; explore data to extract insights and actionables that improve business performance
    - What is Data Engineering?
        - Collecting source data - extracting, integrating, and organizing data from disparate sources
        - Processing data - cleaning, transforming, and preparing data to make it usable
        - Storing data - for reliability and easy availability of data
        - Making data available to users securely
    - Data Engineer
        - Responsibility is to provide analytics-ready (accurate, reliable, complies to regulations) data to data consumers
    - Types of Data
        - Structured Data: has a well-defined structure, can be stored in well-defined schemas, can be represented in a tabular manner with rows and columns (e.g. SQL Databases, Online Transaction Processing, Spreadsheets, Online forms, Sensors GPS and RFID, Network and Web server logs)
        - Semi-Structured Data: has some organizational properties but lacks a fixed or rigid schema, cannot be stored in the form of rows and columns as in databases, contains tags and elements or metadata which is used to group data and organize it in a hierarchy (e.g. E-mails, XML and other markup languages, Binary executables, TCP/IP packets, Zipped files)
        - Unstructured Data: does not have easily identifiable structure, cannot be organized in a mainstream relational database in the form of rows and columns, does not follow any particular format sequence semantics or rules (e.g. Web pages, Social media feeds, Images in varied file formats, Video and Audio files, Documents and PDF files, PowerPoint presentations, Media logs, Surveys)
- Data Repositories, Data Pipelines, and Data Integration Platforms
    - Data Repository: data that has been collected, organized, and isolated
    - NoSQL Database: non-relational database design that provides flexible schemas for the storage and retrieval of data
        - Key-value store: store user session data and user preferences, make real-time recommendations and targeted advertising, and in-memory data caching (e.g. Redis, Memcached, DynamoDB)
        - Document Based: store each record and its associated data within a document, not suitable for complex query (e.g. MongoDB, DocumentDB, CouchDB, Cloudant)
        - Column Based: data is stored in cells grouped as columns of data instead of rows, not suitable for complex query (e.g. Cassandra, HBase)
        - Graph Based: work with connected data, great for social networks, real-time product recommendations, network diagrams, fraud detection and access management (e.g. Neo4J, CosmosDB)
- Data Warehouses, Data Marts, and Data Lakes
    - Data Warehouses
        - Top-tier: Client Front-End Layer (querying, reporting, and analyzing data)
        - Middle-tier: OLAP Server (process and analyze information coming from database servers)
        - Botton-tier: Database Servers (extracting data from different sources)
    - Benefits of cloud-based data warehouses
        - Lower costs
        - Limitless storage and compute capabilities
        - Scale on a pay-as-you-go basis
        - Faster disaster recovery
    - Data Marts
        - Sub-section of the data warehouse, built specifically for a particular business function, purpose, or community of users
        - Three types: dependent, independent, and hybrid
        - Purpose of a Data Mart: provide data to users that is most relevant to them when they need it, accelerate business processes, provide a cost and time efficient way in which data-driven decisions can be taken, improve end-user response time, and provide secure access and control
    - Data Lakes
        - Store large amounts of structured, semi-structured, and unstructured data in their native format
        - Data can be loaded without defining the structure and schema of data
        - Exist as a repository of raw data straight from the source, to be transformed based on the use case
        - Data is classified, protected, and governed, agile to scale based on storage capacity, and could repurpose data in several different ways and wide-ranging use cases
- Big Data Platforms
    - Elements: velocity, volume, variety, veracity, value
    - Processing tools
        - Hadoop: distributed storage and processing of large datasets across clusters of computers; provides a reliable, scalable, and cost-effective solution for storing data with no format requirements
        - HDFS (Hadoop Distributed File System): a storage system for big data that runs on multiple commodity hardware connected through a network; fast recovery from hardware failures, access to streaming data, accommodation of large data sets, portability
        - Hive: an open-source data warehouse software for reading, writing, and managing large data set files that are stored directly in either HDFS or other data storage systems
        - Spark: a general-purpose data processing engine designed to extract and process large volumes of data for a wide range of applications; has in-memory processing, provides interfaces for major programming languages, processes streaming data fast and complex analytics in real-time
- Data Platforms, Data Stores, and Security
    - Layers of a Data Platform Architecture
        - Data Ingestion/Collection: connect to data sources, transfer data to data platform, maintain information about the data (e.g. Data Flow, IBM Streams, Kafka)
        - Data Storage and Integration: store data for processing and long-term use, transform and merge extracted data, make data available for processing (e.g. IBM DB2, SQL Server, MySQL, Oracle, Google Cloud SQL)
        - Data Processing: read data in batch or streaming modes, support popular querying tools and programming languages, scale to meet the processing demands (e.g. Spreadsheets, Google DataPrep, python, R)
            - Transformation Tasks: structuring, normalization, denormalization, data cleaning
        - Analysis and User Interface: to data consumers, BI analysts, business stakeholders, data scientists and analysts, other applications and services (e.g. IBM Cognos Analytics, Tableau, Python and R libraries, Microsoft Power BI)
        - Data Pipeline (e.g. Apache Airflow, Google Data Flow)
    - Selecting and Designing Data Stores
        - A repository: database, data warehouse, data mart, big data store, data lake
        - Primary considerations: type of data, volume of data, intended use of data, storage considerations, privacy, security and governance needs
- Data Collection and Data Wrangling
    - How to Gather and Import Data
        - Using queries to extract data from SQL databases
        - Application Programming Interfaces (APIs)
        - Web Scraping
        - Sensor Data
        - Data Exchanges
    - Data Wrangling (Data Munging)
        - Data Exploration
        - Transformation: structuring, normalizing, denormalizing, cleaning
        - Validation
        - Making data available for credible and meaningful analysis
    - Tools for Data Wrangling: Excel/Spreadsheets, OpenRefine, Google DataPrep, Watson Studio Refinery, Python, R
- Querying Data, Performance Tuning, and Troubleshooting
    - Performance Metrics
        - Latency: time it takes for a service to fulfill a request
        - Failures: the rate at which a service fails
        - Resource utilization and utilization patterns
        - Traffic: number of user requests received in a given period
    - Troubleshooting
        - Collect information about the incident to ascertain if observed behavior is an issue
        - Check if you’re working with all the right versions of software and source codes
        - Check the logs and metrics early on in your troubleshooting process to isolate whether an issue is related to infrastructure, data, software, or a combination of these
        - Reproduce the issue in a test environment
    - Database Optimization for Performance
        - Capacity Planning
        - Database Indexing
        - Database Partitioning
        - Database Normalization