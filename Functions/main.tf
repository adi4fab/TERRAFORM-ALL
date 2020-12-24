provider "aws" {
  region = "us-east-1"
  version = "~> 2.0"
}

variable "ami" {
  type = map

  default = {
    "us-east-1" = "ami-id"
    "us-west-1" = "ami-id"
  }
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type = list
  default = ["firstec2","secoundec2"]
}

resource "aws_key_pair" "mykey" {
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "devins" {
  ami = lookup(var.ami,var.region)
  instance_type = "t2.small"
  key_name = aws_key_pair.mykey.key_name

  count = 2

  tags = {
    Name = element(var.tags, count.index)
  }
}

output "timestamp" {
  value = local.time
}





