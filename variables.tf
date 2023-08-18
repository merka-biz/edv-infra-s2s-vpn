variable "aws_region" {
  type        = string
  description = "AWS Region where you want to deploy your services"
}

variable "aws_access_key" {
  type        = string
  description = "AWS account access key"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS account secret key"
}

variable "organization" {
  type        = string
  description = "Organization name (3 characters)"
}

variable "country" {
  type        = string
  description = "Country code (3 characters)"
}

variable "environment" {
  type        = string
  description = "Environment"
}

variable "local_vpc_id" {
  type        = string
  description = "Local VPC - ID"
}

variable "local_vpc_cidr" {
  type        = string
  description = "Local VPC - CIDR"
}

variable "remote_vpc_cidr" {
  type        = string
  description = "Remote VPC - CIDR"
}

variable "remote_vpn_cgw_ip" {
  type        = string
  description = "Remote VPC - Customer Gateway Public IP"
}

variable "route_table_subnet_id" {
  type        = string
  description = "Route table Subnet ID - used to get the associated route table"
}