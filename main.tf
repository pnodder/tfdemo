terraform {
  # Terraform relies on plugins called providers to interact with cloud providers, SaaS providers, and other APIs.
  # Each provider adds a set of resource types and/or data sources that Terraform can manage.
  # Every resource type is implemented by a provider; without providers, Terraform can't manage any kind of infrastructure.
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs
  # https://cloud.google.com/docs/terraform/best-practices-for-terraform
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.2.0"
    }
  }

  required_version = "~> 1.0"
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

module "lambda" {
  source           = "./modules/lambda"
  s3_bucket_prefix = "tfdemo"
  name             = "tfdemo-lambda"
  log_retention    = 3
}