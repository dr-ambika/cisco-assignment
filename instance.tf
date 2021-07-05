resource "aws_instance" "web" {
  count                  = var.instance_count
  ami                    = lookup(var.ami, var.aws_region)
  instance_type          = var.instance_type
  key_name               = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  user_data              = file("install_ngnix.sh")
  tags = {
    Name = "webserver-${count.index + 1}"
  }
}
