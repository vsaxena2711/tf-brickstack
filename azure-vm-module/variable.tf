variable "rg_name" {}
variable "location" {}
variable "vnet_name" {}
variable "vnet_address_space" {
  type = list(string)
}
variable "subnet_name" {}
variable "subnet_prefixes" {
  type = list(string)
}
variable "vm_name" {}
variable "vm_size" {}
variable "admin_username" {}
variable "admin_password" {
  sensitive = true
}
