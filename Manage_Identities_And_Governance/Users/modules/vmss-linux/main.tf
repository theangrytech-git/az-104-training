resource "azurerm_linux_virtual_machine_scale_set" "vmss_linux" {
  computer_name_prefix  = "vmslinuks"
  name                             = var.name
  resource_group_name              = var.resource_group_name
  location                         = var.location
  sku                              = var.sku
  instances                        = var.instances
  admin_username                   = "vmss_admin"
  admin_password                   = "Pa55w0rd9g9g" #Bad practice - look to randomise or redact?
  disable_password_authentication  = false

  source_image_reference {
    publisher  = "Canonical"
    offer      = "UbuntuServer"
    sku        = "18.04-LTS "
    version    = "latest"
  }

  network_interface {
    name     = var.network_interface_name
    primary  = var.network_interface_primary

    ip_configuration {
      name       = var.ipconfig_name
      primary    = var.ipconfig_primary
      subnet_id  = var.ipconfig_subnet
    }
  }

  os_disk {
    storage_account_type  = "Standard_LRS"
    caching               = "ReadWrite"
  }
  data_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
    disk_size_gb         = 10
    lun                  = 10
  }

}