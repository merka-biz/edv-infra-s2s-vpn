locals {
  vpn_connection_name = join("-", [var.environment, local.solution_name, "s2s-vpn", "connection"])
}

resource "aws_vpn_connection" "main" {
  vpn_gateway_id           = aws_vpn_gateway.vpn_gw.id
  customer_gateway_id      = aws_customer_gateway.vpn.id
  type                     = aws_customer_gateway.vpn.type
  static_routes_only       = true
  tunnel_inside_ip_version = "ipv4"
  local_ipv4_network_cidr  = "0.0.0.0/0"
  remote_ipv4_network_cidr = "0.0.0.0/0"


  tunnel1_startup_action = "start"
  tunnel1_preshared_key = replace(join("-", [var.environment, local.solution_name, "vpn-conn-t1-psk"]), "-", "_")
  tunnel1_ike_versions  = ["ikev2"]

  tunnel1_phase1_encryption_algorithms = ["AES256"]
  tunnel1_phase1_dh_group_numbers      = [2]
  tunnel1_phase1_lifetime_seconds      = 1440
  tunnel1_phase1_integrity_algorithms  = ["SHA2-256"]

  tunnel1_phase2_encryption_algorithms = ["AES256"]
  tunnel1_phase2_dh_group_numbers      = [2]
  tunnel1_phase2_lifetime_seconds      = 1440
  tunnel1_phase2_integrity_algorithms  = ["SHA2-256"]


  tunnel2_startup_action = "start"
  tunnel2_preshared_key = replace(join("-", [var.environment, local.solution_name, "vpn-conn-t2-psk"]), "-", "_")
  tunnel2_ike_versions  = ["ikev2"]

  tunnel2_phase1_encryption_algorithms = ["AES256"]
  tunnel2_phase1_dh_group_numbers      = [2]
  tunnel2_phase1_lifetime_seconds      = 3600
  tunnel2_phase1_integrity_algorithms  = ["SHA2-256"]

  tunnel2_phase2_encryption_algorithms = ["AES256"]
  tunnel2_phase2_dh_group_numbers      = [2]
  tunnel2_phase2_lifetime_seconds      = 3600
  tunnel2_phase2_integrity_algorithms  = ["SHA2-256"]

  tunnel1_log_options {
    cloudwatch_log_options {
      log_group_arn     = aws_cloudwatch_log_group.vpn.arn
      log_enabled       = var.cloudwatch_logs_enabled
      log_output_format = "json"
    }
  }

  tunnel2_log_options {
    cloudwatch_log_options {
      log_group_arn     = aws_cloudwatch_log_group.vpn.arn
      log_enabled       = var.cloudwatch_logs_enabled
      log_output_format = "json"
    }
  }

  tags = {
    Name = local.vpn_connection_name
  }
}

resource "aws_vpn_connection_route" "remote_vpc" {
  destination_cidr_block = var.remote_vpc_cidr
  vpn_connection_id      = aws_vpn_connection.main.id
}
