provider "aws" {
  region = "eu-west-2"
}


resource "aws_s3_bucket" "mz-terraform-backend" {
  bucket = "mz-terraform-backend"
  acl    = "private"
  versioning {
    enabled = true
  }

  tags = {
    Name = "mz-terraform-backend"
  }
}
