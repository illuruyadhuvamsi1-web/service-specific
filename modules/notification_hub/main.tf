resource "azurerm_notification_hub_namespace" "namespace" {
  name                = var.namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  namespace_type      = var.namespace_type
  sku_name            = var.sku_name
  zone_redundancy_enabled = var.zone_redundancy_enabled
  replication_region = var.replication_region
  tags                = var.tags
}

resource "azurerm_notification_hub" "notification_hub" {
  name                = var.hub_name
  namespace_name      = azurerm_notification_hub_namespace.namespace.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

resource "azurerm_notification_hub_authorization_rule" "rule" {
  name                  = var.rule_name
  notification_hub_name = azurerm_notification_hub.notification_hub.name
  namespace_name        = azurerm_notification_hub_namespace.namespace.name
  resource_group_name   = var.resource_group_name

  listen = var.listen
  send   = var.send
  manage = var.manage
}