module "my_vpc" {
  source = "git::https://github.com/sika-training-examples/2025-07-01-generali-terraform-example.git//modules/vpc"

  name       = "my-vpc"
  cidr_block = "10.10.0.0/16"
  subnets = [
    {
      cidr_block        = "10.10.1.0/24"
      availability_zone = "eu-north-1a"
    },
    {
      cidr_block        = "10.10.2.0/24"
      availability_zone = "eu-north-1b"
    }
  ]
}
