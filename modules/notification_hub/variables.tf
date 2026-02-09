variable "namespace_name" {
  description = "Notification Hub Namespace name"
  type        = string
}
variable "hub_name" {
  description = "Notification Hub name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "sku_name" {
  description = "Notification Hub SKU (Free or Standard)"
  type        = string
  default     = "Free"

  validation {
    condition     = contains(["Free", "Basic","Standard"], var.sku_name)
    error_message = "sku_name must be Free , Basic or Standard"
  }
}

variable "namespace_type" {
  description = "Notification Hub Namespace type (Messaging)"
  type        = string
  default     = "NotificationHub"
}

variable "zone_redundancy_enabled" {
  description = "Enable zone redundancy for high availability. Requires Standard SKU. Spread resources across availability zones."
  type        = bool
  default     = true
}

variable "replication_region" {
  description = "The Azure region to replicate the namespace to. Requires Standard SKU."
  type        = string
  default     = ""
}

variable "subscription_id" {
  description = "Azure Subscription ID for provider"
  type        = string
}
variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "rule_name" {
  description = "Authorization rule name"
  type        = string
}

variable "listen" {
  description = "Allow listen permission"
  type        = bool
  default     = false
}

variable "send" {
  description = "Allow send permission"
  type        = bool
  default     = false
}

variable "manage" {
  description = "Allow manage permission"
  type        = bool
  default     = false
}