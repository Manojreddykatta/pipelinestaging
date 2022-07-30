resource "azurerm_network_interface" "nic" {
  name                = var.nic
  location            = var.location
  resource_group_name = var.rg

  ip_configuration {
    name                          = var.ipconfig
    subnet_id                     = var.vsubid
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip.id
  }
}
resource "azurerm_public_ip" "publicip" {
  name                = "mrk_publicip"
  resource_group_name = var.rg
  location            = var.location
  allocation_method   = "Dynamic"
}