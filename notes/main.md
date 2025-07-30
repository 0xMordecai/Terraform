Any piece of Terraform code is composed of the same syntax model, and the syntax
of a Terraform object consists of four parts:
� A type of resource or data block
� A name of the resource to be managed (for example, azurerm_resource_
group)
� An internal Terraform ID (for example, rg)
� A list of properties that correspond to the real properties of the resource (that is,
name and location)

-> Virtual network and it's subnet configuration
-------------------------------------------------
In this Terraform code for the network part, we create the code for a VNet, book-vnet,
and in it, we create a subnet called book-subnet.
If we look at this code carefully, we can see that, for the dependencies between the
resources, we do not put in clear IDs, but we use pointers on the Terraform resources.
The VNet and subnet are the property of the resource group with $ {azurerm_resource_group.rg.name}, which tells Terraform that the VNet and subnet will be
created just after the resource group. As for the subnet, it is dependent on its VNet with
the use of the $ {azurerm_virtual_network.vnet.name} value; it's the explicit
dependence concept.
