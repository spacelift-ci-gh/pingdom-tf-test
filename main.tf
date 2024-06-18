terraform {
  required_providers {
    pingdom = {
      source  = "drfaust92/pingdom"
    }
  }
}

variable "pingdom_api_token" {}

provider "pingdom" {
  api_token         = var.pingdom_api_token
}

resource "pingdom_check" "example" {
  type        = "http"
  name        = "my http check"
  host        = "example.com"
  resolution  = 5
}
