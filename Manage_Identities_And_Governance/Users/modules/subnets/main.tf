resource "azurerm_subnet" "subnet" {
for_each = var.subnets
name = each.value.name
resource_group_name = var.resource_group_name
virtual_network_name = var.virtual_network_name
address_prefixes = each.value.address_prefixes
service_endpoints = each.value.service_endpoints

dynamic "delegation" {
  for_each = toset(each.value.delegation)

content {
  name = delegation.value.name

  service_delegation {
    name = delegation.value.service_delegation
    actions = delegation.value.service_delegation_actions
  }
 }
}
}