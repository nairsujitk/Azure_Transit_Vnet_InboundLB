output "Pub_LB_URL" {
    description = "URL of the Public Load Balancer"
    value = "${azurerm_public_ip.pubip.fqdn}"
}

output "Pub_mgmt_FW1_URL" {
    description = "URL of the Firewall-1 Managment"
    value = "${azurerm_public_ip.mgmtPIP_0.fqdn}"
}

output "Pub_mgmt_FW2_URL" {
    description = "URL of the Firewall-2 Managment"
    value = "${azurerm_public_ip.mgmtPIP_1.fqdn}"
}

output "APP1-FQDN" {
    value = "${azurerm_public_ip.app1PIP_0.fqdn}"
}

output "APP2-FQDN" {
    value = "${azurerm_public_ip.app2PIP_0.fqdn}"
}