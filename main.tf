terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.11"
    }
  }
}

provider "aws" {
  region = var.region
}

module "iam" {
  source = "./iam"

  inputs = {
    config = {
      account_id = var.account_id
      region     = var.region
    }
  }
}

module "lambda" {
  source = "./lambda"

  depends_on = [module.iam]

  inputs = {
    modules = {
      iam = module.iam.roles
    }
  }
}

module "steps" {
  source = "./steps"

  depends_on = [module.iam, module.lambda]

  inputs = {
    modules = {
      iam = module.iam.roles
      lambda = module.lambda
    }
  }
}