# Configure the Azure Active Directory Provider
provider "azuread" {
}

# Retrieve domain information
data "azuread_domains" "default" {
  only_initial = true
}

locals {
  domain_name = data.azuread_domains.default.domains.0.domain_name
  users       = csvdecode(file("${path.module}/users.csv"))
  dept       = csvdecode(file("${path.module}/users.csv"))
}

# Create users
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

# Create groups - first test, add users to groups.
resource "azuread_group" "groupname" {
for_each = { for dept in local.dept : dept.department => dept... }

display_name = format("%s", lower(each.key),)
security_enabled = true
}


# Create RBAC Roles

data "azurerm_subscription" "primary" {
}

#Azure Reader Role
resource "azurerm_role_assignment" "reader" {
  for_each = { for user in local.users : user.first_name => user }
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Reader"
  principal_id         = azuread_user.users[each.key].object_id
}

# #Azure Billing Admin Role
# resource "azurerm_role_assignment" "billing_administrator" {
#   for_each = { for user in local.users : user.first_name => user }
#   scope                = data.azurerm_subscription.primary.id
#   role_definition_name = "Billing Administrator"
#   principal_id         = azuread_user.users[each.key].department == "Management"||"Accounting" == true
# }

# #Azure User Administrator Role
# resource "azurerm_role_assignment" "user_administrator" {
#   for_each = { for user in local.users : user.first_name => user }
#   scope                = data.azurerm_subscription.primary.id
#   role_definition_name = "User Administrator"
#   principal_id         = azuread_user.users[each.key].department == "R&D"||"Product-Oversight" ==true
# }

#Azure Virtual Machine Contributor Role
# resource "azurerm_role_assignment" "vm_contributor" {
#   for_each = { for user in local.users : user.first_name => user }
#   scope                = data.azurerm_subscription.primary.id
#   role_definition_name = "Virtual Machine Contributor"
#   principal_id         = azuread_user.users[each.key].department == (["R&D","Sales","Product-Oversight"]) == true
# }

#Azure Virtual Machine User Login
resource "azurerm_role_assignment" "vm_login" {
  for_each = { for user in local.users : user.first_name => user }
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Virtual Machine User Login"
  principal_id         = azuread_user.users[each.key].object_id
}

#Azure Storage Reader and Data Access
resource "azurerm_role_assignment" "reader_and_data_access" {
  for_each = { for user in local.users : user.first_name => user }
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Reader and Data Access"
  principal_id         = azuread_user.users[each.key].object_id
}

#Log Analytics Reader
resource "azurerm_role_assignment" "log_analytics_reader" {
  for_each = { for user in local.users : user.first_name => user }
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Log Analytics Reader"
  principal_id         = azuread_user.users[each.key].object_id
}

#Log Analytics Contributor
# resource "azurerm_role_assignment" "log_analytics_contributor" {
#   for_each = { for user in local.users : user.first_name => user }
#   scope                = data.azurerm_subscription.primary.id
#   role_definition_name = "Log Analytics Contributor"
#   principal_id         = azuread_user.users[each.key].department == (["R&D","Sales","Product-Oversight"]) == true
# }

#Data Purger
resource "azurerm_role_assignment" "data_purger" {
  for_each = { for user in local.users : user.first_name => user }
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Data Purger"
  principal_id         = azuread_user.users[each.key].object_id
}

# #Owner
# resource "azurerm_role_assignment" "owner" {
#   for_each = { for user in local.users : user.first_name => user }
#   scope                = data.azurerm_subscription.primary.id
#   role_definition_name = "Owner"
#   principal_id         = azuread_user.users[each.key].department == (["R&D","Management","Warehouse","Temp"]) == true
# }
#test repo

##### NTS - try find a way to add users by spcific Dept Names into specific Role Assignments


# Create Resource Groups

resource "azurerm_resource_group" "resource_groups_uks" {
  for_each = var.resource_groups
  name = format("rg-%s", each.key)
  location = var.location
}
