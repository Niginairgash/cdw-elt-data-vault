from airflow import DAG
from airflow.operators.empty import EmptyOperator
from airflow.operators.python import PythonOperator

from datetime import datetime 

def stage():
  pass

def core():
  pass

def business():
  pass

def marts():
  pass


with DAG(
  dag_id = "structure",
  start_date = datetime(2024,1,1),
  schedule_interval = '@daily',
  catchup = False ,
) as dag:

  start = EmptyOperator(task_id = "start")

  stage_task  = PythonOperator(task_id = "load_stage", python_callable = stage)
  core_task  = PythonOperator(task_id = "load_core", python_callable = core)
  business_task  = PythonOperator(task_id = "load_business", python_callable = business )
  marts_task  = PythonOperator(task_id = "load_marts", python_callable = marts)

  end = EmptyOperator(task_id = "end")

  start >> stage_task >> core_task >> business_task >> marts_task >> end
