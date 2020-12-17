resource "aws_instance" "myins" {
  ami = "ami-04d29b6f966df1537"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${self.id} >> ids.txt"
  }
}
