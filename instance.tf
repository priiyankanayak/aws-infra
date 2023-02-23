data "aws_ami" "ami_new" {
  #owners      = ["302042767805"]
  owners      = var.owner_id
  most_recent = true

}
resource "aws_instance" "instance_app" {
  ami           = data.aws_ami.ami_new.id
  instance_type = var.instance_type

  root_block_device {
    delete_on_termination = true
    volume_size           = var.volume_size
    volume_type           = var.volume_type
  }

  disable_api_termination = true

  vpc_security_group_ids = [aws_security_group.security_grp.id]

  subnet_id = aws_subnet.main1.id
  user_data = file("web.sh")
}