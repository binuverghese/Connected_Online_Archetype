# Subnet 1
module "subnet1" {
  source = "Azure/avm-res-network-virtualnetwork/azurerm//modules/subnet"

  virtual_network = {
    resource_id = module.vnet1.resource_id
  }

  address_prefixes = var.subnet1_address_prefixes
  name             = var.subnet1_name
}

# Subnet 2
module "subnet2" {
  source = "Azure/avm-res-network-virtualnetwork/azurerm//modules/subnet"

  virtual_network = {
    resource_id = module.vnet1.resource_id
  }

  address_prefixes = var.subnet2_address_prefixes
  name             = var.subnet2_name
}

# Output Subnet IDs
output "subnet1_id" {
  value = module.subnet1.resource_id
}

output "subnet2_id" {
  value = module.subnet2.resource_id
}

# Associate Route Table (UDR) with Subnet 1
resource "azurerm_subnet_route_table_association" "subnet1_rt" {
  subnet_id      = module.subnet1.resource_id
  route_table_id = azurerm_route_table.this.id
}

# Associate Route Table (UDR) with Subnet 2
resource "azurerm_subnet_route_table_association" "subnet2_rt" {
  subnet_id      = module.subnet2.resource_id
  route_table_id = azurerm_route_table.this.id
}

# Associate NSG with Subnet 1
resource "azurerm_subnet_network_security_group_association" "subnet1_nsg" {
  subnet_id                 = module.subnet1.resource_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Associate NSG with Subnet 2
resource "azurerm_subnet_network_security_group_association" "subnet2_nsg" {
  subnet_id                 = module.subnet2.resource_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
