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

variable "environment" {
  type        = string
  description = "Environment"
}

variable "local_vpc_id" {
  type        = string
  description = "Local VPC - ID"
}

variable "remote_vpn_cgw_ip" {
  type        = string
  description = "Remote VPC - Customer Gateway Public IP"
}
