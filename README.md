# AWS Terraform Template

This project is designed for beginners. Feel free to open a PR or an issue.

---

## Table of Contents

<!-- toc -->
[P1: Terraform Strucure](https://laptrinhai.id.vn/blog/terraform-structure) \
[P2: What in main.tf](https://laptrinhai.id.vn/blog/what-in-main-tf)

<!-- tocstop -->

## Prerequisites

### 1. AWS Account
Create an AWS root account or use an IAM User with an Access Key already created.

### 2. Install AWS CLI
Install the AWS CLI by following the instructions here: [Installing or updating to the latest version of the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

### 3. Configure AWS CLI
Run the following command to configure your AWS CLI:

```bash
aws configure --profile <profile_name>
```

You will be prompted to enter configuration values such as your AWS Access Key and AWS Secret Access Key. You can obtain these from the IAM User's Security Credentials under "Access Keys." For more details, see [AWS CLI Configuration](https://docs.aws.amazon.com/cli/latest/reference/configure/).

### 4. Install Terraform CLI
Follow the detailed instructions to install Terraform CLI here: [Installing Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).

