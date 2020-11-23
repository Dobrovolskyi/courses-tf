variable "aws_config" {
  type = string
  default = {
    region        = "eu-central-1"
    instance_type = "t2.micro"
  }
}

variable "aws_regions" {
  description = "The list of AWS regions we want to work with"
  type        = list(string)
  default     = ["us-east-1", "eu-central-1"]
}
