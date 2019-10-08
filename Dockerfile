#FROM puckel/docker-airflow:1.10.4
FROM puckel/docker-airflow:1.10.0-5

USER root
RUN pip install kubernetes

#COPY subst.kubernetes_pod_operator.py /usr/local/lib/python3.7/site-packages/airflow/contrib/operators/kubernetes_pod_operator.py
COPY entrypoint.sh /entrypoint.sh

USER airflow
