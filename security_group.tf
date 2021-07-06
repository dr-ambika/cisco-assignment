#Instance Security Group
resource "aws_security_group" "webserver-sg" {
  name        = "web-sg"
  description = "security group for webserver"
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
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_elb.webserver-elb.source_security_group_id]
  }

  tags = {
    Name = "web"
  }
}
