Any piece of Terraform code is composed of the same syntax model, and the syntax
of a Terraform object consists of four parts:
� A type of resource or data block
� A name of the resource to be managed (for example, azurerm_resource_
group)
� An internal Terraform ID (for example, rg)
� A list of properties that correspond to the real properties of the resource (that is,
name and location)
