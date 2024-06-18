terraform {
  required_providers {
    pingdom = {
      source  = "drfaust92/pingdom"
    }
  }
}

variable "pingdom_api_token" {}
variable "solarwinds_user" {}
variable "solarwinds_passwd" {}

provider "pingdom" {
  api_token         = var.pingdom_api_token
  solarwinds_user   = var.solarwinds_user
  solarwinds_passwd = var.solarwinds_passwd
}

resource "pingdom_check" "example" {
  type        = "http"
  name        = "my http check"
  host        = "example.com"
  resolution  = 5
}
