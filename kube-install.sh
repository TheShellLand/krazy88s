#!/bin/bash

# 
# Kubernetes setup script
#   I got tired of running these commands
#

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
# Install docker if you don't have it already.
apt-get install -y docker.io
apt-get install -y kubelet kubeadm kubectl kubernetes-cni

systemctl enable docker.service

kubeadm init --pod-network-cidr 10.244.0.0/16 | tee kubeadm-init.log

kubectl create -f https://raw.githubusercontent.com/projectcalico/canal/master/k8s-install/kubeadm/canal.yaml
kubectl create -f https://rawgit.com/kubernetes/dashboard/master/src/deploy/kubernetes-dashboard.yaml

echo "[*] End"
