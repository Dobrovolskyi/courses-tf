variable "aws_config" {}

variable "GOOGLE_APPLICATION_CREDENTIALS" {}

variable "aws_regions" {
  description = "The list of AWS regions we want to work with"
  type        = list(string)
  default     = ["us-east-1", "eu-central-1"]
}
