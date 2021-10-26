locals {
  workspace = var.workspace
}

terraform {
  required_version = ">= 0.15.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
    local = ">= 2.1.0"
  }
  backend "remote" {
    organization = "fillipinascimento"

    workspaces {
      name = "${locals.workspace}"
    }
  }
}

provider "aws" {
  region = "${locals.workspace}" == "production" ? "us-east-1" : "us-east-2"
}
