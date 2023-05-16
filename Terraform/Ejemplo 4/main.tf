terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.48.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = var.environment
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes = [tags]
  }
}

resource "azurerm_service_plan" "example" {
  name                = var.service_plan_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = var.sku_name
  os_type             = var.os_type
}

resource "azurerm_windows_web_app" "example" {
#   for_each            = var.windows_app_services

  for_each            = {for k, v in var.windows_app_services : k => v if v.minimum_tls_version == "1.2"}
  name                = each.value.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {

    minimum_tls_version = each.value.minimum_tls_version
    application_stack {
      dotnet_version = each.value.dotnet_version
    }
  }

}

resource "azurerm_windows_web_app" "example1" {
  name                = "pruebafg28"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {

    minimum_tls_version = "1.2"
    application_stack {
      dotnet_version = "v2.0"
    }
  }

}