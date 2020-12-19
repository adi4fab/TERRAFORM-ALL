provider "aws" {
  region = "us-east-1"
  version = "~>2.0"
}

resource "aws_s3_bucket" "gglamf" {
  bucket = "gglamffffi"
}


// EIP AND EC2 INSTANCE //


resource "aws_eip" "myeip" {
  vpc = "true"
}

resource "aws_instance" "myins" {
  ami = "ami-04d29b6f966df1537"
  instance_type = "t2.micro"
}

resource "aws_eip_association" "associate" {
  instance_id   = aws_instance.myins.id
  allocation_id = aws_eip.myeip.id
}


// EIP TO SG //

resource "aws_security_group" "mysg" {
  name = "eipsg"

  ingress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["${aws_eip.myeip.public_ip}/32"]
  }
}


