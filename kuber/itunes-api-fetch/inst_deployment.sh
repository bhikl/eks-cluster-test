#!/bin/bash

kubectl create secret generic itunes-api-fetch-secret \
--from-literal=username=azionz  \
--from-literal=password=zino58lj0kdh \
--from-literal=address=$DB_ADR
echo $DB_ADR
kubectl apply -f deployment.yaml
kubectl apply -f np.yaml
kubectl apply -f ingress.yaml