resource "aws_s3_bucket" "mz-terraform-backend" {
  bucket = "mz-terraform-backend"
  acl    = "private"

  tags = {
    Name = "mz-terraform-backend"
  }
}
