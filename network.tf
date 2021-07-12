# Create New VPC and its resources

module "main-vpc" {
  create_vpc = var.create_vpc
  source     = "terraform-aws-modules/vpc/aws"

  name = "vpc-${var.env}"
  cidr = "10.0.0.0/16"

  azs             = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = var.env
  }
}
