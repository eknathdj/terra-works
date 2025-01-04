resource "azurerm_resource_group" "terra-res" {
  name     = "terra-res2"
  location = "centralindia"
  tags = {
    env = "dev"
  }
}

# resource "azurerm_virtual_network" "terra-net1" {
#   name = "terra-network"
#   location = azurerm_resource_group.terra-res.location
#   resource_group_name = azurerm_resource_group.terra-res.name
#   address_space = ["10.0.0.0/16"]
# }

# resource "azurerm_subnet" "terra-sub" {
#   name = "terra-subnet"
#   resource_group_name = azurerm_resource_group.terra-res.name
#   virtual_network_name = azurerm_virtual_network.terra-net1.name
#   address_prefixes = ["10.0.1.0/24"]
# }

resource "azurerm_storage_account" "terra-store" {
  count                    = 2
  name                     = "terrastorageexek${count.index}"
  resource_group_name      = azurerm_resource_group.terra-res.name
  location                 = azurerm_resource_group.terra-res.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

# resource "azurerm_storage_container" "terra-cont" {
#   count                = 2
#   name                 = "terra-container"
#   storage_account_name = azurerm_storage_account.terra-store[count.index].name

# }    