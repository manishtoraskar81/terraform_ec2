terraform {
  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.89.0"
    }
  }

  backend "s3" {
    bucket  = "atlantis-state-mt"
    key     = "prod/ec2/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    #dynamodb_table       = "infra-iac-lock-table"
    #assume_role          = {
    #  role_arn = "arn:aws:iam::385764924434:role/infra-iac"
    #}
    #workspace_key_prefix = "oi-projects-bal"
  }

}


provider "aws" {
  #alias = "account_nonprod"
  region = var.aws_region

  #assume_role {
  #  role_arn = format("arn:aws:iam::%s:role/infra-iac-account-worker", var.account_id)
  #}

}
