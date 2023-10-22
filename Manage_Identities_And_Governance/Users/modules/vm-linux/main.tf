resource "azurerm_linux_virtual_machine" "vm_linux" {
  name                             = var.name
  resource_group_name              = var.resource_group_name
  location                         = var.location
  size                             = var.size
  admin_username                   = "vmss_admin"
  admin_password                   = "Pa55w0rd9g9g" #Bad practice - look to randomise or redact?
  disable_password_authentication  = false

  os_disk {
    storage_account_type  = "Standard_LRS"
    caching               = "ReadWrite"
    disk_size_gb = 50
  }
  
  network_interface_ids = [ var.network_interface_ids]

  source_image_reference {
    publisher  = "Debian"
    offer      = "Debian-11"
    sku        = "11-backports-gen2"
    version    = "latest"
  }

  }

