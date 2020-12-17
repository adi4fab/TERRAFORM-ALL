provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "firstins" {
  ami                    = "ami-04d29b6f966df1537"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.ssh.key_name
  vpc_security_group_ids = [aws_security_group.prodsg.id]

}

resource "aws_key_pair" "ssh" {
  key_name   = "provkey"
  public_key = file("./sshkey.pub")
}

resource "aws_security_group" "prodsg" {
  name = "prodSG"
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "null_resource" "null" {
  triggers = {
    public_ip = aws_instance.firstins.public_ip


  }

  connection {
    host        = aws_instance.firstins.public_ip
    user        = "ec2-user"
    private_key = file("./sshkey.pem")
  }

  provisioner "remote-exec" {
    inline = ["sudo yum -y update", "sudo yum install -y httpd", "sudo service httpd start", "sudo echo hi there >> /var/www/html/index.html"]
  }
}
