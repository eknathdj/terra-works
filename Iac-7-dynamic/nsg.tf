resource "azurerm_resource_group" "rg-test" {
  name     = "terra-intro"
  location = "centralindia"
}

resource "azurerm_network_security_group" "nsg-terra" {
  name                = "nsg-test-terra"
  location            = "centralindia"
  resource_group_name = azurerm_resource_group.rg-test.name

  tags = {
    environment = "test"
    managed_by  = "terraform"
  }

  dynamic "security_rule" {
    for_each = var.nsg
    content {
      name                       = security_rule.key
      priority                   = tonumber(security_rule.value[0])
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = security_rule.value[1]
      source_port_range          = security_rule.value[2]
      destination_port_range     = security_rule.value[3]
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
  dynamic "security_rule" {
    for_each = var.nsg1
    content {
      name                       = security_rule.key
      priority                   = tonumber(security_rule.value[0])
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = security_rule.value[1]
      source_port_range          = security_rule.value[2]
      destination_port_range     = security_rule.value[3]
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}
