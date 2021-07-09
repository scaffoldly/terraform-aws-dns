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

## Providers

## Modules

## Resources

## Inputs

## Outputs

<!-- END_TF_DOCS -->
