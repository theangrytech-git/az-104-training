#### Resource Groups

resource_group_name = {
  #UK SOUTH RG'S
  storage_uks = { name = "rg-uks-storage", location = "uksouth", use = "storage" }
  compute_uks = { name = "rg-uks-compute", location = "uksouth", use = "compute" }
  data_uks    = { name = "rg-uks-data", location = "uksouth", use = "data" }
  monitoring_uks = { name = "rg-uks-monitor", location = "uksouth", use = "monitoring" }
  #UK WEST RG'S
  storage_ukw = { name = "rg-ukw-storage", location = "ukwest", use = "storage" }
  compute_ukw = { name = "rg-ukw-compute", location = "ukwest", use = "compute" }
  data_ukw    = { name = "rg-ukw-data", location = "ukwest", use = "data" }
  monitoring_ukw = { name = "rg-ukw-monitor", location = "ukwest", use = "monitoring"  }
  #WEST EUROPE RG'S
  storage_weu = { name = "rg-weu-storage", location = "westeurope", use = "storage"  }
  compute_weu = { name = "rg-weu-compute", location = "westeurope", use = "compute" }
  data_weu    = { name = "rg-weu-data", location = "westeurope", use = "data"  }
  monitoring_weu = { name = "rg-weu-monitor", location = "westeurope", use = "monitoring" }
}

#### Storage Accounts
storage_accounts = {
#UKS
uks_storage_general = {
  name                             = "uksstoragegeneral"
  resource_group_name              = "rg-uks-storage"
  location                         = "uksouth"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
  use = "general"
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
  use = "management"
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
  use = "departmental"
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
  use = "monitoring"
},

#UKW
ukw_storage_general = {
  name                             = "ukwstoragegeneral"
  resource_group_name              = "rg-ukw-storage"
  location                         = "ukwest"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
  use = "general"
},

ukw_storage_mgmt = {
  name                             = "ukwstoragemgmt"
  resource_group_name              = "rg-uks-storage"
  location                         = "ukwest"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
  use = "management"
},

ukw_storage_depts = {
  name                             = "ukwstoragedepts"
  resource_group_name              = "rg-ukw-storage"
  location                         = "ukwest"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
  use = "departmental"
},

ukw_storage_monitoring = {
  name                             = "ukwstoragemonitoring"
  resource_group_name              = "rg-ukw-monitor"
  location                         = "ukwest"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
  use = "monitoring"
},

#WEU
weu_storage_general = {
  name                             = "weustoragegeneral"
  resource_group_name              = "rg-weu-storage"
  location                         = "westeurope"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
  use = "general"
},

weu_storage_mgmt = {
  name                             = "weustoragemgmt"
  resource_group_name              = "rg-weu-storage"
  location                         = "westeurope"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
  use = "management"
},

weu_storage_depts = {
  name                             = "weustoragedepts"
  resource_group_name              = "rg-weu-storage"
  location                         = "westeurope"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
  use = "departmental"
},

weu_storage_monitoring = {
  name                             = "weustoragemonitoring"
  resource_group_name              = "rg-weu-monitor"
  location                         = "westeurope"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
  use = "monitoring"
},
}

####Static Site

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
    use = "website"

  static_website = {
    index_document = "index.html"
    error_404_document = "error.html"
    source_folder = "../static-content"
    }
  }
  ukw_static_site = {
    name                             = "ukwstaticsite"
    resource_group_name              = "rg-ukw-storage"
    location                         = "ukwest"
    account_tier                     = "Standard"
    account_replication_type         = "LRS"
    account_kind                     = "StorageV2"
    cross_tenant_replication_enabled = false
    min_tls_version                  = "TLS1_2"
    use = "website"

  static_website = {
    index_document = "index.html"
    error_404_document = "error.html"
    source_folder = "../static-content"
    }
  }
  weu_static_site = {
    name                             = "weustaticsite"
    resource_group_name              = "rg-weu-storage"
    location                         = "westeurope"
    account_tier                     = "Standard"
    account_replication_type         = "LRS"
    account_kind                     = "StorageV2"
    cross_tenant_replication_enabled = false
    min_tls_version                  = "TLS1_2"
    use = "website"

  static_website = {
    index_document = "index.html"
    error_404_document = "error.html"
    source_folder = "../static-content"
    }
  }

}

###Static Website Config
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
    use = "compute"
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
    },
  },
  ukw = {
    name                = "vnet-ukw-01"
    location            = "ukwest"
    address_space       = ["10.20.0.0/16"]
    resource_group_name = "rg-ukw-compute"
    use = "compute"
    subnets = {
      ukw_vms = {
        name = "snet_ukw_vms"
        address_prefix = "10.20.1.0/24" 
        service_endpoints = ["Microsoft.Containerinstance/containerGroups", "Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web"]
      },
      ukw_storage = {
        name = "snet_ukw_storage"
        address_prefix = "10.20.2.0/24" 
        service_endpoints = ["Microsoft.AzureActiveDirectory", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web"] 
      },
      ukw_db      = {
        name = "snet_ukw_db"
        address_prefix = "10.20.3.0/24"
        service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"] 
      },
      ukw_functions = {
        name = "snet_ukw_functions" 
        address_prefix = "10.20.4.0/24"
        service_endpoints = ["Microsoft.AzureActiveDirectory", "Microsoft.Storage", "Microsoft.Web"] 
      },
      ukw_projects  = {
        name = "snet_ukw_projects" 
        address_prefix = "10.20.5.0/24"
        service_endpoints = ["Microsoft.AzureActiveDirectory", "Microsoft.Storage", "Microsoft.Web"] 
      },
    },
  },
  weu = {
    name                = "vnet-weu-01"
    location            = "westeurope"
    address_space       = ["10.30.0.0/16"]
    resource_group_name = "rg-weu-compute"
    use = "compute"
    subnets = {
      weu_vms = {
        name = "snet_weu_vms"
        address_prefix = "10.30.1.0/24" 
        service_endpoints = ["Microsoft.Containerinstance/containerGroups", "Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web"]
      },
      weu_storage = {
        name = "snet_weu_storage"
        address_prefix = "10.30.2.0/24" 
        service_endpoints = ["Microsoft.AzureActiveDirectory", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web"] 
      },
      weu_db      = {
        name = "snet_weu_db"
        address_prefix = "10.30.3.0/24"
        service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"] 
      },
      weu_functions = {
        name = "snet_weu_functions" 
        address_prefix = "10.30.4.0/24"
        service_endpoints = ["Microsoft.AzureActiveDirectory", "Microsoft.Storage", "Microsoft.Web"] 
      },
      weu_projects  = {
        name = "snet_weu_projects" 
        address_prefix = "10.30.5.0/24"
        service_endpoints = ["Microsoft.AzureActiveDirectory", "Microsoft.Storage", "Microsoft.Web"] 
      },
    }
  }
}

win_virtual_machines = {
  #UKS
  uks_win_vm_1 = {
    vm_name                 = "weird-science"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"
    use = "departmental"
  },
  uks_win_vm_2 = {
    vm_name                 = "dark-science"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"
    use = "general"
  },
  uks_win_vm_3 = {
    vm_name                 = "banned-science"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"
    use = "projects"
  }
  #UKW
  ukw_win_vm_1 = {
    vm_name                 = "weird-science"
    resource_group_name     = "rg-ukw-compute"
    location                = "ukwest"
    use = "departmental"
  },
  ukw_win_vm_2 = {
    vm_name                 = "dark-science"
    resource_group_name     = "rg-ukw-compute"
    location                = "ukwest"
    use = "general"
  },
  ukw_win_vm_3 = {
    vm_name                 = "banned-science"
    resource_group_name     = "rg-ukw-compute"
    location                = "ukwest"
    use = "projects"
  }
  #WEU
  # weu_win_vm_1 = {
  #   vm_name                 = "weird-science"
  #   resource_group_name     = "rg-weu-compute"
  #   location                = "westeurope"
  #   use = "departmental"
  # },
  # weu_win_vm_2 = {
  #   vm_name                 = "dark-science"
  #   resource_group_name     = "rg-weu-compute"
  #   location                = "westeurope"
  #   use = "general"
  # },
  # weu_win_vm_3 = {
  #   vm_name                 = "banned-science"
  #   resource_group_name     = "rg-weu-compute"
  #   location                = "westeurope"
  #   use = "projects"
  # }
}

lin_virtual_machines = {
  #UKS
  uks_lin_vm_1 = {
    vm_name                 = "sketchy-stuff"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"
    use = "departmental"
  },
  uks_lin_vm_2 = {
    vm_name                 = "weird-stuff"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"
    use = "general"
  },
  uks_lin_vm_3 = {
    vm_name                 = "banned-stuff"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"
    use = "projects"
  }
  #UKW
  ukw_lin_vm_1 = {
    vm_name                 = "sketchy-stuff"
    resource_group_name     = "rg-ukw-compute"
    location                = "ukwest"
    use = "departmental"
  },
  ukw_lin_vm_2 = {
    vm_name                 = "weird-stuff"
    resource_group_name     = "rg-ukw-compute"
    location                = "ukwest"
    use = "general"
  },
  ukw_lin_vm_3 = {
    vm_name                 = "banned-stuff"
    resource_group_name     = "rg-ukw-compute"
    location                = "ukwest"
    use = "projects"
  }
  #WEU
#   weu_lin_vm_1 = {
#     vm_name                 = "sketchy-stuff"
#     resource_group_name     = "rg-weu-compute"
#     location                = "westeurope"
#     use = "departmental"
#   },
#   weu_lin_vm_2 = {
#     vm_name                 = "weird-stuff"
#     resource_group_name     = "rg-weu-compute"
#     location                = "westeurope"
#     use = "general"
#   },
#   weu_lin_vm_3 = {
#     vm_name                 = "banned-stuff"
#     resource_group_name     = "rg-weu-compute"
#     location                = "westeurope"
#     use = "projects"
#   }
}

win_vmss = {
  #UKS
  uks_win_vmss_1 = {
    computer_name_prefix    = "uks"
    vmss_name               = "vmss1"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"  
    use = "projects"
  }
  uks_win_vmss_2 = {
    computer_name_prefix    = "uks"
    vmss_name               = "vmss2"
    resource_group_name     = "rg-uks-compute"
    location                = "uksouth"
    use = "projects"  
  }
  #UKW
  ukw_win_vmss_1 = {
    computer_name_prefix    = "ukw"
    vmss_name               = "vmss1"
    resource_group_name     = "rg-ukw-compute"
    location                = "ukwest"  
    use = "projects"
  }
  ukw_win_vmss_2 = {
    computer_name_prefix    = "ukw"
    vmss_name               = "vmss2"
    resource_group_name     = "rg-ukw-compute"
    location                = "ukwest"
    use = "projects"  
  }
  #WEU
  # weu_win_vmss_1 = {
  #   computer_name_prefix    = "weu-win"
  #   vmss_name               = "vmss-proj-1"
  #   resource_group_name     = "rg-weu-compute"
  #   location                = "westeurope"  
  #   use = "projects"
  # }
  # weu_win_vmss_2 = {
  #   computer_name_prefix    = "weu-win"
  #   vmss_name               = "vmss-proj-2"
  #   resource_group_name     = "rg-weu-compute"
  #   location                = "westeurope"
  #   use = "projects"  
  # }
}

peering = {
  "UKS-WEU" = {
    name                 = "UKS-WEU"
    resource_group_name  = "rg-uks-compute"
    vnet_1               = "uks"   # Make sure these match the keys in the virtual_networks map
    vnet_2               = "weu"   # Make sure these match the keys in the virtual_networks map
  },
  "WEU-UKS" = {
    name                 = "WEU-UKS"
    resource_group_name  = "rg-weu-compute"
    vnet_1               = "weu"   # Make sure these match the keys in the virtual_networks map
    vnet_2               = "uks"   # Make sure these match the keys in the virtual_networks map
  },

    "UKS-UKW" = {
    name                 = "UKS-UKW"
    resource_group_name  = "rg-uks-compute"
    vnet_1               = "uks"   # Make sure these match the keys in the virtual_networks map
    vnet_2               = "ukw"   # Make sure these match the keys in the virtual_networks map
  },
  "UKW-UKS" = {
    name                 = "UKW-UKS"
    resource_group_name  = "rg-ukw-compute"
    vnet_1               = "ukw"   # Make sure these match the keys in the virtual_networks map
    vnet_2               = "uks"   # Make sure these match the keys in the virtual_networks map
  },

}

#### NSG
nsg = {
  UKS = {
    name                = "uks-nsg-01"
    location            = "uksouth"
    resource_group_name = "rg-uks-compute"
  }
  UKW = {
    name                = "ukw-nsg-01"
    location            = "ukwest"
    resource_group_name = "rg-ukw-compute"
  }
  WEU = {
    name                = "weu-nsg-01"
    location            = "westeurope"
    resource_group_name = "rg-weu-compute"
  }
}

#### Bastion
bastion_location = "ukwest"
bastion_resource_group = "rg-ukw-compute"


#### Log Analytics

log_analytics_workspace = {
  UKS = {
    log_name = "uks-la-vm-01"
    location = "uksouth"
    resource_group_name = "rg-uks-monitor"
    use = "monitoring"
  }

  UKW = {
    log_name = "ukw-la-vm-01"
    location = "ukwest"
    resource_group_name = "rg-ukw-monitor"
    use = "monitoring"
  }  

  WEU = {
    log_name = "weu-la-vm-01"
    location = "westeurope"
    resource_group_name = "rg-weu-monitor"
    use = "monitoring"
  }
}

#### Key Vault

key_vault = {
  uks_kv_1 = {
    name = "uks-key-vault-01"
    location = "uksouth"
    resource_group_name = "rg-uks-data"
    use = "storage"
  }
  ukw_kv_1 = {
    name = "ukw-key-vault-01"
    location = "ukwest"
    resource_group_name = "rg-ukw-data"
    use = "storage"
  }
  weu_kv_1 = {
    name = "weu-key-vault-01"
    location = "westeurope"
    resource_group_name = "rg-weu-data"
    use = "storage"
  }
}

#### App Config

app_config = {
  UKS = {
    name = "uks-appconfig-01"
    location = "uksouth"
    resource_group_name = "rg-uks-data"
    sku = "free"
    use = "storage"
  }
  UKW = {
    name = "ukw-appconfig-01"
    location = "ukwest"
    resource_group_name = "rg-ukw-data"
    sku = "free"
    use = "storage"
  }
  WEU = {
    name = "weu-appconfig-01"
    location = "westeurope"
    resource_group_name = "rg-weu-data"
    sku = "standard"
    use = "storage"
  }
}

#### App Insights
app_insights = {
  UKS = {
    name = "uks-appins-01"
    location = "uksouth"
    resource_group_name = "rg-uks-monitor"
    use = "monitoring"
  }
  UKW = {
    name = "ukw-appins-01"
    location = "ukwest"
    resource_group_name = "rg-ukw-monitor"
    use = "monitoring"
  }
  WEU = {
    name = "weu-appins-01"
    location = "westeurope"
    resource_group_name = "rg-weu-monitor"
    use = "monitoring"
  }
}