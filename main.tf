terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile

}

# resource "aws_instance" "web" {
#   ami           = "ami-0557a15b87f6559cf"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "HelloWorld"
#   }
# }