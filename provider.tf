# provider.tf
# Configure the FlexibleEngine Provider with Username/Password 
provider "flexibleengine" {
  access_key  = var.fe_access_key
  secret_key  = var.fe_secret_key
  domain_name = var.fe_domain_name
  region      = var.fe_region
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