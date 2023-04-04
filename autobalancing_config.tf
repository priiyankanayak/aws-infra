resource "aws_launch_configuration" "autoScaling_launch_config" {

  name = "autoscaling_launch_config"

  instance_type = "t2.micro"

  image_id = data.aws_ami.ami_new.id

  associate_public_ip_address = true


  security_groups = [aws_security_group.security_grp.id]


  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

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
