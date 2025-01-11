resource "azurerm_windows_virtual_machine" "terra-win-vm" {
  name                  = "terrawindows-vm"
  location              = azurerm_resource_group.terratest.location
  resource_group_name   = azurerm_resource_group.terratest.name
  network_interface_ids = azurerm_network_interface.terra-interface.*.id
  admin_username        = "srvadmin"
  admin_password        = "P@ssw0rd123!"
  size                  = "Standard_B1s"
  license_type          = "Windows_Server"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-g2"
    version   = "latest"
  }
}

resource "azurerm_managed_disk" "terra-data-disk" {
  name                 = "terra-data-disk"
  resource_group_name  = azurerm_resource_group.terratest.name
  location             = azurerm_resource_group.terratest.location
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  #depends_on = [azurerm_windows_virtual_machine.terra-win-vm]
}

resource "azurerm_virtual_machine_data_disk_attachment" "terra-data-disk-attach" {
  virtual_machine_id = azurerm_windows_virtual_machine.terra-win-vm.id
  managed_disk_id    = azurerm_managed_disk.terra-data-disk.id
  lun                = 10
  caching            = "ReadWrite"
}