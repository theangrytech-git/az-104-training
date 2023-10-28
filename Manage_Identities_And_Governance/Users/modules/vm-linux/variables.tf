variable "name" {}
variable "resource_group_name" {}
variable "location" {}
variable "size" {
    default = "Standard_B1s" 
}    
variable "nic_location" {}
variable "nic_resource_group_name" {}
variable "subnet_id" {}
variable "vm_lin_nic_name" {}

variable "network_interface_name" {}
variable "network_interface_ids" {}
variable ipconfig_subnet_id {}

variable "ipconfig_name" {}
variable "ipconfig_primary" {}
variable "ipconfig_subnet" {}