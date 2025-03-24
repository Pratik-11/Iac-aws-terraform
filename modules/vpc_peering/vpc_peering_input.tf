variable "vpc1_id" {
  type        = string
  description = "VPC ID of the first VPC"
}

variable "vpc2_id" {
  type        = string
  description = "VPC ID of the second VPC"
}

variable "vpc1_cidr_block" {
  type        = string
  description = "CIDR block of VPC1"
}

variable "vpc2_cidr_block" {
  type        = string
  description = "CIDR block of VPC2"
}

variable "vpc1_route_table_id" {
  type        = string
  description = "Route Table ID for VPC1"
}

variable "vpc2_route_table_id" {
  type        = string
  description = "Route Table ID for VPC2"
}
