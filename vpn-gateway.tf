resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = join("-", [var.environment, local.solution_name, "s2s-vpn", "vpgw"])
  }
}