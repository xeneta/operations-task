terraform {
  backend "s3" {
    bucket = "mz-terraform-backend"
    key    = "backend"
    region = "eu-west-2"
  }
}
