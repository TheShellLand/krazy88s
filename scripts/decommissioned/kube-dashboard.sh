#!/bin/bash

# Install Kubernetes Dashboard
# https://github.com/kubernetes/dashboard

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
