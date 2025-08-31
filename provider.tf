
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
