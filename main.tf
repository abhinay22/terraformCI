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
      name = "terrormciproj"
    }
  }
}
provider "azurerm" {
  features {

  }
}
resource "azurerm_resource_group" "newappgrooup3" {
  name     = "storagegrp3152"
  location = "Italy North"
}

resource "azurerm_storage_account" "ssstorage" {
  resource_group_name      = azurerm_resource_group.newappgrooup3.name
  location                 = azurerm_resource_group.newappgrooup3.location
  name                     = "mlstoragebs0012399"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
}
resource "azurerm_app_service_plan" "new_appsvc_plan" {
  name                = "newappserviceplan"
  location            = azurerm_resource_group.newappgrooup3.location
  resource_group_name = azurerm_resource_group.newappgrooup3.name
  sku {
    tier = "Premium"
    size = "S2"
  }

}

resource "azurerm_app_service" "newappsvc349" {
  resource_group_name = azurerm_resource_group.newappgrooup3.name
  location            = azurerm_resource_group.newappgrooup3.location
  name                = "newappservice234"
  app_service_plan_id = azurerm_app_service_plan.new_appsvc_plan.id

}
