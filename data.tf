data "aws_route_table" "private" {
  subnet_id = var.route_table_subnet_id
}

resource "aws_route" "route" {
  route_table_id         = data.aws_route_table.private.id
  destination_cidr_block = var.remote_vpc_cidr
  gateway_id             = aws_vpn_gateway.vpn_gw.id
}
