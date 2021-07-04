resource "aws_instance" "web" {
  count                  = var.instance_count
  ami                    = lookup(var.ami, var.aws_region)
  instance_type          = var.instance_type
  key_name               = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  # user_data              = file("install_ngnix.tpl")

  provisioner "file" {
    source      = "install_ngnix.sh"
    destination = "/tmp/install_ngnix.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install_ngnix.sh",
      "sudo sed -i -e 's/\r$//' /tmp/install_ngnix.sh", # Remove the spurious CR characters.
      "sudo /tmp/script.sh",
    ]
  }

  tags = {
    Name = "webserver-${count.index + 1}"
  }
}
