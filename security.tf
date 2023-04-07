resource "aws_security_group" "security_grp" {
  name        = "application"
  description = "Terraform security group"
  vpc_id      = aws_vpc.main.id

  ingress {
    cidr_blocks     = ["0.0.0.0/0"]
    description     = "SSH open"
    from_port       = 22
    protocol        = "tcp"
    to_port         = 22
    # security_groups = [aws_security_group.loadbalncer_security.id]
  }

  ingress {
    # cidr_blocks     = ["0.0.0.0/0"]
    description = "HTTP open"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80

    security_groups = [aws_security_group.loadbalncer_security.id]
  }

  ingress {
    # cidr_blocks     = ["0.0.0.0/0"]
    description     = "HTTPS open"
    from_port       = 443
    protocol        = "tcp"
    to_port         = 443
    security_groups = [aws_security_group.loadbalncer_security.id]
  }
  # ingress {
  #   cidr_blocks = ["0.0.0.0/0"]
  #   description = "Node open"
  #   from_port   = 3000
  #   protocol    = "tcp"
  #   to_port     = 3000
  # }

  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    from_port        = 0
    protocol         = "-1"
    to_port          = 0
    ipv6_cidr_blocks = ["::/0"]
  }

}

resource "aws_security_group" "database" {

  name = "Database"

  description = "Used for database access"

  vpc_id = aws_vpc.main.id

  # ingress.0.protocol = 
  ingress {
    description = "Access To Database"
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    # cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.security_grp.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "loadbalncer_security" {
  vpc_id = aws_vpc.main.id
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "csye6225_lb_security_grp"
  }
}