resource "aws_eip" "myfirst" {
  vpc = true
}

resource "aws_eip" "mysecond" {
  provider = aws.west
  vpc = true
}


