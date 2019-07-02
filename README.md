# Terraform Module: Datadog Vault Monitoring

Keep tabs on Hashicorp Vault using Datadog. This module creates:
- A timeboard for various important metrics regarding cluster health
- (TODO) Monitors for system-critical metrics

## Requirements
- Terraform 0.12.0 or higher
- Terraform Datadog provider 2.0.0 or higher
    - `DATADOG_API_KEY` environment variable
    - `DATADOG_APP_KEY` environment variable

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| description | Description of the timeboard's content | string | `"(Created by Terraform) Timeboard showing Hashicorp Vault metrics"` | no |
| read\_only | Makes the timeboard read-only | string | `"true"` | no |
| template\_variable\_default | Default value for the `$vault_cluster` Datadog template variable | string | `"*"` | no |
| template\_variable\_prefix | Tag group for the `$vault_cluster` Datadog template variable | string | `"null"` | no |
| title | Name of the timeboard | string | `"Vault Status"` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | Unique ID of the Datadog timeboard |
| url | URL of the Datadog timeboard |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->