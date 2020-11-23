data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami = data.aws_ami.ubuntu.id
  tags = {
    Name = "HelloWorld-defaultReg"
  }
}

resource "aws_instance" "web_iter" {
  for_each = var.aws_regions
  ami      = data.aws_ami.ubuntu.id
  region   = each.value
  tags = {
    Name = "HelloWorld-${each.index}"
  }
}
