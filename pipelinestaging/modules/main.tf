module "configuration1" {
  source   = "./NIC"
  nic      = "mrk_nic"
  ipconfig = "mrk-ip"
  vsubid   = module.configuration4.vsubid
  location = "eastus"
  rg       = module.configuration2.rgid
}
module "configuration2" {
  source         = "./Resource_Group"
  resource_group = "mrk-RG"
  location       = "eastus"
}

module "configuration3" {
  source        = "./VM"
  vm            = "mrk-vm"
  size          = "Standard_D4s_v3"
  vmuser_name   = "mrk"
  user_password = "Azure@2022"
  rights        = "ReadWrite"
  storage       = "Standard_LRS"
  micsft        = "microsoftwindowsserver"
  win           = "windowsserver"
  vmwin_versing = "2016-datacenter"
  location      = "eastus"
  rg            = module.configuration2.rgid
  nic           = module.configuration1.nicid
}
module "configuration4" {
  source     = "./VNet"
  vnet       = "mrk-vnet"
  cidr_block = "10.3.0.0/16"
  vsub       = "mrk-subnet"
  ip_address = "10.3.2.0/24"
  location   = "eastus"
  rg         = module.configuration2.rgid
}
