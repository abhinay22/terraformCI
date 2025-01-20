terraform {
  required_version = ">=1.10.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  cloud {

    organization = "sunnyorg"

    workspaces {
      name = "remotestate"
    }
  }
}
provider "azurerm" {
  features {

  }
}
resource "azurerm_resource_group" "newappgrooup" {
  name     = "storagegrp3452"
  location = "Central US"
}

resource "azurerm_storage_account" "ssstorage" {
  resource_group_name      = azurerm_resource_group.newappgrooup.name
  location                 = azurerm_resource_group.newappgrooup.location
  name                     = "mlstoragebs00123"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
}
resource "azurerm_app_service_plan" "new_appsvc_plan" {
  name                = "newappserviceplan"
  location            = azurerm_resource_group.newappgrooup.location
  resource_group_name = azurerm_resource_group.newappgrooup.name
  sku {
    tier = "standard"
    size = "s1"
  }

}

resource "azurerm_app_service" "newappsvc349" {
  resource_group_name = azurerm_resource_group.newappgrooup.name
  location            = azurerm_resource_group.newappgrooup.location
  name                = "newappservice234"
  app_service_plan_id = azurerm_app_service_plan.new_appsvc_plan.id

}
