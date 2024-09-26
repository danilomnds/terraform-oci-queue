terraform {
  required_version = ">= 1.9.5"
  required_providers {
    oci = {
      version = ">= 6.8.0"
    }
  }
}

/* if you're going to create the resource out of your home region
provider "oci" {
  alias        = "home-region"
  tenancy_ocid = ""
  region       = ""
}*/