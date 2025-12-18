variable "sql_database_dev" {
  description = "The name of the SQL Database."
  type = map(object({
    sql_database_name = string
    sql_server_name   = string
    rg_name           = string
    collation        = string
    max_size_gb      = number
    sku_name         = string
    zone_redundant   = bool
  }))
}