# SSH keypair for instance login
resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = file(var.path_to_public_key)
}
# resource "tls_private_key" "webserver" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }
#
# resource "aws_key_pair" "generated_key" {
#   key_name   = var.key_name
#   public_key = tls_private_key.webserver.public_key_openssh
# }
