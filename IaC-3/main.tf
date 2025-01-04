resource "azurerm_resource_group" "terratest" {
  name     = var.rg_name
  location = var.location_name
  tags = {
    "env" = "dev"
  }
}

resource "azurerm_virtual_network" "terra-net1" {
  name = "terra-network"
  location = var.location_name
  resource_group_name = var.rg_name
  address_space = var.vnet_address
}
