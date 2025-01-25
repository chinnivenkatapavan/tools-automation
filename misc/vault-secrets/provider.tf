provider "azurerm" {
  features {}
  subscription_id = "b3406e49-0e16-456d-a3bb-c324f1dfb0d5"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "project-setup-1"
    storage_account_name = "d82tfstate"
    container_name       = "vault-tf"
    key                  = "dev.tfstate"
  }
}

provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables described above, so that each user can have
  # separate credentials set in the environment.
  #
  # This will default to using $VAULT_ADDR
  # But can be set explicitly
  address = "http://vault-internal.azdevops2704.online:8200"
  token   = var.token
}