from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
import psycopg2
import pandas as pd
from psycopg2.extras import execute_values

# -------------------------------
# 
# -------------------------------
SOURCE_CONN = {
    'host': 'localhost',
    'port': 5432,
    'dbname': 'dvdrental',
    'user': 'airflow',
    'password': 'airflow'
}

TARGET_CONN = {
    'host': 'localhost',
    'port': 5432,
    'dbname': 'cdw-elt-data-vault',
    'user': 'airflow',
    'password': 'airflow'
}

# -------------------------------
# 
# -------------------------------
TABLES = [
    'customer',
    'film',
    'actor',
    'address',
    'category',
    'city',
    'country',
    'film_actor',
    'film_category',
    'inventory',
    'language',
    'payment',
    'staff',
    'store',
    'rental'
]

# -------------------------------
# 
# -------------------------------
def load_table(table_name: str):
    print(f"Loading table: {table_name}")
    
   
    with psycopg2.connect(**SOURCE_CONN) as src_conn:
        df = pd.read_sql_query(f"SELECT * FROM {table_name};", src_conn)

    df['load_dts'] = datetime.now()
    df['record_source'] = f"{table_name}_source"

    
    columns = list(df.columns)

    # 4. Загружаем в Staging
    target_table = f"stage.stg_{table_name}"
    insert_query = f"""
    INSERT INTO {target_table} ({', '.join(columns)}) VALUES %s
    """

    with psycopg2.connect(**TARGET_CONN) as tgt_conn:
        with tgt_conn.cursor() as cur:
            execute_values(cur, insert_query, df[columns].values.tolist())
            tgt_conn.commit()
    
    print(f"Table {table_name} loaded successfully!")


# -------------------------------
# DAG
# -------------------------------
with DAG(
    dag_id='load_staging_tables',
    start_date=datetime(2026, 1, 7),
    schedule_interval='@daily',
    catchup=False,
    tags=['staging', 'dvdrental']
) as dag:

    tasks = []
    for table in TABLES:
        task = PythonOperator(
            task_id=f"load_{table}",
            python_callable=load_table,
            op_args=[table]
        )
        tasks.append(task)

    for i in range(len(tasks)-1):
        tasks[i] >> tasks[i+1]
