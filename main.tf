resource "azurerm_resource_group" "rg"{
	name = "bookRg"
	location = "West Europe"
	tags {
		environment = "Terraform Azure"
	}
}

resource "azurerm_virtual_network" "vnet"{
  name = "book-vnet"
  location = "West Europe"
  address_space = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_subnet" "subnet" {
  name = "book-subnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = azurerm_resource_group.rg.name
  address_prefix = "10.0.10.0/24"
}

resource "azurerm_network_interface" "nic" {
  name = "book-nic"
  location = "West Europe"
  resource_groupe_name = azurerm_resourde_group.rg.name
  ip_configuration {
    name = "bookipconfig"
    subnet_id = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}

resource "azurerm_public_ip" "pip" {
  name = "book-ip"
  location = "West Europe"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  public_ip_address_allocation = "Dynamic"
  domain_name_label = "bookdevops"
} 











