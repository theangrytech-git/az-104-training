# variable "subnets" {
#   description = "The configurations for the subnets to be created."
#   type        = map(any)
# }

variable "subnets" {
  description = "The configurations for the subnets to be created."
  type        = map(object({
    name             = string
    address_prefixes = list(string)
    service_endpoints = list(string)
  }))
}

variable "resource_group_name" {
  description = "The name of the resource group in which the subnets should be created."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network in which the subnets should be created."
  type        = string
}