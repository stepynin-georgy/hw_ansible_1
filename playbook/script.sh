#!/bin/bash

path_docker="/opt/ansible_hw1/08-ansible-01-base/playbook/"

echo "What you need?"
echo "1. Run containers"
echo "2. Run ansible-playbook"
echo "3. Stop containers"

read VAR

if [ "$VAR" -eq "1" ]; then
  cd $path_docker
  docker compose build && docker compose up -d
elif [ "$VAR" -eq "2" ]; then
  cd $path_docker
  ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass
elif [ "$VAR" -eq "3" ]; then
  cd $path_docker
  docker compose down
fi