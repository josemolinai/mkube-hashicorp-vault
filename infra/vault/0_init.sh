#!/bin/bash

# creating certs
./create_cert.sh

# Create secret tls
kubectl -n vault create secret tls vault-ca-crt --cert ./cert/ca.crt --key ./cert/ca.key

# Install Vault
helm install -n vault  vault hashicorp/vault --values ./config/csi.yaml  --values ./config/global.yaml  --values ./config/injector.yaml  --values ./config/server.yaml  --values ./config/ui.yaml

echo "Waiting for running pods ...press control + C to continue"
kubectl -n vault get pods --watch