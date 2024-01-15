terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.71.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}
# Configuration options
provider "azurerm" {
  features {
      app_configuration {
      purge_soft_delete_on_destroy = true
      recover_soft_deleted         = true
    }
    resource_group {
    prevent_deletion_if_contains_resources = false
    }

  }
}

provider "random" {
  # Configuration options
}

