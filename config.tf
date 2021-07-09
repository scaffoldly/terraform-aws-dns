terraform {
  required_version = ">= 0.15"
  experiments      = [module_variable_optional_attrs]
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.dns]
    }
  }
}

provider "aws" {
  alias = "dns"
}
