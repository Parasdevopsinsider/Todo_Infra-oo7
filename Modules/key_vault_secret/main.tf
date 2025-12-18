data "azurerm_key_vault" "kv1" {
    for_each = var.kv_secret_dev
  name                = "dev-kv-001"
  resource_group_name = "dev-rg-001"
}

output "key_vault_ids" {
  value = {
    for k, v in data.azurerm_key_vault.kv1 :
    k => v.id
  }
}

resource "azurerm_key_vault_secret" "secret1" {
    for_each = var.kv_secret_dev
    name         = each.value.secret_name
    value        = each.value.secret_value
    key_vault_id = data.azurerm_key_vault.kv1[each.key].id
}