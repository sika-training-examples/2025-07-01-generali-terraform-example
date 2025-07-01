## Requirements

The following requirements are needed by this module:

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (6.0.0)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (6.0.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/6.0.0/docs/resources/internet_gateway) (resource)
- [aws_route_table.rt](https://registry.terraform.io/providers/hashicorp/aws/6.0.0/docs/resources/route_table) (resource)
- [aws_route_table_association.rta](https://registry.terraform.io/providers/hashicorp/aws/6.0.0/docs/resources/route_table_association) (resource)
- [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/6.0.0/docs/resources/subnet) (resource)
- [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/6.0.0/docs/resources/vpc) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block)

Description: CIDR block for the VPC

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: Name of the VPC

Type: `string`

### <a name="input_subnets"></a> [subnets](#input\_subnets)

Description: List of subnets in the VPC

Type:

```hcl
list(object({
    cidr_block        = string
    availability_zone = string
  }))
```

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids)

Description: List of subnet IDs

### <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id)

Description: ID of the VPC
