# VPC Configurations
vpc1_cidr_block_block = "10.0.0.0/16"

vpc1_public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

vpc1_private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

vpc1_name = "tf-vpc-1"

vpc2_name = "tf-vpc-2"

vpc2_cidr_block_block = "10.1.0.0/16"

vpc2_public_subnets = ["10.1.1.0/24", "10.1.2.0/24"]

vpc2_private_subnets = ["10.1.3.0/24", "10.1.4.0/24"]

azs = [
  "eu-north-1a",
  "eu-north-1b",
  "eu-north-1c"
]

# EC2 Configurations
instance_type = "t3.micro"

ami = "ami-09a9858973b288bdd"

key_name = "my-ec2-key-tf"

# use_private_subnet = true

