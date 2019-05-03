# Configure the Azure Provider
provider "azurerm" {
  version = "=1.27.1"
}

# Create a Resource Group
resource "azurerm_resource_group" "demo_step4_rg" {
  name     = "demo_step4_rg"
  location = "West Europe"

  tags {
    environment = "production"
  }
}

# Create a vNET inside the Resource Group
resource "azurerm_virtual_network" "demo_step5_vnet" {
  name="demo_step5_vnet"
  location="${azurerm_resource_group.demo_step4_rg.location}"
  resource_group_name="${azurerm_resource_group.demo_step4_rg.name}"

  address_space=["10.0.0.0/16"]

  tags {
    environment = "production"
  }
}

resource "azurerm_subnet" "demo_step5_subnet" {
  name="demo_step5_subnet"
  resource_group_name="${azurerm_resource_group.demo_step4_rg.name}"

  # This subnet belong to the vNET previously created, let's use interpolation to create the link:
  virtual_network_name="${azurerm_virtual_network.demo_step5_vnet.name}"

  # Calculate the subnet CIDR from the existing vNET, using interpolation to retrieve the vNET address space:
  address_prefix="${cidrsubnet(azurerm_virtual_network.demo_step5_vnet.address_space[0], 8, 1)}"
}

