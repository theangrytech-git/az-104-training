variable "name" {}
variable "resource_group_name" {}
variable "location" {}
variable "size" {
    default = "Standard_B1s" 
}    

variable "network_interface_name" {}
variable "network_interface_ids" {
  
}
#variable "network_interface_primary" {}

variable "ipconfig_name" {}
variable "ipconfig_primary" {}
variable "ipconfig_subnet" {}