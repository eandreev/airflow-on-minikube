# A Helm Chart for Running Airflow Using CeleryExecutor on Minikube

This Helm chart can be used to run Airflow on Kubernetes in Minukube.

It is loosely based on the [GoDataDriven Airflow chart](https://github.com/godatadriven/airflow-helm) and [docker-compose-CeleryExecutor.yml](https://github.com/puckel/docker-airflow/blob/master/docker-compose-CeleryExecutor.yml) from the [puckel/docker-airflow](https://github.com/puckel/docker-airflow) Docker image github repo.

Please note that this chart is not intended for production use. Among other things, it does not use secrets to conceal passowords.

## Getting started

Install [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/).

Install [Helm](https://helm.sh/docs/using_helm/).

Start minikube:

```bash
$ minikube start --memory=8192
```

Initialize Helm inside the minikube instance:

```bash
$ helm init --history-max 200
```

Create directories for volumes that will store dag and log files:

```bash
$ minikube ssh

minikube$ sudo mkdir /data/{dags,logs}
minikube$ sudo chown 1000:100 /data/{dags,logs}
minikube$ logout
```

Install the chart:

```bash
$ helm install --namespace "airflow" --name "airflow" airflow
```

Proxy Airflow's web UI to http://localhost:8080/

```bash
$ kubectl port-forward svc/airflow-web 8080:8080 --namespace=airflow
```
Proxy Flower's web UI to http://localhost:5555/

```bash
kubectl port-forward svc/airflow-flower 5555:5555 --namespace=airflow
```
