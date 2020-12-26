provider "aws" {
  region = "us-east-1"
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    bucket = "terraorm-bucket"
    key    = "remote_demo.tfstate" //name you want to give to your tf state file.
    region = "us-east-1"
    dynamodb_table = "statelock"
  }
}


resource "aws_instance" "myins" {
  ami = "ami-04d29b6f966df1537"
  instance_type = "t2.micro"
}

