from __future__ import annotations

from datetime import datetime

from airflow import DAG
from airflow.operators.bash import BashOperator


with DAG(
    dag_id="dragons_smoke",
    description="Smoke test inicial del entorno Dragons.",
    start_date=datetime(2026, 1, 1),
    schedule=None,
    catchup=False,
    tags=["dragons", "smoke"],
) as dag:
    check_context = BashOperator(
        task_id="check_context",
        bash_command="echo 'Dragons Airflow environment is ready'",
    )

    check_context
