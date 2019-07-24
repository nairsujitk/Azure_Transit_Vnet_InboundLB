# Create Frontend Public IP for Public load balancer
resource "azurerm_public_ip" "pubip" {
  name                = "publb-ip" 
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"
  allocation_method   = "Dynamic"
  domain_name_label   = "publb-${random_id.randomId.hex}"
  depends_on          = ["azurerm_resource_group.rg", 
                         "random_id.randomId"]
} 

# Create an inbound public load balancer

resource "azurerm_lb" "publb" {
  name                = "app_lb"
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"

  frontend_ip_configuration {
    name                          = "publb-fe"
    public_ip_address_id          = "${azurerm_public_ip.pubip.id}"
  }
  depends_on                      = ["azurerm_resource_group.rg",
                                     "azurerm_public_ip.pubip"]
}

# Create a back end pool
resource "azurerm_lb_backend_address_pool" "publb-bp" {
  resource_group_name = "${var.rg_name}"
  loadbalancer_id     = "${azurerm_lb.publb.id}"
  name                = "fw-untrust-pool"
  depends_on          = ["azurerm_lb.publb"]
} 


# Create a LB probe
resource "azurerm_lb_probe" "publb-probe" {
  resource_group_name = "${var.rg_name}"
  loadbalancer_id     = "${azurerm_lb.publb.id}"
  name                = "http-probe"
  protocol            = "TCP"
  port                = 80
  interval_in_seconds = 5
  number_of_probes 	  = 2
  depends_on          = ["azurerm_lb.publb"]
}

# Create LB Rules
resource "azurerm_lb_rule" "publb-lbr" {
  resource_group_name            = "${var.rg_name}"
  loadbalancer_id                = "${azurerm_lb.publb.id}"
  name                           = "publb-lbr"
  protocol                       = "tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "publb-fe"
  backend_address_pool_id	       = "${azurerm_lb_backend_address_pool.publb-bp.id}"
  probe_id                       = "${azurerm_lb_probe.publb-probe.id}"
  #load_distribution			         = "Default"
  #enable_floating_ip             = "true"
  depends_on                     = ["azurerm_lb_backend_address_pool.publb-bp" , 
                                    "azurerm_lb_probe.publb-probe" ]
}
