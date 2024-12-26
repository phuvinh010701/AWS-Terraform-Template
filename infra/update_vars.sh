#!/bin/bash

# if exits terraform.tfvars, remove it else create it
if [ -e "terraform.tfvars" ]; then
    rm terraform.tfvars
fi
touch terraform.tfvars

# update all variables
echo stage-name = \"$STAGE_NAME\" >> terraform.tfvars
echo aws-region = \"ap-northeast-1\" >> terraform.tfvars
echo aws-access-key = \"$AWS_ACCESS_KEY\" >> terraform.tfvars
echo aws-secret-key = \"$AWS_SECRET_KEY\" >> terraform.tfvars

# if exits cfbackend.tfvars, remove it else create it
if [ -e "cfbackend.tfvars" ]; then
    rm cfbackend.tfvars
fi
touch cfbackend.tfvars
echo bucket = \"$TERRAFORM_STATE_BUCKET_NAME\" >> cfbackend.tfvars