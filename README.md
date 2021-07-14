[![Maintained by Scaffoldly](https://img.shields.io/badge/maintained%20by-scaffoldly-blueviolet)](https://github.com/scaffoldly)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/scaffoldly/terraform-aws-dns)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.15.0-blue.svg)

## Description

Manage DNS for all provided stages.

## Usage

```hcl
module "dns" {
  source = "scaffoldly/dns/aws"

  serverless_api_subdomain = var.serverless_api_subdomain
  stages                   = var.stages
  dns_provider             = var.dns_provider

  providers = {
    aws.dns = aws.root
  }

  depends_on = [
    module.aws_logging
  ]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.33.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.33.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dns"></a> [dns](#module\_dns) | scaffoldly/stage-dns/aws | 0.15.4 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_delegation_set.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_delegation_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_provider"></a> [dns\_provider](#input\_dns\_provider) | The DNS provider (Route53 currently only supported) | `string` | n/a | yes |
| <a name="input_serverless_api_subdomain"></a> [serverless\_api\_subdomain](#input\_serverless\_api\_subdomain) | The domain to use for serverless APIs | `string` | n/a | yes |
| <a name="input_stages"></a> [stages](#input\_stages) | A map of stages (nonlive/live) and their associated properties | <pre>map(<br>    object({<br>      domain           = string<br>      subdomain_suffix = optional(string)<br>      env_vars         = optional(map(string))<br>    })<br>  )</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_stage_domains"></a> [stage\_domains](#output\_stage\_domains) | Every stage's configurations |
<!-- END_TF_DOCS -->
