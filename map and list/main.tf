provider "aws" {
  region = "us-east-1"
  version = ">=2.0, <=2.90"
}

resource "aws_instance" "mysins" {
  ami = "ami-04d29b6f966df1537"
  instance_type = var.instance["ap-south-1"]
#  instance_type = var.type[0]
}

variable "type" {
  type = list
  default = ["t2.micro","t2.small","t2.medium"]
}

variable "instance" {
  type = map
  default = {
    us-east-1 = "t2.micro"
    us-west-1 = "t2.medium"
    ap-south-1 = "t2.small"
  }
}