variable "nic_dev" {
    description = "A map of network interfaces to create"
    type = map(object({
        nic_name = string
        location = string
        rg_name = string
        vnet_name = string
        subnet_name = string    
        pip_name = string
        
        ip_configuration = list(object({
            name = string
            subnet_id = string
            private_ip_address_allocation = string
            public_ip_address_id = optional(string)
        }))
    }))
}