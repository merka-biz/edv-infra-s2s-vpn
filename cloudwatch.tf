resource "aws_cloudwatch_log_group" "vpn_logs" {
  name              = "/aws/vpc/vpn-connections/${local.vpn_connection_name}"
  retention_in_days = var.cloudwatch_logs_retention_in_days

  tags = {
    Name = var.cloudwatch_logs_group_name
  }
}
