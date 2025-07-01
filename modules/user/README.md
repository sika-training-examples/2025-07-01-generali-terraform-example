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

- [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/6.0.0/docs/resources/iam_access_key) (resource)
- [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/6.0.0/docs/resources/iam_user) (resource)
- [aws_secretsmanager_secret.keys](https://registry.terraform.io/providers/hashicorp/aws/6.0.0/docs/resources/secretsmanager_secret) (resource)
- [aws_secretsmanager_secret_version.keys](https://registry.terraform.io/providers/hashicorp/aws/6.0.0/docs/resources/secretsmanager_secret_version) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: name of the user

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_keys_cli"></a> [keys\_cli](#output\_keys\_cli)

Description: n/a

### <a name="output_keys_console"></a> [keys\_console](#output\_keys\_console)

Description: n/a

### <a name="output_name"></a> [name](#output\_name)

Description: n/a
