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

resource "azurerm_storage_account" "stor" {
  name = "bookstor"
  location = "West Europe"
  resource_group_name = azurerm_resource_group.rg.name
  account_tier = "Standard"
  account_replication = "LRS"
}

resource "azurerm_linux_virtual_machine" "vm" {
  name = "bookvm"
  location = "West Europe"
  resource_group_name = azure_resource_group.rg.name
  vm_size = "Standard_DS_v2"
  network_interface_ids = ["${azurerm_network_interface.nic.id}"]
  storage_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "16.04-LTS"
    version = "latest"
  }
}

