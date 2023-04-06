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

variable "instance_type" {
  default = "t2.micro"
  type    = string
}
variable "volume_size" {
  default = 50
  type    = number
}
variable "volume_type" {
  default = "gp2"
  type    = string
}
variable "owner_id" {
  type    = list(string)
  default = ["302042767805"]

}

variable "allocated_storage" {
  type    = number
  default = 10

}

variable "db_name" {
  type    = string
  default = "csye6225"

}

variable "engine" {
  type    = string
  default = "mysql"
}

variable "engine_version" {
  type    = string
  default = "5.7"
}

variable "identifier" {
  type    = string
  default = "csye6225"
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "username" {
  type    = string
  default = "csye6225"
}

variable "password" {
  type = string
  # default = "SomePassword!2022"
}

variable "storage_type" {
  type    = string
  default = "gp2"
}
variable "storage_encrypted" {
  type    = bool
  default = true
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}

variable "s3_bucket_prefix" {
  type    = string
  default = "s3-csye-6225-"
}

variable "port" {
  type    = number
  default = 3306

}

variable "route_record" {
  type    = string
  default = "dev.priyankanayak.me"

}

# variable "route_zoneid" {
#   type = string
#   default = "Z08583632WI7IWX40IP9K"

# }

variable "volume_sizetl" {
  type    = number
  default = 20
}

variable "max_sizeasg" {
  type    = number
  default = 3
}

variable "min_sizeasg" {
  type    = number
  default = 1
}

variable "desired_capacity" {
  type    = number
  default = 1
}

variable "cooldown" {
  type    = number
  default = 60
}

variable "threshold_up" {
  type    = number
  default = 5
}

variable "threshold_down" {
  type    = number
  default = 3
}