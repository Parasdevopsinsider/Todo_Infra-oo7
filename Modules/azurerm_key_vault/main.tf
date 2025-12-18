data "azurerm_client_config" "current" {}

output "client_id" {
  value = data.azurerm_client_config.current.client_id
}

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

    dynamic "access_policy" {
        for_each = each.value.access_policies
        content {
            tenant_id = access_policy.value.tenant_id
            object_id = access_policy.value.object_id

                key_permissions      = access_policy.value.permissions.keys
                secret_permissions    = access_policy.value.permissions.secrets
                certificate_permissions = access_policy.value.permissions.certificates
            }
        }

}
