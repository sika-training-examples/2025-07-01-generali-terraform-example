variable "name" {
  description = "Name of the VPC"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnets" {
  description = "List of subnets in the VPC"
  type = list(object({
    cidr_block        = string
    availability_zone = string
  }))
}
