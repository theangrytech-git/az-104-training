output "data" {
  value = tomap({for s, id in azurerm_subnet.subnet: s =>id })
}

output "subnet_ids" {
  value = azurerm_subnet.subnet[*].id
}