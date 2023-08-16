rovider "azurerm" {

    subscription_id = var.general.subscription_id

    tenant_id       = var.general.tenant_id

    skip_provider_registration = true

    features {}

}

 