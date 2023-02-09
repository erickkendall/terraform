# create a random string
resource "random_id" "random_string" {
  byte_length = 5
}

resource "aws_s3_bucket" "terraform_bucket" {
  bucket = format("%s-%d", var.bucket_name, random_id.random_string.dec)

  force_destroy = "true"
}
