data "aws_ami" "ami_new" {
  owners      = ["302042767805"]
  most_recent = true

}
resource "aws_instance" "instance_app" {
  ami           = data.aws_ami.ami_new.id
  instance_type = "t2.micro"

  root_block_device {
    volume_size = 50
    volume_type = "gp2"
  }

  disable_api_termination = true

vpc_security_group_ids = [aws_security_group.security_grp.id]

subnet_id = aws_subnet.main1.id
user_data = file("web.sh")
}