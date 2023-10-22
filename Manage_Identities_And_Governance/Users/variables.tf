variable "security" {
  description = "is security enabled"
  default     = true
}

# variable "group_name" {
#   description = "Group Name"
#   default = true
# }

variable "uks_storage_general" {}
variable "uks_storage_mgmt" {}
variable "uks_storage_depts" {}
variable "uks_storage_monitoring" {}
variable "uks_static_site" {}
variable "resource_group_name" {}
variable "container_name" {
type = list(string)
default = [ "accounting",
   "hr",
   "management",
   "product-oversight",
   "rd",
   "reception",
   "sabre",
   "sales",
   "temp",
   "warehouse"]
}

variable "location" {}
variable "vnet_rg" {}
variable "vnet_name" {}
variable "vnet_address_space" { 
    type = list(string) 
}
variable "subnets" { 
    type = map(any)    
}


variable "vmss_lin_uks_name" {}
variable "vmss_lin_uks_rgs" {}
variable "vmss_lin_uks_location" {}
variable "vmss_lin_uks_network_interface_name" {}
variable "vmss_lin_uks_ipconfig_name" {}
variable "vmss_lin_uks_ipconfig_subnet" {}

variable "vmss_win_uks_name" {}
variable "vmss_win_uks_rgs" {}
variable "vmss_win_uks_location" {}
variable "vmss_win_uks_network_interface_name" {}
variable "vmss_win_uks_ipconfig_name" {}
variable "vmss_win_uks_ipconfig_subnet" {}

variable vm_lin_uks_name {}
variable vm_lin_uks_rgs {}
variable vm_lin_uks_location {}
variable vm_lin_uks_network_interface_name {}
variable vm_lin_uks_ipconfig_name {}
variable vm_lin_uks_ipconfig_subnet {}

variable vm_win_uks_name {}
variable vm_win_uks_rgs {}
variable vm_win_uks_location {}
variable vm_win_uks_network_interface_name {}
variable vm_win_uks_ipconfig_name {}
variable vm_win_uks_ipconfig_subnet {}