resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = var.local_vpc_id

  tags = {
    Name = join("-", [var.environment, local.solution_name, "s2s-vpn", "vpgw"])
  }
}