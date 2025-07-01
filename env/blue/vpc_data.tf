data "aws_vpc" "my_vpc" {
  filter {
    name   = "tag:Name"
    values = ["my-vpc"]
  }
}

data "aws_subnets" "my_vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.my_vpc.id]
  }
}

locals {
  my_vpc_subnet_ids = data.aws_subnets.my_vpc_subnets.ids
}

output "subnet_ids" {
  value = local.my_vpc_subnet_ids
}
