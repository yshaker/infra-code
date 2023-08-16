resource "azurerm_storage_account" "general-storage" {

    access_tier              = var.edh_storage.access_tier
    account_kind             = var.edh_storage.account_kind
    account_tier             = var.edh_storage.account_tier
    account_replication_type = var.edh_storage.account_replication_type
    min_tls_version          = var.edh_storage.min_tls_version

    infrastructure_encryption_enabled = false
    is_hns_enabled                    = false

    name                              = "stedhgeneral${var.general.environment}"
    resource_group_name               = var.general.resource_group
    location                          = var.general.location
    allow_nested_items_to_be_public   = false
    nfsv3_enabled                     = false
    queue_encryption_key_type         = "Service"
    shared_access_key_enabled         = true
    table_encryption_key_type         = "Service"

    tags                            = var.tags

    blob_properties {
        change_feed_enabled      = false
        last_access_time_enabled = false
        versioning_enabled       = false
        container_delete_retention_policy {
            days = 7
        }

        delete_retention_policy {
            days = 7
        }
    }
 
    queue_properties {
        hour_metrics {
            enabled               = var.queue_properties.hour_metrics.enabled
            include_apis          = var.queue_properties.hour_metrics.include_apis
            retention_policy_days = var.queue_properties.hour_metrics.retention_policy_days
            version               = var.queue_properties.hour_metrics.version
        }

        logging {
            delete                = var.queue_properties.logging.delete
            read                  = var.queue_properties.logging.read
            retention_policy_days = var.queue_properties.logging.retention_policy_days
            version               = var.queue_properties.logging.version
            write                 = var.queue_properties.logging.write
        }

        minute_metrics {
            enabled               = var.queue_properties.minute_metrics.enabled
            include_apis          = var.queue_properties.minute_metrics.include_apis
            retention_policy_days = var.queue_properties.minute_metrics.retention_policy_days
            version               = var.queue_properties.minute_metrics.version
        }
    }


    share_properties {

 

        retention_policy {

            days = 7

        }

    }

 

    timeouts {}

 

    lifecycle {

        ignore_changes = [

            tags,

      ]

    }   

}