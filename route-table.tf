resource "aws_route" "route" {
  route_table_id         = var.public_route_table_id
  destination_cidr_block = var.remote_vpc_cidr
  gateway_id             = aws_vpn_gateway.vpn_gw.id
}
