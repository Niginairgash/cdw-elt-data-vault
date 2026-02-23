from airflow import DAG
from airflow.operators.empty import EmptyOperator
from airflow.utils.task_group import TaskGroup
from datetime import datetime 

with DAG(
  dag_id = "structure",
  start_date = datetime(2024,1,1),
  schedule_interval = '@daily',
  catchup = False ,
) as dag:

  start = EmptyOperator(task_id = "start")

  with TaskGroup("stage") as stage_group:
    stg_ddl = EmptyOperator(task_id = 'ddl')
    stg_load = EmptyOperator(task_id = 'load')
    stg_ddl >> stg_load

  with TaskGroup("core") as core_group:
    core_ddl = EmptyOperator(task_id = "ddl" )
    core_load = EmptyOperator(task_id = "load")
    core_ddl >> core_load

  with TaskGroup("business") as business_group:
    bs_ddl = EmptyOperator(task_id = "ddl")
    bs_load = EmptyOperator(task_id = "load")
    bs_ddl >> bs_load

  with TaskGroup("marts") as marts_group:
    mr_ddl = EmptyOperator(task_id = "ddl")
    mr_load = EmptyOperator(task_id = "load")
    mr_ddl >> mr_load

  end = EmptyOperator(task_id = "end")

  start >> stage_group >> core_group >> business_group >> marts_group >> end
