resource "azurerm_network_interface" "vm_win_nic" {
  name                = var.vm_win_nic_name
  location            = var.nic_location
  resource_group_name = var.nic_resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm_windows" {
  name                             = var.name
  resource_group_name              = var.resource_group_name
  location                         = var.location
  size                             = var.size
  admin_username                   = "vmss_admin"
  admin_password                   = "Pa55w0rd9g9g" #Bad practice - look to randomise or redact?

  os_disk {
    storage_account_type  = "Standard_LRS"
    caching               = "ReadWrite"
    disk_size_gb = 50
  }
  
  network_interface_ids = [azurerm_network_interface.vm_win_nic.id]

  source_image_reference {
    publisher  = "Debian"
    offer      = "Debian-11"
    sku        = "11-backports-gen2"
    version    = "latest"
  }

  }