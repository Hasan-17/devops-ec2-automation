# EC2 Automation Assignment 2: S3 Logging & Infrastructure

## Overview

Automates the setup of an S3 bucket for log archival and provisions AWS resources using shell scripts and Terraform. The workflow includes infrastructure setup, log upload, and verification of S3 bucket contents.

---

## Prerequisites

- **AWS Account** with necessary permissions
- **AWS CLI** configured with credentials
- **Terraform** ([Download](https://www.terraform.io/downloads.html))
- **Bash** (Linux/macOS or WSL/Windows)

---

## Project Structure

```
scripts/                # Shell scripts for automation
  setup_infra.sh
  upload_logs.sh
  verify_s3_list.sh
config/                 # Environment configuration files
  env_config.env
  secret.env
terraform/              # Terraform configuration
  main.tf
  outputs.tf
  provider.tf
  variables.tf
  terraform.tfstate         # Auto-generated
  terraform.tfstate.backup  # Auto-generated
```

---

## Setup Instructions

1. **Clone this repository**
    ```sh
    git clone https://github.com/Hasan-17/devops-ec2-automation.git
    cd devops-ec2-automation
    ```

2. **Configure AWS Credentials**
    - Set environment variables in `config/secret.env`

3. **Edit configuration files**
    - Update `config/env_config.env` with your AWS region, bucket name, etc.

---

## Usage

### 1. Provision Infrastructure with Terraform

```sh
cd terraform
terraform init
terraform apply
```
- Review Terraform files for resource details
- Confirm creation when prompted

### 2. Upload Logs

```sh
cd ../scripts
./upload_logs.sh
```
- Uploads local logs to your S3 bucket

### 3. Verify S3 Bucket Contents

```sh
./verify_s3_list.sh
```
- Lists logs in your S3 bucket

---

## Cleanup

To destroy all resources:

```sh
cd ../terraform
terraform destroy
```

---

## Troubleshooting

- Check AWS credentials and permissions if CLI commands fail
- Ensure environment variables in `env_config.env` are correct
- For Terraform errors, use `terraform plan` to debug

---

## Notes

- All scripts are Bash; make sure they are executable (`chmod +x scriptname.sh`)
- **Never commit AWS secrets or sensitive data**
- `.gitignore` is set up to avoid pushing sensitive files
