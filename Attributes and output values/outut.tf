output "s3bucket" {
  value = aws_s3_bucket.gglamf.bucket_domain_name
}

output "eip" {
  value = aws_eip.myeip.public_ip
}