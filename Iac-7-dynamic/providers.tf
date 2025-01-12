terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.15.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "06a8bf7d-a918-4bc6-8da4-d6033f25855b"
}