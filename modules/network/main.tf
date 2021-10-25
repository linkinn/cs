resource "aws_vpc" "new-vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "${var.prefix}-vpc"
  }
}

data "aws_availability_zones" "available" {}

# TODO: tag is with the hardcode cluster
resource "aws_subnet" "subnets" {
  count = 2

  vpc_id                  = aws_vpc.new-vpc.id
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.prefix}-subnet-${count.index}"
    "kubernetes.io/cluster/keanu": "shared"
    "kubernetes.io/role/elb": 1
  }
}

resource "aws_internet_gateway" "new-igw" {
  vpc_id = aws_vpc.new-vpc.id

  tags = {
    Name = "${var.prefix}-igw"
  }
}

resource "aws_route_table" "new-rtb" {
  vpc_id = aws_vpc.new-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.new-igw.id
  }

  tags = {
    Name = "${var.prefix}-rtb"
  }
}

resource "aws_route_table_association" "new-rtb-association" {
  count = 1

  subnet_id      = aws_subnet.subnets.*.id[count.index]
  route_table_id = aws_route_table.new-rtb.id
}
