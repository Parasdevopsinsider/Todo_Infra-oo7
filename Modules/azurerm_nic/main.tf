data "azurerm_subnet" "subnet1" {
  for_each             = var.nic_dev
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

output "subnet_ids" {
  value = {
    for k, v in data.azurerm_subnet.subnet1 :
    k => v.id
  }
}

data "azurerm_public_ip" "pip1" {
  for_each            = var.nic_dev
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}

output "public_ip_addresses" {
  value = {
    for k, v in data.azurerm_public_ip.pip1 :
    k => v.ip_address
  }
}

resource "azurerm_network_interface" "nic1" {
  for_each            = var.nic_dev
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "dev-ipconfig-001"
    subnet_id                     = data.azurerm_subnet.subnet1[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip1[each.key].id
  }
}
