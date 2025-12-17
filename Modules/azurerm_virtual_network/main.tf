resource "azurerm_virtual_network" "vnet1" {
    for_each = var.vnet_dev
    name = each.value.vnet_name
    resource_group_name = each.value.rg_name
    location = each.value.location
    address_space = each.value.address_space
    tags = lookup(each.value, "tags", null)

    dynamic "subnet" {
        for_each = each.value.subnets
        content {
            name = subnet.value.subnet_name
            address_prefixes = subnet.value.address_prefixes
        }
    }
}
