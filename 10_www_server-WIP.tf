# Creating WebServer 1

#Script path to build WebServer-1 
data "template_file" "www_script1" {

  template = "${file("${path.root}${var.www_script_path1}")}"
}
data "template_cloudinit_config" "config1" {
  gzip          = true
  base64_encode = true

  part {
    content = "${data.template_file.www_script1.rendered}"
  }
}


# Creating Storage Account for Boot Diagnostics for Serial Console access to the ubuntu host

resource "azurerm_storage_account" "app1strgacc" {
  name                      = "sknapp1host1" 
  resource_group_name       = "${var.rg_name}"
  location                  = "${var.location}"
  account_replication_type  = "LRS"
  account_tier              = "Standard"
  depends_on                = ["azurerm_resource_group.rg",
                                  "random_id.randomId"]
}


# Create test host app1-host1
resource "azurerm_virtual_machine" "app1-host1" {
  name                      = "app1-host1"
  location                  = "${var.location}"
  resource_group_name       = "${var.rg_name}"
  vm_size                   = "Standard_DS1_v2"

  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher               = "Canonical"
    offer                   = "UbuntuServer"
    sku                     = "18.04-LTS"
    version                 = "latest"
  }

  storage_os_disk {
    name                    = "app1-host1-osdisk1"
    caching                 = "ReadWrite"
    create_option           = "FromImage"
    managed_disk_type       = "Standard_LRS"
  }

  os_profile {
    computer_name           = "app1-host1"
    admin_username          = "${var.adminUsername}"
    admin_password          = "${var.adminPassword}"
    custom_data             = "${data.template_cloudinit_config.config1.rendered}"
  }

  network_interface_ids     = ["${azurerm_network_interface.app1-host1-nic0.id}"]

  os_profile_linux_config {
    disable_password_authentication = false
  }

  boot_diagnostics {
    enabled                 = "true"
    storage_uri             = "${azurerm_storage_account.app1strgacc.primary_blob_endpoint}"
  }
  depends_on                = ["azurerm_network_interface.app1-host1-nic0", 
                           "azurerm_storage_account.app1strgacc"]
}

#----------------Creating WebServer 2--------------------

#Script path to build WebServer-2 
data "template_file" "www_script2" {

  template = "${file("${path.root}${var.www_script_path2}")}"
}
data "template_cloudinit_config" "config2" {
  gzip          = true
  base64_encode = true

  part {
    content = "${data.template_file.www_script2.rendered}"
  }
}
# Creating Storage Account for Boot Diagnostics for Serial Console access to the ubuntu host App2

resource "azurerm_storage_account" "app2strgacc" {
  name                          = "sknapp2host1"
  resource_group_name           = "${var.rg_name}"
  location                      = "${var.location}"
  account_replication_type      = "LRS"
  account_tier                  = "Standard"
  depends_on                    = ["azurerm_resource_group.rg"]
}


# Create test host app2-host1
resource "azurerm_virtual_machine" "app2-host1" {
  name                      = "app2-host1"
  location                  = "${var.location}"
  resource_group_name       = "${var.rg_name}"
  vm_size                   = "Standard_DS1_v2"

  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher               = "Canonical"
    offer                   = "UbuntuServer"
    sku                     = "18.04-LTS"
    version                 = "latest"
  }

  storage_os_disk {
    name                    = "app2-host1-osdisk1"
    caching                 = "ReadWrite"
    create_option           = "FromImage"
    managed_disk_type       = "Standard_LRS"
  }

  os_profile {
    computer_name           = "app2-host1"
    admin_username          = "${var.adminUsername}"
    admin_password          = "${var.adminPassword}"
    custom_data             = "${data.template_cloudinit_config.config2.rendered}"
  }

  network_interface_ids     = ["${azurerm_network_interface.app2-host1-nic0.id}"]

  os_profile_linux_config {
    disable_password_authentication = false
  }

  boot_diagnostics {
    enabled                 = "true"
    storage_uri             = "${azurerm_storage_account.app2strgacc.primary_blob_endpoint}"
  }
  depends_on                = ["azurerm_network_interface.app2-host1-nic0", 
                               "azurerm_storage_account.app2strgacc"]
}
