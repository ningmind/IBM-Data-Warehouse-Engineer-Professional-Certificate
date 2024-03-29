## Relational Database Administration (DBA)
- Database Management - Database Life Cycle
    - Requirement Analysis: understand purpose and scope of the database, work with stakeholders (analyze need and clarify goals for database, identify users)
    - Design and Plan: work with database objects (instances, databases, tables, indexes), database modelling, capacity planning
    - Implementtion: create and configure database objects, grant access for database users/groups, automate repeating tasks, deploy data movement
    - Monitoring and Maintenance: monitor system for performance issues, review reports, apply upgrades and patches to RDBMSes, automate deployments and routine tasks, troubleshoot issues, security and compliance
- Server Objects and Hierarchy
    - Database hierarchy
        - Instance: logical boundary for databases/objects/configuration, provides unique database server environment, allows isolation between databases
        - Database
        - Schema: organize database objects, default schema is the user schema, system schemas contain database configuration information
        - Database objects: create and manage with graphical tools/scripting/APIs
    - Common database objects: tables, constraints, indexes, keys, views, aliases, events, triggers, log files
    - System objects
        - Store database metadata in special objects
        - Known as system database, system schema, catalog, or dictionary
        - Query to retrieve data
    - Configuration files
        - Set configuration parameters during installation
        - Save into files: Configuration, Initialization
        - Common configuration settings: location of data files and log files, port the server listens on
        - Configure database
            - On-premises: stop the database service, modify the configuration file, restart the database service
            - Cloud-based: use graphical tools or APIs to modify the setting, database scales dynamically
    - Plan database storage
        - Determin capacity to plan for growth
        - Scale cloud storage easily
        - Plan storage for performance
        - Physical storage separated from the logical database design
    - Tablespace benefits: separate logical database storage from physical storage
        - Performance: optimize, place a heavily used files on fast media
        - Recoverability: make backup and restore operations more convenient
        - Storage management: extend the datafiles or containers as required
- Backup and Restore Databases
    - Backup and restore scenarios
        - Saving a copy of data for protection
        - Recovering from data loss (after unplanned shutdown, accidental deletion, data corruption)
        - Move to a different database system
        - Share data with business partners
        - Use a copy of the data (e.g. dev or test)
    - Physical vs logical backups
        - Physical backup: copy of physical files including logs and configuration, smaller and quicker, less granular, can only restore to similar RDBMS, common for specialized storage and cloud
        - Logical backup: contains DDL and DML commands to recreate database, can reclaim wasted space, slow and may impact performance, granular, backup/restore/import/export/dump/load utilities
    - Backup
        - What to backup: Database, Schema, Tables, Subset of data, Other objects
        - Key considerations: check that your backup is valid, check that your restore plan works, ensure that your back up files are secure
        - Backup options: Compression (reduces size for storage and transmission, increases time for backup and restore processes), Encryption (reduces the risk of data being compromised, increases time for backup and restore processes)
        - Types of backup
            - Full backups: backs up all the specified data, multiple copies of the backup means storing many instances of a large file, only storing one copy risks data loss if file is corupt, must secure backup files
            - Point-in-time backups: uses logged transactions to restore to an earlier point-in-time
            - Differential backups: a copy of any data that has changed since the last full backup was taken
            - Incremental backups: a copy of any data that has changed since the last backup of any type was taken
        - Hot backup (taken while data is in use) and Cold backup (data is offline)
        - Managed cloud backups options: preconfigured automated backup, configurable automated backup, manual backups, third party tools
- Security and User Management
    - Server Security
        - On-premise servers: Who has access? How are they physically secured?
        - Managed cloud: Check provider documentation
    - RDBMS Configuration
        - Regular patching
        - Review and use system-specific security features
        - Reduce the number of administrators
    - Authentication
        - Similar to PIN for cell phone and password for computer
        - Verifies that the user is who they clain to be (e.g. validating username and password)
        - External authentication methods: PAM, Window login IDs, LDAP
        - Authorized to access: Objects, Data
        - Grant privileges to: Users, Groups, Roles
    - Encryption
        - Addes another layer of security: intruders need to decrypt
        - Industry & regional regulations: algorithms, key management
        - Performance impact
        - Why encrypt your data?
            - Another layer in security system, often last line of defense
            - Can protect data: at rest, during transmission
            - May be required by: industry, region, customer
        - Symmetric encryption: same key to encrypt and decrypt (e.g. AES, DES), key is shared with all users, increased likelihood of compromise
        - Asymmetric encryption: uses two keys, one public to encrypt and one private to decrypt (e.g. RSA, ECC), must store private keys securely
        - Transparent data encryption: encryption and key management, not visible to users, database engine encrypts and decrypts data, also encrypts backups
- Monitoring and Optimization
    - What is database monitoring?
        - Critical part of database management
        - Scrutinization of day-to-day operational database status
        - Crucial to maintain RDBMS health and performance
    - Why monitor your databases？
        - Regular database monitoring helps identify issues in a timely manner
        - RDBMSs offer tools to observe database state and track performance
    - Proactive Monitoring (contract to Reactive monitoring for after-issue address)
        - Prevents reactive panic by identifying issues before they grow larger
        - Observes specific database metrics and sends alerts if values reach abnormal levels
        - Uses automated processes
        - Best strategy and preferred by most database admins
    - Database monitoring options
        - Point-in-time (manual): monitor table functions, examine monitor elements and metrics, lightweight/high-speed monitoring infrastructure
        - Historical (automated): event monitors, capture info on database operations
    - Key database metrics: database throughput, database resource usage, database availability, database responsiveness, database contention, units of work, connections, most-frequent queries, locked objects, stored procedures, buffer pools, top consumers
    - Monitoring tools
        - Db2: Db2 Data Management Console, Workload manager, Snapshot monitors
        - PostgreSQL: pgAdmin dashboard (downloadable open-source tool)
        - MySQL: MySQL Workbench (Performance Dashboard, Performance Reports, Query Statistics), MySQL Query Profiler
    - Optimization
        - MySQL: OPTIMIZE TABLE (or phpMyAdmin)
        - PostgreSQL: VACUUM, REINDEX
        - Db2: RUNSTATS, REORG TABLE/INDEX
- Troubleshooting and Automation
    - Common problems
        - Performance: inadequate hardware, server or database configuration, network connectivity, queries and application logic
        - Configuration: client configuration, server configuration, database configuration
        - Connectivity: database server cannot be reached, database instance is not running, client login credentials or security are incorrect, client configuration is incorrect
    - Using logs for troubleshooting
        - Diagnostic logs provide chronological records of events and errors in a particular component or application and can be used for troubleshooting problems
        - Types of diagnostic logs: device logs, server logs, network logs, operating system logs, database logs, application logs
    - Automating database tasks
        - Identifying automated tasks
            - Leverages unattended processes and self-updating procedures
            - Fewer deployment errors/higher reliablility and speed
            - Enables staff to focus on more important tasks and coding
            - Ideal tasks to automate are time-consuming and repetitive ones
        - Automated database task examples: database health check, trace file cleanup, typical automated database tasks, alert log file cleanup, data dictionary statistics, database configuration check, typical automated database tasks, schema object check, routine daily tasks
        - Advantages
            - Increate consistency of outputs or results
            - Free up staff to perform other activities
            - Provide higher-level jobs in automated processes
    - Automating reports and alerts
        - Reports
            - Health status of databases
            - Address issues/problems
            - Keep track of trends over time
            - Predict future needs
            - Regular schedule: daily, weekly, or monthly
        - Notifications: bring an event to the DBA’s attention, raise awareness of specific events, display on dashboards or sent through email
        - Automate reports: configure content and frequency, use a simple report, configure through graphical interfact/command line/script
