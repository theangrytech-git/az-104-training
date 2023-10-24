resource_group_name = {
  #UK SOUTH RG'S
  storage_uks = { name = "rg-uks-storage", location = "uksouth" }
  compute_uks = { name = "rg-uks-compute", location = "uksouth" }
  data_uks    = { name = "rg-uks-data", location = "uksouth" }
  monitoring_uks = { name = "rg-uks-monitor", location = "uksouth" }
  #UK WEST RG'S
  storage_ukw = { name = "rg-ukw-storage", location = "ukwest" }
  compute_ukw = { name = "rg-ukw-compute", location = "ukwest" }
  data_ukw    = { name = "rg-ukw-data", location = "ukwest" }
  monitoring_ukw = { name = "rg-ukw-monitor", location = "ukwest" }
  #WEST EUROPE RG'S
  storage_weu = { name = "rg-weu-storage", location = "westeurope" }
  compute_weu = { name = "rg-weu-compute", location = "westeurope" }
  data_weu    = { name = "rg-weu-data", location = "westeurope" }
  monitoring_weu = { name = "rg-weu-monitor", location = "westeurope" }
}

uks_storage_general = {
  name                             = "storagegeneral"
  resource_group_name              = "storage"
  location                         = "uksouth"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
}

uks_storage_mgmt = {
  name                             = "uksstoragemgmt"
  resource_group_name              = "rg-uks-storage"
  location                         = "uksouth"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
}

uks_storage_depts = {
  name                             = "uksstoragedepts"
  resource_group_name              = "rg-uks-storage"
  location                         = "uksouth"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
}

uks_storage_monitoring = {
  name                             = "uksstoragemonitoring"
  resource_group_name              = "rg-uks-monitor"
  location                         = "uksouth"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
}

uks_static_site = {
  name                             = "uksstaticsite"
  resource_group_name              = "rg-uks-storage"
  location                         = "uksouth"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"

  static_website = {
    index_document = "index.html"
  }
}

#Virtual Networks and Subnets for UKS
location = "uksouth"
vnet_rg = "rg-uks-compute"
vnet_address_space = ["10.0.0.0/16", "10.1.0.0/24"]
vnet_name = "vnet-uks-01"
subnets = {
  uks_vms = {
    name = "sm_uks_vms",
    address_prefix = ["10.0.2.0/24"], 
    service_endpoints = ["Microsoft.Containerinstance/containerGroups", "Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web"]
    }
  uks_storage = {
    name = "snet_uks_storage", 
    address_prefix = ["10.1.2.0/24"], 
    service_endpoints = ["Microsoft.AzureActiveDirectory", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web"] 
    },
  uks_db      = {
    name = "snet_uks_db", 
    address_prefix =["10.1.3.0/24"], 
    service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"] 
    },
  uks_functions = {
    name = "snet_uks_functions", 
    address_prefix = ["10.1.4.0/24"],
    service_endpoints = ["Microsoft.AzureActiveDirectory", "Microsoft.Storage", "Microsoft.Web"] 
    },
  uks_projects  = {
    name = "snet_uks_projects", 
    address_prefix = ["10.1.5.0/24"], 
    service_endpoints = ["Microsoft.AzureActiveDirectory", "Microsoft.Storage", "Microsoft.Web"] 
    },
}

#VMSS LINUX UK SOUTH
vmss_lin_uks_name = "projects"
vmss_lin_uks_rgs = "rg-uks-compute"
vmss_lin_uks_location = "uksouth"
vmss_lin_uks_network_interface_name = "vmss_lin_uks_ni_01"
vmss_lin_uks_ipconfig_name = "vmss_lin_ipconfig_uks"
vmss_lin_uks_ipconfig_subnet = "sm_uks_vms"

#VMSS WINDOWS UK SOUTH
vmss_win_uks_name = "projects"
vmss_win_uks_rgs = "rg-uks-compute"
vmss_win_uks_location = "uksouth"
vmss_win_uks_network_interface_name = "vmss_win_uks_ni_01"
vmss_win_uks_ipconfig_name = "vmss_win_ipconfig_uks"
vmss_win_uks_ipconfig_subnet = "sm_uks_vms"

#VM LINUX UK SOUTH
vm_lin_uks_name = "dark_science"
vm_lin_uks_rgs = "rg-uks-compute"
vm_lin_uks_location = "uksouth"
vm_lin_uks_network_interface_name = "vm_lin_uks_ni_01"
vm_lin_uks_ipconfig_name = "vm_lin_ipconfig_uks"
vm_lin_uks_ipconfig_subnet = "sm_uks_vms"

#VM WINDOWS UK SOUTH
vm_win_uks_name = "weird_science"
vm_win_uks_rgs = "rg-uks-compute"
vm_win_uks_location = "uksouth"
vm_win_uks_network_interface_name = "vm_win_uks_ni_01"
vm_win_uks_ipconfig_name = "vm_win_ipconfig_uks"
vm_win_uks_ipconfig_subnet = "sm_uks_vms"
