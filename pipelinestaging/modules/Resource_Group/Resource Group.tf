resource "azurerm_resource_group" "mrk-rg" {
  name     = var.resource_group
  location = var.location
}
