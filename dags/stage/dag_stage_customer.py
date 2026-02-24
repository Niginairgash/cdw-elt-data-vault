from airflow import DAG
from airflow.operators.empty import EmptyOperator
from airflow.operators.python import PythonOperator
from airflow.utils.task_group import TaskGroup
from datetime import datetime 


with DAG (
  dag_id = "dag_stage_customer",
  start_date = datetime(2024,1,1),
  schedule_interval = '@daily',
  catchup = False
) as dag:

  start = EmptyOperator(task_id = "start")
  
  with TaskGroup("stg_customer") as stg_group:
    stg_ddl = PythonOperator(task_id = 'stage_ddl')
      
    
  end = EmptyOperator(task_id = "end")
  start >> end




  
