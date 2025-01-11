# import {
#   id = "/subscriptions/06a8bf7d-a918-4bc6-8da4-d6033f25855b/resourceGroups/network_test/providers/Microsoft.Network/networkInterfaces/test-terra-vm284_z1"
#   to = azurerm_network_interface.terra-interface
# }

import {
  id = "/subscriptions/06a8bf7d-a918-4bc6-8da4-d6033f25855b/resourceGroups/network_test"
  to = azurerm_resource_group.terrargtest
}

import {
  id = "/subscriptions/06a8bf7d-a918-4bc6-8da4-d6033f25855b/resourceGroups/NetworkWatcherRG"
  to = azurerm_resource_group.terrargtest1
}

# import {
#   id = "/subscriptions/06a8bf7d-a918-4bc6-8da4-d6033f25855b/resourceGroups/network_test/providers/Microsoft.Compute/virtualMachines/test-terra-vm"
#   to = azurerm_virtual_machine.terra-vm 
# }