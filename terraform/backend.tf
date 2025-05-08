terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.89.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }

}


provider "aws" {
  region = var.aws_region
}