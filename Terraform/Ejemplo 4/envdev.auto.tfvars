resource_group_name         = "examp4"
location                    = "West Europe"
storage_account_name        = "paccount1"
account_tier                = "Standard"
account_replication_type    = "LRS"
service_plan_name           = "exampappserviceplanfg28"
sku_name                    = "P1v2"
os_type                     = "Windows"
environment                 = "dev"
windows_app_services    = {

  "dotnet40" = {
    name                = "ap1-fg28-r"
    minimum_tls_version = "1.2"
    dotnet_version      = "v4.0"

  }
  "dotnet30" = {
    name                = "ap2-fg28-r"
    minimum_tls_version = "1.1"
    dotnet_version      = "v3.0"

  }
  "dotnet20" = {
    name                = "ap3-fg28-r"
    minimum_tls_version = "1.2"
    dotnet_version      = "v2.0"

  }

}