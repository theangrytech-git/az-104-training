# Configure the Azure Active Directory Provider
provider "azuread" {
}
#### General housekeeping
#### Retrieve domain information

data "azuread_domains" "default" {
  only_initial = true
}

#### Retrieve Sub ID
data "azurerm_subscription" "current" {}
output "current_subscription_display_name" {
  value = data.azurerm_subscription.current
}

locals {
  domain_name = data.azuread_domains.default.domains.0.domain_name
  users       = csvdecode(file("${path.module}/users.csv"))
  dept        = csvdecode(file("${path.module}/users.csv"))
}

  resource "random_string" "random" {
    length           = 4
    numeric = true
    lower = true
    upper = false
    special = false
}

  resource "random_string" "password" {
    length           = 12
    numeric = true
    lower = true
    upper = true
    special = true
}

#### Create users 
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

data "azuread_users" "user_accounts" {
  return_all = true
}

#### Create groups - first test, add users to groups.
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


#### Create Resource Groups for UKS, UKW and WEU

resource "azurerm_resource_group" "resource_groups" {
  for_each = var.resource_group_name
  name     = each.value.name
  location = each.value.location
  tags = {
    use = each.value.use
    source = "terraform"
  }
}

#### Creating Resources for UKS, UKW and WEU


  resource "random_string" "storage_random" {
    length           = 4
    special = false
    upper = false
    }

#### Adding in NSG, Virtual Networks and Subnets

  resource "azurerm_virtual_network" "vnet" {
   for_each = var.virtual_networks

   name                = var.virtual_networks[each.key].name
   location            = var.virtual_networks[each.key].location
   address_space       = var.virtual_networks[each.key].address_space
   resource_group_name = var.virtual_networks[each.key].resource_group_name
    
    dynamic "subnet" {
     for_each = var.virtual_networks[each.key].subnets

     content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
      }
      }
      tags = {
        use = each.value.use
        source = "terraform"
        location = var.virtual_networks[each.key].location
     }
      depends_on = [ azurerm_resource_group.resource_groups ]
  }

data "azurerm_subnet" "uks_compute_subnet" {
  name                 = var.compute_subnet
  virtual_network_name = var.uks_vnet
  resource_group_name  = var.uks_compute_rg

  depends_on = [ azurerm_resource_group.resource_groups, azurerm_virtual_network.vnet ]
}

#Storage Accounts
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
  tags = {
  use = each.value.use
  source = "terraform"
  location = var.storage_accounts[each.key].location
    }

  depends_on = [ azurerm_resource_group.resource_groups, azurerm_virtual_network.vnet ]
}

# Create Static Site
resource "azurerm_storage_account" "static_site" {
  for_each = var.static_site
  
  name                = "${lower(each.value.name)}${random_string.storage_random.result}"
  resource_group_name = each.value.resource_group_name

  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_kind             = each.value.account_kind
  account_replication_type = each.value.account_replication_type
  tags = {  
  use = each.value.use
  source = "terraform"
  location = var.static_site[each.key].location
  }

  static_website {
    index_document = var.static_website_index_document
    error_404_document = var.static_website_error_404_document 
  }
  depends_on = [ azurerm_resource_group.resource_groups, azurerm_virtual_network.vnet ]
}

### # Upload Static Content
# 1. Go to Storage Accounts -> staticwebsitexxxxxx -> Containers -> $web
# 2. Upload files from folder "static-content"

# # Verify 
# 1. Azure Storage Account created
# 2. Static Website Setting enabled
# 3. Verify the Static Content Upload Successful
# 4. Access Static Website: Goto Storage Account -> staticwebsitek123 -> Data Management -> Static Website
# 5. Get the endpoint name `Primary endpoint'



### Add NIC for Win_VM's and Public IP for one region....

resource "azurerm_public_ip" "vm_public_ip" {
  for_each = var.win_virtual_machines

  name                = "public-ip-${each.value.vm_name}"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.location == "uksouth" ? "Dynamic" : "None"
  idle_timeout_in_minutes = 15
}

resource "azurerm_network_interface" "win_vm_nic" {
  for_each = var.win_virtual_machines

  name                      = "${lower(each.value.vm_name)}${random_string.storage_random.result}"
  location                  = each.value.location
  resource_group_name       = each.value.resource_group_name
  enable_accelerated_networking = false
  tags = {
    OS = "Windows"
    source = "terraform"
  }
  ip_configuration {
    name                          = "internal"
    subnet_id = data.azurerm_subnet.uks_compute_subnet.id
    #subnet_id                     = "${data.azurerm_subscription.current.name}/resourceGroups/${var.uks_compute_rg.name}/providers/Microsoft.Network/virtualNetworks/${var.uks_vnet.id}/subnets/${var.compute_subnet.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = each.value.location == "uksouth" ? azurerm_public_ip.vm_public_ip[each.key].id : null
  }
}

resource "azurerm_network_interface" "lin_vm_nic" {
  for_each = var.lin_virtual_machines

  name                      = "${lower(each.value.vm_name)}${random_string.storage_random.result}"
  location                  = each.value.location
  resource_group_name       = each.value.resource_group_name
  enable_accelerated_networking = false
    tags = {
      OS = "Linux"
      source = "terraform"
    }
  ip_configuration {
    name                          = "internal"
    subnet_id = data.azurerm_subnet.uks_compute_subnet.id
    #subnet_id                     = "${data.azurerm_subscription.current.name}/resourceGroups/${var.uks_compute_rg.name}/providers/Microsoft.Network/virtualNetworks/${var.uks_vnet.id}/subnets/${var.compute_subnet.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

#### Create an Azure Virtual Machine

# Windows
resource "azurerm_windows_virtual_machine" "vm_win" {
  for_each = var.win_virtual_machines

  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_B1ms"
  admin_username      = "local_admin"
  admin_password      = random_string.password.result
  network_interface_ids = [azurerm_network_interface.win_vm_nic[each.key].id]

  tags = {
      OS = "Windows"
      use = each.value.use
      source = "terraform"
      location = each.value.location
    }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb = 150
  }

  source_image_reference {
    publisher = "microsoftwindowsdesktop"
    offer     = "windows-11"
    sku       = "win11-22h2-pro"
    version   = "latest"
  }
  depends_on = [ azurerm_resource_group.resource_groups, azurerm_virtual_network.vnet, azurerm_network_interface.win_vm_nic ]
}

#Linux
resource "azurerm_linux_virtual_machine" "vm_lin" {
  for_each = var.lin_virtual_machines

  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_B1ms"
  admin_username      = "local_admin"
  admin_password      = random_string.password.result
  network_interface_ids = [azurerm_network_interface.lin_vm_nic[each.key].id]
  disable_password_authentication = false

    tags = {
      OS = "Linux"
      use = each.value.use
      source = "terraform"
      location = each.value.location
      }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Debian"
    offer     = "debian-11"
    sku       = "11-backports-gen2"
    version   = "latest"
  }
  depends_on = [ azurerm_resource_group.resource_groups, azurerm_virtual_network.vnet, azurerm_network_interface.lin_vm_nic ]
}

# Windows Scale Sets
resource "azurerm_windows_virtual_machine_scale_set" "win_vmss" {
  for_each = var.win_vmss
  computer_name_prefix = each.value.computer_name_prefix
  name                = each.value.vmss_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = "Standard_B1ms"
  instances           = 3
  admin_username      = "local_admin"
  admin_password      = random_string.password.result
  
  tags = {
      OS = "Windows"
      use = each.value.use
      source = "terraform"
      location = each.value.location
    }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  data_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
    disk_size_gb         = 150
    lun                  = 10
  }

  network_interface {
    name    = "win-vmss-nic-${random_string.storage_random.result}"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = data.azurerm_subnet.uks_compute_subnet.id
    }
  }
  depends_on = [ azurerm_resource_group.resource_groups, azurerm_virtual_network.vnet ]
}

#### NSG
resource "azurerm_network_security_group" "nsg" {
  for_each = var.nsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_security_rule" "deny-outbound" {
  for_each = azurerm_network_security_group.nsg

  name                        = "deny-outbound-${each.key}"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  resource_group_name         = azurerm_network_security_group.nsg[each.key].resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg[each.key].name
  depends_on = [ azurerm_network_security_group.nsg ]

}

resource "azurerm_network_security_rule" "allow-uk-south" {
  for_each = azurerm_network_security_group.nsg

  name                        = "allow-uk-south-${each.key}"
  priority                    = 150
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_network_security_group.nsg[each.key].resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg[each.key].name
  depends_on = [ azurerm_network_security_group.nsg ]
}

# Network Peering
resource "azurerm_virtual_network_peering" "peering" {
  for_each = var.peering

  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet[each.value.vnet_1].name
  remote_virtual_network_id = azurerm_virtual_network.vnet[each.value.vnet_2].id
  depends_on = [azurerm_virtual_network.vnet, azurerm_resource_group.resource_groups]
}

### Adding Bastion
resource "azurerm_virtual_network" "bastion_network" {
  name                = "bastion_vnet"
  address_space       = ["192.168.1.0/24"]
  location            = var.bastion_location
  resource_group_name = var.bastion_resource_group
}

resource "azurerm_subnet" "BastionSubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_virtual_network.bastion_network.resource_group_name
  virtual_network_name = azurerm_virtual_network.bastion_network.name
  address_prefixes     = ["192.168.1.224/27"]
  depends_on = [ azurerm_virtual_network.bastion_network ]
}

resource "azurerm_public_ip" "bastionpip" {
  name                = "bastionpip"
  location            = azurerm_virtual_network.bastion_network.location
  resource_group_name = azurerm_virtual_network.bastion_network.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  depends_on = [ azurerm_virtual_network.bastion_network, azurerm_subnet.BastionSubnet ]
}

resource "azurerm_bastion_host" "bastion" {
  name                = "bastionpip"
  location            = azurerm_virtual_network.bastion_network.location
  resource_group_name = azurerm_virtual_network.bastion_network.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.BastionSubnet.id
    public_ip_address_id = azurerm_public_ip.bastionpip.id
  }
  depends_on = [ azurerm_virtual_network.bastion_network, azurerm_subnet.BastionSubnet, azurerm_public_ip.bastionpip ]
}

# Log Analytics
resource "azurerm_log_analytics_workspace" "log_analytics" {
  for_each = var.log_analytics_workspace
  name                = each.value.log_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = "PerGB2018"
    tags = {      
      use = each.value.use
      source = "terraform"
      location = each.value.location
  }

  depends_on = [ azurerm_resource_group.resource_groups, azurerm_linux_virtual_machine.vm_lin, azurerm_windows_virtual_machine.vm_win, azurerm_windows_virtual_machine_scale_set.win_vmss, azurerm_storage_account.storage_accounts ]
}

# App Insights
resource "azurerm_application_insights" "app_insights" {
  for_each = var.app_insights
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  workspace_id        = azurerm_log_analytics_workspace.log_analytics[each.key].id
  application_type    = "web"

  tags = {      
    use = each.value.use
    source = "terraform"
    location = each.value.location
  }
}

output "instrumentation_key" {
  value = { for k, v in azurerm_application_insights.app_insights : k => v.instrumentation_key }
  sensitive = true
}

output "app_id" {
  value = { for k, v in azurerm_application_insights.app_insights : k => v.app_id }
  sensitive = true
}

# App Config
resource "azurerm_app_configuration" "azurerm_app_configuration" {
  for_each = var.app_config
  name                       = each.value.name
  resource_group_name        = each.value.resource_group_name
  location                   = each.value.location
  sku                        = each.value.sku
  public_network_access      = "Enabled"
  purge_protection_enabled   = false

  tags = {      
    use = each.value.use
    source = "terraform"
    location = each.value.location
  }
}

# Key Vault
resource "azurerm_key_vault" "key_vault" {
  for_each = var.key_vault

  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_subscription.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = "standard"

tags = {      
    use = each.value.use
    source = "terraform"
    location = each.value.location
  }

}


# Look to create a Function App with a VERY basic function (ASP, FA, SA?)

# Update README with some details, VStudio Credits, link to create a free azure account, and start crafting scenarios from AZ-104