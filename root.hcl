remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-app1-dev"
    storage_account_name = "stdevterrapractice12"
    container_name       = "blobcontainer"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
EOF
}

locals {
  location = "eastus"
  tags = {
    owner   = "platform"
    managed = "terragrunt"
  }
}