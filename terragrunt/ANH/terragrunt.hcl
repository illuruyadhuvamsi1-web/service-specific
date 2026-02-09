include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "../../modules/notification_hub"
}

inputs = {
  subscription_id     = get_env("TF_VAR_subscription_id", "")
  resource_group_name = get_env("TF_VAR_resource_group_name", "")

  namespace_name = get_env("TF_VAR_namespace_name", "")
  hub_name       = get_env("TF_VAR_hub_name", "")
  location       = get_env("TF_VAR_location", "")
  replication_region = "None"

  # SKU (from workflow dropdown)
  sku_name       = get_env("TF_VAR_sku_name", "Basic")
  namespace_type = "NotificationHub"

  # Authorization rule (choice inputs: "true"/"false")
  rule_name = get_env("TF_VAR_authorization_rule_name", "DefaultListenSend")
  listen    = tobool(get_env("TF_VAR_listen", "true"))
  send      = tobool(get_env("TF_VAR_send", "true"))
  manage    = tobool(get_env("TF_VAR_manage", "false"))

  tags = merge(include.root.locals.tags, { environment = "dev" })
}
