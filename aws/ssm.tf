resource "aws_ssm_parameter" "db-host-name" {
  name = "HOST"
  type = "SecureString"
  value = "app-database.cme2qbt5q5x2.eu-west-2.rds.amazonaws.com"
}


resource "aws_ssm_parameter" "postgres-user" {
  name = "USER"
  type = "SecureString"
  value = "postgres"
}


resource "aws_ssm_parameter" "name" {
  name = "NAME"
  type = "SecureString"
  value = "rates"
}

resource "aws_ssm_parameter" "password" {
  name = "PASSWORD"
  type = "SecureString"
  value = "password"
}
