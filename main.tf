variable "infra_data_organization" {}
variable "infra_data_workspace" {}
variable "DEV_ACCESS_KEY_ID" {}
variable "DEV_SECRET_ACCESS_KEY" {}
variable "region" {}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = var.infra_data_organization
    workspaces {
      name = var.infra_data_workspace
    }
  }
}


provider "aws" {
  region     = var.region
  access_key = var.DEV_ACCESS_KEY_ID
  secret_key = var.DEV_SECRET_ACCESS_KEY
}


module "s3-module" {
  source  = "app.terraform.io/JAJA-DATA-DEV/s3-module/aws"
  version = "1.0.0"
  # insert required variables here
  bucket_name   = "babak-bucket"
  bucket_region = "eu-west-1"
}