provider "aws" {
  access_key  = var.aws-access-key
  secret_key  = var.aws-secret-key
  region      = var.aws-region
  max_retries = 1
}

terraform {
  backend "s3" {
    key    = "terraform/terraform.tfstate"
    region = "ap-northeast-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.76.0"
    }
  }
}

module "VPC" {
  source     = "./VPC"
  stage-name = var.stage-name
  aws-region = var.aws-region
}