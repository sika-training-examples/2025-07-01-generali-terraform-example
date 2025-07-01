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

- [aws_ami.this](https://registry.terraform.io/providers/hashicorp/aws/6.0.0/docs/data-sources/ami) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_debian_version"></a> [debian\_version](#input\_debian\_version)

Description: Version of the Debian

Type: `number`

Default: `12`

## Outputs

The following outputs are exported:

### <a name="output_debian_ami_id"></a> [debian\_ami\_id](#output\_debian\_ami\_id)

Description: ID of the Debian AMI
