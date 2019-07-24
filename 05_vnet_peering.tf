# Ctreate VNet peering Between Hub and APP spokes

resource "azurerm_virtual_network_peering" "hub-2-app1"{
    name                            = "hub-2-app1"
    resource_group_name             = "${var.rg_name}"
    virtual_network_name            = "${azurerm_virtual_network.hub.name}"
    remote_virtual_network_id       = "${azurerm_virtual_network.app1.id}"
    depends_on                      = ["azurerm_resource_group.rg" , "azurerm_virtual_network.hub"]
}


resource "azurerm_virtual_network_peering" "app1-2-hub"{
    name                            = "app1-2-hub"
    resource_group_name             = "${var.rg_name}"
    virtual_network_name            = "${azurerm_virtual_network.app1.name}"
    remote_virtual_network_id       = "${azurerm_virtual_network.hub.id}"
    depends_on                      = ["azurerm_resource_group.rg" , "azurerm_virtual_network.app1"]
}

resource "azurerm_virtual_network_peering" "hub-2-app2"{
    name                            = "hub-2-app2"
    resource_group_name             = "${var.rg_name}"
    virtual_network_name            = "${azurerm_virtual_network.hub.name}"
    remote_virtual_network_id       = "${azurerm_virtual_network.app2.id}"
    depends_on                      = ["azurerm_resource_group.rg" , "azurerm_virtual_network.hub"]
}


resource "azurerm_virtual_network_peering" "app2-2-hub"{
    name                            = "app2-2-hub"
    resource_group_name             = "${var.rg_name}"
    virtual_network_name            = "${azurerm_virtual_network.app2.name}"
    remote_virtual_network_id       = "${azurerm_virtual_network.hub.id}"
    depends_on                      = ["azurerm_resource_group.rg" , "azurerm_virtual_network.app2"]
}