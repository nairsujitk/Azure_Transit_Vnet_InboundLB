# Create virtual network For HUB VNet
resource "azurerm_virtual_network" "hub" {
  name                = "${var.hub-vnet-name}"
  resource_group_name = "${var.rg_name}"
  location            = "${var.location}"
  address_space       = ["${var.hub-cidr}"]
  depends_on          = ["azurerm_resource_group.rg"]
}

# Create virtual network For APP1 VNet
resource "azurerm_virtual_network" "app1" {
  name                = "${var.app1-vnet-name}"
  resource_group_name = "${var.rg_name}"
  location            = "${var.location}"
  address_space       = ["${var.app1-cidr}"]
  depends_on          = ["azurerm_resource_group.rg"]
}

# Create virtual network For APP2 VNet
resource "azurerm_virtual_network" "app2" {
  name                = "${var.app2-vnet-name}"
  resource_group_name = "${var.rg_name}"
  location            = "${var.location}"
  address_space       = ["${var.app2-cidr}"]
  depends_on          = ["azurerm_resource_group.rg"]
}

