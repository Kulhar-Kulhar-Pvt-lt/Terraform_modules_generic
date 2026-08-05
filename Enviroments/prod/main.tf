module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs=var.rgs
  }
  module "resource_vnet" {
    depends_on = [ module.resource_group ]
    source = "../../modules/azurerm_virtual_network"
    vnets=var.vnets
    }
  module "resource_subnet" {
    depends_on = [ module.resource_vnet ]
    source = "../../modules/azurerm_subnet"
    subnets = var.subnets
  }
  module "resource_publicip" {
    depends_on = [ module.resource_group ]
    source = "../../modules/azurerm_publicip"
    pips=var.pips
}
  module "resource_vm" {
    depends_on = [ module.resource_subnet ]
    source = "../../modules/azurerm_virtual_machine"
    vms=var.vms
  }