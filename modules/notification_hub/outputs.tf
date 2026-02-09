output "notification_hub_id" {
  description = "Notification Hub resource ID"
  value       = azurerm_notification_hub.notification_hub.id
}

output "notification_hub_name" {
  description = "Notification Hub name"
  value       = azurerm_notification_hub.notification_hub.name
}

output "namespace_id" {
  description = "Notification Hub Namespace resource ID"
  value       = azurerm_notification_hub_namespace.namespace.id
}

output "namespace_name" {
  description = "Notification Hub Namespace name"
  value       = azurerm_notification_hub_namespace.namespace.name
}
output "authorization_rule_id" {
  description = "Authorization rule ID"
  value       = azurerm_notification_hub_authorization_rule.rule.id
}

output "authorization_rule_name" {
  description = "Authorization rule name"
  value       = azurerm_notification_hub_authorization_rule.rule.name
}