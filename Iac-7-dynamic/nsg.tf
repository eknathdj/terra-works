resource "azurerm_resource_group" "rg-test" {
  name     = "terra-intro"
  location = "centralindia"
}

resource "azurerm_network_security_group" "nsg-test-terra" {
  name                = "nsg-test-terra"
  location            = "centralindia"
  resource_group_name = azurerm_resource_group.rg-test.name

  dynamic "security_rule" {
    for_each = var.nsg
    content {
      name                       = security_rule.key
      priority                   = security_rule.value[0]
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = security_rule.value[1]
      source_port_range          = security_rule.value[2]
      destination_port_range     = security_rule.value[3]
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}
