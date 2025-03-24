variable "vpc1_cidr_block" {
  type        = string
  description = "CIDR block for VPC 1"
}

variable "vpc1_name" {
  type        = string
  description = "The name of the VPC"
}

variable "vpc2_name" {
  type        = string
  description = "The name of the VPC"
}

variable "vpc1_public_subnets" {
  type        = list(string)
  description = "Public subnets for VPC 1"
}

variable "vpc1_private_subnets" {
  type        = list(string)
  description = "Private subnets for VPC 1"
}

variable "vpc2_cidr_block" {
  type        = string
  description = "CIDR block for VPC 2"
}

variable "vpc2_public_subnets" {
  type        = list(string)
  description = "Public subnets for VPC 2"
}

variable "vpc2_private_subnets" {
  type = list(string)
  description = "Private subnets for VPC 2"
}

variable "instance_type" {
  type = string
  description = "Instance type for EC2 instances"
}

variable "ami" {
  type = string
  description = "Amazon Machine Image for EC2 instances"
}

variable "key_name" {
  type = string
  description = "SSH Key Pair name"
}

variable "azs" {
  type = list(string)
  description = "Availability zones for subnets"
}

variable "use_private_subnet" {
  type = bool
  description = "Whether to use private subnets or not"
}


