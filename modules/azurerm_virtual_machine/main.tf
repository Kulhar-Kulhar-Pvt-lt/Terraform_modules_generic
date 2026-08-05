# data "azurerm_subnet" "subnet"{
#     for_each = var.vms
#   name                 = each.value.subnetname
#   virtual_network_name = each.value.vnetname
#   resource_group_name  = each.value.resource_group_name
# }
# data "azurerm_public_ip" "publicip" {
#     for_each = var.vms
#   name                = each.value.publicipname
#   resource_group_name = each.value.resource_group_name
# }

# resource "azurerm_network_interface" "nic" {
#     for_each = var.vms
#   name                =each.value.nic_name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name

#   ip_configuration {
#     name                          = each.value.ipconname
#     subnet_id                     = data.azurerm_subnet.subnet[each.key].id
#     public_ip_address_id           =data.azurerm_public_ip.publicip[each.key].id
#      private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_linux_virtual_machine" "vms" {
#   for_each = var.vms
#   name                = each.value.vmname
#   resource_group_name = each.value.resource_group_name
#   location            = each.value.location
#   size                = each.value.vm_size
#   admin_username      = each.value.admin_username
#   admin_password     = each.value.admin_password
#   network_interface_ids = [azurerm_network_interface.nic[each.key].id]
# disable_password_authentication=false

#   os_disk {
    
#     caching              = each.value.caching
#     storage_account_type = each.value.storage_account_type
#   }

#  source_image_reference {
#   publisher = each.value.publisher
#   offer     = each.value.offer
#   sku       = each.value.sku
#   version   = each.value.version
# }
# }