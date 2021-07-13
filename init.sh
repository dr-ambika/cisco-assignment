#!/bin/bash

if [ ! -f mykey ];then
  ssh-keygen -f mykey -N ''
fi
terraform init
terraform apply -auto-approve
