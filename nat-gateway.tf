resource "aws_eip" "nat" {
  count  = length(var.public_subnets)
  domain = "vpc"
}

resource "aws_nat_gateway" "gw" {
  count         = length(var.public_subnets)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = values(aws_subnet.public)[count.index].id
}