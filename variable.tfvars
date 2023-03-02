profile = "dev"
region  = "us-east-1"


MyVPC_cidr_block = "10.0.0.0/16"

MySubnet1_cidr_block  = "10.0.1.0/24"
MyPSubnet1_cidr_block = "10.0.2.0/24"

MySubnet2_cidr_block  = "10.0.3.0/24"
MyPSubnet2_cidr_block = "10.0.4.0/24"

MySubnet3_cidr_block  = "10.0.5.0/24"
MyPSubnet3_cidr_block = "10.0.6.0/24"

owner_id      = ["302042767805"]
instance_type = "t2.micro"
volume_size   = 50
volume_type   = "gp2"

allocated_storage = 10
# db_name = csye6225
engine = "mysql"
engine_version = "5.7"
identifier = "csye6225"
instance_class = "db.t3.micro"
# username = "csye6225"
# password = "SomePassword!2022"
storage_type = "gp2"
storage_encrypted = true
skip_final_snapshot = true

s3_bucket_prefix = "s3-csye-6225-"

port = 3306
