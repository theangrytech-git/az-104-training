variable "name" {}
variable "resource_group_name" {}
variable "location" {}
variable "sku" {
    default = "Standard_B1s"
}
variable "instances" {
    default = 3
}



variable "network_interface_name" {}
variable "network_interface_primary" {}

variable "ipconfig_name" {}
variable "ipconfig_primary" {}
variable "ipconfig_subnet" {}
