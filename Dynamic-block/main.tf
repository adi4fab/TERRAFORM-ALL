provider "aws" {
  region = "us-east-1"
  version = "~> 2.0"
}

variable "sg_ports" {
  type = list
  default = ["100","200","300","400"]
}

resource "aws_security_group" "mysg" {
  name = "SG"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}