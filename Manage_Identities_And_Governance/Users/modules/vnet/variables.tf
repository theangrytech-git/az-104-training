variable "name" {
  description = "The name of the virtual network."
  type        = string
}

variable "location" {
  description = "The Azure Region in which the virtual network should exist."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the virtual network should be created."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space that is used by the virtual network. This should be a list of address prefixes."
  type        = list(string)
}

variable "subnets" {
  type = map(object({
    name           = string
    address_prefix = list(string)
  }))
}