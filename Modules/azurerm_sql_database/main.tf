data "azurerm_mssql_server" "server1" {
     for_each = var.sql_database_dev
  name                = each.value.sql_server_name
  resource_group_name = each.value.rg_name
}

output "sql_server_ids" {
  value = {
    for k, v in data.azurerm_mssql_server.server1 :
    k => v.id
  }
}

resource "azurerm_mssql_database" "database1" {
  for_each = var.sql_database_dev
  name                = each.value.sql_database_name
  server_id           = data.azurerm_mssql_server.server1["dev-sqldatabase-1"].id
  collation          = each.value.collation
  max_size_gb        = each.value.max_size_gb
  sku_name           = each.value.sku_name
  zone_redundant     = each.value.zone_redundant
}