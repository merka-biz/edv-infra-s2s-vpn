locals {
  vpn_aws_cloudwatch_log_group_name = "/aws/vpc/vpn-connections/${local.vpn_connection_name}"
}

resource "aws_cloudwatch_log_group" "vpn" {
  name              = local.vpn_aws_cloudwatch_log_group_name
  retention_in_days = var.cloudwatch_logs_retention_in_days

  tags = {
    Name = local.vpn_aws_cloudwatch_log_group_name
  }
}
