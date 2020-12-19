provider "aws" {
  region = "us-east-1"
  version = ">=2.0, <=2.90"
}

resource "aws_instance" "myins" {
  ami = "ami-04d29b6f966df1537"
  instance_type = "t2.micro"
}
