resource "azurerm_resource_group" "terratest" {
  name     = "terra-intro"
  location = "centralindia"
  tags = {
    "env" = "dev"
  }


resource "azurerm_public_ip" "public" {
  name                = "pub-vm"
  resource_group_name = azurerm_resource_group.terratest.name
  location            = azurerm_resource_group.terratest.location
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

resource "azurerm_virtual_network" "terra-network" {
  name                = "terra-t-network"
  resource_group_name = azurerm_resource_group.terratest.name
  location            = azurerm_resource_group.terratest.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "terra-subnet" {
  name                 = "terra-t-subnet"
  resource_group_name  = azurerm_resource_group.terratest.name
  virtual_network_name = azurerm_virtual_network.terra-network.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "terra-interface" {
  name                = "terra-nic"
  resource_group_name = azurerm_resource_group.terratest.name
  location            = azurerm_resource_group.terratest.location
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.terra-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public.id
  }
}

resource "azurerm_network_security_group" "terra-nsg" {
  name                = "terra-nsg"
  resource_group_name = azurerm_resource_group.terratest.name
  location            = azurerm_resource_group.terratest.location
  security_rule {
    name                       = "terra-nsg-rule"
    description                = "sg-creation"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 100
    direction                  = "Inbound"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "terra-grp-nw-association" {
  network_interface_id      = azurerm_network_interface.terra-interface.id
  network_security_group_id = azurerm_network_security_group.terra-nsg.id
}
