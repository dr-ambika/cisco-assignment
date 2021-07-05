# SSH keypair for instance login
resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = file(var.path_to_public_key)
}
