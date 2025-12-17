variable "pip_dev" {
    description = "New map of pip to create"
    type = map(object({
        pip_name = string
        location = string
        rg_name = string
        allocation_method = string
        sku = string
    }))
}