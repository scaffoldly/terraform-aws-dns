resource "aws_route53_delegation_set" "main" {}

module "dns" {
  for_each = var.stages

  source  = "scaffoldly/stage-dns/aws"
  version = "0.15.4"

  dns_provider      = var.dns_provider
  stage             = each.key
  domain            = each.value.domain
  subdomain         = var.serverless_api_subdomain
  subdomain_suffix  = each.value.subdomain_suffix != null ? each.value.subdomain_suffix : ""
  delegation_set_id = aws_route53_delegation_set.main.id
  stage_env_vars    = each.value.env_vars != null ? each.value.env_vars : {}

  providers = {
    aws.dns = aws.dns
  }
}
