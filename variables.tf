variable "dns_provider" {
  type        = string
  description = "The DNS provider (Route53 currently only supported)"
}
variable "serverless_api_subdomain" {
  type        = string
  description = "The domain to use for serverless APIs"
}
variable "stages" {
  type = map(
    object({
      domain           = string
      subdomain_suffix = optional(string)
      env_vars         = optional(map(string))
    })
  )
  description = "A map of stages (nonlive/live) and their associated properties"
}
