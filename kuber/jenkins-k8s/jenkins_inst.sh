#!/bin/bash

git clone git@github.com:bhikl/jenkins-k8s.git

kubectl create namespace ci
helm upgrade --install -n ci jenkins ./jenkins-k8s/helm/jenkins-k8s