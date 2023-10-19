# Configure the Azure Active Directory Provider
provider "azuread" {
}

# Retrieve domain information
data "azuread_domains" "default" {
  only_initial = true
}

locals {
  domain_name = data.azuread_domains.default.domains.0.domain_name
  users       = csvdecode(file("${path.module}/modules/users.csv"))
  dept        = csvdecode(file("${path.module}/modules/users.csv"))
}

# Create users #Works - commented out 16-43 for testing other modules
# resource "azuread_user" "users" {
#   for_each = { for user in local.users : user.first_name => user }

#   user_principal_name = format(
#     "%s%s@%s",
#     substr(lower(each.value.first_name), 0, 1),
#     lower(each.value.last_name),
#     local.domain_name
#   )

#   password = format(
#     "%s%s%s99aA!@",
#     lower(each.value.last_name),
#     substr(lower(each.value.first_name), 0, 1),
#     length(each.value.first_name)
#   )
#   force_password_change = true

#   display_name = "${each.value.first_name} ${each.value.last_name}"
#   department   = each.value.department
#   job_title    = each.value.job_title
# }

# data "azuread_users" "users" {
#   return_all = true

# }

#Azure Reader Role - incorrect attribute value type. "var.roles" is a list of a string
# resource "azurerm_role_assignment" "reader" {
#   for_each = { for user in local.users : user.first_name => user }
#   scope                = data.azurerm_subscription.primary.id
#   role_definition_name = var.roles
#   principal_id         = azuread_user.users[each.key].object_id
#   depends_on = [azuread_user.users]
# }

#Create groups - first test, add users to groups. #Works - commented out 50-69 for testing other modules
# resource "azuread_group" "groupname" {
# for_each = { for dept in local.dept : dept.department => dept... }

# display_name = format("%s", lower(each.key),)
# security_enabled = true

# depends_on = [azuread_user.users]
# }

# data "azuread_groups" "groupdata" {
# return_all = true
# depends_on = [ azuread_group.groupname ]
# }

# data "azurerm_subscription" "primary" {}

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

#Creating Resources for UK South Office, affectionatly known as 'Main-Agency'

#Storage Accounts for UKS
module "uks_storage_general" {
  source              = "./modules/storageaccounts"
  storage_account     = var.uks_storage_general
  resource_group_name = var.uks_storage_general.resource_group_name
  depends_on = [ azurerm_resource_group.resource_groups ]
  
}

module "uks_storage_mgmt" {
  source              = "./modules/storageaccounts"
  storage_account     = var.uks_storage_mgmt
  resource_group_name = var.uks_storage_mgmt.resource_group_name
  depends_on = [ azurerm_resource_group.resource_groups ]
}

module "uks_storage_depts" {
  source              = "./modules/storageaccounts"
  storage_account     = var.uks_storage_depts
  resource_group_name = var.uks_storage_depts.resource_group_name
  depends_on = [ azurerm_resource_group.resource_groups ]
}

resource "azurerm_storage_container" "depts" {
  name                  = var.container_name[0]
  storage_account_name  = module.uks_storage_depts.name
  container_access_type = "private"
  depends_on = [ module.uks_storage_depts ]
}

# Adding in Virtual Networks and Subnets for UKS*
module "azure_vnet" {
    source              = "./modules/vnet"
    name                = var.vnet_name
    location            = var.location
    resource_group_name = var.vnet_rg 
    vnet_address_space =  var.vnet_address_space
    subnets             = var.subnets
}

module "azure_subnets" {
    source              = "./modules/subnets"
    subnets             = var.subnets
    resource_group_name = var.vnet_rg 
    virtual_network_name = module.azure_vnet.vnet_name
    depends_on          = [ module.azure_vnet ]
}
