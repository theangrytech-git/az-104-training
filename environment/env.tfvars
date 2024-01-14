#### Resource Groups

resource_group_name = {
  #UK SOUTH RG'S
  storage_uks = { name = "rg-uks-storage", location = "uksouth", use = "storage" }
  compute_uks = { name = "rg-uks-compute", location = "uksouth", use = "compute" }
  data_uks    = { name = "rg-uks-data", location = "uksouth", use = "data" }
  monitoring_uks = { name = "rg-uks-monitor", location = "uksouth", use = "monitoring" }
  #NORTH EUROPE RG'S
  storage_neu = { name = "rg-neu-storage", location = "northeurope", use = "storage" }
  compute_neu = { name = "rg-neu-compute", location = "northeurope", use = "compute" }
  data_neu    = { name = "rg-neu-data", location = "northeurope", use = "data" }
  monitoring_neu = { name = "rg-neu-monitor", location = "northeurope", use = "monitoring"  }
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

#NEU
neu_storage_general = {
  name                             = "neustoragegeneral"
  resource_group_name              = "rg-neu-storage"
  location                         = "northeurope"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
  use = "general"
},

neu_storage_mgmt = {
  name                             = "neustoragemgmt"
  resource_group_name              = "rg-neu-storage"
  location                         = "northeurope"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
  use = "management"
},

neu_storage_depts = {
  name                             = "neustoragedepts"
  resource_group_name              = "rg-neu-storage"
  location                         = "northeurope"
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  account_kind                     = "StorageV2"
  cross_tenant_replication_enabled = false
  min_tls_version                  = "TLS1_2"
  use = "departmental"
},

neu_storage_monitoring = {
  name                             = "neustoragemonitoring"
  resource_group_name              = "rg-neu-monitor"
  location                         = "northeurope"
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
  neu_static_site = {
    name                             = "neustaticsite"
    resource_group_name              = "rg-neu-storage"
    location                         = "northeurope"
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
  neu = {
    name                = "vnet-neu-01"
    location            = "northeurope"
    address_space       = ["10.20.0.0/16"]
    resource_group_name = "rg-neu-compute"
    use = "compute"
    subnets = {
      neu_vms = {
        name = "snet_neu_vms"
        address_prefix = "10.20.1.0/24" 
        service_endpoints = ["Microsoft.Containerinstance/containerGroups", "Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web"]
      },
      neu_storage = {
        name = "snet_neu_storage"
        address_prefix = "10.20.2.0/24" 
        service_endpoints = ["Microsoft.AzureActiveDirectory", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web"] 
      },
      neu_db      = {
        name = "snet_neu_db"
        address_prefix = "10.20.3.0/24"
        service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"] 
      },
      neu_functions = {
        name = "snet_neu_functions" 
        address_prefix = "10.20.4.0/24"
        service_endpoints = ["Microsoft.AzureActiveDirectory", "Microsoft.Storage", "Microsoft.Web"] 
      },
      neu_projects  = {
        name = "snet_neu_projects" 
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
  #NEU
  neu_win_vm_1 = {
    vm_name                 = "dodgy-science"
    resource_group_name     = "rg-neu-compute"
    location                = "northeurope"
    use = "departmental"
  },
  neu_win_vm_2 = {
    vm_name                 = "black-science"
    resource_group_name     = "rg-neu-compute"
    location                = "northeurope"
    use = "general"
  },
  neu_win_vm_3 = {
    vm_name                 = "sketchy-science"
    resource_group_name     = "rg-neu-compute"
    location                = "northeurope"
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
  #NEU
  neu_lin_vm_1 = {
    vm_name                 = "sketchy-things"
    resource_group_name     = "rg-neu-compute"
    location                = "northeurope"
    use = "departmental"
  },
  neu_lin_vm_2 = {
    vm_name                 = "weird-things"
    resource_group_name     = "rg-neu-compute"
    location                = "northeurope"
    use = "general"
  },
  neu_lin_vm_3 = {
    vm_name                 = "banned-things"
    resource_group_name     = "rg-neu-compute"
    location                = "northeurope"
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
  #NEU
  neu_win_vmss_1 = {
    computer_name_prefix    = "neu"
    vmss_name               = "vmss1"
    resource_group_name     = "rg-neu-compute"
    location                = "northeurope"  
    use = "projects"
  }
  neu_win_vmss_2 = {
    computer_name_prefix    = "neu"
    vmss_name               = "vmss2"
    resource_group_name     = "rg-neu-compute"
    location                = "northeurope"
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

    "UKS-neu" = {
    name                 = "UKS-neu"
    resource_group_name  = "rg-uks-compute"
    vnet_1               = "uks"   # Make sure these match the keys in the virtual_networks map
    vnet_2               = "neu"   # Make sure these match the keys in the virtual_networks map
  },
  "neu-UKS" = {
    name                 = "neu-UKS"
    resource_group_name  = "rg-neu-compute"
    vnet_1               = "neu"   # Make sure these match the keys in the virtual_networks map
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
  neu = {
    name                = "neu-nsg-01"
    location            = "northeurope"
    resource_group_name = "rg-neu-compute"
  }
  WEU = {
    name                = "weu-nsg-01"
    location            = "westeurope"
    resource_group_name = "rg-weu-compute"
  }
}

#### Bastion
bastion_location = "northeurope"
bastion_resource_group = "rg-neu-compute"


#### Log Analytics

log_analytics_workspace = {
  UKS = {
    log_name = "uks-la-vm-01"
    location = "uksouth"
    resource_group_name = "rg-uks-monitor"
    use = "monitoring"
  }

  neu = {
    log_name = "neu-la-vm-01"
    location = "northeurope"
    resource_group_name = "rg-neu-monitor"
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
  neu_kv_1 = {
    name = "neu-key-vault-01"
    location = "northeurope"
    resource_group_name = "rg-neu-data"
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
  neu = {
    name = "neu-appconfig-01"
    location = "northeurope"
    resource_group_name = "rg-neu-data"
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
  neu = {
    name = "neu-appins-01"
    location = "northeurope"
    resource_group_name = "rg-neu-monitor"
    use = "monitoring"
  }
  WEU = {
    name = "weu-appins-01"
    location = "westeurope"
    resource_group_name = "rg-weu-monitor"
    use = "monitoring"
  }
}