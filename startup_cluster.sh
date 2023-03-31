#!/bin/bash

DB_ADR=$(terraform output -raw db_address)
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name) --profile mfa
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl get deployment metrics-server -n kube-system
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.5.0/aio/deploy/recommended.yaml
kubectl apply -f kuber/system_conf/dashboard-rb.yaml
kubectl apply -f kuber/itunes-api-fetch/deployment.yaml
cd kuber/jenkins-k8s/
./jenkins_inst.sh
cd ../sonarqube
./sonarqube_inst.sh
kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"
kubectl proxy