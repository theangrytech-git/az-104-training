resource "azurerm_virtual_network" "vnet" {
    name                = var.name
    location            = var.location
    resource_group_name = var.resource_group_name
    address_space       = var.vnet_address_space
    
        dynamic "subnet" {
            for_each = var.subnets
            content {
                name                 = subnet.value.name
                address_prefix       = subnet.value.address_prefix[0] 
            }
        }
}
output "vnet_name" {
    value       = azurerm_virtual_network.vnet.name
    }
