provider "aws" {
  region = "us-east-1"
  version = "~> 2.0"
}

resource "aws_instance" "myins" {
  ami = "ami-04d29b6f966df1537"
  instance_type = "t2.micro"
  key_name = "terraform"

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx",
    ]

    connection {
      type     = "ssh"
      user     = "ec2-user"
      private_key = file("./terraform.pem")
      host = self.public_ip
    }

    }
  }

output "public_ip" {
  value = aws_instance.myins.public_ip
}
