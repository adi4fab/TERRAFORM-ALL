provider "aws" {
  region = "us-east-1"
  version = ">2.0"
}

data "aws_ami" "myami" {
  owners = ["amazon"]
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "myred" {
  ami = data.aws_ami.myami.id
  instance_type = "t2.micro"
  key_name = "terraform"

  provisioner "remote-exec" {
    inline = [
    "sudo yum install nano -y"
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
    "sudo yum remove nano -y"   // could be used to uninstall antivirus for example, which will inturn update the same in the antirus dashboard.
    ]
  }

  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file("./terraform.pem")
  }

}

resource "aws_security_group" "mysg" {
  name = "sgforthis"
  description = "new sg"

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}