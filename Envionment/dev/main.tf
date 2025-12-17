module "resource_group" {
  source = "../../Modules/azurerm_resource_group"
  rg_dev = var.rg_devA
}