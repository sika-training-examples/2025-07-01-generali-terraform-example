terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
  }
}

variable "debian_version" {
  description = "Version of the Debian"
  type        = number
  default     = 12
}

data "aws_ami" "this" {
  most_recent = true
  owners      = ["136693071363"]

  filter {
    name   = "name"
    values = ["debian-${var.debian_version}-amd64-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

output "debian_ami_id" {
  description = "ID of the Debian AMI"
  value       = data.aws_ami.this.id
}
