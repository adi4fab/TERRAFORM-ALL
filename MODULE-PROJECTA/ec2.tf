provider "aws" {
  region = "us-east-1"
  version = ">2.0"
}


module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  ami                    = "ami-04d29b6f966df1537"
  instance_count         =  1
  instance_type          = "t2.micro"
  subnet_id              = "subnet-19cf5c54"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

