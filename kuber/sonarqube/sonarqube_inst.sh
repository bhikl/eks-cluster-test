#!/bin/bash

helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube
helm repo update
kubectl create namespace ci
helm upgrade --install -n ci sonarqube sonarqube/sonarqube
kubectl apply -f lb.yaml -n ci