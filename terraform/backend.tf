terraform {
  required_version = ">= 1.3"
  
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
    encrypt        = true
  }

}


provider "aws" {
  region = var.aws_region
}
