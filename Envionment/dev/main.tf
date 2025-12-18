module "resource_group" {
  source = "../../Modules/azurerm_resource_group"
  rg_dev = var.rg_devA
}

module "virtual_network" {
  depends_on = [ module.resource_group ]
  source   = "../../Modules/azurerm_virtual_network"
  vnet_dev = var.vnet_devA

}

module "public_ip" {
  depends_on = [ module.virtual_network ]
  source  = "../../Modules/azurerm_pip"
  pip_dev = var.pip_devA
}

module "network_interface" {
  depends_on = [ module.public_ip ]
  source  = "../../Modules/azurerm_nic"
  nic_dev = var.nic_devA
}

module "key_vault" {
  depends_on = [ module.resource_group ]
  source = "../../Modules/azurerm_key_vault"
  kv_dev = var.kv_devA
}

module "secret" {
  depends_on = [ module.key_vault ]
  source        = "../../Modules/key_vault_secret"
  kv_secret_dev = var.kv_secret_devA
}