provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "iamuser" {
  name = "user.${count.index}"
  count = 3
}

output "iamuser" {
  value = aws_iam_user.iamuser[*].arn
}