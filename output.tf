output "stage_domains" {
  value = {
    for domain in module.dns :
    domain.stage => {
      domain                = domain.domain
      subdomain             = domain.subdomain
      subdomain_suffix      = domain.subdomain_suffix
      serverless_api_domain = domain.serverless_api_domain
      platform_domains      = domain.platform_domains
      stage_env_vars        = domain.stage_env_vars
      certificate_arn       = domain.certificate_arn
      dns_provider          = domain.dns_provider
      dns_domain_id         = domain.dns_domain_id
    }
  }
  description = "Every stage's configurations"
}
