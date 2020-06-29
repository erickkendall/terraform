resource "aws_s3_bucket" "wp-code-06292020" {
  bucket = "wp-code-06292020"
  acl    = "private"
  region = "us-east-1"
}
resource "aws_s3_bucket" "wp-images-06292020" {
  bucket = "wp-images-06292020"
  acl    = "private"
  region = "us-east-1"
}
