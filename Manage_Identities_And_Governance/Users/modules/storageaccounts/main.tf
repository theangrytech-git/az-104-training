resource "azurerm_storage_account" "storage_account" {
name = var.storage_account.name
resource_group_name = var.resource_group_name
location = var.storage_account.location
account_tier = var.storage_account.account_tier
account_replication_type = var.storage_account.account_replication_type
account_kind = var.storage_account.account_kind
cross_tenant_replication_enabled = var.storage_account.cross_tenant_replication_enabled
min_tls_version = var.storage_account.min_tls_version
}