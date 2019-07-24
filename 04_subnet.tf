#Create subnets in VNet
resource "azurerm_subnet" "mgmt" {
    name                      = "${var.mgmtSubnetName}"
    resource_group_name       = "${var.rg_name}"
    address_prefix            = "${var.mgmtSubnet}"
    virtual_network_name      = "${azurerm_virtual_network.hub.name}"
    network_security_group_id = "${azurerm_network_security_group.mgmt-nsg.id}"
    depends_on                = ["azurerm_virtual_network.hub" ,
                                 "azurerm_network_security_group.mgmt-nsg"]
}

resource "azurerm_subnet" "untrust" {
    name                      = "${var.untrustSubnetName}"
    resource_group_name       = "${var.rg_name}"
    address_prefix            = "${var.untrustSubnet}"
    virtual_network_name      = "${azurerm_virtual_network.hub.name}"
    network_security_group_id = "${azurerm_network_security_group.FwInt-Nsg.id}"
    depends_on                = ["azurerm_virtual_network.hub" ,
                                 "azurerm_network_security_group.FwInt-Nsg"]
}

resource "azurerm_subnet" "trust" {
    name                      = "${var.trustSubnetName}"
    resource_group_name       = "${var.rg_name}"
    address_prefix            = "${var.trustSubnet}"
    virtual_network_name      = "${azurerm_virtual_network.hub.name}"
    network_security_group_id = "${azurerm_network_security_group.FwInt-Nsg.id}"
    depends_on                = ["azurerm_virtual_network.hub" ,
                                 "azurerm_network_security_group.FwInt-Nsg"]
}

resource "azurerm_subnet" "app1" {
    name                      = "${var.app1SubnetName}"
    resource_group_name       = "${var.rg_name}"
    address_prefix            = "${var.app1Subnet}"
    virtual_network_name      = "${azurerm_virtual_network.app1.name}"
    network_security_group_id = "${azurerm_network_security_group.App-Nsg.id}"
    depends_on                = ["azurerm_virtual_network.app1" , 
                                 "azurerm_network_security_group.App-Nsg"]
}
resource "azurerm_subnet" "app2" {
    name                      = "${var.app2SubnetName}"
    resource_group_name       = "${var.rg_name}"
    address_prefix            = "${var.app2Subnet}"
    virtual_network_name      = "${azurerm_virtual_network.app2.name}"
    network_security_group_id = "${azurerm_network_security_group.App-Nsg.id}"
    depends_on                = ["azurerm_virtual_network.app2" , 
                                 "azurerm_network_security_group.App-Nsg"]
}