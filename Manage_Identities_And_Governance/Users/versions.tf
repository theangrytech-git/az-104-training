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
  features {}
}

provider "random" {
  # Configuration options
}

