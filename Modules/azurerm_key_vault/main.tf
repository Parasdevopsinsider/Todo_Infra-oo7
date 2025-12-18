data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv1" {
    for_each = var.kv_dev
    name = each.value.kv_name
    location = each.value.location
    resource_group_name = each.value.rg_name
    tenant_id = each.value.tenant_id
    sku_name = each.value.sku_name
    purge_protection_enabled = each.value.purge_protection_enabled
    soft_delete_retention_days = each.value.soft_delete_retention_days
    tags = lookup(each.value, "tags", null)

    access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy"
    ]

    secret_permissions = [
      "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
    ]

    storage_permissions = [
      "Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"
    ]
  }
}