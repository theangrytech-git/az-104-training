variable "security" {
  description = "is security enabled"
  default     = true
}

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
    use = string
  }))
  description = "Map of Storage Accounts"
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
   description = "List of Containers to be created within the Dept Storage Account"
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
    subnets             = map(object({
      name           = string
      address_prefix = string
       }))
    use = string
  }))
  description = "Map of Virtual Networks and Subnets"
}

variable "resource_group_name" {
  description = "Map of Resource Group Names"
}

#VM Variables
variable "win_virtual_machines" {
  description = "Map of Azure Virtual Machine configurations"
  type        = map(object({
    vm_name                 = string
    resource_group_name     = string
    location                = string
    use = string
  }))
  default = {}
}

variable "lin_virtual_machines" {
  description = "Map of Azure Virtual Machine configurations"
  type        = map(object({
    vm_name                 = string
    resource_group_name     = string
    location                = string
    use = string
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
    use = string
  }))
  default = {}
}

variable "nsg" {
    type        = map(object({
    name                 = string
    resource_group_name     = string
    location                = string
  }))
  description = "Map of NSG's"
  default = {}
}

variable "compute_subnet" {
  description = "The key of the selected subnet"
  type        = string
  default     = "snet_uks_vms"
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

variable "peering" {
  type        = map(object({
    name                 = string
    resource_group_name     = string
    vnet_1    = string
    vnet_2    = string
  })) 
  description = "Map for Network Peering"
}

variable "bastion_location" {}
variable "bastion_resource_group" {}

variable "key_vault" {
  type        = map(object({
    name                 = string
    resource_group_name     = string
    location                = string
    use = string
  }))  
  description = "Map of Key Vaults"
}

variable "app_config" {
  type        = map(object({
    name                 = string
    resource_group_name     = string
    location                = string
    sku                     = string
    use = string
  }))  
  description = "Map of App Configs"
}


variable "log_analytics_workspace" {
  type        = map(object({
    log_name                 = string
    resource_group_name     = string
    location                = string
    use = string
  }))
  description = "Map of Log Analytics"
}

variable "app_insights" {
  type        = map(object({
    name                 = string
    resource_group_name     = string
    location                = string
    use = string
  }))
  description = "Map of App Insights"
}