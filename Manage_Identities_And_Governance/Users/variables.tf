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

variable "vnetuksname" {}
variable "vnetukslocation" {}
variable "vnetuksrg" {}
variable "uksaddress_space" {}
variable "subnets" {}

# variable "roles" {
#   type = list(string)
#   default = ["Reader", "Virtual Machine Contributor", "Virtual Machine User Login", "Reader and Data Access", "Data Purger"]
# }

# variable "roles" {
#   type    = list(string)
#   default = ["Reader"]
# }