from airflow import DAG
from airflow.operators.empty import EmptyOperator
from airflow.operators.python import PythonOperator
from airflow.providers.postgres.hooks.postgres import PostgresHook

from datetime import datetime

def extract():
    pass


def load():
    pass

with DAG(
    dag_id = "training_day_6",
    start_date = datetime(2024,1,1),
    schedule_interval = None,
) as dag:
    start = EmptyOperator(task_id = "start")

    extract = PythonOperator(
        task_id = "extract",
        python_callable = extract
    )

    load = PythonOperator(
        task_id = "load",
        python_callable = load
    )


    end = EmptyOperator(task_id = "end")

    start >> extract >> load >> end
