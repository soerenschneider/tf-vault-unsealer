<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.vault_unseal](https://registry.terraform.io/providers/hashicorp/aws/6.9.0/docs/resources/kms_alias) | resource |
| [aws_kms_key.vault_unseal](https://registry.terraform.io/providers/hashicorp/aws/6.9.0/docs/resources/kms_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_arn"></a> [key\_arn](#output\_key\_arn) | n/a |
| <a name="output_key_name"></a> [key\_name](#output\_key\_name) | n/a |
<!-- END_TF_DOCS -->