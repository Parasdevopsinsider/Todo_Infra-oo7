variable "sql_server_dev" {
  description = "The name of the SQL Server."
  type = map(object({
    sql_server_name              = string
    rg_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
  }))
}
