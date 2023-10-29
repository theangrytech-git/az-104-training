#### Resource Groups

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

#### Storage Accounts
storage_accounts = {
uks_storage_general = {
  name                             = "storagegeneral"
  resource_group_name              = "rg-uks-storage"
  location                         = "uksouth"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
},

uks_storage_mgmt = {
  name                             = "uksstoragemgmt"
  resource_group_name              = "rg-uks-storage"
  location                         = "uksouth"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
},

uks_storage_depts = {
  name                             = "uksstoragedepts"
  resource_group_name              = "rg-uks-storage"
  location                         = "uksouth"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
},

uks_storage_monitoring = {
  name                             = "uksstoragemonitoring"
  resource_group_name              = "rg-uks-monitor"
  location                         = "uksouth"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
},
}

static_site = {
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
    error_404_document = "error.html"
    source_folder = "../static-content"
  }
},




}

###Static Website
static_website_index_document = "index.html"
static_website_error_404_document = "error.html"
static_website_source_folder = "../static-content"

#### Virtual Networks and Subnets
virtual_networks = {
  uks = {
    name                = "vnet-uks-01"
    location            = "uksouth"
    address_space       = ["10.10.0.0/16"]
    resource_group_name = "rg-uks-compute"
  }
}
  
subnets = {
  uks_vms = {
      name = "snet_uks_vms"
      address_prefix = "10.10.1.0/24" 
      service_endpoints = ["Microsoft.Containerinstance/containerGroups", "Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web"]
    }
  uks_storage = {
      name = "snet_uks_storage"
      address_prefix = "10.10.2.0/24" 
      service_endpoints = ["Microsoft.AzureActiveDirectory", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web"] 
    },
  uks_db      = {
      name = "snet_uks_db"
      address_prefix = "10.10.3.0/24"
      service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"] 
    },
  uks_functions = {
      name = "snet_uks_functions" 
      address_prefix = "10.10.4.0/24"
      service_endpoints = ["Microsoft.AzureActiveDirectory", "Microsoft.Storage", "Microsoft.Web"] 
    },
  uks_projects  = {
      name = "snet_uks_projects" 
      address_prefix = "10.10.5.0/24"
      service_endpoints = ["Microsoft.AzureActiveDirectory", "Microsoft.Storage", "Microsoft.Web"] 
    },
}

win_virtual_machines = {
  uks_win_vm_1 = {
    vm_name                 = "weird-science"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"
  },
  uks_win_vm_2 = {
    vm_name                 = "dark-science"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"
  },
  uks_win_vm_3 = {
    vm_name                 = "banned-science"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"
  }
}

lin_virtual_machines = {
  uks_lin_vm_1 = {
    vm_name                 = "sketchy-stuff"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"
  },
  uks_lin_vm_2 = {
    vm_name                 = "weird-stuff"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"
  },
  uks_lin_vm_3 = {
    vm_name                 = "banned-stuff"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"
  }
}

win_vmss = {
  uks_win_vmss_1 = {
    computer_name_prefix    = "uks-win"
    vmss_name               = "vmss-proj-1"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"  
  }
  uks_win_vmss_2 = {
    computer_name_prefix    = "uks-win"
    vmss_name               = "vmss-proj-2"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"  
  }
}





#### FOR USE WITH MODULES - LEAVE FOR NOW
# #VMSS LINUX UK SOUTH
# vmss_lin_uks_name = "projects"
# vmss_lin_uks_rgs = "rg-uks-compute"
# vmss_lin_uks_location = "uksouth"
# vmss_lin_uks_network_interface_name = "vmss-lin-uks-ni-01"
# vmss_lin_uks_ipconfig_name = "vmss-lin-ipconfig-uks"
# vmss_lin_uks_ipconfig_subnet = "sm_uks_vms"

# #VMSS WINDOWS UK SOUTH
# vmss_win_uks_name = "projects"
# vmss_win_uks_rgs = "rg-uks-compute"
# vmss_win_uks_location = "uksouth"
# vmss_win_uks_network_interface_name = "vmss-win-uks-ni-01"
# vmss_win_uks_ipconfig_name = "vmss-win-ipconfig-uks"
# vmss_win_uks_ipconfig_subnet = "sm_uks_vms"

# #VM LINUX UK SOUTH
# vm_lin_uks_name = "dark_science"
# vm_lin_uks_rgs = "rg-uks-compute"
# vm_lin_uks_location = "uksouth"
# vm_lin_uks_network_interface_name = "vm-lin-uks-ni-01"
# vm_lin_uks_ipconfig_name = "vmlinipconfiguks"
# vm_lin_uks_ipconfig_subnet = "sm_uks_vms"
# vm_lin_uks_nic_name = "vm-lin-uks-nic"
# vm_lin_uks_nic_location = "uksouth"

# #VM WINDOWS UK SOUTH
# vm_win_uks_name = "weird_science"
# vm_win_uks_rgs = "rg-uks-compute"
# vm_win_uks_location = "uksouth"

# vm_win_uks_nic_name = "vm-win-uks-nic"
# vm_win_uks_nic_location = "uksouth"
# vm_win_uks_nic_rgs = "uksouth"

# vm_win_uks_network_interface_name = "vm-win-uks-ni-01"
# vm_win_uks_ipconfig_name = "vmwinipconfiguks"
# vm_win_uks_ipconfig_subnet = "sm_uks_vms"


