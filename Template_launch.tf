resource "aws_launch_template" "template_launch" {

  name = "csye_template_launch"


  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = var.volume_sizetl
      encrypted = true
      kms_key_id = aws_kms_key.key_ebs.arn
    }

  }

  image_id = data.aws_ami.ami_new.id


  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.security_grp.id]

  # iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2_profile.arn
  }

  user_data = base64encode(templatefile("./autoscalingtemplate_launch.sh",
    {
      MYSQL_DATABASE      = aws_db_instance.mysql_database.db_name,
      MYSQL_USERNAME      = aws_db_instance.mysql_database.username,
      MYSQL_ROOT_PASSWORD = aws_db_instance.mysql_database.password,
      MYSQL_HOST          = aws_db_instance.mysql_database.address,
      AWS_S3_BUCKET_NAME  = aws_s3_bucket.s3_bucket.bucket
    }
  ))
}