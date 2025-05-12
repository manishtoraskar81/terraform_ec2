terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.89.0"
    }
  }

  backend "s3" {
    bucket         = "state-mt"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }

}


provider "aws" {
  region = var.aws_region
}
