terraform {
  backend "s3" {
    bucket = "abomasum"
    key    = "terraform/remote_state"
  }
}
