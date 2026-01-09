import psycopg2
import pandas as pd
from datetime import datetime


source_conn_params = {
    'host': 'localhost',
    'port': 5432,
    'dbname': 'dvdrental',
    'user': 'airflow',
    'password': 'airflow'
}


target_conn_params = {
    'host': 'localhost',
    'port': 5432,
    'dbname': 'cdw-elt-data-vault',
    'user': 'airflow',
    'password': 'airflow'
}


source_query = "SELECT * FROM customer;"
with psycopg2.connect(**source_conn_params) as src_conn:
    df = pd.read_sql_query(source_query, src_conn)


df['load_dts'] = datetime.now()
df['record_source'] = 'dvdrental_source'


columns = [
    'customer_id', 'store_id', 'first_name', 'last_name', 'email',
    'address_id', 'activebool', 'create_date', 'last_update', 'active',
    'load_dts', 'record_source'
]

insert_query = """
INSERT INTO stage.stg_customer (
    customer_id, store_id, first_name, last_name, email,
    address_id, activebool, create_date, last_update, active,
    load_dts, record_source
)
VALUES %s
"""

from psycopg2.extras import execute_values

with psycopg2.connect(**target_conn_params) as tgt_conn:
    with tgt_conn.cursor() as cur:
        # execute_values для быстрой массовой вставки
        execute_values(cur, insert_query, df[columns].values.tolist())
        tgt_conn.commit()

print("Load to stg_customer completed!")
