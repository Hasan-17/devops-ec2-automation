#!/bin/bash
# Script to deploy Terraform infrastructure

cd "$(dirname "$0")/../terraform" || exit 1

terraform init
terraform apply -auto-approve