# Deploy Hashicorp Vault into k8s Minikube cluster


## Prerequisites
- [docker](https://docs.docker.com/engine/install/ubuntu/)
- [minikube](https://minikube.sigs.k8s.io/docs/start/)
- [helm](https://helm.sh/)
- [jq](https://stedolan.github.io/jq/download/)


## Initialize the environment
- ./0_init.sh
- ./1_start_cluster.sh

## Deploy Vault
- cd infra/vault
- ./0_init.sh
- ./1_unseal.sh
- ./2_configure.sh


## Clean Deployment
- cd infra/vault
- ./clean.sh


## Destroy cluster
- ./9_destroy_cluster.sh