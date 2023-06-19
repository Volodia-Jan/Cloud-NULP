variable "namespace" {
  type = string
}

variable "environment" {
  type = string
}

variable "delimiter" {
  type = string
}

variable "instance_role_enabled" {
  type    = bool
  default = true
}

variable "slack_webhook_url" {
    type = string
}