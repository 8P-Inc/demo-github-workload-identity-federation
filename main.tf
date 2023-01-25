terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.40.0"
    }
  }
}

provider "azurerm" {
  use_oidc           = true
  tenant_id          = "0128770c-3c63-4111-b09b-07596d021187"
  subscription_id    = "2df16f98-af9d-424a-b3b5-999bc70c0a92"
  client_id          = var.client_id
  oidc_request_token = var.oidc_request_token
  oidc_request_url   = var.oidc_request_url
}

variable "client_id" {
  description = "Client ID of the service principal"
  type        = string
}

variable "oidc_request_token" {
  description = "Client ID of the service principal"
  type        = string
}

variable "oidc_request_url" {
  description = "Client ID of the service principal"
  type        = string
}

resource "azurerm_user_assigned_identity" "test" {
  location            = "southeastasia"
  name                = "id-test-az-asse-dev-001"
  resource_group_name = "rg-demogithubfed-az-asse-dev-001"
}
