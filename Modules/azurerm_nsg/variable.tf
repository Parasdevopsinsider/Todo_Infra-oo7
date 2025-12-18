variable "nsg_dev" {
    description = "A map of network security groups to create"
    type = map(object({
        nsg_name  = string
        location  = string
        rg_name   = string

        security_rules = list(object({
            rule_name                       = string
            priority                   = number
            direction                  = string
            access                     = string
            protocol                   = string
            source_port_range          = string
            destination_port_range     = string
            source_address_prefix      = string
            destination_address_prefix = string
        }))
    }))
}