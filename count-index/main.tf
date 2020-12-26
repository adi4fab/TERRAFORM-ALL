provider "aws" {
  region = "us-east-1"
  version = "~> 2.0"
}

resource "aws_instance" "myins" {
  ami = "ami-04d29b6f966df1537"
  instance_type = "t2.micro"
  count = 2

  tags = {
    Name = var.insname[count.index]
  }
}

variable "insname" {
  type = list
  default = ["insatnceadii","instanceorem"]
}

#resource "aws_iam_user" "lb" {
#  name = "aditya" // here the problem is all the iam user will have the same name. so we need to specify count.index
#   name = "aditya.${count.index}" // the names will be aditya.0..1..2 so on as per the count which is 3
#   count = 3
#}

// here the name is already predefined so we need the names which we require and incerement that.

resource "aws_iam_user" "lbb" {
  name = var.names[count.index]
  count = 3
}

variable "names" {
  type = list
  default = ["aditya","orem","loha"]
}

