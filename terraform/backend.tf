terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.89.0"
    }
  }

  backend "s3" {
    bucket         = "state-mt"
    key            = "prod/ec2/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = false
  }

}


provider "aws" {
  region = var.aws_region
}
