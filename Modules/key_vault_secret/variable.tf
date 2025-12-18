variable "kv_secret_dev" {
    description = "A map of key vault secrets to create"
    type = map(object({
        secret_name  = string
        secret_value = string
    }))
}