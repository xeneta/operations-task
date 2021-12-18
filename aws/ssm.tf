resource "aws_ssm_parameter" "db-host-name" {
  name = "HOST"
  type = "SecureString"
  value = aws_db_instance.db.address
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
  value = random_password.master_password.result
}
