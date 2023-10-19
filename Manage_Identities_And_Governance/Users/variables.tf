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