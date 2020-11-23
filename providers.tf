terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = "3.16.0"
  region  = var.aws_region
}

provider "google" {
  version = "3.48.0"
}
