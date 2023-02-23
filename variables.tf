# variable "availability_zone" {
#     type = list(string)
#     default = [ "us-east-1a", "us-east-1b"]
# }


variable "profile" {
  default = "dev"
  type    = string
}

variable "region" {
  default = "us-east-1"
  type    = string
}

variable "MyVPC_cidr_block" {
  default = "10.0.0.0/16"
  type    = string
}

variable "MySubnet1_cidr_block" {
  default = "10.0.1.0/24"
  type    = string
}

variable "MyPSubnet1_cidr_block" {
  default = "10.0.2.0/24"
  type    = string
}

variable "MySubnet2_cidr_block" {
  default = "10.0.3.0/24"
  type    = string
}

variable "MyPSubnet2_cidr_block" {
  default = "10.0.4.0/24"
  type    = string
}

variable "MySubnet3_cidr_block" {
  default = "10.0.5.0/24"
  type    = string
}

variable "MyPSubnet3_cidr_block" {
  default = "10.0.6.0/24"
  type    = string
}

# variable "availability_zone" {

#     type = list (string)
# }

variable "RouteInternetgateway" {
  default = "0.0.0.0/0"
  type    = string
}