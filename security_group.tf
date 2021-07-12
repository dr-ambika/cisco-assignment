#Instance Security Group

resource "aws_security_group" "webserver-sg" {
  count       = var.sg_count
  name        = "web-sg"
  description = "security group for webserver"
  vpc_id      = var.create_vpc ? module.main-vpc.vpc_id : aws_default_vpc.default.id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.create_vpc ? [module.main-vpc.vpc_cidr_block] : [aws_default_vpc.default.cidr_block]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  tags = {
    Name = "web"
  }
}
