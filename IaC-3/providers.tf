terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "terra-intro"
  #   storage_account_name = "terrastorageekn1999x"
  #   container_name       = "terra-cont"
  #   key                  = "terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "06a8bf7d-a918-4bc6-8da4-d6033f25855b"
}
