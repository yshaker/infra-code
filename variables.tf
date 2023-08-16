variable general {

    type = object({

        tenant_id       = string

        subscription_id = string

        resource_group  = string

        location        = string

        project         = string

        environment     = string

    })

}

 

variable tags {

    type = object({

        group   = string

        project = string

        sap-fc  = string

        rc      = string

    })

    default = {

        "group"   = "CDOS"

        "project" = "Enterprise Data Hub"

        "sap-fc"  = "270014-ISS0701-B120-65008720-27-96145-01-00-00-00-A01"

        "rc"      = "77J00-527-232-4808-96145-6"

  }

}

 

variable "private_dns_zone" {

    type = object({

        subscription_id = string

        resource_group  = string

        blob_name       = string

        file_name       = string

        queue_name      = string

        table_name      = string

    })

    default = {

        subscription_id = "0d47baca-2ef1-481d-a229-0884393e67cf"

        resource_group  = "Network-PrivateLinkDns-RG"

        blob_name       = "privatelink.blob.core.windows.net"

        file_name       = "privatelink.file.core.windows.net"

        queue_name      = "privatelink.queue.core.windows.net"

        table_name      = "privatelink.table.core.windows.net"

    }

}

 

variable "endpoint" {

    type = object({

        network     = string

        subnet      = string

        network_rg  = string

    })

}

 

variable edh_storage {

    type = object({

        tfstate_container   = string

        access_tier         = string

        account_kind        = string

        account_tier        = string

        account_replication_type = string

        min_tls_version          = string

    })

}

 

variable backup_storage {

    type = object({

        aks_subnet  = string

    })

}

 

variable velero_network_rule {

    type = object({

        bypass                     = list(string)

        default_action             = string

        ip_rules                   = list(string)

        virtual_network_subnet_ids = list(string)

    })

    default = {

      bypass = null

      default_action = "Allow"

      ip_rules = null

      virtual_network_subnet_ids = null

    }

}

 

variable velero_storage {

    type = object({

        container_delete_retention_policy_days = number

        delete_retention_policy_days           = number

    })

    default = { 

        container_delete_retention_policy_days = 7

        delete_retention_policy_days = 7

 

    }

}

 

variable queue_properties {

    type = object({

        hour_metrics = object({

            enabled                 = bool

            include_apis            = bool

            retention_policy_days   = number

            version                 = string

        })

        logging = object({

            delete                = bool

            read                  = bool

            retention_policy_days = number

            version               = string

            write                 = bool

        })

        minute_metrics = object({

            enabled               = bool

            include_apis          = bool

            retention_policy_days = number

            version               = string

        })

    })

    default = {

        hour_metrics = {

            enabled               = true

            include_apis          = true

            retention_policy_days = 30

            version               = "1.0"

        }

 

        logging = {

            delete                = false

            read                  = false

            retention_policy_days = 30

            version               = "1.0"

            write                 = false

        }

 

        minute_metrics = {

            enabled               = false

            include_apis          = false

            retention_policy_days = 30

            version               = "1.0"

        }

    }

}

 

variable ip_rules {

    type = list

    default = [

        "198.103.161.0/24",

        "198.103.183.0/24",

        "205.193.112.0/24",

        "205.193.114.0/24",

        "205.194.26.0/26",

    ]

}