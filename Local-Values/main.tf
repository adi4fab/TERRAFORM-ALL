provider "aws" {
  region = "us-east-1"
  version = "~> 2.0"
}

locals {
  common_tags = {
    Name = "instance"
    ENV = "prod"
    OWNER = "developer"
  }
}

locals {
  second_tags = {
    Name = "instance"
    ENV = "non"
    OWNER = "maintainer"
  }
}

resource "aws_instance" "devinstance" {
  ami = "ami-04d29b6f966df1537"
  instance_type = "t2.micro"
  tags = local.common_tags
}

resource "aws_instance" "prodinstance" {
  ami = "ami-04d29b6f966df1537"
  instance_type = "t2.micro"
  tags = local.second_tags
}
