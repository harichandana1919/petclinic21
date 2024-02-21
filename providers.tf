terraform {
  required_version = ">=0.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0, < 4.0"
    }
  }
}

terraform {
  backend "azurerm" {
    storage_account_name = "snowstora"
    resource_group_name  = "AKS-Terraform"
    container_name       = "snowcontainer"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}