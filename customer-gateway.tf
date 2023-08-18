resource "aws_customer_gateway" "vpn" {
  bgp_asn    = 65000
  ip_address = var.remote_vpn_cgw_ip
  type       = "ipsec.1"

  tags = {
    Name = join("-", [var.environment, local.solution_name, "s2s-vpn", "cgw"])
  }
}