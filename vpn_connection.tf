resource "aws_customer_gateway" "vpn" {
  bgp_asn    = 65000
  ip_address = var.remote_vpn_cgw_ip
  type       = "ipsec.1"

  tags = {
    Name = join("-", [var.environment, local.solution_name, "s2s-vpn", "cgw"])
  }
}

resource "aws_vpn_connection" "main" {
  vpn_gateway_id      = aws_vpn_gateway.vpn_gw.id
  customer_gateway_id = aws_customer_gateway.vpn.id
  type                = "ipsec.1"
  static_routes_only  = true
  tunnel_inside_ip_version = "ipv4"
  local_ipv4_network_cidr = var.remote_vpc_cidr
  remote_ipv4_network_cidr = var.local_vpc_cidr
  tunnel1_preshared_key = "awsvpnconnection"
  tunnel2_preshared_key = "awsvpnconnection"

  tags = {
    Name = join("-", [var.environment, local.solution_name, "s2s-vpn", "connection"])
  }
}

resource "aws_vpn_connection_route" "office" {
  destination_cidr_block = var.remote_vpc_cidr
  vpn_connection_id      = aws_vpn_connection.main.id
}
