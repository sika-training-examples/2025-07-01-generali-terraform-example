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

- [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/6.0.0/docs/resources/lb) (resource)
- [aws_lb_listener.listener80](https://registry.terraform.io/providers/hashicorp/aws/6.0.0/docs/resources/lb_listener) (resource)
- [aws_lb_target_group.tg80](https://registry.terraform.io/providers/hashicorp/aws/6.0.0/docs/resources/lb_target_group) (resource)
- [aws_lb_target_group_attachment.attach80](https://registry.terraform.io/providers/hashicorp/aws/6.0.0/docs/resources/lb_target_group_attachment) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: Name of the project

Type: `string`

### <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids)

Description: List of security group IDs to attach to the ALB

Type: `list(string)`

### <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id)

Description: List of subnet IDs where the ALB will be deployed

Type: `list(string)`

### <a name="input_target_instance_ids"></a> [target\_instance\_ids](#input\_target\_instance\_ids)

Description: List of target instance (EC2) IDs to attach to the ALB

Type: `list(string)`

### <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id)

Description: ID of the VPC where the ALB will be deployed

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_url"></a> [url](#output\_url)

Description: n/a
