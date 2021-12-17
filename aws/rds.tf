resource "aws_db_instance" "db" {
  allocated_storage    = 10
  engine               = "postgres"
  engine_version = "13.4"
  instance_class       = "db.t3.micro"
  name                 = "rates"
  username             = "postgres"
  password             = random_password.master_password.result
  identifier = "app-database"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  publicly_accessible = true ## to make it easier for dump
  db_subnet_group_name = aws_db_subnet_group.db-subnet-group.name
}

resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.privateOne.id, aws_subnet.publicTwo.id]

  tags = {
    Name = "db subnet group"
  }
}

resource "random_password" "master_password" {
  length  = 16
  special = false
}
