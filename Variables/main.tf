provider "aws" {
  region = "us-east-1"
  version = "~>2.0"
}

resource "aws_security_group" "mysg" {
  name = "mysgg"

  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = [var.sg]
  }

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = [var.sg]
  }
}

