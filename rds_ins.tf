resource "aws_db_parameter_group" "mysql_parameter_group" {
  name   = "mysql-rds-pg"
  family = "mysql5.7"
}

resource "aws_db_subnet_group" "my_subnet_group" {

  name       = "db_subnet_group"
  subnet_ids = [aws_subnet.mainprivate1.id, aws_subnet.mainprivate2.id]


  tags = {
    Name = "My Database Subnet Group"
  }

}

resource "aws_db_instance" "mysql_database" {




  parameter_group_name = aws_db_parameter_group.mysql_parameter_group.name
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  identifier           = var.identifier
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  storage_type         = var.storage_type
  storage_encrypted    = var.storage_encrypted
  kms_key_id = aws_kms_key.key_rds.arn

  skip_final_snapshot = var.skip_final_snapshot

  publicly_accessible = false

  db_subnet_group_name = aws_db_subnet_group.my_subnet_group.name

  vpc_security_group_ids = [aws_security_group.database.id]

}