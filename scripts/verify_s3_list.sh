#!/bin/bash
# Script to verify listing of S3 bucket files using read-only role

source /c/devops-ec2-automation/config/env_config.env

if [[ -z "$S3_BUCKET_NAME" ]]; then
  echo "S3_BUCKET_NAME not set in env_config.env"
  exit 1
fi

echo "Listing objects in s3://$S3_BUCKET_NAME ..."

aws s3 ls s3://$S3_BUCKET_NAME/