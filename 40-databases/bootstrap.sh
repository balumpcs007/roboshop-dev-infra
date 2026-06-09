#!/bin/bash

component=$1
environment=$2

if [ -z "$component" ] || [ -z "$environment" ]; then
  echo "ERROR: Usage: $0 <component> <environment>"
  exit 1
fi

dnf install ansible -y

REPO_URL=https://github.com/balumpcs007/ansible-roboshop-roles-tf.git
REPO_DIR=/opt/roboshop/ansible
ANSIBLE_DIR=ansible-roboshop-roles-tf

mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop/

cd $REPO_DIR || exit 1

if [ -d $ANSIBLE_DIR ]; then
  cd $ANSIBLE_DIR
  git pull
else
  git clone $REPO_URL
  cd $ANSIBLE_DIR
fi

ansible-playbook -e component=$component -e env=$environment main.yaml | tee /var/log/roboshop/ansible.log