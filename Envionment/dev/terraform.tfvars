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
