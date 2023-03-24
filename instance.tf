data "aws_ami" "ami_new" {
  #owners      = ["302042767805"]
  owners      = var.owner_id
  most_recent = true

}
resource "aws_instance" "instance_app" {
  # ami           = data.aws_ami.ami_new.id
  # instance_type = var.instance_type
  depends_on = [
    aws_db_instance.mysql_database
  ]

  ami           = data.aws_ami.ami_new.id
  # ami = "ami-09380f337ebc547d9"
  instance_type = var.instance_type

  root_block_device {
    delete_on_termination = true
    volume_size           = var.volume_size
    volume_type           = var.volume_type
  }

  disable_api_termination = false

  vpc_security_group_ids = [aws_security_group.security_grp.id]

  subnet_id            = aws_subnet.main1.id
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  # user_data = file("web.sh")
  user_data = <<EOF
  #!/bin/bash
  cd /home/ec2-user
  touch .env
  echo MYSQL_DATABASE="${aws_db_instance.mysql_database.db_name}" >> .env
  echo MYSQL_USERNAME="${aws_db_instance.mysql_database.username}" >> .env
  echo MYSQL_ROOT_PASSWORD="${aws_db_instance.mysql_database.password}" >> .env
  echo MYSQL_HOST="${aws_db_instance.mysql_database.address}" >> .env

  echo PORT="3000" >> .env

  echo AWS_S3_BUCKET_NAME="${aws_s3_bucket.s3_bucket.bucket}" >> .env
  # echo NODE_ENV= "production" >> .env
 

  sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
      -a fetch-config \
      -m ec2 \
      -c file:/home/ec2-user/cloudwatch.json \
      -s


  sudo systemctl daemon-reload
  sudo systemctl enable nginx
  sudo systemctl start nginx
  sudo systemctl enable web
  sudo systemctl start web
  EOF
}

# resource "aws_instance" "my_instance" {

#   depends_on = [
#     aws_s3_bucket.s3_bucket
#   ]

#   ami = "ami-006dcf34c09e50022"
#   instance_type = "t2.micro"

#   iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

#   tags = {
#     "Name" = "Hello world"
#   }

# }

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.EC2-CSYE6225.name

}