variable "name" {}
variable "resource_group_name" {}
variable "location" {}
variable "size" {
    default = "Standard_B1s" 
}    

variable "network_interface_name" {}
variable "network_interface_ids" {}
variable "vm_win_nic_name" {}
variable "nic_resource_group_name" {}
variable "subnet_id" {}

variable "subnets" {
  description = "A map of subnet details."
  type        = map(object({
    name              = string
    resource_group    = string
    virtual_network   = string
  }))
}

variable "nic_location" {}

#variable "network_interface_primary" {}

variable "ipconfig_name" {}
variable "ipconfig_primary" {}
variable "ipconfig_subnet" {}