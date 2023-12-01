# resource "azurerm_role_definition" "rg-lock" {
#   #provider = azurerm.prod
#   #for_each = { for k, v in data.azurerm_subscription.this : k => v if contains(["PRD"], k) }

#   name        = "Lock Administrator"
#   scope       = "0303f8c5-2ea3-4d68-9ec8-f53794874ccd" #data.azurerm_subscription.this.id
#   description = ""

# #   permissions {
# #     actions     = [
# #                 # "Microsoft.Authorization/locks/read",
# #                 # "Microsoft.Authorization/locks/write",
# #                 # "Microsoft.Authorization/locks/delete"
# #     ]
# #     not_actions = []
# #   }

# #   assignable_scopes = [
# #     "/subscriptions/0303f8c5-2ea3-4d68-9ec8-f53794874ccd", # /subscriptions/00000000-0000-0000-0000-000000000000
# #   ]
# }