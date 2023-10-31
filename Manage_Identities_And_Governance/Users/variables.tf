variable "security" {
  description = "is security enabled"
  default     = true
}

# variable "azure_subscription_id" {
#   description = "Azure subscription ID"
#   type        = string
# }

# variable "group_name" {
#   description = "Group Name"
#   default = true
# }

#Storage Account Variables
variable "storage_accounts" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    account_tier = string
    account_replication_type = string
    account_kind = string
    cross_tenant_replication_enabled = bool
    min_tls_version = string
  }))
  default = {}
}

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

#Static Site
variable "static_website_index_document" {}
variable "static_website_error_404_document" {}
variable "static_website_source_folder" {}
variable "static_site" {}


#Virtual Network and Subnet Variables
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

#VM Variables

variable "win_virtual_machines" {
  description = "Map of Azure Virtual Machine configurations"
  type        = map(object({
    vm_name                 = string
    resource_group_name     = string
    location                = string
    # virtual_network_subnet_id = string
    # Add other VM configuration parameters here
  }))
  default = {}
}

variable "lin_virtual_machines" {
  description = "Map of Azure Virtual Machine configurations"
  type        = map(object({
    vm_name                 = string
    resource_group_name     = string
    location                = string
    # virtual_network_subnet_id = string
    # Add other VM configuration parameters here
  }))
  default = {}
}

variable "win_vmss" {
  description = "Map of Azure Virtual Machine configurations"
  type        = map(object({
    computer_name_prefix = string
    vmss_name                 = string
    resource_group_name     = string
    location                = string
    # virtual_network_subnet_id = string
    # Add other VM configuration parameters here
  }))
  default = {}
}

variable "compute_subnet" {
  description = "The key of the selected subnet"
  type        = string
  default     = "snet_uks_vms" # Specify the default subnet to use
}

variable "uks_vnet" {
  description = "The key of the selected subnet"
  type = string
  default = "vnet-uks-01"
}

variable "uks_compute_rg" {
  description = "The key of the select RG"
  type = string
  default = "rg-uks-compute"
}


variable "key_vault" {
type        = map(object({
    name                 = string
    resource_group_name     = string
    location                = string
  }))  
}

variable "app_config" {
type        = map(object({
    name                 = string
    resource_group_name     = string
    location                = string
    sku                     = string
  }))  
}


variable "log_analytics_workspace" {
type        = map(object({
    log_name                 = string
    resource_group_name     = string
    location                = string
  }))
}

variable "app_insights" {
type        = map(object({
    name                 = string
    resource_group_name     = string
    location                = string
  }))

}