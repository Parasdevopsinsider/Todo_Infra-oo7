module "resource_group" {
  source = "../../Modules/azurerm_resource_group"
  rg_dev = var.rg_devA
}

module "virtual_network" {
  source   = "../../Modules/azurerm_virtual_network"
  vnet_dev = var.vnet_devA

}