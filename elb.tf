#Create load_balancer

resource "aws_lb" "webserver-lb" {
  count = var.lb_count

  name                       = var.lb_name
  load_balancer_type         = var.type
  internal                   = false
  subnets                    = var.create_vpc ? module.main-vpc.public_subnets : aws_default_subnet.public.*.id
  enable_deletion_protection = false
}

resource "aws_lb_target_group" "lb_target_group" {
  count = length(keys(var.port_mappings)) * var.lb_count

  name     = "${var.lb_name}-${element(values(var.port_mappings), count.index)}"
  protocol = var.type == "network" ? "TCP" : "HTTP"
  port     = element(values(var.port_mappings), count.index)
  vpc_id   = var.create_vpc ? module.main-vpc.vpc_id : aws_default_vpc.default.id

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 5
    interval            = 10
  }
}

resource "aws_lb_listener" "lb_listener" {
  count = length(keys(var.port_mappings)) * var.lb_count

  load_balancer_arn = aws_lb.webserver-lb[count.index].arn
  protocol          = var.type == "network" ? "TCP" : "HTTP"
  port              = element(keys(var.port_mappings), count.index)

  default_action {
    target_group_arn = element(aws_lb_target_group.lb_target_group.*.arn, count.index)
    type             = "forward"
  }
}

#Autoscaling Attachment
resource "aws_autoscaling_attachment" "asg_attachment" {
  count                  = length(keys(var.port_mappings)) * var.lb_count
  alb_target_group_arn   = aws_lb_target_group.lb_target_group[count.index].arn
  autoscaling_group_name = aws_autoscaling_group.webserver-autoscaling.id
}
