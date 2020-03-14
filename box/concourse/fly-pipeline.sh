#!/usr/bin/env bash

echo -n "Enter Vault Password (ctrl+c to CANCEL):"
read -s vaultPassword


VAULT_BACKEND=secret/dep
export VAULT_ADDR=https://p-cf-vault.hcscint.net:8200
export no_proxy=t-cf-vault.test.hcscint.net,$no_proxy
export NO_PROXY=t-cf-vault.test.hcscint.net,$NO_PROXY

echo "logging into vault"
vault login -method=ldap  username=CHANGEME password=$vaultPassword


if [ $? -eq 0 ]
then
  echo "Provided Vault yml file."
  stty -echo
  vault read -format=yaml -field=data -address=$VAULT_ADDR $VAULT_BACKEND/mobile > credentials.yml
  ./run-pipelines.sh

  touch credentials_template.yml
  cp credentials_template.yml credentials.yml
  rm credentials.yml
  stty echo

else
  mv credentials_template.yml credentials.yml
  echo "Provided Vault password is incorrect."
  stty echo
  exit 1
fi
