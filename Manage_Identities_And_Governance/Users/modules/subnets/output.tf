output "data" {
  value = tomap({for s, id in azurerm_subnet.subnet: s =>id })
}
