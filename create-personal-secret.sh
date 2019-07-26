#! /bin/bash

VAULT_ADDR=${VAULT_ADDR:=http://127.0.0.1:8200}

# Set and store required tokens
read -p "Enter root token provided by Vault: " ROOT_TOKEN
read -p "Enter your personal token retreived from web UI: " USER_TOKEN

# Retreive entity id
USER_ENTITY_ID=$(curl -s --header "X-Vault-Token: ${ROOT_TOKEN}" \
    --request LIST ${VAULT_ADDR}/v1/identity/entity/id \
    | jq -r '.data.keys[0]')

# Set secret key/value
read -p "Enter the key for your personal secret: " SECRET_KEY
read -p "Enter your secret value: " SECRET_VALUE

# Switch to user
vault login ${USER_TOKEN}

# Create secret in user personal space
vault kv put secret/${USER_ENTITY_ID} ${SECRET_KEY}=${SECRET_VALUE}

