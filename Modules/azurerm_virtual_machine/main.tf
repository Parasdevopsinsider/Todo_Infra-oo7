data "azurerm_network_interface" "nic1" {
    for_each = var.vm_dev
    name = each.value.nic_name
    resource_group_name = each.value.rg_name
}

output "network_interface_id" {
  value = {
    for k, v in data.azurerm_network_interface.nic1 :
    k => v.id
  }
}

data "azurerm_key_vault" "kv1" {
for_each = var.vm_dev
  name                = each.value.key_vault_name
  resource_group_name = each.value.rg_name
}

output "key_vault_id" {
  value = {
    for k, v in data.azurerm_key_vault.kv1 :
    k => v.id
  }
}


data "azurerm_key_vault_secret" "secret1" {
    for_each = var.vm_dev
    name         = each.value.secret_name
    key_vault_id = data.azurerm_key_vault.kv1["dev-vm-1"].id
}

output "key_vault_secret_value" {
  value = data.azurerm_key_vault_secret.secret1
}

resource "azurerm_linux_virtual_machine" "dev_vm" {
    for_each = var.vm_dev
    name = each.value.vm_name
    location = each.value.location
    resource_group_name = each.value.rg_name
    network_interface_ids = [
        data.azurerm_network_interface.nic1["dev-vm-1"].id
    ]
    size = each.value.vm_size
    admin_username = each.value.admin_username
    admin_password = data.azurerm_key_vault_secret.secret1["dev-vm-1"].value
    disable_password_authentication = false

    os_disk {
        caching              = each.value.os_disk.caching
        storage_account_type = each.value.os_disk.storage_account_type
    }
    
    source_image_reference {
        publisher = each.value.source_image_reference.publisher
        offer     = each.value.source_image_reference.offer
        sku       = each.value.source_image_reference.sku
        version   = each.value.source_image_reference.version
    }
}