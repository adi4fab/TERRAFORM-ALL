provider "aws" {
  region = "us-east-1"
  version = ">=2.0, <=2.90"
}

resource "aws_iam_user" "iamuser" {
  name = var.username
}

resource "aws_elb" "bar" {
  name               = "foobar-terraform-elb"
  availability_zones = var.azs

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

}