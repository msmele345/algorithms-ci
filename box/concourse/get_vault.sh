#!/bin/bash

echo -n "Enter Vault Password (ctrl+c to CANCEL):"
read -s vaultPassword

VAULT_ADDR=https://p-cf-vault.hcscint.net:8200 ## replace with local docker image port
VAULT_BACKEND=secret/dep

echo "logging into vault"
vault login -method=ldap  username=dep_devops password=$vaultPassword


if [ $? -eq 0 ]
then
  echo "Provided Vault yml file."
  stty -echo
  vault kv get -format=yaml -field=data -address=$VAULT_ADDR $VAULT_BACKEND/mobile > secrets.yml
  stty echo

else
  mv credentials_template.yml secrets.yml
  echo "Provided Vault password is incorrect."
  stty echo
  exit 1
fi
