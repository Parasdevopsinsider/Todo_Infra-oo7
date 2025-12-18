resource "azurerm_linux_virtual_machine" "dev_vm" {
    for_each = var.vm_dev
    name = each.value.vm_name
    location = each.value.location
    resource_group_name = each.value.rg_name
    network_interface_ids = each.value.nic_ids
    size = each.value.vm_size
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
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