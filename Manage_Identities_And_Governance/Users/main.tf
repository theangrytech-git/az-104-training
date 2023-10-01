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
  dept       = csvdecode(file("${path.module}/modules/users.csv"))
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

#Azure Reader Role
resource "azurerm_role_assignment" "reader" {
  for_each = { for user in local.users : user.first_name => user }
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = var.roles[each.value]
  principal_id         = azuread_user.users[each.key].object_id
  depends_on = [azuread_user.users]
}

#Create groups - first test, add users to groups.
resource "azuread_group" "groupname" {
for_each = { for dept in local.dept : dept.department => dept... }

display_name = format("%s", lower(each.key),)
security_enabled = true

depends_on = [azuread_user.users]
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


# Create Resource Groups

resource "azurerm_resource_group" "resource_groups_uks" {
  name = format("rg-%s", each.key)
  location = "UKSouth"
  for_each = toset(var.resource_groups_uksouth)
}

resource "azurerm_storage_account" "storage_uksouth" {
for_each = { for dept in local.dept : dept.department => dept... }

  name = format("%s", lower(each.key),)
  resource_group_name = "rg-storage"
  location                 = "UKSouth"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"


  tags = {
    environment = "storage_UKS"
  }
}