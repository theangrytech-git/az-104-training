variable "security" {
  description = "is security enabled"
  default     = true
}

# variable "group_name" {
#   description = "Group Name"
#   default = true
# }

variable "storage_accounts" {}
# donet use variable "uks_storage_general" {}
# dont use variable "uks_storage_mgmt" {}
# dont use variable "uks_storage_depts" {}
# dont use variable "uks_storage_monitoring" {}
# done use variable "uks_static_site" {}


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
variable "virtual_networks" {
  type = map(object({
    name                = string
    location            = string
    address_space       = list(string)
    resource_group_name = string
  }))
}

variable "subnets" {
  type = map(object({
    name           = string
    address_prefix = string
  }))
}

variable "resource_group_name" {}
# variable "location" {}
# variable "name" {}



# variable "subnet_id" {
  
# }


# variable "vmss_lin_uks_name" {}
# variable "vmss_lin_uks_rgs" {}
# variable "vmss_lin_uks_location" {}
# variable "vmss_lin_uks_network_interface_name" {}
# variable "vmss_lin_uks_ipconfig_name" {}
# variable "vmss_lin_uks_ipconfig_subnet" {}

# variable "vmss_win_uks_name" {}
# variable "vmss_win_uks_rgs" {}
# variable "vmss_win_uks_location" {}
# variable "vmss_win_uks_network_interface_name" {}
# variable "vmss_win_uks_ipconfig_name" {}
# variable "vmss_win_uks_ipconfig_subnet" {}

# variable vm_lin_uks_name {}
# variable vm_lin_uks_rgs {}
# variable vm_lin_uks_location {}
# variable vm_lin_uks_network_interface_name {}
# variable vm_lin_uks_ipconfig_name {}
# variable vm_lin_uks_ipconfig_subnet {}

# variable vm_win_uks_nic_name {}
# variable vm_win_uks_nic_location {}
# variable vm_win_uks_nic_rgs {}
# variable vm_win_uks_name {}
# variable vm_win_uks_rgs {}
# variable vm_win_uks_location {}
# variable vm_win_uks_ipconfig_subnet{}
