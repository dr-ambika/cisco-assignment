output "ELB" {
  value = ["${aws_lb.webserver-lb.*.dns_name}"]
}
