variable "aws_profile" {
  description = "AWS Terraform User Profile"
  default     = "terraform"
}

variable "key_name" {
  description = "AWS Instance keypair name"
  default     = "webserver_key"
}
variable "instance_count" {
  description = "AWS Instance Count"
  default     = "1"
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "AWS Instance Type"
  default     = "t2.micro"
}

variable "ami" {
  description = "AWS Ubuntu AMI"
  type        = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0d729a60"
  }
}

variable "availability_zones" {
  description = "AWS Region availability_zones"
  type        = list(any)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e"]
}

variable "path_to_public_key" {
  default = "mykey.pub"
}
