#!/bin/bash

kubectl exec -n vault vault-0 -- vault operator init -key-shares=1 -key-threshold=1 -format=json > ./keys/init-keys.json
VAULT_UNSEAL_KEY=$(cat ./keys/init-keys.json | jq -r ".unseal_keys_b64[]")
echo "VAULT_UNSEAL_KEY ${VAULT_UNSEAL_KEY}"  > ./keys/VAULT_UNSEAL_KEY.txt

VAULT_ROOT_TOKEN=$(cat ./keys/init-keys.json | jq -r ".root_token")
echo "VAULT_ROOT_TOKEN ${VAULT_ROOT_TOKEN}" > ./keys/VAULT_ROOT_TOKEN.txt

echo "Unseal Vault running on the vault-0"
kubectl -n vault exec vault-0 -- vault operator unseal $VAULT_UNSEAL_KEY >> ./logs/vault.log