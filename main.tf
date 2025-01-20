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
resource "azurerm_resource_group" "newappgrooup4" {
  name     = "storagegrp3157"
  location = "Italy North"
}
resource "azurerm_app_service_plan" "new_appsvc_plan" {
  name                = "newappserviceplan"
  location            = azurerm_resource_group.newappgrooup4.location
  resource_group_name = azurerm_resource_group.newappgrooup4.name
  sku {
    tier = "Premium"
    size = "S2"
  }

}

resource "azurerm_app_service" "newappsvc349" {
  resource_group_name = azurerm_resource_group.newappgrooup4.name
  location            = azurerm_resource_group.newappgrooup4.location
  name                = "newappservice234"
  app_service_plan_id = azurerm_app_service_plan.new_appsvc_plan.id

}
