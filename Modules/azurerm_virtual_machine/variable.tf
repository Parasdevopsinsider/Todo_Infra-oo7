variable "vm_dev" {
    description = "A map of virtual machines to create"
    type = map(object({
        vm_name = string
        location = string
        rg_name = string
        nic_name = string
        secret_name = string
        key_vault_name = string
        vm_size = string
        admin_username = string
        os_disk = object({
            caching = string
            storage_account_type = string 
        })
        source_image_reference = object({
            publisher = string
            offer     = string
            sku       = string
            version   = string
        })
    }))
}