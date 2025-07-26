#!/bin/bash
# Script to upload EC2 logs and app logs to S3 in ec2 use scp command
# scp -i  /c/Users/Public/devops.pem  /c/ec2-automation-s3-logs/scripts/upload_logs.sh ec2-user@<PUBLIC_IP>:/home/ec2-user
# scp -i  /c/Users/Public/devops.pem  /c/ec2-automation-s3-logs/config/env_config.env ec2-user@<PUBLIC_IP>:/home/ec2-user
source ~/env_config.env

if [[ -z "$S3_BUCKET_NAME" ]]; then
  echo "S3_BUCKET_NAME not set in env_config.env"
  exit 1
fi

# Upload cloud-init log
aws s3 cp /var/log/cloud-init.log s3://$S3_BUCKET_NAME/ec2-logs/$(hostname)-cloud-init.log

# Upload app logs (assuming your app log is at ~/test-repo-for-devops/app.log)
if [[ -f ~/test-repo-for-devops/app.log ]]; then
  aws s3 cp ~/test-repo-for-devops/app.log s3://$S3_BUCKET_NAME/app/logs/$(hostname)-app.log
fi