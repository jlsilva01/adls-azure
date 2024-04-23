resource "random_id" "storage_account_name_unique" {
  byte_length = 8
}

# Criar um Azure Data Lake Storage Gen2
resource "azurerm_storage_account" "storage" {
  name                     = "datalake${random_id.storage_account_name_unique.hex}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = true


  blob_properties {

    delete_retention_policy {
      days = 7
    }
    container_delete_retention_policy {
      days = 7
    }
  }
}

# Criar quatro containers dentro do Azure Data Lake Storage Gen2: Landing-zone, Bronze, Silver e Gold
resource "azurerm_storage_container" "landing-zone" {
  name                  = "landing-zone"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}


resource "azurerm_storage_container" "bronze" {
  name                  = "bronze"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "silver" {
  name                  = "silver"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "gold" {
  name                  = "gold"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}




