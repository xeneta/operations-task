resource "aws_ssm_parameter" "db-host-name" {
  name = "HOST"
  type = "SecureString"
  value = aws_db_instance.db.endpoint
}
