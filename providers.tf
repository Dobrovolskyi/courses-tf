terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = "3.16.0"
  region  = var.aws_config.region
}

provider "google" {
  version     = "3.48.0"
  project     = "My First Project" # "{{YOUR GCP PROJECT}}"
  region      = "europe-west1"
  zone        = "europe-west1-b"
}
