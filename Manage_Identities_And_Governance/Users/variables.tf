variable "security" {
  description = "is security enabled"
  default     = true
}

# variable "roles" {
#   type    = list(string)
#   default = ["Reader"]
# }

# variable "group_name" {
#   description = "Group Name"
#   default = true
# }

variable "resource_groups_uksouth" {
  type    = list(string)
  default = ["sales", "mgmt", "research", "temp", "random", "storage", "vm", "backend", "network"]

}

# variable "roles" {
#   type = list(string)
#   default = ["Reader", "Virtual Machine Contributor", "Virtual Machine User Login", "Reader and Data Access", "Data Purger"]
# }