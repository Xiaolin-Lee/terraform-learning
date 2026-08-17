terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "xiaolinterraformstate01"
    container_name       = "tfstate"
    key                  = "terraform-learning.tfstate"
  }
}