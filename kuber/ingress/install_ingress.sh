#!/bin/bash

git clone https://github.com/nginxinc/kubernetes-ingress.git --branch v3.1.0

cd kubernetes-ingress/deployments/
kubectl apply -f common/ns-and-sa.yaml
kubectl apply -f common/default-server-secret.yaml
kubectl apply -f common/nginx-config.yaml
kubectl apply -f rbac/rbac.yaml
kubectl apply -f common/ingress-class.yaml
kubectl apply -f deployment/nginx-ingress.yaml
kubectl apply -f service/loadbalancer-aws-elb.yaml
cd ../../
