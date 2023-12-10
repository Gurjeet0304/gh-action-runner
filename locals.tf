locals {
    region = {
        aue ={
            name = "australiaeast"
            short_name = "aue"
            #service = "aks"
            environment = "shr"
            purpose = "lab"
        }
    }
    base_name = lower(join("-", compact([
        var.service,
        local.deployment_region.environment,
       # var.environment,
        local.deployment_region.short_name

    ])))

    deployment_region = local.region[var.region]


    cidr = {
        aks = 0
        node = 1
        pe = 2
        appgw = 3
    }
}

