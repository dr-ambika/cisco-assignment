resource "aws_elb" "webserver-elb" {
  name               = "webserver-elb"
  availability_zones = var.availability_zones
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "my-elb"
  }
}

# Create ELB Instance Attachment
resource "aws_elb_attachment" "webserver" {
  elb      = aws_elb.webserver-elb.id
  count    = var.instance_count
  instance = element(aws_instance.web.*.id, count.index)
}
