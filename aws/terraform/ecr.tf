resource "aws_ecr_repository" "api-ecr" {
  name                 = "api"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "db-ecr" {
  name                 = "db"
  image_tag_mutability = "MUTABLE"
}
