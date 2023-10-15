resource "azurerm_virtual_network" "vnet" {
name = var.name
location = var.location
resource_group_name = var.resource_group_name
address_space = var.address_space

dynamic "subnet" {
#for_each = var.subnets
for_each = toset(var.subnets) #Blocker: Invalid value for "v" parameter: cannot convert object to set of any single type.

content {
  name = subnet.value.name
address_prefix = subnet.value.address_prefix
security_group = subnet.value.security_group
 }
}
}
