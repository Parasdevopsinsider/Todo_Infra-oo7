variable "kv_dev" {
    description = "A map of key vaults to create"
    type = map(object({
        kv_name = string
        location = string
        rg_name = string
        sku_name = string
        tenant_id = string
        purge_protection_enabled = bool
soft_delete_retention_days = number
        access_policies = list(object({
            tenant_id = string
            object_id = string
            permissions = object({
                keys = list(string)
                secrets = list(string)
                certificates = list(string)
            })
        }))
    }))
}