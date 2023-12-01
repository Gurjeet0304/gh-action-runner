terraform {
  backend "local" {
    path = "C:/temp/gh-terraform.tfstate"
    #use_azuread_auth     = true

  }
}