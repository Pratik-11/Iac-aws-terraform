variable "instance_type" {
  type = string
  default = "t3.micro"
  description = "The type of instance to be created"
}

variable "ami" {
  type = string
  # default = "ami-09a9858973b288bdd"
  description = "UBuntu AMI"
}

variable "vpc" {
  type = string
  # default = "vpc-0d8c98b8c9f0d6a4a"
  description = "default vpc"
}

variable "key_name" {
  type = string
  # default = "aws_key"
  description = "key name"
}

variable "use_private_subnet" {
  type = bool
  # default = false
  description = "use private subnet"
}

variable "subnet_id" {
  type = string
  description = "Subnet ID for EC2 instances"
}