terraform {
  required_providers {
    pingdom = {
      source  = "drfaust92/pingdom"
    }
  }
}

variable "pingdom_api_token" {}

variable "secret_cookie" {
    type = string
    default = "test=cookie2"
    sensitive = true
}


provider "pingdom" {
  api_token         = var.pingdom_api_token
}

resource "pingdom_check" "example" {
  type        = "http"
  name        = "my http check"
  host        = "example.com"
  resolution  = 5
  requestheaders = {
        "User-Agent" = "Pingdom.com_bot_version_1.4_(http://www.pingdom.com/)"
        "Cookie"     = var.secret_cookie
    }
}
