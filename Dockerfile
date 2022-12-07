FROM python:3.10

WORKDIR /dbt

RUN pip install dbt-postgres==1.2.0
