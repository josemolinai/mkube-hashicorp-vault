#!/bin/bash

VAULT_UNSEAL_KEY=$(cat ./keys/init-keys.json | jq -r ".unseal_keys_b64[]")
echo "VAULT_UNSEAL_KEY ${VAULT_UNSEAL_KEY}"  > ./keys/VAULT_UNSEAL_KEY.txt

VAULT_ROOT_TOKEN=$(cat ./keys/init-keys.json | jq -r ".root_token")
echo "VAULT_ROOT_TOKEN ${VAULT_ROOT_TOKEN}" > ./keys/VAULT_ROOT_TOKEN.txt

# Login to Vault running on the vault-0
kubectl -n vault exec vault-0 -- vault login $VAULT_ROOT_TOKEN  >> ./logs/vault.log

echo "Configuring PKI secrets engine"
echo "Configuring the max lease time-to-live (TTL) to 8760h."
kubectl -n vault exec vault-0 -- vault secrets enable pki && vault secrets tune -max-lease-ttl=8760h pki >> ./logs/vault.log
