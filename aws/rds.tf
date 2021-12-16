resource "aws_db_instance" "db" {
  allocated_storage    = 10
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  name                 = "postgres"
  username             = "postgres"
  password             = "password"
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
