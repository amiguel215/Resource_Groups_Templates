variable "resource_group_name" {
  type = string

}
variable "location" {
  type    = string
  default = "West Europe"
}
variable "storage_account_name" {
    type    = string
}

variable "account_tier" {
    type    = string
}

variable "account_replication_type" {
    type = string
}

variable "service_plan_name" {
  type = string
}
variable "sku_name" {
  type = string
}
variable "os_type" {
  type = string

}
variable "windows_app_services" {
  type = map(any)
}
variable "environment" {
  type = string
}