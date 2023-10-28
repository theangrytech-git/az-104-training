# Configure the Azure Active Directory Provider
provider "azuread" {
}
#General housekeeping
# Retrieve domain information
data "azuread_domains" "default" {
  only_initial = true
}

#Retrieve Sub ID
data "azurerm_subscription" "current" {}
output "current_subscription_display_name" {
  value = data.azurerm_subscription.current
}

locals {
  domain_name = data.azuread_domains.default.domains.0.domain_name
  users       = csvdecode(file("${path.module}/modules/users.csv"))
  dept        = csvdecode(file("${path.module}/modules/users.csv"))
}

  resource "random_string" "random" {
    length           = 4
    numeric = true
    lower = true
    upper = false
    special = false
}

# Create users #Works - commented out 16-43 for testing other modules
resource "azuread_user" "users" {
  for_each = { for user in local.users : user.first_name => user }

  user_principal_name = format(
    "%s%s@%s",
    substr(lower(each.value.first_name), 0, 1),
    lower(each.value.last_name),
    local.domain_name
  )

  password = format(
    "%s%s%s99aA!@",
    lower(each.value.last_name),
    substr(lower(each.value.first_name), 0, 1),
    length(each.value.first_name)
  )
  force_password_change = true

  display_name = "${each.value.first_name} ${each.value.last_name}"
  department   = each.value.department
  job_title    = each.value.job_title
}

data "azuread_users" "users" {
  return_all = true

}

#Azure Reader Role - incorrect attribute value type. "var.roles" is a list of a string
# resource "azurerm_role_assignment" "reader" {
#   for_each = { for user in local.users : user.first_name => user }
#   scope                = data.azurerm_subscription.primary.id
#   role_definition_name = var.roles
#   principal_id         = azuread_user.users[each.key].object_id
#   depends_on = [azuread_user.users]
# }

#Create groups - first test, add users to groups. #Works - commented out 50-69 for testing other modules
resource "azuread_group" "groupname" {
for_each = { for dept in local.dept : dept.department => dept... }

display_name = format("%s", lower(each.key),)
security_enabled = true

depends_on = [azuread_user.users]
}

data "azuread_groups" "groupdata" {
return_all = true
depends_on = [ azuread_group.groupname ]
}

data "azurerm_subscription" "primary" {}

#********************************
#WORK ON GROUP MEMBERS IN BY DEPT NAME

# resource "azuread_group_member" "sales" {
#   for_each = { for u in azuread_user.users: u.mail_nickname => u if u.department == "Sales"}

#   group_object_id  = azuread_group.groupname[0].display_name == "Sales"
#   member_object_id = each.value.id

#   depends_on = [ azuread_user.users ]
# }

##### NTS - try find a way to add users by spcific Dept Names into specific Role Assignments


# Create Resource Groups for UKS, UKW and WEU

resource "azurerm_resource_group" "resource_groups" {
  for_each = var.resource_group_name
  name     = each.value.name
  location = each.value.location
}

#Creating Resources for UK South

  resource "random_string" "storage_random" {
    length           = 4
    special = false
    upper = false
    }

# Adding in NSG, Virtual Networks and Subnets for UKS*  - re-write the vnet and snet module. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

 resource "azurerm_virtual_network" "vnet" {
  for_each = var.virtual_networks

  name                = var.virtual_networks[each.key].name
  location            = var.virtual_networks[each.key].location
  address_space       = var.virtual_networks[each.key].address_space
  resource_group_name = var.virtual_networks[each.key].resource_group_name

  dynamic "subnet" {
    for_each = var.subnets

    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }
  }
}

# data "azurerm_subnet" "compute_subnet" {
#   name                 = var.vm_win_uks_ipconfig_subnet
#   virtual_network_name = azurerm_virtual_network.vnet[*].name
#   resource_group_name  = var.vm_win_uks_rgs
# }



#Storage Accounts for UKS
resource "azurerm_storage_account" "storage_accounts" {
for_each = var.storage_accounts

name = "${lower(each.value.name)}${random_string.storage_random.result}"
resource_group_name = each.value.resource_group_name
location = each.value.location
account_tier = each.value.account_tier
account_kind = each.value.account_kind
account_replication_type = each.value.account_replication_type
cross_tenant_replication_enabled = each.value.cross_tenant_replication_enabled
min_tls_version = each.value.min_tls_version

# network_rules {
#     default_action = "Deny"  # Change to "Allow" if needed
#          virtual_network_subnet_ids = [
#       module.azure_subnets.subnet[*].id
#     ]
#   }


  #   virtual_network_subnet_ids = [
  #     for subnet_name, subnet_id in module.azure_subnets.subnet_ids : subnet_name => subnet_id
  #   ]
  # }

depends_on = [ azurerm_resource_group.resource_groups, azurerm_virtual_network.vnet ]
}



# module "uks_storage_general" {
#   source              = "./modules/storageaccounts"
#   storage_account = var.uks_storage_general
#   #storage_account     = format("uks%s", var.uks_storage_general) NTS: look to add in a 'UKS' variable so I'm not having to add 100+ var's in variable.tf
#   resource_group_name = var.uks_storage_general.resource_group_name
#   depends_on = [ azurerm_resource_group.resource_groups ]
  
# }

# module "uks_storage_mgmt" {
#   source              = "./modules/storageaccounts"
#   storage_account = var.uks_storage_mgmt
#   resource_group_name = var.uks_storage_mgmt.resource_group_name
#   depends_on = [ azurerm_resource_group.resource_groups ]
# }

# module "uks_storage_depts" {
#   source              = "./modules/storageaccounts"
#   storage_account = var.uks_storage_depts
#   resource_group_name = var.uks_storage_depts.resource_group_name
#   depends_on = [ azurerm_resource_group.resource_groups ]
# }

# module "uks_storage_monitoring" {
#   source              = "./modules/storageaccounts"
#   storage_account = var.uks_storage_monitoring
#   resource_group_name = var.uks_storage_monitoring.resource_group_name
#   depends_on = [ azurerm_resource_group.resource_groups ]
# }

# resource "azurerm_storage_container" "depts" {
#   name                  = var.container_name[0]
#   storage_account_name  = module.uks_storage_depts.name
#   container_access_type = "private"
#   depends_on = [ module.uks_storage_depts ]
# }

# #Deploy Static Site using Storage Account
# module "uks_static_site" {
#   source              = "./modules/storageaccounts"
#   storage_account = var.uks_static_site
#   resource_group_name = var.uks_static_site.resource_group_name
  
#   depends_on = [ azurerm_resource_group.resource_groups ]
  
# }

# resource "azurerm_storage_blob" "static_blob" {
#   name                   = "index.html"
#   storage_account_name   = azurerm_storage_account.storage_accounts.name
#   storage_container_name = "$web"
#   type                   = "Block"
#   content_type           = "text/html"
#   source                 = "index.html"
#   depends_on = [ azurerm_storage_account.storage_accounts ]
# }


#Creating Virtual Machine Scale Sets with Linux/Windows OS

# Remove modules, and just write them in. Can look at modulisation later on.

# module "vmss_linux" {
#   source = "./modules/vmss-linux"
#   name      = var.vmss_lin_uks_name
#   resource_group_name  = var.vmss_lin_uks_rgs
#   location = var.vmss_lin_uks_location
#   network_interface_name = var.vmss_lin_uks_network_interface_name
#   network_interface_primary = true
#   ipconfig_name = format("%s%s", var.vmss_lin_uks_ipconfig_name, random_string.vmss_linux_random.result)
#   ipconfig_primary = true
#   ipconfig_subnet = "${data.azurerm_subscription.current.id}/resourceGroups/${var.vmss_lin_uks_rgs}/providers/Microsoft.Network/virtualNetworks/${var.vmss_lin_uks_ipconfig_name}/subnets/${var.vmss_lin_uks_ipconfig_subnet}"
#   depends_on = [ azurerm_resource_group.resource_groups, azurerm_virtual_network.vnet, random_string.vmss_linux_random ]
# }
#   resource "random_string" "vmss_linux_random" {
#     length           = 4
#     special = false
#     upper = false
# }

# module "vmss_windows" {
#   source = "./modules/vmss-win"
#   name      = var.vmss_win_uks_name
#   resource_group_name  = var.vmss_win_uks_rgs
#   location = var.vmss_win_uks_location
#   network_interface_name = var.vmss_win_uks_network_interface_name
#   network_interface_primary = true
#   ipconfig_name = format("%s%s", var.vmss_lin_uks_ipconfig_name, random_string.vmss_windows_random.result)
#   ipconfig_primary = true
#   ipconfig_subnet = "${data.azurerm_subscription.current.id}/resourceGroups/${var.vmss_lin_uks_rgs}/providers/Microsoft.Network/virtualNetworks/${var.vmss_lin_uks_ipconfig_name}/subnets/${var.vmss_lin_uks_ipconfig_subnet}"
#   depends_on = [ azurerm_resource_group.resource_groups, azurerm_virtual_network.vnet, random_string.vmss_windows_random ]
# }

#   resource "random_string" "vmss_windows_random" {
#     length           = 4
#     special = false
#     upper = false
# }

# Adding two VM's - Linux / Windows

# module "vm_linux" {
#   source = "./modules/vm-linux"
#   name = var.vm_lin_uks_name
#   resource_group_name  = var.vm_lin_uks_rgs
#   location = var.vm_lin_uks_location
#   network_interface_name = var.vm_lin_uks_network_interface_name
#   network_interface_ids = var.vm_lin_uks_ipconfig_name
#   vm_lin_nic_name = format("%s-%s", var.vm_lin_uks_nic_name, random_string.vm_linux_random.result)
#   ipconfig_name = var.vm_lin_uks_ipconfig_name
#   ipconfig_primary = true
#   ipconfig_subnet = "${data.azurerm_subscription.current.id}/resourceGroups/${var.vm_lin_uks_rgs}/providers/Microsoft.Network/virtualNetworks/${var.vm_lin_uks_ipconfig_name}/subnets/${var.vm_lin_uks_ipconfig_subnet}"
#   subnet_id = "${data.azurerm_subscription.current.id}/resourceGroups/${var.vm_lin_uks_rgs}/providers/Microsoft.Network/virtualNetworks/${var.vm_lin_uks_ipconfig_name}/subnets/${var.vm_lin_uks_ipconfig_subnet}"
#   nic_location = var.vm_lin_uks_nic_location
#   nic_resource_group_name = var.vm_lin_uks_rgs
#   ipconfig_subnet_id = "${data.azurerm_subscription.current.id}/resourceGroups/${var.vm_lin_uks_rgs}/providers/Microsoft.Network/virtualNetworks/${var.vm_lin_uks_ipconfig_name}/subnets/${var.vm_lin_uks_ipconfig_subnet}"
#   depends_on = [ azurerm_resource_group.resource_groups, azurerm_virtual_network.vnet, random_string.vm_linux_random ]
# }
#   resource "random_string" "vm_linux_random" {
#     length           = 4
#     special = false
#     upper = false
# }

# module "vm_windows" {
#   source = "./modules/vm-win"
# #vm  
#   name = var.vm_win_uks_name
#   resource_group_name  = var.vm_win_uks_rgs
#   location = var.vm_win_uks_location
# #nic
# vm_win_nic_name = var.vm_win_uks_nic_name
# nic_location = var.vm_win_uks_nic_location
# nic_resource_group_name = var.vm_win_uks_nic_rgs
# subnet_id = "${data.azurerm_subscription.current.id}/resourceGroups/${var.vm_lin_uks_rgs}/providers/Microsoft.Network/virtualNetworks/${data.azurerm_subnet.compute_subnet.virtual_network_name}/subnets/${data.azurerm_subnet.compute_subnet.name}"
# network_interface_name = ""
# network_interface_ids = ""
# #ipconfig
# ipconfig_name = ""
# ipconfig_primary = ""
# ipconfig_subnet = ""

# subnets = {
#   vm_win_subnet = {
#     name            = "sm_uks_vms"
#     resource_group  = var.vm_win_uks_rgs
#     virtual_network = data.azurerm_subnet.compute_subnet.virtual_network_name
#   }
# }

# }
#   resource "random_string" "vm_windows_random" {
#     length           = 4
#     special = false
#     upper = false
# }

#  Creating Resources for UK West

# #Storage Accounts for UKW
# module "ukw_storage_general" {
#   source              = "./modules/storageaccounts"
#   storage_account     = var.ukw_storage_general
#   resource_group_name = var.ukw_storage_general.resource_group_name
#   depends_on = [ azurerm_resource_group.resource_groups ]
  
# }

# module "ukw_storage_mgmt" {
#   source              = "./modules/storageaccounts"
#   storage_account     = var.ukw_storage_mgmt
#   resource_group_name = var.ukw_storage_mgmt.resource_group_name
#   depends_on = [ azurerm_resource_group.resource_groups ]
# }

# module "ukw_storage_depts" {
#   source              = "./modules/storageaccounts"
#   storage_account     = var.ukw_storage_depts
#   resource_group_name = var.ukw_storage_depts.resource_group_name
#   depends_on = [ azurerm_resource_group.resource_groups ]
# }

# module "ukw_storage_monitoring" {
#   source              = "./modules/storageaccounts"
#   storage_account     = var.ukw_storage_monitoring
#   resource_group_name = var.ukw_storage_monitoring.resource_group_name
#   depends_on = [ azurerm_resource_group.resource_groups ]
# }

# resource "azurerm_storage_container" "depts" {
#   name                  = var.container_name[0]
#   storage_account_name  = module.ukw_storage_depts.name
#   container_access_type = "private"
#   depends_on = [ module.uks_storage_depts ]
# }

# #Deploy Static Site using Storage Account
# module "ukw_static_site" {
#   source              = "./modules/storageaccounts"
#   storage_account     = var.ukw_static_site
#   resource_group_name = var.ukw_storage_general.resource_group_name
  
#   depends_on = [ azurerm_resource_group.resource_groups ]
  
# }

# resource "azurerm_storage_blob" "static_blob" {
#   name                   = "index.html"
#   storage_account_name   = module.ukw_static_site.name
#   storage_container_name = "$web"
#   type                   = "Block"
#   content_type           = "text/html"
#   source                 = "index.html"
#   depends_on = [ module.ukw_static_site ]
# }


# # Adding in Virtual Networks and Subnets for UKS*
# module "azure_vnet" {
#     source              = "./modules/vnet"
#     name                = var.vnet_name
#     location            = var.location
#     resource_group_name = var.vnet_rg 
#     vnet_address_space =  var.vnet_address_space
#     subnets             = var.subnets
# }

# module "azure_subnets" {
#     source              = "./modules/subnets"
#     subnets             = var.subnets
#     resource_group_name = var.vnet_rg 
#     virtual_network_name = module.azure_vnet.vnet_name
#     depends_on          = [ module.azure_vnet ]
# }

# #Creating Virtual Machine Scale Sets with Linux/Windows OS
# module "vmss_linux" {
#   source = "./modules/vmss-linux"
#   name      = var.vmss_lin_ukw_name
#   resource_group_name  = var.vmss_lin_ukw_rgs
#   location = var.vmss_lin_ukw_location
#   network_interface_name = var.vmss_lin_ukw_network_interface_name
#   network_interface_primary = true
#   ipconfig_name = format("%s_%s", var.vm_lin_ukw_ipconfig_name, random_string.random)
#   ipconfig_primary = true
#   ipconfig_subnet = "${data.azurerm_subscription.current.id}/resourceGroups/${var.vmss_lin_ukw_rgs}/providers/Microsoft.Network/virtualNetworks/${var.vmss_lin_ukw_ipconfig_name}/subnets/${var.vmss_lin_ukw_ipconfig_subnet}"
#   depends_on = [ module.azure_vnet, module.azure_subnets ]
# }

# module "vmss_windows" {
#   source = "./modules/vmss-win"
#   name      = var.vmss_win_ukw_name
#   resource_group_name  = var.vmss_win_ukw_rgs
#   location = var.vmss_win_ukw_location
#   network_interface_name = var.vmss_win_ukw_network_interface_name
#   network_interface_primary = true
#   ipconfig_name = format("%s_%s", var.vm_lin_ukw_ipconfig_name, random_string.random)
#   ipconfig_primary = true
#   ipconfig_subnet = "${data.azurerm_subscription.current.id}/resourceGroups/${var.vmss_lin_ukw_rgs}/providers/Microsoft.Network/virtualNetworks/${var.vmss_lin_ukw_ipconfig_name}/subnets/${var.vmss_lin_ukw_ipconfig_subnet}"
#   depends_on = [ module.azure_vnet, module.azure_subnets ]
# }

# # Adding two VM's - Linux / Windows

# module "vm_linux" {
#   source = "./modules/vm-linux"
#   name = var.vm_lin_ukw_name
#   resource_group_name  = var.vm_lin_ukw_rgs
#   location = var.vm_lin_ukw_location
#   network_interface_name = var.vm_lin_ukw_network_interface_name
#   network_interface_ids = format("%s_%s", var.vm_lin_ukw_ipconfig_name, random_string.random)
#   ipconfig_name = var.vm_lin_ukw_ipconfig_name
#   ipconfig_primary = true
#   ipconfig_subnet = "${data.azurerm_subscription.current.id}/resourceGroups/${var.vm_lin_ukw_rgs}/providers/Microsoft.Network/virtualNetworks/${var.vm_lin_ukw_ipconfig_name}/subnets/${var.vm_lin_ukw_ipconfig_subnet}"
# }

# module "vm_windows" {
#   source = "./modules/vm-win"
#   name = var.vm_win_ukw_name
#   resource_group_name  = var.vm_win_ukw_rgs
#   location = var.vm_win_ukw_location
#   network_interface_name = var.vm_win_ukw_network_interface_name
#   network_interface_ids = format("%s_%s", var.vm_win_ukw_ipconfig_name, random_string.random)
#   ipconfig_name = var.vm_win_ukw_ipconfig_name
#   ipconfig_primary = true
#   ipconfig_subnet = "${data.azurerm_subscription.current.id}/resourceGroups/${var.vm_win_ukw_rgs}/providers/Microsoft.Network/virtualNetworks/${var.vm_win_ukw_ipconfig_name}/subnets/${var.vm_win_ukw_ipconfig_subnet}"
# }

# Additional tasks left to do for now:

#  Creating Resources for West Europe

# Add in the UKS resources for West Europe

# Add in Network Peering as below:

# UKS - WEU
# UKW - UKS 

# Add in Bastion for UKS/UKW/WEU

# Add in AppIn, LogAn, Network Watcher, add in strings to above resources
# Add in NSG's to VM's and SA's

# Look to create a Function App with a VERY basic function (ASP, FA, SA?)

# Update README with some details, VStudio Credits, link to create a free azure account, and start crafting scenarios from AZ-104