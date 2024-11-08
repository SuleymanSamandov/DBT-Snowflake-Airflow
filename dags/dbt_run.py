from datetime import datetime,timedelta
import time
import datetime
from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator

default_args={
    "owner":'airflow',
    "depends_on_past":True,
    "star_date":datetime.datetime(2024,11,7),
    "retries":3,
    "retries_delay":datetime.timedelta(minutes=2)
}

with DAG(
    'dbt_project',
    description='ETL Project',
    wait_for_downstream=True,
    default_args=default_args,
    max_active_runs=2,
    max_active_tasks=2,
    catchup=True,
    schedule_interval=datetime.timedelta(minutes=2)


) as dag:
    dbt_run_src = BashOperator(
        task_id='dbt_run_src',
        bash_command='cd /opt/airflow/dags/project/project && dbt run --models models/src'
    )

    dbt_run_silver_dim = BashOperator(
        task_id='dbt_run_silver_dim',
        bash_command='cd /opt/airflow/dags/project/project && dbt run --models models/silver_dim'
    )

    dbt_run_silver_fact = BashOperator(
        task_id='dbt_run_silver_fact',
        bash_command='cd /opt/airflow/dags/project/project && dbt run --models models/silver_fact'
    )

    dbt_snapshot_gold = BashOperator(
        task_id='dbt_snapshot_gold',
        bash_command='cd /opt/airflow/dags/project/project && dbt snapshot --select snapshots/gold'
    )

    dbt_run_fact_gold = BashOperator(
        task_id='dbt_run_fact_gold',
        bash_command='cd /opt/airflow/dags/project/project && dbt run --models models/fact_gold'
    )

dbt_run_src >> dbt_run_silver_dim >> dbt_run_silver_fact >> dbt_snapshot_gold >> dbt_run_fact_gold