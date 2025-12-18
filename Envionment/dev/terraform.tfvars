rg_devA = {
  "dev-rg-1" = {
    rg_name    = "dev-rg-001"
    location   = "West US"
    managed_by = "team-a"
    tags = {
      environment = "dev"
      project     = "project-a"
      owner       = "ashish_sir"
    }
  }
}

vnet_devA = {
  "dev-vnet-1" = {
    vnet_name     = "dev-vnet-001"
    location      = "West US"
    rg_name       = "dev-rg-001"
    address_space = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
      project     = "project-a"
      owner       = "ashish_sir"
    }

    subnets = [
      {
        subnet_name      = "dev-subnet-001"
        address_prefixes = ["10.0.1.0/24"]

      }
    ]
  }
}

pip_devA = {
  "dev-pip-1" = {
    pip_name          = "dev-pip-001"
    location          = "West US"
    rg_name           = "dev-rg-001"
    allocation_method = "Static"
    sku               = "Standard"
  }
}

nic_devA = {
  "dev-nic-1" = {
    nic_name    = "dev-nic-001"
    location    = "West US"
    rg_name     = "dev-rg-001"
    vnet_name   = "dev-vnet-001"
    subnet_name = "dev-subnet-001"
    pip_name    = "dev-pip-001"

    ip_configuration = [
      {
        name                          = "dev-ipconfig-001"
        subnet_id                     = "/subscriptions/your-subscription-id/resourceGroups/dev-rg-001/providers/Microsoft.Network/virtualNetworks/dev-vnet-001/subnets/dev-subnet-001"
        public_ip_address_id          = "/subscriptions/your-subscription-id/resourceGroups/dev-rg-001/providers/Microsoft.Network/publicIPAddresses/dev-pip-001"
        private_ip_address_allocation = "Dynamic"
      }
    ]

    tags = {
      environment = "dev"
      project     = "project-a"
      owner       = "ashish_sir"
    }
  }
}


kv_devA = {
  "dev-kv-1" = {
    kv_name                    = "dev-kv-001"
    location                   = "West US"
    rg_name                    = "dev-rg-001"
    sku_name                   = "standard"
    tenant_id                  = "17fefa14-e7b1-4378-b18d-e3dd81067594"
    purge_protection_enabled   = true
    soft_delete_retention_days = 30
    access_policies = [{
      tenant_id = "17fefa14-e7b1-4378-b18d-e3dd81067594"
      object_id = "e21b160d-8b35-45d8-8c5f-c90d7fac7a24"

      permissions = {
        keys = [
          "Get",
          "List",
          "Create",
          "Delete",
          "Update",
          "Recover",
          "Backup",
          "Restore",
          "Import"
        ]
        secrets = [
          "Get",
          "List",
          "Set",
          "Delete",
          "Recover",
          "Backup",
          "Restore"
        ]
        certificates = [
          "Get",
          "List",
          "Create",
          "Delete",
          "Update",
          "ManageContacts",
          "GetIssuers",
          "ListIssuers",
          "SetIssuers",
          "DeleteIssuers"
        ]
      }
      }
    ]
  }
}

kv_secret_devA = {
  secret_devA = {
    secret_name  = "Password"
    secret_value = "Parastayde@123"
  }
}
