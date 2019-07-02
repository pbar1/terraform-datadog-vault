# Terraform Module: Datadog Vault Monitoring

Keep tabs on Hashicorp Vault using Datadog. This module creates:
- A timeboard for various important metrics regarding cluster health
- Monitors for system-critical metrics

## Requirements
- Terraform 0.12.0 or higher
- Terraform Datadog provider 2.0.0 or higher
    - `DATADOG_API_KEY` environment variable
    - `DATADOG_APP_KEY` environment variable

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->