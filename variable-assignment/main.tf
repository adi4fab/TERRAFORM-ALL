provider "aws" {
  region = "us-east-1"
  version = "~> 2.0"
}

resource "aws_instance" "myins" {
  ami = var.ami_id
  instance_type = var.instance_type
}



