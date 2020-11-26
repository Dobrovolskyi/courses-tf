#=========================================================================
#                         Amazon Web Services
#=========================================================================

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
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld-defaultReg"
  }
}

resource "aws_instance" "web_iter" {
  for_each = toset(var.aws_regions)

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld-${each.key}"
  }
}


#=========================================================================
#                         Google Cloud Platform
#=========================================================================

resource "google_compute_instance_template" "tf-instance" {
  name        = "appserver-1"
  description = "first app server instances."

  tags = ["app", "DevOpsCourse"]

  labels = {
    environment = "dev"
    service     = "app-server"
  }

  instance_description = "minimal instance"
  machine_type         = "e2-micro"
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  // Create a new boot disk from an image
  disk {
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = "default"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
