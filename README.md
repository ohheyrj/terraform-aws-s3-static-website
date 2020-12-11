## Requirements

| Name | Version |
|------|---------|
| aws | 3.18.0 |

## Providers

| Name | Version |
|------|---------|
| aws | 3.18.0 |
| aws.us\_east\_1 | 3.18.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domain\_name | The domain of the static website. | `string` | n/a | yes |
| error\_document | The default error document. | `string` | `"error.html"` | no |
| index\_document | The default index document. Also the index document of cloudfront. | `string` | `"index.html"` | no |
| zone\_id | The zone ID for the domain name. | `string` | n/a | yes |

## Outputs

No output.

