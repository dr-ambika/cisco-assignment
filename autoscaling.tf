resource "aws_launch_configuration" "webserver-launchconfig" {
  name_prefix     = "webserver-launchconfig"
  image_id        = var.ami[var.aws_region]
  instance_type   = var.instance_type
  key_name        = aws_key_pair.generated_key.key_name
  security_groups = aws_security_group.webserver-sg.*.id
  user_data       = file("install_ngnix.sh")
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "webserver-autoscaling" {
  name                      = "webserver-autoscaling"
  vpc_zone_identifier       = var.create_vpc ? module.main-vpc.public_subnets : aws_default_subnet.public.*.id
  launch_configuration      = aws_launch_configuration.webserver-launchconfig.name
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 300
  force_delete              = true
  target_group_arns         = aws_lb_target_group.lb_target_group.*.arn
  termination_policies      = ["OldestInstance"]

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true

  }
}
