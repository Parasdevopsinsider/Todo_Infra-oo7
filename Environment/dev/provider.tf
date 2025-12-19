terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.55.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "paras_rg"
    storage_account_name = "parasstg"
    container_name       = "devcont"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "e5476362-58a0-48f7-8197-5aa05a4abfa5"

}