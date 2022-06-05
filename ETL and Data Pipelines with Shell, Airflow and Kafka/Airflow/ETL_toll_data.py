# import the libraries
from datetime import timedelta
# The DAG object; we'll need this to instantiate a DAG
from airflow import DAG
# Operators; we need this to write tasks!
from airflow.operators.bash_operator import BashOperator
# This makes scheduling easy
from airflow.utils.dates import days_ago

# Task 1.1 define DAG arguments
default_args = {
    'owner': 'Minyi',
    'start_date': days_ago(0),
    'email': ['minyi@somemail.com'],
    'email_on_failure': True,
    'email_on_retry': True,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# Task 1.2 define the DAG
dag = DAG(
    'ETL_toll_data',
    default_args=default_args,
    description='Apache Airflow Final Assignment',
    schedule_interval=timedelta(days=1),
)

# Task 1.3 create a task to unzip data
unzip_data = BashOperator(
    task_id='unzip_data',
    bash_command='curl https://cf-courses-data.s3.us.cloud-object-storage. \
    appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Final%20Assignment/tolldata.tgz \
    | tar -xz  -C /home/project/airflow/dags/finalassignment/staging',
    # Citation: $ sudo curl http://geolite.maxmind.com/download/geoip/database/
    # GeoLite2-Country.tar.gz | sudo tar -xz  -C /etc/nginx/
    dag=dag,
)

# Task 1.4 create a task to extract data from csv file
extract_data_from_csv = BashOperator(
    task_id='extract_data_from_csv',
    bash_command='cut -d"," -f1-4 /home/project/airflow/dags/finalassignment/staging/ \
    vehicle-data.csv > /home/project/airflow/dags/finalassignment/csv_data.csv',
    dag=dag,
)

# Task 1.5 create a task to extract data from tsv file
extract_data_from_tsv = BashOperator(
    task_id='extract_data_from_tsv',
    bash_command='cut -f5-7 /home/project/airflow/dags/finalassignment/staging/ \
    tollplaza-data.tsv > /home/project/airflow/dags/finalassignment/tsv_data.csv',
    dag=dag,
)

# Task 1.6 create a task to extract data from fixed width file
extract_data_from_fixed_width = BashOperator(
    task_id='extract_data_from_fixed_width',
    bash_command='cut -d# -f6-7 /home/project/airflow/dags/finalassignment/staging/ \
    payment-data.txt > /home/project/airflow/dags/finalassignment/fixed_width_data.csv',
    dag=dag,
)

# Task 1.7 create a task to consolidate data extracted from previous tasks
consolidate_data = BashOperator(
    task_id='consolidate_data',
    bash_command='paste /home/project/airflow/dags/finalassignment/csv_data.csv \
    /home/project/airflow/dags/finalassignment/tsv_data.csv \
    /home/project/airflow/dags/finalassignment/fixed_width_data.csv \
    > /home/project/airflow/dags/finalassignment/extracted_data.csv',
    dag=dag,
)

# Task 1.8 transform and load the data
transform_data = BashOperator(
    task_id='transform_data',
    bash_command='tr "[a-z]" "[A-Z]" < \
    /home/project/airflow/dags/finalassignment/extracted_data.csv > \
    /home/project/airflow/dags/finalassignment/staging/transformed_data.csv',
    dag=dag,
)

# Task 1.9 define the task pipeline
unzip_data >> extract_data_from_csv >> extract_data_from_tsv >> \
extract_data_from_fixed_width >> consolidate_data >> transform_data
