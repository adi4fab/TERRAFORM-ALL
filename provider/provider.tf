provider "aws" {
  alias = "europe"
  region = "eu-central-1"
}

provider "aws" {
  alias = "us"
  region = "us-east-1"
}

resource "aws_instance" "first" {
  provider = "aws.europe"
  ami = "ami-0bd39c806c2335b95"
  instance_type = "t2.micro"
}

resource "aws_instance" "second" {
  provider = "aws.us"
  ami = "ami-04d29b6f966df1537"
  instance_type = "t2.micro"
}