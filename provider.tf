terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.3.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}