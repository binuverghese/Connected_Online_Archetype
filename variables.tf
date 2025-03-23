variable "location" {
  type        = string
  description = "Azure region where resources will be deployed"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "route_table_name" {
  type        = string
  description = "Name of the route table"
}

variable "nsg_name" {
  type        = string
  description = "Name of the network security group"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "address_space_vnet1" {
  type        = list(string)
  description = "Address space for the virtual network"
}

variable "dns_servers" {
  type        = list(string)
  description = "List of DNS servers"
}

variable "enable_vm_protection" {
  type        = bool
  description = "Enable VM protection"
}

variable "encryption" {
  type        = bool
  description = "Enable encryption"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Subnet address prefixes"
}

variable "subnet1_name" {
  type        = string
  description = "Name of the first subnet"
  default     = "subnet-1"
}

variable "subnet1_address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the first subnet"
  default     = ["10.0.1.0/24"]
}

variable "subnet2_name" {
  type        = string
  description = "Name of the second subnet"
  default     = "subnet-2"
}

variable "subnet2_address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the second subnet"
  default     = ["10.0.2.0/24"]
}

variable "routes" {
  type = list(object({
    name           = string
    address_prefix = string
    next_hop_ip    = string
  }))
  description = "List of routes for the route table"
}
