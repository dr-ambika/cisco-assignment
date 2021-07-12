# Manage Default network

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_subnet" "public" {
  count             = length(var.availability_zones)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "Default subnets"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = var.create_vpc ? module.main-vpc.vpc_id : aws_default_vpc.default.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
