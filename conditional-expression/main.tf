provider "aws" {
  region = "us-east-1"
  version = "~> 2.0"
}

variable "test" {} //should be given in terraform.tfvars file as test = true
variable "names" {
  type = list
  default = ["aditya","orem","loha"]
}

resource "aws_instance" "instancedev" {
  ami = "ami-04d29b6f966df1537"
  instance_type = "t2.small"
  count = var.test == true ? 3 : 0

  tags = {
    Name = var.names[count.index]
  }
}

resource "aws_instance" "instanceprod" {
  ami = "ami-04d29b6f966df1537"
  instance_type = "t2.medium"
  count = var.test == false ? 1 : 0
}







