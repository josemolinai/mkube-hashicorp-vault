#!/bin/bash
set -o errexit

#The base image to use for docker/podman drivers. Intended for local development.
base_image="gcr.io/k8s-minikube/kicbase:v0.0.30@sha256:02c921df998f95e849058af14de7045efc3954d90320967418a0d1f182bbc0b2"

minikube start --profile='mkube-hashicorp-vault' --nodes=1 --base-image='${base_image}' --kubernetes-version='v1.23.4-rc.0' --memory='2g'
kubectl create namespace vault
