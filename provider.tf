# provider.tf
# Configure the FlexibleEngine Provider with Username/Password 
provider "flexibleengine" {
  access_key  = var.access_key
  secret_key  = var.secret_key
  domain_name = var.domain_name
  region      = var.region
}

# provider.tf
terraform {
  required_version = ">= 0.13"

  required_providers {
    flexibleengine = {
      source = "FlexibleEngineCloud/flexibleengine"
      version = ">= 1.30.0"
    }
  }
}