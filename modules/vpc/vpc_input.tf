variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC"
  default     = "my-vpc"
}

variable "public_subnets_cidrs" {
  type        = list
  description = "The CIDR blocks for the public subnets"
  # default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets_cidrs" {
  type        = list
  description = "The CIDR blocks for the private subnets"
  # default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
} 

variable "azs" {
  type        = list
  description = "The availability zones for the subnets"
  # default     = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}



