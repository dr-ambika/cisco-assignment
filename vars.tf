variable "aws_profile" {
  description = "AWS Terraform User Profile"
  default     = "terraform"
}

variable "key_name" {
  description = "AWS Instance keypair name"
  default     = "webserver_key"
}
variable "aws_region" {
  description = "AWS region"
  default     = "us-east-2"
}

variable "instance_type" {
  description = "AWS Instance Type"
  default     = "t2.micro"
}

variable "ami" {
  description = "AWS Ubuntu AMI"
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0d729a60"
    us-east-2 = "ami-00399ec92321828f5"
  }
}

variable "availability_zones" {
  description = "AWS Region availability_zones"
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "path_to_public_key" {
  default = "webserver_key.pub"
}

variable "create_vpc" {
  description = "Controls if VPC should be created"
  default     = true
}

variable "sg_count" {
  description = "Security Group count"
  default     = 1
}

variable "cidr" {
  description = "The CIDR block for Inbound rukes. Default value is a valid CIDR, but needs to be changed for security purposes"
  default     = ["0.0.0.0/0"]
}

variable "env" {
  default = "test"
}

variable "public_subnets" {
  description = "AWS public subnets"
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "private_subnets" {
  description = "AWS private subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "port_mappings" {
  description = "Load Balancer Port Mappings"
  default = {
    "80" = "80"
  }
}

variable "lb_count" {
  description = "load balancer count"
  default     = 1
}

variable "type" {
  description = "load balancer type"
  default     = "application"
}

variable "internal" {
  description = "load balancer internal"
  default     = false
}

variable "lb_name" {
  description = "load balancer namel"
  default     = "webserver-lb"
}
