resource "azurerm_key_vault" "this" {
  name                        = var.name  # Globally unique name for the Key Vault
  location                    = var.location  # Azure region
  resource_group_name         = var.resource_group_name  # RG in which KV is created
  tenant_id                   = var.tenant_id  # Azure AD tenant ID
  sku_name                    = var.sku_name  # SKU: standard or premium

  enable_rbac_authorization  = var.enable_rbac_authorization  # Use RBAC model for authorization

  enabled_for_deployment            = var.enabled_for_deployment
  enabled_for_disk_encryption       = var.enabled_for_disk_encryption
  enabled_for_template_deployment  = var.enabled_for_template_deployment

  purge_protection_enabled         = var.purge_protection_enabled
  soft_delete_retention_days       = var.soft_delete_retention_days
  public_network_access_enabled    = var.public_network_access_enabled

  dynamic "network_acls" {
    for_each = var.network_acls != null ? [1] : []
    content {
      bypass                     = var.network_acls.bypass
      default_action             = var.network_acls.default_action
      ip_rules                   = var.network_acls.ip_rules
      virtual_network_subnet_ids = var.network_acls.virtual_network_subnet_ids
    }
  }

  tags = var.tags
}