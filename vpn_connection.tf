resource "aws_customer_gateway" "vpn" {
  bgp_asn    = 65000
  ip_address = var.remote_vpn_cgw_ip
  type       = "ipsec.1"
}

resource "aws_vpn_connection" "main" {
  vpn_gateway_id      = aws_vpn_gateway.vpn_gw.id
  customer_gateway_id = aws_customer_gateway.vpn.id
  type                = "ipsec.1"
  static_routes_only  = true
}
