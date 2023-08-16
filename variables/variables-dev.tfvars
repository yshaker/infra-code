

general = {
    tenant_id       = "1594fdae-a1d9-4405-915d-011467234338"
    subscription_id = "4fd92789-f635-4163-96ad-cfd3bad198b3"
    resource_group  = "EDH-Dev-RG"
    location        = "canadacentral"
    project         = "edh"
    environment     = "dev"
}

 

edh_storage = {
    tfstate_container   = "terraform-state"
    access_tier         = "Hot"
    account_kind        = "StorageV2"
    account_tier        = "Standard"
    account_replication_type = "LRS"
    min_tls_version          = "TLS1_2"
}

 

velero_network_rule = {
    bypass                     = [
        "AzureServices",
    ]
    default_action             = "Deny"
    ip_rules                   = []
    virtual_network_subnet_ids = [
        "/subscriptions/4fd92789-f635-4163-96ad-cfd3bad198b3/resourceGroups/Network-Dev-RG/providers/Microsoft.Network/virtualNetworks/DEV-CAC-VNET/subnets/DEV-CAC-RZ-AKS-EDH-DEV",
        "/subscriptions/4fd92789-f635-4163-96ad-cfd3bad198b3/resourceGroups/Network-Dev-RG/providers/Microsoft.Network/virtualNetworks/DEV-CAC-VNET/subnets/DEV-CAC-RZ-AKS-EDH-TEST"
    ]
}
endpoint = {
    network     = "DEV-CAC-VNET"
    subnet      = "DEV-CAC-RZ-APP01"
    network_rg  = "Network-Dev-RG"
}
 
backup_storage = {
    aks_subnet  = "/subscriptions/4fd92789-f635-4163-96ad-cfd3bad198b3/resourceGroups/Network-Dev-RG/providers/Microsoft.Network/virtualNetworks/DEV-CAC-VNET/subnets/DEV-CAC-RZ-AKS-EDH-DEV"
}