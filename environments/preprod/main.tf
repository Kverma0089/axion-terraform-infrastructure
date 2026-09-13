module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}
module "vnets" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.vnets
}
module "subnet" {
  depends_on = [module.vnets]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
}
module "pips" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}
module "vms" {
  depends_on       = [module.subnet, module.pips]
  source           = "../../modules/azurerm_virtual_machine"
  virtual_machines = var.virtual_machines
}
