# Create azure resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.rg_name}"
  location = "${var.location}"
}

# Creating random string for use in DNS Labels 
resource "random_id" "randomId" {
  byte_length = 8
}